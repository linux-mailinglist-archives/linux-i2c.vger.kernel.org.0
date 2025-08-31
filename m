Return-Path: <linux-i2c+bounces-12521-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9080B3D1D6
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C300188A737
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90608253B64;
	Sun, 31 Aug 2025 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEXDzPgu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA56246786;
	Sun, 31 Aug 2025 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634723; cv=none; b=opkxm3tq4LZHTrLvpMcuA3lyeOILNjOwZ+A16H+wvVq0REu9YuJeOqqqKbJI3ctfAHdry5aXECg5aLwsZlepROfukUVnoyF7wacb7TkhiEzTHSwZXCNJyWJbsvw2iLqDP4cjGykeO44McSND69Gy4cUTJlnbP4IAjntCpsNd2eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634723; c=relaxed/simple;
	bh=GtFM1HYwM7wm50NlvOK2RSNtRdnB1lWGFKfcajn9FBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=II4ct/An+zLMC0/KGo75GbOU9j7VNF8/6C4TjpXZDolOshoMQ1wXQ0VrvmOsqM+0vUH+e4RMSbU+AHa5wxpBgHou/WlbtCDh/BDtV/YZuWLdS4RgpCT/xRqsPHolreS90m0P6P5zbAf5r3E73sS3rO245O7jMP8CdhyzFyrmH4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEXDzPgu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2170607f8f.3;
        Sun, 31 Aug 2025 03:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634720; x=1757239520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAsPc/o3sHthydrZSTY/uysR9XBCOf9eN2RiNd/nsG8=;
        b=IEXDzPguu+2NwCjcZkWhbXz2uIZkX6eIF5UtA04PgQPnsrsNk6HkzCjGwvxknW2Uk+
         u+ET5dkqRumGe4klNrR3qlE+olhgZP6kBQ4/EGN3aYw3mlnIYaqhVhJcSHS8hVzPAeO6
         G+Ni01/rYwDaQZeTkm6id99crQb6EIa9MVUWVGbrJMzr8SdT73cNR8RqAFiP4Fbl7sJt
         WO0aYMj9+c32JtveSgpUmla+NJq6pFJDdBLy6MBBghQhe1fMGaFNMCTXG0uPbZMOsgqD
         Dz8CbSJElOTbwkGROn31U/eZ5qkYdQhOFZtxysh9N58gt1v9cCVxmWVSNwhIOTE3WfYM
         GdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634720; x=1757239520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAsPc/o3sHthydrZSTY/uysR9XBCOf9eN2RiNd/nsG8=;
        b=BWJMOJZCfqYpex33kQAGvRpM+vhh+HtWtfEEglBZgqkgdtbRlFpq3ugUlPwvgyQzOv
         i76+BMelQjH0smf82yKI0Zu4lWZd7LE2KFl+VBiiBQvqbSzLKorvs2YCbgOiUkt4YOmr
         OXgXqvp5+3PU9b7XwcoCrsNVbo5UB4yBeN8SE/xM8hEBRCVHfyYkyoDPWQPy4CZhwhst
         p8sk9QFanvgMo+R5VJpSFdF4/CqcmShCFXLGXhMeBfDai9NR0JBcD5KnTdo+2xmS9H8d
         2O7eBeVenFqNTGU7ImlVTtgDgDTeXUSLYWnYfJ8Tre/H/dqqlIgIbZ1lPmqvWFxvMdjW
         tEaA==
X-Forwarded-Encrypted: i=1; AJvYcCUYYASeJ9zWbmlMp7/Ad/9wLgeANvjDSzPoIhhuRaHIVENA4V/uG8+pxQ5QNE/Zk8zCqj8YQnn/@vger.kernel.org, AJvYcCUfwoURx8cG3x7cLGsmAKqaxSpyxmm4+PGd68hbp7Z+yh+7ulORt63QRoqXymcsKVo0z9Dqph6k776P@vger.kernel.org, AJvYcCXGvlx4Zu9agOPBSXKYB5eM1miBt1Pq4fCWU4cBZrbG5XbwtvNpI/e9HW6MD3SpS3DQjYIEALRyYh6X+BTd@vger.kernel.org
X-Gm-Message-State: AOJu0YyoVdFVA2TwSUVHQGgS30hna/5W2COibem7lyDltR/BxIMLi2Wc
	+vJr97FT7B1QZkyBihd6+34Hl0HJVjrXqRgHhPtvlxBzfaVaaroqF68N
X-Gm-Gg: ASbGncv+O8/Wl+018SIzqyVvkUE6Tmso2gBpxWHT1lUtfrPGDKVeQvxYtKqyju8aci+
	Lx04LesoDvEVkoHv2Q6J5jWSedllK0TJGuSiQhsvi8CS7sjHmLhO+2+9mkf8X+tRz4giowritA8
	tu3RA0rdq87RBEhZa7Crk8jdRNQWcVZkHkcZBkXNaQN8P1RVM9yZ0/V2chwlyuNTqYN2fFsUQhb
	idh1fW2gzHW5U99gtsv2BAXg7nF3xQ/jp2Bklc+boS5NLPHlrTElWAKgGW2+k949obpaiUfBGCA
	a74ng/A7F9EOu1GZ8J2oWQdA4H50vJUtEbyMgVIO/Lbk8SVdN0ZxR1zri9NNoI/x/LHnag24Um3
	fa5qtghwMSMO+6j32AHSo7F+eu+tsBxNpOvpqoRNa5Dr6NHN0VS8l
X-Google-Smtp-Source: AGHT+IGfYQ1rNBJY3kQiqNVIFxgvAuXKhq26+A96rjTUwsQk1D9qn+uE3W98XbYUc64ySDby93qClQ==
X-Received: by 2002:a05:6000:4312:b0:3ca:7d27:6d6e with SMTP id ffacd0b85a97d-3d1de4ba747mr3226702f8f.28.1756634719535;
        Sun, 31 Aug 2025 03:05:19 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:18 -0700 (PDT)
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
Subject: [PATCH v7 01/12] i2c: rtl9300: fix channel number bound check
Date: Sun, 31 Aug 2025 10:04:46 +0000
Message-ID: <20250831100457.3114-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250831100457.3114-1-jelonek.jonas@gmail.com>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
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
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
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


