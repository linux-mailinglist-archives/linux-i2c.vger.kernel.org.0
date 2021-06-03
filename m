Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC9139A064
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 13:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhFCL5z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 07:57:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:43400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229994AbhFCL5y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Jun 2021 07:57:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FE28613E3;
        Thu,  3 Jun 2021 11:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622721370;
        bh=S5RYFPmohv1E3Iu8Et9A3gLzzUZ54kMN3K9LSxI/RuE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sphbTlF4dGTmZRJ0aYjgQdGWsFADe3CTA0xcYbNoVOZ+WVSxpzHEcay38jHCafLk5
         +Z2BYwx6o9v+2RrtuagAHnoWoz2LALVPWZgn0/prAcc6PfO/ejdRvZL4QTfR5HDXNP
         QPqkbAQEEvpRC4gkWeZMWCGdrvmRRlkZDzUBoNugL5GgzwPg9J9FYY21P47aVLAAOm
         ZDUMxgbb5rhs7rxXyNPjfHYjub83pG4GPr8EUAREA5DUDdHWwuW9b5+ETI1R7gwTV3
         O1EE28lOJ3/OxFq6vN9KvuHdnkIbZx0VcLTqwWKK2kZAp7jf7pPsCYiyztogNLAX5K
         ZtBpWu1NvpuBg==
Date:   Thu, 3 Jun 2021 13:55:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Tom Rix <trix@redhat.com>,
        Sean Nyekjaer <sean@geanix.com>
Subject: Re: [PATCH] i2c: core: Add stub for i2c_verify_client() if
 !CONFIG_I2C
Message-ID: <YLjDT1sxNm9ehjey@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Tom Rix <trix@redhat.com>,
        Sean Nyekjaer <sean@geanix.com>
References: <20210526174436.2208277-1-jic23@kernel.org>
 <YK//xmqZCZRT1VVD@kunai>
 <20210603122436.00003539@Huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yVQNOwDjDzFRZoHR"
Content-Disposition: inline
In-Reply-To: <20210603122436.00003539@Huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yVQNOwDjDzFRZoHR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonathan

> Ok, so that is there because my assumption was that mostly like I'd take
> this patch through IIO, in which case it's directly valid and necessary
> for backport information purposes.  I'm guessing this one is unlikely to
> cause merge conflicts given how localized it is...

I see. Makes sense.

> You would do an immutable branch that I can pull into IIO. I'd really like
> to avoid rebasing the IIO tree unless absolutely necessary as people are
> working on top if it.

Sure, let's avoid rebasing.

> Doesn't work.  There is a high chance the original patch will get ported
> back to earlier kernels and there is no reference to let anyone know they
> also need this one to avoid potential build issues on the stable kernel.
>=20
> So, if you want to take this through I2C, the path forwards would be.
> 1) You take this one through I2C
> 2) I apply the original fix (which #ifdefs the relevant code out in the
>    driver).
> 3) Once (1) is in mainline next cycle, I can revert (2) on the basis
>    it is no longer necessary.
>=20
> I'm fine with doing it this way as it avoids any cross dependencies.

The other solution is that you make an immutable branch for me? IIUC,
this would be easiest? It would work for me.

> > > +#if IS_ENABLED(CONFIG_I2C) =20
> >=20
> > Hmm, can't we move this into an already existing IS_ENABLED block?
>=20
> There aren't any similar #if / #else blocks for CONFIG_I2C in i2c.h
> so it seemed neater to just add one around this individual element
> and not destroy the general organization of the file.

Could be argued. I'd still prefer to add it at line 480 (5.13-rc3) with
the #else branch added if you don't mind.

Thanks and kind regards,

   Wolfram


--yVQNOwDjDzFRZoHR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC4w0sACgkQFA3kzBSg
KbaRPw/9H4bVzQvki4qfttzqwC9c8DotzZclq0JJwkWrNux2+Su2BQ958PhbUFhm
PgNIE1T/EOSZvJqniNjofVq9AP2XqwLkHjDtNYTTeB/AVf5lHa1r5L4OIEwuCW1U
L7tYkmb3drfYNG7anw9Q/XFnAQCqdjqa4FDflBa2RzyKfYV2z3PPcexx/ehWDS15
syqX/w+JPAVmfu6fKPxedhiFE91s0gNn4eK/o/gcuActNE/CnXaz4dInCUs8ANAi
bvsTstCYkcUG1xkHvuWYR1R47yyEFLsgt1wwIuTad1/Xxkf+YU3CSW67bGDl/tzY
fhg+NfW84DX5VzxNdwksbaDEF3TioWQ4+cyx+oM2mfpuozaLk2HJ2XnkT+ZruD8H
O5ICShQdIKs7s101UQJUjEfOjHrMPpHN+aiBtNtfYZaH8dbD8p6bUneo3y2gIAPw
ngzAQ7ZIMvS0I6ny/ZNEqqzJWWK9xZqpuDRPXLPAgES+A24ddFibMGUg0LMu2dNV
qP60hPAso+ICi8p1yPJpApMVanD246v/p9VwozOtR+oDiNBfJtVu9rOA4wlQJx75
iiz+Yio+EIbO1/z7QfdKUMKF9cTl4GCOfSdgbBRPQLLl5aaqpCwPOeAbUj6bwvGJ
R0UzV74XtwqLt8Ur8qK2ry/U6kobGETGJulEUuJdUmn6migZ/M4=
=2ULw
-----END PGP SIGNATURE-----

--yVQNOwDjDzFRZoHR--
