Return-Path: <linux-i2c+bounces-5504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3B8956871
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AA7D1C21831
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A6E16BE23;
	Mon, 19 Aug 2024 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oMt3pAEk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6EA16B735
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063065; cv=none; b=F+qqN1ywLt37knFyMrTwCiDKP+fnfsOxciyT8vbqdBWroTZ8NujwWsl5F2iMjJPV2YYObcW/lHvHg5Zkkl7jZkvEQ6ML0702g1h9rnTe6v4GKG4lD5TU4YnXEBEeiTqd7AA5h4FKRErkL3AQycp2ZV8ptVeMBT+HUci7Sp/8rb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063065; c=relaxed/simple;
	bh=6dxetGM5vmL5SbPPHVy2B1Gw76+hss5JlYQEJT4DiXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I/Ud5yjDzBdkTMXz5wMwvnvfHOr6ydJ8nS+Fr1I+JtCv0gQX8AtVLzAGNKDdYSGYuz3pbje7DPvvVycrYSBzpVlkSSUIVC24OFTDq37jbrl9s8DDupRZFFpvie8vJGqlm65eKtWIprOIBYSmRu2Zeq3VI562410QlT1LMe9aElg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oMt3pAEk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42803bbf842so45564315e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 03:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063062; x=1724667862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JevMdo+s9e0DzWfmlUF9Qlit9bWNc3VwroIkxBEWZ5g=;
        b=oMt3pAEkO1PKJl/m/ffCYBRYvE+O/JWqMJY39ZoKiDwG9X6VaHGE1/xm70pJN3oMbY
         ogKCMLBU3iCC9480Rdnfan8+J5Ol3YUq0CNhODzXSdY1DrP1+HU0k6emtERHv+Jdh9sE
         HQIETEy0qE2W7tEzW2F3QDQIlgCVr+JsTOw8rgAJRNrft7EjvaaHQ6Jc2Nd0jwwH4LMN
         l+vlSzz5bmwMHuoqzsdtX5eBONrmN93+VpbBZ0Kj6pJVdOq3S1GbWiZJsNX1nSA6xYBY
         ZtXq+U4W0STCAMa+gqw5ZrzanCVDcGTCVHubUa+scHfmlUQrvBHMxlRzZ2sJjmE0NUmV
         aJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063062; x=1724667862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JevMdo+s9e0DzWfmlUF9Qlit9bWNc3VwroIkxBEWZ5g=;
        b=wUfIQE3RHNSkbtwmN6XzguT/kx58mTMwH0+loradDIXKKG9Ag8ar1Z+WmlNGH2EZb3
         663QFpVejXBt2lweEbdVXs/CAJFlqw1goQghDSVhnSHajvMqeZTfUlleJ4bLRs9sQYnU
         6d9/EEfq1+JoMl7NkQt9nPcbvwJqbbXnQIHLOXDQd6Qfgjrmmjfx7I2mbJU6QgT3YOcc
         KrxqmiZcDPC6OdRljPcgmDH1dMVdTvndisYWwcvD4Q85ioKgUyZLCXRsmhQTru3A5fIH
         R3MjJW2HTWsxmTLPQu8MPDJ6ewkbe0XWeFaOHbFYLHgLJoQ1Ktw7nHRq/j1LXU4IXsfv
         Unqw==
X-Forwarded-Encrypted: i=1; AJvYcCVS8Fml/kOOUuZiQ8Rz6lKU1rFallu3YLuBxKXURhyePDGd/BaE+ybHjU1s0STqJV2Ctv/dXjprAAhY2QykYyNwW8FbpZKL8ELm
X-Gm-Message-State: AOJu0YyzjoLMxf7H3fOhFpGq/MUIa5UVwM8Vtpxat52KwZNQAoAVBsbl
	vRLIbbTA2jgFDxJnOtOdwRes9xzrrQfmLFIdk426dEoiwQ2yuQJ98/C0kqsYXp4=
X-Google-Smtp-Source: AGHT+IGXnLf7FHx5qPdROajd++4kF5shWlQUQohQYF/CYz5DK/SEqIOHou6LsZE9CQVQ8Ow9GizCSw==
X-Received: by 2002:a05:600c:1d94:b0:428:15b0:c8dd with SMTP id 5b1f17b1804b1-429ed7b78cemr104132875e9.20.1724063061815;
        Mon, 19 Aug 2024 03:24:21 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:21 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 10/11] arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
Date: Mon, 19 Aug 2024 13:23:47 +0300
Message-Id: <20240819102348.1592171-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable i2c0 node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index deb2ad37bb2e..7945d44e6ee1 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -11,6 +11,7 @@
 
 / {
 	aliases {
+		i2c0 = &i2c0;
 		serial0 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -66,6 +67,12 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&i2c0 {
+	status = "okay";
+
+	clock-frequency = <1000000>;
+};
+
 &pinctrl {
 	key-1-gpio-hog {
 		gpio-hog;
-- 
2.39.2


