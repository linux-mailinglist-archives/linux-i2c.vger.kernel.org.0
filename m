Return-Path: <linux-i2c+bounces-13359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9C7BB4334
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 16:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD76D327631
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 14:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD93D313540;
	Thu,  2 Oct 2025 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZUhqEe0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D25313281
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416141; cv=none; b=VrAyJ7D5BOvMTY4kF+23UZ74z98KvbD743RWl34Ep7PvjurieYOvr3I7QNimz19iPN6NN6VRE+ooUM57MvefmZUAFPLAV46DPhRurQ9VajYVWNP/pSC2h8IU1pA86rEzS4KEHYEuroOaZ5YfufiEysPE0Fy3AAbHsSTiO5j98fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416141; c=relaxed/simple;
	bh=SEKtq8WlaDinzaqN6sbmXex+0jo1iDkPy6Zh0RvgHvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMfW07V4YL7rCNiW7P8JLR8iYu5fTnMmFa1v+pyJxXYQwDvX2hRqeHYxT37aDugnglfJRXCZ4rPJPXsuGyj+XCICs05FXl8iY8MZfJ6U3tkvONdtzhG6DhmDIKjaUO2U6c4JRYNPCcerxzda8dPfyE0B++FV5mw1683pfwWRVZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZUhqEe0; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57f1b88354eso1039786e87.1
        for <linux-i2c@vger.kernel.org>; Thu, 02 Oct 2025 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416137; x=1760020937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5g+HyoylNTGFqMAbK4m0O1tDUAH9kttNvpRkli2e+0=;
        b=hZUhqEe0aJZ9Rog3vGBNtGx90JMcOJD4di64yzwKak9hIE1677rVUmULe0112kueFP
         /7EHAluQb8WLH1wXOvLgBGeIKA9DKrI04n9PYSkrDxFRqrZ3XFrUb6vWCRpaFcaaJM5q
         C5CdtxviOyEsxcuzhYLASNsMpQSoLLHDmpmlLkrCOKVJ1HrwPcV73UfXEZcPpi73P6ie
         mc30C3M4P3J9ZYWN2c4hRYxLlhvJMVu5b2oUv0JJpfwBQwhsB4xFw5s7Gl6zFgvX+XhT
         vFEN1H22DE4fx8rvmqEJXBdU9HGP5ILAoQA4UjffhEioIZoY9/2ljrOMeAdkc8Ip/RW0
         m9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416137; x=1760020937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5g+HyoylNTGFqMAbK4m0O1tDUAH9kttNvpRkli2e+0=;
        b=rU/8xh7/8vGeVKdWLbiIPURb0w+1YBTVyPV3afvjK8ijxph0imi8Jkn0c2AF1Kx0X3
         dR7YXQH9lglMivP3lLdJr1VOfC/OafEqUt8olF7AlzBb+4HcfwW3f5xbMRuqPAhBmBSx
         wMqx1YmiXzeFLqeZ9FE0wd13KsT9rHLUjYQ/doSJRWpXZWjyniq08a7GUYM+wZmH2FRC
         mT9RDCIFiYN6khdG0T9WtgGZyLRFeXIIBd7KyviNs/KMWCUc3o2QoE2WtO9qaocVyaOX
         oAX9OQ9GZhFy2F+XW4isbFSqistt6CWCUu87abJkBEGk7m34+t2GMHe397bnvtfTU0EI
         NDGQ==
X-Gm-Message-State: AOJu0Yw54hktI54XQz9JBZk//GuPJRShKC5rh2JhNMW9ac/8BaCqgaVH
	r1pVbyUQhWd4PfU2Ql3Kjah0+k/2n4pRRMgoGyaBSIS1VEEQ1t1Yoz9SiEQ6b9UslQM=
X-Gm-Gg: ASbGncsdBIUga+8oQfQeVeQpFODq9+5qOID8KkNoMp4WmQ/pYDPU2aaZewSbu4M18g2
	R9OYkVTSPeuOH9vimZz8jkDcZNwoDPfHVlnyOFG3I1Xcuu0k8e1d78PIyigYXPqrt+94Yq+cffI
	UIz9Stpe4c7QJZT9SKH3NCtBuMAMp6bUNMCT4KaAlY3ntBxdVI1aYq3/jwB78bJpZ4ztykIYGE+
	LBqngBxmqSz5WNxI187uIxHpgX6On0vOfo+65NuriH9Nqmm7oueIadhhmhkCmm/7VKrHQHrgonE
	sO8EyGbNCSYkTsGMHqtQefad8w0XcQzqm+HiKNjn79eYmqvpcpwSxPkAy1HsdYNroxmDhG0y76m
	0EM5Ic44zjdS27+lRSYsOj/Xxk0Jjr9BaYf9txbhRPUsMm5nifwOXZevxrbtmt46PW7Uq3UGeoV
	5HpMO6lKy2PdmSwX0=
X-Google-Smtp-Source: AGHT+IFlC3v1YYZBYn9JkfJx0Nz5xBDWw6BPu2hVfH1sXIWLY5CnUNsKrvc4HAl7fKytpVF8f6F0Pg==
X-Received: by 2002:a05:6512:6c9:b0:57d:1082:e103 with SMTP id 2adb3069b0e04-58af9f1fb89mr2486707e87.16.1759416136880;
        Thu, 02 Oct 2025 07:42:16 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:16 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 02 Oct 2025 16:41:35 +0200
Subject: [PATCH v2 4/5] i2c: davinci: add support for setting bus frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-i2c-mux-v2-4-b698564cd956@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=SEKtq8WlaDinzaqN6sbmXex+0jo1iDkPy6Zh0RvgHvU=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o84HWKLdePi9d7Tc2PXy/ubOIvh9PDmJUI93
 qBA7BYJFC6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6POAAKCRCIgE5vWV1S
 Msb+EADCHGLcNzYBswSFO9dObGRTq+GinFNvJi1Xknuw5pbEsMWNSeUHZO/frQMkN2WBh/bZXPn
 avl/25KjZ2kLk31+G3MYQoQLfJ+rF/Zo9h1JtYZqtbVlE5PKYtbWIaUaw1kl/d0q5HKMt7YHL8r
 Da29RmFGTWQ8uJKcUynIvk/VRZPTHehK5lRo/D33kuSZPtQ4lzHJ6Pl9aEGzegukAi0QlizBJyI
 xhl5Yoq1gsRdJjxLZvL15jX0Ohw9xc3mvkL8pSRd92zB5M06TZX5B5Q4w/+WydkgWrpBjzSocqX
 bh+Lzq30gHjtmDitCM1WL5BSE85Tize4E8StL6gO8A5RxkmcZX0RUxYorO1vIgqIh0d1+Pn0rQ4
 k0kPZ7ymJ9bt/Yet8S/qfkpIZmEkIGHAwGPphM3wXnYr6yF6oYXg4PaT3c5swKe4y6jeNtc/Qsx
 57kT2Q77aPPsW6pjPVrKcNaKsrJa3Ub0raMYm07sWvUnJxAry9np3ViFl/jGMZ2VOsf95NLcpLQ
 3CGiwzg7UmikygJC6xwPKFtsUKqsiiMZMRUslJHwx1dcnxXtXvWHapivkPIENm1VVhLb3u7+UMP
 6i+F87YEJilujFQm+zW0rBIjuOFvd9To6gLjrveIMlp5TojCJkfAYq3wnAkNfHEjLAL6nfxIS2N
 uWqLK377NiLQPow==
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
index 82f295619c4d0ef108c57d13c10004aa25014cbf..fdde573eb59d11a7c6a87141863df1b9b58f64fd 100644
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
2.50.1


