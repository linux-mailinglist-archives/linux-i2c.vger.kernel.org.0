Return-Path: <linux-i2c+bounces-13074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2989B8F1D7
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 08:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 685B53BEF87
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 06:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C1B23C50F;
	Mon, 22 Sep 2025 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA7zgMWo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9B12F0681
	for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522113; cv=none; b=o2JUYTDmE4MKgjkIOQCR3xEQ+rt3x1sUfIGd5rJ1ezcSBYw3yF1Sc7XqM+yYWQNkxzZRCH/AYyEqseF85UQ2abnwqTsVgFWmvNlkCsPNXETPcPblg0UKIRr0FUhnMk6TYYXJqA6KBqC1So9p4IPWWFG8zxsXOFMNDrvcizuOi28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522113; c=relaxed/simple;
	bh=ZRFvSmAGP6q+vBY0PuMHuuVxT+alZd4ni1G4olWQ04c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ue3gvb+F3Q4naS1xuJaJR+tO2oRFkPnK0PJlUbsD2PU5YFZbFvZvAPTpoOtQFD7f6FZhqSCPJpYLW/Khf+OAQgkUONtUO2ZMiR3yTTmE9DSCJkTYineFg+Vz3vXL+xjQoTFHeR2Q8RmpcvoNK65u9k6VushNS3W8QA+MMIEbGLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PA7zgMWo; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-36295d53a10so31574541fa.0
        for <linux-i2c@vger.kernel.org>; Sun, 21 Sep 2025 23:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522109; x=1759126909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGqOJ9/wDsjD1e8/2jE4mLqygiZZmNcpMQ5EJRhUWNI=;
        b=PA7zgMWomIWLs3OKtdzfH+wDufQ/ESOlNEJCX1sWH7VfLzSA5emcTqp1c1KcTef4OL
         1THjY5evi0FEBb4i1akhBSBWpcDJGgdpX7QvQA44N5MUJEQoogMoxTthmfPZBFVhVkgd
         DljN0RCgYzdTqcsFRqmqgoko6YqH98xul7gZLQbm2wG54RxAaQzVp+dWYuyLvozLy8iX
         0w6w9ncQFN+GRXQ9KsA25Z3KjLksxTLz6ujrH5UkexWk/f4BjnvR+5WG74WtrADxcoXF
         gsNHe1t7i4PgeN6DmPssdfO4JPpBiacsMFZx41clwtSrBrVOSYDqmf+Detf0CmbSGG6m
         xLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522109; x=1759126909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGqOJ9/wDsjD1e8/2jE4mLqygiZZmNcpMQ5EJRhUWNI=;
        b=RJpYgQXkIt+UVaTGxIAC4sSFZPmTJtoRoaTcrZcOGXdJX9cjWV6J/z6MsD9fVIcl5V
         q+B+FQL4Zrg7+wdIP4lwagKilTctUCnL5DjlXDPhBtOUaFgCpp0vXbdrUS0iismmTvgc
         hVjY26XNOqAiOnUIT370koSUy3raQYbCvuyHSWqmjmeaRZ/IQddgqeAb//14vhkkeAkl
         /M+GYOR7DhsyFdA3d6iIYEpxLJaf1DSnW9VDm6b1j+Bb25VUs2SLCeBOmUnrcl+ddEBX
         VfLrAcgFMy47Yzp6F6+ZaYWFxfQfLHy7vDhcIWuoweFT0kunGyEn1jnhVuhvcruKLWnu
         0R+g==
X-Gm-Message-State: AOJu0Yw75eW8Fld1iYER/vZ7BTY864vxAWk4TOq/n6U91ZLPzGiropd5
	GQXFj67JwQCRCx33bkj0g2fZcuJHMVwr4xeWz0mU43OjsIuEA/ZZKAeW
X-Gm-Gg: ASbGncvXl/107WqdUeAmMaoVU2+U7/1lSTyTHCSwaKTrJSq5JfnHYODp6Zxwek2MfWD
	Bs6Kgg325/5D1xJYPXOKiV/M5Za0ucoNIj2uzDAWyG5wGXkLVt+KaxDV1rxqjPDdGSegv4DCE/Z
	5UVsfvmMaICSoMK7+ikOpJI0/K//437Hg0I0AZ+GqwTTy7joVgHQGdSp1LB2ueDMEPb7UFLWrJb
	aIxhWnIKF5MBV3Kp5E+l0/4o4TTYHXduWizOjhag/6co1B/DWsRbqJuvo2wHNnV+tMsr5YjaJaZ
	DE8tNxjv2m/7/w92cFkLD+ixZsYpfgMoQNaOpJr2cgMAV+6sbd/NI8T1JSxr+gykCDknCNVatox
	kd+DOIb4sl1o37titzxljX9uztqa/baut7MmEc2PyyAJuBdKVHGyN980h3Jd1HXgw3no=
X-Google-Smtp-Source: AGHT+IGwN2JhhPE7hHQ65uaLB0URi5QMIY3lqEciWVWM+KDMGsSo4o4IH62XENx1ZoUvR5i/oC859g==
X-Received: by 2002:a2e:be21:0:b0:36c:3b69:2cfc with SMTP id 38308e7fff4ca-36c3b69e759mr673001fa.8.1758522108996;
        Sun, 21 Sep 2025 23:21:48 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:48 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:21:01 +0200
Subject: [PATCH RFC 6/7] i2c: davinci: add support for setting bus
 frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-6-28c94a610930@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ZRFvSmAGP6q+vBY0PuMHuuVxT+alZd4ni1G4olWQ04c=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OrnD0paauU8/1PUKU/MWNI4rWluhwYS4jfbi
 KOJB16EP9+JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq5wAKCRCIgE5vWV1S
 Mgp3D/9Cz7yhGXhmLHWthsXVuKYbL0YxQVy1e8U724NkO8lZES31r9eFAf692OBdoIcKJ4S43HX
 fmkgWg1lbJLADJ380iZdDVt9jzTj3SJZ+jhjwPbNnOFPqQpQ0WQuzCiXmjyfQQwt76bSsxwoWE8
 7NrytWx4w4y0dxGrtQX3A3VFX5kJNOlpfHNtKwAm46T9L3PIBkuyD4fPH4+JOb1nOV3+CVKNVia
 LpS54IMFKNyXua00Iq7dqhEMYrZ/BECI3ygwKXJBXrN/hv6FCUQTnWM0UcUnaUTHzfbW9ziUvju
 OgtMe/o2nqSyGjhfAkpQ7LdCfkCccxdN9sazjhZWc3M8YSS0TstSc1MuwuhyXVHi/YHE6Yb4IdU
 KV23LyBnyMkGaxKwAHCw3j+gizljEDhcmNv1T6micBVKLhqmoLOLid3eJH8Kk/ylH2ejmemIbMS
 Fq1WAZfTw1cqWBWgUlO7q4VWuDqAZsfg2ZxG87lfcpu2n6orpniH+Gi8Gb8Cs4w/cWVF5g6hR3y
 uJj52cFUqy4+ctxslVzxti0dxWVdslFvnYKzUjugX5dCYSz2xo3rT/emfFU68W1eTkf6dlQA9WN
 jxIfCoibU1rNARox5JK+m6wwnbXDgxEUKFLyZgvVOg4AjcIo54pAyLmjQn64jqkIjAMzgxcLXq1
 JX0MkjYuPwatmwA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Populate adapter with clock_hz and set_clk_freq to enable support for
dynamic bus frequency.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6b18938457d0c5cabc323c364d9330c2890df107..d3e47738f8ee7e8f69fee49509dcda396c9b7fb6 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	if (dev->bus_freq == clock_hz)
+		return 0;
+
+	dev->bus_freq = clock_hz;
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
+	adap->clock_hz = dev->bus_freq;
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.50.1


