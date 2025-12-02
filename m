Return-Path: <linux-i2c+bounces-14362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D542C9AA07
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 09:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A8553A7263
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 08:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75B5307486;
	Tue,  2 Dec 2025 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTBzYCMW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BEA30748B
	for <linux-i2c@vger.kernel.org>; Tue,  2 Dec 2025 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663076; cv=none; b=UWA7jHmCJ1itT4SG5JJpG5dsRp28NgYiwTAmR2NGZUkIJmEyEm9MBYK1a9VJvkAPXxUMJtEzhtNJCkaT8kzdzo+oWcSKH8/oH12gy6sFXNNWTK97PJkOy5xiwbLl/c/i7unVgJOOc7v5OwGwj39bNUaGnySbHfEGz1jHPwgaGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663076; c=relaxed/simple;
	bh=v2z8hyK1XpH9sRNEh0FTDATeNOoSf0j273yYmUHhCVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dM56+SIOF9ijk81VmfVmdScDaP5GPzjNBZbq++mh4tzJAci98V9Y0QoEgHi14Xcteok0Lh7I/qhFqifZuKkBKT1ULBID7Q3hSBfX6k7Z0IZgeLNTOAsrF/iqoXgM9h46wL6VQu+fG6kAqLSDgjW4JvMacY0ZmCmVDVDfCgWtmgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTBzYCMW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5942a631c2dso7874768e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 02 Dec 2025 00:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663072; x=1765267872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPjU1ecCTuWGBAgFie+Qqi/4OOu+1k326jCWsM9etTg=;
        b=nTBzYCMWSHogjJy8A22Fr4sRNYgQelVAubOMgu97Dl4l+0ezrz1McxIPQkPn3W8jfG
         OMEZDaK8xfuzjbtHM9Es5lxfbvOVeoSNjtZL1Vlm3VEZH0rdK6O8YKm7O2AymzwqigH1
         L7DFixvgLUy07Uh6m2LYmzpgqjQIC3POFR6ry6ibI03jgPUg+ruI8txcYPfvQyXAHrhR
         V5xF/aZfMplHpsV2yhy88NutnuzlCAzi+CPFPAXW0B+K//694LybivOLHLpxj26tuP+S
         OZKw1zb/znoyKXE6sokE2Pk8g2TWzV1yejdz52AZ/ihxFboOGXVJociRmiYQIYRbDV7Z
         wvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663072; x=1765267872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pPjU1ecCTuWGBAgFie+Qqi/4OOu+1k326jCWsM9etTg=;
        b=u6ty9nBnNncVV20WbEu4YSapJuDtHz/tV5oOBtVMLDQ/+jSL2dDEHLWZPjeMVLxCxw
         mMyiNR4dZQ3PzbGi3tgS+p0jbZvzX6lFlIEQfwTy6ASRF3fhpJXH30aRZYNqB0jcpmcH
         aEf+zHmdkTE4AL2jk6JqZULyc2qOXnosjXC4++7uKoOaAyAi/m/KWsw1jIkR3ZQQsIHO
         PESRCmJ+bM59l4djjJgOElpeU0sK2O61bntILhM9jIZ/CH1EGcnH07wfwwL1VUVCnuTo
         +y2v1c6KUPZlo9de8a8kPYY7F/8mn+28sOOe8PoJgJqt/CpKnw7EifPdxK3Z+qcAZzjU
         qGpg==
X-Gm-Message-State: AOJu0Yz0Ehkc0cnPmHuAcYr1v8VViaBzvWpJb6TIaNtRJD7e0uF7DyH6
	OqJzhcQcW8tk0PbMsYO2FC3kj5MQIjJvypJO0+H9+VAIz9L3yreBkS7l
X-Gm-Gg: ASbGncvWX2K17MehbZ5wp9+6vbPDzenkDPucNgwpXHuKqqLn1E7Pk4HM+XowmMv3wcG
	HX8kY8E2BgUGYwANn7Y04zjZylDxrnUybdTvMn4nvYcOwEt5juxX4HhEihhIwZjR3HeXhV1EtqC
	p8rErkZns/b61CNdzpMLLIkRMhZZkwlFJNFAXzNBSC3Wcy5QwfEzBiwTfDXTtx/q5scqZZklguz
	/bW/1j6sa7PsjALHeNUFHlg/PQx2K0F9yiZth/pZi7/ZXudf+6swy3qNLA5GhDcWeM1GvtC6OvS
	MwIRjMmh71C7nE+lIM573V7EbdIwarSQGF+YB2IsdG83obSV/2iV+eg/Kl7RiPz7S/ad+W5+vwn
	pZqeIviYfBfqhWXKdNusxyyXj60ubLog+WP+wORTFjkO+JT3WaPF4iZQ41PFzCgYx/fGr4/Y7p3
	sCSMctjBqn8t+cwZlhEHHLNVbFqbT28CV1xqXP/uRSSN6Joj2AZABCttRR
X-Google-Smtp-Source: AGHT+IGPFRnF1JlsylxIguYCMgo0UnvFghOw9F7rpNrbszZotcQLK1KLhFurv2Yk69urNHDaAj27Yw==
X-Received: by 2002:a05:6512:e9d:b0:595:7e2f:cc61 with SMTP id 2adb3069b0e04-596a3e987abmr15387967e87.3.1764663072367;
        Tue, 02 Dec 2025 00:11:12 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:11 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:09:50 +0100
Subject: [PATCH RESEND v3 3/5] i2c: davinci: calculate bus freq from Hz
 instead of kHz
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-i2c-mux-v3-3-877dcf478a9f@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=v2z8hyK1XpH9sRNEh0FTDATeNOoSf0j273yYmUHhCVg=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp8LfCH80Z2/O1kVVMD9letrKwmIKdAN6JBZI
 KxyKBifmRaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6fCwAKCRCIgE5vWV1S
 MoSfEADZmQbGCD7jr8sNaQSRLQ3o92mH9KkrlHwUSmibVB3H7pggLXptlMozSNW95T1ztcjqJGK
 uk6pkcWjE6PQJw75ekICw7EFDv1jtt8I/+377dGiLM2/hLTm2yKHkErWvbJze8hUCKzFZNTzBCx
 zJoCorS5lOAMvQzbAG7/u/LGgqc1jBnj3l9uliynlRUq4tp8LqCNn+mv03IjVvLvimVBWnzxzbd
 cp7KxdVlhcyB0NJt4BeYcLSDL86JCK3NzZKE+e74y0mjhiVNHWIrYBlem1NdkMye4d7FjHWYmv1
 eiBRDFCr1oIaz8GbUdlsmsc/FgXRoNfP+7IJ7R44c2bFZiFOX7Nj0/p6oJZw5qheehGcM6FakrN
 0yooDdWcZkbitZDC8DpH3UMnhDXZ8CL8p/BHaeRTALTSRD4JjGKU9C85KHgZK9iyENebYUc4YFM
 dz/6T8nkuYgIUamE2cKGxkcWcs4+aAtXkuGSVjOc0C29UW/40Mps2MjcxZ9+//rvEZGssM6OLgP
 VCoeGDuhz3ljdxbAiTJK6bAiOtLYrbV6Tc8p3LVM3DqtnAwIZpnYzlTGgv871I1lP3NsAUtDQ43
 mAHSkuhFrEiWSlcUa+F6lDBfscbw7f0NcJ9jgHejzdWoa6bJlYXeVXespdx7YVYJKA1pSgKQUEu
 UW8CC8AOTMTCH4w==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

The bus frequency is unnecessarily converted between Hz and kHz in
several places.
This is probably an old legacy from the old times (pre-devicetrees)
when the davinci_i2c_platform_data took the bus_freq in kHz.

Stick to Hz.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a3d4e9e07f4..82f295619c4d 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,8 +117,6 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
-
 struct davinci_i2c_dev {
 	struct device           *dev;
 	void __iomem		*base;
@@ -134,8 +132,8 @@ struct davinci_i2c_dev {
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
-	/* standard bus frequency (kHz) */
-	unsigned int		bus_freq;
+	/* standard bus frequency */
+	unsigned int		bus_freq_hz;
 	/* Chip has a ICPFUNC register */
 	bool			has_pfunc;
 };
@@ -209,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
+	clk = ((input_clock / (psc + 1)) / (dev->bus_freq_hz));
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq * 1000)
+	if (input_clock / (psc + 1) / clk > dev->bus_freq_hz)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq > 100)
+	if (dev->bus_freq_hz > 100000)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -269,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
+	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->bus_freq_hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -761,9 +759,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq_hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.51.2


