/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/*
 *
 * Copyright (C) 2016  Daniel Espinosa <esodan@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

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
 * A GXml Object Model (GOM) implementation of {@link GomElement}.It can be used
 * transparently as {@link DomElement} in a XML tree.
 */
public class GXml.GomElement : GomNode,
                              DomNode,
                              DomChildNode,
                              DomNonDocumentTypeChildNode,
                              DomParentNode,
                              DomElement,
                              GomObject {
  // DomNode overrides
  public new string? lookup_prefix (string? nspace) {
    if (namespace_uri == nspace && this.prefix != null)
      return this.prefix;
    foreach (DomNode a in attributes.values) {
      if ((a as DomAttr).prefix == null) continue;
      if ((a as DomAttr).prefix.down () == "xmlns" && a.node_value == nspace)
        return (a as DomAttr).local_name;
    }
    if (parent_node == null) return null;
    return parent_node.lookup_prefix (nspace);
  }
  public new string? lookup_namespace_uri (string? prefix) {
    if (namespace_uri != null && this.prefix == prefix)
      return namespace_uri;
    string s = "";
    if (prefix != null) s = prefix;
    foreach (DomNode a in attributes.values) {
      if ((a as DomAttr).namespace_uri == "http://www.w3.org/2000/xmlns/")
        if ((a as DomAttr).prefix != null)
          if ((a as DomAttr).prefix.down () == "xmlns"
              && (a as DomAttr).local_name == s)
            if (a.node_value == "")
              return null;
            else
              return a.node_value;
      if ((a as DomAttr).prefix == null
          && s == ""
          && (a as DomAttr).local_name == "xmlns"
          && (a as DomAttr).namespace_uri == "http://www.w3.org/2000/xmlns/")
          if (a.node_value == "")
            return null;
          else
            return a.node_value;
    }
    if (parent_node == null) return null;
    return parent_node.lookup_namespace_uri (prefix);
  }

  // DomChildNode
  public void remove () {
    if (parent_node != null) {
      var i = parent_node.child_nodes.index_of (this);
      parent_node.child_nodes.remove_at (i);
    }
  }
  // DomNonDocumentTypeChildNode
  public DomElement? previous_element_sibling {
    get {
      if (parent_node != null) {
        var i = parent_node.child_nodes.index_of (this);
        if (i == 0) return null;
        var n = parent_node.child_nodes.item (i - 1);
        if (n is DomElement) return (DomElement) n;
        return null;
      }
      return null;
    }
  }
  public DomElement? next_element_sibling {
    get {
      if (parent_node != null) {
        var i = parent_node.child_nodes.index_of (this);
        if (i == parent_node.child_nodes.length - 1) return null;
        var n = parent_node.child_nodes.item (i + 1);
        if (n is DomElement) return (DomElement) n;
        return null;
      }
      return null;
    }
  }

  // DomParentNode
  public new DomHTMLCollection children {
    owned get {
      var l = new DomElementList ();
      foreach (GXml.DomNode n in child_nodes) {
        if (n is DomElement) l.add ((DomElement) n);
      }
      return l;
    }
  }
  public DomElement? first_element_child { owned get { return (DomElement) children.first (); } }
  public DomElement? last_element_child { owned get { return (DomElement) children.last (); } }
  public ulong child_element_count { get { return (ulong) children.size; } }

  public DomElement? query_selector (string selectors) throws GLib.Error {
  // FIXME:
    throw new DomError.SYNTAX_ERROR (_("DomElement query_selector is not implemented"));
  }
  public DomNodeList query_selector_all (string selectors) throws GLib.Error {
  // FIXME:
    throw new DomError.SYNTAX_ERROR (_("DomElement query_selector_all is not implemented"));
  }
  // GXml.DomElement
  protected string _namespace_uri = null;
  public string? namespace_uri { owned get { return _namespace_uri.dup (); } }
  public string? prefix { owned get { return _prefix; } }
  /**
   * Derived classes should define this value at construction time.
   */
  public string local_name {
    owned get {
      return _local_name;
    }
  }

  public string tag_name { owned get { return _local_name; } }

  public string? id {
    owned get { return (this as GomElement).get_attribute ("id"); }
    set { (this as GomObject).set_attribute ("id", value); }
  }
  public string? class_name {
    owned get { return (this as GomElement).get_attribute ("class"); }
    set { (this as GomObject).set_attribute ("class", value); }
  }
  public DomTokenList class_list {
    owned get {
      return new GDomTokenList (this, "class");
    }
  }


  construct {
    _node_type = DomNode.NodeType.ELEMENT_NODE;
    _attributes = new Attributes (this);
  }

  public GomElement (DomDocument doc, string local_name) {
    _document = doc;
    _local_name = local_name;
  }
  public GomElement.namespace (DomDocument doc, string namespace, string prefix, string local_name) {
    _document = doc;
    _local_name = local_name;
    _namespace_uri = namespace;
    _prefix = prefix;
  }
  /**
   * Holds attributes in current node, using attribute's name as key
   * and it's value as value. Appends namespace prefix to attribute's name as
   * key if a namespaced attribute.
   */
  public class Attributes : HashMap<string,string>, DomNamedNodeMap  {
    protected GomElement _element;
    public ulong length { get { return (ulong) size; } }
    public DomNode? item (ulong index) { return null; }

    public Attributes (GomElement element) {
      _element = element;
    }

    public DomNode? get_named_item (string name) {
      // TODO: Validate name throw INVALID_CHARACTER_ERROR
      if (name == "") return null;
      if (":" in name) return null;
      var v = get (name);
      if (v == null) return null;
      var n = new GomAttr (_element, name, v);
      return n;
    }
    /**
     * Takes given {@link DomNode} as a {@link DomAttr} and use its name and
     * value to set a property in {@link DomElement} ignoring node's prefix and
     * namespace
     */
    public DomNode? set_named_item (DomNode node) throws GLib.Error {
      if ((":" in node.node_name)
          || node.node_name == "")
        throw new DomError.INVALID_CHARACTER_ERROR (_("Invalid attribute name"));
      if (!(node is DomAttr))
        throw new DomError.HIERARCHY_REQUEST_ERROR (_("Invalid node type. DomAttr was expected"));
      set (node.node_name, node.node_value);
      return new GomAttr (_element, node.node_name, node.node_value);
    }
    public DomNode? remove_named_item (string name) throws GLib.Error {
      if (":" in name) return null;
      var v = get (name);
      if (v == null) return null;
      var n = new GomAttr (_element, name, v);
      unset (name);
      return n;
    }
    // Introduced in DOM Level 2:
    public DomNode? remove_named_item_ns (string namespace_uri, string local_name) throws GLib.Error {
      if (":" in local_name) return null;
      var nsp = _element.lookup_prefix (namespace_uri);
      if (nsp == null || nsp == "") return null;
      var v = get (nsp+":"+local_name);
      if (v == null) return null;
      var n = new GomAttr.namespace (_element, namespace_uri, nsp, local_name, v);
      unset (nsp+":"+local_name);
      return n;
    }
    // Introduced in DOM Level 2:
    public DomNode? get_named_item_ns (string namespace_uri, string local_name) throws GLib.Error {
      if (":" in local_name) return null;
      var nsp = _element.lookup_prefix (namespace_uri);
      if (nsp == null) return null;
      var v = get (nsp+":"+local_name);
      if (v == null) return null;
      var n = new GomAttr.namespace (_element, namespace_uri, nsp, local_name, v);
      return n;
    }
    // Introduced in DOM Level 2:
    public DomNode? set_named_item_ns (DomNode node) throws GLib.Error {
      if (node.node_name == "")
        throw new DomError.INVALID_CHARACTER_ERROR (_("Invalid attribute name"));
      if (!(node is DomAttr))
        throw new DomError.HIERARCHY_REQUEST_ERROR (_("Invalid node type. DomAttr was expected"));
      string n = (node as DomAttr).local_name;
      string ns = (node as DomAttr).namespace_uri;
      string v = node.node_value;
      if ((node as DomAttr).prefix == null
          && (node as DomAttr).local_name.down () != "xmlns") {
        set ("xmlns","http://www.w3.org/2000/xmlns/");
        return new GomAttr (_element, "xmlns", "http://www.w3.org/2000/xmlns/");
      }
      if ((node as DomAttr).prefix == null
          || (node as DomAttr).prefix == "") {
        set ((node as DomAttr).local_name, node.node_value);
        return new GomAttr (_element, node.node_name, node.node_value);
      }
      string p = null;
      if ((node as DomAttr).prefix != ""
          && (node as DomAttr).prefix != null) p = (node as DomAttr).prefix;
      set (p+":"+(node as DomAttr).local_name, node.node_value);
      if ((node as DomAttr).prefix.down () == "xmlns"
          || (node as DomAttr).local_name == "xmlns")
        ns = node.node_value;
      return new GomAttr.namespace (_element,
                                    ns, p, n, node.node_value);
    }
  }
  protected Attributes _attributes;
  public DomNamedNodeMap attributes { owned get { return (DomNamedNodeMap) _attributes; } }
  public string? get_attribute (string name) { return (this as GomObject).get_attribute (name); }
  public string? get_attribute_ns (string? namespace, string local_name) {
    DomNode p = null;
    try { p = _attributes.get_named_item_ns (namespace, local_name); }
    catch (GLib.Error e) {
      string s = _("Error:");
      GLib.warning (s+e.message);
      return null;
    }
    if (p == null) return null;
    return p.node_value;
  }
  public void set_attribute (string name, string? value) {
    var a = new GomAttr (this, name, value);
    attributes.set_named_item (a);
  }
  public void set_attribute_ns (string? namespace_uri, string name, string? value) {
    string p = "";
    string n = name;
    if (":" in name) {
      var s = name.split (":");
      if (s.length != 2) return;
      p = s[0];
      n = s[1];
    } else
      n = name;
    if (p == "xml" && namespace_uri != "http://www.w3.org/2000/xmlns/") {
      GLib.warning (_("Invalid namespace. If prefix is xml name space uri shoud be http://www.w3.org/2000/xmlns/"));
      return;
    }
    if (p == "xmlns" && namespace_uri != "http://www.w3.org/2000/xmlns/") {
      GLib.warning (_("Invalid namespace. If attribute's name is xmlns name space uri shoud be http://www.w3.org/2000/xmlns/"));
      return;
    }
    // Check a namespace is set
    if (_prefix == null && _namespace_uri == null)
      if (p.down () == "xmlns"
          || n == "xmlns")
      {
        if (p != "")
          _prefix = p;
        _namespace_uri = namespace_uri;
      }
    var a = new GomAttr.namespace (this, namespace_uri, p, n, value);
    try { _attributes.set_named_item_ns (a); }
    catch (GLib.Error e) {
      GLib.message (_("Setting namespaced property error: ")+e.message);
    }
  }
  public void remove_attribute (string name) {
    (this as GomElement).remove_attribute (name);
  }
  public void remove_attribute_ns (string? namespace_uri, string local_name) {
    attributes.remove_named_item_ns (namespace_uri, local_name);
  }
  public bool has_attribute (string name) {
    return _attributes.has_key (name);
  }
  public bool has_attribute_ns (string? namespace_uri, string local_name) {
    var p = lookup_prefix (namespace_uri);
    if (p == null) return false;
    return attributes.has_key (p+":"+local_name);
  }


  public DomHTMLCollection get_elements_by_tag_name (string local_name) {
    var l = new GDomHTMLCollection ();
    //FIXME: quircks mode not considered
    foreach (GXml.DomNode n in child_nodes) {
      if (!(n is DomElement)) continue;
      if (n.node_name == local_name)
        l.add (n as DomElement);
      l.add_all ((n as DomElement).get_elements_by_tag_name (local_name));
    }
    return l;
  }
  public DomHTMLCollection get_elements_by_tag_name_ns (string? namespace, string local_name) {
    var l = new GDomHTMLCollection ();
    //FIXME: quircks mode not considered
    foreach (GXml.DomNode n in child_nodes) {
      if (!(n is DomElement)) continue;
      if (n.node_name == local_name
          && (n as DomElement).namespace_uri == namespace)
        l.add (n as DomElement);
      l.add_all ((n as DomElement).get_elements_by_tag_name_ns (namespace, local_name));
    }
    return l;
  }
  public DomHTMLCollection get_elements_by_class_name (string class_names) {
    var l = new GDomHTMLCollection ();
    if (class_names == "") return l;
    string[] cs = {};
    if (" " in class_names) {
      cs = class_names.split (" ");
    } else
      cs += class_names;
    foreach (GXml.DomNode n in child_nodes) {
      if (!(n is DomElement)) continue;
      string cls = (n as DomElement).get_attribute ("class");
      if (cls != null) {
        string[] ncls = {};
        if (" " in cls)
          ncls = cls.split (" ");
        else
          ncls += cls;
        int found = 0;
        foreach (string cl in cs) {
          foreach (string ncl in ncls) {
            if (cl == ncl) {
              found++;
            }
          }
        }
        if (found == cs.length) {
          if (l.size == 0)
            l.add (n as DomElement);
          else
            l.insert (0, n as DomElement);
        }
      }
      l.add_all ((n as DomElement).get_elements_by_class_name (class_names));
    }
    return l;
  }
}


