Return-Path: <linux-i2c+bounces-6046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F36096A279
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 17:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3B41F282E3
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 15:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1BC199FAE;
	Tue,  3 Sep 2024 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QOa+F6up"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8057B199E92;
	Tue,  3 Sep 2024 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725377038; cv=none; b=NFimRZQYsER4pjO8L3cS4dH35ZrHZAq7w8AJ7szd9nwFaxGkEnwAQJqfIjNIBdPhjmbsOgEGL9xr42y/juKrhzObBly8gs7Hq3pkYt+wbarfxE2zLEnbat/DYIaCkuBsLQjm03XzfjGN5cA4A+dwj2yisSrvHp+19hQvh8KgK/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725377038; c=relaxed/simple;
	bh=3Mxy4AinXYBybrCx2Yls+Re1Ra8Op+cXhIbIKTJWLD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEn+vmMg/MJC6g3b4nqX1Iw9nWqRSKynrgt6fwL6sqHx7WY1qUqC/5r6HPt1Mig//9WrRsuWwPixw5wm8UUr0bPDp0xyrwo2IeYmzDsza0yEnrJ0TbLnfHE2xGnvGAUHNhVZ84BV2I9AIf8mzQGKoceqTODMRTHQGhZd7ltB3LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QOa+F6up; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725377034;
	bh=3Mxy4AinXYBybrCx2Yls+Re1Ra8Op+cXhIbIKTJWLD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QOa+F6up/mHeLuecCBBKyB9QyprWjGUE0g9XElO11JDCjA3IqQEVj3cDOrAHB4HWp
	 0xVfFj0ve4KANtSZ5JZzuyAbt/FywEQwERa0eeYngqxD6oRpWDyvqLzVhZlomt7aYC
	 zHm/WAZM50ZYMY5un6G7hTCxK8MitmlLYmHon0jNo8LppBhpXRgxo4YTMwsX8xXVZC
	 gjM+STcttHJ7ueif8gMdNGeT38mfPB5jwWwvpmt+/be9GFPUr0WLgxyYqoBPGt765r
	 pgTyyLWFarlX3cvX77QOHclwMtBP9zgspmZNXdUJpri9cU8WZizJwddYJykDL14kIk
	 3BE7bIs14madA==
Received: from bootstrap.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08E1C17E10DB;
	Tue,  3 Sep 2024 17:23:49 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Tim Lunn <tim@feathertop.org>,
	Andy Yan <andyshrk@163.com>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Dragan Simic <dsimic@manjaro.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ondrej Jirman <megi@xff.cz>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	Jamie Iles <jamie@jamieiles.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 7/9] spi: dt-bindings: Add rockchip,rk3576-spi compatible
Date: Tue,  3 Sep 2024 11:22:37 -0400
Message-ID: <20240903152308.13565-8-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903152308.13565-1-detlev.casanova@collabora.com>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is compatible with the rockchip,rk3066-spi SPI core.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
index e4941e9212d1..46d9d6ee0923 100644
--- a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
@@ -35,6 +35,7 @@ properties:
               - rockchip,rk3368-spi
               - rockchip,rk3399-spi
               - rockchip,rk3568-spi
+              - rockchip,rk3576-spi
               - rockchip,rk3588-spi
               - rockchip,rv1126-spi
           - const: rockchip,rk3066-spi
-- 
2.46.0


