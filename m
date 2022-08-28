Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75C315A3E75
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Aug 2022 17:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiH1Pt3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Aug 2022 11:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiH1Pt3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Aug 2022 11:49:29 -0400
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B7D32EDC;
        Sun, 28 Aug 2022 08:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1661701768; x=1693237768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o1iCKQTfAzwbHxPpDHXTrrf28wLDUKTFm7EouUfzMlw=;
  b=U+bDiffVivwcqudIMQrzi4KE1HzSf+Z01akknDuFVptd2oFbYjGj4BfR
   38gUZU+YVr5WCDqW7csSS/wtqsNZBJ8R5rK9HYgU3h5atWHjV6EIuEyV8
   7Vj8AchWhmJtJMDn0XrXJ3Kf9m6ZnSNwfJ/pyC8aPzZsBu+NQWW9MMw87
   0=;
X-IronPort-AV: E=Sophos;i="5.93,270,1654560000"; 
   d="scan'208";a="124085810"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2a-6fd66c4a.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 15:49:12 +0000
Received: from EX13MTAUEB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2a-6fd66c4a.us-west-2.amazon.com (Postfix) with ESMTPS id F020981652;
        Sun, 28 Aug 2022 15:49:10 +0000 (UTC)
Received: from EX13D08UEB003.ant.amazon.com (10.43.60.11) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.96) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Sun, 28 Aug 2022 15:49:05 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEB003.ant.amazon.com (10.43.60.11) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Sun, 28 Aug 2022 15:49:05 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Sun, 28 Aug 2022 15:49:05
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id DE95D4CA7; Sun, 28 Aug 2022 15:49:04 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <brgl@bgdev.pl>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <talel@amazon.com>, <hhhawa@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <ronenk@amazon.com>,
        <itamark@amazon.com>, <shellykz@amazon.com>, <shorer@amazon.com>,
        <amitlavi@amazon.com>, <almogbs@amazon.com>, <dkl@amazon.com>,
        <dwmw@amazon.co.uk>
Subject: [PATCH v3 2/2] eeprom: at24: add support for power-supply control
Date:   Sun, 28 Aug 2022 15:49:04 +0000
Message-ID: <20220828154904.20477-3-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220828154904.20477-1-farbere@amazon.com>
References: <20220828154904.20477-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add an optional gpio regulator to support a power-supply control.
If a gpio power-supply regulator is supplied in the device tree, the
gpio is enabled during probe, and disabled on remove.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
V2 -> V3:
Apply on top of v6.0-rc1

 drivers/misc/eeprom/at24.c | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 633e1cf08d6e..97f16c361474 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -87,6 +87,8 @@ struct at24_data {
 	struct regulator *vcc_reg;
 	void (*read_post)(unsigned int off, char *buf, size_t count);
 
+	struct regulator *supply;
+
 	/*
 	 * Some chips tie up multiple I2C addresses; dummy devices reserve
 	 * them for us.
@@ -581,6 +583,13 @@ static unsigned int at24_get_offset_adj(u8 flags, unsigned int byte_len)
 	}
 }
 
+static void devm_at24_regulator_disable(void *data)
+{
+	struct at24_data *at24 = data;
+
+	regulator_disable(at24->supply);
+}
+
 static int at24_probe(struct i2c_client *client)
 {
 	struct regmap_config regmap_config = { };
@@ -681,6 +690,37 @@ static int at24_probe(struct i2c_client *client)
 	if (!at24)
 		return -ENOMEM;
 
+	at24->supply = devm_regulator_get_optional(dev, "power");
+	if (IS_ERR(at24->supply)) {
+		err = PTR_ERR(at24->supply);
+		if (err == -ENODEV)
+			at24->supply = NULL;
+		else
+			return dev_err_probe(dev, err,
+					     "failed to get power-supply regulator\n");
+	}
+
+	if (at24->supply) {
+		err = regulator_enable(at24->supply);
+		if (err < 0) {
+			dev_err(dev,
+				"failed to enable power-supply regulator: %d\n",
+				err);
+			return err;
+		}
+
+		err = devm_add_action_or_reset(dev, devm_at24_regulator_disable,
+					       at24);
+		if (err < 0) {
+			dev_err(dev,
+				"failed to add action to disable power-supply regulator: %d\n",
+				err);
+			return err;
+		}
+
+		usleep_range(2000, 3000);
+	}
+
 	mutex_init(&at24->lock);
 	at24->byte_len = byte_len;
 	at24->page_size = page_size;
-- 
2.37.1

