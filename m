Return-Path: <linux-i2c+bounces-6064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5496AAC5
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 23:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96EE62816D4
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 21:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9D01D58AC;
	Tue,  3 Sep 2024 21:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ZJ7sGUQX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA91D54C6;
	Tue,  3 Sep 2024 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725400712; cv=none; b=MPrub3QsqfXPcTvwRSyr7y09oG+PzGyl9lGgfTIi28FjqMslwfT+53pgVeJ2hTDixevHl4m7t+c72hMptP/cMUm/Sce+ptFdA9LnW6GzaWnUbR4ZyPOtVO+G73RqQh4wPSbAfwRy6jZvDDwDaOAfPJbh4CQE2cJ/j7mkfF4zsNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725400712; c=relaxed/simple;
	bh=+36XtkLue95cvlXX/DCu5KZUdM2/qpeN3Y6e7xOR+1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Humj6gBzwlmhvd1LbJfoPTMxOt6Oqe1SDG2RNJN8q963gHrespV80tv/xAESpsVMyDL2GO0B+es46acD0S9uGhlnu5QdX2Nd/5+ANjGDxfdXtU+gTSxllrfZ8f5m79AI4F2bGqxcV9mX+9CxHlEk3Lci79mjTSgowMhFpthhIhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ZJ7sGUQX; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+j6f5if+f2W86QKE1LKn/g5w4kYrcF6g49PNUZ3ZNP4=; b=ZJ7sGUQXwRu0Z1LawQGUT7OBit
	KFbquRc4bhEA1OEQ2VHQWfx46V+JOwjnHO/o61Mo6y0dAt48EA+LO2qSs8DTMU1lfeKuKHshqU1zl
	P0rtWSHVVQQ/+rKmX6IFNw5UHexXkrIgSsJgU+Wz1fl4QZghKbyNGiiouVXxCXIg7VlgPY4185KSA
	CTUlgT/4VY+IibQ1NXqABFZtd0OEsmxOTcctKd6RcfTRErVbQVcVkjQDC4Jc9+JGNBacNP/AT00h7
	cad9Dn43pVCGeqTMwFp7PrQwUf45OEgBw9kLmvPq2cFzf9VNdpllH0cgz9KY6GfqsGdRjVgZJoxbA
	YviFHN2w==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1slbWj-00032m-2x; Tue, 03 Sep 2024 23:57:29 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>, Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Date: Tue, 03 Sep 2024 23:59:12 +0200
Message-ID: <23007922.5W6oEpyPa8@diego>
In-Reply-To: <ycbhqmkwz2hirnvp6j47kz3cxnli3db3i5ah76gngrezs5ww2r@57x2gxnr5hyk>
References:
 <20240903152308.13565-1-detlev.casanova@collabora.com>
 <12506188.O9o76ZdvQC@bootstrap>
 <ycbhqmkwz2hirnvp6j47kz3cxnli3db3i5ah76gngrezs5ww2r@57x2gxnr5hyk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 3. September 2024, 18:47:17 CEST schrieb Andi Shyti:
> On Tue, Sep 03, 2024 at 11:59:34AM GMT, Detlev Casanova wrote:
> > On Tuesday, 3 September 2024 11:46:00 EDT Andi Shyti wrote:
> > > Hi,
> > > 
> > > On Tue, Sep 03, 2024 at 11:22:33AM GMT, Detlev Casanova wrote:
> > > > Just like RK356x and RK3588, RK3576 is compatible to the existing
> > > > rk3399 binding.
> > > > 
> > > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Acked-by: Heiko Stuebner <heiko@sntech.de>
> > > 
> > > I will apply this after 1 and 2 have been merged.
> > 
> > Sure, although it is not really dependent on 1 and 2.
> 
> yes, but I want to be sure that everything is coming in.
> 
> > > BTW, who is maintaining rockchip.yaml?
> > 
> > Heiko Stuebner is the maintainer of Rockchip SoC support.
> 
> I would guess so, but I think we should also add the entry to
> the maintainer's file :-)

now you made me doubt the wildcards we have in place ;-)

# scripts/get_maintainer.pl -f Documentation/devicetree/bindings/arm/rockchip.yaml
[...]
Heiko Stuebner <heiko@sntech.de> (maintainer:ARM/Rockchip SoC support)
[...]
linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)

So Maintainers seems to be correct ... *phew* :-)



