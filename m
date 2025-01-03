Return-Path: <linux-i2c+bounces-8894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B7A00950
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 13:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0683D163C1E
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9338B14D2A0;
	Fri,  3 Jan 2025 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SVOOtRDr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1E213AD0
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907748; cv=none; b=gLofeRivg/501v7hbkCYvzDRvrHnfFOGr62hRwTjnQbOdKiSgdsQdPn/aKthsd4z+damcYBFVfCiComeTxIYNY/D6SdktTkOWcNA2u/MFgQIZrDpRlper9ou4kCIy/KsrNQuPOQZ4Nvq/xhJA4vUQTo/nSlzDVNrfhx9YGX6uBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907748; c=relaxed/simple;
	bh=BzI7y/InETv2yQisv1JE52ZAlErFx/QUGUeCBeLwtbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lvo8vCEP6ovFf1q5vKHNy531/PhuH5H6NgM8huQO9E3wPuQ+5OHFSKdqCX/3F4GabJ+yYCfBQK9Fwe2hhqXXKm3XVF5Ajw9TscAhKW159QjeWiF7z4+Bpb/GBYhb8T7cSDv812vxnGdknt7TASRchj78BH6E3Qo0sOm+7Nt1N8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SVOOtRDr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=raNC
	LCMkF9AC0ujz73+z79XXwlusvArtUEynOk2JMMk=; b=SVOOtRDrOG6jAS2kIjmt
	QoPY2XevtnfixRyo5is5WajkwZypeXSppM9VtCMNiP+ExjxeUAoOdQxVD1oZsyqj
	eoRiuttVuFul46VARvQGKmUzxdeIZsuPVgqPE7KbDVsXiC8yrplY+jJIXg41Sjz/
	RFKhV+NjEz+n5GAS3xm9Oh7kShIRellB6Ejyvospqv6RctGo7Cq+++MWFZw3G+fj
	dDzWP5H9Hf4HPK79hn5akTfvauj1W+stRV+aMOgqpHx6ffqZTehiCTxudIhWVkyr
	2vax0acombPFZJk3jUVFEqmTjmM+CO2nqCEC1IOODYFojirxbQJ2My+nhW8jA9hP
	jw==
Received: (qmail 900939 invoked from network); 3 Jan 2025 13:35:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2025 13:35:44 +0100
X-UD-Smtp-Session: l3s3148p1@zWsxhMwqIsQgAwDPXw20AOMQ2KO98fSH
Date: Fri, 3 Jan 2025 13:35:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 3/4] i2c: Replace list-based mechanism for handling
 userspace-created clients
Message-ID: <Z3fZm_LkzQG1eP7b@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
 <122c72c5-3bae-4c60-ad53-d8b4061db30d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fvS+GmTEoRNwp1NG"
Content-Disposition: inline
In-Reply-To: <122c72c5-3bae-4c60-ad53-d8b4061db30d@gmail.com>


--fvS+GmTEoRNwp1NG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2024 at 11:11:39PM +0100, Heiner Kallweit wrote:
> Similar to the list of auto-detected clients, we can also replace the
> list of userspace-created clients with flagging such client devices.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks! Some edits:

> +	mutex_lock (&core_lock);

Superfluous space before parens. Fixed it and the other two occasions.

> +	child_dev =3D device_find_child(&adap->dev, &addr, __i2c_find_user_addr=
);
> +	if (!child_dev) {
> +		mutex_unlock (&core_lock);
> +		dev_err(dev, "Can't find userspace-created device at %#x\n", addr);
> +		return -ENOENT;
>  	}
> -	mutex_unlock(&adap->userspace_clients_lock);
> +	client =3D i2c_verify_client(child_dev);
> +	i2c_unregister_device(client);
> +	put_device(child_dev);
> +	mutex_unlock (&core_lock);

With locks, I really prefer to have a single exit point. Reordered the
code to:

	if (child_dev) {
		unreg
		put
	} else {
		dev_err
		count =3D -ENOENT
	}

and got rid of the 'client' variable while here which was only used
once.

> +#define I2C_CLIENT_USER		0x200	/* for board_info; userspace-created */

Like in the previous patch, I fixed the flag desc a little.

You might want to check my for-mergewindow branch to double check my
edits.


--fvS+GmTEoRNwp1NG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd32ZsACgkQFA3kzBSg
KbaPvQ/7Bd5Q/iSTA0He/rMNFmgiiPkxZjWwCCrH6GsGxSI3XnRoU5ie/XmNP4sX
H2xsN4iefZOW9yurWoTee2zGU3tNBTag+gxxISuTkVG6CYU4X1ai4065iF0sBRHY
dtxWmUZW55uRCdV3D4u4ad+S5AjXWR9l60QgQrm1D6LrjhQnkdksUdAMkQfR6yeM
qzo/viZtHf3zLk2sUQm/DN9mAi6QBXk/pgTEpcM85AWc5B2aS4oZ0PobUOfglaq3
m5PH/WNd5GlvdjROh3PFVMEnor5Xl+dnRZPDCCCOF3lYXuW9PtnsYCKXv2gGVvQq
wn6e9abtMPVFL1UeimtzoVUUfR2ObkNe0g1NfSZMHhnI8qSLs0Fi+W6JUq++RcQB
2NDaGJaHyTjuFxq56o86jbDfYexq4RbErHC30F9sap0aMoSatKP73Tf4YmYrG9Y1
U+aeKqpIB09RDt5a6lIIVUKpFD+jIqeM6fAeT+iFjsSTIqPV8797DjUtqyyM4knG
KCs9WpuUxCkxqZEQM8jHLjot3CVy4Y1KJc3lGHR/wc+JhLnO49zD8aARFShm8jbM
cD7lNWOXzlFIYEZcLPoyYtOAcK/UIQyRuJE5ci1xPY8IAQByEXYHiWHLN4qm42nM
KXhtfWE/rIanjSfsplILv1Z5wzLTAls9DZfJEhLrgJmQ9dql6d8=
=EeAd
-----END PGP SIGNATURE-----

--fvS+GmTEoRNwp1NG--

