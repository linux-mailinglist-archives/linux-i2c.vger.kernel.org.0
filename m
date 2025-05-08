Return-Path: <linux-i2c+bounces-10895-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE006AAF8DC
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 13:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F5A44A7241
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 11:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E260221F17;
	Thu,  8 May 2025 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvfE9Iyc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BE9B665;
	Thu,  8 May 2025 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704381; cv=none; b=Wimxls82fzwd4Hf00aSofXGmR9q1onrjqj/VgR8K9+LHIxEIYWcoTqfPtcaXumcltvM+jgBgaZdysUDqY2vKImPbCrMg+IfMub+o1ed2/7/FguhaHT/3g9Ry2eD42sF5a9ASrthYQcbwrfcE7j67c7SZ0eBVyWUsej/YWe55ZNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704381; c=relaxed/simple;
	bh=6n86hy3rMqxNQ71b6i/pVdXx+OhqDBAI7c4kpIkAMqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwkpkUkB4DhPix9avDXdVIEEWQ4fcwENv5Du7fnyQb6qV2P17qyslLvRoCuBIZcMt2djhXqD1Zi/bWldhps9dV8G7hdgaQn/QfmWRZPskcLL9ga08sedfBlHT0xDtYtJPtOK7gWiQ5vAV7qiKcCLBiObNNdvhk6sX/kH55SbkWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvfE9Iyc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B1CC4CEE7;
	Thu,  8 May 2025 11:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746704379;
	bh=6n86hy3rMqxNQ71b6i/pVdXx+OhqDBAI7c4kpIkAMqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HvfE9Iyc7naKu96tX/O8Pbucv3qPoB0L+6iooJtv2SPEe+7/SrA8DYoCBRZrkVnpq
	 zuUbmYZxwCzqzh4W+nPL3NPzE0V0DPcBlgh6buVUAY1ty4QsNQtoO0yVn2UhF3K2aX
	 uO2aIY/xUm/m+KGeJFTGPGEMGhwPjdRjzg9hjOy323c8+BTyCL4MnetAzMEbukLJqv
	 lAnPu+oXfiJ1HkNvhStqVyJEnyDt7/ly3avI88EH2yQxnb9EnahfVVWsaFLgk+1mjS
	 XbHVlY6UpIZqS40umzUScL12xITq+OfYRi+mWUQneD095wjVBkv0wDBdTKLFuYKZK9
	 w3s9Pe6kcUgRQ==
Date: Thu, 8 May 2025 12:39:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-i2c@vger.kernel.org,
	prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-corei2c: add smbus support
Message-ID: <20250508-unrefined-outhouse-3ff09d1e46b5@spud>
References: <20250430-preview-dormitory-85191523283d@spud>
 <3421bf4a-afa1-4b4c-8421-bad7187d3d8e@quicinc.com>
 <7q4gdh3jcbnsptmdv6fywnwqta5nekof4wtut35apw5wphhkio@veeu4ogcm44h>
 <20250506-bunny-puma-996aafbf3f56@spud>
 <4xyehpobtsyj2k5xlhupq7x6z7es7bvzek4zsf4roramy5h7kn@duxhfxd4gxsq>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4nWIXehMR+Mogkoo"
Content-Disposition: inline
In-Reply-To: <4xyehpobtsyj2k5xlhupq7x6z7es7bvzek4zsf4roramy5h7kn@duxhfxd4gxsq>


--4nWIXehMR+Mogkoo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 02:04:55PM +0200, Andi Shyti wrote:
> Hi Conor,
>=20
> On Tue, May 06, 2025 at 11:56:19AM +0100, Conor Dooley wrote:
> > On Mon, May 05, 2025 at 10:04:27PM +0200, Andi Shyti wrote:
> > > On Wed, Apr 30, 2025 at 05:06:09PM +0530, Mukesh Kumar Savaliya wrote:
> > > > On 4/30/2025 4:53 PM, Conor Dooley wrote:
> > > > > From: prashanth kumar burujukindi <prashanthkumar.burujukindi@mic=
rochip.com>
>=20
> Do we want to keep lower case for names and surnames? Can I use
> upper cases?

I dunno, that's how it was provided, I'm a fan of self-determination in
that regard.

> > > > > In this driver the supported SMBUS commands are smbus_quick,
> > > > > smbus_byte, smbus_byte_data, smbus_word_data and smbus_block_data.
> > > > >=20
> > > > Write completely in imperative mood. something like :
> > > >=20
> > > > Add support for SMBUS commands in driver
> > > >=20
> > > > Add support for SMBUS commands: smbus_quick, smbus_byte, smbus_byte=
_data,
> > > > smbus_word_data, and smbus_block_data.
> > >=20
> > > yes, I agree that the original commit log is a bit lazy written :-)
> >=20
> > I don't personally think the suggested wording makes any meaningful
> > difference, but I can rework it if required.
>=20
> The point of using the imperative form is to clearly state what
> the patch does. Saying "the supported commands are..." feels a
> bit lazy, in my opinion, and requires a peek into the change to
> fully understand what the patch introduces.
>=20
> To be honest, I wouldn't reject the patch over this, but it
> doesn't hurt to expand the log a little.

Right, I wouldn't either. Sure, it could have been better and I
probably should have rewritten it when I sent it on - but I get more
than a bit pissed off and opt to push back when people who aren't
maintainers for some code come along with a review entirely about
cosmetic parts of a commit message.

> (No need to resend=E2=80=94you can just reply to this mail with your
> updated commit log.)

I was just about to do this, but noticed you picked the patch up
already. Sorry for the delay there, I meant to do it yesterday but
crashed out early. I'd just have changed it to
"Add hardware support for the SMBUS commands smbus_quick, smbus_byte,
smbus_byte_data, smbus_word_data and smbus_block_data, replacing the
fallback to software emulation"
or similar. If you fancy rebasing, maybe use that?

> > > > Also mention below limitations here .
> >=20
> > I actually removed them from the commit message, since they're not
> > limitations just what was and was not tested. I can put them back too
> > if that's needed.
> >=20
> > > > SMBUS block read is supported by the controller but has not been te=
sted due
> > > > to lack of hardware. However, SMBUS I2C block read has been tested.
> > >=20
> > > Smbus i2c block has not been tested? If so, can we leave it out?
> > > What is the interest to keep it in?
> >=20
> > What's the interest in adding any feature? Someone might want to use it.
>=20
> What's the point of adding a feature that no one uses? :-)

I wouldn't say no one, just neither Prashanth or I :-)

> > We did not have a piece of hardware that uses it, so didn't do testing
> > of that specific command, but a customer may well want to so we included
> > it. Again, if you think removing it is the play, I can do that.
>=20
> No worries, please leave it as it is if you think it will be
> useful in the future. I just wanted to clarify.

NW, thanks for picking it up.
Conor.

--4nWIXehMR+Mogkoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaByX9wAKCRB4tDGHoIJi
0gJWAP9yEef/0krNdwUaY/1gfJSyA4gQbl6hozXYXIA3WH0TQAEAwoRYhAoTgzvC
CUFWxxuvW79S3iBWkvhNZq85oJEHog8=
=IE6v
-----END PGP SIGNATURE-----

--4nWIXehMR+Mogkoo--

