Return-Path: <linux-i2c+bounces-7147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E0698BD01
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 15:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 753211C23507
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF8D1E529;
	Tue,  1 Oct 2024 13:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iy7PxeSd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3EF637;
	Tue,  1 Oct 2024 13:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787744; cv=none; b=cjdAUzyvyR/lryKBAffwmSq8VfBXBeaWhneDTgbqTHQqgAuL0wVBuXjzYvw3nv5pzEBFhANB95OeK8YGffId8BOQy59hr2PsNHLmW3TiHBgNcX4oi+rh1MDEovXqXDr0F3FxwuXL/J3TOg5127Fve1WfP5mwuye9oM2ftS8y0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787744; c=relaxed/simple;
	bh=FDEYOUMz0b1sSCN0xc23akav2PoKwzLJxdk7hwEzxU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtnufzZZGAlJM8gXDRqWFJuTdROn7HNRRJg5mWuV7TAE5hfX77Blt6DgMFs0vlZFeiH/ddBEsrXcMrsTC4YmYz+LFiICaSseHtoLSlLg2lITW8NsZ/oY6rYWEGocgTkWrP69xGY57qnkUw6G5DBD1RYVnKW3id8PFwB25U8Kc60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iy7PxeSd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11976C4CEC6;
	Tue,  1 Oct 2024 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787743;
	bh=FDEYOUMz0b1sSCN0xc23akav2PoKwzLJxdk7hwEzxU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iy7PxeSdnMHlKHoI9tHuh58pt95nktXjk01kOfYQ7xcNBMLeRoZHoD332cpbz/oQ+
	 Y03uWsisMVZRFmV0H+6bqNeFwBlMzZNYWYyz4Tawv+BQ7DEzTCUeCtQb+IarAnQ4to
	 yDLM1ogWva9s/OxrXeZkAJyow5CoxV6c8JMx3VFoyRp9Jz9z4argFRfAx6Ak3FGN9x
	 bnlGP61n/nMSMYRttZkxX1ImURAWZYBoTr01CATwRKX1TCbkl3UVfnRxrhouJXu+re
	 iAyMoeyGniuud0rpapvN3WqrFaNHWFWCYMkjeWXTa7ZGKEoyUS3EOGTAzhmbfLDoxU
	 7Y7XwaZsTphOQ==
Date: Tue, 1 Oct 2024 14:02:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <20241001-boring-livestock-0158ccc3fa88@spud>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
 <jzkzcnd5rdprxpw734ppcr5ti23qkppfxs55nse36wcqxff7e3@4ea2lyl7feoo>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ofQ4KTZDQjzQ4Z5h"
Content-Disposition: inline
In-Reply-To: <jzkzcnd5rdprxpw734ppcr5ti23qkppfxs55nse36wcqxff7e3@4ea2lyl7feoo>


--ofQ4KTZDQjzQ4Z5h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 02:45:20PM +0200, Andi Shyti wrote:
> Hi Conor,
>=20
> On Mon, Sep 30, 2024 at 02:38:27PM GMT, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > At present, where repeated sends are intended to be used, the
> > i2c-microchip-core driver sends a stop followed by a start. Lots of i2c
> > devices must not malfunction in the face of this behaviour, because the
> > driver has operated like this for years! Try to keep track of whether or
> > not a repeated send is required, and suppress sending a stop in these
> > cases.
> >=20
> > Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controlle=
rs")
>=20
> I don't think the Fixes tag is needed here if everything worked
> until now, unless you got some other device that requires this
> change and you need to explain it.

I think the fixes tag is accurate, because it only happened to work on
the limited set of devices I and others tried. This patch came about cos
I got reports of it being broken in 6.6

> If this is more an improvement (because it has worked), then we
> shouldn't add the Fixes tag.
>=20
> In any case, when patches are going to stable, we need to Cc
> stable too.
>=20
> Cc: <stable@vger.kernel.org> # v6.0+
>=20
> (This is specified in the
> Documentation/process/stable-kernel-rules.rst and I'm starting to
> enforce it here).

Yah, some maintainers want to add the tags themselves, so got into a
(bad?) habit of leaving them out. I can add it if there's a v2.

>=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> ...
>=20
> > +	/*
> > +	 * If there's been an error, the isr needs to return control
> > +	 * to the "main" part of the driver, so as not to keep sending
> > +	 * messages once it completes and clears the SI bit.
> > +	 */
> > +	if (idev->msg_err) {
> > +		complete(&idev->msg_complete);
> > +		return;
> > +	}
> > +
> > +	this_msg =3D (idev->msg_queue)++;
>=20
> do we need parenthesis here?

I suppose not, do you want a v2 if that's the only change?

>=20
> ...
>=20
> > +	/*
> > +	 * The isr controls the flow of a transfer, this info needs to be sav=
ed
> > +	 * to a location that it can access the queue information from.
> > +	 */
> > +	idev->restart_needed =3D false;
> > +	idev->msg_queue =3D msgs;
> > +	idev->total_num =3D num;
> > +	idev->current_num =3D 0;
> > +
> > +	/*
> > +	 * But the first entry to the isr is triggered by the start in this
> > +	 * function, so the first message needs to be "dequeued".
> > +	 */
> > +	idev->addr =3D i2c_8bit_addr_from_msg(this_msg);
> > +	idev->msg_len =3D this_msg->len;
> > +	idev->buf =3D this_msg->buf;
> > +	idev->msg_err =3D 0;
> > +
> > +	if (idev->total_num > 1) {
> > +		struct i2c_msg *next_msg =3D msgs + 1;
> > +
> > +		idev->restart_needed =3D next_msg->flags & I2C_M_RD;
> > +	}
> > +
> > +	idev->current_num++;
> > +	idev->msg_queue++;
>=20
> Can we initialize only once? This part is just adding extra code.

I don't agree that it is extra code, I think it is clearer like this as
I intentionally wrote it this way.

> The rest looks good. I just need to know if Wolfram has some more
> observations here.
>=20
> Thanks,
> Andi

--ofQ4KTZDQjzQ4Z5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvvy2gAKCRB4tDGHoIJi
0owyAPwNPsSNLQz2fsZ0hPQ9cGl/6RpVQ71r0aGY6J/e82FtCgEA4mWug7Gd7DiL
vFdzZiuzu//XelR28bmApIY34+l14AQ=
=Z9Uz
-----END PGP SIGNATURE-----

--ofQ4KTZDQjzQ4Z5h--

