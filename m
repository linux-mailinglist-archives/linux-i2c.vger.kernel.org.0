Return-Path: <linux-i2c+bounces-2882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F118A090B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 09:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 441911F22109
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 07:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5472E13DDA4;
	Thu, 11 Apr 2024 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="caXPwV7T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E918913DBAA
	for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 07:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712818980; cv=none; b=IiuQ9sx0ye8U+gtSCPW1OBAR8M58t+4CDV/lSrQXjHzgZyVirHqtfHzinFqgIRPW8caoPExQA9jfziNWILcMw2Qzy7/bH1435QJyEA2shVDnEbG4WiPleT00V04ftGowwQBlwrUBo0V5XpwjebCJfJeCyzQ7tARQrENUr4QqFmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712818980; c=relaxed/simple;
	bh=/m7yJfiBA5JwLI2+JvRcIOEdntSz6SoOaQZ4uFjJJPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdlbTAsq1TtMvh5fthmRsdjGThf5NzEawR8O6cLMC43auUmJqmtHZaHaJgIvTjFXFLeaLn3wxIKVoSYVJyQG6OPiWvJY5dkyNXKqueRTAM0qIh660UV5oHe+HbTAmi9PFN1jhoxNr7r6RhG9nvq7cFOuSKQrhr1Nv4t/by3BQlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=caXPwV7T; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=C8b/
	Bg+woqCMDPMNpL8Kfw9g9Lnm4nCjCgCv9C3GI80=; b=caXPwV7TS9nlWfrBmAvx
	aJAj8YoCJcohDUE+sOOEtBsXPyzCLxsKgtyp7HVfZ7aA1yUW4rmfUZmDJebK/ugB
	rsakReOqmNryvUi28kVcSoscFCZHhGtZ1Rbp0K3Gf/U0BMiz51X6sVpX2sqsSSu4
	zgBiUZXvH6qPN+PKuy1gW9iK4q43IT3sYQ7rufPkpU9ZeZIRr3qpV9becMsiNKFY
	DhplKzCoDiyEnqmMa/yHJfKovfI/n1NtYIVgPwYVVeajRU+NjRRX3FWKDD48F/fw
	3/F8bpXpFXQEo9lP6T+iHUsRAqsf7mgMyzi495bqP9bB4ezbD5fP88bZzQG0SBtL
	Dg==
Received: (qmail 789951 invoked from network); 11 Apr 2024 09:02:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2024 09:02:53 +0200
X-UD-Smtp-Session: l3s3148p1@Vy11vswV5XhtKPOV
Date: Thu, 11 Apr 2024 09:02:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/18] i2c: i801: remove printout on handled timeouts
Message-ID: <zmkluzi3ncze67wei6eccd67cpuab2k7qw7cdgju4tg7rermv2@hw6ukejz4cvy>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	linux-kernel@vger.kernel.org
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-26-wsa+renesas@sang-engineering.com>
 <242ogjpole3ltk5nu53knbfsxmmwcqfrbcivjh7fnkngvrroq5@cwspwdrtepwh>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j6qt37qfsj4aexfx"
Content-Disposition: inline
In-Reply-To: <242ogjpole3ltk5nu53knbfsxmmwcqfrbcivjh7fnkngvrroq5@cwspwdrtepwh>


--j6qt37qfsj4aexfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 02:21:58PM +0200, Andi Shyti wrote:
> Hi Wolfram,
>=20
> On Wed, Apr 10, 2024 at 01:24:20PM +0200, Wolfram Sang wrote:
> > I2C and SMBus timeouts are not something the user needs to be informed
> > about on controller level. The client driver may know if that really is
> > a problem and give more detailed information to the user. The controller
> > should just pass this information upwards. Turn all timeout related
> > printouts to debug level.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >=20
> > Here, I did not delete the printout to support checking the termination
> > process. The other drivers in this series do not have this SMBus
> > specific termination step.
> >=20
> >  drivers/i2c/busses/i2c-i801.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i80=
1.c
> > index 4294c0c63cef..a42b5152f9bd 100644
> > --- a/drivers/i2c/busses/i2c-i801.c
> > +++ b/drivers/i2c/busses/i2c-i801.c
> > @@ -400,7 +400,7 @@ static int i801_check_post(struct i801_priv *priv, =
int status)
> >  	 * If the SMBus is still busy, we give up
> >  	 */
> >  	if (unlikely(status < 0)) {
> > -		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
> > +		dev_dbg(&priv->pci_dev->dev, "Transaction timeout\n");
>=20
> why after 5 patches of removing dev_err's, here you are changing
> them to dev_dbg?

The reasoning was explained above:

> > Here, I did not delete the printout to support checking the termination
> > process. The other drivers in this series do not have this SMBus
> > specific termination step.

This is also why I converted two calls here to dev_dbg. But read on
first.

> It's still good, but if we want to be strict, errors should
> print errors: as we are returning -ETIMEDOUT, then we are
> treating the case as an error and we should print error.

I strongly disagree. While we use an errno, we don't know if this is a
real error yet. It is more a return value saying that the transfer timed
out. The client driver knows. For some I2C clients this may be an error,
but for an EEPROM this might be an "oh, it might still be erasing a
page, let's try again after some defined delay".

Think of 'i2cdetect': If we printout something in the -ENXIO case (no
device responded to the address), the log file would have more than 100
entries on a typical I2C bus. Although we know that -ENXIO will be the
majority of cases and are fine with it.

> As you did before, I would just remove the printout here.

Maybe we could because there is still the "Terminating the current
operation" string as debug message making the code flow still clear.

> I will wait a bit for more comments and take patches 1 to 5 so
> that I can unburden you a little from them.

The patches have no dependencies. To keep mail traffic low, I suggest
you continue reviewing and I only resend the i801 patch?

Happy hacking,

   Wolfram


--j6qt37qfsj4aexfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYXixwACgkQFA3kzBSg
KbZNVhAAlFgAEIg426rC7dki0Z759Q8EEARoqJcP/hRA+zOl/JQJ7z9uN7iZ5kNB
aJBMkyZ89ULzpwgtNnQaumua6M/VtQFJuJmnk1157Ff1MRq/nEA29q6botELWFoi
Gu2q2/iZbGf4rNn7CKhCEaPXedKo9g3546S2Dj+xyfGZSTGTjCJ0nlTl+1HraBYy
+OobuaFyQu8TYspodNKiPEiIzfHEtaKOwuWHeUAg5pTJvosYKJhIJqipmG2i6yV4
lTqMdIuCFoTPTygtV/Pykl5raLeyIhsH+zOPitafqHkpgP6pD9RKXoVwni6MMbMH
jKTBWInAhHohyn9IjO9RiwjPs2pmnzfcWwXrjNnJjJtuohFeYZ0YZeYDYW7dlGnl
WZyG+p66Fl51jDwIGIk97UEiG5GagsYXlIzD/iU89AeVdCcLVed14MgcLcDKIElU
NUslAX2K2EtyydwVaJETGrIRN8OSFrCjQBm/VG4mEJkBB89AOM9T0ZkfANAfJpLO
MeA1Hp4+bNLrvfBNPtWTgpXa7bipUDVuUNyoIGO/BqdRl5wLT+wfsz+u6XWHkPLw
pqJWWcxwBxT/STxxuYkRBD65OPCV/zphq7HoEgf186ry1BFwVnFpohBSL09bu9Lc
gKZ+UF9IQl7MQI3Jl1FwtYs+JC1c4b7WaKfG8GwZsRdqY0K/dX0=
=1D6q
-----END PGP SIGNATURE-----

--j6qt37qfsj4aexfx--

