Return-Path: <linux-i2c+bounces-3986-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C68E9046C7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 00:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1783284808
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 22:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322971552F8;
	Tue, 11 Jun 2024 22:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C+9rKeQk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669311527B3
	for <linux-i2c@vger.kernel.org>; Tue, 11 Jun 2024 22:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718143986; cv=none; b=h/aLHRXmfqpJIwCWkt9FL+wZwOnRm6jTKYHRjTYC78JB79CYST8pvvZz68AEH3ONDJ/IcI2fPFHslEexh7DBT6ccmRKAMozXD9gYJ2PUTzHAdIAYgetoyQ23ywHAGzZB9YPN14KlqsWsM4LwjWSIO6bcyH95vFgklu+jzQxRLNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718143986; c=relaxed/simple;
	bh=ntignwSd5BkQDAoVuBygKbCneHpXi8rp0ewb5JbG+YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPdwoKXQxzRsn4bsOXun6z4y6z64Fc19pJg6hKVgfCu6CacKPT540BquKYZpVpNIsEgiVcl9alhcKKRMc9Un370tCxiqR5U7Wd4rjuZXIk5Mrqi3GrO07XjfSf26lj5voPdz/RkuEB4U6mEVTme/AA18lyv+U0YIf9GVqHJ1YQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C+9rKeQk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9IZI
	pdPzR9DR3MCp+AyrdUtLauredv0OWoF1WwgDZ50=; b=C+9rKeQklbHFCmWU7lCN
	bd8ThpgmhSUQLC44BUTfUIFi1T9mP5KlAvXOtTzCHelbdlfqPj5hvilEzhXrxgl4
	hUy75vkRoK1CUGXJx8D4RVm/EI6XGDfe6RftoFbE8H+rEJs5pF1x3fn+4ASgDy1N
	44u1quA9f3LqtE2ervu7TH49wlNaQfre15O4lJ0btF9sIhbri3Zk+vl+jYPzvbdt
	u2tELFsDEem2FFj9tLB4pO9RjnpbnSwTllvJNM+B5mb8FMQMwUFLrsyNe/0e1A+2
	vDv+kywG35AuhNozt5g2fhsz6gcHqf2ntk84/EjuFRVzNMFF/o3ciAcDo7/Lpix+
	Bw==
Received: (qmail 574999 invoked from network); 12 Jun 2024 00:12:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2024 00:12:59 +0200
X-UD-Smtp-Session: l3s3148p1@bqWOkaQaeIxehhrL
Date: Wed, 12 Jun 2024 00:12:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/7] Add Mule I2C multiplexer support
Message-ID: <ijj3xp5oacsyhygobi4nynerd6dxgfjxh5uzj6quvzraqrkf7x@eejujooa6odi>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Farouk Bouabid <farouk.bouabid@cherry.de>, Peter Rosin <peda@axentia.se>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
References: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bkvmb62faawxzci5"
Content-Disposition: inline
In-Reply-To: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>


--bkvmb62faawxzci5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Farouk,

first of all, thanks for the patches and tackling this problem. I have
to say that I have many concerns on high-level, though. I hope to be
able to give helpful recommendations.

> Mule is an mcu that emulates a set of I2C devices which are reachable
> through an I2C-mux.

I am not 100% convinced this is really a mux. Another possible DT
representation could be (pseudo-code):

	i2c-bus {
		mpu@42 {
			comptible = "mule";
			reg = <0x42>;

			subdev@0 {
				compatible = "subdev"
				reg = <0x00>;
			}

			subdev@1 {

			...

		}

	}

Dunno if MFD can handle that. Maybe someone else knows?

If all fails, I think you could write an I2C mux-driver which uses the
above DT snippet. It should then do:

- write the mule config register according to 'reg' of the subdev
- replace 'addr' in all 'i2c_msgs' to the addr of the parent mule device
- i2ctransfer
- restore 'addr' in all 'i2c_msgs' to the original addr

A little simiar of what i2c-atr.c does, check
Documentation/i2c/i2c-address-translators.rst

> The emulated devices share a single I2C address with the mux itself
> where the requested register is what determines which logic is executed
> (muxing logic or device logic):

This design is... unfortunate, if you ask me. But well, things happen.

> The current I2C-mux implementation does not allow the mux to use the
> I2C address of a child device. As a workaround, A new I2C-adapter quirk is
> introduced to skip the check for conflict between a child device and the
> mux core I2C address when adding the child device.

Not acceptable, sorry. The adapter itself is fine, so this is clearly
not an adapter quirk. The client is what is quirky. I don't want to
maintain patch 1 because of this one "creative" design of a client. I
think we can handle it outside of the I2C core.

So far understandable?

Happy hacking,

   Wolfram

--bkvmb62faawxzci5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZoy+cACgkQFA3kzBSg
Kba3axAAgZhZa5f9hUe4bSz0GKDi69RP0Z8Vz038So0ej0oN/S6UtQikhS+zh1Gb
ZJqvCEfw2Gzm6dK8QgpLNg8FsUCpiT1m2ZIQItoKUELSzGaL1R3svGj1cZuR268D
Zr6gdsbFDjZwg+Fa8roHfCB6+dyIyYuvcHPgckpFtNB24knAN7l13wlW+1Z32/xP
1OEOpThyD+Wq4R6gvJ3Yg0ZnJIJEu+qH+9Pm2ItalPsHgoZNtVTEKkCyLbki2dzZ
5j+d3sl7avBP6mEeOFSCO+cJtf+D6Z8VPx/SlA7A+iSCJugU4t03u/OJyyDDvmhj
bynHKAh6CHdzVlNdFvEjP4Hk5wPpqqcvzGDgNt+4zjq1zSf19hlaSS0fVfgT8QsN
IjRMH/5nsHEadFlOwTkSKIbG5RTM3WFbAdtnWrh6UgYVZyDAClm4AsC1esxgNOOm
kWCJV8yrc82BFovMQs0fTwZT2fMaLZoQNGGtySg9wtz+SyQfXTAkM59W2QuXzxpb
S4OUDgdv1lOuW9PG2tG0rdLlwkG0qTYKzwDrdcKoSMNjbWJcRC++/c9++juwPJv0
fM9oS0/wZjRGiDZkXMbKhdaQ5EoJOZGJxsZylgeHt8G77Rqy06nAkVqZBXRb1CP0
VWeWBqaEGvpliLkVTp7Psfd6G0TaMza0/geIiOxw/puIBHVMbfU=
=guh5
-----END PGP SIGNATURE-----

--bkvmb62faawxzci5--

