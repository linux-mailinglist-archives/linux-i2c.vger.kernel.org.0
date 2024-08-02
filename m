Return-Path: <linux-i2c+bounces-5112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64691946562
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 23:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 085C7B22F1D
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 21:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3508E14C585;
	Fri,  2 Aug 2024 21:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TXQD84Df"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5808B14B963;
	Fri,  2 Aug 2024 21:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722635137; cv=none; b=pMi4UmwXS56nBSBl9VWOVHyut7hly1NgGC1n2vNVcBzWwo5UKXQ7XyVhjPxwd0RqhtIpD1PinKDTOCfVd3tdwrw0jRe/UgvLNPn3aX+Rd8YtGUzPaZY14JG7G2Slw66z7afGZm+sjqYNkIXmYNy+ZLHoX0sE8MSCVxn3xZq7tA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722635137; c=relaxed/simple;
	bh=e0+PUEkHSyUD2HR5V+vwn4lHRQiXIOqVrikA7wcZnLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHpYawWt+7iyLctxjKR4e9iKlHLTinIGHLY56QpW55CGILf9jlvN3dLbzcakYk29OYd+7f0ax1geUNsSEfKiVxx/5rlx3s4aXzLXXBymSoiRwjQU+UhIjTcWlxwLEbIlvXz5bD1rrn5mXj2MTf255HmdqBqJ8yJNge6G6zWobi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TXQD84Df; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722635133;
	bh=e0+PUEkHSyUD2HR5V+vwn4lHRQiXIOqVrikA7wcZnLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TXQD84DfiFvaTtmHgPfoi4qlFE9GP6WNpIE0vkOt20H1K+DJb7kEAikpQAjLLDpan
	 KuEcrpwuRWXzXf8sWxPSYM5eUOOuFJcNkNeH7GJQa1MiWz8QeJufSNlX65/ERNiAg/
	 K2/9FHJap7CYmE/SjaGhleTsO4nJec+ZVfXyE4IFmFcmQCJvZVWtnQUbUtR17enylB
	 YWKnroTvg5l/ToSQird1WVO8AMlXHqwFmpQpoD5oPA4ubu77H6y2eLH42jGGKiXukE
	 fxh3PWZ6bOH1vEBlNLTp3x5+O7dmHHwtKV75slSyD3OwjgCt+erz5yXxIhDqS16mJS
	 oWimHfggzbueg==
Received: from trenzalore.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id ECDBB378221C;
	Fri,  2 Aug 2024 21:45:28 +0000 (UTC)
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
Subject: [PATCH 03/10] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Date: Fri,  2 Aug 2024 17:45:30 -0400
Message-ID: <20240802214612.434179-4-detlev.casanova@collabora.com>
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

Just like RK356x and RK3588, RK3576 is compatible to the existing
rk3399 binding.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 82b9d6682297b..a9dae5b52f286 100644
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


