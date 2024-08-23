Return-Path: <linux-i2c+bounces-5750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A795D0A4
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 17:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C36DD1F2398E
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C23189515;
	Fri, 23 Aug 2024 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="DWX7qBb3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597D188A03;
	Fri, 23 Aug 2024 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425262; cv=pass; b=u7WSqaX3mbMnmyNQsCfsrUdDYgH4K2ILwjztY+Fk38hB60H6s0HVunYkq6gwnpJVM1XqUqfUDPycj6kZaWgRFNmTXcC32PPP3YuqQO9fEnLe28EyzumZzS9IQlGDlZjYAj00rO+84ZJFxaopYUGVwq4qQqzpPKbcDu5687fR6+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425262; c=relaxed/simple;
	bh=z2SUvqe63SJS2CE9p3BAbkn6k0MB7WbzeBcqpXPi0Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1/DcoF+i8QNPOwC4uE9GbV6wu5weL6p6bxHRKcsCToACbEqUPUl57C9XFcj0Thbp7CC+McTEWT/ht5rNsshnXVbjCqUKH+vFEzQI1cIG8JX2/M7kAJZi0UjmF7yBoNNhE/Ul2ksoXttg6hnNbzH0D8QaB2nIax8r2EGgtmPpok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=DWX7qBb3; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: detlev.casanova@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724425175; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V058mtWqfMNDjNrAC+8DcayYvMgJRA162Wx7goubjYNDwbjvW1YzgT088AFV273Z5mIL+9+r0V6X+BNe+9HIOsLfQn8i5UtiH5VvE4cS5gHATYvguKQ4n6TcpD4PbJ2zQuGG3Nlqzh7H9csXbWMTIIbNmRQ+xDzxzb2xjltIzxQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724425175; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R/iXHj9XRAj21UA46LKyISi4VV83aGdjDzXvd1VkqnI=; 
	b=VXK+jAouPWKABAvyYyURLx1U1Qj89Ug5+ald6pNB1USC5OJy6AhuCx47Y5PG13/49FzQoHD8AdPUx8Rb73rqzkgjmnJ26WvVZKasS4SMti5aBnWi6WqjWVzpsx/DLw7VQWL/PNz1NQXT1yUVcZpDLA1gcPM40ry47oNo1yC4dtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724425175;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=R/iXHj9XRAj21UA46LKyISi4VV83aGdjDzXvd1VkqnI=;
	b=DWX7qBb3qsEMDTCyIi8k169xFK0MknKIpRmZ3w7RXStWr7jSJLXZdjqCS6jWztNu
	7QR3345vczOQtx3SJTO0F5q5JguXtrTqnW2qCe3sm/I0PgxD7sV5tkdM2LZ8cSH3Rwz
	fR0+/K3GrOyhfMZSMb+kOAQrXbsiRQdJfrnYt3jI=
Received: by mx.zohomail.com with SMTPS id 1724425173443655.5992718442818;
	Fri, 23 Aug 2024 07:59:33 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Tim Lunn <tim@feathertop.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Andy Yan <andyshrk@163.com>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Dragan Simic <dsimic@manjaro.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ondrej Jirman <megi@xff.cz>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jamie Iles <jamie@jamieiles.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 01/12] dt-bindings: arm: rockchip: Add ArmSoM Sige 5
Date: Fri, 23 Aug 2024 10:52:28 -0400
Message-ID: <20240823150057.56141-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823150057.56141-1-detlev.casanova@collabora.com>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add devicetree binding for the ArmSoM Sige 5 board.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1ef09fbfdfaf5..c3449d9646591 100644
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


