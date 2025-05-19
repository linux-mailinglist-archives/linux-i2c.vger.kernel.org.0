Return-Path: <linux-i2c+bounces-11035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAAEABC27D
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 17:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E27D1889591
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 15:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CA42749C8;
	Mon, 19 May 2025 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FGJdiSzk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB411E32C3
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747668722; cv=none; b=BgUJGjabPp2UK1oseIxJXZ5QTprv0VAY4WCqSxpfDgx6AK64vfYYX49MixB2NwNcdqEvaWgawR/9lCLOIkEtEQ30dZRwp1Li5I26D+fC73AR3DBwYvoDMyF+2f/tG+TUWvAWEA+No2+3tJqYROvlWuYWuIiqQb0apSdoZekZgfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747668722; c=relaxed/simple;
	bh=cJ6eilFd621J2Gh9fzqWO7VTTT/sYbXs5b4citZcdzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVrdphKDWSXzzYlHk0KuJBwmJkP9GYty44HZWAdfYkiUmspjp5mEbEkdWVxNvdo+zusKjsPWRjG2TKMecGDGrcZUmzV1kxlHIdGY8Egs0k/VWYb1xzGhgoSMyRO1cz3jAfte7QEbi+BLMqgTI1u89vwsecY/x/+SzkfVqGJrARY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FGJdiSzk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cJ6e
	ilFd621J2Gh9fzqWO7VTTT/sYbXs5b4citZcdzk=; b=FGJdiSzkurAYl/GSDiBu
	q84IhiMj3P6HgWk/KWK79FE1RuUYm0lHX+diiJ4Fis2x22ohPnnx5aFsfWe35HvX
	PbVTdwnx8dsIY47P7I+YpnFS13zL6vuNDJeO7qNbaz8t16szQEzD1jC5qolA3+HY
	OIxQno1g3OhlQmP4h0Brm5Vm2UZZzPpUJrJyD9iyRc1mVW6MRAylCCcgTq0gEfU1
	7ISR+lUTGn2og+yPgwcE0pFqdu4Pk+EzTzsOiLAKzStns/wgrCDGnoLE/k9EE0gu
	N15M8c9R8UTmP7Dc+V8zYRHPz8x4plenqCI2b26WWF/TZ90XebMwTIEEZUW761qq
	3Q==
Received: (qmail 2542361 invoked from network); 19 May 2025 17:31:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 17:31:56 +0200
X-UD-Smtp-Session: l3s3148p1@kozQ1H414rFZz6uL
Date: Mon, 19 May 2025 17:31:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/3] i2ctransfer: Don't free memory which was never
 allocated
Message-ID: <aCtO6KrgOEeyA19C@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.de>,
	Linux I2C <linux-i2c@vger.kernel.org>
References: <20250513172119.09548573@endymion>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kqoDjhb/nRBhcr4g"
Content-Disposition: inline
In-Reply-To: <20250513172119.09548573@endymion>


--kqoDjhb/nRBhcr4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 05:21:19PM +0200, Jean Delvare wrote:
> If an error occurs while msgs[] is been prepared for the transfer,
> we jump to the clean-up path. How many buffers need to be freed
> depends on the state. If we were parsing data, we should free up to
> nmsgs. However, if we were parsing descriptors, we should free
> up to nmsgs - 1 only. The code was unconditionally freeing up to
> nmsgs, potentially freeing a non-allocated buffer.
>=20
> In most cases, it was not a problem, we would simply call free() on a
> NULL pointer and that's a no-op. However, if msgs[] was full then we
> would access memory beyond its end and call free() on a random
> pointer.
>=20
> Fixes: 9fc53a7fc669 ("i2c-tools: add new tool 'i2ctransfer'")
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied, thanks!


--kqoDjhb/nRBhcr4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrTugACgkQFA3kzBSg
Kbay+g//bpqZApdKFrlv6RvBJMO274pONsOew1EdO6/wuT1w+ugfusm00U9xr/I8
xkGrBce61sSH02i5D7zRqYiU0dNsoW7bqF0zH89CX6s0co9SA3AzemWcWqhA0J4+
U0VkkU8mxpAj2Xp/iNC3zNZBnI2JWzkS5RAp47u1ZrK67o889nshQ+aOsndHeTqn
vUsy41zs0RbWrm7ZXl7i3u048ZMvxvCvZ+1qyO6/F4PuNzILa0qZlJe2zHNHGdtx
OfA4HfQrIahabP4tDarPeow0Xrc7pSasSxBUj5R4hoBi7wYbOFDuvpiYl1i0wOyM
UXVBzmO/qQzjIZW6EDKI2RY6IeJzxkdVmQ9gXGdo2mndr9x6IjEmGkHkYatvvqKm
C8O+nc1q6rQXcZjtOw4/t6wSR8CTi3FXhgB6mnZOZnRrW8rosRvPo3RpOpU6DDKM
IR9UL4s7TnzbrL5JJHJ1eZFXPKtBAuywsWuZnL5Q1A9EkOPWcwelKBoEbVH5FXaU
qd3sdW+1ZSDVQdqin8qI8qSTWcyO946hd7Idk4LQTGDMUJDda7Ai7RFGRum07+Gl
dHDKngTSvotC3hywq8OWjCiIjQ4/K5HuTSdHgFcE4DGmbkdClA9mTPBj1rG+34H7
KsTx95G6HEeovcUvmo0KnX7bIVzCQ4Ezm1CLr81cG1NFy8Dc2s4=
=gTer
-----END PGP SIGNATURE-----

--kqoDjhb/nRBhcr4g--

