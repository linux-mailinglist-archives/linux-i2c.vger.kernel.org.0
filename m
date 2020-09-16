Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84C726CBED
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 22:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgIPUgi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 16:36:38 -0400
Received: from mail-am6eur05on2116.outbound.protection.outlook.com ([40.107.22.116]:47200
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726867AbgIPRKW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Sep 2020 13:10:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdyO4H3/ao8RnZEIf7KxMecLoYM4uek6fodG3XopBEQd1liG9WmUe+97QQQRSO/g4u9TmslVNhXBpWrAKd2jRamlM4I5HlW8rmmLaTmcjDf2dEt1qaMicNyelOwpkr7AgPiGB0WhD7kcoigf5vYPUymA7im3pMTOcAcGoEdd+4ByC5d7K+LnTG52fnBBAP6tWO1ekNNaLtPqLhVYuc/6Mz1Q9tHWMciThfE7kLj0gf0MpsdTkjHjD74/qsq93PlOZ4RQx733Rkg/C2SUoIo9nxNPOqTvkjenOyjZNw4tpZCA/Wfu1WAX+/ETAxg+lfzVFapxncPNNpU9pHcUA5tWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mOzgykzBzQKhaZ47+hqwYZ8hNLpdnUFXFmmod1yA8Q=;
 b=j6dmnbw8hucd30WQ2WlfiE8STckDL8WkeElrngl8A2BrUfeR6d7Rb0mOu5S1WtQO/ETcCyBTU38fXUvHS4WKO0jZiGjxY1cGiWGFMSLJys064sbT/g7Q6GM1VKOfEO7J1UTyrnpqXs1211Dh3m5nB4+VaCNJ/VG33C3aQh7PD9oc5cUHEiVj1ocW87dO38DKfuoukHd80m6r/EviQZFOABHz6i+VsywzblgKet/UtdjF11V2Z3u7joPXfaPUXM9pmQj6Ouqk04YIqAf3UVTTEHwb+bKZaPKS/khm9cvFQ1KQxx+AcqnxJnmPPNK61LR12Z79u6mfnYZ3l/+zkeBTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mOzgykzBzQKhaZ47+hqwYZ8hNLpdnUFXFmmod1yA8Q=;
 b=dseKGoWFvYDWjBnYMJhcSS1IhVsGJIopZQWTGujDpJyN0bq4T8c9l0cGnOUoVL2r+TyuV14xsQu/AWt6X9mIEkd42wBItaW6FuRPoeCy7o6JR/uFbt/BrqTweZ0n0DScxywvR808YSk/cZiSRXYg6gyjonuUpZwfvtBDic/ysVM=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:c9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11; Wed, 16 Sep 2020 17:10:03 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe%6]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 17:10:03 +0000
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vadym Kochan <vadym.kochan@plvision.eu>
Subject: [PATCH 1/3] eeprom: at24: set type id as EEPROM
Date:   Wed, 16 Sep 2020 20:09:31 +0300
Message-Id: <20200916170933.20302-2-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916170933.20302-1-vadym.kochan@plvision.eu>
References: <20200916170933.20302-1-vadym.kochan@plvision.eu>
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::29) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc60716vkochan.x.ow.s (217.20.186.93) by AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 16 Sep 2020 17:10:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7064b249-d06e-459c-688c-08d85a635a36
X-MS-TrafficTypeDiagnostic: HE1P190MB0026:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB0026B2BE778FDDAFE2130A4595210@HE1P190MB0026.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vy9OzEN4QuRG8EE1rYlp8uaZk65OH95fJfKiIBATyKtc3vPwOtYjEaYN50VjVnuwSpMUfq5UoBI9IFnDmkEGn3Fl2v/AjI+9BtAuyVK6BV8IhW0Kln0JhJl/1LNJLHsDKWaAWeptZUOLcRzpSRsp5l0IjYOZA3Yw5BborC9SSxAPLr8dburbdkRztcHlt2LBm4lq8C/rPyo/XryAaE0TYKBH5MLGpfmeDfPatwB3vm9OkpI7/ol2sT+Aa96jmb8QbJ7vMQNUVIgDyv52r3UL4v5xRCjCBT84Ey0+2ca7HXvA5/5CtOPt9fR9BoAy05arNAM49J+ieGay4XOvl/vWXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(39830400003)(366004)(376002)(136003)(346002)(86362001)(316002)(8936002)(6666004)(52116002)(16526019)(8676002)(186003)(6512007)(2906002)(4744005)(1076003)(36756003)(5660300002)(26005)(66946007)(110136005)(44832011)(6506007)(4326008)(107886003)(956004)(66556008)(6486002)(66476007)(478600001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: DsqBjJ2IdhY5FLcnT862uCjO0ALizFvv2e3rVCj8coKkGqfgmiY+mmyXe1b4wtDWMbOIoQ/flKQvDY9grpBGmNf7wdGbZ/mJLTaPN5acVSe1Tzw+Gx3TQPgUn2nBo8ZTJ6pcLwNZUQYRyN7gctKIQfU/RmU+dAE2/Ro0fQ4PqKt2MqD7NITYcygynrNB2UlhElcmI+XNc8vghP78OEGLitRFta5qwtxa0F8aHFkhPsxy2479nsSh22Ia4KPfghkjvEUluRihCT8k/hb4gmin/CHi/5OS4Krrf1txkhu8qJg4IfurNF4sVGj5uYHM8h6zHmAj1/8nDoN6smQ2uHgGV9oZLRZXvvl3iHp/sfaYOyJ3VQltF7Bi8QpokZXMuPFGPs0Zt0U328YQ1ACD2+1KepZinVkhNW4wjVoaxomR97rt6IH4oBCmIC3i1qCzWPPPbQ3zcrUOioa6PiueOiGAofPfMxcig9kqInaKd4iAGg2HN2ZQJSDnZLVT4XD61ZqtWS9gNRVg6E/cyA8oXCEpr8bcWBY91bYx/B4xDFIhz34wb5TmNdKsJS59yFLtsbTj0aALgxaIOM7siPw0p1VnXAKUg3oUrftfp5YLzX25D6B9ofU/M/lgEzk7IigVILuVwrzjYqWI4zoVkYrKuPHX8g==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7064b249-d06e-459c-688c-08d85a635a36
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 17:10:03.7221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/gw/momynSgGSI71Gwh1HAM2d2N18BUf+wMfujKlh8QdwgMokre8pg3Fjr+kLXs6Eq6fXgIKJnOfl15hl2Uywf7pE9ycmQtsLwy0rVMzlI=
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
 drivers/misc/eeprom/at24.c | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.17.1

