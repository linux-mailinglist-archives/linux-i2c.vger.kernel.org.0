Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0A35F2050
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiJAWZ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiJAWZz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:25:55 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2055.outbound.protection.outlook.com [40.92.19.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F462D1FA;
        Sat,  1 Oct 2022 15:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5qTqJJd/Zbxfx8hdw7XWN/3rTMpF2cuS+HWw5mKBOZzD6I7zwH+kYn3RsaJui7FLTGEpcvf3wnMvrRrQ6t9C6pgyUiLYssGHQ6RgN8/wP4td5iVAhMX35rrRj0P/KaLQ3OspwGk/5P7ifUGtL3cVEesdcwUl3hhjgCsu40YY4rHSedn1tmX72rsyD60RauG2+exKGCubfdlZibs7nuI2PZqLpIRXM/vV3oWUVjEXptH7M78/ZRziSu6dwdX1EVcdCcOYeDVp9W976j0SFIHkQVxxoEQqNASDFqw9QDI1OU8FrUG6z0TklOSD9Rzku6LucYHboEfloktYMP78VR+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+306KdYT145mhgKNOTZrljlJLjsfUJT0g3OMPEX1a4=;
 b=AZDYeZnTgwvpv8lwpkJtl6/GNcH5MfQPogvSPlCu2tVoZS//xzp+03Y3f/SJw0Y1qblDXT8UC4ns0/vN8FrxSK5mOqcijZ9zVW/ZaE7bh8RmNa+j4xJ4K5zo0VjbpzJU6KgWbVTAnZ0rW7/w1Vr7qhw0IL2acXpALNu8U3xbxR2nXSJs0/x5nIVPZDoF/tK1jxNe/TSQK233ntU7PGs3avAZcNEjxs/wtZtShBdHdmMgIGg5lWye3jXx+onEUU4Lb1U3nC9CT1JNzj775C2GCS3zz39gjdexfH4bHIbxlgTvFDPjtbze8VXaB4n4ifFFAueB1kyM5GY8xN/7ta0vZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+306KdYT145mhgKNOTZrljlJLjsfUJT0g3OMPEX1a4=;
 b=g+5rUop+pa4OYfNcYSJrOikZLqmTL8CWrX4bMlptaTzYMQdMjVr0EtBaIwaJP4642BOup8zy7vEU5BjKG3FUxg9BaKIKqQLBOn63XCjS/SLamNwGkKAiRJ4cDxDLTe9uclo39QV5QaLYJZRNYbCFqzg0g2KQAdGTnYnKFDH7VGumv/VxMjrelyiM3t1c4TXF8bUuBd6dnlQWXl/CKa0avioHm2LCiY4rfzM+Tp2rHfGGkK2CVCKO4sY8XekTLY7oci81TPP+bz7bViDzZusVVgnchI9FUQgTGVga8xn8i+cGEmUoeILD0i7NB9QFzgD08D0Aew2BNwHAhYjNBuWweQ==
Received: from MN2PR01MB5358.prod.exchangelabs.com (2603:10b6:208:117::26) by
 DM6PR01MB5578.prod.exchangelabs.com (2603:10b6:5:17c::10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Sat, 1 Oct 2022 22:25:51 +0000
Received: from MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::3c11:1e6d:4c2b:c8c7]) by MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::3c11:1e6d:4c2b:c8c7%6]) with mapi id 15.20.5676.019; Sat, 1 Oct 2022
 22:25:51 +0000
From:   Arminder Singh <arminders208@outlook.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Sven Peter <sven@svenpeter.dev>,
        Hector Martin <marcan@marcan.st>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Darren Stevens <darren@stevens-zone.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Arminder Singh <arminders208@outlook.com>
Subject: [PATCH v2] i2c/pasemi: PASemi I2C controller IRQ enablement
Date:   Sat,  1 Oct 2022 18:25:31 -0400
Message-ID: <MN2PR01MB535821C8058C7814B2F8EEDF9F599@MN2PR01MB5358.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [/LCd/AQbYy1R09ebhcUzSHx0jSuTZy4T/je8E52It9yvfWHGCYMIIkAUky8zugrT]
X-ClientProxiedBy: BLAPR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:208:32e::10) To MN2PR01MB5358.prod.exchangelabs.com
 (2603:10b6:208:117::26)
X-Microsoft-Original-Message-ID: <20221001222531.870810-1-arminders208@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR01MB5358:EE_|DM6PR01MB5578:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c733bb9-50a0-47ac-caec-08daa3fbe5e2
X-MS-Exchange-SLBlob-MailProps: ymJijV9pwJkn0EBXIE9SfJLm+nWX9Vm94k3OzsLzm0CWMzQcKbsW/aPwCIqXle/2QjtjeAn17Um9EET2me2shgrTjZtdC7tSS3ypYiZXhsAxA59RtSWCRO4wY/VbmmqW6sCH0QAQa72DPZY6Mz48TaBVY7T6LdmhGV/mzxl1NxIlG6WoGhZn/J5/BGynKdj3YlDY6mNhUsbHT/aO5Fj8QEs4LzR1emRS3KHl4FD7ipQrcNVv7+t8LpICNn3jzYim7JL7RIjOijNlfkmSVpTWRMleehsp7lyAfNPnkOUttPDk6HsiD7biDqQR8X7EvOcxtl6kPFehkfhfjEs8t388WplgUkJk7ReYN5shrOZJ8+ajPIirM34fwGg3IMy+zqPgJrwEsiMsOVnfehe9/LZGg0E3rmb+ZGfNhMbJba/pHg5xprgSuwITmcYtv7ajGjwVho08Kgjr0PuHq9Exp4iKEP3PrR4emYpgVKIiAkzDa15fp+2EnAmItmZ4R1VC5is9mhT58w1nmLeScScc2oMhFjkia6vjYT2vyekt1iu05VugL8uBlR7+/rFNds7wZqKFLgvht9nUqsCmAt8kxORYXQdovfRPGQbl1v/SwEOiGfDg+SLC5J+O3aTB4BsuXDiWuPdbEFNq0W9B+j/cpzggedzZjRQn5YG+x4s8VF2HtJrhCZ39B8YvZZhLMWF8BTbsw1DD2sPlV9BVJZPRpDOookkjoi2UlLXWEPvp10vOjyhrpMia6YSMFZHc0EJwwEqm5t2Dxfri2szWKmFovIqkNHITI50vi4HsAo+5h7+CQ8YVDG/gKbys/uOk2HhvhSfJ
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4XWEurXuBXcEHwgdr0zHHpjcneu98VaaUja71pSE2Ju6lD2Ag/dTdg5VdV21KLvG3kfW7dmC/FoWhHMuSpPKUEKD9/LDqmRGQV9JJhf598ze3NcTVRsKpLG+UGeOY9d0pCGtiXy+2HkeLhM5G3kIBQAcqfOR2cqLqOmymDko/gc2jeEf1z6Lhngv8LV2plRiymlU89Q38qOYRfCkFLFyxXCfXXHcAU7NUEcYdCX3Ktl0Ao7oCBI8zRS0i7hv6jdalnVKoB7f0ScepcHhq9OMeQLITStilKlWh6q9BhfrGz4HAHx+2e3aOudElS6YvItuI6zi0a89Z7LMgHeezW1PJ/EwTGloUcKQtuGhx1yHnTuYZEIto+fJJh3i7gLRye4ML1/MC05sGmtAeLIq5e14x6jdD0Cs9Yn2y2e/QbNNzHiRgJ7idKlTU/C2kKGUh3Vg1q7ROv5k2DohkTFXAubWdni9z8K2sAmE1cySa0ZjkyYWCR8S3kvbcfDHLKjiiq7e+JAHutakArq/Yx1ivFD8UdbjhYVmre61uVzl9yV27LZv96hndP5Ja7b3M+I61Ol+/SONcWEfhxt3kTeZjUEEhGTpwiPugFB81zVv0Nj6TgpldQoX4NdNv2CQSrDSeuYM+dcSJ8AoeweFrCa3ImWwfBG5q5aP6bEbN4q8aQE7F6RLxV/zVLj5Nzx3VESmdi+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jJUTxrC+74gG7mYV53gVmnAT9q7UQwDY7fePgEsCPWnXzsEgo8qdyjbGEkeo?=
 =?us-ascii?Q?CwrCiz2eyAEc5+pKFx7xpflxhUAHPTCy0fIz2alAP2K9u4m/Z5Kftjclmqnj?=
 =?us-ascii?Q?v6fQUxSi6O4fAlJeZByrrDw8k7dw7aEIeFlZGmQuR346OPX5nfeKHoXzVOe5?=
 =?us-ascii?Q?fK7r9JyBtyl3zhgOoXGKDPHHG0V5GvuP2ALNnM8eXQeiVn84fIUrvwNg2efh?=
 =?us-ascii?Q?tfFTfLmBSD4hA6G6whmELO2hP03RzlEzMX5hm9pAy2WUYGGu5F1I5ixoApr6?=
 =?us-ascii?Q?tsKO9vpaUbcq2zeChYXx9hsxbJIrOp0rn6IyCv8oxb51cNr7U/d3NKYWJXXJ?=
 =?us-ascii?Q?+CAo3A9J7/ExoWJYs5YBAu+GW3uDmXatOw/WjOF3+i9NbabgTPiHokT2JqRK?=
 =?us-ascii?Q?OuCcTB8NfcRzIJvDgldAjB7kNEx/EH7YSCo59IxyxFVMp9Sb5heXnTSHJ7Cx?=
 =?us-ascii?Q?BnQWrPpjEkidT0tnXCY1Mj9I5cpDGCNpTRswuJFcXFzjx+bX4ajU9MGu2sqR?=
 =?us-ascii?Q?z43bRU294EOx6Ql+Xbc9o40AoksiNaDeVKjD+TMRlwnLn5QX0Al0HsigoJuS?=
 =?us-ascii?Q?HiNuOI3uhIPnTne+lHzHnD+1QjIa0r/7GyPWlk4yoIUp6CvWyqpu8s3FAGgz?=
 =?us-ascii?Q?61IkqK0/fd6cq+jxbLpIak6QhQ9Rvbwk4BNxe2bDCI3fbYKUWYWcXZr9VT2/?=
 =?us-ascii?Q?KjF83tocXmkDhE9v7HIz3V1pnCAznAnApqZfIxdK///fGBZImv4eMRcJldyr?=
 =?us-ascii?Q?4icDWuKTm1xlVd/D7ynd2FA8Gxyx8o7TKo52kzLs1Uss/Z2oSvP0+kDqrTH9?=
 =?us-ascii?Q?6Jv3bNEzgkzNJoY1YUV3/X8PRYGBhG2h5cHXe1TgTHuv6OZJCbODnlHGXr/6?=
 =?us-ascii?Q?W0W60WDdZ9e4ZrhXMhIEVSyUrUDaNnFFiRSciYWciKHTcKB1PyuToPDECdKM?=
 =?us-ascii?Q?9L7rP+UeMmDv4seVBBzn55nTY3nPTDhEENhO1OpSmzqtzVvDoAx20KhCnUX4?=
 =?us-ascii?Q?xIav1EAo9tCTdXFbi8V6V0C/4qgbEjFhhPodUrH9RGE+CfctxPmKlmK7E4He?=
 =?us-ascii?Q?hH+oLfADtrWcQ3Pq5S7rp8hzjspP1E39Aed5SCu3PlGCssGrH1apnLoEwPR4?=
 =?us-ascii?Q?27OkDPV5kzbcDENGdH1XNYBhGoZwOVOx0/AZOTwp9iqAk2OpGLaYze1QnbN0?=
 =?us-ascii?Q?NEkaiaBr68TeLdlKo7/rKaCa2qDFOhjLJN+D8y99xRSdnTQsfULK3XicMHHN?=
 =?us-ascii?Q?tdNSR3iIMt8HbaaoUlWY/zkHt01bh26KsQLtfWglPkYmM5qkg4+oj0Acxjmw?=
 =?us-ascii?Q?ui83pUSfrfuVZb+v0Gwx5Z2ajqf4c6I6hzV0F3jPciz0+Q=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c733bb9-50a0-47ac-caec-08daa3fbe5e2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR01MB5358.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2022 22:25:51.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5578
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

This is v2 of the PASemi I2C controller IRQ enablement patch.

This patch adds IRQ support to the PASemi I2C controller driver to 
increase the performace of I2C transactions on platforms with PASemi I2C 
controllers. While the patch is primarily intended for Apple silicon 
platforms, this patch should also help in enabling IRQ support for 
older PASemi hardware as well should the need arise.

This version of the patch has been tested on an M1 Ultra Mac Studio,
as well as an M1 MacBook Pro, and userspace launches successfully
while using the IRQ path for I2C transactions.

Tested-by: Arminder Singh <arminders208@outlook.com>
Signed-off-by: Arminder Singh <arminders208@outlook.com>
---
Changes from v1:
 - moved completion setup from pasemi_platform_i2c_probe to
   pasemi_i2c_common_probe to allow PASemi and Apple platforms to share
   common completion setup code in case PASemi hardware gets IRQ support
   added
 - initialized the status variable in pasemi_smb_waitready when going down
   the non-IRQ path
 - removed an unnecessary cast of dev_id in the IRQ handler
 - fixed alignment of struct member names in i2c-pasemi-core.h
   (addresses Christophe's feedback in the original submission)
 - IRQs are now disabled after the wait_for_completion_timeout call
   instead of inside the IRQ handler
   (prevents the IRQ from going off after the completion times out)
 - changed the request_irq call to a devm_request_irq call to obviate
   the need for a remove function and a free_irq call
   (thanks to Sven for pointing this out in the original submission)
 - added a reinit_completion call to pasemi_reset 
   as a failsafe to prevent missed interrupts from causing the completion
   to never complete (thanks to Arnd Bergmann for pointing this out)
 - removed the bitmask variable in favor of just using the value
   directly (it wasn't used anywhere else)

v1 linked here: https://lore.kernel.org/linux-i2c/MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com/T/#m11b3504c2667517aad7521514c99ca0e07a9381f

Thanks for all the feedback on the previous submission, I'm sorry
I wasn't able to answer everyone's emails, was just pretty busy, I'll
make sure to be more responsive this time around! Also wasn't sure whether
the v1 changelog belonged before or after the '---' so I put it after
to keep the commit changelog short and concise.
(This is just one patch, didn't think it needed a cover letter)

 drivers/i2c/busses/i2c-pasemi-core.c     | 29 ++++++++++++++++++++----
 drivers/i2c/busses/i2c-pasemi-core.h     |  7 +++++-
 drivers/i2c/busses/i2c-pasemi-platform.c |  6 +++++
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 9028ffb58cc0..05af8f3575bc 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -21,6 +21,7 @@
 #define REG_MTXFIFO	0x00
 #define REG_MRXFIFO	0x04
 #define REG_SMSTA	0x14
+#define REG_IMASK   0x18
 #define REG_CTL		0x1c
 #define REG_REV		0x28
 
@@ -66,6 +67,7 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 		val |= CTL_EN;
 
 	reg_write(smbus, REG_CTL, val);
+	reinit_completion(&smbus->irq_completion);
 }
 
 static void pasemi_smb_clear(struct pasemi_smbus *smbus)
@@ -81,11 +83,18 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 	int timeout = 10;
 	unsigned int status;
 
-	status = reg_read(smbus, REG_SMSTA);
-
-	while (!(status & SMSTA_XEN) && timeout--) {
-		msleep(1);
+	if (smbus->use_irq) {
+		reinit_completion(&smbus->irq_completion);
+		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
+		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(10));
+		reg_write(smbus, REG_IMASK, 0);
 		status = reg_read(smbus, REG_SMSTA);
+	} else {
+		status = reg_read(smbus, REG_SMSTA);
+		while (!(status & SMSTA_XEN) && timeout--) {
+			msleep(1);
+			status = reg_read(smbus, REG_SMSTA);
+		}
 	}
 
 	/* Got NACK? */
@@ -344,10 +353,14 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	/* set up the sysfs linkage to our parent device */
 	smbus->adapter.dev.parent = smbus->dev;
+	smbus->use_irq = 0;
+	init_completion(&smbus->irq_completion);
 
 	if (smbus->hw_rev != PASEMI_HW_REV_PCI)
 		smbus->hw_rev = reg_read(smbus, REG_REV);
 
+	reg_write(smbus, REG_IMASK, 0);
+
 	pasemi_reset(smbus);
 
 	error = devm_i2c_add_adapter(smbus->dev, &smbus->adapter);
@@ -356,3 +369,11 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	return 0;
 }
+
+irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
+{
+	struct pasemi_smbus *smbus = dev_id;
+
+	complete(&smbus->irq_completion);
+	return IRQ_HANDLED;
+}
diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
index 4655124a37f3..ba6d6ccf9cdc 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.h
+++ b/drivers/i2c/busses/i2c-pasemi-core.h
@@ -7,6 +7,7 @@
 #include <linux/i2c-smbus.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/completion.h>
 
 #define PASEMI_HW_REV_PCI -1
 
@@ -15,7 +16,11 @@ struct pasemi_smbus {
 	struct i2c_adapter	 adapter;
 	void __iomem		*ioaddr;
 	unsigned int		 clk_div;
-	int			 hw_rev;
+	int			         hw_rev;
+	int                  use_irq;
+	struct completion    irq_completion;
 };
 
 int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
+
+irqreturn_t pasemi_irq_handler(int irq, void *dev_id);
diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c b/drivers/i2c/busses/i2c-pasemi-platform.c
index 88a54aaf7e3c..e35945a91dbe 100644
--- a/drivers/i2c/busses/i2c-pasemi-platform.c
+++ b/drivers/i2c/busses/i2c-pasemi-platform.c
@@ -49,6 +49,7 @@ static int pasemi_platform_i2c_probe(struct platform_device *pdev)
 	struct pasemi_smbus *smbus;
 	u32 frequency;
 	int error;
+	int irq_num;
 
 	data = devm_kzalloc(dev, sizeof(struct pasemi_platform_i2c_data),
 			    GFP_KERNEL);
@@ -82,6 +83,11 @@ static int pasemi_platform_i2c_probe(struct platform_device *pdev)
 	if (error)
 		goto out_clk_disable;
 
+	irq_num = platform_get_irq(pdev, 0);
+	error = devm_request_irq(smbus->dev, irq_num, pasemi_irq_handler, 0, "pasemi_apple_i2c", (void *)smbus);
+
+	if (!error)
+		smbus->use_irq = 1;
 	platform_set_drvdata(pdev, data);
 
 	return 0;
-- 
2.34.1

