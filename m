Return-Path: <linux-i2c+bounces-7347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD8699B65B
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Oct 2024 19:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D561E2822DB
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Oct 2024 17:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3AC824AF;
	Sat, 12 Oct 2024 17:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="uNW5X8oQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30CC1EA65;
	Sat, 12 Oct 2024 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728754553; cv=none; b=LEQlaKkIIfGmd5yjyRBLwu61+aL/dLdbR3e80Lc3jsYkUGPWcc3tb5zfcOQgGVRR6uyaCQCUJXEIdFwQTnNC38afPA5qLAVZIMIDuWcKb+zjk0nd12KnkgBi7LjejTAHBWEmkFCtW3T3PvwrjCAxj2NDvChsjn+loNp2/lnm00U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728754553; c=relaxed/simple;
	bh=B/ZlyxiX2NnLgtqIFj15AHbmeHrL4+2HNnXLckZf1o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cbdk1g6XQgyaN/hjBEtwPxhuZnBxNxKtNbqy8Wa6JbEYq4ywIiKc6K3d8EcTMxTnkMGRsrfNnP8c4Hoq78uvhzmZNut7L93yr8FzlvyYdsTtXkTSa1X+TeXrZ+KdLZb5OpIdjsi+YeOUqwtFrJkvaspdCbVMxBuqCsEciC22+4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=uNW5X8oQ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AQhSOcq/aIa70jmnVrqHrmUcq5CjjmXv02YVDlavj3k=; b=uNW5X8oQ7/TOXG/4sbWLaBuPTX
	YhTRKIC5395aQiOZ1mAgpFu9zMCVrMdHEvsjMa+K18IBsUeUOB6PobQ3n8OZ+nPxV4Q27YkZe8coz
	qcjrqQmwNZwMQU4iWqxW49gryiGIwmCUHim2VMqBPZ5+pSdfB2lOMP/SnEdQxAQExVutDL1hNZ3Mu
	NkEmQDESZlZPLSRAbYtm/hH2zpiua1nLzyWmBXKnU00t5/6x0ArIsm6/OmjE/JZjOXRtGVoAN35nD
	Q0rBgWgWdfCNun0FhYuVsoavbXds6RNJxe0OlHuDAA9JmVmDGwctciSJegyQVsH4FD7zdVQBf7iMF
	uYUE3DvA==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1szg1D-00019k-IQ; Sat, 12 Oct 2024 19:35:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	linux-serial@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liang Chen <cl@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	Alexey Charkov <alchark@gmail.com>,
	linux-i2c@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Andy Yan <andyshrk@163.com>,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Tim Lunn <tim@feathertop.org>
Subject: Re: (subset) [PATCH v4 0/9] Add device tree for ArmSoM Sige 5 board
Date: Sat, 12 Oct 2024 19:35:04 +0200
Message-ID: <172875437678.35125.9831204281305504545.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903152308.13565-1-detlev.casanova@collabora.com>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 3 Sep 2024 11:22:30 -0400, Detlev Casanova wrote:
> Add the rk3576-armsom-sige5 device tree as well as its rk3576.dtsi base
> and pinctrl information in rk3576-pinctrl.dtsi.
> 
> The other commits add DT bindings documentation for the devices that
> already work with the current corresponding drivers.
> 
> Note that as is, the rockchip gpio driver needs the gpio nodes
> to be children of the pinctrl node, even though this is deprecated.
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: arm: rockchip: Add ArmSoM Sige 5
      commit: 78dee7b6ef085c6a1becad536035bdd39557c9b0
[8/9] arm64: dts: rockchip: Add rk3576 SoC base DT
      commit: 4b9dc5d536b988fbd84e68e8d8ac420752b185b6
[9/9] arm64: dts: rockchip: Add rk3576-armsom-sige5 board
      commit: 54a18f63eb1aaf50cad17dd64076293f2817e1d5

changes:
- added some lines between node
- resortet regulator nodes
- removed trailing whitespace from one line
- drop clock-frequency from armsom sige5 rtc@51
- drop rockchip,grf from cru (lookup is done via compatible)
- order gpu interrupts like expected in the binding
- adjust mmc compatible to binding


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

