Return-Path: <linux-i2c+bounces-5753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC595D0B5
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 17:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46F5D285EDD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BC818BBAF;
	Fri, 23 Aug 2024 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="N/fwxotj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384418A94F;
	Fri, 23 Aug 2024 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425272; cv=pass; b=jVlJJcfOH/b8NHJ44BOq1MUKjpcJnR2l4XC08C0H3KV2EQpnkbXx8upTsmwfUpjdlFYgTakRs/hvYnIsv1KXYq0qrPXTYdY1ogGRArn1gkwH9IdKcTpy8YYx+J0JixYR6oEOu4MIBERWUIW5lMt5DL340g2cG/jdA2Mzp1iC7Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425272; c=relaxed/simple;
	bh=m3TyT+VMNTcZXHRsQYzqaiW8pAH1HRv7e4XuPh7QtP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Guw4fDhvmoUr/TKhpIppIsZV8e8gEXYsJOTx4nIXmFJ/LyQXbuzdt/Gcm7nPHvKLhiRyUh49FPSNVBtWt19i1uJZHUUs+MbsFxuqVO+txiUUmef7Nbk6aFprWOq2O4uhYrkGfjIV84F3JRa0cOKjK382Nq+rhoDFlhOdVE1w9Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=N/fwxotj; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: detlev.casanova@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724425189; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LgIcx5p6wD9hOLbHxWYJAm4BFAoLoevlU3iP6VjiIJwkrziOFsIKmH6Goa/MylleKe8oA3F+bXMtOwL/0uGcMtPcA+dDeKqH/KU9XFv5Jyj0EJecvm/5vm/cLfKq16g1uIRYJqoP4mzbOI9OzelnmIkOEUQzX0NPBT0kTIhWW7Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724425189; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mdnBGIhQBYoBW+X6afozEXBo8GSP0k2RnpEEvLsjO1w=; 
	b=kpVfYztzlNMSltKWpAaKuCEWM3bl/fv2P1WtfkUzFOcNE1T96ZWBJ1I2tWhZiP+wbbYDdBwwMOrdq53k0kpQhFbK16UPHMrVHANd9uUcTeh8CIxkCMf3MpE94ijQYDe9M+Mb+IzUAtQ7SnIygCWaQ4WomOAPYYa5DYtpa4nUQfY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724425189;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mdnBGIhQBYoBW+X6afozEXBo8GSP0k2RnpEEvLsjO1w=;
	b=N/fwxotjELTMxNkAQ74RvewcOni4xIt8f6D+w71TBd1ATP0rlCZoeiPoo1qYlQyA
	XXq1w7qIaDMK0AKmWrerf/fJlTpdw91hpPh7RSX0hLhNeaj3cGJZthWPS2KHj2gC9KW
	2+xWc0UuzzIfU1mj+qZxg57CMga0vU5aMVirgeqk=
Received: by mx.zohomail.com with SMTPS id 1724425187513187.44987912681415;
	Fri, 23 Aug 2024 07:59:47 -0700 (PDT)
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
Subject: [PATCH v2 04/12] dt-bindings: iio: adc: Add rockchip,rk3576-saradc string
Date: Fri, 23 Aug 2024 10:52:31 -0400
Message-ID: <20240823150057.56141-5-detlev.casanova@collabora.com>
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

Add rockchip,rk3576-saradc compatible string.
The saradc on RK3576 is compatible with the one on RK3588, so they are
used together in an arm of the oneOf.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
index aa24b841393c0..fd93ed3991e05 100644
--- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
@@ -16,6 +16,9 @@ properties:
       - const: rockchip,rk3066-tsadc
       - const: rockchip,rk3399-saradc
       - const: rockchip,rk3588-saradc
+      - items:
+          - const: rockchip,rk3576-saradc
+          - const: rockchip,rk3588-saradc
       - items:
           - enum:
               - rockchip,px30-saradc
-- 
2.46.0


