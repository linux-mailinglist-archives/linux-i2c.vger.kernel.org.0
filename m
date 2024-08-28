Return-Path: <linux-i2c+bounces-5845-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E93962B9D
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 17:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B316B224F8
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 15:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F325A1A38DB;
	Wed, 28 Aug 2024 15:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W3yqJkwJ";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Qqhp2RHb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a7-48.smtp-out.eu-west-1.amazonses.com (a7-48.smtp-out.eu-west-1.amazonses.com [54.240.7.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0271A76C8;
	Wed, 28 Aug 2024 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857874; cv=none; b=VBN+sEAPyrLi9GAjF5nl96yvNhmVvsQFc6o8Crwqcn+Zk+XZ5fKb9WjxURTTPwniCidNg6EEJVV2iLzdiltmSSnWPxesP5Q6Lh8f3uxEEvXF+IxKrfkcXxFN9KtKZJADWgV5qPq6I77s5DNeUmKuVrI9G8GkFCqUpPKM5NM13iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857874; c=relaxed/simple;
	bh=eroRuymFGct5tFtXZVXe7idGbNt35wDtyZN4XFBz5uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3SbDvlhd9ys7wA9/RwuXAoiGeVWv7BQ5NGiIVRLVPFQsOVqsmtEEtQTvprlvEg3Rx0i9BKRUyM7ZdgnIwFcPyCHAtjp5DQc/Y5Ywx3xXYYTAfE9Daq39Zl5JxOIfwvCMI2B+Rh2Anf1pVghGchs65JwSsGlwNKipfF+c2iQEdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W3yqJkwJ; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=Qqhp2RHb; arc=none smtp.client-ip=54.240.7.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724857870;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eroRuymFGct5tFtXZVXe7idGbNt35wDtyZN4XFBz5uE=;
	b=W3yqJkwJwHPHVL4GSI7k6IHF7UJYmSc3oVEA7RdN+O802iM2xjDQTxX3D4pJBKVc
	/vIKxNIuz9qj+TCBRYQprFI0o2WywIo2v5UYuCwMWvYEVSngnNg8+5oC019N93fXmKv
	wO/T0dLVzEU4Ws0tNu44SoNoJspBfMF8RQf6mYmwNvoLpWhYqcr6jOI+7ZKCydOus38
	FfqM4QLRGa6lYEzQOMwfyGj/rgV46IotyPMYgL0KWmIxD6LPSTm9NS182URK0Z9+QFk
	2Z49fu+z7UhjY5DyIaUhS/zkWbnfG16/9VgFmRPMsfJmm3z4JZa9AeUSNSgK0aoPGzr
	sa/cfjVzdQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724857870;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=eroRuymFGct5tFtXZVXe7idGbNt35wDtyZN4XFBz5uE=;
	b=Qqhp2RHbMKQXAHR/mfAKEC39MC5TYvkszk/xEhU1lHT9DU3TPkgorOJvVJwNQ9Hc
	nVrEIVy8I4m86OaV0QKnYXBp60QJiNZejzY9/pVcS7fV2+TDc6yyd+Ghpxujldqg22B
	TEEkxXF+gouDasw8wlusRgBe3NDvRiGoBMjA3iTI=
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
Subject: [PATCH v3 07/11] dt-bindings: gpu: Add rockchip,rk3576-mali compatible
Date: Wed, 28 Aug 2024 15:11:10 +0000
Message-ID: <01020191998a6891-a1f28a77-c585-472d-b42b-32a878679304-000000@eu-west-1.amazonses.com>
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
X-SES-Outgoing: 2024.08.28-54.240.7.48

The rk3576 SoC has an ARM Mali G52 MC3 GPU, that is compatible with
arm,mali-bifrost.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 278399adc550..735c7f06c24e 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -26,6 +26,7 @@ properties:
               - renesas,r9a07g054-mali
               - rockchip,px30-mali
               - rockchip,rk3568-mali
+              - rockchip,rk3576-mali
           - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
       - items:
           - enum:
-- 
2.46.0


