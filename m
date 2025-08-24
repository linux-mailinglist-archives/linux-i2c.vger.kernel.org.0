Return-Path: <linux-i2c+bounces-12393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A7B32F86
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04744188058F
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9092D6E7E;
	Sun, 24 Aug 2025 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7qc+e2Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBDA2B2D7;
	Sun, 24 Aug 2025 11:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035274; cv=none; b=JzEHadhunPXJWSFnHHKHRt7by0E0FGIBC+OWc54Y9shNvPs8rPevWx0mJs6zkrpnGPiP8ovWcAKmSrvdUdMWATvzSl0tWy6bOKQ1ZYoCzmgRfP6si4bH8JHksYJRgg5vMz3QUzp+EqkpKJXeQlIxNuQUrn34WOjEmzOM6KrJsR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035274; c=relaxed/simple;
	bh=Y4VrVsctznpA3d6zQ5f7c9ZAHxYHXmHRz3iJoJmb+MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VszsLRt6fuVYcCXQA8UDiTcygyq3NUkw6zWD80z8WmOkQpkuSWT4NIBPvlW40EFNGsXgKyA1kpkbhQ/LPVDIAidQcicbJa4xUzD7VHoPQJoFRHBz/uldRAzegwzKWsw2GSFUpFiQtta7BGUFwwb/Jl+ZWDFrNdaZkVg/DFUDzGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7qc+e2Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso29266915e9.3;
        Sun, 24 Aug 2025 04:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035271; x=1756640071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfOYpGHEdfYkC71vUp6gZRWfFSWO3whbK1R7EckfiZQ=;
        b=l7qc+e2Ze/J1Pg3ZMId9UNWUco0lgigQVJ36Wq+7QN+wkFeyBNzRFs4M/ao0FxtCOX
         yFUut4mD6vh/Pm1MbO3yhyw3/5de33LSK1rvHlIwQPJz3M453EvgXI/qOolm+UBCgC5U
         7OrBYvoGBhP9SMY7kWxlUAxrHRndWdcbZMnC/g0lqDgn/oU4N3+e/4ZvLm578DlZoELU
         aFzuFmOXhkQG5QlRYj0gJ9TSXEzwzDJGLxHwh9jnTcKsrxP+4GGD7DkiJCt9uDNi85pf
         j0ttXEBfH1lH/WW4ig1BAxTd9yuJpDciJm7bzRU456r7RrfPjB9wfD7e8Kd0YDei+Cwo
         QtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035271; x=1756640071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfOYpGHEdfYkC71vUp6gZRWfFSWO3whbK1R7EckfiZQ=;
        b=Row3ayKxnaZ4qDpgYvEmH07WIsY62HujesqQjPE651KtzGILbG9dX+/Zrtu4A8akCR
         Nw2pSeKGvvrRhWJRz5slLT79gwJo53ryRtA+SegQHUVR2/4VOGVKHjj/eZGkr9rNWyoY
         KTHInFdZB4TCuLEAj1DH5Dx0H/V8C4g/Rxe/Nu55mFy/ylMoAL0vazB7iXgYrKoEFxpX
         uL+MVaswDpIoZgTFI85amkPUPG3CJUJOOOu9bzQ2UFcjtrfYtfPJExzu31BrwlSmJGF/
         PLse9z9uwfGXdfXZWTKBdmobkCCfZxhji1/xUnnGwpEcGoY3YbS/Bkd2ciyyLsMwF7XM
         ED4A==
X-Forwarded-Encrypted: i=1; AJvYcCUP4QD0TsglfFC2fMdthJ0TXhfMkGQxWGt1L5N/ArEoCkGmISaME+nw86MXt7osPw948s3ILCuKDiv5mUn5@vger.kernel.org, AJvYcCWpj6NVzTcRkG2MsOGqBlBP5X8aZJ1nTiwQkk6CDQIbz//TzWISDUBhKgwaV6w70E9elRqazjer@vger.kernel.org, AJvYcCXD3TKxdFIqQ1o0Am1n65q+mHr093Pgcj6I0PhnY2zBF/lsrbEferBFw8WP2GK9NGN2lw7VJ3oyDiap@vger.kernel.org
X-Gm-Message-State: AOJu0YxwCHt4y5Nf+mk2RvZ6Aat/8pwYOS+5kbZUyZuBm+6fRcdHDtm+
	RYpdCjsga4AuU7B2N1akckpTXtoQlaSTVN9+PGGUAO57FrmASSfs+eTX
X-Gm-Gg: ASbGncthrtnHO/E7cLBfypVlYPZlI9XdXHMo53A3OEKyv26l9w3WhvzdL/PAEhiOghT
	K/P9rRI2O5z5yfNSa1ExwgSg+RrV4D5s1chsUIrj3XSjFoVQBSOpFt812hLypMktBSLdmVACz5W
	B2ePXOELlGQb+5al9d2Q5UtFDE/lr7RgnhL25ol/g+ZNOT0DKPLma8NU/VwETBj56fMrQ/BT0kD
	jtFmhiGtdg5xqqFPfuWCNEWeoxsivmciDZnOsZ3wGZBaXbgPDHNZYqSoiZpWnQlpCm5UTzBfSOH
	7xSmJ1JTtURHSEilDYduhFfKTftYr5kt/jUhdDVzk+JYjVJ1X/F8675PKrOAM3gyq7jzt1gARZw
	LuE/LrI7wAauTPCRmiTzAO+RzK8BpGxGEBHJOSHAuThgAQKMDU3Rr6JM=
X-Google-Smtp-Source: AGHT+IHVLi35AXLVhZybVFL7JSkg4+AiuIcyS1PuReQfFInSNhBjxd4y6dfYrb2AkQqRDX+qiiwFwA==
X-Received: by 2002:a05:600c:c48e:b0:45b:5f3d:aa3d with SMTP id 5b1f17b1804b1-45b5f6bde93mr4564625e9.21.1756035270752;
        Sun, 24 Aug 2025 04:34:30 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:30 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v6 01/12] i2c: rtl9300: fix channel number bound check
Date: Sun, 24 Aug 2025 11:33:37 +0000
Message-ID: <20250824113348.263475-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824113348.263475-1-jelonek.jonas@gmail.com>
References: <20250824113348.263475-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the current check for number of channels (child nodes in the device
tree). Before, this was:

if (device_get_child_node_count(dev) >= RTL9300_I2C_MUX_NCHAN)

RTL9300_I2C_MUX_NCHAN gives the maximum number of channels so checking
with '>=' isn't correct because it doesn't allow the last channel
number. Thus, fix it to:

if (device_get_child_node_count(dev) > RTL9300_I2C_MUX_NCHAN)

Issue occured on a TP-Link TL-ST1008F v2.0 device (8 SFP+ ports) and fix
is tested there.

Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/i2c/busses/i2c-rtl9300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 4b215f9a24e6..19c367703eaf 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -382,7 +382,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c);
 
-	if (device_get_child_node_count(dev) >= RTL9300_I2C_MUX_NCHAN)
+	if (device_get_child_node_count(dev) > RTL9300_I2C_MUX_NCHAN)
 		return dev_err_probe(dev, -EINVAL, "Too many channels\n");
 
 	device_for_each_child_node(dev, child) {
-- 
2.48.1


