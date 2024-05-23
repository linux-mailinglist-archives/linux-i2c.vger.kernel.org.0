Return-Path: <linux-i2c+bounces-3658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586D8CDAED
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF1681F21B18
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 19:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5081E84A3F;
	Thu, 23 May 2024 19:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJ8wCSnQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF07C84A27;
	Thu, 23 May 2024 19:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716492825; cv=none; b=gmH8VHrbq7SI1i2QXFqpuovVfDu9JB5UdoasfmAQUDVAc26tjZ7bsWvVqWiGIsEv0ZQ7rhu8HEdnny0C4sPAFXzDeIerdsrTp7GFEj4jepxXlEzWScNJw2yZ6o+/Jms5PG97rWYrAK0mXHS15gOrAUL71oPfMZW94wt0l+sOWXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716492825; c=relaxed/simple;
	bh=b6J+elZwD4xE9hgMeYlYy/kGwaXhneuYcL/jeP1V5OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpD+q5tTz/FNSp6y2RWV1nAzHa5yCbxYtyHcUK7odHtku0F8bjuvsGh0AzHUZVxmpv9+zUdw+QUkhnSp+pUW0w3vdp+fODyJckkLpuCy8yKgyTnttbRz9jOx1LuhjCarhosjYrj5Yyo3dikzm0H4wthbUzsy7hKoFs51Lk2qBBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJ8wCSnQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03DAC2BD10;
	Thu, 23 May 2024 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716492824;
	bh=b6J+elZwD4xE9hgMeYlYy/kGwaXhneuYcL/jeP1V5OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJ8wCSnQCyP1Y5lWQZxFLADe/4lC2KWx8fUn4klan9iPI4CjeDFl3zBOLWUkaOui5
	 1CthTA4Z8+w5hkKWS1AlPAwtAHXDUqVhd48lanEkG1XezDHlVMjg+lG3YlqT6dNUfz
	 U5jAKnlNbq4O7HZ37jrR8WDbhBZfNUqnIeJwqmWu5bS2EjhWKicjLqkF7pSNomGPZH
	 W190I2rDbrBz912EgZbHmBcXoAuriOkxfQT5elzB6/BMshF0MPk3P2fY0rcW/WijSV
	 5iuvns3sK6jG4XIge95T/1BFNszGsGJds3vmf1fsZthDvnYttaf5bJbctitYFBa7bh
	 +MdfyQSLz25Eg==
Date: Thu, 23 May 2024 20:33:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
Message-ID: <20240523-rinse-sturdily-7c78d8517884@spud>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
 <398bf753-6701-4925-b814-781a68a75cc5@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F3aOdyo1Rjmg6l29"
Content-Disposition: inline
In-Reply-To: <398bf753-6701-4925-b814-781a68a75cc5@web.de>


--F3aOdyo1Rjmg6l29
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Markus,

On Thu, May 23, 2024 at 09:30:55PM +0200, Markus Elfring wrote:
> >>> The Huygens is a Rainier with modifed FSI wiring.
> >> Will imperative wordings become helpful for a better commit message he=
re?
> >
> >
> > This statement is a description of hardware. I cannot word that imperat=
ively.
>=20
> Please take another look at corresponding improvement possibilities.
>=20
>=20
> > The commit message is imperative - "Add Huygens system".
>=20
> This information fits to the summary phrase.
>=20
> Would you like to mention in the changelog that a hardware description
> should be extended anyhow?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.9#n94

You are talking absolute crap here. Stop harassing contributors with
your inane comments.

Thanks,
Conor.

--F3aOdyo1Rjmg6l29
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk+aEgAKCRB4tDGHoIJi
0mb/AQDX7B+NkGBYPuEc6h8NwJ+uUcyqGhHnz75SmYF7f+e18wEA0SPKX+z6SMf8
FVfYwuJ8FPV4UOZultKHc8HwIWcuBws=
=nUOM
-----END PGP SIGNATURE-----

--F3aOdyo1Rjmg6l29--

