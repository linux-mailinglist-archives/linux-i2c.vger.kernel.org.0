Return-Path: <linux-i2c+bounces-4179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10791207C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 11:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB43CB23247
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 09:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5996C16E881;
	Fri, 21 Jun 2024 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvDBwLWb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377112D1EB;
	Fri, 21 Jun 2024 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718962048; cv=none; b=M7jtpBGUVhEttzMh+/N4c/HUd8hVN0k6b7fVG2TZCTx6N2i6Tp9DOJu8ZRo1GA7Ujg7nbU9eiTIsPwU6N5IU7n+VFF+ZcoP/H+KSuNd48YFCT5mf4H7CIEr1ipaJSdUatQlBCiAcSqbwM49Kvzot5qPteyVKYbA9k8QIW1oG+dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718962048; c=relaxed/simple;
	bh=uhH10vmIJUKkPbdPA4/INQpMI+q9x/UjstbjxvXrdJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bp+ricdlcQ9eAFMfxPiVCrLdhN4866P4WABO2DOReaRPrfpcm+TDBGsA4mYTDk8Oq+jONWUMEtFbB2p/bb6+AbZv8h6mFnQTR9chTuctP9Yvz6y5NG1qGvFx6m/A57QdTcsCy8PY2TLTG9AFqrLh2iOIEy4GCMPNNGEacdgLdss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvDBwLWb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE34C2BBFC;
	Fri, 21 Jun 2024 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718962047;
	bh=uhH10vmIJUKkPbdPA4/INQpMI+q9x/UjstbjxvXrdJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvDBwLWb2dv893GPCGGbeTdvIWAMyKlOsPT/1BC5DgW8PlNDKB8sb9QRzT1auO0Q2
	 lVxKjTcfQUsdJUTUT0vdx9mBmGvm9lGgwEvm6fwUW07u92IkS0lsWDnzoTl/NqoTE6
	 eSArKee1Bsqtdy3KpGfXRDr1E+ZsnP2Q2JHUhUYmzipoD8sgrmFJg38on8AjE+O8qG
	 ftviQRYS9VkELyn58VdzALl2sa9TQj5ph9057h7xNzdDMRRSmVuTjfPC1OxsC9Vpxc
	 oOFLLdUfr1c2w/qRQBlLTGDjMm8YxxDZrrXpxIqahjcSO7wR6GB0oDXFxPfLQ4p776
	 4H9YFZxq9vsXg==
Date: Fri, 21 Jun 2024 11:27:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Sergiu Moga <sergiu.moga@microchip.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, 
	Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-omap@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] dt-bindings: i2c: few fixes and cleanups
Message-ID: <5vbvx7qnbv7dwugmnp2sitlpvvsor4hn573spbwaklwbwvilfy@evntmrout65x>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
 <qru4aqjphjnjpo6yjxl2oznhlz774iv77u4u7u4jldnmlanps5@vpzxntuz6arp>
 <6bc864d6-11de-4762-b309-2e2a3bffaa24@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bc864d6-11de-4762-b309-2e2a3bffaa24@linaro.org>

On Fri, Jun 21, 2024 at 08:02:03AM GMT, Krzysztof Kozlowski wrote:
> On 21/06/2024 01:05, Andi Shyti wrote:
> > Cześć Krzysztof,
> > 
> > On Thu, Jun 20, 2024 at 01:34:48PM GMT, Krzysztof Kozlowski wrote:
> >> Few fixes for I2C controller schemas. The third patch (atmel,at91sam)
> >> depends on first, so I suggest not splitting this into fixes branch but
> >> take as is via next branch.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >> ---
> >> Krzysztof Kozlowski (7):
> >>       dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema
> >>       dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema
> > 
> > merged to i2c/i2c-host-fixes
> > 
> >>       dt-bindings: i2c: atmel,at91sam: drop unneeded address/size-cells
> >>       dt-bindings: i2c: nvidia,tegra20: drop unneeded address/size-cells
> >>       dt-bindings: i2c: samsung,s3c2410: drop unneeded address/size-cells
> >>       dt-bindings: i2c: ti,omap4: reference i2c-controller.yaml schema
> >>       dt-bindings: i2c: adjust indentation in DTS example to coding style
> > 
> > merged to i2c/i2c-host
> 
> So you broke the binding... Why openly ignoring my first sentence?

It's not an issue. We can get the fixes first and apply the rest
later, I can keep them in my -next branch and reapply next week.

Otherwise I would wait for everything at the merge window, but I
don't want to wait so long.

Thanks,
Andi

