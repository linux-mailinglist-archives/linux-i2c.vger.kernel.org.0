Return-Path: <linux-i2c+bounces-3420-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2BA8BC83B
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 09:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8831F22E59
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 07:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93867D06E;
	Mon,  6 May 2024 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JhxBoYrH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64156BFD4
	for <linux-i2c@vger.kernel.org>; Mon,  6 May 2024 07:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714979937; cv=none; b=M+FCQXJFulTs9Y745L0xU7EW1OL4JxLY4dHeYv0rd3zEcMzO2ZWt1G7mbviG2xzCRoZMR+L6pxcJtetoeL2w9QTG5Pfb9k51RxXj+qgOO10F6p7/X8S1HIbhZnk0474FLZAocNjpdnyhmBv1l4SUtt59bX3CFQ7M4YyRrK+piHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714979937; c=relaxed/simple;
	bh=eVTyNWVG6FwlSAGpDj+R03GuC88vo4izmhgVKikfzxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbE4IzA/Xr+LLm+XlkzMXOkYKswQdOeVX8MQoubfoswqm7wsjlq/aM/EMsFWC8hG44pJ/t2H5LGuI9aPgX5TpAvZziQVzYmVhMfmMPg4m8K627GMx+hl6u/NFPaTHOC4g7Ex3BK9ooP0GH81TITcCVR5O8Gs0SK+uwM4lSR7Ii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JhxBoYrH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eVTy
	NWVG6FwlSAGpDj+R03GuC88vo4izmhgVKikfzxg=; b=JhxBoYrH9gMEZbzxsp3p
	uOi0mx5fgUJVrmGlhh4bYE80DgrQZAFKA+aX+G73mpvFGa6gH48PNyvJovCHVnr5
	64EENCZdBKiiv+bMNrZReHBgOMbGaRat/0P2FdphJqGYwbj40oF0SW/XTOxqxUNE
	lLYLB+1GEHdE8Mixc9PX7GaaithkDjTeo8PUYTAS7nGLbzu/FjZ2PR9p19wwdytq
	8AYyn21Vod8xziCgGXu+2fEXkD4t2Aw5PONomp/hrOGHbDqrzf1zZIXHesSbTq4W
	aMlW4PU0KO6toYv79/z8NkqHAqjBqVhlvVkF4BoaOkzh934zhGf68ivd2eZ4e0O5
	rQ==
Received: (qmail 94516 invoked from network); 6 May 2024 09:18:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2024 09:18:53 +0200
X-UD-Smtp-Session: l3s3148p1@Bni84cMXMK8gAwDPXzrfAO1ieDVkyUqz
Date: Mon, 6 May 2024 09:18:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Cc: mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4] i2c: acpi: Unbind mux adapters before delete
Message-ID: <5c5zz3e5mgi5jr5f7htmjutyj47s2rbo6skvysvsze7i6ffvhl@ntc4bcqxc2kb>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>, mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, stable@vger.kernel.org
References: <20240312221632.859695-1-hamish.martin@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ipd7aelxw36hwwg"
Content-Disposition: inline
In-Reply-To: <20240312221632.859695-1-hamish.martin@alliedtelesis.co.nz>


--7ipd7aelxw36hwwg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 11:16:32AM +1300, Hamish Martin wrote:
> There is an issue with ACPI overlay table removal specifically related
> to I2C multiplexers.
>=20
> Consider an ACPI SSDT Overlay that defines a PCA9548 I2C mux on an
> existing I2C bus. When this table is loaded we see the creation of a
> device for the overall PCA9548 chip and 8 further devices - one
> i2c_adapter each for the mux channels. These are all bound to their
> ACPI equivalents via an eventual invocation of acpi_bind_one().
>=20
> When we unload the SSDT overlay we run into the problem. The ACPI
> devices are deleted as normal via acpi_device_del_work_fn() and the
> acpi_device_del_list.
>=20
> However, the following warning and stack trace is output as the
> deletion does not go smoothly:

Applied to for-current, thanks!


--7ipd7aelxw36hwwg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmY4hF0ACgkQFA3kzBSg
Kbb/mw/9FNXF8tZoRwNdXo0HKar/d3gR8KmlsY07fJuP1nF6VfLSkuQe0TkQ8h/h
ZzQNh1irTczf65U/MrvWjjtlFofHW0jKP20+iN9Q2s6jkiMiuvztiIAi7sXHDY0a
aZw77Iic8sRIQpRl+iOCjZzofJvbUKfUQt40FBqCBZX4rUYCJC6wJT2zWDG1jXWa
e4smLJm4yw4p3fg3HfCtXvCSDSt1DuH2BzRCV2AQDOzW6VRI8JhxtJ3Y2uz/StXn
nlJ7KRLRZtf500gpdGRKEIDbjhttSW3feTSX2Q+7FxtkF8V6kn5L9z+ad1eu+Ab7
/5aVbSautddX04IuhpJyj1Jl2V7VIHvIfgTPKTbzJ8HjqpzSpZCyo7wQfMKomT3A
zp2qcJ9dEu+LsK0otFpgrhbxYF52fdHOy0nJh6RvvgC1Sw3DkZesLXw5Me63SdJH
mYBbjYHJ6mMrVhkvWrYK+n17o78vzG4ugHvQfa/2fc4da2YFfIl3R012sIS9UudB
mUahkB6PG1eH1hHk2kM9HyjJ1OOCP6+pHYs5xFowK2qOBPvhZC476mebIXCIa18C
AGTpA1ZO19F4uNB8Xrob5tbRLqUyIGqte1d5iQc9bkWuC9UDfpTTleDtNP/rRL/3
aOwugtHSbSAQ7ShbUSvJzvKZlBnqa42B4+TlTLAWLQunIX85G8Y=
=fih7
-----END PGP SIGNATURE-----

--7ipd7aelxw36hwwg--

