Return-Path: <linux-i2c+bounces-5116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55C2946576
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 23:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57628B227C5
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 21:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D8914F9C5;
	Fri,  2 Aug 2024 21:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="sHfJhj00"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A7513CA81;
	Fri,  2 Aug 2024 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722635157; cv=none; b=eJ9UmjuSFjVAShTs4IkKuHPiop+sjmxwZI2V0bPh+hYSIYJD8lOL5nZ+aOd1BthOEI1Ao41e0DWPU1n5GZZRDqAHT++MHerSqbXQhI7CHdApVzdBflo1NgoHJv1oI1emQ2UTj4ieavJ2yVeXICaZGcSF2AdC7HnaKoWh+FdnCXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722635157; c=relaxed/simple;
	bh=uvT3dzvWR0w8/HlD0nqMKCFCYJsuy6C0W36k7ko/k7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWjb8yGHWincVBhWh9//1uPKPJdSSFRvUBD2a6bVCCwLO6ZE4raCrw/uhPFZk/hPZrPRHxVYtuP40K71cFKVMiZvFmSkufgzXmeNbGJGexWeeu8ECMIUXphUMa/uYHBMyRBW1RQLOP1Ck4kUA9HuxsV0w6rVQNTywD4uexX3rYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=sHfJhj00; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722635154;
	bh=uvT3dzvWR0w8/HlD0nqMKCFCYJsuy6C0W36k7ko/k7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sHfJhj00PVz457G4VpgLq9dsaQfHiMM9+5zj45iiyD7cfDOlOuZphIZvXhWU7gl8q
	 cx2UckLCPRWCSb6umTrhEog5UcaLM/yHjzg+NNkx/JTMGYhTxD3PxRHkmpqAeTGb/M
	 2WcjoWgWRTdq84gJkKnanNEaxn8MBNYvF2cpBmtRu5xQInYXDicDkKPT1tjnc7vMsn
	 tlSHzEMB/zURYGiY3o3irG+jeY0OJLUpKr6A8CASuwPCkYjkJs7/QU4z/rCpNx0mpF
	 B/G21SAccur35w/eBdQePnk9t0cyEhMHOAAeERB/lSdNRuNKx3xQm2q6Wy8cg7o9rv
	 hkBhezsMbORng==
Received: from trenzalore.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A4B043782220;
	Fri,  2 Aug 2024 21:45:49 +0000 (UTC)
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
Subject: [PATCH 07/10] dt-bindings: soc: rockchip: Add rk3576 syscon compatibles
Date: Fri,  2 Aug 2024 17:45:34 -0400
Message-ID: <20240802214612.434179-8-detlev.casanova@collabora.com>
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

Add all syscon compatibles for RK3576.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../devicetree/bindings/soc/rockchip/grf.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 78c6d5b64138f..4570fa6e67d61 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -20,6 +20,20 @@ properties:
               - rockchip,rk3568-pipe-grf
               - rockchip,rk3568-pipe-phy-grf
               - rockchip,rk3568-usb2phy-grf
+              - rockchip,rk3576-bigcore-grf
+              - rockchip,rk3576-cci-grf
+              - rockchip,rk3576-litcore-grf
+              - rockchip,rk3576-gpu-grf
+              - rockchip,rk3576-npu-grf
+              - rockchip,rk3576-pmu1-grf
+              - rockchip,rk3576-php-grf
+              - rockchip,rk3576-pipe-phy-grf
+              - rockchip,rk3576-sdgmac-grf
+              - rockchip,rk3576-sys-grf
+              - rockchip,rk3576-usb-grf
+              - rockchip,rk3576-usbdpphy-grf
+              - rockchip,rk3576-vo0-grf
+              - rockchip,rk3576-vop-grf
               - rockchip,rk3588-bigcore0-grf
               - rockchip,rk3588-bigcore1-grf
               - rockchip,rk3588-hdptxphy-grf
@@ -58,6 +72,8 @@ properties:
               - rockchip,rk3399-pmugrf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
+              - rockchip,rk3576-ioc-grf
+              - rockchip,rk3576-pmu0-grf
               - rockchip,rk3588-usb2phy-grf
               - rockchip,rv1108-grf
               - rockchip,rv1108-pmugrf
-- 
2.46.0


