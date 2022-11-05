Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D168761D9C6
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 12:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiKEL5L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 07:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiKEL5L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 07:57:11 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2024.outbound.protection.outlook.com [40.92.22.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867552C67D;
        Sat,  5 Nov 2022 04:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlQVs7MzMgQcz81zWPHaBXEE805wbNPG0Dv8TfvMbfyO0wWh1oCHJufTj9Shym/E8n4yRp5QUTM93ME/VtTK+3dYH1cv2B4pyB+5vHsv6VkDqo8i+cPmJPCOYwfLYPuiISyxQI2kqWtsuSrRI2HNYsGTCvkkIoHqQj1/Mh9J0N0km2Qjw5COHtcJwP2NMZCWNxNKVzyheSEOXYiv/g0G8y79vFhZJ+TEMiW9VFQGPrxK2vcSUGUMwZn0X0upaeV6NqtqjlaPGlLY9/bLiwlFVgoFUK2uOvu9aX29Ok3S8MeIr+gEoQ9NGQUByX7ZAF5UhJNlaJN2jI8geC2DGmJnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01yGbNLsJoUr5iWuLj07LZjfUCMctr6eW74NqLQp3vg=;
 b=a388jbeH23j0Q+Twgxl78TcdfABm1HJEabW960sbOGfGcT4gi+AFCu4GVGuawiAQFJ0EbUJW/7LQb6klyyZP9rlAOaMBNTNQDcw1ypsqjeS+cZAsFdZ1iCZl8uiKDscl3BWM04lvZOkzH/A/J+2t6Q7S0mOIbwNhhvNPpN4SNtprM4K0i4/M1zdll/xaNCfzrqBDY02hOm6jNdTaSTBeN5nqYcIlTpgYuYmwIsM+VTjUF2PvOybQkqvXwnvNVD2RDZ5lF6QZDqbTGlqxbtFVVC4KQ0FohNEYJJNNwfK2Rx0+U9pv4Bmdq1bH4j47IM7KxdF7CkZcWPvJ1nuHUgp2zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01yGbNLsJoUr5iWuLj07LZjfUCMctr6eW74NqLQp3vg=;
 b=iYi9zr0IIRvZq7XTAzDaFZbFnqkL8qVFodwu9xmdAOjr/EG+jyucu8Gkl4wcT4T+4/fUNMTyUHnJy+2P4PA/W1Z5Hvz4+4feIBZASbCN04C8wIBfNiGmNvwvMJuCMAnOAzVXAZpKxo+Gp9jSaQAiWxiRIvA1qqH3TWqueKm4LWTrrBbQj72SpDOn+UeZo9cLj7Id8nzoOhqITz9JpL9wfxsnSBgEkYX0iGlMKd/UDHIeBhvksXhxxVlDrCxOMEZymD6T9b+aVs0HysBgzwhBhXnSKRYxNLcwzz/yfGfla9javnIh0ek86phtLXnW5gXhzOKWFFlK5gT3r5rYGeUyaA==
Received: from MN2PR01MB5358.prod.exchangelabs.com (2603:10b6:208:117::26) by
 BY3PR01MB6754.prod.exchangelabs.com (2603:10b6:a03:365::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.22; Sat, 5 Nov 2022 11:57:07 +0000
Received: from MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::bc9a:11a8:3923:da92]) by MN2PR01MB5358.prod.exchangelabs.com
 ([fe80::bc9a:11a8:3923:da92%4]) with mapi id 15.20.5791.022; Sat, 5 Nov 2022
 11:57:07 +0000
From:   Arminder Singh <arminders208@outlook.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Sven Peter <sven@svenpeter.dev>,
        Hector Martin <marcan@marcan.st>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        asahi@lists.linux.dev, Arminder Singh <arminders208@outlook.com>
Subject: [PATCH v4] i2c/pasemi: PASemi I2C controller IRQ enablement
Date:   Sat,  5 Nov 2022 07:56:49 -0400
Message-ID: <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [cz81fylcV4PrTzs9QYQk8Jpce3TowRhiZAqes/Zm0zwnfHyfEQnVrqHmBYdSy0HK]
X-ClientProxiedBy: BL1PR13CA0402.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::17) To MN2PR01MB5358.prod.exchangelabs.com
 (2603:10b6:208:117::26)
X-Microsoft-Original-Message-ID: <20221105115649.1514296-1-arminders208@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR01MB5358:EE_|BY3PR01MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4c47d6-9bec-4bb4-f422-08dabf24d9de
X-MS-Exchange-SLBlob-MailProps: e5BdfXQOl3OzlkxqJB54dUE3cMqoCeB/Ca7nrJNm4JKAt05F+1qAxScNMMOe5dpoSnJLTsvjnYXjPjD3m9bMKf9Pt01PQMk1Oc3gzNoO+aDPFPa+dRQ7ZN/0XZZC4vVxCsh0oklUECcs8cxE2M7IqdSCyZRkBRZWURBASI8rVMDbjUZ2yN8/OUylCEhDrgCJ30LYlTdZ9KK3R3Mo9k3F2f2oFypPrubB1PKpRcPvnCsL/KA5qzk1CQEUzcCvoDFZifCDc1FF3/LFzrJBBuSL1OwwhTtVUqW6x2prv/Q6eFdtIGEE+GRpcsAdL6JkrkwDTzWJC14KZassl+8fznccmRG+oAqkCwAT/TlYa2C9nlS866P35VW8wLBNjvXO/OSsHxEkwOtn6VXyGvDscFJqe2oqMzUEUbNPpjGIshB5I/6qo4xL2S4prLaFLbNeSK/ImuAg5K/ceyT44wHQzlkB7/rJg37veNmAXllx7IQ8FE29FDiwQ6lKwgP38Pz1oxjqHsmVNUlfEIy30erFBeWfJ1PL3U18AwHjShqX37vWOZoFNcLYUMsKzkvUFpsFWBFPO3+YfUgE4mJcR+WcIr7/QQ5PILs4UCFJ0OAlR5w4uhyU6rlq7tkxog8PI0Un5Wev6/Rdi9GSR/QMILcgdGuXJ6jXgogdEwPtS33zJYzde3cVKCQO25Z6P9Zq0tjlk1A10ICwGVQGmhLQdxKd7PScCTECXMzS1vUc1vpYuK2ts4WqAjHEvqS2sn7sZgFxiAfQAd/Ix9OlYmlhs0AGa0mKcN+jagt7teEyfgK2W9jZ7ezdwBF1KG8Ag0/sXtUVpDFFtH7HnIQrijE=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AML+/xCvaQdl+VpTqgKy4RkCOADdqvaadOzwE9Qq81+AQv7QsuSe0JUuqWO4WHWYq3C7JD0e3TSJOj0t3jZFCFD2bpQX+AQFT1+hxBHA5lplpDyEjNcJoqHEGtz+EMGyPisyPojev91PBTLQzwyhqb8QF6IQv8q42BSlXOjoE5TEOzdz7Z9btMFxZapSKyT08FCQgjT7nbTrM/x03Ts7DdWbyMCTKrS818xEWtunjVYNqMTTckx3/9CTm/Tfqf0cQBCoqFhXF0TGUjlUrFXFfPc5z9wkApNe7gh7MxH5NimGOHcavKh/aUC37uZDt/1oFlc1lnKEMxzu+26YvLi2gp9lggG4RxTr/nxGnlLzoW9b/WXtcy7ZukHQ84ad6Tw9lN269RrcA1afFhN2Xa2tLG9UI0zbYYfRi0wMT10wjYDQpaKNdsGHhFCNOI3rc2slpCWyGWg9p3bfpdHEE+IMI8XVVRCavAGi/CnPjYjnikkE0JP1+/iUpMUn5ewEZdAK32uxFMKNZ7nPh+7MUvyCeA5FT5Qkg/m+l2vPFX+w0YI+LI07bXqNI1wG288dKwKhsjTxX4h2C6LmE8LUeQ16kVCQlz0kxUTJNSzrWCd8iU4H/fDRHGa0qS5FhmGdzwpjeE6AEoacUmcDWb1DElxmB+b6ABx1MwmKlC35jBE25zC/FBgeLbtPSWYcm5D6iCqDV6DYbgaK48BepPSJLs+FTbtTu/GEn349T22B4ciezTw=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lUni67UDEupOGCdqss6xfms9M4sjMJl4oMScxyc5kAKQ3VW5OFNW5hq7MEBP?=
 =?us-ascii?Q?1K+BlzJOG6BHaJtJsMvXEZ+mJdjPSvlt3JuKOhvFK818G5O6NHVfgBylA/+j?=
 =?us-ascii?Q?1+wjDbkE5b5Oy/Zn7AIqsc+4O90NIdtyUiqEKf85XGq7bWkf9fcS0kepVE7z?=
 =?us-ascii?Q?2qlRBVSiCrHfOO+wA8XcZ83BqjeUeNsmW/xPwm8qUM9L7tYkdh8YY/ax/vym?=
 =?us-ascii?Q?w8DaZ3gD35szS7wjVo13ZWHUkWsCmmkrYIDApxWJl58lusUBPrJv/qxnJyNJ?=
 =?us-ascii?Q?XXM/eiroPn1xAuFyK/CeYnxxY3gGThZCy6ZU03crtzEpAeX35L88JWSTLJ8q?=
 =?us-ascii?Q?V781drJQQi3c+xvLHyMm8Q4UFLuSdif+Sbu9KgiTPcFUUqT68TPPIxvtRtmW?=
 =?us-ascii?Q?SrCRVobzSfXjcBGdEt7D8gKogsdl/LJwc0hpvop8OUkxvxTRz4f4p1avwbiX?=
 =?us-ascii?Q?EDOgHBWcAQkT51KU+hCEqSIIvAc/haWOoPV4hXyaSxZAqrEUGKXKtr6iDHsY?=
 =?us-ascii?Q?AmfpmQGzkOIrTsCn0T8f1BuDW4o0D73llvz2Vx2kuEsNVzrWtlJI14JiPUpc?=
 =?us-ascii?Q?50KqB96D9AlEf/3EHDXz9lJbYTx3q3tHBlVEIzu3BEnNfHFpw5Ey7R1p/fkN?=
 =?us-ascii?Q?piC90wtSrMC1HxG2R6i7W1e6dWT8XTcH/kqCghHXIvqaxCkNiQLnPJB7mid8?=
 =?us-ascii?Q?jJpz4PieJNXJYrjphiVswJa1hICPwficlIssCUDkzjjt0nvXHRv2EziIhknG?=
 =?us-ascii?Q?F94QRJUINYV2+Q+4Zw9d/vyvBnLYD1XtXRzaPIT1RJDF4Vi3BETp3qojDd0/?=
 =?us-ascii?Q?9PB4k2bFhxaruzvhlxrqM7D9goUt75h/B0YCtIecgyHvoa4Zb3OW6phPsoLM?=
 =?us-ascii?Q?HJVZNkb+bgQ4yQYbCd6Fa1uqjb8RGCOqkpKS961pIhpEtayeATE/uwB6dxc4?=
 =?us-ascii?Q?Hft8aRIm9wvBLKJug0YuOgONrNbt0uADviH0DhSKzQFI/OQYcRULSHbuNEz7?=
 =?us-ascii?Q?5JyuTd11sMDzUaxmVW6NzL1CMuFm6IrS2I7dKIRAQbsnz2jIpKnSQHpR49AO?=
 =?us-ascii?Q?Nbj7PX6luId2Cddd3aW3vTt6ujhxaK5iFey1uQudWZX82w6vN84T+x8FTSif?=
 =?us-ascii?Q?T/o+FSmrz5BYnnOPBPqgMnYxCV5/9ouuzrgo4FIlXAURRlSoytufwtRT+RbT?=
 =?us-ascii?Q?26GmYiRxBDsQsa4cOTmSSVEqFvW0QKOGHyj7BbCjjTDyXonwXdsBMWkba1FQ?=
 =?us-ascii?Q?Dm0bh8wbG2jt2WWXK9YjFBjfvDyKtHvAbWl1Ld0XgiwcLiPN8K/QBq1sJYXi?=
 =?us-ascii?Q?qIFrZTJYt6YlhmeluY0+jyh4ySuMCv1Oj24/K+MjrXGuiw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4c47d6-9bec-4bb4-f422-08dabf24d9de
X-MS-Exchange-CrossTenant-AuthSource: MN2PR01MB5358.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2022 11:57:07.0557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6754
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

This version of the patch has been tested on an M1 Ultra Mac Studio,
as well as an M1 MacBook Pro, and userspace launches successfully
while using the IRQ path for I2C transactions.

Signed-off-by: Arminder Singh <arminders208@outlook.com>
---
This version of the patch fixes some reliability issues brought up by
Hector and Sven in the v3 patch email thread. First, this patch
increases the timeout value in pasemi_smb_waitready to 100ms from 10ms,
as the original 10ms timeout in the driver was incorrect according to the
controller's datasheet as Hector pointed out in the v3 patch email thread.
This incorrect timeout had caused some issues with the tps6598x controller
on Apple silicon platforms.

This version of the patch also adds a reg_write to REG_IMASK in the IRQ
handler, because as Sven pointed out in the previous thread, the I2C
transaction interrupt is level sensitive so not masking the interrupt in
REG_IMASK will cause the interrupt to trigger again when it leaves the IRQ
handler until it reaches the call to reg_write after the completion expires.

Patch changelog:

v3 to v4 changes:
 - Increased the timeout value for I2C transactions to 100ms, as the original
   10ms timeout in the driver was incorrect according to the I2C chip's
   datasheet. Mitigates an issue with the tps6598x controller on Apple
   silicon platforms.
 - Added a reg_write to REG_IMASK inside the IRQ handler, which prevents
   the IRQ from triggering again after leaving the IRQ handler, as the
   IRQ is level-sensitive.

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

v3: https://lore.kernel.org/linux-i2c/MN2PR01MB5358ED8FC32C0CFAEBD4A0E19F5F9@MN2PR01MB5358.prod.exchangelabs.com/T/

v2: https://lore.kernel.org/linux-i2c/MN2PR01MB535821C8058C7814B2F8EEDF9F599@MN2PR01MB5358.prod.exchangelabs.com/T/

v1: https://lore.kernel.org/linux-i2c/MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com/T/

 drivers/i2c/busses/i2c-pasemi-core.c     | 32 ++++++++++++++++++++----
 drivers/i2c/busses/i2c-pasemi-core.h     |  5 ++++
 drivers/i2c/busses/i2c-pasemi-platform.c |  6 +++++
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 9028ffb58cc0..7d54a9f34c74 100644
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
@@ -78,14 +80,21 @@ static void pasemi_smb_clear(struct pasemi_smbus *smbus)
 
 static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 {
-	int timeout = 10;
+	int timeout = 100;
 	unsigned int status;
 
-	status = reg_read(smbus, REG_SMSTA);
-
-	while (!(status & SMSTA_XEN) && timeout--) {
-		msleep(1);
+	if (smbus->use_irq) {
+		reinit_completion(&smbus->irq_completion);
+		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
+		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
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
@@ -356,3 +369,12 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	return 0;
 }
+
+irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
+{
+	struct pasemi_smbus *smbus = dev_id;
+
+	reg_write(smbus, REG_IMASK, 0);
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

