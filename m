Return-Path: <linux-i2c+bounces-2132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0156186FD03
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 966011F24839
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 09:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC74520B33;
	Mon,  4 Mar 2024 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMVaAVwB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A721BDC8;
	Mon,  4 Mar 2024 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709543886; cv=none; b=D0obt3atJRDb5L8R26UeTe97ppoeUdpyPx18axpcIuY+Z3Yacr3UcENU0bq4FVDdEJQwvArUKB6DM/epJNA073GyK3EF5m5N/qWTZ0MaBJXFk2R32cFjtlR3qkv53U1oRl8cBOxW9NSvmDmianILgGcw0tqvPxocVlJ1VSIAK/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709543886; c=relaxed/simple;
	bh=Hz5X8SjPZaPMVvkREhxPkwcMhjiRAzuRBm8lmosOsm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWYhGJ2mGYK66YqdSDdVwnD2UCz2Cog9mGGi7A8Kstsa+Qt6QyY9lSB6wSd8uUkRXhaNhS7dvdYJed3fo8dev3w8BbklcUbCeiLYIzcObaHH7DV11gtG+/R5oPAmS5OxbSLOSxTJyd9w1FFyJdi36mU4Hc9hWmuf1fBFGY1W4EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMVaAVwB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EEFC433C7;
	Mon,  4 Mar 2024 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709543886;
	bh=Hz5X8SjPZaPMVvkREhxPkwcMhjiRAzuRBm8lmosOsm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMVaAVwBcvnPGrdq6e7btLLYM9gCJQP57sSCSb/GFXetumUhwhDWy4EWBcEfNHuOs
	 nen/R8UCTax7+UIhGtc3FxuSQO9ozn82C6VBuIGCvx1vMD+24pTAKpz3Nje3Xf/I0N
	 6mmZQl49BemD1XRaRAAs+ffgwzHIBcQ8iZwuHGxPdyuq4w7dcT3HDTPLg9kp9G2yB+
	 BBtQVG7yQQ/iXqdMzkJqu+k8SjonewKeRUrQ0gv5yJ4Rg6YzEif7laeHz16KIkb0zT
	 F5M6d4wEhuYNkksw5E8rb1nkn9Np/Q6fA/sSMFcnFRx22q2uNNONhVwWeg6zSRqx+B
	 nIvgFipJpSi/A==
Date: Mon, 4 Mar 2024 10:18:02 +0100
From: Wolfram Sang <wsa@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 06/11] i2c: nomadik: support short xfer timeouts using
 waitqueue & hrtimer
Message-ID: <ZeWRyuN8v-VnraQA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-6-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ADopU0GSN45E8OWO"
Content-Disposition: inline
In-Reply-To: <20240229-mbly-i2c-v2-6-b32ed18c098c@bootlin.com>


--ADopU0GSN45E8OWO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 07:10:54PM +0100, Th=C3=A9o Lebrun wrote:
> Replace the completion by a waitqueue for synchronization from IRQ
> handler to task. For short timeouts, use hrtimers, else use timers.
> Usecase: avoid blocking the I2C bus for too long when an issue occurs.
>=20
> The threshold picked is one jiffy: if timeout is below that, use
> hrtimers. This threshold is NOT configurable.
>=20
> Implement behavior but do NOT change fetching of timeout. This means the
> timeout is unchanged (200ms) and the hrtimer case will never trigger.
>=20
> A waitqueue is used because it supports both desired timeout approaches.
> See wait_event_timeout() and wait_event_hrtimeout(). An atomic boolean
> serves as synchronization condition.
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Largely:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Nit:

> -	int				timeout;
> +	int				timeout_usecs;

I think 'unsigned' makes a lot of sense here. Maybe u32 even?


--ADopU0GSN45E8OWO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXlkcoACgkQFA3kzBSg
Kba7iw/8Cjwrc5SjA/NL3KJonpOz3S37vaadRXid+bhB8XUNVUI0PMJkyw//gEc4
njYS1/v197pg+4JsPPorLhOxjDGoD14nvA+kQkZ4XDktCxU+U12NUBKDc5XgFMmN
cx7+QIr8AtfJpo5Il8nNYO4xn15+F510a1qjPgTlCE4QV2sX9aeSgOazretpVNmp
03IKZDUPmP3HCFfNkGgt5PzpZpnY4RlPflThQcMYJm2wXz+E/h6VM1xqmENlhJQa
2oqZ9FNBttktiahGx8vBpGeLcSXnQF3okUiCJC1f7MCP9ApaLI7a9700eneemBLn
+Q9M1Gexied95SJcIJYKzgTzN10+GOHg8P1pFsuf3NKNCmZApobOIc3Nv/zDfGum
Rp08Hrq0OgTSXGyPsLPs6OSeEtEg7KvCO/WZyuLAdt+wHVEKTMYsWra3FUCu6YMB
m1RIQcluy4QVlv4E61RmOI22YsKibwl2mw2WMENEbLodFPc6lvtSSiEmjWSOBL4r
Pv1oTlkNjBGOpgFF1T9TByvhhmIWLCQcbAHxR2R+EGcO3NNQ7wLMFCLkm7cm1sI3
u4Y+cxDfdXz0zag7rJkp6GwzxwmNorvo90wbNA3FODizmmqFuUt6tIExR2hfxkA8
4GURp7XQJAp5kXMt5vBAaEoDDCvaa5ivgOmaq0OFdQRcYnHtHRw=
=vre8
-----END PGP SIGNATURE-----

--ADopU0GSN45E8OWO--

