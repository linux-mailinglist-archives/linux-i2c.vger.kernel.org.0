Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63EB64E5D7
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 03:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiLPCIH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 21:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiLPCIG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 21:08:06 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2096.outbound.protection.outlook.com [40.92.99.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126701F2D4;
        Thu, 15 Dec 2022 18:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgmRgkX5l2F6IvKELYHA2aMfdmb18huAV9RDnusBf5pyL8UfERIscart+skCyq7rR1Gw8AxElOkboTqbShFk3JWJRdXvWQEegE9QvfpKHKJackZkdOXjF4xQKd1siGVjvEIyCUZH5jElGaaROMXFBOIJLZU29ra21P9MG5mN2zwXuigjpzHg5bHH1ylpe4PuB75W0sKA9Dx4NHLnuV6bU1/KXVto6tDHkxhrRqMciY0pKgSf6FgkhIylLjXFO1oMN9R4EmoKuak4J1T8Id+/bCf4NoEMVfcocJKe8zAovmFVLYd88q3eiK1fPZfy+JYj1hWsnsPpK1LjVkkuwMyTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRBoKtjdVXvZxAairtRQ5ZUOGgga/fRmvdDTvHp3S1g=;
 b=H7l/bT2+2QyMaDDW7jcSYVnLRgFQmtBT9fDABmD3PucgenOVRWdiVoWEVdVIpmAsuvril04zy+Ip2PrduJHDdsAY29MtktJh++JYuix7ykSMUmWdiibxS2oCLXFEDyo6bMPRKgz8ZPvTgQddNzGeLaQVD8RIBMK0SO2ON0EbjkWKt6rJCy9nERckRH3s+LJgCe/XGF8hi7cN6DzEe6H7M3sUEwylF32GMMPFijWfCpAr+jNIrEDqrELNQlQT2iI5P6fGHOzyjy1T9y/UQbvLDQAfQZXCjVhobTfAAd09uM2nlJ3MY6574M78tLIDg5GhNT5UlNiW3qHYQ2wPXvXDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRBoKtjdVXvZxAairtRQ5ZUOGgga/fRmvdDTvHp3S1g=;
 b=otUb55FVMRGXRG7DNnhY1dEb9V7n4gnpyqgZGZL/PNmIxfcUF4CHD4U2ptfeVLm9vkDu8a284tU59EvJ2iIL9rxTmTIGY2Aodae9Akpa/eY1q/3giIqDzlYkfRU7H0RM9uOAPRL2BxS0FQZXgrtKmkklMfB7jsVf0hgVfwmo4SK60SbS1F4tzayTBwZ8mQDNXB92vMXiCoKong+VbeEJCEsECoUjMGKClp12tvySa9AE4WGQp0iLns1rnIwr2Cfvcm42kIbXhDns05y9RgjPg1yn/Fjkyd/c8uMv/QQ1XHcPxESUZdkg0lShIXKFgnG/8Ot++m0mEpxT42vcpzmJ8w==
Received: from TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:242::11)
 by OS3P286MB3404.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 02:08:02 +0000
Received: from TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e566:67:ec47:5c3b]) by TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM
 ([fe80::e566:67:ec47:5c3b%7]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 02:08:02 +0000
From:   Riwen Lu <luriwen@hotmail.com>
To:     wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        xiongxin@kylinos.cn, Riwen Lu <luriwen@kylinos.cn>
Subject: [PATCH v1] i2c: i2c-core-base: Modify the maximum idr id for i2c adapter
Date:   Fri, 16 Dec 2022 10:07:51 +0800
Message-ID: <TYCP286MB26079F414019C8AC9303E412B1E69@TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [OAg2g5bTPv2JUWhwUzeNg9e/1nCHWIAoK+4NL9L4bDs=]
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:242::11)
X-Microsoft-Original-Message-ID: <20221216020751.883157-1-luriwen@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2607:EE_|OS3P286MB3404:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e0752e-dbd9-4e2d-90b6-08dadf0a5c4a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e2Ftcbjm72Z1gnyexkWWA4wtHTnSbseZvXfoiQVHmSPZn36HF0uHDweFsXYrgGsuWJyJ3s3YrTNLl2TUkAHTdnkc1lXGdQmrrgExfS6mE73yst6pobbf1U3bkxHO0Gq/WBIHjrkNkx42nhrIo2dO5dpZ9drv0OFS5lhw8Liv+kHjyUcF5KDZqvPYYPt/ez15zJFUVtpha/KpldLJLngA+8wJPfkKBODidCt7aPqAtNRXBAj017+L8PLi9BQwFNeJT/csxbv+eEXfb9IcHBo6M+1GLC4lfVAygCD1pjuQMyZewyMpLW8uMQTcAY6VaORmE+gErg9rlUcMHqgppxsD3XlMpUKc+JPICGsHEvbvmydBkZqFl/UQJ4EsdunBH1xABXF4sN9TceugiX/Aaa/c3ZY5coG3e0DuzfTRu/BuCT/ER5FR7acowYejp9d6kHPk/OtOyMCpO66MVxAzAwh6CEH50mPKEzdLwgztU7lQPeu5hvJzOfbrDlBTllTmIR46B618cCborMPC8UqkAG5jWMq2QbTJ963Uc3IpP729sePi5Ppfhe2Lc+AMaPUh2djblQPkBjpZWcQTG4XVnQmMdzY5Dcr/bxKkpW8l49Oba58=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xi38MIplbPp36GUlMAdGfpOn6in1oAKdToWpooq4KaVtpHyyP6gBSkHbAjEQ?=
 =?us-ascii?Q?Li7uy12ihslFRIC2uEt/NqcDb5aORa/i5ilB8V6XBp11vs7VOdyyC1/CEw++?=
 =?us-ascii?Q?i9nHd88Lwg1dqbXIilcAaEXxFpqgOjrhCHEiEd6UOzfsBpby+tMlynt9tiy9?=
 =?us-ascii?Q?W0UoPSbQf4wAdxRr42AisPWOBAZ0Gn48ys1uzs4rrmHapbx5dh/C2sI+5a4O?=
 =?us-ascii?Q?X9SbkE4phDcPA/s0P3s7o/s/1EOs8ukdrg0AZG3JhjOmHnrhqVcP+IwNU1ba?=
 =?us-ascii?Q?SwF725yJ/1aOGZ/86EBShA8ojfEyEwHUIc9vEvdyMr2Fp7FV1QCbq5PE+P6v?=
 =?us-ascii?Q?6FIueBiQkyXFLry3TdOsjJTrojral/SibkenZUyUj4hT5VO7S6FaT4gusAqJ?=
 =?us-ascii?Q?f06D6G6mFyR5nIBW3KJ8D4Qsx67j/DDLg8zVuVyqLyP+/ZljLfa8hyTo8YTu?=
 =?us-ascii?Q?e+ldcIkwfCRqq8dWcQeVoPLXOAiSDeLscXki8gJkyTIJeHY2emH5X/86MchU?=
 =?us-ascii?Q?QEpNvbT0OEd14rUGoPw5JSkWKWMLN47vVWD0oIBRNXA5Pz0p6ncwys+HAL9v?=
 =?us-ascii?Q?SIK0QYFvs07A86sZnjhwABdqM3n9g0Vf3V4FHuyJB00LzP1aNLkSxsXdqiLB?=
 =?us-ascii?Q?tvgQRk5QgQQ/6C8L5vB0DgjnSjDJXVuJhidPyqDCDMBsZIpQVRNhu+AIFXQ8?=
 =?us-ascii?Q?RE7SOMnKt1fRZD3tNyLNN8Ua57nV+VSQOPYJlZ32qQBp9g4YSvSJnuAq6NkZ?=
 =?us-ascii?Q?S9KiXHOZMBAIecJw0IZzUwL322a5oSjzfG6E3+xwkuOP8WvCOLmhLgdrR4gC?=
 =?us-ascii?Q?plHI92jfS4AcfrviWDfyv6VXq6XxXjnRIlvg5j/EofzccOPuE9s3M1SJzs4f?=
 =?us-ascii?Q?ZcatR0oLWVFEcxplorxlySHpwVmUkFlDF/4tgHz/c6zfAOOw6QTVy4XKQDPk?=
 =?us-ascii?Q?Ypy/KHznvljR8cb2EN1kjI/xrUHHggeZjkgtyd1RGi2VuNUBRbT/9wKkyLaZ?=
 =?us-ascii?Q?XD/57LYVuWWb1EL0LrUsFALQo/X3gQ2Vnc0EDQDKR5mbeYWx3/saVD/OAdUF?=
 =?us-ascii?Q?SAkrupe0OBOvw3Ii2QHRAGasY39q5kCBjfjlOt7QqJstJ9Cr75+4kcb1hkvd?=
 =?us-ascii?Q?/cpaCoYtmeKLDL5lpAWtwtNd6WaUQ+v26VdDFRaa1E4+s6azC6aICFOYrnQr?=
 =?us-ascii?Q?sEiIdEUj8BjtE3Qivqu2nYqYNiWHWYB9nZAsda15uK5vD7baG5oNhQXw/pTC?=
 =?us-ascii?Q?HerOmvjhD4adgbMRzmU1c+N+naGob9s96oWZR5KkAg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-05f45.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e0752e-dbd9-4e2d-90b6-08dadf0a5c4a
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2607.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 02:08:02.5194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB3404
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Riwen Lu <luriwen@kylinos.cn>

Change the maximum idr ID to INT_MAX for i2c adapter.
This fix the following adding i2c adapter error while the idr with
adap->nr has been allocated by other i2c driver, and find a proper ID
for it.
[  357.620685][ 3] [ T3655] ------------[ cut here ]------------
[  357.626544][ 3] [ T3655] couldn't get idr

Signed-off-by: Riwen Lu <luriwen@kylinos.cn>
---
 drivers/i2c/i2c-core-base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7539b0740351..c2982861057a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1535,11 +1535,12 @@ static int __i2c_add_numbered_adapter(struct i2c_adapter *adap)
 	int id;
 
 	mutex_lock(&core_lock);
-	id = idr_alloc(&i2c_adapter_idr, adap, adap->nr, adap->nr + 1, GFP_KERNEL);
+	id = idr_alloc(&i2c_adapter_idr, adap, adap->nr, 0, GFP_KERNEL);
 	mutex_unlock(&core_lock);
 	if (WARN(id < 0, "couldn't get idr"))
 		return id == -ENOSPC ? -EBUSY : id;
 
+	adap->nr = id;
 	return i2c_register_adapter(adap);
 }
 
-- 
2.25.1

