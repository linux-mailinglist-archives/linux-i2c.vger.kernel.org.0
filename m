Return-Path: <linux-i2c+bounces-5841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE1962B7B
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 17:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE210B25CCA
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2371A4B70;
	Wed, 28 Aug 2024 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RrG7b4s1";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="a62Q2ozU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a7-51.smtp-out.eu-west-1.amazonses.com (a7-51.smtp-out.eu-west-1.amazonses.com [54.240.7.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20531A257C;
	Wed, 28 Aug 2024 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857855; cv=none; b=sSVIGW7HNe+jKmQ5+Uh4wJ/YYJjMiC+UGKHYVqBtjFbvOGezfr2EK/8KWe3zOcFmMFMuNTfsVlr9mOdkQtYaqM30Ngcq3cJpUixxhOEEr3+TSV1m4pDgAbyiGgvhSOV7xIXCIPVOzSyQWUdWioKl8E4JUAQL5KlYnzrVZtO8jW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857855; c=relaxed/simple;
	bh=q91nNqe25vY4zdGQ0jID+lBhXgdVdrS3Q9cXE35aK60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkoR4CEfQM/0Mf/EfLUOE1zwHAJtuEHJRHUGPXxeLeyKzQGZrKXTeL5ln2JZq48bhZj5NPdu4YL5CALmvfyZ20K2dHqspLvF/WReeBDVCcY9dRRSnhBawi5qY7gRQjNj0qpNVQQh5ZIz5xKH4S+aNjxf22pMOEkwkT9CQ2nj3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RrG7b4s1; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=a62Q2ozU; arc=none smtp.client-ip=54.240.7.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724857851;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=q91nNqe25vY4zdGQ0jID+lBhXgdVdrS3Q9cXE35aK60=;
	b=RrG7b4s16zLja2ag7Y8K/z4JQWr+pmLBMS4W2478rKFBehqW89ZruBzHY5qoFqGE
	eGHwxuJbR59Uc7nf4/py5DNkE938h29VtYQ/XMQ54aDK7Aq/Uljrao8xH+eayL3BRv4
	ltQu5auvYeUabPq7prqLHub1OmRn3Mqs4Pw4sQMGheRazaPTWEpeAU4hp7pHp8NvPdy
	FCCpue2RcEqQcTq3/z/qpV9xRhcica2J0uVMAto5HmQR8M8djQ+JsxTi/pxxW+mzYqi
	VFupFFCsXRpmkblFcWf4WAd6AqPOp9faKe0J0mfoxDWKbAQeISLZbsPI3AfJaVsbCyE
	EX4GMv0hDQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724857851;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=q91nNqe25vY4zdGQ0jID+lBhXgdVdrS3Q9cXE35aK60=;
	b=a62Q2ozUn9zNB8cW0ZfO7YTbWP002yT8ZD7DPFWDmRvWqB5Gv6Ifs9LP7rNiYgSZ
	0VPqpEW734zo7Ru7ej/VMBsq6aI09TiDf6xUYjmnTj1yjsMLWiidEH5A0UwQoWm6T9n
	0rXUnyEIV49YIQzfKTUU76Vp+KqZX38WHs8FpmpA=
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
Subject: [PATCH v3 03/11] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Date: Wed, 28 Aug 2024 15:10:51 +0000
Message-ID: <01020191998a1d21-c491afc1-ee3a-4920-989f-53c5d9bcfe38-000000@eu-west-1.amazonses.com>
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
X-SES-Outgoing: 2024.08.28-54.240.7.51

Just like RK356x and RK3588, RK3576 is compatible to the existing
rk3399 binding.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 82b9d6682297..a9dae5b52f28 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -38,6 +38,7 @@ properties:
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
               - rockchip,rk3568-i2c
+              - rockchip,rk3576-i2c
               - rockchip,rk3588-i2c
               - rockchip,rv1126-i2c
           - const: rockchip,rk3399-i2c
-- 
2.46.0


