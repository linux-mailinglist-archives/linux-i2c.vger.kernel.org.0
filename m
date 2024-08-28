Return-Path: <linux-i2c+bounces-5840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74842962B72
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 17:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20DFB1F2198D
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 15:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4F11A3BC7;
	Wed, 28 Aug 2024 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QlfvOkPV";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="UjWt2XV2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a7-46.smtp-out.eu-west-1.amazonses.com (a7-46.smtp-out.eu-west-1.amazonses.com [54.240.7.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672621A255C;
	Wed, 28 Aug 2024 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857849; cv=none; b=nn/36iDp/nynNSAtx+4+Kbeo+RPaYTuSt1odLDCSxS/os27JOvTv0sBkpRQAbaLcZ9STOa6ZzWtnq8V2sXGhuDvxVp0ExzIQ3XBfnplcqCA6U/piYEgAfzTusiZkWy8u80GzfpUvGWdGlGe3PcR/9VtcQvTPZyCZhIbXdeORM1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857849; c=relaxed/simple;
	bh=IyIiAOZwHngz0sn8kGrxdHkaHK6p3xqpx6CKa/ulcSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSt6YSXEW0BSLvylohoyH2gjPLhAWmNzqaKsFU0pX2q3sX5j/5BuVsSq0dQBtvDsUE4Sg+Slnk6U8uSsQ/u44ohnbGz5sQlldnarRAtTTlwi7ijX55/OuLiki0/BRZx8D2hGDysTtdBM7gz9BWaLFUFAV4A4FWKV340KunAM35s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QlfvOkPV; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=UjWt2XV2; arc=none smtp.client-ip=54.240.7.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724857846;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IyIiAOZwHngz0sn8kGrxdHkaHK6p3xqpx6CKa/ulcSM=;
	b=QlfvOkPVy0KuXiYeHlBm28+ywYF5rQbLoYUfdk2JIHuSKgaUslSdN25eBP+1L+FK
	9ECp5rZvyrOHOEtK4PKnM98y3hT7yiiftkp5Nt/bGCdhxgwYA+3LRhvCJb5H6FaLugG
	6Ur5GsaFKiulMAInfYMyeWTTtWaagEf63e8VDaj5sA+xulBkgtJhVyBG+R+RYlU4kPZ
	rMoL4vfTBa4LqnHk0dR1ZMEUdG/8XfLOjxWMlOy8gqdX9q1hMHYO4f9F+gh5aLgFAjU
	Ls9raPsPnaN4TDKXa8FEzaYj+Agc4glxtpQkSg7KPSyXTsdebY7us/qC4FgVqp18duI
	0UZBj6V/gg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724857846;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=IyIiAOZwHngz0sn8kGrxdHkaHK6p3xqpx6CKa/ulcSM=;
	b=UjWt2XV2jTy21TDQrOiog0+5MIj64XuGW0PDfuGFHrmAuEnVF0KpgM51Q5kwsIln
	Mk+brKUf8XqkR4tHQbJ3m3J4DEqPKZLCjIAJSADqo6DO8caruH1fYqxFNaUDvlpgcic
	MazD18RUezRAB8R8ZrpgMXqaKrj6EQdFjdnIugQM=
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
Subject: [PATCH v3 02/11] dt-bindings: arm: rockchip: Add rk3576 compatible string to pmu.yaml
Date: Wed, 28 Aug 2024 15:10:46 +0000
Message-ID: <01020191998a0a28-80397901-7846-43c8-8593-7521bffcdcf6-000000@eu-west-1.amazonses.com>
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
X-SES-Outgoing: 2024.08.28-54.240.7.46

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


