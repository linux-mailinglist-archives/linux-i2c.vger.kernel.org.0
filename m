Return-Path: <linux-i2c+bounces-10413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ECFA8B3A9
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F02017A45A
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5794223E33F;
	Wed, 16 Apr 2025 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuCYlE0+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566E23E229;
	Wed, 16 Apr 2025 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791771; cv=none; b=YC6UlaszRUxsaRBmtA1SO7uT5QSRa8fc4W8DAylslCFv8tq7s/EBkL8B170I0IyqT7swDelNYCBkMGNN9CfWXEWSz+MUBT5wCo4oGDEtJpfsd/705tlT0yQdfmAZZblShu/IP7LJDoHpKZHhPsZPA5BeBuzx7fA/y7UwPfNXmXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791771; c=relaxed/simple;
	bh=cwXMxbJL24jYAsCezvOT4x+AE9GW0GoMa7cMoc0+DnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=meuuOzw4dQQdgTtS9KgVd3R4rFDH4GuPNtOaiv5JGVrGcXitRv2bnLwAAYt5oayCxXvOkfiSiST+LT5EBTWhEFuhd1naLttechz8MUMPQOcuowJh/xABKX0cqCeeDnxwOEUfkTVc8g+mK57oWwAVvsU5JUl7tKJBpWMEwwTI7zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuCYlE0+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bef9b04adso66814861fa.1;
        Wed, 16 Apr 2025 01:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791767; x=1745396567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3LVTpn0Xg5k9Tehr7H1EBP9tClnp6JDsKrJApop4TI=;
        b=AuCYlE0+1b8ZVN5NkLn1o9OCr7bP3wKd0svObdTuUwLDJDhhyWLvZRCZq8fvyN4dls
         ZXaiYCQ9FEzpB8Mos5ZWmJ1ZNslLl/iZseVPgsh+U65ovOlujiGHQ9Cu+ZNWFb7Ax6hL
         Byv4tX9Q1NvlTfr+ZvV4PVgPtRmXNN4Y1k0LJILcyzdTo/wNJGByw66Byy/jBhelBoHY
         MJiayN0uBHWyzeZPomhtuy1JdR3QmYDmMBigYqQlFv2TPbAfw9N7Hn5QGuF+79331YuC
         8j+pSKzvEfS5p7HB/NREG6FLnP2v3aKS03RX6xCthPxRBb5bhkPyiJc8CeG57Jaen42y
         B1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791767; x=1745396567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3LVTpn0Xg5k9Tehr7H1EBP9tClnp6JDsKrJApop4TI=;
        b=ohhCNkvAMC4Ud6AJ51nOrXRJcvYV+CikKdtWK5MNbTxrx2b+BItBRfGD8lKthp9B/P
         ef2rEbv0gjR/kz9TaPg/Uing6db+cydhUx87C4GCXkVn7VH+MZB384R8Gy5e4sUwfEBl
         t2S9a97iCjxniiGENAXeWW+vkaqkAycZ+gHukwhra56cxLz7zAcKuM2VftVEuS9Fln2y
         uK4ud2e1VZxLy552vTJy0C7JiWpGxs7rByLJ1DKizB1/0RWoyuyc7Y8worMTXPfc7c4u
         80S/Q0dW6rfBpOYw87I50lHy+kUCAanf2L8zbEa+5W5vpcSo8HUUQhRhrj0Qo9kRuiLj
         gvAA==
X-Forwarded-Encrypted: i=1; AJvYcCULp6QUn5CIwDeXrffAl8UR+9CukuYBerhTuIiLPF7ETCIEzP7T/69oJSXS/ZXqM4b2hYmcN8uqG/kb@vger.kernel.org, AJvYcCUPMeTu34NZVZYVsnUY+hhpPgvqZo/5MG4x51wRMWvOdtNaZAM3gt7tpkRHMZASkEmkKW8b2ja84hko@vger.kernel.org, AJvYcCVK+BWqxFBs/W1Jrxk3IDPCf3pfAbnl/GlQeAWxEvphgYj4P3lKrrDkJbNVjHSLcVD4bsLHt7GIx6dj@vger.kernel.org, AJvYcCVogm97FDhvi/i2HN9nULH0IdXKLxlCIS6+UL3IDEysLx/D9HvwpC5+XD+8ejuGfaoOU247SjFJl1/e@vger.kernel.org, AJvYcCVstm1E2HkBFt8eh4hQSKJTiWvNVelkLUO51iTxYK5OBwG7j5tG0DCmejQ7xFjUatZkl6iluaCi@vger.kernel.org, AJvYcCXUj8mLb8NV9YVGfa3uBXSEOGgIO5hEgYENc0d3Kk363ZRyYObeBcf6svmKAEDeK/WvuXEPcK4aUgiJCKNa@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQ4jmxag8WATy2NogCNyQlFq/YqE2nYPE5ZgRPlDpH85Impk5
	HVsoc2CG2xyrCPZyyldwbd5gaoHUXYEe1D0+G0Z34rEnzpY8wMrK
X-Gm-Gg: ASbGncujGjNMs2Rb3HKAnIHSik2nDPCv0Y7sXwHLJtH1OePiZiYLLyrd9JgiF2xiKSH
	CfXxlM/tuOK1nVW0dZVOcGiDOVhaU/vsvlm01xdEY9kIPMOrPjDrk4SDXHoeL9fe5qhNDcZlXNj
	LPhGkhEDxQRQ1AhKR73u/9fKcU/hxX5pQ9spMS/U8wiRf4JxBP/Rzy4SJBl940r03uItFWhe0Y8
	tnnK0hzfY0cCHUyFDTBt0z+WDj9nSOQZLkBp9XSzvh0QMpKBfQZDZVFSGL2CJiCnEocrBXKozXo
	rcENqTEhQgbhfhSyVJhrOxhU5rYVFrMdcc8j+9zFbw/Hn6T/kk9m
X-Google-Smtp-Source: AGHT+IHqcPN9o0/2W+ihJOoL8R+C0j9ItIkZ3xAgrlrtLNcdSKg3RGRu1iorfo2w+SRNd3v44qbbRQ==
X-Received: by 2002:a05:651c:1988:b0:30d:b89d:aafd with SMTP id 38308e7fff4ca-3107f7168bamr2633401fa.31.1744791767234;
        Wed, 16 Apr 2025 01:22:47 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:46 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:38 +0400
Subject: [PATCH 13/13] ARM: dts: vt8500: Add L2 cache controller on
 WM8850/WM8950
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-13-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=1582;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=cwXMxbJL24jYAsCezvOT4x+AE9GW0GoMa7cMoc0+DnI=;
 b=zNlgXlbjTA/8oLRF/la27qlvLFN+mq15FgWHalIAboJ5Rc0SQ5ohznWcA0ndpi8Xffn25dAwF
 VMGz2yvXW2mBR4Ak2oml/1A0L6geaDMoSzUi03H78YHdpMDuX54g+/e
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

WonderMedia WM8850/WM8950 uses an ARM PL310 cache controller for its
L2 cache, add it.

The parameters have been deduced from vendor's U-boot environment
variables, which the downstream code uses to initialize the
controller. They set the following register values:

aux = 0x3e440000
prefetch_ctrl = 0x70000007

Their initialization code also unconditionally sets the flags
L2X0_DYNAMIC_CLK_GATING_EN | L2X0_STNDBY_MODE_EN, so encode those too

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 55de8d439688c5710d1e9a37890bbd274895be42..f2fb2e0b04c31dbdf320387f24c3b09d231d90b8 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -18,6 +18,7 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0x0>;
+			next-level-cache = <&l2_cache>;
 		};
 	};
 
@@ -35,6 +36,19 @@ soc {
 		ranges;
 		interrupt-parent = <&intc0>;
 
+		l2_cache: cache-controller@d9000000 {
+			compatible = "arm,pl310-cache";
+			reg = <0xd9000000 0x1000>;
+			arm,double-linefill = <1>;
+			arm,dynamic-clock-gating = <1>;
+			arm,shared-override;
+			arm,standby-mode = <1>;
+			cache-level = <2>;
+			cache-unified;
+			prefetch-data = <1>;
+			prefetch-instr = <1>;
+		};
+
 		intc0: interrupt-controller@d8140000 {
 			compatible = "via,vt8500-intc";
 			interrupt-controller;

-- 
2.49.0


