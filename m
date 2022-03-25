Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00BFE4E723E
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 12:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356673AbiCYLfs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 07:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356438AbiCYLfq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 07:35:46 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED78D3AF3;
        Fri, 25 Mar 2022 04:34:12 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 544D720013;
        Fri, 25 Mar 2022 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648208051;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4R0N7D8tALRuS3AKBt7M/T2sGusCMys4umR0Kgc6iOo=;
        b=LuGDvVn+ffmAktrWs6yCD0HkYlWOV1nxlFJI+5QfyUr+X0KpQk5YUBYKygI81lBhP9yqZt
        5vfM8gLhSbh28tGaFmHmcaqJQI97FwwQt1ED92dboof0tP+S6rggLmJHb/4VMEae90hHm/
        DpwbWBifSxsRb1i6UvN9j5FR+SI5CNiexh8ZrBUd/tfqXy4BVHcA9MyB68vgz0bgaeP9lY
        TRLClBEQfpSp+LcAH5vZc10RMnfs+Aev/mzZMqQtlUtvuzycUyb1JMLQQTZdSTEKXZUf0U
        vhRu20eVuJvFBmsmE0adTFsn9O0H3Ip0JH+xZsmGrPZKyUquV7cYMRbGl3AHNg==
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
Subject: [PATCH v3 5/9] device property: add tests for fwnode_property_read_string_index()
Date:   Fri, 25 Mar 2022 12:31:44 +0100
Message-Id: <20220325113148.588163-6-clement.leger@bootlin.com>
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

Add somes tests to validate fwnode_property_read_string_index().

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/base/test/property-entry-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/base/test/property-entry-test.c b/drivers/base/test/property-entry-test.c
index 6071d5bc128c..9edbaa53a950 100644
--- a/drivers/base/test/property-entry-test.c
+++ b/drivers/base/test/property-entry-test.c
@@ -318,6 +318,24 @@ static void pe_test_strings(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, error, 0);
 	KUNIT_EXPECT_STREQ(test, str, "string-a");
 
+	error = fwnode_property_read_string_index(node, "str", 0, strs);
+	KUNIT_EXPECT_EQ(test, error, 0);
+	KUNIT_EXPECT_STREQ(test, strs[0], "single");
+
+	error = fwnode_property_read_string_index(node, "strs", 0, strs);
+	KUNIT_EXPECT_EQ(test, error, 0);
+	KUNIT_EXPECT_STREQ(test, strs[0], "string-a");
+
+	error = fwnode_property_read_string_index(node, "strs", 1, strs);
+	KUNIT_EXPECT_EQ(test, error, 0);
+	KUNIT_EXPECT_STREQ(test, strs[0], "string-b");
+
+	error = fwnode_property_read_string_index(node, "str", 1, strs);
+	KUNIT_EXPECT_EQ(test, error, -ENODATA);
+
+	error = fwnode_property_read_string_index(node, "strs", 3, strs);
+	KUNIT_EXPECT_EQ(test, error, -ENODATA);
+
 	fwnode_remove_software_node(node);
 }
 
-- 
2.34.1

