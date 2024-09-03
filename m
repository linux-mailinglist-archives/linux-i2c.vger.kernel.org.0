Return-Path: <linux-i2c+bounces-6089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 505A396ABE3
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0704B1F220F9
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB591D7986;
	Tue,  3 Sep 2024 22:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="w+y9IjSJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A91D5CD5;
	Tue,  3 Sep 2024 22:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401451; cv=none; b=bUCdhdNHHN6VvmGwG7JZYqpRuVgAtc3VvsVlRedxoCZyOcrn077RgTy10Dl+DEvj28uXsZvMsdJgIDo1n8tKqMxak/JK7F/g60n/A64bOufoF4HZlr7a4qx5Ew1NnzuxMMyAwoIkOcIk/2+hFPLTlLVIA6if5cQZZIMVmDtm7Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401451; c=relaxed/simple;
	bh=lUVot6sx53PMH7AVdyfYZF5smN2L99/Ta+PwbWV98qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pE+qPrdGJ7ZhqQYOA57jJTNlCn6EKosJToxtSa7cmFmZngZzhU6fkW8gXz2X6E1LA+8AvqF+7ecGEwxaoy3w8F4ACUkjBK8+It4f6w5qa+dc0EpHRLRXGynGD5qJ3s0Xrk2l+pK7+87RYpqoiPHqnosAareYwqjJ9pfFFAgRHDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=w+y9IjSJ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PmAan6NPVAhVozSYoq921sKeDS6etdaKRx0WGKUNzPg=; b=w+y9IjSJDl3NsTLiQuOYJKEffo
	RLLqIhTKjPF80cWIwGyfcjQX1yDaAPqgMUrXE5fzV7afKReFLBeWf7XhpEyshPQPH6XqWqbpcHLGo
	iynY4oFTmd2qzmsovTZ1CnbYmB0GR8Y8l5QrU70dkuyhYQy2iLlKm9VIKPnXVpPmDood1YGkp8lz3
	JZh6j0lfWw5LZhQy/8BqQLLKUNovMNsyQPzvSwVI93Kse7gj8yKeMTpAHPfmbY5KXjWGSMxqNZK0P
	WEq2rtZTZTgydAJ2HE/vYW4BE02Ynl2aNUkopQSyYydfcfHHdvU1xF0F5UaJ4a9BNaoOsSqR0JQ2Z
	zx+2+0dg==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1slbjR-0003Ah-7l; Wed, 04 Sep 2024 00:10:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	kernel@collabora.com,
	Jamie Iles <jamie@jamieiles.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Liang Chen <cl@rock-chips.com>,
	linux-spi@vger.kernel.org,
	Andy Yan <andyshrk@163.com>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Guenter Roeck <linux@roeck-us.net>,
	Dragan Simic <dsimic@manjaro.org>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-serial@vger.kernel.org,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Tim Lunn <tim@feathertop.org>,
	Ondrej Jirman <megi@xff.cz>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jiri Slaby <jirislaby@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: (subset) [PATCH v4 0/9] Add device tree for ArmSoM Sige 5 board
Date: Wed,  4 Sep 2024 00:10:33 +0200
Message-ID: <172540141128.2569462.10719274439402034002.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
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

[5/9] dt-bindings: gpu: Add rockchip,rk3576-mali compatible
      commit: 053d157840870fc56aad8c4d3122690a65b2d462
      drm-misc-next

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

