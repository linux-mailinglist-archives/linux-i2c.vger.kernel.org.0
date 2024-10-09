Return-Path: <linux-i2c+bounces-7308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2071996D0B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 16:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F43A1C224A2
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 14:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675CA19EED6;
	Wed,  9 Oct 2024 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a8NfnaQs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CBB19995E;
	Wed,  9 Oct 2024 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482474; cv=none; b=l2WLqzepj2EcmKi9rPeXdTSDzHkrb52IcBOXHXjuNJwRAJ9om2/6wffjQ+tHF0/XGM3rPRSJicBkHcIZp26qk/VwgAqWbuhpGwPlB+DnSonRumnZ4S5PimMq31Lg6btVd7+YSiguFzpoBJpTL4+2DzW8BAjfYLNdj4EeHkjItd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482474; c=relaxed/simple;
	bh=yfaVgBPbGJvvDLZMPnLTI2HWdOa8D9pnhvAtR5Ux59U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TeTbipAUl3Z8oJbPS1T6V8svv9ngR01Ove9eqkTewAbbL++rAwk8tTh+jcBlI4qVClAJXhV6XCOd2BQcPdEHubh64bP5xvp3JWF6kHDaUcM96nzqK5oVlVzX5Mx8qXld+UVAebcG/DPUCRxbKc+ZuVIf1/89yyFnqZ3vHHehfkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=a8NfnaQs; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF36E1BF20E;
	Wed,  9 Oct 2024 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728482470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PT2bSMDA58VSAM1Q9Akc5IbSMb7rRJeyxTRzP7FAJ8=;
	b=a8NfnaQsS+Jzoxbcv4gY17SL9n5+x7zfsvdNPXdI7XrpvaBaq17tS1D6Z7tQoR/AR3v0Xj
	McNGKxxGqo4HO/Vjt8+zswwAcVGpbaI4e2eZ9PAPFAm+I1BsI0IYPTa8wiOFdAUehrpkWG
	tP4RVgDdkcNc8JVRhjQ+opJMDk4r7ll1C3M+SAXbkYG7e1JYjvDAUfBcTbWeV74X+EzEO6
	/9dSzBoyWKzZA6kVEvkhloI2twwTjeI6xlvE4YoyvbCj4vlibBKTP4OoBYzCKBKy9+BRhe
	tRMugjaYSLFUnM6eRhszVB2Kgd/0LVehoLnntwuy8z5ulKblxUnF1FJ92OB5zA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 09 Oct 2024 16:01:10 +0200
Subject: [PATCH v3 4/6] i2c: nomadik: support Mobileye EyeQ6H I2C
 controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241009-mbly-i2c-v3-4-e7fd13bcf1c4@bootlin.com>
References: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Add EyeQ6H support to the nmk-i2c AMBA driver. It shares the same quirk
as EyeQ5: the memory bus only supports 32-bit accesses. Avoid writeb()
and readb() by reusing the same `priv->has_32b_bus` flag.

It does NOT need to write speed-mode specific value into a register;
therefore it does not depend on the mobileye,olb DT property.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index c40328d1bca6cdefc61906cf9160f8411e37922a..8f52ae4d6285af2dd2b3dc7070672757e831a019 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -6,10 +6,10 @@
  * I2C master mode controller driver, used in Nomadik 8815
  * and Ux500 platforms.
  *
- * The Mobileye EyeQ5 platform is also supported; it uses
+ * The Mobileye EyeQ5 and EyeQ6H platforms are also supported; they use
  * the same Ux500/DB8500 IP block with two quirks:
  *  - The memory bus only supports 32-bit accesses.
- *  - A register must be configured for the I2C speed mode;
+ *  - (only EyeQ5) A register must be configured for the I2C speed mode;
  *    it is located in a shared register region called OLB.
  *
  * Author: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
@@ -1075,6 +1075,10 @@ static const struct of_device_id nmk_i2c_eyeq_match_table[] = {
 		.compatible = "mobileye,eyeq5-i2c",
 		.data = (void *)(NMK_I2C_EYEQ_FLAG_32B_BUS | NMK_I2C_EYEQ_FLAG_IS_EYEQ5),
 	},
+	{
+		.compatible = "mobileye,eyeq6h-i2c",
+		.data = (void *)NMK_I2C_EYEQ_FLAG_32B_BUS,
+	},
 };
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)

-- 
2.46.2


