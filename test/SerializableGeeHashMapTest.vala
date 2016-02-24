/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/**
 *
 *  GXml.Serializable.BasicTypeTest
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *
 *
 *  Copyright (c) 2013-2015 Daniel Espinosa
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
using GXml;
using Gee;

class SerializableGeeHashMapTest : GXmlTest
{
  class HElement : SerializableObjectModel, SerializableMapKey<string>
  {
    public string name { get; set; }
    public string get_map_key () { return name; }
    public override string node_name () { return "HElement"; }
    public override string to_string () { return "HElement"; }
    public class HashMap : SerializableHashMap<string,HElement> {
      public bool enable_deserialize { get; set; default = false; }
      public override bool deserialize_proceed () { return enable_deserialize; }
    }
  }
  class HCElement : SerializableObjectModel {
    public HElement.HashMap elements1 { get; set; default = new HElement.HashMap (); }
    public HElement.HashMap elements2 { get; set; default = new HElement.HashMap (); }
    public override string node_name () { return "HCElement"; }
    public override string to_string () { return "HCElement"; }
  }
  
  class Space : SerializableObjectModel, SerializableMapKey<string>
  {
    public string get_map_key () { return name; }
    public string name { get; set; }
    public Space.named (string name) { this.name = name; }
    public void set_value (string str) { serialized_xml_node_value = str; }
    public string get_value () {
      if (serialized_xml_node_value == null)
        serialized_xml_node_value = "";
      return serialized_xml_node_value;
    }
    // Required when you want to use serialized_xml_node_value
    public override bool serialize_use_xml_node_value () { return true; }
    public override string node_name () { return "space"; }
    public override string to_string () { return name; }
    public class Collection : SerializableHashMap<string,Space> {}
  }

  class SpaceContainer : SerializableContainer
  {
    public string owner { get; set; }
    public Space.Collection storage { get; set; }
    public override string node_name () { return "spacecontainer"; }
    public override string to_string () { return owner; }
    // SerializableContainer: Init containers
    public override void init_containers () {
      if (storage == null)
        storage = new Space.Collection ();
    }
  }

  public static void add_tests ()
  {
    Test.add_func ("/gxml/serializable/serializable_hash_map/api",
    () => {
      try {
        var c = new SerializableHashMap<string,Space> ();
        var o1 = new Space.named ("Big");
        var o2 = new Space.named ("Small");
        c.set (o1.name, o1);
        c.set (o2.name, o2);
        bool found1 = false;
        bool found2 = false;
        foreach (Space o in c.values) {
          if (o.name == "Big") found1 = true;
          if (o.name == "Small") found2 = true;
        }
        if (!found1) {
          GLib.message (@"Big is not found\n");
          assert_not_reached ();
        }
        if (!found2) {
          GLib.message (@"Small is not found\n");
          assert_not_reached ();
        }
        found1 = found2 = false;
        foreach (string k in c.keys) {
          if ((c.@get (k)).name == "Big") found1 = true;
          if ((c.@get (k)).name == "Small") found2 = true;
        }
        if (!found1) {
          GLib.message (@"Big key value is not found\n");
          assert_not_reached ();
        }
        if (!found2) {
          GLib.message (@"Small key value is not found\n");
          assert_not_reached ();
        }
      }
      catch (GLib.Error e) {
        GLib.message (@"ERROR: $(e.message)");
      }
    });
    Test.add_func ("/gxml/serializable/serializable_hash_map/serialize",
    () => {
      try {
        var c = new SerializableHashMap<string,Space> ();
        var o1 = new Space.named ("Big");
        o1.set_value ("FAKE TEXT");
        var o2 = new Space.named ("Small");
        o2.set_value ("FAKE TEXT");
        c.set (o1.name, o1);
        c.set (o2.name, o2);
        var doc = new TwDocument ();
        var root = doc.create_element ("root");
        doc.children.add (root);
        c.serialize (root);
        assert (root.children.size > 0);
        bool found1 = false;
        bool found2 = false;
        foreach (GXml.Node n in root.children) {
          if (n is Element && n.name == "space") {
            var name = n.attrs.get ("name");
            if (name != null) {
              if (name.value == "Big") found1 = true;
              if (name.value == "Small") found2 = true;
            }
            if (n.children.size > 0) {
              foreach (GXml.Node nd in n.children) {
                if (nd is Text) {
                  if (nd.value != "FAKE TEXT") {
                    GLib.message (@"ERROR: node content don't much. Expected 'FAKE TEXT', got: $(nd.value)\n$(doc)\n");
                    assert_not_reached ();
                  }
                }
              }
            }
          }
        }
        if (!found1) {
          GLib.message (@"ERROR: Big space node is not found\n$(doc)\n");
          assert_not_reached ();
        }
        if (!found2) {
          GLib.message (@"ERROR: Small space node is not found\n$(doc)\n");
          assert_not_reached ();
        }
      }
      catch (GLib.Error e) {
        GLib.message (@"ERROR: $(e.message)");
        assert_not_reached ();
      }
    });
    Test.add_func ("/gxml/serializable/serializable_hash_map/deserialize",
    () => {
      try {
        var doc = new GDocument.from_string ("""<?xml version="1.0"?>
  <root><space name="Big"/><space name="Small"/></root>""");
        var c = new SerializableHashMap<string,Space> ();
        c.deserialize (doc.root);
        if (c.size != 2) {
          GLib.message (@"ERROR: incorrect size must be 2 got: $(c.size)\n");
          assert_not_reached ();
        }
        bool found1 = false;
        bool found2 = false;
        foreach (string k in c.keys) {
          if ((c.@get (k)).name == "Big") found1 = true;
          if ((c.@get (k)).name == "Small") found2 = true;
        }
        if (!found1) {
          GLib.message (@"ERROR: Big key value is not found\n");
          assert_not_reached ();
        }
        if (!found2) {
          GLib.message (@"ERROR: Small key value is not found\n");
          assert_not_reached ();
        }
      }
      catch (GLib.Error e) {
        GLib.message (@"ERROR: $(e.message)");
        assert_not_reached ();
      }
    });
    Test.add_func ("/gxml/serializable/serializable_hash_map/container_class/deserialize",
    () => {
      try {
        var doc = new GDocument.from_string ("""<?xml version="1.0"?>
  <spacecontainer owner="Earth"><space name="Big"/><space name="Small"/></spacecontainer>""");
        var c = new SpaceContainer ();
        c.deserialize (doc);
        if (c.owner != "Earth") {
          GLib.message (@"ERROR: owner must be 'Earth' got: $(c.owner)\n$(doc)\n");
          assert_not_reached ();
        }
        if (c.storage.size != 2) {
          GLib.message (@"ERROR: Size must be 2 got: $(c.storage.size)\n$(doc)\n");
          assert_not_reached ();
        }
        bool found1 = false;
        bool found2 = false;
        foreach (string k in c.storage.keys) {
          if ((c.storage.@get (k)).name == "Big") found1 = true;
          if ((c.storage.@get (k)).name == "Small") found2 = true;
        }
        if (!found1) {
          GLib.message (@"ERROR: Big key value is not found\n");
          assert_not_reached ();
        }
        if (!found2) {
          GLib.message (@"ERROR: Small key value is not found\n");
          assert_not_reached ();
        }
      }
      catch (GLib.Error e) {
        GLib.message (@"ERROR: $(e.message)");
        assert_not_reached ();
      }
    });
    Test.add_func ("/gxml/serializable/serializable_hash_map/containder_class/serialize",
    () => {
      try {
        var c = new SpaceContainer ();
        var o1 = new Space.named ("Big");
        var o2 = new Space.named ("Small");
        c.storage = new Space.Collection ();
        c.storage.set (o1.name, o1);
        c.storage.set (o2.name, o2);
        var doc = new TwDocument ();
        c.serialize (doc);
        assert (doc.root != null);
        assert (doc.root.name == "spacecontainer");
        var root = doc.root;
        assert (root.children.size > 0);
        bool found1 = false;
        bool found2 = false;
        foreach (GXml.Node n in root.children) {
          if (n is Element && n.name == "space") {
            var name = n.attrs.get ("name");
            if (name != null) {
              if (name.value == "Big") found1 = true;
              if (name.value == "Small") found2 = true;
            }
          }
        }
        assert (found1);
        assert (found2);
      }
      catch (GLib.Error e) {
        GLib.message (@"ERROR: $(e.message)");
        assert_not_reached ();
      }
    });
    Test.add_func ("/gxml/serializable/serializable_hash_map/deserialize-serialize",
    () => {
      try {
        var idoc = new GDocument.from_string ("""<?xml version="1.0"?>
    <spacecontainer owner="Earth">
      <space name="Big"/>
      <space name="Big">FAKE1</space>
      <space name="Small"/>
      <space name="Yum1">FAKE2</space>
      <space name="Yum2">FAKE3</space>
      <space name="Yum3">FAKE4</space>
      <space name="Yum3">FAKE5</space>
    </spacecontainer>""");
        var isc = new SpaceContainer ();
        isc.deserialize (idoc);
        var doc = new TwDocument ();
        isc.serialize (doc);
        var sc = new SpaceContainer ();
        sc.deserialize (doc);
        assert (sc.storage != null);
        assert (sc.storage.size == 5);
        int i = 0;
        foreach (Space s in sc.storage.values)
          i++;
        assert (i == 5);
        var s1 = sc.storage.get ("Big");
        assert (s1 != null);
        assert (s1.get_value () == "FAKE1");
        var s2 = sc.storage.get ("Small");
        assert (s2 != null);
        assert (s2.get_value () == "");
        var s3 = sc.storage.get ("Yum1");
        assert (s3 != null);
        assert (s3.get_value () == "FAKE2");
        var s4 = sc.storage.get ("Yum2");
        assert (s4 != null);
        assert (s4.get_value () == "FAKE3");
        var s5 = sc.storage.get ("Yum3");
        assert (s5 != null);
        assert (s5.get_value () == "FAKE5");
      } catch (GLib.Error e) {
        GLib.message (@"ERROR: $(e.message)");
        assert_not_reached ();
      }
    });
    Test.add_func ("/gxml/serializable/serializable_hash_map/deserialize-node-names",
    () => {
      try {
        var d = new GDocument.from_path (GXmlTestConfig.TEST_DIR + "/test-collection.xml");
        var bs = new BookStore ();
        bs.deserialize (d);
        assert (bs.name == "The Great Book");
        assert (bs.books.size == 3);
        var b = bs.books.first ();
        assert (b != null);
        assert (b.name != null);
        assert (b.name.get_name () == "Book1");
        assert (b.year == "2015");
        assert (b.authors != null);
        assert (b.authors.array != null);
        assert (b.authors.array.size == 2);
        assert (b.categories != null);
        assert (b.categories.size == 2);
        var c = b.categories.get ("Fiction");
        assert (c != null);
        assert (c.name == "Fiction");
      } catch (GLib.Error e) {
#if DEBUG
        GLib.message ("ERROR: "+e.message);
#endif
        assert_not_reached ();
      }
    });
    Test.add_func ("/gxml/performance/hashmap/post-deserialization/disable",
    () => {
      try {
        double time;
        Test.message ("Starting generating document...");
        Test.timer_start ();
        var d = new TwDocument ();
        var ce = new HCElement ();
        for (int i = 0; i < 125000; i++) {
          var e1 = new HElement ();
          e1.name = "1E"+i.to_string ();
          ce.elements1.set (e1.name, e1);
          var e2 = new HElement ();
          e2.name = "2E"+i.to_string ();
          ce.elements2.set (e2.name, e2);
        }
        ce.serialize (d);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "Created document: %g seconds", time);
        Test.message ("Starting deserializing document: Disable collection deserialization...");
        Test.timer_start ();
        var cep = new HCElement ();
        cep.elements1.enable_deserialize = false;
        cep.elements2.enable_deserialize = false;
        cep.deserialize (d);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "Disable Deserialize Collection. Deserialized from doc: %g seconds", time);
        assert (cep.elements1.is_prepared ());
        assert (cep.elements2.is_prepared ());
        Test.message ("Calling C1 deserialize_children()...");
        Test.timer_start ();
        cep.elements1.deserialize_children ();
        assert (!cep.elements1.deserialize_children ());
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "C1: Disable Deserialize Collection. Deserialized from NODE: %g seconds", time);
        Test.message ("Calling C2 deserialize_children()...");
        Test.timer_start ();
        cep.elements2.deserialize_children ();
        assert (!cep.elements2.deserialize_children ());
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "C2: Disable Deserialize Collection. Deserialized from NODE: %g seconds", time);
      } catch (GLib.Error e) {
        GLib.message ("ERROR: "+e.message);
        assert_not_reached ();
      }
    });
    Test.add_func ("/gxml/performance/hashmap/post-deserialization/enable",
    () => {
      try {
        double time;
        Test.message ("Starting generating document...");
        Test.timer_start ();
        var d = new TwDocument ();
        var ce = new HCElement ();
        for (int i = 0; i < 125000; i++) {
          var e1 = new HElement ();
          e1.name = "1E"+i.to_string ();
          ce.elements1.set (e1.name, e1);
          var e2 = new HElement ();
          e2.name = "2E"+i.to_string ();
          ce.elements2.set (e2.name, e2);
        }
        ce.serialize (d);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "Created document: %g seconds", time);
        Test.message ("Starting deserializing document: Enable collection deserialization...");
        Test.timer_start ();
        var cep = new HCElement ();
        cep.elements1.enable_deserialize = true;
        cep.elements2.enable_deserialize = true;
        cep.deserialize (d);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "Disable Deserialize Collection. Deserialized from doc: %g seconds", time);
        assert (cep.elements1.is_prepared ());
        assert (cep.elements2.is_prepared ());
        assert (!cep.elements1.deserialize_children ());
        assert (!cep.elements2.deserialize_children ());
      } catch (GLib.Error e) {
        GLib.message ("ERROR: "+e.message);
        assert_not_reached ();
      }
    });
  }
}
