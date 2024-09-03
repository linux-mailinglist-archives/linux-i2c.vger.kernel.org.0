Return-Path: <linux-i2c+bounces-6041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED0696A258
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 17:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91BA61C209DF
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 15:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CE11925A0;
	Tue,  3 Sep 2024 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AMD9PPu/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB33191F80;
	Tue,  3 Sep 2024 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725377015; cv=none; b=oSJtOAWZULCE/so1SjUWeIOLHaNGslL9Som8qYO7JdgzA/5EdyHdt0sxTuhWwC+LAFZU2VhGjSzduViNELEXZv4BSe98yxzfTgTfVR980eHXWajiBXrXwe9D1VGQMmoTSom2VOtsKAeqCAjXORVyIVEL2t5IvxNTxE7AMYxsQqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725377015; c=relaxed/simple;
	bh=f0D3qZRNJKjZ4ZItDHDKxzlfX2zSfpN5blcJ2RQ0XJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L84bJQwHvUEUuV4+3Aha9G9tuNiYWCwtfCgBbg/6TPWMJ3hFagNYTmF2K0QbPdqN8xu+bLBVgq+jrAXSeKBiObUteV0mY8rAuQXhde1KDBfyrTcQXJVSdsxZYY8DZ6Dd6za/lMkXLS/b8IRoklCCktDNSqgew41k81jhSCBM4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AMD9PPu/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725377004;
	bh=f0D3qZRNJKjZ4ZItDHDKxzlfX2zSfpN5blcJ2RQ0XJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AMD9PPu/OGMlGzKoQ6XXCGTcfrkyWGaHS95Rw5CVsBTegIUzbby8Ffo+rG+dF459O
	 dK7k1Fd8kicvlJbqaM081WHgiJsVonMxiT4rIc0Yx0i+AqwhaLsjuCMR3wKUvpdqkG
	 eea8fl9yzULRVEMx0kSJAtjpZ+/HZBIkUjJigVahoWvqZFFMJynS4LRPFNwuV3SId4
	 cSdlJX2WsqVxLQirQfC/bGWXxcAJ0Ty3JnkO+tipP0Uwf+EwSgNk7EgtAt05mA9DMO
	 V7NeLT4FbKZ9bA8g9elFCCIENfTF0HvRVSgzAXoeGQulocv+r1TSiieBJJrJ0OkbRt
	 YfeMbrXj+Jsdg==
Received: from bootstrap.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA64F17E10C1;
	Tue,  3 Sep 2024 17:23:19 +0200 (CEST)
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
Subject: [PATCH v4 1/9] dt-bindings: arm: rockchip: Add ArmSoM Sige 5
Date: Tue,  3 Sep 2024 11:22:31 -0400
Message-ID: <20240903152308.13565-2-detlev.casanova@collabora.com>
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

Add devicetree binding for the ArmSoM Sige 5 board.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1ef09fbfdfaf..c3449d964659 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -49,6 +49,11 @@ properties:
               - anbernic,rg-arc-s
           - const: rockchip,rk3566
 
+      - description: ArmSoM Sige5 board
+        items:
+          - const: armsom,sige5
+          - const: rockchip,rk3576
+
       - description: ArmSoM Sige7 board
         items:
           - const: armsom,sige7
-- 
2.46.0


