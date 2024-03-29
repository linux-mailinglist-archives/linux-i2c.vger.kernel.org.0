Return-Path: <linux-i2c+bounces-2693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF258933E2
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Mar 2024 18:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D17285221
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Mar 2024 16:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D6C156899;
	Sun, 31 Mar 2024 16:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Ohxy/Tpi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB73156227;
	Sun, 31 Mar 2024 16:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711903214; cv=none; b=SAa0ecGBHl7Q7OYrK4MvVEe3u+6t77w41IKEzAGPPUQB1qZRCvxo9fEwMByr2CxWm0lG8rmeyQVavBC4oaRr3tWiirpgvbik42y8sNqzJjS7AB5UMWQuek3AFMwz8hYI574aAYkte3rl3xp6oMFkBfFnfYFIJif9d+2KPtvYLk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711903214; c=relaxed/simple;
	bh=K0qocvwvrYWRNQvYnDS/H+UbwvsMZhO+c1XJJkrTUD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XUSKdTILJZphx2aHi0L6OKkph4uHzG1MQY2x3oc3sIdXsyagCQvxtaUZawFt+yRsWa41actZkcAE2KnJp7gr7eeVmqsLf/VdSyt1E0DS5qS/58CZ+KCjC/ITH3DIZLw8QG9VvlPI/JRIKf2E8qElxagfWTyzgfZz99lSTFGVrv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=fail smtp.mailfrom=lists.freedesktop.org; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Ohxy/Tpi; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=lists.freedesktop.org
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id A0FA0208B7;
	Sun, 31 Mar 2024 18:40:09 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LT5PJUeKUl9y; Sun, 31 Mar 2024 18:40:08 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 575D1208B8;
	Sun, 31 Mar 2024 18:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 575D1208B8
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout1.secunet.com (Postfix) with ESMTP id 4A58480004A;
	Sun, 31 Mar 2024 18:40:05 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:40:05 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:37:12 +0000
X-sender: <intel-gfx-bounces@lists.freedesktop.org>
X-Receiver: <martin.weber@secunet.com> ORCPT=rfc822;martin.weber@secunet.com
X-CreatedBy: MSExchange15
X-HeloDomain: mbx-essen-01.secunet.de
X-ExtendedProps: BQBjAAoAnnUFfe5Q3AgFADcAAgAADwA8AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50Lk9yZ2FuaXphdGlvblNjb3BlEQAAAAAAAAAAAAAAAAAAAAAADwA/AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5EaXJlY3RvcnlEYXRhLk1haWxEZWxpdmVyeVByaW9yaXR5DwADAAAATG93
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 10.53.40.197
X-EndOfInjectedXHeaders: 12339
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=131.252.210.177; helo=gabe.freedesktop.org; envelope-from=intel-gfx-bounces@lists.freedesktop.org; receiver=martin.weber@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 7F7F72083E
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Ohxy/Tpi";
	dkim-atps=neutral
X-Original-To: intel-gfx@lists.freedesktop.org
Delivered-To: intel-gfx@lists.freedesktop.org
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6B14020E6F42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1711731737;
 bh=1xAt8oLDivBzcFZmj4k6LuWQeVtOX6JrcyzssXeZ3pU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ohxy/Tpis4rcZr+HmqqXLQ1kevTdDNaAjl+/S10lEH84ShVaJTi7yoXPaEoRlh1Ia
 MyYKE35gS8u9NTdAgaEBLovHzzoDvWALpXM6LFWrBAzoFK88d9+Qat5qDC4ednKXPl
 Kh6ndPQtI1OXBTVsPtSRnotMhgVWfK4FheWQeEeo=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org (open list:CX18 VIDEO4LINUX DRIVER),
 linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
 linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v0 06/14] media: cx18: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:30 +0000
Message-ID: <20240329170038.3863998-7-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 31 Mar 2024 08:50:08 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org>
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

I2S specification has also updated the terms in v.3 to use "controller"
and "target" respectively. Make those changes in the relevant spaces as
well.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/media/pci/cx18/cx18-av-firmware.c | 8 ++++----
 drivers/media/pci/cx18/cx18-cards.c       | 6 +++---
 drivers/media/pci/cx18/cx18-cards.h       | 4 ++--
 drivers/media/pci/cx18/cx18-gpio.c        | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-firmware.c b/drivers/media/pci/cx18/cx18-av-firmware.c
index 61aeb8c9af7f..906e0b33cffc 100644
--- a/drivers/media/pci/cx18/cx18-av-firmware.c
+++ b/drivers/media/pci/cx18/cx18-av-firmware.c
@@ -140,22 +140,22 @@ int cx18_av_loadfw(struct cx18 *cx)
 	cx18_av_and_or4(cx, CXADEC_PIN_CTRL1, ~0, 0x78000);
 
 	/* Audio input control 1 set to Sony mode */
-	/* Audio output input 2 is 0 for slave operation input */
+	/* Audio output input 2 is 0 for target operation input */
 	/* 0xC4000914[5]: 0 = left sample on WS=0, 1 = left sample on WS=1 */
 	/* 0xC4000914[7]: 0 = Philips mode, 1 = Sony mode (1st SCK rising edge
 	   after WS transition for first bit of audio word. */
 	cx18_av_write4(cx, CXADEC_I2S_IN_CTL, 0x000000A0);
 
 	/* Audio output control 1 is set to Sony mode */
-	/* Audio output control 2 is set to 1 for master mode */
+	/* Audio output control 2 is set to 1 for controller mode */
 	/* 0xC4000918[5]: 0 = left sample on WS=0, 1 = left sample on WS=1 */
 	/* 0xC4000918[7]: 0 = Philips mode, 1 = Sony mode (1st SCK rising edge
 	   after WS transition for first bit of audio word. */
-	/* 0xC4000918[8]: 0 = slave operation, 1 = master (SCK_OUT and WS_OUT
+	/* 0xC4000918[8]: 0 = target operation, 1 = controller (SCK_OUT and WS_OUT
 	   are generated) */
 	cx18_av_write4(cx, CXADEC_I2S_OUT_CTL, 0x000001A0);
 
-	/* set alt I2s master clock to /0x16 and enable alt divider i2s
+	/* set alt I2s controller clock to /0x16 and enable alt divider i2s
 	   passthrough */
 	cx18_av_write4(cx, CXADEC_PIN_CFG3, 0x5600B687);
 
diff --git a/drivers/media/pci/cx18/cx18-cards.c b/drivers/media/pci/cx18/cx18-cards.c
index f5a30959a367..d9b859ee4b1b 100644
--- a/drivers/media/pci/cx18/cx18-cards.c
+++ b/drivers/media/pci/cx18/cx18-cards.c
@@ -82,7 +82,7 @@ static const struct cx18_card cx18_card_hvr1600_esmt = {
 	},
 	.gpio_init.initial_value = 0x3001,
 	.gpio_init.direction = 0x3001,
-	.gpio_i2c_slave_reset = {
+	.gpio_i2c_client_reset = {
 		.active_lo_mask = 0x3001,
 		.msecs_asserted = 10,
 		.msecs_recovery = 40,
@@ -129,7 +129,7 @@ static const struct cx18_card cx18_card_hvr1600_s5h1411 = {
 	},
 	.gpio_init.initial_value = 0x3801,
 	.gpio_init.direction = 0x3801,
-	.gpio_i2c_slave_reset = {
+	.gpio_i2c_client_reset = {
 		.active_lo_mask = 0x3801,
 		.msecs_asserted = 10,
 		.msecs_recovery = 40,
@@ -176,7 +176,7 @@ static const struct cx18_card cx18_card_hvr1600_samsung = {
 	},
 	.gpio_init.initial_value = 0x3001,
 	.gpio_init.direction = 0x3001,
-	.gpio_i2c_slave_reset = {
+	.gpio_i2c_client_reset = {
 		.active_lo_mask = 0x3001,
 		.msecs_asserted = 10,
 		.msecs_recovery = 40,
diff --git a/drivers/media/pci/cx18/cx18-cards.h b/drivers/media/pci/cx18/cx18-cards.h
index ae9cf5bfdd59..86f41ec6ca2f 100644
--- a/drivers/media/pci/cx18/cx18-cards.h
+++ b/drivers/media/pci/cx18/cx18-cards.h
@@ -69,7 +69,7 @@ struct cx18_gpio_init { /* set initial GPIO DIR and OUT values */
 	u32 initial_value;
 };
 
-struct cx18_gpio_i2c_slave_reset {
+struct cx18_gpio_i2c_client_reset {
 	u32 active_lo_mask; /* GPIO outputs that reset i2c chips when low */
 	u32 active_hi_mask; /* GPIO outputs that reset i2c chips when high */
 	int msecs_asserted; /* time period reset must remain asserted */
@@ -121,7 +121,7 @@ struct cx18_card {
 	/* GPIO card-specific settings */
 	u8 xceive_pin;		/* XCeive tuner GPIO reset pin */
 	struct cx18_gpio_init		 gpio_init;
-	struct cx18_gpio_i2c_slave_reset gpio_i2c_slave_reset;
+	struct cx18_gpio_i2c_client_reset gpio_i2c_client_reset;
 	struct cx18_gpio_audio_input    gpio_audio_input;
 
 	struct cx18_card_tuner tuners[CX18_CARD_MAX_TUNERS];
diff --git a/drivers/media/pci/cx18/cx18-gpio.c b/drivers/media/pci/cx18/cx18-gpio.c
index c85eb8d25837..82c9104b9e85 100644
--- a/drivers/media/pci/cx18/cx18-gpio.c
+++ b/drivers/media/pci/cx18/cx18-gpio.c
@@ -204,9 +204,9 @@ static int resetctrl_log_status(struct v4l2_subdev *sd)
 static int resetctrl_reset(struct v4l2_subdev *sd, u32 val)
 {
 	struct cx18 *cx = v4l2_get_subdevdata(sd);
-	const struct cx18_gpio_i2c_slave_reset *p;
+	const struct cx18_gpio_i2c_client_reset *p;
 
-	p = &cx->card->gpio_i2c_slave_reset;
+	p = &cx->card->gpio_i2c_client_reset;
 	switch (val) {
 	case CX18_GPIO_RESET_I2C:
 		gpio_reset_seq(cx, p->active_lo_mask, p->active_hi_mask,
@@ -309,7 +309,7 @@ void cx18_reset_ir_gpio(void *data)
 {
 	struct cx18 *cx = to_cx18(data);
 
-	if (cx->card->gpio_i2c_slave_reset.ir_reset_mask == 0)
+	if (cx->card->gpio_i2c_client_reset.ir_reset_mask == 0)
 		return;
 
 	CX18_DEBUG_INFO("Resetting IR microcontroller\n");
-- 
2.34.1


