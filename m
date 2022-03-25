Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAAD04E7239
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Mar 2022 12:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356467AbiCYLfr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Mar 2022 07:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356159AbiCYLfm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Mar 2022 07:35:42 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6628A9956;
        Fri, 25 Mar 2022 04:34:07 -0700 (PDT)
Received: (Authenticated sender: clement.leger@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7BC6120004;
        Fri, 25 Mar 2022 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648208046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t7jG696msxIP+uipvIAwEjfKw2CtLhwybjn43oZI2Bk=;
        b=E3Y78V/6ViYdGor+Zi7veNZ75Wfj/6aczWRtwfYm5OXuROosQ4A/pbVfUSZKKK5GRycOtL
        qaHuoPi6N4oMqcCXh673Ct+qZIcMuKPfXZ7Qq/ZNaZM9k+JFbtptl4R7PrruN+4O57muPg
        usFJ2JhCQOpfUN7s5Qgzy3/jIyoamSeUWpMs8UWGOfOfGF9x04bO1sbf4aNHWrYghDoIC0
        J2+lGqph+k5iIxjZKiawakTGONCrAGeBX3opz5XnujJa79N92j1kw41AvbN95KEIOZa4Td
        mD7gCqP4DmV6Fng7+x4MxpHihzGnAyH3Keea2diZ8rYx7d6UHPvvs8+us945wg==
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
Subject: [PATCH v3 2/9] of: unittests: add tests for of_property_read_string_array_index()
Date:   Fri, 25 Mar 2022 12:31:41 +0100
Message-Id: <20220325113148.588163-3-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325113148.588163-1-clement.leger@bootlin.com>
References: <20220325113148.588163-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add testing for of_property_read_string_array_index() function which
allows to retrieve a string array starting at a specified offset. These
tests are testing some basic use-case for this function.

Signed-off-by: Clément Léger <clement.leger@bootlin.com>
---
 drivers/of/unittest.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 2c2fb161b572..d39ec2f5d2c5 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -759,6 +759,26 @@ static void __init of_unittest_property_string(void)
 	strings[1] = NULL;
 	rc = of_property_read_string_array(np, "phandle-list-names", strings, 1);
 	unittest(rc == 1 && strings[1] == NULL, "Overwrote end of string array; rc=%i, str='%s'\n", rc, strings[1]);
+
+	/* of_property_read_string_array_index() tests */
+	rc = of_property_read_string_array_index(np, "string-property", strings, 4, 0);
+	unittest(rc == 1, "Incorrect string count; rc=%i\n", rc);
+	rc = of_property_read_string_array_index(np, "string-property", strings, 4, 1);
+	unittest(rc == -ENODATA, "Incorrect return value; rc=%i\n", rc);
+	rc = of_property_read_string_array_index(np, "phandle-list-names", strings, 2, 0);
+	unittest(rc == 2 && !strcmp(strings[0], "first") && !strcmp(strings[1], "second"),
+		 "of_property_read_string_array_index() failure; rc=%i\n", rc);
+	rc = of_property_read_string_array_index(np, "phandle-list-names", strings, 2, 1);
+	unittest(rc == 2 && !strcmp(strings[0], "second") && !strcmp(strings[1], "third"),
+		 "of_property_read_string_array_index() failure; rc=%i\n", rc);
+	rc = of_property_read_string_array_index(np, "phandle-list-names", strings, 4, 1);
+	unittest(rc == 2 && !strcmp(strings[0], "second") && !strcmp(strings[1], "third"),
+		 "of_property_read_string_array_index() failure; rc=%i\n", rc);
+	rc = of_property_read_string_array_index(np, "phandle-list-names", strings, 1, 2);
+	unittest(rc == 1 && !strcmp(strings[0], "third"),
+		 "of_property_read_string_array_index() failure; rc=%i\n", rc);
+	rc = of_property_read_string_array_index(np, "phandle-list-names", strings, 1, 3);
+	unittest(rc == -ENODATA, "Incorrect return value; rc=%i\n", rc);
 }
 
 #define propcmp(p1, p2) (((p1)->length == (p2)->length) && \
-- 
2.34.1

