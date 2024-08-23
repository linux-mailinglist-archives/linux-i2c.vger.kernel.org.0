Return-Path: <linux-i2c+bounces-5763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDA995D26F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 18:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6056D1C22728
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 16:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57699189B8A;
	Fri, 23 Aug 2024 16:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Qj8k0qIq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D5818593A;
	Fri, 23 Aug 2024 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429217; cv=pass; b=b/1aLozzKfzaoF/j/7pKTfxFQJ+HIZX4HABPN/U8CcNuzuWY0Dx4Y2Mi/QtdbHXg+SFjfLpci5bBUnqjzTtKvC11fm2fECQXpMUpUDFJxPzSG9tChyOwRdvo7xMRIjJbkOmX1/uUlk5EL1SMk0x29Ax95TtjVkehMQ/O+ktAa7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429217; c=relaxed/simple;
	bh=tBB3izCPMfNbf0TqYcL+j5sUi5mpYAci9rH5LDp8q24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iBKeDnfL0aeb23kZQj19opSgUoTtJm17yz3BrMn5EQG5wkSbBjEmgwFxU6jgdnUkQcWS9hZJy5sldKeyg4kcF2Fl17+YJLWXuyGdXNsE7pBN0YPZWU2+gwUMlnMgNFK4/MaWIaPD9xzlOFgmN5tWoV4qI+SikLzD7huIWQvtz+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=Qj8k0qIq; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724429133; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MjRK1FoJsuHsyIVh4RKCCc54M6gWCjzayDtGsNTo97lxPTlzEHOzuPiovQrrjUJmaJ5s90+XuamKSaXVKuWxZOVAH3Bh2dfB0YO4s8YRjLu8ROWo/SjA7TonfQN/Nxp1DL+/sOlJlYLuPLtZN6+b0yztkrjX95/53JgMg+gFheM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724429133; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wDoypvfwN342dAKyLY44n6dnwxz7IYCMVu0LjSVZLls=; 
	b=OkalxmebjQXK/KNBLiMUpyfDZY3yUF9lxpQHzS6JQq9nyIuQYPz4dFPFV1Mzz0HywvcQffmaRmLuZrYdktRgoBTNbajEvjSvM3UrBAkfFiCvscC+NH6RBWSuvHd1pTFv5OkD9rV2dyTAk2JQGc/KjmvS9E//46qYImoKkcQKgcY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724429133;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=wDoypvfwN342dAKyLY44n6dnwxz7IYCMVu0LjSVZLls=;
	b=Qj8k0qIq4exUkeUJptd26SKuPlitb5ZgBqC7E3rk4WordXlOwH+24duUcyGUL9O2
	hLBr5QB77BbIfluvvtyxmmART4/PB3WKPu7qNXu6jHnrxIWlG1XOTc9OHwqoWm7H8JP
	Z+4ldmd5ncaGMTv2H6RjCcptwCTfFGlpoRk6G05s=
Received: by mx.zohomail.com with SMTPS id 1724429132247991.7209561127088;
	Fri, 23 Aug 2024 09:05:32 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, Andy Yan <andyshrk@163.com>,
 Muhammed Efe Cetin <efectn@protonmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Elon Zhang <zhangzj@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v2 10/12] dt-bindings: spi: Add rockchip,rk3576-spi compatible
Date: Fri, 23 Aug 2024 12:07:10 -0400
Message-ID: <1995660.usQuhbGJ8B@trenzalore>
In-Reply-To: <20240823150057.56141-1-detlev.casanova@collabora.com>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

It is compatible with the rockchip,rk3066-spi SPI core.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/
Documentation/devicetree/bindings/spi/spi-rockchip.yaml
index e4941e9212d13..46d9d6ee09234 100644
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




