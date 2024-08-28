Return-Path: <linux-i2c+bounces-5843-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A4A962B8A
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 17:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A6301F253B7
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 15:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F96F1A2C33;
	Wed, 28 Aug 2024 15:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QmzhNP3P";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Jw0sWklz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a7-32.smtp-out.eu-west-1.amazonses.com (a7-32.smtp-out.eu-west-1.amazonses.com [54.240.7.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FCF1A7042;
	Wed, 28 Aug 2024 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857864; cv=none; b=LvXu5ghk293CjdaiM5cS4GDyW+22Uk1ExO9huBrD9ggP8/NRcEZlDE3Kp20CJJg4WDXhs2HD3YSus9d2oaGWpZ798mFGJgBJDhNj3bBJne1VJYpvMNfuKlVm5NUWdT99V/MJe4Df5P1h1zptxtLWedgMy9odPx43icM7ncQYz0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857864; c=relaxed/simple;
	bh=+z4DNLofnJ+4TntmnJnx8/LI+3LWZKrJMGa2MghZgVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsxaHpUzqAJf0OzFz0eD7WMtgCTkp8zjltHudrxFV3MCUHGpj25XeVPRPmTKAmrXIn1baINS+Q8GzMEXDv1eVMu9PO9kDRPazZWRi4Os63KMWv0egFYfV85oyzTFcKYmlB+6NbwxgCiv8uUw7AZE2MadMPgj3nYHYTjzIGkib/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QmzhNP3P; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=Jw0sWklz; arc=none smtp.client-ip=54.240.7.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724857861;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+z4DNLofnJ+4TntmnJnx8/LI+3LWZKrJMGa2MghZgVM=;
	b=QmzhNP3PR3k7RAi3a9umg1oYoxuZ5JH9AdRqMWT0EmsfuahswvU1OkwDSual5N8Q
	gO+Qsou+vQ0s6TfS7PcDbkNb2QeFRDi+lEZdNIMQXKfnErwh2LbYre6M0zLMCwHPAMM
	IawfDLXi2Dk2LjqHgv6NnNAsj0xapMHX1ecVqVn03t41a9vqP1xxkGyZsiR6r+sHaQJ
	xYQkF57SgrCCdUFpMgUFEK1aFWy0tytwMYDXBqaEPRIIlxTLNSA8k/91kXf0BlV40cV
	WkG/9QiZ9aDYkmrmn3A/giQaOkIYH7dOfEKaO0dswBgGbsK/CIsJJ+uAYLc0IJZDKha
	kNA6Webg7w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724857861;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=+z4DNLofnJ+4TntmnJnx8/LI+3LWZKrJMGa2MghZgVM=;
	b=Jw0sWklzgiWxA6Qbr8zsz+/n2UL6zTfLrL/OIi43vVND+kKoDIdVzkbOsh96V7C0
	fqiZfA+Lb1GyUbPmyK8aq47N1MmF+jJrv+DM5wx0ZyCa4MFnL3gsNsR0qt8aLoM34r3
	+/GgZ/iDKgIH9wbRBMGdsRM+zb0n3dd73cIsJJqg=
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, 
	Chris Morgan <macromorgan@hotmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, 
	Chukun Pan <amadeus@jmu.edu.cn>, 
	Muhammed Efe Cetin <efectn@protonmail.com>, 
	Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>, 
	Dragan Simic <dsimic@manjaro.org>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Ondrej Jirman <megi@xff.cz>, Jimmy Hon <honyuenkwun@gmail.com>, 
	Elon Zhang <zhangzj@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, 
	Liang Chen <cl@rock-chips.com>, 
	Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@collabora.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 05/11] dt-bindings: serial: snps-dw-apb-uart: Add Rockchip RK3576
Date: Wed, 28 Aug 2024 15:11:00 +0000
Message-ID: <01020191998a4243-5da1b756-08a1-4f40-9e54-18eb91b8ad5c-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828151028.41255-1-detlev.casanova@collabora.com>
References: <20240828151028.41255-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.28-54.240.7.32

Add a Rockchip RK3576 compatible.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 4cdb0dcaccf3..cfcfd7a6b78f 100644
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


