/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* SerializableGeeTreeModel.vala
 *
 * Copyright (C) 2013-2015  Daniel Espinosa <esodan@gmail.com>
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
using GXml;
using Gee;

/**
 * Serializable Framework. A {@link Serializable} objects container based on Gee interfaces with dual key.
 * 
 * It implements {@link Serializable} and {@link SerializableCollection} interfaces, it is iterable as
 * other Gee collections.
 */
public class GXml.SerializableDualKeyMap<P,S,V> : Object, Gee.Traversable <V>, Serializable, SerializableCollection
{
  protected Gee.HashMultiMap<P,HashMap<S,V>> storage;
  GXml.Node _node;

  // SerializableCollection interface
  public virtual bool deserialized () { return true; }
  public virtual bool is_prepared () { return (_node is GXml.Node); }
  public virtual bool deserialize_node (GXml.Node node) { return deserialize_property (node); }
  public virtual bool deserialize_children (GXml.Node node) { return deserialize (node); }

	construct { Init.init (); }

  public Type value_type
  {
    get {
      init ();
      return typeof (V);
    }
  }
  public Type primary_key_type
  {
    get {
      init ();
      return typeof (P);
    }
  }
  public Type secondary_key_type
  {
    get {
      init ();
      return typeof (S);
    }
  }
  public Gee.Collection<P> primary_keys
  {
    owned get {
      init ();
      return storage.get_keys ();
    }
  }
  public Gee.Collection<S> secondary_keys (P key)
  {
    init ();
    var hs = storage.get (key);
    var s = new HashSet<S> ();
    foreach (HashMap<S,V> hm in hs) {
      s.add_all (hm.keys);
    }
    return s;
  }
  public Gee.Collection<V> values_for_key (P primary_key)
  {
    init ();
    var hs = storage.get (primary_key);
    var s = new HashSet<V> ();
    foreach (HashMap<S,V> hm in hs) {
      s.add_all (hm.values);
    }
    return s;
  }
  public Gee.Collection<V> values ()
  {
    init ();
    var s = new Gee.HashSet<V> ();
    foreach (HashMap<S,V> h in storage.get_values ()) {
      s.add_all (h.values);
    }
    return s;
  }
  public new void @set (P primary_key, S secundary_key, V val)
  {
    init ();
    var h = new HashMap<S,V> ();
    h.@set (secundary_key, val);
    storage.@set (primary_key, h);
  }
  public new V? @get (P primary_key, S secondary_key)
  {
    init ();
    var hs = storage.@get (primary_key);
    foreach (HashMap<S,V> h in hs) {
      if (h.has_key (secondary_key))
        return h.@get (secondary_key);
    }
    return null;
  }
  public int size { get { return storage.size; } }
  private void init ()
  {
    if (storage == null)
      storage = new Gee.HashMultiMap<P,HashMap<S,V>> ();
  }
  // Serializable Interface
  Gee.HashMap<string,GXml.Attribute> _unknown_serializable_property = new Gee.HashMap<string,GXml.Attribute> ();
  Gee.ArrayList<GXml.Node> _unknown_serializable_nodes = new Gee.ArrayList<GXml.Node> ();
  public Gee.Map<string,GXml.Attribute> unknown_serializable_properties
  {
    owned get {
      return (Gee.Map<string,GXml.Attribute>) _unknown_serializable_property.ref ();
    }
  }
  public Gee.Collection<GXml.Node> unknown_serializable_nodes
  {
    owned get {
      return (Gee.Collection<GXml.Node>) _unknown_serializable_nodes.ref ();
    }
  }
  protected ParamSpec[] properties { get; set; }
  public GLib.HashTable<string,GLib.ParamSpec> ignored_serializable_properties { get; protected set; }
  public string? serialized_xml_node_value { owned get; protected set; default=null; }
  public virtual bool set_default_namespace (GXml.Node node) { return true; }

  public virtual bool get_enable_unknown_serializable_property () { return false; }
  public virtual bool serialize_use_xml_node_value () { return false; }
  public virtual bool property_use_nick () { return false; }

  public virtual string node_name ()
  {
    return ((Serializable) Object.new (value_type)).node_name ();
  }

  public virtual GLib.ParamSpec? find_property_spec (string property_name)
  {
    return default_find_property_spec (property_name);
  }

  public virtual GLib.ParamSpec[] list_serializable_properties ()
  {
    return default_list_serializable_properties ();
  }

  public virtual GXml.Node? serialize (GXml.Node node)
                              throws GLib.Error
                              requires (node is GXml.Element)
  {
    return default_serialize (node);
  }
  public GXml.Node? default_serialize (GXml.Node node)
                              throws GLib.Error
                              requires (node is GXml.Element)
  {
    foreach (V v in values ()) {
        if (v is Serializable)
          ((GXml.Serializable) v).serialize (node);;
    }
    return node;
  }
  public virtual GXml.Node? serialize_property (GXml.Node element,
                                        GLib.ParamSpec prop)
                                        throws GLib.Error
  {
    return default_serialize_property (element, prop);
  }
  public GXml.Node? default_serialize_property (GXml.Node element,
                                        GLib.ParamSpec prop)
                                        throws GLib.Error
  {
    return element;
  }
  public virtual bool deserialize (GXml.Node node)
                                    throws GLib.Error
                                    requires (node_name () != null)
  {
    return default_deserialize (node);
  }
  public bool default_deserialize (GXml.Node node)
                    throws GLib.Error
                    requires (node is Element)
  {
#if DEBUG
            GLib.message (@"Deserializing DualKeyMap on Element: $(node.name)");
#endif
    if (!(value_type.is_a (typeof (GXml.Serializable)) &&
        value_type.is_a (typeof (SerializableMapDualKey)))) {
      throw new SerializableError.UNSUPPORTED_TYPE_ERROR (_("%s: Value type '%s' is unsupported"), 
                                                    this.get_type ().name (), value_type.name ());
    }
    foreach (GXml.Node n in node.childs) {
      if (n is Element) {
        var obj = (SerializableMapDualKey<P,S>) Object.new (value_type);
#if DEBUG
            GLib.message (@"Creating a new Object to add: '$(((Serializable)obj).node_name ())' from Node: '$(node.name)'");
#endif
        if (n.name.down () == ((Serializable) obj).node_name ().down ()) {
          ((Serializable) obj).deserialize (n);
#if DEBUG
            GLib.message (@"SerializableDualKeyMap: Setting object: '$(((Serializable)obj).node_name ())' from Node: '$(node.name)'");
#endif
          @set (obj.get_map_primary_key (), obj.get_map_secondary_key (), obj);
#if DEBUG
            GLib.message (@"SerializableDualKeyMap: Size = '$(this.size)'");
#endif
        }
      }
    }
    return true;
  }
  public virtual bool deserialize_property (GXml.Node property_node)
                                            throws GLib.Error
  {
    return default_deserialize_property (property_node);
  }
  public bool default_deserialize_property (GXml.Node property_node)
                                            throws GLib.Error
  {
    return true;
  }
  // Traversable
  public new bool @foreach (Gee.ForallFunc<V> f) {
    return values ().@foreach (f);
  }
}

