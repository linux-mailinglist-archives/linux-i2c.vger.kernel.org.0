Return-Path: <linux-i2c+bounces-14363-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FEC9AA0A
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 09:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C26CB3A74F1
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 08:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248E530748B;
	Tue,  2 Dec 2025 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY2WeCmh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30B7307AE9
	for <linux-i2c@vger.kernel.org>; Tue,  2 Dec 2025 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663078; cv=none; b=K5mmL0f+lKYEQEBXl6E9LX1T6ouP5VYSPExiTWzg1z8RwxoSN1Lx7G10h2llKAkTZ8alqZ38yZ4MS1mUABfcB6ubaxv4ScuXHmDNQt3xLABimxae7RAEH5X5jRDu8xEgtZ9BrpYl1V/bI5G42OfiiYe9nK1P1PFjYF5zsr9YwIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663078; c=relaxed/simple;
	bh=PGfDlWvGSscBxbVs8v8ZTNXGs8v6TwzoMOGQNHx4lNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QKfYThxs1gxGAq+ZsBHWgj78jl4I9gxJWvlI+lc6pWYaRyRq6WdwUcGYlj5KG/4uqMy5JvdRVrihPn+i8wk8rQoWM7au7kSWmH3Ff7NDXnDjflWfmsx37gv0P8zImhk6wp1GzT+dUeQpiyRQFvPRfPXp7yDjjVVCc3jNgSxuDaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY2WeCmh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-595819064cdso6814121e87.0
        for <linux-i2c@vger.kernel.org>; Tue, 02 Dec 2025 00:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663075; x=1765267875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adLvNDTeiStKP0eZHWwvkkAFK5IxR7T1lQU7JiLOZOA=;
        b=iY2WeCmhyd+DnNMSZxA1rcJvk+9gdq4L32wCgBallVVXM6FSowsBhrckaYj+S9YN1O
         FWkXXGHx72Ng3ZCcisJYG045Qa1MdvxeVs/GZ3zKa1fgKll1Uf1fa//5qcUaTJHa0Nm/
         Xvg0z6SqOEe8ZSmcb3pARBDHxvkSgiCNJ0a+iqs8vy3yiKDim8yimTx46NksPJjU8kBg
         s9TltZ0gG38g7Kdm8SVIA+5sWrdK01UN6fDIINHRNyU40W3dPwNPazxxkisq0xnY44E/
         tIrA0Oxw3nfc/SFKRN0KLmP6t2JilZ3h+VZyUYRpbK3ZAbUH00rZTMDBR74UeyohrhLp
         48yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663075; x=1765267875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adLvNDTeiStKP0eZHWwvkkAFK5IxR7T1lQU7JiLOZOA=;
        b=RZGyWVLgBCatI0Nf7dxliX1rQuToPxDbgQRcW1SBzyfOdij6cjGZ5K8h26wAC24X26
         GkXAeggkJ5FGKHouXLWUxxsr6mV7doYBSgnugWAOVDIK0q/ZVp+/jWI0+vsI9IYXCHG+
         pRJ6AHwfftl0jtVOtAvOn5mzWGUMPbJTDbZUy+4wyvSWv8mRxX9H1DD1T/HyavhtpagX
         F4SDlFFy5BtRgp347L2LcSMp2dClZhdmd/2NXSp7yWFJNjnXfismqF0ojcBLU9l1O3Ld
         xWsCOKpfUc3pjtviI5y0qeS8UNqPNGM/lh4eI7MZq6aTE7/EpRsBNoRb32rUEax2jcHN
         YE2A==
X-Gm-Message-State: AOJu0YwpReuyGmlpsf+uwuqHWXYiCh+dmL8hxV8WUl0UGguYSsyBxd7Y
	FENxV9DUuY8R4dofFINo8H0Us2+p0YmqR/jznttwQTA+Q2JcsvNwyZgq
X-Gm-Gg: ASbGncvlhBhd3EZWJEiplf3jX/TAhuvWteB+Y1kcJ53/fwJdq5pjaSM/HMSvjRkymhK
	FQCiF01tTUaLSu22xjzq5zoHf7raoHW6phMh6dPQ0CtB97id3X1vg5XRPsr4IqHHzOWrkCbnUis
	vMFTKCGPhsIRmvm7rsMN0Dx5xcCwC1Zxp7yN50/5BHjyDPJ85qwYVLSufIF7nfeoN1IVMBdImCA
	LVvsAYZnS2uMlFazINHBGwlNttESulSDg3fH1xLDZDVDk9EvXCpgg17FEo2JCrsSF9xI9hajHRj
	YuKCvvMKbXQz7tst+sqnGYN4br7MFTmWNLhdX1WGrSGAnfUWXAx8MsyTXiVKmhSk21CST8ZYhTf
	F496Sdq4F86sH+bBEvgGHron/I1jy/KSQF32oAoukpnIxVXsGL9mlE2te1UsIKoSa3xhSbRdn9K
	VTzT+gS+aArowlT8PhWdodK/UK2eK3h8FuC5jJL3/O5IdVJY0iDo3mTy7G
X-Google-Smtp-Source: AGHT+IE/6Ujf/ndJP175kyG+RcorUj0UCUQD+EBcycMSfGLIB/MQTBPPzYVUYN1vTXHMq+R8Z5NnZw==
X-Received: by 2002:a05:6512:1081:b0:594:27de:77e7 with SMTP id 2adb3069b0e04-597cfb0430dmr577541e87.15.1764663074635;
        Tue, 02 Dec 2025 00:11:14 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:13 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:09:51 +0100
Subject: [PATCH RESEND v3 4/5] i2c: davinci: add support for setting bus
 frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-i2c-mux-v3-4-877dcf478a9f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=PGfDlWvGSscBxbVs8v8ZTNXGs8v6TwzoMOGQNHx4lNY=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp8Qi2I962N48ZEi7OQaJbPonP2RofpIcDdIF
 Qc2stjpsfaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6fEAAKCRCIgE5vWV1S
 MpjuD/9HEkKWHOP0IZvSLXAbb4TgULotS/GvAHKuELjbV+pQuEp20j6vtDCA6wZCj06iSNZ9ePR
 ek8ISCZzlQIutSBTaZNKOu4nQdehiSt2CksmXna0GE9ZQykzpoBaaxqgUF5GPGIjKO3l2CYbKXo
 0xU0lSoXtu1g0nHau5Pmh5YiAq8ATCyfGmIrdZ2xvadty8mnbmjsoZjzs0IorM8vBw2TnsaRGqo
 2HlE8c9ZsuGKLMe2qsea1LyC+keoiQJYwaDta95B6Ertzb8SSlgQYebIt5lDQwwi2O0TkRgO8jY
 emFyvKGvc7LDIkUwT/0Op48swG7+Fq1NFoeDyDjzTbBqqMXdGnCP7/W5P3/UFA4Q+VBdLI2McOs
 PvO0M9Px1ZizYBOG3fhDr2y62s8FEQ8tolg3sdnPqYreWGVzpyMhP6rVGtL7jcClL/uyKX+X604
 2Cd5p8n6skJuD8+mFxR+l/+dA9w58wrEQ/6VoTFIc1JH5neJ7JJZ+B9gEJ3onGZS9vweV6PrXRY
 nIM8FBphBbhuasC/rr9G+v+S7R/az0xJg0Lf6fp7l05klJGTKWM1U0rU/tMOp9EcurPPYNKc7hy
 x3WAJmuNP5NFXrcYPb57XNRuBE87aDHZYe/Y4tMclQPW0488mVo46NRjY2qXDnqZ8eICurOxJja
 qVdsLXxWV4ZU6WA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Populate adapter with clock_hz and set_clk_freq to enable support for
dynamic bus frequency.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 82f295619c4d..fdde573eb59d 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	if (dev->bus_freq_hz == clock_hz)
+		return 0;
+
+	dev->bus_freq_hz = clock_hz;
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return 0;
+}
+
 /*
  * This routine does i2c bus recovery by using i2c_generic_scl_recovery
  * which is provided by I2C Bus recovery infrastructure.
@@ -810,6 +831,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->clock_hz = dev->bus_freq_hz;
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.51.2


