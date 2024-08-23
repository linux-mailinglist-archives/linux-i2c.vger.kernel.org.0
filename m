Return-Path: <linux-i2c+bounces-5758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5B095D0DE
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 17:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 560DD1F21D9D
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D2018950A;
	Fri, 23 Aug 2024 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="IK5SE3zb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7418EFF3;
	Fri, 23 Aug 2024 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425294; cv=pass; b=TFpd+AuT90DZ+IJNfd7UmPI/kbFtr4CRa7l+Jg9Wu04/Vy2OxtQ47Hi/waGmsem/EFJlyLFbNY5+hRBRLdQ1gSrbzfjn7ezY5Pv9W+6D/ZPEXr6FRGnnFgyCECrWdDxxiMPMjl3MlkLyL+1wyFyIvEou+O6Tzct+xkoo0Qvryzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425294; c=relaxed/simple;
	bh=JuaCx0Pq82oRXAICTL/kXfRKm8zCFLb+N5Kgnc21/J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxwK/W15I4IkZS0G+fv66HSUSLgnLqt+V1Z9VqYLyL2oPcGiTa/Ds5GH/WKDGQhpP2nwS7MSuVQyb7uMxbjP9ofIBXjLYadOPv1qZP6JRkDaKjM5I8XgV6JmN97cMj65HQRFyjKJf4KwBWhWwS7ZWHg5NqR7wffO7X52/YzbaEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=IK5SE3zb; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: detlev.casanova@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724425211; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dj2mvWjbRalcqiNcTBVtZ9YUJHrpH4IwEUyv362i7BNkYtCnJA8ratxHeOATpXHR56y9zwmQoEK0UbOBfW3SxVV4GMUPq9/aEs4bXS5Uhtuc0uDdlbI4T0XM4EHbEHxkcGnt7yaiTMz/N/netouV068exKrfikRkGLzkhq1uV5U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724425211; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8kgt/WHayX1JQch9XAM5RYvcZqKo8amtw9I5NRTG5h4=; 
	b=KpFITTWxehKg2SJolFUwZttz0skyz0iSMRf/XuOsJsEyBSYF1NnL8Lq0DqAN2dgC0jWbZ7uZ+mOtBdsw/9vaRRKc4oayAV/ZIuv+KLtyP0Sl6Lyr7i+XPCvzn0rPEV2Q7ZRNosTvH4VXsXysI3OA56wVQkKXjXI1zESurhH4FqU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724425211;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8kgt/WHayX1JQch9XAM5RYvcZqKo8amtw9I5NRTG5h4=;
	b=IK5SE3zbope9OE9ZH9rnIFQdZELh8OI80Ky0BcRalysYipyNIpyzKaU2R4h+/HgQ
	bOOSlcw8g7i2BaYVPQLhP8tyWmpBiAuL5X0QnnjzYsHQKNzQVNdQTbnRNVg4Dw5TkVK
	TNctOhvHuhd0i0V1LE3VnHOIHtZrDKEbIC0+HBtY=
Received: by mx.zohomail.com with SMTPS id 1724425210997501.96783202863116;
	Fri, 23 Aug 2024 08:00:10 -0700 (PDT)
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
	kernel@collabora.com
Subject: [PATCH v2 09/12] dt-bindings: watchdog: Add rockchip,rk3576-wdt compatible
Date: Fri, 23 Aug 2024 10:52:36 -0400
Message-ID: <20240823150057.56141-10-detlev.casanova@collabora.com>
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

It is compatible with the other rockchip SoCs.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index c7aab0418a320..b5a3dc3770706 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -29,6 +29,7 @@ properties:
               - rockchip,rk3368-wdt
               - rockchip,rk3399-wdt
               - rockchip,rk3568-wdt
+              - rockchip,rk3576-wdt
               - rockchip,rk3588-wdt
               - rockchip,rv1108-wdt
           - const: snps,dw-wdt
-- 
2.46.0


