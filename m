Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F992D683E
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 21:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390172AbgLJULc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Dec 2020 15:11:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:37966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404506AbgLJUL2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Dec 2020 15:11:28 -0500
Date:   Thu, 10 Dec 2020 21:10:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607631047;
        bh=3Ig/ulS+GXuDBWBNEh8mI/Yafuj8V+n82PGtSh4ca9E=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=gt3ODvdnzpNZZBAHK+ZVuL+e7eATNFHVL5M3gZ0/6JxBAB8u3V3LLuoLtBixHYf6z
         Kc9tkzArK9b0NGPLaWs+xOS0MTxirKo+EuH/L9qHSpDchCM+Oju5omwK+jknnCM5AN
         B1hiUf3bKLwjUJ53fiYQ4SLqEERzT5v1W7Td6mJUkYe7hU0+ue+i1UGZfbuzU8r0ZB
         pXyJ303+B3zTkt8RdcL+sp1iK+wQ8Ft+QExr2CBBBKU3BeuNUaEfkOcTf5fnwwhBe1
         f+uuTvpywGsFMdNiwAPRPtln0IIAmBdfUJd8ij5I92knV2ZOjo3uRLsulmVHhDqhtD
         CU2xe5sbU8ZNQ==
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/2] i2c: Warn when device removing fails
Message-ID: <20201210201044.GB11120@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@pengutronix.de
References: <20201126072331.1737632-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <20201126072331.1737632-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2020 at 08:23:30AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> The driver core ignores the return value of struct bus_type::remove. So
> warn if there is an error that went unnoticed before and return 0
> unconditionally in i2c_device_remove().

I wondered about the "return 0" part...

>=20
> This prepares changing struct bus_type::remove to return void.

=2E.. until I read this. You are working on that?

>  	if (driver->remove) {
> +		int status =3D 0;

No need to initialize to 0, or?

> +
>  		dev_dbg(dev, "remove\n");
> +
>  		status =3D driver->remove(client);
> +		if (status)
> +			dev_warn(dev, "remove failed (%pe), will be ignored\n", ERR_PTR(statu=
s));

The rest and patch 2 look good.


--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/SgMQACgkQFA3kzBSg
KbYabQ/+PRWldHox1MK22arc3L+F82zP+pYh/i9FCwdITq95v+0karyDrITu+4Ed
gGkT7eQSXMi7liXmDayXZtWpEyFEQlsY8M9CuS9dyn/R7hkSSr9tC3QDweK86njT
9CLVELOV0rogFI1mlT4hQjLJxL4kYjqawGginyUsWbGXiE9qnNd/X2w9xg0C2Lm5
+3xyXIA3vWPsyw6Qb4JNUEXZCaUxo6npULuk2/NsloxEfuAnxSB3NB3/KQ72HAJ4
OnIQ+UyYIC1S1w8i5xjwz8XnCH/LzKWP7/3DvwFAyT48OQqFyOnUZLHglu2a11rw
VwfyUYZVItegh5aj2+nDN6rl5xdZvnM4mMy5qHZoLhtRru3CCMVotn9PP9BEmrFj
UCu5isMPIsS2jZPdNrfzEezI6HXjTF6Pyc/X9bF8IAOQj8KfbqaScUYQkRCFQcHY
ScW+CKft2vmMTYL5Lil8Nc6SYqPSlxmsCpJAAD6BqdK/pOi9A/kolshSS3wQTaNK
fmMIuZZHpId4bMdeGvQrVrExaGwYmbFg+l3/geBR/RsZxfLVeJfHIACyTaNmRUSn
JU/c2usUfBy5PrdC1pej3aWucMRT2hCyfPi0Il8w8UmSYSXpoBfR/zu7Y3i3q4a/
ZAYgXhsF1mlNvMU0ntFzmBzLKwa2TE3F0C43DwiujMY5IMerlvc=
=RVuc
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
