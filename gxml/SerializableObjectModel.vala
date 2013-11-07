/* -*- Mode: vala; indent-tabs-mode: t; c-basic-offset: 8; tab-width: 8 -*- */
/* ObjectModel.vala
 *
 * Copyright (C) 2013  Daniel Espinosa <esodan@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Authors:
 *      Daniel Espinosa <esodan@gmail.com>
 */

public abstract class GXml.SerializableObjectModel : Object, Serializable
{
	/* Serializable interface properties */
	protected ParamSpec[] properties { get; set; }
	public GLib.HashTable<string,GLib.ParamSpec> ignored_serializable_properties { get; protected set; }
	public bool serializable_property_use_nick { get; set; }
	public string? serialized_xml_node_value { get; protected set; default=null; }
	public GLib.HashTable<string,GXml.Node> unknown_serializable_property { get; protected set; }


	public virtual string serializable_node_name ()
	{
		return default_serializable_node_name ();
	}
	public string default_serializable_node_name ()
	{
		return get_type().name().down();
	}

	public SerializableObjectModel ()
	{
		serializable_property_use_nick = false;
		serialized_xml_node_value = null;
	}

	public virtual GLib.ParamSpec? find_property_spec (string property_name)
	{
		return default_find_property_spec (property_name);
	}

	public virtual void init_properties ()
	{
		default_init_properties ();
	}

	public virtual GLib.ParamSpec[] list_serializable_properties ()
	{
		return default_list_serializable_properties ();
	}

	public virtual void get_property_value (GLib.ParamSpec spec, ref Value val)
	{
		default_get_property_value (spec, ref val);
	}

	public virtual void set_property_value (GLib.ParamSpec spec, GLib.Value val)
	{
		default_set_property_value (spec, val);
	}

	public virtual bool transform_from_string (string str, ref GLib.Value dest)
	{
		return false;
	}

	public virtual bool transform_to_string (GLib.Value val, ref string str)
	{
		return false;
	}

	public virtual Node? serialize (Node node)
	                     throws GLib.Error
	                     requires (serializable_node_name () != null)
	                     requires (node is Document || node is Element)
	{
		return default_serialize (node);
	}

	public Node? default_serialize (Node node) throws GLib.Error
	{
		Document doc;
		if (node is Document)
			doc = (Document) node;
		else
			doc = node.owner_document;
		var element = doc.create_element (serializable_node_name ());
		foreach (ParamSpec spec in list_serializable_properties ()) {
			serialize_property (element, spec);
		}
		foreach (Node n in unknown_serializable_property.get_values ()) {
			if (n is Element) {
				var e = (Node) doc.create_element (n.node_name);
				n.copy (ref e, true);
				element.append_child (e);
			}
			if (n is Attr) {
				element.set_attribute (n.node_name, n.node_value);
				var a = (Node) element.get_attribute_node (n.node_name);
				n.copy (ref a);
			}
		}
				// Setting element content
		if (serialized_xml_node_value != null) {
			var t = doc.create_text_node (serialized_xml_node_value);
			element.append_child (t);
		}

		node.append_child (element);
		return element;
	}

	public virtual GXml.Node? serialize_property (Element element,
	                                      GLib.ParamSpec prop)
	                                      throws GLib.Error
	{
		return default_serialize_property (element, prop);
	}
	public GXml.Node? default_serialize_property (Element element,
	                                      GLib.ParamSpec prop)
	                                      throws GLib.Error
	{
		if (prop.value_type.is_a (typeof (Serializable))) 
		{
			var v = Value (typeof (Object));
			get_property (prop.name, ref v);
			var obj = (Serializable) v.get_object ();
			if (obj != null)
				return obj.serialize (element);
		}
		Value oval = Value (prop.value_type);
		get_property (prop.name, ref oval);
		string val = "";
		if (!transform_to_string (oval, ref val)) {
			if (Value.type_transformable (prop.value_type, typeof (string)))
			{
				Value rval = Value (typeof (string));
				oval.transform (ref rval);
				val = rval.dup_string ();
			}
			else {
				Node node = null;
				this.serialize_unknown_property (element, prop, out node);
				return node;
			}
		}
		string attr_name;
		if (serializable_property_use_nick &&
		    prop.get_nick () != null &&
		    prop.get_nick () != "")
			attr_name = prop.get_nick ();
		else
			attr_name = prop.get_name ();
		var attr = element.get_attribute_node (attr_name);
		if (attr == null) {
			if (val != null)
				element.set_attribute (attr_name, val);
		}
		else
			attr.value = val;
		return (Node) attr;
	}

	public virtual Node? deserialize (Node node)
	                                  throws GLib.Error
	                                  requires (serializable_node_name () != null)
	{
		return default_deserialize (node);
	}
	public Node? default_deserialize (Node node)
	                                  throws GLib.Error
	{
		Document doc;
		if (node is Document) {
			doc = (Document) node;
			return_val_if_fail (doc.document_element != null, null);
		}
		else
			doc = node.owner_document;
		Element element;
		if (node is Element)
			element = (Element) node;
		else
			element = (Element) doc.document_element;
		return_val_if_fail (element != null, null);
		if (serializable_node_name () == null) {
			message (@"WARNING: Object type '$(get_type ().name ())' have no Node Name defined");
			assert_not_reached ();
		}
		if (element.node_name.down () != serializable_node_name ().down ()) {
			message (@"WARNING: wrong node name is '$(element.node_name.down ())' is different to '$(serializable_node_name ().down ())'");
		}
		foreach (Attr attr in element.attributes.get_values ())
		{
			deserialize_property (attr);
		}
		
		if (element.has_child_nodes ())
		{
			foreach (Node n in element.child_nodes)
			{
				if (n is Text)
					serialized_xml_node_value = n.node_value;
				else
					deserialize_property (n);
			}
		}
		return null;
	}

	public virtual bool deserialize_property (GXml.Node property_node)
	                                          throws GLib.Error
	{
		return default_deserialize_property (property_node);
	}
	public bool default_deserialize_property (GXml.Node property_node)
	                                          throws GLib.Error
	{
		bool ret = false;
		var prop = find_property_spec (property_node.node_name);
		if (prop == null) {
			// FIXME: Event emit
			if (!(property_node is Text))
				unknown_serializable_property.set (property_node.node_name, property_node);
			return true;
		}
		if (prop.value_type.is_a (typeof (Serializable)))
		{
			Value vobj = Value (typeof(Object));
			get_property (prop.name, ref vobj);
			if (vobj.get_object () == null) {
				var obj = Object.new  (prop.value_type);
				((Serializable) obj).deserialize (property_node);
				set_property (prop.name, obj);
			}
			else
				((Serializable) vobj.get_object ()).deserialize (property_node);
			return true;
		}
		else {
			Value val = Value (prop.value_type);
			if (property_node is GXml.Attr)
			{
				if (!transform_from_string (property_node.node_value, ref val)) {
					Value ptmp = Value (typeof (string));
					ptmp.set_string (property_node.node_value);
					if (Value.type_transformable (typeof (string), prop.value_type))
						ret = ptmp.transform (ref val);
					else
						ret = string_to_gvalue (property_node.node_value, ref val);
				}
				set_property (prop.name, val);
				return ret;
			}
		}
		// Attribute can't be deseralized with standard methods. Up to the implementor.
		this.deserialize_unknown_property (property_node, prop);
		return true;
	}
	public abstract string to_string ();

	public static bool equals (SerializableObjectModel a, SerializableObjectModel b)
	{
		if (b.get_type () == a.get_type ()) {
			var alp = ((Serializable)a).list_serializable_properties ();
			bool ret = true;
			foreach (ParamSpec p in alp) {
				var bp = ((Serializable)b).find_property_spec (p.name);
				if (bp != null) {
					Value apval = Value (p.value_type);
					((Serializable)a).get_property_value (p, ref apval);
					Value bpval = Value (bp.value_type);;
					((Serializable)b).get_property_value (bp, ref bpval);
					if ( apval != bpval)
						ret = false;
				}
			}
			return ret;
		}
		return false;
	}
}
