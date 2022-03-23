Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19ACA4E4F13
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Mar 2022 10:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243137AbiCWJV2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Mar 2022 05:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243129AbiCWJV1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Mar 2022 05:21:27 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF8575E7C;
        Wed, 23 Mar 2022 02:19:56 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 0F449E0004;
        Wed, 23 Mar 2022 09:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648027194;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LFZ0Z7uvf0VFG2tUAEpLJUaxBE7qdMjsJkE8V6W3WAM=;
        b=nOuB63TVx0TmcZXmCmw8aLIxa0FBePow7kE7/h05JJVQV1cUj5mMRYPN5ERsNoj49ARY4f
        Caj0HnMNN8Js+1JtOG46YgfVYJiIataFu80LNW3P20UtkjS1OdrdztTnc4K/edGT4cety6
        3GUXtUkpioPA1SVkvWsStP2/AVj/4Qe4mC+Bz084CYCIWEEhe8exsvi4/Sop8Hyao9cIKk
        /luXEH2wYZ+8pXzXPLcb6eJeLL+EBC9+LJcSrAJUMwTdc6JBFzWrI0yc4+tHE3yFok+yHd
        2MH3w1mb7oeFnPJTepTv9PWz5aeRJhCt0Wt4nywdysAFQoWRIbHpL2olGIbg3w==
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
        linux-i2c@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Subject: [PATCH v2 1/7] device property: add fwnode_property_read_string_index()
Date:   Wed, 23 Mar 2022 10:18:04 +0100
Message-Id: <20220323091810.329217-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323091810.329217-1-clement.leger@bootlin.com>
References: <20220323091810.329217-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add fwnode_property_read_string_index() function which allows to
retrieve a string from an array by its index. This function is the
equivalent of of_property_read_string_index() but for fwnode support.
A .property_read_string_index callback is added to fwnode_ops to avoid
doing a full allocation of an array just to retrieve one value.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/base/property.c  | 26 ++++++++++++++++++++++++++
 include/linux/fwnode.h   |  6 ++++++
 include/linux/property.h |  3 +++
 3 files changed, 35 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index e6497f6877ee..a8dd6e496a1d 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -451,6 +451,32 @@ int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_string);
 
+/**
+ * fwnode_property_read_string_index - read a string in an array using an index
+ * @fwnode: Firmware node to get the property of
+ * @propname: Name of the property holding the array
+ * @index: Index of the string to look for
+ * @string: Pointer to the string if found
+ *
+ * Find a string by a given index in a string array and if it is found return
+ * the string value in @string.
+ *
+ * Return: %0 if the property was found (success),
+ *	   %-EINVAL if given arguments are not valid,
+ *	   %-ENODATA if the property does not have a value,
+ *	   %-EPROTO if the property is not an array of strings,
+ *	   %-ENXIO if no suitable firmware interface is present.
+ */
+int fwnode_property_read_string_index(const struct fwnode_handle *fwnode,
+				      const char *propname, int index,
+				      const char **string)
+{
+	return fwnode_call_int_op(fwnode, property_read_string_index, propname,
+				  index,
+				  string);
+}
+EXPORT_SYMBOL_GPL(fwnode_property_read_string_index);
+
 /**
  * fwnode_property_get_reference_args() - Find a reference with arguments
  * @fwnode:	Firmware node where to look for the reference
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 3a532ba66f6c..71ba8f53cf1e 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -93,6 +93,9 @@ struct fwnode_reference_args {
  *			     success, a negative error code otherwise.
  * @property_read_string_array: Read an array of string properties. Return zero
  *				on success, a negative error code otherwise.
+ * @property_read_string_index: Read a string from a string array using an
+ *				index. Return zero on success, a negative error
+ *				code otherwise.
  * @get_name: Return the name of an fwnode.
  * @get_name_prefix: Get a prefix for a node (for printing purposes).
  * @get_parent: Return the parent of an fwnode.
@@ -123,6 +126,9 @@ struct fwnode_operations {
 	(*property_read_string_array)(const struct fwnode_handle *fwnode_handle,
 				      const char *propname, const char **val,
 				      size_t nval);
+	int (*property_read_string_index)(const struct fwnode_handle *fwnode,
+					  const char *propname, int index,
+					  const char **string);
 	const char *(*get_name)(const struct fwnode_handle *fwnode);
 	const char *(*get_name_prefix)(const struct fwnode_handle *fwnode);
 	struct fwnode_handle *(*get_parent)(const struct fwnode_handle *fwnode);
diff --git a/include/linux/property.h b/include/linux/property.h
index 7399a0b45f98..a033920eb10a 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -70,6 +70,9 @@ int fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 				      size_t nval);
 int fwnode_property_read_string(const struct fwnode_handle *fwnode,
 				const char *propname, const char **val);
+int fwnode_property_read_string_index(const struct fwnode_handle *fwnode,
+				      const char *propname, int index,
+				      const char **string);
 int fwnode_property_match_string(const struct fwnode_handle *fwnode,
 				 const char *propname, const char *string);
 int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
-- 
2.34.1

