Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44E55F7258
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Oct 2022 02:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiJGAnK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Oct 2022 20:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiJGAnJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Oct 2022 20:43:09 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2079.outbound.protection.outlook.com [40.92.41.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62579ABD5E;
        Thu,  6 Oct 2022 17:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffOnQ0V7XQxGm/Z+K90iHYhl9euDCobfW16V3FAsrNW2ZvwaOrnjx50ni/uPTcpoagygmyhhu6MakRA49VviSetMMizpPjt/m0vx0Y7NeDni/1xQJ+ERX7wTr8x5nzWbbmuuVEdRUVSI/apIgz8YTV2eb3GjTJm8XJvWvs8pFT+UbSYjuA7xz8feDWqLJD1SFwjFE/hyDM0A3/sQFf3TPAxCSUmuVRfAuKTUmrMwusnONLzDLGTfArzvDuzb7JrVbXeQTcIaEzH1fGb/+t5NxXYlgoxyVb1K7mJYMEolXfkZlWPy5BgeLejyvaU/srYgG11k4Ir5fAumdxfhgbkqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqukOOrvRDIhkBG1itTCkuejnMLMzhVBDjnmBgzOZ5Y=;
 b=WIGspF+KKj8g48TzFuktfg7Z0JmHN4VQZkwiRneKgX7ehbmeW7OOKyROQNn0dNVemzxnJg/3GknB5g2v2MWTxx7LmylStjDVRc8rKXdD0qDIG+LCOlFg1WKqU3fNHskhoEDUyffVqMzwqpOyFNmMdYVKi3m4sSCNUg6dwj9a+AHA7+O2KT1uGo5FxD0Rd0BvQ5AFW+X69xRuKY3heq+6EV2vnw0cKISS9ocgOmZSSk1O4EzgAAU7AeMJC/eLqYgZ7OZ1LeIM+JH1ihpSQzrAeM4NP/4U98f+CGmtsQ3WiFqxsIBfKiP9fmUVqo2YQHdDWMohDJ1eVbN52J/8QQhnqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqukOOrvRDIhkBG1itTCkuejnMLMzhVBDjnmBgzOZ5Y=;
 b=kcn2AwBR5GXp5b977KH2miBiJve1EqiErw3hJ+s5/5AAeu2MejuaHlD7zZNpKnK3S18d5HvIuTmfi/+OrcSqpoa6gk5RUnSRNzdwP63GLbQAJx/RCNxPVT8AXrRDNuyuUFXhg4x7lQm8pTDGokic4Yt7X8Q6P3ehB/euppMcVJ5tGuJNp7PzA6unfCfUDsLitolxlBJSfs2+nd0rAi13PN/JFg8NWOm4b2lu83uMU1IrYVmhXsDIx0eiosNo9/w1koAYURhVg4tcfAXHtLv1TO4+oZkqID9bTRMyIfvJJWG/IMdDaqlpSeMspzVnHCkZ5fPVXXGupAHkGih3pUngtg==
Received: from MN2PR01MB5358.prod.exchangelabs.com (2603:10b6:208:117::26) by
 SJ0PR01MB6221.prod.exchangelabs.com (2603:10b6:a03:295::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.20; Fri, 7 Oct 2022 00:43:05 +0000
Received: from MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::3c11:1e6d:4c2b:c8c7]) by MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::3c11:1e6d:4c2b:c8c7%6]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 00:43:05 +0000
From:   Arminder Singh <arminders208@outlook.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        asahi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Sven Peter <sven@svenpeter.dev>,
        Hector Martin <marcan@marcan.st>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arminder Singh <arminders208@outlook.com>
Subject: [PATCH v3] i2c/pasemi: PASemi I2C controller IRQ enablement
Date:   Thu,  6 Oct 2022 20:42:03 -0400
Message-ID: <MN2PR01MB5358ED8FC32C0CFAEBD4A0E19F5F9@MN2PR01MB5358.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [wI8Vag+iqIejAVU6v720xiuzB+MDRhCoOK5FgCeod/5NcFcomaqQ9XIWD6BRe3mf]
X-ClientProxiedBy: BLAPR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:208:32d::22) To MN2PR01MB5358.prod.exchangelabs.com
 (2603:10b6:208:117::26)
X-Microsoft-Original-Message-ID: <20221007004202.2662001-1-arminders208@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR01MB5358:EE_|SJ0PR01MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c67f286-26c3-4b08-b8d5-08daa7fce50a
X-MS-Exchange-SLBlob-MailProps: ZpxNddEKiWz9xWgIDw6EsgO2Ibru/UT1cZ7XV10NTqMVi6rxHosuiqEw0YtFBVR/OMiGlhALjdxZc/ohAYz4GCASMc7q6VA3lPUCe5teuSOf1thQmHuN5WGhAXP7YThY2Bc2WlXITjqWIHnL/pwsPd/wGrlqSx9im70ez3PnETAdXzyV+DdXoQODc/78yivKJxVOPUVr+TcaMTq6VMo6LcHJYuwp4n6R6kEBUzpl9uk2SsLmTsYKoFd7O1K3/MYsFQI7Uq0K0f0uJJDCpOMgnU6JT97H5UdBwdR3eI0sMQhBudl+qU65KCrQM3dw1X3EKOnkXYf1DKV7br010TBqZjE00Tfl/62D3m5PfcW5DXZ1nSzWgHuRXzn8DeOEE8cKL7/vB0O8X/i1NJU6AAdB/NJ/Bvvl7XauE/xppn3Hvvl9lSSfMgDu27RgQj3vmzm4wgWRt6S1nWWLkrWL7zPFqMh9yWJsSVJDFRovTtzKI4FeOO0LaqcjQpVskEGP8bw5u5wLraAdoRALBRjosz5b+otrpQW/QGt8o4FOd0g8VdQyupocf4TNHxsQxzbRn+ZVKH/0cO1RhHoZ3xZuymcPAtOPtpque3CZ6HV5ZrRi/hM5E0l5QM3XyPLka8SYH0zheckXKqgDRGDPSsSIQtRhkDDu5IDlUYAp1n3e6nFr4f1rRtCX1wbTK8F3d1sJKtjf6sayBEhEVVLHhiU0cvtJBYjMlIW/cBBO+FOfKnU2O2TZWs+Cpl0jRIjTjzrvoNjUx9fHXx84L2WPIcE4pP/jhziuvtzmuzLMp+EdSFhmPuHoH+EH2SLw5fhZTOrh6E4IJM0wGl3sBIUYUpP9Mbc2RA==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FJm4ivqDBVCSG1SP3POC7Qbms7P47i/5cRndT0GadIQiqCUCbwp7yR6VDOcT93gGcs3Vmtl5dFlGxou5IcRA8BQuS+kNoXnRg7ZrB43KthcxtbJNDKKp+CXxgvk9VBApTB2cCRHBULu468lxe6KtZoAyVnM2kQB3IAzYfJtMM13TqJekI25eQqh7NyY+l8jsLHk9aImyCWSrTTuu4/7pWyMZKQsFr8aUYMV7LJ/NXFiWb/sgFhOpvsHXuQYp3IGeDWBBB1M+zsgTqmnMT7MDeO6FKHB2Op0kUwzDhvTkpyqsLb9GwpRvwrgM3iFxkZiETnyKusVgouP7PMHtrMY6PVhnY+aKJBy6t+W8f7etdzgzuR6TNLuRSx6KHNqjQ6RO0IE/+7MX+lwg7tNraS8GrcSLvsfrAgAEhmiaIlttDcVALxTPmmLMPsU/2p0upYccResWO2YXQcMSbVQQSxfO7LqN119Dd/SfVfxBMpzlhLuRxxWZT67ipkmCICsATNm72omMoLgIEvptpbb8r5v9Yy6ofLZtHdRknD6aE7IpapIMAbWdbZ+wkMwhUDkvSmU9I0BaHfE1caou/PuGVXbvmb5yS+nge8tFE5tkkYqupj0GX0AdeMKqxtSx22OW9e4QQEhu3Efbr4U76hLikXDUnVwtL5XGNHq+lj4bMVeCCnhj7EhNXrlmfL5h39E849Dvb0V9xxc89qsyWTP363Oe5Q57oMPKVc17013ZidBquXE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qvnBOh22pvUEwsGytVUDVbj8Fs7EltnwDUPWrOFsE1DP5ohyt9kOEPj3NBGf?=
 =?us-ascii?Q?1XhDijtNgVhzoqrP1kjfysIVwd3F+2GQXGutuqJ+WQ4Brjx/EhjPF8KMewTa?=
 =?us-ascii?Q?0U+iem37hFVlSpy/nOSs6zuNXI/ICTcGlGGul6UdOBf5z6MTFmmJnNaKk7fd?=
 =?us-ascii?Q?YZAwjmkSG6owvi/lI8LCMjqCNPfSi1yOWFuPNCwW2YSqMqKm6IUVVB58hKQJ?=
 =?us-ascii?Q?ilbcLF69mIToc708w6A5yz2UjRkQerXFeFk05LKbZWdVtby84t+uhRXgJyq0?=
 =?us-ascii?Q?Ce9Zchw2QwSL9DaVaS7Di/zJq9PFZW/hl/+OvtQMgBNUEroWhzDFn3Yuxmdb?=
 =?us-ascii?Q?GM5FWbfcTjtxgmPbNCa5bNS8XkkkUciLGaFlPH0gwr4v+1zGm6vI/G3Fy/VK?=
 =?us-ascii?Q?pA9FVVbo3f8Y64jIS8VT/TLq2EvWPH8uBQQAm/FVFiYrU8fA4cnNqBByGB8V?=
 =?us-ascii?Q?KE+Fk6xC+I+pMaERuJLujgF2W20NpoBrT88JlvJvgMVYVAlI3IQpyjxGqoxz?=
 =?us-ascii?Q?I2VJfvFqJsrbbjZgRwpeW3iUtOG8x5am7Lsl2BYwJ/MRGKSomMyA6cW2XIyH?=
 =?us-ascii?Q?gVaGyI2Lg6zXyvLZKfzFJyJ9+sao6KOi2/Zrdtyc7ptDadz3yCvbqBwpf3ka?=
 =?us-ascii?Q?ubtS7gD7FypUV1Xq2xhF7rGmp912p1FB9wmBXgoSMr7YbcSU+9ZLaKndzdZO?=
 =?us-ascii?Q?67CYtMkQ5xtJl+JKAuix7qSrpKcSGXxjFR8BbGlFRqk7xv0Mb9xxS3mptRo3?=
 =?us-ascii?Q?4PJmUFtXnJsDfdQEYebJRq4Qon1CQGwzuh1p3elt+2bFar6SFQzxE3K8bZEp?=
 =?us-ascii?Q?Q+LxnIo98GPf3kcMHSd61U6cMCS9LaUYK0a9w8hFjrqZY0iLg9fb06Be8JoL?=
 =?us-ascii?Q?Lew+I+D7wnlHV99lkJ3f+d5m5bcBAGuBM0cKGCbdeZm81z5p08htPNkDBcW5?=
 =?us-ascii?Q?c/ARCn5UzDpNRWZ6hbfh/W7ENvhXO03gmQN1K1prnpr+OgFfoASVoz0MjIQh?=
 =?us-ascii?Q?2B56hpLeuhK5ypJ76MqvIj7mROClZO1vj1Nzh9nHPDAV0vCe3ay5DRsgJgeV?=
 =?us-ascii?Q?wgyanmBiKvvK8u6CX+wDCGrvnW3wwFHkJ/rb+iafXDP9XCdypCQX8nrrhhTI?=
 =?us-ascii?Q?X6VFRq2s6N3prpEVeY6lR76ucFVbOTCK8+A5o/3PY3gMAovLsC801rJ91deK?=
 =?us-ascii?Q?PLIUZ3snPufJU2bn0pQoPqP989UYd1pHcwobhRA2p3OzbNfxzsOV5rh4s9qw?=
 =?us-ascii?Q?6xTeRLesd0huGAb3lmj986UYZT8PD9aOGfxZifUMFxP3wcEzpjQfWe0oLCoA?=
 =?us-ascii?Q?8KKdJGOVaTLcWeSA8GrYSDnrxH3L/nJGmkI8lT4HO2oHKA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c67f286-26c3-4b08-b8d5-08daa7fce50a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR01MB5358.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 00:43:05.1690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6221
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds IRQ support to the PASemi I2C controller driver to 
increase the performace of I2C transactions on platforms with PASemi I2C 
controllers. While primarily intended for Apple silicon platforms, this 
patch should also help in enabling IRQ support for older PASemi hardware 
as well should the need arise.

Signed-off-by: Arminder Singh <arminders208@outlook.com>
---
This version of the patch has been tested on an M1 Ultra Mac Studio,
as well as an M1 MacBook Pro, and userspace launches successfully
while using the IRQ path for I2C transactions.

This version of the patch only contains fixes to the whitespace and
alignment issues found in v2 of the patch, and as such the testing that
Christian Zigotsky did on PASemi hardware for v2 of the patch also applies
to this version of the patch as well.
(See v2 patch email thread for the "Tested-by" tag)

v2 to v3 changes:
 - Fixed some whitespace and alignment issues found in v2 of the patch

v1 to v2 changes:
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

v2 linked here: https://lore.kernel.org/linux-i2c/MN2PR01MB535821C8058C7814B2F8EEDF9F599@MN2PR01MB5358.prod.exchangelabs.com/
v1 linked here: https://lore.kernel.org/linux-i2c/MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com/T/#m11b3504c2667517aad7521514c99ca0e07a9381f

Hopefully the patch is good to go this time around!

 drivers/i2c/busses/i2c-pasemi-core.c     | 29 ++++++++++++++++++++----
 drivers/i2c/busses/i2c-pasemi-core.h     |  5 ++++
 drivers/i2c/busses/i2c-pasemi-platform.c |  6 +++++
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 9028ffb58cc0..4855144b370e 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -21,6 +21,7 @@
 #define REG_MTXFIFO	0x00
 #define REG_MRXFIFO	0x04
 #define REG_SMSTA	0x14
+#define REG_IMASK	0x18
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
index 4655124a37f3..88821f4e8a9f 100644
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
+	int			 use_irq;
+	struct completion	 irq_completion;
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

