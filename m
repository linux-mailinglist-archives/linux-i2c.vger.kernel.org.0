Return-Path: <linux-i2c+bounces-11076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F71ABE3EC
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC4614C5660
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D64A281502;
	Tue, 20 May 2025 19:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdZmwRgk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C6211710
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770254; cv=none; b=VUq6aNiuNtYTZLJ/ER1H5O1nlzM/cjrLrY1gDcckb7desRPKY9mDaFolEyDPXLOITKHQyel/+ETpnRbBLl2ybfTNIBgSmU40kRffKsdXEeyrJvKFNirF3e9iigTss8XEmn2MjOObz9bLNHJ0lKXCJWHC3bfldgZU2+UdCLfc8OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770254; c=relaxed/simple;
	bh=o4eCxaogxkKg4ggYHDPKzyLXdrXjwwevF8B5eyjdTTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9HJz0VQTlxO6ZJVUhuk2xb8AMTcHHVNGYaRVKKjnVaWUd7GM29YfUuPfMnbyT55gVWUBxQpfQx4cqED5L59TD71SHHFIrhwuNI4Ga5OgfiE/hMzPbiG8McqEHEAnFjT609d+1nSOSePObFS2ZAa0pz917PaijXpsyxEAWbDTkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdZmwRgk; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-601d10de7e1so4395551a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770251; x=1748375051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNwTypVEhW+I6Ule3/kZmD3HwJ7mxNMD521XFrY6l9k=;
        b=OdZmwRgkCdZnkp9Q3gzFmp68jbalhQRgFDkvWWveXkTbSYbaYr5GY7ywWJsmtQ9Ug2
         KSvRkKi+p6/Z1uJbmqjt3iw6+pIfyG6Ws2gf2B9zrVYV1VWlVt8A+jysuUPZzkEfZ/9K
         C2eBbDeX3vTMz70W/Hm/qnOdqcWcKQIDW4GjtD7CNmEO4MDCa74EIKMYR6oqe6ajXmDB
         wvirAqMeljLn+jduJUPWNUDHwhJxyj1GBM5GTIDG0UJ5YIdVVXW2hJDXamvF9xyAyaYh
         uMwwjWeEKBRrn3/0AEJEUUbhzk9jjdZ6k2l7r1H7lPmRHBxY5AJCMindet8XT/MUNqdx
         W/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770251; x=1748375051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNwTypVEhW+I6Ule3/kZmD3HwJ7mxNMD521XFrY6l9k=;
        b=gwWB3gI1CX+KzI/fv4pYydXZuOJ54GBIPWBe+GFN+/MFRqCZrQ9h8zLklcwL+t/fR1
         IfkSmpq9JYoyy7nSzf1nCim15uIEh1bEdsM/DkEZH7JN5NUshFkXaR6A6rRq2J1rVXGg
         tNNVu5WmnrY6jVNr7f1PSeMm2UhHAgJJXpuiOHE4DTAXp9Oyad2LBaBt1uXIPSTwLjsp
         vf6I2coqv9jSW81/haSVUQUXdT+2aVK1gHnTJcvF2OxjuGE1jxblBuWiiCptV3Pn9RXh
         U6JEAxD1P3Lcp4lIumFNi/w0DoGC3BLqwZ1lqB38LdxB5N9Hv82tMYS7upUohVJsksln
         0voQ==
X-Gm-Message-State: AOJu0YzedFi12iBzdSPnzdrhLEkXLu/2kZdGO5JWvjjIH79M4HYeHe01
	P0u1cIKSTUYCpQ3xZit9PKMJxCNHuktxuVFnogsn9UpUzSnKlPEVR5yDkK/h87Dar8I=
X-Gm-Gg: ASbGnctBzkkDWgq5YCAf0jPAHGAHuSQFJ7Ts2wKFCefrrSsqxige9dLvs68Fqwdb2Dj
	WPodV64G68boJLIqK1Qgq4ChOAShIcKlIZImJmeAGfWfJoqcpVr7TswYAjMnES41kqoWyVZIsCv
	dj5ldB7kDo6N5OVbbdGcFXN8QbIujF82m9FaJ22/sttimjKylQhOeA/cvlv448f6my4LfJi/UoN
	ZGa0djdKIPjPH5Vd1x+LN0lTH0hp/jA8Jca6bLCMlBtt7cokI8mUsU1JbQ3/1frCyr+YUKtUGpC
	Yjigsuq3ZrtE3xYKjU4fhdbIuEAskiNjUfbPm6NPvE8gyMN7giB9sOMq2OuJ9Nayzz/27n+Lwxa
	tLr1gmvueyrtR1s1n
X-Google-Smtp-Source: AGHT+IHjYDJsEXVrjuaC4isX3IrjBgui3obsdFkBsJO4aaBhsAtAQJAl6CskSvsEbBd8LX8Ohm6DzA==
X-Received: by 2002:a05:6402:90b:b0:5ff:addb:653e with SMTP id 4fb4d7f45d1cf-6011411aa27mr13795344a12.23.1747770250491;
        Tue, 20 May 2025 12:44:10 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:10 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 02/10] i2c: tegra: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 20 May 2025 21:43:52 +0200
Message-ID: <20250520194400.341079-3-e.zanda1@gmail.com>
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
 drivers/i2c/busses/i2c-tegra.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 049b4d154c23..0cfa45da9b94 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -471,8 +471,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	dma_buf = dma_alloc_coherent(i2c_dev->dma_dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
-		dev_err(i2c_dev->dev, "failed to allocate DMA buffer\n");
-		err = -ENOMEM;
+		err = dev_err_probe(i2c_dev->dev, -ENOMEM,
+				    "failed to allocate DMA buffer\n");
 		goto err_out;
 	}
 
@@ -484,8 +484,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 err_out:
 	tegra_i2c_release_dma(i2c_dev);
 	if (err != -EPROBE_DEFER) {
-		dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
-		dev_err(i2c_dev->dev, "falling back to PIO\n");
+		dev_err_probe(i2c_dev->dev, err,
+			      "cannot use DMA, falling back to PIO\n");
 		return 0;
 	}
 
@@ -1710,7 +1710,7 @@ static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 
 	err = clk_enable(i2c_dev->div_clk);
 	if (err) {
-		dev_err(i2c_dev->dev, "failed to enable div-clk: %d\n", err);
+		dev_err_probe(i2c_dev->dev, err, "failed to enable div-clk\n");
 		goto unprepare_clocks;
 	}
 
@@ -1736,7 +1736,7 @@ static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0)
-		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
+		dev_err_probe(i2c_dev->dev, ret, "runtime resume failed\n");
 	else
 		ret = tegra_i2c_init(i2c_dev);
 
-- 
2.43.0


