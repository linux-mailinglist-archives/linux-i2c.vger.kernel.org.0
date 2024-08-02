Return-Path: <linux-i2c+bounces-5114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9F094656B
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 23:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F2EC1C2120C
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 21:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F8714D712;
	Fri,  2 Aug 2024 21:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="xj9jSLoV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBAB13B7BC;
	Fri,  2 Aug 2024 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722635147; cv=none; b=T/zyEn7wud5PNiGlghwA22kAJrcwKdSiTECMAKtRVe0KcWbYjrqtWJpwbxm+UQuQG4Aqq4w4rzTXYtBPQZJxcd/iOWoQiSe+YCFZLd49IGPi1vZDINngDMiMGX2nBVl7rUFRih7v8mL2DV+2korrmekX9wEFNhzoUI2g3Cf/MrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722635147; c=relaxed/simple;
	bh=vhsFBWvnwRcvgkFFC3UkhcXZJdBWDgru/XEOUGrJnB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgF5rvjXf9rqjdda8T17OCLjupTFULqSRX4RhL0oot0mTGoIZjRf8Is5psPqR7n95113v2vKnw2SdE09L117E3e2wGVHE4ggajXLCnUkpZ0OCTgImcJBZXUOEXe0cOThb2pfd9ndrnAb6Xa6R4qxyrrFC/e6SZa86QST/e0I0Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=xj9jSLoV; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722635144;
	bh=vhsFBWvnwRcvgkFFC3UkhcXZJdBWDgru/XEOUGrJnB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xj9jSLoVOzd5vcWFsUJYQxmIxX2KpG/fuygaxF26IRo5FUldcH2yGoCrcpZCw+yyY
	 fzbw/gyokUgrO0h9TiB3GCJiQASoQOy8CK7oJDsqroDNjEKlHYfzCjRoj3n3gyQlO4
	 tQQxHh6rUbW08XBfwMyRNhXlIk3hvpjVXFf4sRDgmOG2h57sk6xYNHnW629iQIhzFu
	 uOV2/SzwPEgwlgd3J8lCHuYquWee3xvPOyEnhl4BK1K+RafGZMYyaXaymbI/RFONkf
	 d6qiqGjMIk0gJ223J7HNujSmWLYn0KCA92C6XwZTJCYC9osxwUEQJYJJzY6o9X9HsC
	 iDscOcw426Qkw==
Received: from trenzalore.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 51A36378221D;
	Fri,  2 Aug 2024 21:45:39 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Tim Lunn <tim@feathertop.org>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Andy Yan <andyshrk@163.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Dragan Simic <dsimic@manjaro.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Weizhao Ouyang <weizhao.ouyang@arm.com>,
	Alexey Charkov <alchark@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 05/10] dt-bindings: mfd: syscon: Add rk3576 QoS register compatible
Date: Fri,  2 Aug 2024 17:45:32 -0400
Message-ID: <20240802214612.434179-6-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240802214612.434179-1-detlev.casanova@collabora.com>
References: <20240802214612.434179-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document rk3576 compatible for QoS registers.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9dc594ea36545..ce5eed77b3c81 100644
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


