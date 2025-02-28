Return-Path: <linux-i2c+bounces-9661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081CDA4A5B8
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 23:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26A9D7A99D4
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 22:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A4B1DE4C7;
	Fri, 28 Feb 2025 22:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="TyCXX+0Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9071A254C;
	Fri, 28 Feb 2025 22:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740780721; cv=none; b=mzUFPcgwg3oOj2hhlnXDkBzUsAtv96ouWqZuH7FGYjAztNQ2ww6r55MzUGgtBp8LVNA4mckGL1/rvqSiCJFvy/AFMM6l8Icq0y5uxao98Msix5DDHRzUJfY053PVFnDAbQwRJU7i0at0NAnGvc0ANYRYX+sj4npEgK0XcNLMseQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740780721; c=relaxed/simple;
	bh=n0RDSDT7lrDfgY2gY0Jx1+2UsomVL7pe4VNMSvttegY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pCygiEf+cF+0lcBYaLrpC0A3kl3XHISBARAaqepMmzSBbxFHd0xhMF8oIJldMFt/zBo6uPw46cXHjSe7ubo9bj/uka+KaOJcXQVlEqAodLaHxFZK3k/mHWsH+5Rf5CQprgZkIkQXjn4LWd7GHd4zPdPSlY9IbtayRheicCtxbbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=TyCXX+0Y; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VZfcm07W8RwEaBy9lSmqnHo6WL11ba796zrsT4TrXJI=; b=TyCXX+0Y4INx6O+beYAL/qfnpw
	xrOw0ZkMweR/I6PkMC5d1ncuABaxrCMZo/JxoY7hyf68suXi20D9bp/o5Jog748TyIWhA5xTtfdhJ
	N/9WXodyRsorIeLIQ9+zLGNTYFHVsdtiPcbsloZD0vCvQINbv/s67+lmDR7NQnuJUO/+ETU16Om6R
	1HlG2XdFsLUUWvKRrskWKV9dYBOCOtVuiwOaOjEGed51G+ukhAj1rBpT5OxC8+BgQa35paN0TGDQr
	4hOOmhezcDXfbRRCWzsWXdkF0cebcaY93q/VeB5g6WxSIRp5W7DnHlnEvuEUKFlAL6zEGHxplPFXS
	kAZzc4mQ==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1to8Zk-00040X-Sb; Fri, 28 Feb 2025 23:11:20 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Simon Xue <xxm@rock-chips.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-usb@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Johan Jonker <jbx6244@gmail.com>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simona Vetter <simona@ffwll.ch>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	linux-pwm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-serial@vger.kernel.org,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ulf.hansson@linaro.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	devicetree@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	linux-watchdog@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Tim Lunn <tim@feathertop.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Mark Brown <broonie@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: (subset) [PATCH v3 00/15] rockchip: Add rk3562 SoC and evb support
Date: Fri, 28 Feb 2025 23:10:48 +0100
Message-ID: <174078063579.504376.4763347846550378295.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Feb 2025 19:18:58 +0800, Kever Yang wrote:
> This patch set adds rk3562 SoC and its evb support.
> 
> I have split out patches need driver change for different subsystem.
> And all the modules with dt-binding document update in this patch set
> do not need any driver change. I put them together to make it clear we
> have a new SoC and board to use the new compatible. Please pick up the
> patch for your subsystem, or please let me know if the patch has to
> send separate.
> 
> [...]

Applied, thanks!

[05/15] dt-bindings: gpu: Add rockchip,rk3562-mali compatible
        commit: 049e7ac203d51fdc3a739f5f28906788e8eeea03

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

