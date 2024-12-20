Return-Path: <linux-i2c+bounces-8677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DAB9F9BE9
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 22:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47BAD7A37C2
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 21:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD9F223E7D;
	Fri, 20 Dec 2024 21:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PNLwIPew"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A211A8416
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 21:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734730025; cv=none; b=cIryzJnMgIBT2AlQPBzHdTQes9Hf5YF2EZ568F79W8QtyOGKyiakREKAllAYObs1tko40iZRIMsjFIBiIJzW4nVVyRCnsfuiJWJUPvm+twB4LYEsOCgH9OYMKYQ95MA0Tf1cCrU27jRkbpd4exCiutq0/OLLnaPt91msD8kwWts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734730025; c=relaxed/simple;
	bh=CCNy+hniWVmaXLXRQqtQF0G7X8dU/g6XbWILbf1E3zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iV+u5G6tMUXuP0Zl4PC4by12N2xulT/RMcjgL1SWu0bj2YwLmO+EmhWLp7rQE89pUW/enH1sRfJEn36JU6qxunBlZuXwcHSfqPwm/GsUvRt2NGL1JiOLRN93jC5ynoNGpbZErNIFELO7cG36It67xMwjBH/HFSotUTTuTAwnvSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PNLwIPew; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8+bu
	S1MGD2xLeKgctLEGSMqm84AAAceyYer8eWjclfY=; b=PNLwIPewNuC8B7YcxTc6
	/x3TJCypkCm9q+s3j8ypWMn90fJ9+Gwf3uv/SereEklQySCp+xGI8rgWS05CApLG
	X42YYsq/FfoM9U1PJgC2PwhAAByv/vpI8ApKK58+sVFA3qxroV7BsfoX29fbRIUD
	X+jbltLb0JhhMC+FPSLUux8c4Tdr/JSnJSDPn5gXoCiuLeL/GqNIsaSEbalYuKy3
	eK3ueiuKfJadljngfZG17/hLWKK2n+BSr6jNtGusxhoqms8YVcdIHRPPsqyP3Dp1
	4u9MqIGZGb0ajsurnda/09f3ZFCf6GWLQhovRZSS/kAKz+8ZkjmznvsIa2PlVH1X
	Ng==
Received: (qmail 1128455 invoked from network); 20 Dec 2024 22:27:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 22:27:00 +0100
X-UD-Smtp-Session: l3s3148p1@fFeqTropzIMujnsY
Date: Fri, 20 Dec 2024 22:26:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 8/9] i2c: riic: Add `riic_bus_barrier()` to check bus
 availability
Message-ID: <Z2XhI4L9nzUqa22Z@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XFSjHshmGUBPQSlS"
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-9-prabhakar.mahadev-lad.rj@bp.renesas.com>


--XFSjHshmGUBPQSlS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 12:16:17AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Introduce a new `riic_bus_barrier()` function to verify bus availability
> before initiating an I2C transfer. This function enhances the bus
> arbitration check by ensuring that the SDA and SCL lines are not held low,
> in addition to checking the BBSY flag using `readb_poll_timeout()`.
>=20
> Previously, only the BBSY flag was checked to determine bus availability.
> However, it is possible for the SDA line to remain low even when BBSY =3D=
 0.
> This new implementation performs an additional check on the SDA and SCL
> lines to avoid potential bus contention issues.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

=2E..

> -	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
> -		riic->err =3D -EBUSY;
> +	riic->err =3D riic_bus_barrier(riic);
> +	if (riic->err)
>  		goto out;
> -	}
> =20
>  	reinit_completion(&riic->msg_done);
>  	riic->err =3D 0;

This initialization can go now. err is 0 already.

With that fixed:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--XFSjHshmGUBPQSlS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdl4SMACgkQFA3kzBSg
KbYxuRAAle25Vm+k9AgRhmMNfqUwpVYkXyUu5EfY4/oRC0xuswGjyls/QR3QxnLR
GGix7D5uPz11OLp2B/h9sYNJ5dqS97IHSQKhbfbQSnZSNvy5pGcq+LCV52MaBzJQ
DPjtqPwLjxKQH5YRGumiY0VTaliO2gCiIgXbI/W3CxL+ceveyfbDcrMp0AGnZf5C
7p5frx1/gosqxgfK8t4x/XrVtsi3CXuIS7XSZukx2weeMZ5aaYayKgjB+sa+cGyE
UM69BNWA8rOeSDzM6xYj+9xIb2wzfaXoAxQeNQ6Rnf+i89xzO5t8CEp6SAwJ6vy2
YKNwDzlbHdHmF2lnMGi1/TRyErKQFYZosESeHwTjIpCBAJ7JA8+kMu5XMFetpsfc
WeWaHQz9EIJJ296n1cSSAJUGFeFHacoWyJSyTypH8vVtXElt4ScdNYWgAYhcSoiM
LMgWGrM8+IXQw7ZyGL2680l149egbJjmaceh30tKOxtaRoDte2YhFY08vWHDvpki
vvby0k5F0T9MXrGIV6fKe9UWFOWRYneI1Wmjvm8C50i8rqO7XATPuG9mab63iu4z
szpIUTjcjn5/CRmuitq1DOP7gC8cfkkExoNdXo+3qVAH35rrhDJ94/63j/3ydzyD
IleJDlZIpq74uigduXuS0htXvjeUCO/bv6+f7+dUDOiOT5s3x1A=
=pL8t
-----END PGP SIGNATURE-----

--XFSjHshmGUBPQSlS--

