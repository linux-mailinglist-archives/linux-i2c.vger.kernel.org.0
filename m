Return-Path: <linux-i2c+bounces-15134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D778D1AA87
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 18:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A7B83040675
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E591FC110;
	Tue, 13 Jan 2026 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A2v3iXHY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9DF1CD1E4
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325639; cv=none; b=pidPo4tdMNBaMr2CcSl8TDLpep95x22ntI9YkGkXqLWZkgsQum2SQjnHH7Wbmp+vf/ODdmeazQ07xrqTxofdc9hBJO8GdOxhRgKLvjnc6l6XTM9EwVdaZYhcfLmNrZPONbdI1/vh7F94zMRuHANekY++rAntpzNvSoGa/2IkHz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325639; c=relaxed/simple;
	bh=itog7rfE+xYuQ+DGGyONEXlMwYSMHDgitJMrQKO7WK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIyinRP+H3kseY2jxpFzYZgRzaZdJ/oGAQWZPVwuBM8x1Frhqq3SKFn7fPinEKB1/LO0Db8gczR2i8TgaaSfcAb3Ljy+7bdIalpNnh6GjabuivnqAZJCxDWJ0YLGfHZUIUgy0tQ7uCt8zFzO/r0ltNtIk+gsOwpTZVpcx3h1UdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A2v3iXHY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=C31k
	5mfV/+AhzCYUR3aMwCtsw5Asr5DjnS0TRViH4Ew=; b=A2v3iXHYudzXDA4W5zS5
	EGn0l8cQrVC0V+BL2Gk622Mgr5OCBp/fnbqyiy9StzcHaSaeX6v7y5SpYfnfkf28
	C/UZ97wq43ZnX4lI3TYhHlsA1inmnEO1V4Ai+t+9FPX/XoeGGR3ZCTOq/Yu2MLkz
	UQMCeO93xVwnV1QbkXvm2QkC+Y6MCGla3XrbLQxj5R//5LI8pBGqQZUK8RrEB9V4
	e2xRFmcEyqDN1V/fa4skgyZfoxkrKZ9FsHIGFN1dNDPgvxJdfXJXS0yAsWiqplid
	AychUhCBwpMv9rPkj8CdeCJimbPg8zdZ9IFpS7zjv+jFWhUqpdttOz4OJpR/NhyS
	5A==
Received: (qmail 1796980 invoked from network); 13 Jan 2026 18:33:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 18:33:54 +0100
X-UD-Smtp-Session: l3s3148p1@WdJHZUhIuKUujnvx
Date: Tue, 13 Jan 2026 18:33:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH i2c-tools v2 2/2] i2ctransfer: Add optional message
 modifier flags
Message-ID: <aWaCAV4preoIPcih@ninjato>
References: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
 <20251223-msg-flags-v2-2-8d934a4366e2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="njrTRyWovOXwNDYm"
Content-Disposition: inline
In-Reply-To: <20251223-msg-flags-v2-2-8d934a4366e2@bootlin.com>


--njrTRyWovOXwNDYm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> --- a/tools/i2ctransfer.8
> +++ b/tools/i2ctransfer.8
> @@ -96,8 +96,11 @@ The number of blocks is limited by the Linux Kernel an=
d defined by I2C_RDWR_IOCT
>  .I desc
>  blocks are composed like this:
> =20
> -.I {r|w}<length_of_message>[@address]
> +.I [inpst]{r|w}<length_of_message>[@address]
> =20
> +.TP
> +.B [inpst]
> +specifies optional MESSAGE MODIFIER FLAGS. See the section below for det=
ails.

The documentation needs just a slight update like "if supported". It
depends not only on the Linux version but the controller driver anyhow.

> +++ b/tools/i2ctransfer.c
> @@ -52,9 +52,16 @@ static void help(void)
>  		"           -V version info\n"
>  		"           -y yes to all confirmations\n"
>  		"  I2CBUS is an integer or an I2C bus name\n"
> -		"  DESC describes the transfer in the form: {r|w}LENGTH[@address]\n"
> -		"    1) read/write-flag 2) LENGTH (range 0-65535, or '?')\n"
> -		"    3) I2C address (use last one if omitted)\n"
> +		"  DESC describes the transfer in the form: [inpst]{r|w}LENGTH[@addres=
s]\n"
> +		"    1) optional message modifier flags\n"
> +		"       i: ignore NACK from client\n"
> +		"       n: no master ACK/NACK bit in a read message\n"
> +		"       p: emit a STOP after the message\n"
> +		"       s: skip repeated start\n"
> +		"       t: toggle read/write bit\n"
> +		"    2) mandatory read/write flag\n"
> +		"    3) LENGTH (range 0-65535, or '?')\n"
> +		"    4) I2C address (use last one if omitted)\n"

Same here. I think the help text can be static by saying "if supported"

>  		"  DATA are LENGTH bytes for a write message. They can be shortened by=
 a suffix:\n"
>  		"    =3D (keep value constant until LENGTH)\n"
>  		"    + (increase value by 1 until LENGTH)\n"
> @@ -202,12 +209,21 @@ int main(int argc, char *argv[])
>  		case PARSE_GET_DESC:
>  			flags =3D 0;
> =20
> -			switch (*arg_ptr++) {
> -			case 'r': flags |=3D I2C_M_RD; break;
> -			case 'w': break;
> -			default:
> -				fprintf(stderr, "Error: Invalid direction\n");
> -				goto err_out_with_arg;
> +			for (int done =3D 0; !done; ) {
> +				switch (*arg_ptr++) {
> +				/* optional flags */
> +				case 'i': flags |=3D I2C_M_IGNORE_NAK; break;
> +				case 'n': flags |=3D I2C_M_NO_RD_ACK; break;
> +				case 'p': flags |=3D I2C_M_STOP; break;
> +				case 's': flags |=3D I2C_M_NOSTART; break;
> +				case 't': flags |=3D I2C_M_REV_DIR_ADDR; break;

Brainstorming here: maybe a macro could help:

	case 'i': add_flag_if_supported(flags, I2C_M_IGNORE_NAK);

?

Thanks and happy hacking,

   Wolfram


--njrTRyWovOXwNDYm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmggEACgkQFA3kzBSg
KbZkLA//X0YmYIoDDG32UmnehPyZNosgRZkMH/dlXRUtNQWsxMqbkyD6tgq60+H5
YpR/9qNvkXF0bzVteMKe+V1WyMswBUEOgScSYUjR7Ee0LrH6cbNx53Tax64E+Wss
Hbo64wGozso1HaJ4YlGoYHFqeDzggviaGaZmG8F8ZC/5PciK9QiXDRMrGWUmFFEl
+ZMpDpN/Y1PkYpa/CGEfINQneNpbrke8AZx4ULp5C1agSmZoKcuNe1vaw0C6Wj7U
Au64sRumuD8DohQHZsVYOow3zy+6VTkF+ul5x8NXWZaMIBkUhjXQJK5r0ZnDE3ot
yzvUt5Tl8UxoHeYYm2co2i0Km2DnSJcdpubNjusaaoxrXL7c5mqCMRsG5I4P106Q
MsuNu+mi2V5MRmPSdJAmSbmMBmWEpWeWz1IxPZMhGO3CAkPenF27GXo5VilVBo8A
BlrdsU5kwnYd3w863e5XDf+SF8S92PUvfRMpQ4L/yWBEQgAgXl78VubfeG6Gc3t5
HcOpxUIDitpfPYnDTctnPXRzj5vhHV3aALIfUZzpxj9fLXde49D9G7obzVQVIrWA
MrQDsIpkkTS1p5GohZ7k9bI8kZHX/LhyuTFO0gt5uaZ4W08lI5v/gBXzgnTRvl0a
AranULraq0uTES1RcYmAS7+J8FbHitIrAWQf7jnGlIvrBMq+3Wk=
=6P40
-----END PGP SIGNATURE-----

--njrTRyWovOXwNDYm--

