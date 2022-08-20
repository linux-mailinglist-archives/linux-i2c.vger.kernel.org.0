Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5740659AFFB
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Aug 2022 21:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbiHTTpo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Aug 2022 15:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbiHTTpo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 Aug 2022 15:45:44 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn2030.outbound.protection.outlook.com [40.92.23.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257F933A30;
        Sat, 20 Aug 2022 12:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gr4yumM2aT+1Wnznos+MphhjYnio1D+tkLy5xjkpAw3YhYJNk/QeHA0rBOVH4oEAabWalxhP28o22b4XQlmqkYcUgGIOo56sGBS0SywDynzj9EdZkP0RhvvpSmXih/ETiADVNBTXe1tSuGDV62cQl0Dt3NoZXPGMq2NCiSZf8HCkapv7yZRq56wrx2byPwxPSMOxS+FUgIO8j06gKlNYC5IijkkaT9HFYh9mWQNyz+uELav8CupwE+d+Bm16dYjgkK+3v5Vjd3HS5VqTmdkagLt6t8x2gx2d/5S4Yn7Cnc8YJEgQoACF2vLWDUa/ZmcD5G/zomATfmWQjzoUOi81OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mg80Rvp4TbSXmnOtmGF7CQ2rQ4NRH8itYqeH8XzpjGA=;
 b=Qg0KcCQUSwZTI6yQcgBBZIJXEgM5Xg7p8VCw8eWQmJJAuajKli09S/rNOwcdtdvpZrf6tI4ar1HnPSCfXblSdDN6NG09LhW5K7p2QiZOuj2ABBN4RmVSJRJtfDkhryuY6h9KOtWI28lZXmSEL/rbHU189nkynBgpfFmi33s61Klc3tt7OHnl4pSJTMhAwMq2aCE9peBYVEVgGSbccGdHym3HQvgG5FaLqPHg2wQzZGjhIwQsGNCIPQ6E27ByB91x5bIp5Z9HdV5jQKOOR/IgMf87GlzI5qpgEfm1ckDpianr1am1/KuYMPjrv+X7m6V0+ijJ7gujYcrlB9fP+uRVIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mg80Rvp4TbSXmnOtmGF7CQ2rQ4NRH8itYqeH8XzpjGA=;
 b=i4VO0R/0s/y6ljrWgrDqTFH3jNcQXwy6797lhFjjWIe5bsoN8XN/O6VMxfOXFBmmMFsHLNbghkYGBU9J4AGAjNoW4BLRJ1RfchX6OCGIH+V5HoCfwnNVVlSNmvte3zNtnKuePB6oxOcvQnTsb68NxH3lbSNS1k2JAJYbf65a3aPiypa3Ww/IwYT2m+r4kVMfwhjHTYc04UiIjPBBwFt2QewKh6AENLc3DeEcRycEePVqlPkuz8R2jlS/owANDw5EloGDaO29N7Vn6AEgD6MhNoRiTqNC8G6dArN5VVAkKqKPpjtwuBI4FgVWD/uIOAZ4vWgEcXOyJqvPVUIjQYr7cQ==
Received: from MN2PR01MB5358.prod.exchangelabs.com (2603:10b6:208:117::26) by
 DM5PR01MB2313.prod.exchangelabs.com (2603:10b6:3:b::15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.19; Sat, 20 Aug 2022 19:45:39 +0000
Received: from MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::c41:c67c:2fce:3f2f]) by MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::c41:c67c:2fce:3f2f%4]) with mapi id 15.20.5546.018; Sat, 20 Aug 2022
 19:45:39 +0000
From:   Arminder Singh <arminders208@outlook.com>
To:     linux-kernel@vger.kernel.org
Cc:     Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Hector Martin <marcan@marcan.st>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        Arminder Singh <arminders208@outlook.com>
Subject: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
Date:   Sat, 20 Aug 2022 15:45:11 -0400
Message-ID: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [mZzaDx05lXFnXBNbwyHrIDQuWKioXgYzC8B3/yPPB6GE7Hh7V9lGpsnS+K/xJixY]
X-ClientProxiedBy: MN2PR15CA0023.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::36) To MN2PR01MB5358.prod.exchangelabs.com
 (2603:10b6:208:117::26)
X-Microsoft-Original-Message-ID: <20220820194511.2123042-1-arminders208@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 267e1b88-79ad-418e-7dfb-08da82e48f4b
X-MS-Exchange-SLBlob-MailProps: 7MJMDUNTCtzWWQrjCxXiCpiAuMTakpSxyCYHKsju2LLaknPzq5RjaId5ItMIPl71JelpvOh2EJhA3gU6T9AvqlWz1KfRKOXzV6XLmw/LUaypbHf2NCODenAlsrX+2evEV9Qa591i3bkDxNH8Jkw19wq8lZTpqNOZMrFjt4th51WcBY+c5CB/eCxbKPmsWBWwMoF2qLko7hci/ABMBb0577jaHJhwU582L8HkySCsoFPKpnl8KBsy04tBBlQrSPz405bXD1+hX6KtR8M2/9trMVlxsLKi1anxJepJOQxwo/lvTuw3gy8rOeFf1BcP50qA4T3I3t02CBrj0rOuEDrJ/vIKrXvj6iUSREj/Umi1Nu8VDIJaGQuEL2aB0KcX4PTxIDmfwDxXxdeABLwjEL9S4lmIbDjDSnzaTfDBHR6PK6NtdDUAioHni9V3RroPLBL8RQv4QOssKcduypKC20roy591IdpmIgru9SSEA7SVaOLYeyztJ/3ND84QogVPiXe1dbkcjIFPSUmiP8DUjJgfxSm8OD8jUKCARzRNt0gXuxFRWMtiObLJoBELnUHVei6QZTRnv/cSW9x24lxbXT0zD6xz4LDPfwGyHJd550r99Bc88UGhOEuAKFUaTYk2/o6b8LMrLAiLcY1LgcZmofNhRyw/T4kBG0BS3j5W24wBcdHnwboZVpRgFtqwfyEVb/9QszKjoiszKVaawroJy6YxpfJ/g2k8gvXoP+vG/mhfaeFuzJb2nPOg+w==
X-MS-TrafficTypeDiagnostic: DM5PR01MB2313:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +cjvEiSS8LtY552GUjDyKwP03VEe1vqRaDasQ6+hYM1/xYSu75FptZbMHpGmCLZC0JZP8bIeTtElp2Gsqhz5XJ22BTCTUbQ4f1qQC1JOVCnshRvDDpJh3U+2dX+sYYC3YfwTh6wLFXnnDacBwfVVh2QkDFRpyDJQq363Ba38UKeTw44YmowY9UR6ooz5dPq2fVrqjeRnR6vD+pL3pxuWwo5N5L4hxuXN9uDJgGftkaAvJSsWOzaJifHgDWUliACTAA39/ubpbojbL0NhjZbehI7zbhas5AuDgUvPJ8lNyvL3/w0U6IlbAjnUPNChFcUQ6ldE3XRftNZKGQtk6E4cCwWjEq6xANS8YrGu4JWmdhXkfXoSBQdJtpwumAuxNvYWdmzh8ebFv+04omQUWHmBoBy70b7eXpNhqM7bVQ66HkhiCbbdzIqyVOEL7SAq9aDnjNxe3pzOmD6nRr4bkIsFFBPIDKliCoh3bDFnRJuMPmXnXys8ALhHTPnfkA06xxHEqpEEoEEiBAYZfNRNaXixxa08ZB7L6UG5yo0LDn21a0oclrhwYi/w+EuDxiCrQiXAczZCFuGEJ9RzitKWXcx7hZn0d9yiMjbcs85AwtwKBQRLAevawVvtJnx6mFx8M2pK
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K0dlPgCLH5vhhFUqpcgjt05M4J9aCwuRBo6w78IQRBNTYWn0NtUkUB8scwvM?=
 =?us-ascii?Q?zyisPLWdhJrkynzKssGMYw4JL0Dz6KelR6jNp7Ch8Ryg6T9ZM6KelfnHb/lj?=
 =?us-ascii?Q?ESeVUXlUM2WiZ0eyHJtk2kb41uLprMyY+/vzeh/Yu7b5icdL9wZpG1cWf6mp?=
 =?us-ascii?Q?l7TCu7WMJGv18DI6eLDqDR8ZirMQgbhbhzPMamCGvNazmI6RpfnjEjH/Z9SW?=
 =?us-ascii?Q?RylZhs+/GSBUVAvwnjJoU+VPTFNG9ZRvChy5vzniJQnmScS7n5beHHdzm594?=
 =?us-ascii?Q?tptkXbVHXIppIhUo/rMIa9F/uDE/B9M7aArB79w1DNmk3lwklKoNQYD3vY4P?=
 =?us-ascii?Q?hY5v8K7P+y4drq9uLgNgtMNixrxTvxrtcVuhVZuGawOqWKKRtpj82nSUxuns?=
 =?us-ascii?Q?TSt6y2t0azR7jW86LuwPB4LJ03+5ZzSe3SKCjKbhuhtcwkXRF3IoGo4tDm1H?=
 =?us-ascii?Q?KJfHSMFGw8ah7DZogTAZnHwR7vWGeKvZE9VMMjTfJUfmDb+ZmP5N/vpW8bQB?=
 =?us-ascii?Q?1dTECM+pRmOTOMejOX1aXcyHWNoei8wKcsnbrSi1zCuc6NVSfVsO4udBrG7G?=
 =?us-ascii?Q?JdYEYN+lk/mA9CLDylaCouGPzxKQwdIjsHqG15GI/mmR+K26POzqRueRZT+v?=
 =?us-ascii?Q?rfBsfMl0+SpHoe5qmaclebRuX7qmkfjukwcHjT5Y9Vd9w8YWalXsNim6jcfg?=
 =?us-ascii?Q?n86fe38btLSmG4fDOKNr4y4zGSdQHnDxKp+6GPyVLpuHjDW11fTPgBodjWyA?=
 =?us-ascii?Q?JdMRS/0B/+YF3YL/VDX2JaYg62MuubcNfnmL7wdvEoJCMGxZ6itDWf3WmuKW?=
 =?us-ascii?Q?IKAs2Gs6Cq51AgnWm4GHDOGADj9Ib9CsCk67aukWHl0EJe8xE94N4+OehbOv?=
 =?us-ascii?Q?jE/dN47LNeui/TxxOnMbEO+1FfxTDjZv3cMf+YZba+IEdOGSCilCbtp8G8gK?=
 =?us-ascii?Q?DSb0ccgZrchJK6oGrCp7/jeKhQ42SklDn9zF7edx9hqtVRK+dD1L8g6Xr7Jf?=
 =?us-ascii?Q?Qkp0azPV2nL3cw5SsHcbNE1+c4ZJ/uY1INero2JLbKAD76GNpujdiHC4SVxz?=
 =?us-ascii?Q?+LfISofuTDr7sxMN2R4XqXU149g5r6D1cXYmb73jn9o4cC1ekSF7gHBSAvYg?=
 =?us-ascii?Q?sVXRwxbzsoTK6Q/IiIgk4gcb6/qAcK4wNFfM9JWm4OAu8tVaD2POOkpDxAy1?=
 =?us-ascii?Q?ViVy8Zif07mwagOQ1I+qjYEZ4Ee7HHzwjRRaBt9jhdxJHfSvkYEiQASN9IvS?=
 =?us-ascii?Q?5JgL2CiO3WSTSjqELugkPaWkj8ufAfEwwdyAcp1lgbuNVGKXIicMbMEmPgNT?=
 =?us-ascii?Q?QMzm1ihHGZUzc/7S3741krmyYUTNUBjhlDLvxr2e03GqHw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267e1b88-79ad-418e-7dfb-08da82e48f4b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR01MB5358.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2022 19:45:39.7871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2313
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is the first time I'm interacting with the Linux mailing lists, so 
please don't eviscerate me *too much* if I get the formatting wrong.
Of course I'm always willing to take criticism and improve my formatting 
in the future.

This patch adds support for IRQs to the PASemi I2C controller driver.
This will allow for faster performing I2C transactions on Apple Silicon
hardware, as previously, the driver was forced to poll the SMSTA register
for a set amount of time.

With this patchset the driver on Apple silicon hardware will instead wait
for an interrupt which will signal the completion of the I2C transaction.
The timeout value for this completion will be the same as the current
amount of time the I2C driver polls for.

This will result in some performance improvement since the driver will be
waiting for less time than it does right now on Apple Silicon hardware.

The patch right now will only enable IRQs for Apple Silicon I2C chips,
and only if it's able to successfully request the IRQ from the kernel.

=== Testing ===

This patch has been tested on both the mainline Linux kernel tree and
the Asahi branch (https://github.com/AsahiLinux/linux.git) on both an
M1 and M2 MacBook Air, and it compiles successfully as both a module and
built-in to the kernel itself. The patch in both trees successfully boots
to userspace without any hitch.

I do not have PASemi hardware on hand unfortunately, so I'm unable to test
the impact of this patch on old PASemi hardware. This is also why I've
elected to do the IRQ request and enablement on the Apple platform driver
and not in the common file, as I'm not sure if PASemi hardware supports
IRQs.

I also fixed a quick checkpatch warning on line 303. "i ++" is now "i++".

Any and all critiques of the patch would be well appreciated.




Signed-off-by: Arminder Singh <arminders208@outlook.com>
---
 drivers/i2c/busses/i2c-pasemi-core.c     | 29 ++++++++++++++++++++----
 drivers/i2c/busses/i2c-pasemi-core.h     |  5 ++++
 drivers/i2c/busses/i2c-pasemi-platform.c |  8 +++++++
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 9028ffb58cc0..375aa9528233 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -21,6 +21,7 @@
 #define REG_MTXFIFO	0x00
 #define REG_MRXFIFO	0x04
 #define REG_SMSTA	0x14
+#define REG_IMASK   0x18
 #define REG_CTL		0x1c
 #define REG_REV		0x28
 
@@ -80,14 +81,21 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 {
 	int timeout = 10;
 	unsigned int status;
+	unsigned int bitmask = SMSTA_XEN | SMSTA_MTN;
 
-	status = reg_read(smbus, REG_SMSTA);
-
-	while (!(status & SMSTA_XEN) && timeout--) {
-		msleep(1);
+	if (smbus->use_irq) {
+		reinit_completion(&smbus->irq_completion);
+		reg_write(smbus, REG_IMASK, bitmask);
+		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(10));
 		status = reg_read(smbus, REG_SMSTA);
+	} else {
+		while (!(status & SMSTA_XEN) && timeout--) {
+			msleep(1);
+			status = reg_read(smbus, REG_SMSTA);
+		}
 	}
 
+
 	/* Got NACK? */
 	if (status & SMSTA_MTN)
 		return -ENXIO;
@@ -300,7 +308,7 @@ static int pasemi_smb_xfer(struct i2c_adapter *adapter,
 	case I2C_SMBUS_BLOCK_DATA:
 	case I2C_SMBUS_BLOCK_PROC_CALL:
 		data->block[0] = len;
-		for (i = 1; i <= len; i ++) {
+		for (i = 1; i <= len; i++) {
 			rd = RXFIFO_RD(smbus);
 			if (rd & MRXFIFO_EMPTY) {
 				err = -ENODATA;
@@ -348,6 +356,8 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 	if (smbus->hw_rev != PASEMI_HW_REV_PCI)
 		smbus->hw_rev = reg_read(smbus, REG_REV);
 
+	reg_write(smbus, REG_IMASK, 0);
+
 	pasemi_reset(smbus);
 
 	error = devm_i2c_add_adapter(smbus->dev, &smbus->adapter);
@@ -356,3 +366,12 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	return 0;
 }
+
+irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
+{
+	struct pasemi_smbus *smbus = (struct pasemi_smbus *)dev_id;
+
+	reg_write(smbus, REG_IMASK, 0);
+	complete(&smbus->irq_completion);
+	return IRQ_HANDLED;
+}
diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
index 4655124a37f3..045e4a9a3d13 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.h
+++ b/drivers/i2c/busses/i2c-pasemi-core.h
@@ -7,6 +7,7 @@
 #include <linux/i2c-smbus.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/completion.h>
 
 #define PASEMI_HW_REV_PCI -1
 
@@ -16,6 +17,10 @@ struct pasemi_smbus {
 	void __iomem		*ioaddr;
 	unsigned int		 clk_div;
 	int			 hw_rev;
+	int          use_irq;
+	struct completion irq_completion;
 };
 
 int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
+
+irqreturn_t pasemi_irq_handler(int irq, void *dev_id);
diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c b/drivers/i2c/busses/i2c-pasemi-platform.c
index 88a54aaf7e3c..ee1c84e7734b 100644
--- a/drivers/i2c/busses/i2c-pasemi-platform.c
+++ b/drivers/i2c/busses/i2c-pasemi-platform.c
@@ -49,6 +49,7 @@ static int pasemi_platform_i2c_probe(struct platform_device *pdev)
 	struct pasemi_smbus *smbus;
 	u32 frequency;
 	int error;
+	int irq_num;
 
 	data = devm_kzalloc(dev, sizeof(struct pasemi_platform_i2c_data),
 			    GFP_KERNEL);
@@ -82,6 +83,13 @@ static int pasemi_platform_i2c_probe(struct platform_device *pdev)
 	if (error)
 		goto out_clk_disable;
 
+	smbus->use_irq = 0;
+	init_completion(&smbus->irq_completion);
+	irq_num = platform_get_irq(pdev, 0);
+	error = request_irq(irq_num, pasemi_irq_handler, 0, "pasemi_apple_i2c", (void *)smbus);
+
+	if (!error)
+		smbus->use_irq = 1;
 	platform_set_drvdata(pdev, data);
 
 	return 0;
-- 
2.34.1

