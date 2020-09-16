Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B8426CBC3
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 22:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgIPUeD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 16:34:03 -0400
Received: from mail-db8eur05on2117.outbound.protection.outlook.com ([40.107.20.117]:40800
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726893AbgIPRMy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Sep 2020 13:12:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GypOnwprF9Dn2OVPKDSYPLsVMKmzEQl8XhPzcqWluGfTE8w+Ub83y1gj+6jDQjIoJMsDTNJvL9kk+dYzsF0ceUEDGmhc0pOUHwOxkccYOIrd2Z0t0aVCsIZbWNl/qIXSFHwJpecumgxU10ppVRUKk11riU+q7JvSFRRLv+dYXDQbYh9exdDoVRRlixS3kIHgd+AtXr+rM8b6+y+Zc1AkA9Okr/zO7VZhjJP6J6A7cgP5bUM8TmpmcCw15auxDzNb0XGawJE3L8pmZIfr88CG37Ef4AwHVYb4999ghYmOhpAKNrOwhF9U1vMuP1NWRIdAB5okdM/bSKxmcSFXEU3PFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4edpkSGZvtAV648l35DK66O/ScldVzPwqpyxz9gwNI=;
 b=PstG5KMccxT5VAUaVJZ6amXRm3XwRPduKQPZVDSLFPccU9m2V6Ctyi6rouGgjK2S+M7BcV4RlJZyD+VgsRlW950RpHZQI1b3FNRrJQVcxZ5ZL81Yv1r12W0LqElU7JrEqJsjGuaGEOeznEwhbyWmP7Wi7KAin+yC5SSI+fxQpGQPeShEDst1hJ8wCCNj83Zn2zKITpQ3OhOgpt3QC8v2sdl4nOZZDRQfk7QEx+Dd3VqEczq/OyMQEJockkTfB92wlTunlH4V7cIEUwhLEE4+WohOYTNRdyMB6tgd64NdidXhQiEOcJkCWXu00RiMeuijGvohDRa1dJIkt4oO41BUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4edpkSGZvtAV648l35DK66O/ScldVzPwqpyxz9gwNI=;
 b=aLaciiaFGLnaVFMNLfFA6/eApdlVSPBIxkyysXtcMZrDaiUuQ5zJfQHGQcjHiu7b/zM3R+UHKxUyUBkHWh2nLsQinaTV3SaDDWfajgQXuBG8r03ICNCBv0+CiYem7Rtc0YCJXADhYURzUMuNW7rKGJlNWEsPr1C6oRlf5tDnd/Y=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:c9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11; Wed, 16 Sep 2020 17:10:06 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe%6]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 17:10:06 +0000
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vadym Kochan <vadym.kochan@plvision.eu>
Subject: [PATCH 3/3] eeprom: 93xx46: set type id as EEPROM
Date:   Wed, 16 Sep 2020 20:09:33 +0300
Message-Id: <20200916170933.20302-4-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916170933.20302-1-vadym.kochan@plvision.eu>
References: <20200916170933.20302-1-vadym.kochan@plvision.eu>
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::29) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc60716vkochan.x.ow.s (217.20.186.93) by AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 16 Sep 2020 17:10:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eda5539-d2c2-4a5b-d5a1-08d85a635b96
X-MS-TrafficTypeDiagnostic: HE1P190MB0026:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB0026422D7A8C608B5BE7605A95210@HE1P190MB0026.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHTx9euXqKIjDPbnNW2uamnSQy012oDUaiQHbB++8GSGl04pFTmPtu/tLu6AmDQ7heHbVpbvddwN9fOC5IEoDxV6Bep9vBlWTdM2+86EwmM8jSTMqI+ymCsgKs1qx94oBEJWqqouHe1u1B8K0mn3PkikWrHPHg6mRkVnG9EmM71O2JtqyK0JMyGcdcuZKjMEY5HySKYMUG/k3q1Wc+ZZl/stt3Ec7y3CpliTB+UD5QA/c7FIuehdxLwttEP/qsmDcif8EpwykiRtLGqYVcHrEQJfDLGM5Xz0IgyX+kppndyVFIrEMlm1a1vGduPrC+3ARg5sz2K9GqO3vHr19gKnGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(39830400003)(366004)(376002)(136003)(346002)(86362001)(316002)(8936002)(6666004)(52116002)(16526019)(8676002)(186003)(6512007)(2906002)(4744005)(1076003)(36756003)(5660300002)(26005)(66946007)(110136005)(44832011)(6506007)(4326008)(107886003)(956004)(66556008)(6486002)(66476007)(478600001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: uivpbaGcnv97iQkM3AnueYZbhT0AHYTKDZDEZrmAnniR6F2nyWZiHJ8CAbCEpz+oc7fGiUAh1KwWwggQ/xd7B5akwxgZ+RWE0ntzFcJ5ncEFjxzhAcz3G2pbr1pzN+oU3vjQc/18bk72TgBaiD81G9hjgdomyxoStKU2zd0XcJSv2PVcP0oKScTQocdiLYb+wv6/tjhPmHBrLEl5LEcZq+RwTIRzDFcJwgtkh+uFzruSwBBtzEU4TPBfalH6DrL4X6VAz6m4uzKpphFhRT3/BaCbIR/2SgGPuaFXvOODNYw3phcneRAFQ5+U9l8/HcqgaaW93tHSrB3W9yHrhXvPk9+Ml6JFx+BQLA9nVFc+tToCaI2cNWFaq1ZNLEbwKbIM6ZTnRpEd5m8n4FpZtstmFcCxbiXEimlTFYFu3eM361jYZ3Yn6F3EInWL66V2msu7+g2A1UnsarGuNitegj5Xx2BZNWn3YwCyA+jfLUpusSZOtHqL8fWz8ECzn0729iBK0CFg8Z8AqP6i6WVwf7pmqg/cGPzaXfAlWNCRvj3+lR8dsOQA2CP0mu3C8pQz2GKuc5O1giwLsaRS1EZwTMm24OV7xNuVvrMluxQnFVqPOE+OYRNKml4mi4GFuid5ac00t2w/atleAZ76QwA7BzExgw==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eda5539-d2c2-4a5b-d5a1-08d85a635b96
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 17:10:06.0077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VsO4xS5ItSzn75//q54B2K2kAnoXgNE1mY/ISNAbX4+9dI7uHS//3aFZO6Z8jI/gBlhQggVgAcP5U3XVfl+vtRC/Nq9bJrh4D/Q00Fk6fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0026
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Set type as NVMEM_TYPE_EEPROM to expose this info via
sysfs:

$ cat /sys/bus/nvmem/devices/{DEVICE}/type
EEPROM

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
---
 drivers/misc/eeprom/eeprom_93xx46.c | 1 +
 1 file changed, 1 insertion(+)

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

