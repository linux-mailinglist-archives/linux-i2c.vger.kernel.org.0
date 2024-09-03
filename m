Return-Path: <linux-i2c+bounces-6065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FED96AAE6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B3D7B22AEA
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3881AD250;
	Tue,  3 Sep 2024 22:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ynWZOEXX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2411EC009;
	Tue,  3 Sep 2024 22:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725400876; cv=none; b=beB3/STIi6GvK/c1bB+oMgGFXe5N6Z79aAXZHOC9tA8jUaALZsmaVaHuQPVv7QmZLN+lNa17VM+pGS4DPxSmcCpp9FKWAJ9Pf2sinq2uhnsFsD4TdckJTcsg4SXp6g5A59tF34AWke5tKAwZSlPreIFxGZHgxGvVao3KpE9LNs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725400876; c=relaxed/simple;
	bh=iKQpi3l2hulm3EI170VUrKcm5ThnpGqa4a+f1KBzIVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gJ+nsx3U/U1r93hbjEWNR8GKdWThw8je3UFTMLV9pP0WUjaYUrTZftF2YxheAfrpV1RZK8ylYEgsqZB6W+uC5AnQzsc7xyUAGl2kAfopQodQB67TgSquR1WrTArQLGeE8lDjh8mytpdUNtDCRVEiet460H9nkHnNKLZEhtKXHmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ynWZOEXX; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cP5gkG4poHNhOgTPHW8pS6NlcCd5HhlJQScKycx9I04=; b=ynWZOEXXuI/cTZMXQbpQBTxQS1
	N+U2v78bHi+x6+pUM7YSUO+M0UxJxsIw4lNo8gB8cJABkeFbIbSRa5AYxYjEcOXoQ0qApY+NqZHw1
	yczKvbt612cG2P0OfsvSB9ZGB9XyVoqmqhXtLCuhwF9ygTL7gCPKV7sUggXrDyW6gDNbCTX9IUptC
	GJmRlAoBMs700glxYHix/bxX9oajQKXyPfNOU4QZWIrHmPuuMZwiAcqgvrU+7Xqm+aZaoCEOD390u
	ZPY8jIDdfL71mpS+HkhKUha2uCqVNtgqEQe3w5D3pEgLA7i41hRMn4WmXAifuyUV3F9b5Ww7wt5fs
	UH/Wwpzg==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1slbZz-000365-3r; Wed, 04 Sep 2024 00:00:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Tim Lunn <tim@feathertop.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jagan Teki <jagan@edgeble.ai>,
	Guenter Roeck <linux@roeck-us.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-spi@vger.kernel.org,
	Michael Riesch <michael.riesch@wolfvision.net>,
	linux-rockchip@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>,
	Liang Chen <cl@rock-chips.com>,
	Ondrej Jirman <megi@xff.cz>,
	Jamie Iles <jamie@jamieiles.com>,
	kernel@collabora.com,
	Elon Zhang <zhangzj@rock-chips.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Yan <andyshrk@163.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/9] Add device tree for ArmSoM Sige 5 board
Date: Wed,  4 Sep 2024 00:00:46 +0200
Message-ID: <172540084163.2565171.11096510350978641735.b4-ty@sntech.de>
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

[2/9] dt-bindings: arm: rockchip: Add rk3576 compatible string to pmu.yaml
      commit: 59420d8ad7809827524824a3891d6a081e735449

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

