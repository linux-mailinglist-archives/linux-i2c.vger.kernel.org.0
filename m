Return-Path: <linux-i2c+bounces-5110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C42E946557
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 23:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAAC3281AC5
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 21:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0811448D8;
	Fri,  2 Aug 2024 21:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gBmaaVkv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC7B13D28A;
	Fri,  2 Aug 2024 21:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722635127; cv=none; b=PzIfjdJzwGudIB/r52/YBsdBSvrLaoh2yBz9n+ESkMsspal7y+boHbhUBonUavivJ5hWTwRu48hKoT67R9XH55a3Lt+6ZZ4iiudTXbAQyKPsX1EC6+JPxk0tiAb6yGOj/QOYbZFou5O6P+Qumucu1HSjLfGHRoDdBpOFBv0pBuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722635127; c=relaxed/simple;
	bh=jdsPCgNeKVqAG0xTZ1S6sdPpwXRZyMZ+Rk02fYbQ/yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/RkruxrUx5z/PN+cx25gZROXFw5d1tC9S3gwj4LRhZmQIQ97kHenhzgQnLApIQ/3aYcQps7VqY2o75dkAm32UC/p3D7b0E3aWoULqBd+rC2ej1tQtIWJ0grWR+rYERhrgEckVhjuqGjwDIB/t9BOewDs6ZJPwYZw9118au2l5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gBmaaVkv; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722635123;
	bh=jdsPCgNeKVqAG0xTZ1S6sdPpwXRZyMZ+Rk02fYbQ/yo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gBmaaVkvckgdbWt34Y8nGQ7pO0x/eXl+4P3khwEma2sJHF4TRZ4aVxU93/QwY3GMD
	 MHhNyEk7iFkQfUis35lbT67gsyjJSLF1ZhJgK5NACPlgrGXjcT5uhq2dPpYoITHle1
	 2hARoq1oOIYvJHKjxs4tcrWmbU2RWDkhpOq1jV2C8F9m8amR0Vuz1rxHCNun5O6oBD
	 aP9P8m09cspLlpggeXTaaHEYs9M65WPCtTw4esA6NKWOstlcTpiXo1KnlEFtcnG+Hv
	 9CGG6h6MOBIHsltA3qnfBxOhScHA9Grl2IBe6hb/M7GMpRBAAB7e5eILbm+oQvcpNV
	 okXviUuZxE9Mw==
Received: from trenzalore.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 99E3E378221A;
	Fri,  2 Aug 2024 21:45:18 +0000 (UTC)
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
Subject: [PATCH 01/10] dt-bindings: arm: rockchip: Add ArmSoM Sige 5
Date: Fri,  2 Aug 2024 17:45:28 -0400
Message-ID: <20240802214612.434179-2-detlev.casanova@collabora.com>
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

Add devicetree binding for the ArmSoM Sige 5 board.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1ef09fbfdfaf5..c3449d9646591 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -49,6 +49,11 @@ properties:
               - anbernic,rg-arc-s
           - const: rockchip,rk3566
 
+      - description: ArmSoM Sige5 board
+        items:
+          - const: armsom,sige5
+          - const: rockchip,rk3576
+
       - description: ArmSoM Sige7 board
         items:
           - const: armsom,sige7
-- 
2.46.0


