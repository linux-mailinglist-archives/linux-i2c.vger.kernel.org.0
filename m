Return-Path: <linux-i2c+bounces-5847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A872962BAA
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 17:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB49D286644
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 15:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995501AAE1F;
	Wed, 28 Aug 2024 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F6gTDs7E";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="T7SN8tEO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a7-29.smtp-out.eu-west-1.amazonses.com (a7-29.smtp-out.eu-west-1.amazonses.com [54.240.7.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20851AAE12;
	Wed, 28 Aug 2024 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857884; cv=none; b=gv12SyrcHcgGq6C9UsLLEwhwQcYwKvO7tgyeYcHdPrxlHH6+/jF5b7Fdh9P/49GjHmq/dS2k8apGDgVIMPlTX6F+X84sH6O5vdoKgaW3AxcDiS0DykFvQRbyfRM3WTLTf+EU5y8PopL8YboZ/POu9KVXr8XaAmmqSjUv2puiE6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857884; c=relaxed/simple;
	bh=3Mxy4AinXYBybrCx2Yls+Re1Ra8Op+cXhIbIKTJWLD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUA5W1rXNBFHm48CNxpqneMuH758mTPPDEHowqjnBASBSkvLxsP6iWV3gcHWGyy/5jHKUc/rnwks0lkk/nIkCGoxazrs3dn2O9SHsWvqL475up+pRf6jMfzFpt93BmkaQ5oNtTbrR+aKItEWqSSRZuK38fkPGXbaadrxTVXOFzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F6gTDs7E; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=T7SN8tEO; arc=none smtp.client-ip=54.240.7.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724857880;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3Mxy4AinXYBybrCx2Yls+Re1Ra8Op+cXhIbIKTJWLD8=;
	b=F6gTDs7EE5PBv3yey2HBvWil3Ii+IfTD9WpdiYgD++cw6whv63oFBF2lN9i74yPN
	CmBCepzrMy8iK6+T++JAyJOS2YoRgcoOi6U/ZGzTJ19hNZfzIFS13gY8hhfYrNeag+D
	F5Liu4m1DXsFL7CzqI9/7EOBrcI5WcfwRfKspjuzBxfT+e7jD/nDLktRdeeVAUhMgNG
	jUTzc+AcXQ98abwSnDyxXacaF04OZW92Qf2G4p9Z55UT94M0AP4Y9GyB/asFL/q24eW
	uWzg0IAn7JomRcBbjEWQXJZmZNtgblPt9H4mFbMRd522PEopwRmdAFWnnTy6LkTSMZK
	6pytuo4L4A==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724857880;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=3Mxy4AinXYBybrCx2Yls+Re1Ra8Op+cXhIbIKTJWLD8=;
	b=T7SN8tEOYLyEeLtLECRIjXEWWO4jxTMwG7tJcSh/AZ0QZzAm/SRSiF7oA3ecfpu+
	dK8r3jbEvaVioU3rfhebtR8dNV0KFV0VPc5gb536tUtIzt3tkKHwlzQUazGt1nSW1vB
	3Vk3dme+ebOMj2/bu/C/ydnLITodOcBjkHXYoMKs=
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
Subject: [PATCH v3 09/11] spi: dt-bindings: Add rockchip,rk3576-spi compatible
Date: Wed, 28 Aug 2024 15:11:20 +0000
Message-ID: <01020191998a8e9b-7b1e3358-d895-4ba9-9204-8b0ea3cb28c5-000000@eu-west-1.amazonses.com>
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
X-SES-Outgoing: 2024.08.28-54.240.7.29

It is compatible with the rockchip,rk3066-spi SPI core.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
index e4941e9212d1..46d9d6ee0923 100644
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


