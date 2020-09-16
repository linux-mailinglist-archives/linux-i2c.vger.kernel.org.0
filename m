Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2897926C5BF
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 19:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgIPRNX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 13:13:23 -0400
Received: from mail-am6eur05on2116.outbound.protection.outlook.com ([40.107.22.116]:47200
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726883AbgIPRK7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Sep 2020 13:10:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZMG6c/BSuHXKZA0s5TfYHnGovm4lXKsfepOhVYyc40PnFxEIboct85UduFVHf6DDy/VpNz9lXX5VWeFXAQY32Impfqs1SeCGOXNCTr/eu0FQCptDyztn4R9dm8wKj+G2q/SuCbuEKack1kOQdNl4vJiM4V7+29bDP0RwL+Glas+pjWnbBKnRdTEVNeI/8jT00hGBrpYH1be1NNidWvKxmDphbO2ONyiG8+M5dqZsmQHnpHRGVmJu9Yrf0Powzb4iP+LS7IGT++G0o/mzOEXetic1Y1C1AsQAVXSxd6I2ALsBa9US/eGR+Rl/jdJ0qoFtm/653eQ1zRqbGICIsEPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixZeWA3OLBC/FUH76keXGGbyzodtrG445uLdRTBQyJE=;
 b=So1Z1Jo8QzwRD9gAj02wCmYsHxEUFh7gWX7o182IhElfZpwN0xPM8YCucyvAEko2WTfouf7s+3jHid6R1FarbsyaYou/4K2HvvzOx0OmlT/c/99UBRUsPOuMvGrQccwOQdJMyiTo/OifmJFH5zAxccVw9WcafrJoTIci8SsEROiia0JvMjA0Tp+R7LNQKFemgpKHtLir29RxNsa351eqtBKRIx/77twGjAoMKfMn1QOjdqzztAlbJA3gkj+vJafi7M34V9WYvhjYeo3D65vlrR6BKDOAqlyQ33BIkI+RVIL8CH8SHaRv/LXMyCM+Pz7NOmljn8MQHFXoE21V8l0E7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixZeWA3OLBC/FUH76keXGGbyzodtrG445uLdRTBQyJE=;
 b=XR7ssSnhg7DSllTeA/cdr8K7x4TggDW4CbViuOoygXs0HVzkt/gxBIbrYLdz8SBjRlgan3csXN9a+leIPilammT0EgZR2ykcn1TZD76POt/yXzOm3JhGVPVYKStisIuuhNySREBcG4iEi4xTKN42c04bwd5CxeP9rl7MiIHCTXM=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:c9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11; Wed, 16 Sep 2020 17:10:05 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe%6]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 17:10:05 +0000
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vadym Kochan <vadym.kochan@plvision.eu>
Subject: [PATCH 2/3] eeprom: at25: set type id as EEPROM
Date:   Wed, 16 Sep 2020 20:09:32 +0300
Message-Id: <20200916170933.20302-3-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916170933.20302-1-vadym.kochan@plvision.eu>
References: <20200916170933.20302-1-vadym.kochan@plvision.eu>
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::29) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc60716vkochan.x.ow.s (217.20.186.93) by AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 16 Sep 2020 17:10:03 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00a03ce3-d2a8-43ce-00ae-08d85a635ae7
X-MS-TrafficTypeDiagnostic: HE1P190MB0026:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB0026260A0358E01D542B269695210@HE1P190MB0026.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7K6U2e88oZq+9YtfmMJqw1ReD24SV8A/LXhSPY0vz4CEt+ZPUhuvoO8p8cZaei0zHsKhkUuJUxu9ae1Z765BfG8B5YnO99e5guxUk+BO8EoQZ+/x2P+VuPx08doUeljHE3u3fnjXg9txVMs1gYp1efoPE67M0zgRORFSFydw87sKto+/THnpKrWItAyw0SNzT+suhS0qa1RzhJfz9Il2p+NqENHpL3cVNa7IqS9o0RRC/s5IXKMS3+O5gdTLeCZzSMmDT49NpSnTxCE15x2NFinCavEPJx1z1+zZ8Vusybs/M485NArfKRZBk8MMiDnPE1Mbkts1Gu8LNAjRc0eSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(39830400003)(366004)(376002)(136003)(346002)(86362001)(316002)(8936002)(6666004)(52116002)(16526019)(8676002)(186003)(6512007)(2906002)(4744005)(1076003)(36756003)(5660300002)(26005)(66946007)(110136005)(44832011)(6506007)(4326008)(107886003)(956004)(66556008)(6486002)(66476007)(478600001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: ZCVqqX+QG9c7fUfq7N+WObyjOwrFPMyOo9xxEz+jSrJdKj37AicwYyp6RqaT2eYY4sOKUbYrcUv/Ca537xaWTl/2GpXrov6THSBkchvhGlj+qlVOQUVA/GY+fGG2AOg/QX7R4Ju3dTpJkyZV/JrCJ0qVO0UyabjnPozyvJpX19Nfa7RwwJOYT7N90hhzcRtc0//DvFGFon7sTrh+wGQ7CUQAg2GlswdbB5DjLEIzQBXRjCdm5qRE1araq0h0dewJs1Q5acODL88Nwtkbeqsy4nhdIyxQU7UAsqSNst+V/UW4ZJwnwvbFRjwNplfL5fpF/++B5wDg3kSFoS0XKthYxbqow6ker8j5mX7Y/6DMfC/0VrhQbe7+V2GLi8OSRywRTMtJE4+RoLig2q6TGZhCPt5jYNF/zdImo6XKCTSv1f77Pjnp1KFnLvu6BLPlN4QppNIO/aR1h2AAzRy05vkkE0ul33NuAKT5SM3hRxsBhvvOKYln6ADrEeYpYqSMNZT6EKgFplAPKHeLhIT8EFlPrAWzXmmV8vyWSJkT+rY1ZKbwQOVTsFwup7M/EpU8heRviE+hTAbw271asBvFz47UdrY5p6xuK2O6bxhyoHH94UulC9GRGF1P1dv5aN0m1gR9waOP1BhrSL8UI1hqoFLsSw==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a03ce3-d2a8-43ce-00ae-08d85a635ae7
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 17:10:04.8594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBN3qNiQBWIPYbEaKCRbp+ke0H4NZRb4iSRLtLEa1J0ifel+cBxM66Dmjjk6nvk4ZgIkwjQSTH/mqObAOLaoAAhy5iBnzuZgtm34Dqr7dNg=
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
 drivers/misc/eeprom/at25.c | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.17.1

