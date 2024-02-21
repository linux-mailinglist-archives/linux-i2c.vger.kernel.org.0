Return-Path: <linux-i2c+bounces-1899-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3885E4D4
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 18:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE48BB22A2D
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 17:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDDF85C7A;
	Wed, 21 Feb 2024 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MACaeRN8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED0A85C68;
	Wed, 21 Feb 2024 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708537439; cv=none; b=QL9xrvrDjVseL1bmB/hLCHzi+g10CAp2UEEFODriMMmH6CDvY8OVhNUCMoLBguk8q+TdbZ2UOQyj24yu15yW+4xiF3lO4SWfBh/TMoVhkRUOxunJeWL1GbePYXEqJ28LZZUOuRDLQ3AdrvJpJnw8B00hf6Q8GXx4vde2bEAdA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708537439; c=relaxed/simple;
	bh=EAVilG+5m/AHURqch7gUgltSDg888U/L1wVF8AY+h0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AY5RF0gsevp/1NndpVnoOnRhLQxQ0cE5tK7juC3qI4fcRS9xfZmZjgnlDqkD7qCAF9Zz/JczXodpPUxN7rsbhPmdew0WT93oEI9NnAia/4Y+bZCkJQRAFEbPFNOrskXwEQNBKKogarDIq6W7rt7UsQnUMz3EbUw33zMuz64J4dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MACaeRN8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8925BC433C7;
	Wed, 21 Feb 2024 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708537439;
	bh=EAVilG+5m/AHURqch7gUgltSDg888U/L1wVF8AY+h0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MACaeRN8lMsNMrafHUuR5tTV0m/lcwxMQQyOLOx9xox93gvIkFhnYDFoNAb8KS5ue
	 9CItIdTwwj1ogpri6Xnrhtg6ur7BJ3ixF5oWuGIr/SZkP8ZdGmvVHBr8croJ4NAKD6
	 kBcyV3MhYosaq9bWezqBbxvlBJ5LqRsxoe3E9K2RY52El6pCRVRv4BEiDujXNiJnOS
	 tcRwGDfrYA+4RILVxH+jWN8NuvHOWeGrDZG6ajW3Jm8zFkaO0oWNvYPI0oJvmixQ1M
	 sSKFRMEnTNj46VItzN9Kp7GAUEsfJBTPvVKp22nJ6m/BGI3XUnl3+j5vHDOWdR8JI+
	 QAVAQllob8p4A==
Date: Wed, 21 Feb 2024 18:43:55 +0100
From: Wolfram Sang <wsa@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
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
Subject: Re: [PATCH 01/13] dt-bindings: i2c: nomadik: add timeout-usecs
 property bindings
Message-ID: <ZdY2WzKbElloXC4-@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
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
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com>
 <20240216022704.GB850600-robh@kernel.org>
 <CZ6E24VPJKJG.35LACFD6ZV5KE@bootlin.com>
 <CACRpkdZZhhzg5SY7U5dv_OfLEVejRFom4V9nCfkQXunAw1ZXSw@mail.gmail.com>
 <CZ94LGRSF9KN.15ZO1VRMIQVR8@bootlin.com>
 <CZAX02IL1N1J.2GQR9D73GLRZB@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F60VzApEKksHKb8j"
Content-Disposition: inline
In-Reply-To: <CZAX02IL1N1J.2GQR9D73GLRZB@bootlin.com>


--F60VzApEKksHKb8j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> > > > i2c-mpc (fsl,timeout) and i2c-gpio (i2c-gpio,timeout-ms). I agree this
> > > > prop has no reason to be compatible-specific.

Anyone up to convert these drivers to the new binding and mark the old
ones as deprecated?

> > > As Rob mentioned this isn't in the kernel schemas but in dtschema, so
> > > you need to patch this:
> > > https://github.com/robherring/dt-schema

@Rob: My memory fails a little bit about these two schemas: we have the
github one for generic bindings, not strictly related to Linux, right?
But why do we have then i2c.txt in ther kernel tree? Why don't we sync
regularly with the generic schema?

> Note: I've sent a draft patch to dt-schema. See:
> https://github.com/devicetree-org/dt-schema/pull/129

I used to argue that you can set this timeout to any value in userspace.
I have been convinced that it might make sense to set it early so it is
in use already when booting. So, for this pull request:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

All the best,

   Wolfram


--F60VzApEKksHKb8j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXWNlsACgkQFA3kzBSg
KbbCIQ//T+UfZwN5sfx3E29io7LplBxBq1Vc1X1yI094wCUlwjSfpIHwZb/eFi3l
JTOHIoWz6fWb8zhtUfsF5VXj+Mz9R2ZaxSZpwp3ZJsn+qdhR+DpulzqhrLS1Vce/
dD4DPsVn4fCeXijUtNFZz8fhfqYTW0/8dN1wAAkFTsREfvB99gYuPGU+Ib9f8ELQ
jP7czMAee4luC2CN2VNmOJZSu9tdEAaxy+ePOZq1PtA2ox6QbMxM98WIURyJ3LCQ
EpHONtSUXhY4wcVH4C0I/gpZuw5AWk3X6QRvIXyR/kA7TerokwK0F+6X0Ug6b0Hy
SpKn7vXsPkD1Up+QlJkFQu7psTqYiHHRNPMf5kr+s9CytknreWfburno1a+LeX1j
dyXXeoTNMRdVjmHgibV/0tAPtgOs0PxzicfsVtDrOTzJ9Qcg5aECGpszIMGD2FDK
w230+coTWbqiGMakQUkfOM7jayHUwC7WEl+xLXpbyjqAKRYwX3VrMxIW8RHRItQd
EdLd/FdBp82t9EGlUCabjlyMJNS1N+rQ8PLvKYPtRzl4/7IpQejYd8yZnaX99G6/
ndJQeRCIt9Wu//PCNkAlQXsyRBkApDk8Ai7tXuJQZC+0Y9Yvuk5/rKRlNwtcoeMX
8AgdyMQcQH6a/XmBm28kmb1s+mkAbwxDrke88y4hvascDGcJUTs=
=DKt0
-----END PGP SIGNATURE-----

--F60VzApEKksHKb8j--

