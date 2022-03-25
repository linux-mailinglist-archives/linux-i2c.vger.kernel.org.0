Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392B34E723B
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 12:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356548AbiCYLfr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 07:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356244AbiCYLfn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 07:35:43 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED67DA995C;
        Fri, 25 Mar 2022 04:34:08 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2B9022000E;
        Fri, 25 Mar 2022 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648208047;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7+j1FPgQHZrTvHRl55BohIN+XKqxXzL6DLT9mW+8SbQ=;
        b=jfM9ZDVwVxnFawUXJBUIwwfmpiscLOblMJUT9HyN3XVBBzZft04rgUs0nIREde2YuPQy1g
        Lr+8nU4H7lvnXatRtaNICyEw/zyi59ahu0RpkvfHMnrFpvGBd+R5fbx7R2ZSDawvtL6PYz
        FgMqHErsE2YFdmdNoRJIcegaAGRV9SELe3Ig51de9Ay6R6LoH3QYjcVGQ6NL8/dmmYWn1c
        QRmEucDQxhgjdCuZOvIp3ZyT11/fwzIxsl0Y5x6OQO4EM4aw6xEFgxrvKH2k2jKamNBeSZ
        9XgXoGwhQLWZtG5Ygdpxq0T4hc9p4iZpThT2aHOrkdSgOA44jCfXDXCQVZZeXQ==
From:   =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Subject: [PATCH v3 3/9] device property: add index argument to property_read_string_array() callback
Date:   Fri, 25 Mar 2022 12:31:42 +0100
Message-Id: <20220325113148.588163-4-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325113148.588163-1-clement.leger@bootlin.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This will allow to read a string array from a specified offset. Support
for this new parameter has been added in both of through the use of
of_property_read_string_array_index() and in swnode though the existing
property_entry_read_string_array() function. ACPI support has not yet
been added and only index == 0 is accepted.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/acpi/property.c |  5 ++++-
 drivers/base/property.c |  4 ++--
 drivers/base/swnode.c   | 21 +++++++++++++++------
 drivers/of/property.c   |  5 +++--
 include/linux/fwnode.h  |  7 ++++---
 5 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 12bbfe833609..7847b21c94f7 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -1293,8 +1293,11 @@ acpi_fwnode_property_read_int_array(const struct fwnode_handle *fwnode,
 static int
 acpi_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 				       const char *propname, const char **val,
-				       size_t nval)
+				       size_t nval, int index)
 {
+	if (index != 0)
+		return -EINVAL;
+
 	return acpi_node_prop_read(fwnode, propname, DEV_PROP_STRING,
 				   val, nval);
 }
diff --git a/drivers/base/property.c b/drivers/base/property.c
index e6497f6877ee..d95c949e0a79 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -372,12 +372,12 @@ int fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 	int ret;
 
 	ret = fwnode_call_int_op(fwnode, property_read_string_array, propname,
-				 val, nval);
+				 val, nval, 0);
 	if (ret == -EINVAL && !IS_ERR_OR_NULL(fwnode) &&
 	    !IS_ERR_OR_NULL(fwnode->secondary))
 		ret = fwnode_call_int_op(fwnode->secondary,
 					 property_read_string_array, propname,
-					 val, nval);
+					 val, nval, 0);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(fwnode_property_read_string_array);
diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 0a482212c7e8..cb80dab041ef 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -184,9 +184,10 @@ static int property_entry_read_int_array(const struct property_entry *props,
 
 static int property_entry_read_string_array(const struct property_entry *props,
 					    const char *propname,
-					    const char **strings, size_t nval)
+					    const char **strings, size_t nval,
+					    int index)
 {
-	const void *pointer;
+	const char * const *pointer;
 	size_t length;
 	int array_len;
 
@@ -200,13 +201,20 @@ static int property_entry_read_string_array(const struct property_entry *props,
 	if (!strings)
 		return array_len;
 
-	array_len = min_t(size_t, nval, array_len);
 	length = array_len * sizeof(*strings);
-
 	pointer = property_entry_find(props, propname, length);
 	if (IS_ERR(pointer))
 		return PTR_ERR(pointer);
 
+	if (index >= array_len)
+		return -ENODATA;
+
+	pointer += index;
+	array_len -= index;
+
+	array_len = min_t(size_t, nval, array_len);
+	length = array_len * sizeof(*strings);
+
 	memcpy(strings, pointer, length);
 
 	return array_len;
@@ -400,12 +408,13 @@ static int software_node_read_int_array(const struct fwnode_handle *fwnode,
 
 static int software_node_read_string_array(const struct fwnode_handle *fwnode,
 					   const char *propname,
-					   const char **val, size_t nval)
+					   const char **val, size_t nval,
+					   int index)
 {
 	struct swnode *swnode = to_swnode(fwnode);
 
 	return property_entry_read_string_array(swnode->node->properties,
-						propname, val, nval);
+						propname, val, nval, index);
 }
 
 static const char *
diff --git a/drivers/of/property.c b/drivers/of/property.c
index 8e90071de6ed..77e8df4a6267 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -906,12 +906,13 @@ static int of_fwnode_property_read_int_array(const struct fwnode_handle *fwnode,
 static int
 of_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 				     const char *propname, const char **val,
-				     size_t nval)
+				     size_t nval, int index)
 {
 	const struct device_node *node = to_of_node(fwnode);
 
 	return val ?
-		of_property_read_string_array(node, propname, val, nval) :
+		of_property_read_string_array_index(node, propname, val, nval,
+						    index) :
 		of_property_count_strings(node, propname);
 }
 
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 3a532ba66f6c..b9e28ba49038 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -91,8 +91,9 @@ struct fwnode_reference_args {
  * @property_present: Return true if a property is present.
  * @property_read_int_array: Read an array of integer properties. Return zero on
  *			     success, a negative error code otherwise.
- * @property_read_string_array: Read an array of string properties. Return zero
- *				on success, a negative error code otherwise.
+ * @property_read_string_array: Read an array of string properties starting at
+ *				a specified index. Return zero on success, a
+ *				negative error code otherwise.
  * @get_name: Return the name of an fwnode.
  * @get_name_prefix: Get a prefix for a node (for printing purposes).
  * @get_parent: Return the parent of an fwnode.
@@ -122,7 +123,7 @@ struct fwnode_operations {
 	int
 	(*property_read_string_array)(const struct fwnode_handle *fwnode_handle,
 				      const char *propname, const char **val,
-				      size_t nval);
+				      size_t nval, int index);
 	const char *(*get_name)(const struct fwnode_handle *fwnode);
 	const char *(*get_name_prefix)(const struct fwnode_handle *fwnode);
 	struct fwnode_handle *(*get_parent)(const struct fwnode_handle *fwnode);
-- 
2.34.1

