Return-Path: <linux-i2c+bounces-11079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0DABE3F0
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17B2A7A55AC
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DF427F759;
	Tue, 20 May 2025 19:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmUDIx89"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECAE2820BE
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770257; cv=none; b=YHhYZWCE7S/k3d9G33e3DCWVrm39MF3bxMMYNJf3unothKx2nstM2t6x+8TbHTod72RVucRcBhJ5wkYvCZpR1pZYj8n5FUvosNTpzfws2I3xpcU0K/rXF1Z+NCYD+jLAGzNqAK9YWmbrblRN7q4GvMCcYIopThf6OFVKEkbKkyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770257; c=relaxed/simple;
	bh=YqjOWrzlHnNKu5uHpA1rE4wWliA7EPUf+cDA2KE8X3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpG6IkwqMfCdo8dEkrtx2gzr8ZlSpVhSBMdZS5dh4Mb6oGBU9RFAHMzghscVVZaCAPVUMdygat6uZKkZHzUxaZEXBx45ZA0swfXVgXYBRYicegfB8x+JAQC5sZZFKIQriM6GtavYnO33KzwcZRn0RKzExbWD0Uo31IEYbr4FfrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmUDIx89; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acbb85ce788so1193158466b.3
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770254; x=1748375054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uDr8J6lTyQptmES90WjIqWyVhKsxxX+fGaD8I9r3OA=;
        b=hmUDIx894ObbgnykcKcvJUJeACaOi2OxNEVe6w1TpgG2yZCHghtcX/fP3s69hNuSrX
         ZBSrbRF+I18DBq3Slw8DwkkCPyoefEf2XH/lGfnNc8pBDeqztEhIdHNTz7tl3jvv4z6H
         IJAdpFhBRzuHXDiYbIhUzBRCEpyFSSRGxd54tNQI8pydOyNlwgvgADlhziOqnHFfpsZK
         589cS/hLGTVuZtUW1VfKLJr4XVVc/HUELWZlQyajkienbWeG5aToGQggA2WRLWt2VPfw
         sCGjxqUBzg9vQ1LaeGsADS42UsX67T6D/C/6IscD3vABxvtukCFPJCW3fRQQCH8baYX8
         +9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770254; x=1748375054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uDr8J6lTyQptmES90WjIqWyVhKsxxX+fGaD8I9r3OA=;
        b=k7i9xyD+7W7nQSmwPJ5z44wvLk4rse3QENuNhV1XntBFT5bKG2EPS8VgOGP7Vm59bU
         ixkBrqZ8kFNcr4d6BLPTYD9XEA30MaomYOI6FOpoyhUbFZ1bIw7UjyVTbQXUjDcTLneX
         hUIIX6n9R5Vp8B4zJlOudXgm8M15I4ZtgqWgFeroa8qShdRyDv4Wmj6gMd0MMk5EFtZu
         2hEyphIbP+LWiILE70jIxSyMmRa14qNNhAmGxONRQJtxoK3I5Bi2m2dsyxFai1qg/L4V
         OMmxNPYo8jfmZ/yLlBdSm6KEe/LREhya3hT6XWGVoe9+OPNzGQ5ynhwP8ELY7NqcWJn/
         EV5g==
X-Gm-Message-State: AOJu0YwXz+UkIezpEJ6gDsYtKl6VVQkOB/kzNz3bwNV86gOHgNeKEHVI
	U7UH2Qw3gNhSW5ea2ygmxDqWkYkHDreLMbaLrT+GwcH6oHhCBxoHQRrtHFmweQOqJLE=
X-Gm-Gg: ASbGnctzoxIH1Xp+3/eNnGJNqmO+XquClKR4U8z5/i3X6XSWd4wQrwZ3CPuNZ0I3Mq+
	olhFaB9lg4zK0Os6SvQj7RyVJus5LfDka4WPHz3bzfvURycO+YoszNNIoMYbJlCsS00UMkZJT5J
	SNO8bLrlIg2wOhUQuf1pT21fG2nNZfEzoSJ2Pqm65MWb8OgWJ7Oh2aauD3cYzTKYnvoUti9l5fX
	/5EawR9bT2fDYI68KiVP0s00dSVKKXrvb1YcGWRj7N+NvrmQM3+G/AjjQAoa/b2t9kExoLCpd6Y
	UgoZTl4veD05n+fYzdofhA0iK1zHmnbJ472VcZgcdJ5eXvbwuQsljoGM+r+9+ZyTa89eoXCOJ/y
	BD675DA==
X-Google-Smtp-Source: AGHT+IHi/x1DeJ5Bvev3uQKxrlCpxcgHtSVGvBCkHn+b8S08rkyZ0kDW8PsaTB7/EzQ2bURI1UeWwQ==
X-Received: by 2002:a17:907:1b0f:b0:ad5:5293:f236 with SMTP id a640c23a62f3a-ad55293f282mr1288606266b.3.1747770253678;
        Tue, 20 May 2025 12:44:13 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:13 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 05/10] i2c: stm32f4: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 20 May 2025 21:43:55 +0200
Message-ID: <20250520194400.341079-6-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520194400.341079-1-e.zanda1@gmail.com>
References: <20250520194400.341079-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 53 +++++++++++++-------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index b3d56d0aa9d0..44e8b04962bb 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -163,11 +163,9 @@ static int stm32f4_i2c_set_periph_clk_freq(struct stm32f4_i2c_dev *i2c_dev)
 		 * to hardware limitation
 		 */
 		if (freq < STM32F4_I2C_MIN_STANDARD_FREQ ||
-		    freq > STM32F4_I2C_MAX_FREQ) {
-			dev_err(i2c_dev->dev,
-				"bad parent clk freq for standard mode\n");
-			return -EINVAL;
-		}
+		    freq > STM32F4_I2C_MAX_FREQ)
+			return dev_err_probe(i2c_dev->dev, -EINVAL,
+					     "bad parent clk freq for standard mode\n");
 	} else {
 		/*
 		 * To be as close as possible to 400 kHz, the parent clk
@@ -175,11 +173,9 @@ static int stm32f4_i2c_set_periph_clk_freq(struct stm32f4_i2c_dev *i2c_dev)
 		 * maximum value of 46 MHz due to hardware limitation
 		 */
 		if (freq < STM32F4_I2C_MIN_FAST_FREQ ||
-		    freq > STM32F4_I2C_MAX_FREQ) {
-			dev_err(i2c_dev->dev,
-				"bad parent clk freq for fast mode\n");
-			return -EINVAL;
-		}
+		    freq > STM32F4_I2C_MAX_FREQ)
+			return dev_err_probe(i2c_dev->dev, -EINVAL,
+					     "bad parent clk freq for fast mode\n");
 	}
 
 	cr2 |= STM32F4_I2C_CR2_FREQ(freq);
@@ -772,22 +768,19 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->base);
 
 	irq_event = irq_of_parse_and_map(np, 0);
-	if (!irq_event) {
-		dev_err(&pdev->dev, "IRQ event missing or invalid\n");
-		return -EINVAL;
-	}
+	if (!irq_event)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "IRQ event missing or invalid\n");
 
 	irq_error = irq_of_parse_and_map(np, 1);
-	if (!irq_error) {
-		dev_err(&pdev->dev, "IRQ error missing or invalid\n");
-		return -EINVAL;
-	}
+	if (!irq_error)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "IRQ error missing or invalid\n");
 
 	i2c_dev->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "Failed to enable clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
+				     "Failed to enable clock\n");
 
 	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rst))
@@ -807,19 +800,15 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq_event, stm32f4_i2c_isr_event, 0,
 			       pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq event %i\n",
-			irq_event);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request irq event %i\n", irq_event);
 
 	ret = devm_request_irq(&pdev->dev, irq_error, stm32f4_i2c_isr_error, 0,
 			       pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq error %i\n",
-			irq_error);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request irq error %i\n", irq_error);
 
 	ret = stm32f4_i2c_hw_config(i2c_dev);
 	if (ret)
-- 
2.43.0


