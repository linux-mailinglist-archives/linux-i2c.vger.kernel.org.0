Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F055595CA7
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 15:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbiHPNC3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 09:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235303AbiHPNAx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 09:00:53 -0400
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29D286C06;
        Tue, 16 Aug 2022 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1660654825; x=1692190825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OMRMQgwvgYeKotw1UaJE5PsArWxM8zmGn3KgUNZ1AW8=;
  b=ccDZiMJkaNv8+nonaWcXcZNvXxA37orQyHztYH9es780fzGKUHh9AIt0
   cSBcvAKNkQ4oyiB7RUuk1Oe1vaFlhkNMyeC+tKK1aWpQBcHQ2TctXkYOS
   YzfuAq/N/gQXau4HkqqBRIg8jCG57nqgk981lFkL9uUuiw0Lp/t32uhwp
   I=;
X-IronPort-AV: E=Sophos;i="5.93,241,1654560000"; 
   d="scan'208";a="230216051"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-4ba5c7da.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 13:00:14 +0000
Received: from EX13MTAUEE002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-iad-1a-4ba5c7da.us-east-1.amazon.com (Postfix) with ESMTPS id E12C23002EE;
        Tue, 16 Aug 2022 13:00:11 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Tue, 16 Aug 2022 13:00:06 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Tue, 16 Aug 2022 13:00:04 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Tue, 16 Aug 2022 13:00:03
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id 480FC5AA; Tue, 16 Aug 2022 13:00:02 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <brgl@bgdev.pl>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <talel@amazon.com>, <hhhawa@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <ronenk@amazon.com>,
        <itamark@amazon.com>, <shellykz@amazon.com>, <shorer@amazon.com>,
        <amitlavi@amazon.com>, <almogbs@amazon.com>, <dwmw@amazon.co.uk>
Subject: [PATCH 2/2] eeprom: at24: add enable gpio support
Date:   Tue, 16 Aug 2022 13:00:02 +0000
Message-ID: <20220816130002.41450-3-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816130002.41450-1-farbere@amazon.com>
References: <20220816130002.41450-1-farbere@amazon.com>
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

Add gpio support to enable the eeprom device as part of probe sequence.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/misc/eeprom/at24.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index dc3537651b80..06535b9e1da5 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -623,6 +623,7 @@ static int at24_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	bool i2c_fn_i2c, i2c_fn_block;
 	unsigned int i, num_addresses;
+	struct gpio_desc *enable_gpio;
 	struct at24_data *at24;
 	struct regmap *regmap;
 	size_t at24_size;
@@ -630,6 +631,10 @@ static int at24_probe(struct i2c_client *client)
 	u8 test_byte;
 	int err;
 
+	enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(enable_gpio))
+		return PTR_ERR(enable_gpio);
+
 	i2c_fn_i2c = i2c_check_functionality(client->adapter, I2C_FUNC_I2C);
 	i2c_fn_block = i2c_check_functionality(client->adapter,
 					       I2C_FUNC_SMBUS_WRITE_I2C_BLOCK);
-- 
2.37.1

