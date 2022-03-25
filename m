Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4709D4E7242
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 12:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356803AbiCYLft (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 07:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356273AbiCYLfp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 07:35:45 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953CCBF500;
        Fri, 25 Mar 2022 04:34:10 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id AF6D12000D;
        Fri, 25 Mar 2022 11:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648208049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FMZGg8/3IdkuVd8+r/gnt8MAIBaSCmXIF+AlPEdNXgs=;
        b=M6bW8oLwl4IGPQ9ZEIfRTt+ppthPDu8zKCbG3J86s9PZ4jrnc/t5omOPZp/QpsyOxwoC/o
        kIkwpXlqU0Bx0Eol6vQ/VAU/gedIKcvej23cAali0haV2GETrIgU4Ut9G34FYpGpXxTlSm
        5tDKJDs0/8W2ntMGzrdBZofJrGCj/Qk+lekKTvGjhyAMozOGD15m0XdBFt/mQKRn62VMcT
        s0F7Zv965bb7djJ+ZyvrRAYBq43m2cviYqLYB2gIq+UwlSAwLXopFzwf5ZmLqk5omzqm9F
        YwufOla0Hhp+gfJByKXszFqMLe1MWmPoo6lgeSajwcjWErS1yWfxicpB9tLu7w==
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
Subject: [PATCH v3 4/9] device property: add fwnode_property_read_string_index()
Date:   Fri, 25 Mar 2022 12:31:43 +0100
Message-Id: <20220325113148.588163-5-clement.leger@bootlin.com>
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

Add fwnode_property_read_string_index() function which allows to
retrieve a single string from an array by its index. This function is
the equivalent of of_property_read_string_index() but for fwnode
support.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/base/property.c  | 33 +++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index d95c949e0a79..a2cfdf57b847 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -406,6 +406,39 @@ int fwnode_property_read_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_read_string);
 
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
+ * Return: %0 if the string was found (success),
+ *	   %-EINVAL if given arguments are not valid,
+ *	   %-ENODATA if the property does not have a value,
+ *	   %-EPROTO if the property is not an array of strings,
+ *	   %-ENXIO if no suitable firmware interface is present.
+ */
+int fwnode_property_read_string_index(const struct fwnode_handle *fwnode,
+				      const char *propname, int index,
+				      const char **string)
+{
+	int ret;
+
+	ret = fwnode_call_int_op(fwnode, property_read_string_array, propname,
+				 string, 1, index);
+	if (ret == -EINVAL && !IS_ERR_OR_NULL(fwnode) &&
+	    !IS_ERR_OR_NULL(fwnode->secondary))
+		ret = fwnode_call_int_op(fwnode->secondary,
+					 property_read_string_array, propname,
+					 string, 1, index);
+	return ret == 1 ? 0 : ret;
+}
+EXPORT_SYMBOL_GPL(fwnode_property_read_string_index);
+
 /**
  * fwnode_property_match_string - find a string in an array and return index
  * @fwnode: Firmware node to get the property of
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

