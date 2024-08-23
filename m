Return-Path: <linux-i2c+bounces-5755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D55C895D0C9
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 17:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F0F1C2140C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D58418C908;
	Fri, 23 Aug 2024 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="jPDY0CeQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F5518BC34;
	Fri, 23 Aug 2024 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425278; cv=pass; b=RcCDyp4Yb41Qz4kJ01t29UA/fRdXFYgoLsBSdK1UNMxcWgq0+nymOLdaFuWxbZHw+PALVTb6NH0xhS/pwTbEPXyIgclMDm47gEeZ03H8tExRqw1+I5oDDbfku1yFh+oqsa568aZf1tyfzeSusU1DH6Zg1UPd/bHYtrIVnMaK7eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425278; c=relaxed/simple;
	bh=GuWSP3PYzm5CyzTLN9vcKfZ43zHB0yCNEkLAo/YApU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tY2oikgM7FIFYNKxruyV3UKTOKQyykBDqTlxUr9WaTXjW+QOzJwoUWrZQSaqVIQDuBvBwpSTswSgy2fTP+0rzarBBSWahlUUm1RcokDaGv3dY0XInsdmFs6IyHNNr80T6dfrT0Vp4QwMrblSa6+XoX/QPlr/2JEKaOhIaanup9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=jPDY0CeQ; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: detlev.casanova@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724425197; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qvr2qAsR6iNosZ/jHhWOBEOt+NkBPow79IyDqaMR7cCsA6CmzlYbmFymJquy5ILYrYu5hmSh5Pa23Xsx45t0rutPrtJyeef3DjqpX2NDCRXC5lMuEYNGOPNrGOvMyO7VTOPm9m3DQMZ7AmghhyTASjJsWYaSHXgFVbCElfS12VM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724425197; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VKO6wxrLn3RmQCGe0ZISt/7Kohul5ungRgMD6bGlZEI=; 
	b=eS/BnorLoezLCEvyDtcflxOBBooEqR2tyRj7n5BC2J/b1ry2a1icU+/URb346Ixg/aQBASffeI0ooJ1xvnkjP7iIkLnV+wqn9KtO32PeVFSwpDuQCaLNt0pKEAZTvxB6WmrtIjmaRgnfWCB2JvHB1lEiQ99M6Eqob+mNJhNf2Q4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724425197;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VKO6wxrLn3RmQCGe0ZISt/7Kohul5ungRgMD6bGlZEI=;
	b=jPDY0CeQJlTUoFeUPh2l9QLbTZB66xfkaivMK1SFF9p/FZNCKfkFEJ0dyflYS//p
	s8tSJQMru/hhBXHIzwIDbsVTNV9dMFfG+b6Tv8rlD7ZQp+f0NgC/STvYmpdlTF9Ut07
	zaFhz03EfFotsmcaSsUxT755BWGvGcWjJx3T2kbg=
Received: by mx.zohomail.com with SMTPS id 1724425197036247.07215618968894;
	Fri, 23 Aug 2024 07:59:57 -0700 (PDT)
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
Subject: [PATCH v2 06/12] dt-bindings: serial: snps-dw-apb-uart: Add Rockchip RK3576
Date: Fri, 23 Aug 2024 10:52:33 -0400
Message-ID: <20240823150057.56141-7-detlev.casanova@collabora.com>
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

Add a Rockchip RK3576 compatible.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 4cdb0dcaccf38..cfcfd7a6b78f2 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -49,6 +49,7 @@ properties:
               - rockchip,rk3368-uart
               - rockchip,rk3399-uart
               - rockchip,rk3568-uart
+              - rockchip,rk3576-uart
               - rockchip,rk3588-uart
               - rockchip,rv1108-uart
               - rockchip,rv1126-uart
-- 
2.46.0


