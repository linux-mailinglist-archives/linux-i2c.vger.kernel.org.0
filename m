Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1491B26C43D
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 17:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgIPPc7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 11:32:59 -0400
Received: from mail-am6eur05on2093.outbound.protection.outlook.com ([40.107.22.93]:50305
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726342AbgIPPb3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Sep 2020 11:31:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nyk0g/1Mpg2UAupE3vf7Vk6h2Xv1800TUfky7lu/ouOCBIY/Bwo6pI9kmn/Hb3lXao3q+PL8x8ddlFzGgC+I0DP8ETwG0/y7YnVstmzBN8oAVjASURRvdCHEdRHhI/0OPCiyR5OqyvOh9zi1h43cSewo4u1EkjDB50WbLAeP6WRG2zVL6nc/uyn2WEuaJfWXnxQkW5FP5VzmzwB85Gnkz2cxO1utjzqLBwPKMGVYslKTjI0ambpz3125rwzDAQLfL0qc0PrTN8WBD5cQ7/wTwyf2HRDLcgloG5xqNvwuqIpA65ps2MQ7t7PgpFdOc44JaqKho9bHpQFrJwoUlHzQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3sNqmu7CSIdff4Ln2LY2CUdz7g+akqc/mU1xeN+q9A=;
 b=br4UAusIbJ1rOwd23I2OQDbv1KpMmp5twCaX+9xHqYNupLTEsDU4MKLYE7B+McpxOULNR/44HNRqUxh+r0z25KHQ5Qh5kewf4jztlxWxjg0letedy9IG9YQQ6QAWmEHByhF3zWv63fuR/Ckl4X191Ap81a9RoC2Zh/iYm1UOX0Q8963b+wXQXahNUvg04pxasD+4PTByRbtNHKqEkjXA6DioFeLVOw9Lq+Bo/HOt0qJV1K3kIVWMItUV2Z8UZt/iU/dUZBM2pZcAcEDZ4EnhcO10BPem8ZjyF+n3m7AOS6K1hERar4fxEdqzpSlnYx9bS/MCoxz9hXPQIfGkVrcdYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3sNqmu7CSIdff4Ln2LY2CUdz7g+akqc/mU1xeN+q9A=;
 b=ApPYcJJ7i8O22WT3dQBzINW2pekcS4gRDDMvyi8DbPFTaycheBUw/JymaIIwlBWD2EU1R8Vx4rlCbsF05u6ewI9AwyeVSec0a5KWR13z/HHAN6Hc9sXUEw2rhoxlmgvW+8lpN9lMdEQc6nUTyhKC57yS1eyh1xxa28t2BIMFdrw=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0266.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:5c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.13; Wed, 16 Sep 2020 15:29:39 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe%6]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 15:29:38 +0000
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vadym Kochan <vadym.kochan@plvision.eu>
Subject: [PATCH] misc: eeprom: set type id as EEPROM for nvmem devices
Date:   Wed, 16 Sep 2020 18:29:09 +0300
Message-Id: <20200916152909.6812-1-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0104.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::45) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc60716vkochan.x.ow.s (217.20.186.93) by AM6P193CA0104.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Wed, 16 Sep 2020 15:29:37 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d5a75e3-b503-4b49-134e-08d85a5552fe
X-MS-TrafficTypeDiagnostic: HE1P190MB0266:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB0266B5CDE9BEE160955E311995210@HE1P190MB0266.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SA8/i8dOiHiQP/czQKGhBSM+AmIe5nL+ngiuvBRkuDYcoNOqaKWzoh+smEgZSELYvL99TGun7FiRq0hIUQvYOFQ99Rvurbq7Iv8W4g1TRoELmBYe0nFjOtVHyvYfpZzeYP4Ga5GojiE4ugeHcF/uQmUathJQDdkblTIN6nBraOPDU0v4uxtV69ToP7AGa0Jt5Ll8udhnHlTE8Dc355ecc4e0dfYIUpAzDpcfinPdWQGzA0/XqIiRw/3DTxjwaOL1MKKL8byMcOcV9K61JrO/4si2jH0XOXu76VN2Bw/5SizF6OBj2NEVS8/G0787v7GFpdrmlPbCJ9mJ1LketyP/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39830400003)(396003)(376002)(366004)(136003)(346002)(44832011)(66556008)(66476007)(66946007)(107886003)(110136005)(6506007)(5660300002)(8936002)(2906002)(6486002)(2616005)(956004)(6666004)(1076003)(8676002)(186003)(52116002)(4326008)(316002)(26005)(478600001)(86362001)(36756003)(16526019)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: WhufNuXSx5J7wfzi7ebAiAun2GW/DuhffcxVzo+bESfScMtghRkpqK+XU+S9TqOY8uz15QeUcnscAQ4Z1eYkKyk/PKSVJAVmXlx03AIluP0DbsnsaTVyzNFKBRxUfOMPs3+LXjxGgOvrQBmuruQki990Go368gxUa16Wm7drrSbrJ3lp1ybSuBoCi789YxT95Y65PWe672+ynpPKit/nwozxQ8fdVQdYo0ueLuVEG9Dy5PKecnVNfMIESGa4t5+1DMtrk2OCS4kcTvn6ptd7Reaxh6ulLUB72J+kGJ7lX78p/qfmwGQ+SzpJLsSxiAcG2TSHiA9F1tlDR/Q37rCR7IobYvHMsRejx17Th/KLKqhTaOSFYAlze0yY00DTNXjhW6phFMQYb3rlXSqZ5b1ds9BzuvgBQiF3Z9eLhza7iN1xWpbPHOb6XzQyxvOT4CKIhMLxxncLHs3O26Dr2BDgdAaDUxT/z9e95WqbVxL8dKF8L1HqHR05v5NXPyuNbqewAaeP/1KftXmd9+LX4Wf1olfZi+5mYk0avMkvP0j8fxHBms/AVVLjMne/Ikj7q6v8jWpUNb/MFph0gb8v69jHJ7mxvAV429X50NanlFIjiXgouLXae0GCI5KvBh87orUhsccnHroQ88+YZF/zIXja2Q==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5a75e3-b503-4b49-134e-08d85a5552fe
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 15:29:38.7795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmMQTbWjsaA9NMwmowc9xSh/xEmPfUCijYXg8xylN/fH6oQZjUeB5yzVFBlAQX99AFNJhhDD5YRpQ+FbccqWuQLlxn95AdvFTCiSUPqPJXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0266
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Set type as NVMEM_TYPE_EEPROM to expose this info via
sysfs:

$ cat /sys/bus/nvmem/devices/0-00560/type
EEPROM

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
---
Checked only with at24.

 drivers/misc/eeprom/at24.c          | 1 +
 drivers/misc/eeprom/at25.c          | 1 +
 drivers/misc/eeprom/eeprom_93xx46.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 2591c21b2b5d..800300296c74 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -678,6 +678,7 @@ static int at24_probe(struct i2c_client *client)
 			return err;
 	}
 
+	nvmem_config.type = NVMEM_TYPE_EEPROM;
 	nvmem_config.name = dev_name(dev);
 	nvmem_config.dev = dev;
 	nvmem_config.read_only = !writable;
diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index ed8d38b09925..3a586a7c4b1a 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -348,6 +348,7 @@ static int at25_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, at25);
 	at25->addrlen = addrlen;
 
+	at25->nvmem_config.type = NVMEM_TYPE_EEPROM;
 	at25->nvmem_config.name = dev_name(&spi->dev);
 	at25->nvmem_config.dev = &spi->dev;
 	at25->nvmem_config.read_only = chip.flags & EE_READONLY;
diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index 94cfb675fe4e..7c45f82b4302 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -455,6 +455,7 @@ static int eeprom_93xx46_probe(struct spi_device *spi)
 	edev->pdata = pd;
 
 	edev->size = 128;
+	edev->nvmem_config.type = NVMEM_TYPE_EEPROM;
 	edev->nvmem_config.name = dev_name(&spi->dev);
 	edev->nvmem_config.dev = &spi->dev;
 	edev->nvmem_config.read_only = pd->flags & EE_READONLY;
-- 
2.17.1

