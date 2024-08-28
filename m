Return-Path: <linux-i2c+bounces-5842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A301962B7F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 17:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC94A2818D8
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 15:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D231A4F1A;
	Wed, 28 Aug 2024 15:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kUbiSyjS";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="K2udBhiL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a7-29.smtp-out.eu-west-1.amazonses.com (a7-29.smtp-out.eu-west-1.amazonses.com [54.240.7.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BBF1A4F02;
	Wed, 28 Aug 2024 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857859; cv=none; b=ZBmZiXGwt0GM73Y//iOhaMYw3Zq4/IBeEmIvsaBRGZ1zWE0wniXDrbQu4m4S2ecMwkPklnbKIdeQoIn5ZyxCsuBn21fUjdTt6H2zKvUVdpqn/sCvOzG7airWjWqjrgSDyw4+kmcWnLhLXnXoqWmmgwsQJ36/3W9AMmYI7mK5wM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857859; c=relaxed/simple;
	bh=Fc+oP+745L0Ley8/lOLIn/gb6Yv4bpuntQ1Lm4ZSg+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJU5MjNGkXll+0Sf87YppaC7zXOr0ke8+Hs3daByJ/Xj/apnUYSbs3dkSZWYEh5S6RfeLufMtk60P1/WERZYg+vkJ0ONuo/djs/Qff9sMaSpaQGhnstuAbyH7FFUxNS3POYk3S98+NIai5jNgoeNtmuxtUod0ARyTQ5irfqFlS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kUbiSyjS; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=K2udBhiL; arc=none smtp.client-ip=54.240.7.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724857856;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Fc+oP+745L0Ley8/lOLIn/gb6Yv4bpuntQ1Lm4ZSg+A=;
	b=kUbiSyjSsWwaIHaHae6VgmgWN/0ccko7Prq7nVUyDV8P8aWI1YFUIMRAG7fGLF7R
	XWasngw05Shp0XMCWA8Hq5+PHff2Rx2Wac6svFNT8zi4BAMCY2lUt11EhwE97Mu9RFE
	LKfZsZDV18BBL8zs+6Tv7Pbd60fRBdjbYSgGTqOLP3nFVOtKu+EnA4jokGi3Z2/8ImE
	pUmRg+wQYVcZq5+LCt8bPWzM/+sBd119LTnPlHY92P1IGGwIbmH7GHibjvaGODLnuYj
	HaMvfxcfVwEIlomlt7jJdgSfIWd+zIF0Sa/0LP1SJV6Yndol5tixvNORBL6MHfXTMVZ
	p7DQmXJLww==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724857856;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=Fc+oP+745L0Ley8/lOLIn/gb6Yv4bpuntQ1Lm4ZSg+A=;
	b=K2udBhiL2XeLPPHQ0QvS4HkZcDfhC9kTcu+1ysL2v7hw55zT8o29Req9nEmVtz1S
	BsDCppzm6rEcJntBhLR7vmSz1LE9R6l5PTDrwXbruMeERhykIvJxOHrshJ6Y+jJ4xh+
	OAQvMVU6BOMBViQ/yxR7TDWMuYNsBDMBU0fl8WRE=
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
Subject: [PATCH v3 04/11] dt-bindings: mfd: syscon: Add rk3576 QoS register compatible
Date: Wed, 28 Aug 2024 15:10:55 +0000
Message-ID: <01020191998a2fd4-4d7b091c-9c4c-4067-b8d9-fe7482074d6d-000000@eu-west-1.amazonses.com>
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

Document rk3576 compatible for QoS registers.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9dc594ea3654..ce5eed77b3c8 100644
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


