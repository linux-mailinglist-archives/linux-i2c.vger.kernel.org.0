Return-Path: <linux-i2c+bounces-13953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E706AC2CBAF
	for <lists+linux-i2c@lfdr.de>; Mon, 03 Nov 2025 16:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 73A773490CB
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Nov 2025 15:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF2331B111;
	Mon,  3 Nov 2025 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rUKgWy1Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663FA31AF3D
	for <linux-i2c@vger.kernel.org>; Mon,  3 Nov 2025 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183155; cv=none; b=lUoANFjxv73JRJ4QqW+j8CVbNjtVn+qaa1OPY45Pw5aLkvkU4wFUlS8Gfmq7pMndTD1c0qdlVRBKp6f4jsnfLpoqbm2bpin5+9IBSWQjQsGVLQYtaHlMufiJDUkZNGLzeRCrSV9esnygitMOpKcLqKdphJWQYFDSTEYNFUzonYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183155; c=relaxed/simple;
	bh=bBgIr6JUsuYYknhvEhh7RnSXGdp0mgqmov6yc9DC7PA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QZIr7IGSdry11Hd1txqOXa+8lwartVzeeLDnnEdyCnuN3Ww2s/d48aJoz9AAYPHJtkLEKJQGKMRgZ61Gxv4FNxWdQcnWv8+qL21esphJPBl8ElIRUPQI6Q77ZVQ1LEAcAjoOT4IDnGWdLxRqNg9cbFmHbPZD9siupcKgZFQ0VtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rUKgWy1Q; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63c2adf6e76so925943a12.3
        for <linux-i2c@vger.kernel.org>; Mon, 03 Nov 2025 07:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762183152; x=1762787952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5+f6d84n0KJSoU5pEoozoMK2Ugg5v0H8oCSyWaO9WA=;
        b=rUKgWy1Q1/jOIamslH2EU8Zi1MXAa2IE9dyswdC7vtsqnZF1DscczOVlIqHNlSqy0E
         Tq9DiVhZZaUz5i+J79txfR+8ULAhHMlF9GeKDr04HglVASwonKyMu/moNtTbWluLGUjj
         FEBxq91rrBftWQ5TTSoPPS3D6GC2u247RYB5O4WHQdi8u1jQMFaM1f5etoe3I5nKRaj0
         RcBJ7rKN8PjYcZbJ6bUJfZMxs+DGSY3t4FnGPFjL5j8pObKtPpSHRWwQb2K5CyN6mqoS
         1mrZcphk7spWTRck1vUVVd1WcSEvtg0qhDdkPIJs3Mt9l0OE8g0U9KaJC+7qKSS7Apwd
         eZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183152; x=1762787952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5+f6d84n0KJSoU5pEoozoMK2Ugg5v0H8oCSyWaO9WA=;
        b=C4Vbcuy2A0uBQQY8AKgAEsleFB4U7skWSdusDw4mhQTvTJWi2LcGFYFeZsBUDeYkEb
         RZZEP86btRKgmwuoqffa19/fAaO+BV4zLi8IET4NcvGzAhQGOgPfQJPBiHyY2WxMwRb9
         //f9089aqrXJYzKw0TXIqFkkgszx5bvEpfclPJs1o9tBJnmWqRvwHzNTGUh96ssdKQpI
         3u7I7IgNejJOlC9EUGPIq0e+DLRlgWNdLn5Q/uGsXrnAE7cSbmqRep7EuTMeVQPwtrDU
         +S2hdEoLLOVBfzZ6/N14Lp5AwyPszCqGtVDDcgOjDFxZGzm2Fl6FMf+J+B53WIwhd4s4
         2I2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0IpJ3tyoLUhwRum0iaOWcqzxTbGOt3fGB9Tav+hhRoin546eChS3qa2NalvPWPkR4snb1TJWJNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/NX7dhdEqffy62tabrXX1F/kzNvtOUQ9lKEOBTF94PvRm/CVy
	uVXVuF0mLAvTDyBOaKirMSxRtAg+i9MEtfPmS0nN8w3Y7Z8VO75ABqhq/KwKbQbCrDk=
X-Gm-Gg: ASbGncvXZDQH1uzikcPXOemB4uTQ0VbuT7c+BFEw0ylimzwcLLHVPem9Ll0Z/Bh7U6C
	wWivHku0NiH/ZRWlb1XmLuAmeuq0gl27IQN1GrNbdTKcmRUxVa4l7l14VJMbgk1i/QPntnjkibr
	EjJVN4qstGfzF/lfNEDojb+GGEp+Scp4gLCb+ex3hBcwR0okxfjQ6uidvU5wxZRHKvPZaujVQXH
	ur2YNR3zwc7+gZUKvagcpJTWgbI+G+MibnMuXIKe22URsQfcv5S+bkXbR9wttWR7mmFmJN+ZnJ6
	jrR34LrrBNQUSkAuuF60+Fzv7Q+cHWimeFnzGMXtnoonN5yogxNyKgg3bb0QoKTCBdqYo4rTm86
	tjkXZH+IvnLlJKQIsH9X7pfkUGmMjJ+e77b4A6Bpn2clqOs7VuXtrEU4uGPgITi77NkSvgY9Yp1
	6ruLP0OPDeZZdyKxnTcOwXeA==
X-Google-Smtp-Source: AGHT+IEzRTT0eVnZn6K+wCw0BHqOOREk5+HJ73CbIS91sNbqda4jsPUT0st6G9Z5Vsa5XSA7dXvO9Q==
X-Received: by 2002:a05:6402:1471:b0:640:ca67:848c with SMTP id 4fb4d7f45d1cf-640ca67893fmr1174122a12.2.1762183151661;
        Mon, 03 Nov 2025 07:19:11 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64094ec0921sm7549498a12.11.2025.11.03.07.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:19:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Rosin <peda@axentia.se>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wojciech Siudy <wojciech.siudy@nokia.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] i2c: muxes: pca954x: Fix broken reset-gpio usage
Date: Mon,  3 Nov 2025 16:19:06 +0100
Message-ID: <20251103151905.297014-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revert commit 690de2902dca ("i2c: muxes: pca954x: Use reset controller
only") and its dependent commit 94c296776403 ("i2c: muxes: pca954x:
Reset if (de)select fails") because the first breaks all users of the
driver, by requiring a completely optional reset-gpio driver.  These
commits cause that mux driver simply stops working when optional
reset-gpio is not included, but that reset-gpio is not pulled anyhow.

Driver cannot remove legacy reset-gpios handling.

Fixes: 690de2902dca ("i2c: muxes: pca954x: Use reset controller only")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 50 +++++++++++++----------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 75c8d08fa24e..b9f370c9f018 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -118,6 +118,7 @@ struct pca954x {
 	raw_spinlock_t lock;
 	struct regulator *supply;
 
+	struct gpio_desc *reset_gpio;
 	struct reset_control *reset_cont;
 };
 
@@ -315,25 +316,6 @@ static u8 pca954x_regval(struct pca954x *data, u8 chan)
 		return 1 << chan;
 }
 
-static void pca954x_reset_assert(struct pca954x *data)
-{
-	if (data->reset_cont)
-		reset_control_assert(data->reset_cont);
-}
-
-static void pca954x_reset_deassert(struct pca954x *data)
-{
-	if (data->reset_cont)
-		reset_control_deassert(data->reset_cont);
-}
-
-static void pca954x_reset_mux(struct pca954x *data)
-{
-	pca954x_reset_assert(data);
-	udelay(1);
-	pca954x_reset_deassert(data);
-}
-
 static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
@@ -347,8 +329,6 @@ static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 		ret = pca954x_reg_write(muxc->parent, client, regval);
 		data->last_chan = ret < 0 ? 0 : regval;
 	}
-	if (ret == -ETIMEDOUT && data->reset_cont)
-		pca954x_reset_mux(data);
 
 	return ret;
 }
@@ -358,7 +338,6 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
 	s32 idle_state;
-	int ret = 0;
 
 	idle_state = READ_ONCE(data->idle_state);
 	if (idle_state >= 0)
@@ -368,10 +347,8 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	if (idle_state == MUX_IDLE_DISCONNECT) {
 		/* Deselect active channel */
 		data->last_chan = 0;
-		ret = pca954x_reg_write(muxc->parent, client,
-					data->last_chan);
-		if (ret == -ETIMEDOUT && data->reset_cont)
-			pca954x_reset_mux(data);
+		return pca954x_reg_write(muxc->parent, client,
+					 data->last_chan);
 	}
 
 	/* otherwise leave as-is */
@@ -550,10 +527,29 @@ static int pca954x_get_reset(struct device *dev, struct pca954x *data)
 	if (IS_ERR(data->reset_cont))
 		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
 				     "Failed to get reset\n");
+	else if (data->reset_cont)
+		return 0;
+
+	/*
+	 * fallback to legacy reset-gpios
+	 */
+	data->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(data->reset_gpio)) {
+		return dev_err_probe(dev, PTR_ERR(data->reset_gpio),
+				     "Failed to get reset gpio");
+	}
 
 	return 0;
 }
 
+static void pca954x_reset_deassert(struct pca954x *data)
+{
+	if (data->reset_cont)
+		reset_control_deassert(data->reset_cont);
+	else
+		gpiod_set_value_cansleep(data->reset_gpio, 0);
+}
+
 /*
  * I2C init/probing/exit functions
  */
@@ -593,7 +589,7 @@ static int pca954x_probe(struct i2c_client *client)
 	if (ret)
 		goto fail_cleanup;
 
-	if (data->reset_cont) {
+	if (data->reset_cont || data->reset_gpio) {
 		udelay(1);
 		pca954x_reset_deassert(data);
 		/* Give the chip some time to recover. */
-- 
2.48.1


