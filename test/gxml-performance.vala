/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/* librescl
 *
 * Copyright (C) 2013-2015 Daniel Espinosa <esodan@gmail.com>
 *
 * librescl is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * librescl is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
using GXml;

class Name : SerializableObjectModel
{
  public string get_name () { return serialized_xml_node_value; }
  public void   set_name (string name) { serialized_xml_node_value = name; }
  public override bool serialize_use_xml_node_value () { return true; }
  public override string to_string () { return serialized_xml_node_value; }
}

class Email : SerializableObjectModel
{
  public string get_mail () { return serialized_xml_node_value; }
  public void   set_mail (string email) { serialized_xml_node_value = email; }
  public override bool serialize_use_xml_node_value () { return true; }
  public override string to_string () { return serialized_xml_node_value; }
}

class Author : SerializableObjectModel
{
  public Name name   { get; set; }
  public Email email { get; set; }
  public override string to_string () { return @"\"$(name.get_name ())\"<$(email.get_mail ())>"; }
  public class Array : SerializableArrayList<Author> {}
}

class Authors : SerializableContainer
{
  public string number { get; set; }
  public Author.Array array { get; set; }
  public override void init_containers ()
  {
    if (array == null)
      array = new Author.Array ();
  }
  public override string to_string () { return @"$(get_type ().name ())"; }
}

class Inventory : SerializableObjectModel, SerializableMapDualKey<int,string>
{
  public int number { get; set; }
  public int row { get; set; }
  public string inventory { get; set; }
  public int get_map_primary_key  () { return number; }
  public string get_map_secondary_key () { return inventory; }
  public override string to_string () { return @"||$(number.to_string ())|$(row.to_string ())|$(inventory)||"; }
  public class DualKeyMap : SerializableDualKeyMap<int, string, Inventory> {}
}

class Category : SerializableObjectModel, SerializableMapKey<string>
{
  public string name { get; set; }
  public string get_map_key () { return name; }
  public override string to_string () { return "Category: "+name; }
  public class Map : SerializableHashMap<string,Category> {}
}


class Resume : SerializableObjectModel, SerializableMapKey<string>
{
  public string chapter { get; set; }
  public string text { get; set; }
  public string get_map_key () { return chapter; }
  public override string to_string () { return "Chapter: "+chapter+"\n"+text; }
  public class Map : SerializableTreeMap<string,Resume> {}
}

class Book : SerializableContainer
{
  public string year { get; set; }
  public string isbn { get; set; }
  public Name   name { get; set; }
  public Authors authors { get; set; }
  public Inventory.DualKeyMap inventory_registers { get; set; }
  public Category.Map categories { get; set; }
  public Resume.Map resumes { get; set; }
  public override string to_string () { return @"$(name.get_name ()), $(year)"; }
  public override void init_containers ()
  {
    if (inventory_registers == null)
      inventory_registers = new Inventory.DualKeyMap ();
    if (categories == null)
      categories = new Category.Map ();
    if (resumes == null)
      resumes = new Resume.Map ();
  }
  public class Array : SerializableArrayList<Book> {}
}

class BookStore : SerializableContainer
{
  public string name { get; set; }
  public Book.Array books { get; set; }
  public override void init_containers ()
  {
    if (books == null)
      books = new Book.Array ();
  }
  public override string to_string () { return name; }
}

public class Performance
{
  /**
   * Iterate recursively through all node and children nodes in document.
   */
  public static void iterate (GXml.Node node) {
    foreach (GXml.Node n in node.children) {
      int i = node.children.size;
      string name = n.name;
      string val = n.value;
#if DEBUG
      GLib.message ("Node: "+name+" Val: "+val+ " Children: "+i.to_string ());
#endif
      if (i > 0)
        Performance.iterate (n);
    }
  }
  public static void add_tests ()
  {
#if ENABLE_PERFORMANCE_TESTS
    Test.add_func ("/gxml/performance/read/xdocument", 
    () => {
      try {
        Test.timer_start ();
        double time;
        var d = new xDocument.from_path (GXmlTest.get_test_dir () + "/test-large.xml");
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "Load large document: %g seconds", time);
        Test.timer_start ();
        iterate (d);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "Itirate over all loaded nodes: %g seconds", time);
      } catch (GLib.Error e) {
#if DEBUG
        GLib.message ("ERROR: "+e.message);
#endif
        assert_not_reached ();
      }
    });Test.add_func ("/gxml/performance/read/gdocument", 
    () => {
      try {
        Test.timer_start ();
        double time;
        var d = new GDocument.from_path (GXmlTest.get_test_dir () + "/test-large.xml");
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "Load large document: %g seconds", time);
        Test.timer_start ();
        iterate (d);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "Itirate over all loaded nodes: %g seconds", time);
      } catch (GLib.Error e) {
#if DEBUG
        GLib.message ("ERROR: "+e.message);
#endif
        assert_not_reached ();
      }
    });
    Test.add_func ("/gxml/performance/deserialize", 
    () => {
      try {
        double time;
        Test.timer_start ();
        var d = new xDocument.from_path (GXmlTest.get_test_dir () + "/test-large.xml");
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "open document from path: %g seconds", time);
        Test.timer_start ();
        var bs = new BookStore ();
        bs.deserialize (d);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "deserialize/performance: %g seconds", time);
      } catch (GLib.Error e) {
#if DEBUG
        GLib.message ("ERROR: "+e.message);
#endif
        assert_not_reached ();
      }
    });

    Test.add_func ("/gxml/performance/serialize",
    () => {
      try {
        double time;
        Test.timer_start ();
        var d = new xDocument.from_path (GXmlTest.get_test_dir () + "/test-large.xml");
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "open document from path: %g seconds", time);
        Test.timer_start ();
        var bs = new BookStore ();
        bs.deserialize (d);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "deserialize/performance: %g seconds", time);
        Test.timer_start ();
        var d2 = new xDocument ();
        bs.serialize (d2);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "serialize/performance: %g seconds", time);
      } catch (GLib.Error e) {
#if DEBUG
        GLib.message ("ERROR: "+e.message);
#endif
        assert_not_reached ();
      }
    });
    Test.add_func ("/gxml/performance/tw-serialize",
    () => {
      try {
        double time;
        Test.timer_start ();
        var d = new xDocument.from_path (GXmlTest.get_test_dir () + "/test-large.xml");
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "open document from path: %g seconds", time);
        Test.timer_start ();
        var bs = new BookStore ();
        bs.deserialize (d);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "standard deserialize/performance: %g seconds", time);
        assert (bs.name == "The Great Book");
        assert (bs.books.size > 10);
        var b = bs.books.first ();
        assert (b != null);
        assert (b.name != null);
        assert (b.name.get_name () == "Book1");
        assert (b.year == "2015");
        assert (b.authors != null);
        assert (b.authors.array != null);
        assert (b.authors.array.size == 2);
        var a = b.authors.array.first ();
        assert (a != null);
        assert (a.name != null);
        assert (a.name.get_name () == "Fred");
        assert (a.email != null);
        assert (a.email.get_mail () == "fweasley@hogwarts.co.uk");
        Test.timer_start ();
        var d2 = new TwDocument.for_path (GXmlTest.get_test_dir () + "/test-large.xml");
        bs.serialize (d2);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "TwDocument serialize/performance: %g seconds", time);
        Test.timer_start ();
        var nf = GLib.File.new_for_path (GXmlTest.get_test_dir () + "/test-large-tw.xml");
        d2.indent = true;
        d2.save_as (nf);
        time = Test.timer_elapsed ();
        Test.minimized_result (time, "TwDocument Write to disk serialize/performance: %g seconds", time);
      } catch (GLib.Error e) {
#if DEBUG
        GLib.message ("ERROR: "+e.message);
#endif
        assert_not_reached ();
      }
    });
#endif
  }
}
