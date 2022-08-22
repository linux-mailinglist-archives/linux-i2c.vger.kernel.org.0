Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7012559BDFC
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 12:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbiHVK6x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 06:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbiHVK6w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 06:58:52 -0400
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D3031230;
        Mon, 22 Aug 2022 03:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1661165932; x=1692701932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jBeEiHk1ILwd7T0QguL62OOtCR2zHUCuW2NIEn5oMQM=;
  b=K307zDWhyzdo8JNbGA+pMVXol3u123UB0ucPRp3rJwGXlBI+v/yRce8v
   QmhOGiiVFtWRf2mk5iJ8z29KDJ7LWQ4unDPBekjowEujOMBkZ8W15FC7B
   kZgV7R56KIAvScLktwL0ClLZvgGV8w8uZIQ7Ol4Kc5iaU6mbjAB9qofrk
   I=;
X-IronPort-AV: E=Sophos;i="5.93,254,1654560000"; 
   d="scan'208";a="232563806"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-7dac3c4d.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 10:58:40 +0000
Received: from EX13MTAUEB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1e-7dac3c4d.us-east-1.amazon.com (Postfix) with ESMTPS id 89DBC3E00E8;
        Mon, 22 Aug 2022 10:58:38 +0000 (UTC)
Received: from EX13D08UEB002.ant.amazon.com (10.43.60.107) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.129) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Mon, 22 Aug 2022 10:58:32 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08UEB002.ant.amazon.com (10.43.60.107) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Mon, 22 Aug 2022 10:58:32 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Mon, 22 Aug 2022 10:58:31
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id A2EA64C68; Mon, 22 Aug 2022 10:58:30 +0000 (UTC)
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
Subject: [PATCH v2 2/2] eeprom: at24: add support for power-supply control
Date:   Mon, 22 Aug 2022 10:58:30 +0000
Message-ID: <20220822105830.22790-3-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220822105830.22790-1-farbere@amazon.com>
References: <20220822105830.22790-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
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
V1 -> V2:
Change pointed out by Rob Herring:
- Use a gpio regulator for power-supply control.

 drivers/misc/eeprom/at24.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index dc3537651b80..a5e3fe1403d9 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -25,6 +25,7 @@
 #include <linux/platform_data/at24.h>
 #include <linux/pm_runtime.h>
 #include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
 
 /*
  * I2C EEPROMs from most vendors are inexpensive and mostly interchangeable.
@@ -78,6 +79,8 @@ struct at24_data {
 
 	struct gpio_desc *wp_gpio;
 
+	struct regulator *supply;
+
 	/*
 	 * Some chips tie up multiple I2C addresses; dummy devices reserve
 	 * them for us, and we'll use them with SMBus calls.
@@ -615,6 +618,13 @@ static unsigned int at24_get_offset_adj(u8 flags, unsigned int byte_len)
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
@@ -674,6 +684,37 @@ static int at24_probe(struct i2c_client *client)
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
+				"failed to adction to disable power-supply regulator: %d\n",
+				err);
+			return err;
+		}
+
+		usleep_range(2000, 3000);
+	}
+
 	mutex_init(&at24->lock);
 	at24->byte_len = pdata.byte_len;
 	at24->page_size = pdata.page_size;
-- 
2.37.1

