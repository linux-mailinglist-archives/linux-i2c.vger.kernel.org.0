Return-Path: <linux-i2c+bounces-6040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3208A96A24E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 17:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB991F26A2E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 15:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9B3191F87;
	Tue,  3 Sep 2024 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jweGpU98"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83338189BB2;
	Tue,  3 Sep 2024 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725377013; cv=none; b=hzGhD3liX2cXFEEuD1quTcq08Qo9qYt0JJUCejIXx3D9hUFrEo6LLfLg+mefAsYohRbV4qe01WG+u4kn1EN5niwBeeiYfCqd1NsrCMg4D9jh61vt0m96cXbfPswfxchHdm0Iewi3vaLperaex+Ro7EMThuSHsL/3g9cx2VMwrBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725377013; c=relaxed/simple;
	bh=IyIiAOZwHngz0sn8kGrxdHkaHK6p3xqpx6CKa/ulcSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oU83zTSPTLghItsHG3oBYZakRZiGHY6jb645u332NPEgLHOeTXG5HHYtRrv95v4YwrtAy97+uzNGNSA8ph+hRflbDWkocHuCRGGQvkDMxb8aXCwhTl3MDeweBEpp1iK1fNIwZAs4WUxZbnsiVBbX3XnMtWGh6ZZ7svoWjUU/Vtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jweGpU98; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725377009;
	bh=IyIiAOZwHngz0sn8kGrxdHkaHK6p3xqpx6CKa/ulcSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jweGpU98XgiNI6wYB3vTNGnmYUWN6K6tpMu29F/5svEP5C70nSAlLfSO+hqwzmr4V
	 6LmNf8BBnIlFVTFqdPAL8sMkFtvxCAtPkRM00k+4fRvAxetVoQMGJCPYj4khpqjyiZ
	 h/17OAqVzwbbOUbv+cz3YXylPc/sBvJA7y7pZeSi6fiWaVA8czA11FBqJzMtCgUbK6
	 w3tX/cbZc8XXgEGj04SBsrZc1cB91+1dvkenTK+6q/cxYU2mcCjBYSW1QE2Dr4VJsk
	 hibfJy/AOkoGwuEwUyEVRdPuBSJhYvpZ6tUoJll3VrIbIR9AZNJB8Pa910Zq8mDqKz
	 fYlsYMQuHnOVA==
Received: from bootstrap.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED1CC17E10CB;
	Tue,  3 Sep 2024 17:23:24 +0200 (CEST)
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
Subject: [PATCH v4 2/9] dt-bindings: arm: rockchip: Add rk3576 compatible string to pmu.yaml
Date: Tue,  3 Sep 2024 11:22:32 -0400
Message-ID: <20240903152308.13565-3-detlev.casanova@collabora.com>
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

Add the compatible for the pmu mfd on rk3576.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
index b79c81cd9f0e..932f981265cc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
@@ -26,6 +26,7 @@ select:
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
           - rockchip,rk3568-pmu
+          - rockchip,rk3576-pmu
           - rockchip,rk3588-pmu
           - rockchip,rv1126-pmu
 
@@ -43,6 +44,7 @@ properties:
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
           - rockchip,rk3568-pmu
+          - rockchip,rk3576-pmu
           - rockchip,rk3588-pmu
           - rockchip,rv1126-pmu
       - const: syscon
-- 
2.46.0


