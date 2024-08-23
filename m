Return-Path: <linux-i2c+bounces-5754-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CFF95D0BF
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 17:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35C8E1C2121D
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E92918BC26;
	Fri, 23 Aug 2024 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Pt4J873Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E48818BC09;
	Fri, 23 Aug 2024 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425275; cv=pass; b=J7z6nRiYaEnYBXqXflgf2fs1DmVA0iVLPhPclsNJ041gJRUyCkDmENtMsDWFK14nXWzmjoEBd1eks9iSWoIaPUVn55EwWU8WhmAAig5Iwwkmw7+ta3Tmhq71WY1Mm3HVyM53Eg+oohQXX6lcjVJN0/Zw1yQR8TN55Z+3voomPAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425275; c=relaxed/simple;
	bh=yuKAsTUgCzRuXipuK1rNtrJuK2JySddLhKRSeoVR75E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuZHi9bcuGNWba752TGI/4xjXxNT5if0TlOlhCOzgVpdoJDv0sJRGFmhlQQ5g0DqwG0MTPPLkF+qJWykDeH3MNAPHMhcM5LR5l+UdUQLTromXewidlcT1jRI/KyfEnjji6e0v49yh1UX/Zj0rqNZ+/rYkXQMRJW8PcNOMB3gUVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=Pt4J873Y; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: detlev.casanova@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724425193; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c5XKDWtz0PyZ3llsxPSMlHilIDvXol2jyO3a53kmvb/9Ysghd89439JHu+xl7yfn3W21+kiL6oxMXXtZO3qwFXZaj7srk1LuvqjrRqDNgrF9t1O2CjrAeLXh+SpQCzjYBHUx1acY/HnB85ceKo7YqTeKZgbDFCAEjk/6/3bD9jg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724425193; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w+8eUF8kdoiH28K3ACgnOOrkTbvlrzHo/4iCcj6+91A=; 
	b=k2rrIE9z2irLYbmhWgLK6FoNW+vT4KB3Igw57y9iPskCw6gIQdok1gZxSvpu1dgnJleid8adG2hOZDbV4Z9axrtwZka8JZcR6bLKM+/gB1pjyHAbas7hVrjnFY6R/BGI36ZoIBN4bbwaRLQJjETOiH4o+0GcKuHEgJxsvG1Rz3Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724425193;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=w+8eUF8kdoiH28K3ACgnOOrkTbvlrzHo/4iCcj6+91A=;
	b=Pt4J873YdlCCjX+LgOQsRZzQKe+avzUHhH7fif8iYRsNERXSGQw/9L9GiDJHw7EI
	6sTHqs7iiUixW51iLMhLl39zJ2lp/ANEcnZ0s1GwMhNdOs6qqmFCD5ksngmy5ZXsCW4
	vp6ITFFlIyzkFRSGKgioBtLo7gS4AwOhWgRisrqU=
Received: by mx.zohomail.com with SMTPS id 17244251923121003.7289406206586;
	Fri, 23 Aug 2024 07:59:52 -0700 (PDT)
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
Subject: [PATCH v2 05/12] dt-bindings: mfd: syscon: Add rk3576 QoS register compatible
Date: Fri, 23 Aug 2024 10:52:32 -0400
Message-ID: <20240823150057.56141-6-detlev.casanova@collabora.com>
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

Document rk3576 compatible for QoS registers.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9dc594ea36545..ce5eed77b3c81 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -103,6 +103,7 @@ select:
           - rockchip,rk3368-qos
           - rockchip,rk3399-qos
           - rockchip,rk3568-qos
+          - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
           - st,spear1340-misc
@@ -198,6 +199,7 @@ properties:
           - rockchip,rk3368-qos
           - rockchip,rk3399-qos
           - rockchip,rk3568-qos
+          - rockchip,rk3576-qos
           - rockchip,rk3588-qos
           - rockchip,rv1126-qos
           - st,spear1340-misc
-- 
2.46.0


