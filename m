Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42DF94E7235
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 12:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353022AbiCYLfl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 07:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbiCYLfk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 07:35:40 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06998A995C;
        Fri, 25 Mar 2022 04:34:05 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id CD46820012;
        Fri, 25 Mar 2022 11:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648208044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7h5U+Wv/MCPvlMQZC9RddFjnnGvegr7ExkBEVjPAZkg=;
        b=oUisZjuRnZzAKfKfHS3IZA9SPvSHB+yh+uf4+RJ97ZHAowKVOSJ0hubxoeLZB177rqgqtJ
        3AIHilOvwZEFzWDXX6IFKmLhGoX5qdlQ07raXrZN6wJTL/R9o5S5coNj7/rZ8tdtITlAQf
        kZWjmyBB+xoqe3030lR5tMhQGA5/ZkXOTUhbDpGLuqZBdlTedzhdua5Hlt6b7DDM71LjDo
        pAGggGuXsZWc+3FSJEzws13t4D0r71RBAUn6BakSWIpwvou3TCP3yXieLqhXQLlieS0cP6
        /jqqJc8yU2M75s5Z5WjmYypBsdjKJ3TjFD7q+UUzMJwal/WetMDeHyFbbc061A==
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
Subject: [PATCH v3 1/9] of: add of_property_read_string_array_index()
Date:   Fri, 25 Mar 2022 12:31:40 +0100
Message-Id: <20220325113148.588163-2-clement.leger@bootlin.com>
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

Add of_property_read_string_array_index() which allows to read a string
array starting at a specific index.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 include/linux/of.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 2dc77430a91a..93f04c530bd1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1115,6 +1115,28 @@ static inline int of_property_read_string_array(const struct device_node *np,
 	return of_property_read_string_helper(np, propname, out_strs, sz, 0);
 }
 
+/**
+ * of_property_read_string_array_index() - Read an array of strings from a
+ * multiple strings property starting at a specified index
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @out_strs:	output array of string pointers.
+ * @sz:		number of array elements to read.
+ * @index:	index to start reading from
+ *
+ * Search for a property in a device tree node and retrieve a list of
+ * terminated string values (pointer to data, not a copy) in that property
+ * starting at specified index.
+ *
+ * Return: If @out_strs is NULL, the number of strings in the property is returned.
+ */
+static inline int of_property_read_string_array_index(const struct device_node *np,
+						      const char *propname,
+						      const char **out_strs,
+						      size_t sz, int index)
+{
+	return of_property_read_string_helper(np, propname, out_strs, sz, index);
+}
 /**
  * of_property_count_strings() - Find and return the number of strings from a
  * multiple strings property.
-- 
2.34.1

