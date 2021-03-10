Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21689334917
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 21:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhCJUro (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 15:47:44 -0500
Received: from www.zeus03.de ([194.117.254.33]:53286 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhCJUrO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 10 Mar 2021 15:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=iRQS/3vRUM9mK4Of5TDd2Y/NoUUz
        mLBVo4R9sf6UIYI=; b=HAmJkHozwgW2EB1TxMVdBQg8UmnA/xT0btD8kyv51aFS
        IQbLDSW9hDjq3fM3QAuTqxAsScbtDEfBjv7QFdBz53z5VLtuoLYdxC8rwfy21R5d
        l/NeuyD0vMaWm+HxvZG23VTNuKAooyoDxWyV8xpKnC73I2zbQSBH8SHxa0UrFbc=
Received: (qmail 3981199 invoked from network); 10 Mar 2021 21:46:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2021 21:46:49 +0100
X-UD-Smtp-Session: l3s3148p1@YdcQxDS9bKYgAwDPXwh3AMWGV3T2U+ZY
Date:   Wed, 10 Mar 2021 21:46:48 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <20210310204648.GA332643@ninjato>
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
 <20210226174337.63a9c2a6@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <20210226174337.63a9c2a6@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> We don't usually do minor version updates for bug fixes. Instead, what
> I do is maintain a list of such "must have" fixes, that package
> maintainers can refer to. Look for "Recommended patches" at:
>=20
> https://i2c.wiki.kernel.org/index.php/I2C_Tools
>=20
> There's no section for version 4.2 yet, but we can add one as soon as
> the commit hits the public repository.

I added a section now for the 4.2 release. And (finally!) started
cleaning up the wiki a little.


--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBJMDMACgkQFA3kzBSg
KbYcAg/9FT/1o+sZxGgP4Vg+/OzXXx68jfRMOBlVbPYjPdAhSRitIVknwim9f5Va
y7fMoJiWlR3/ZibcNv+KhhiP8OwU34lXxib6V70sRacvTtUoSU7VrpLWW2UgnES2
IBW22fICQkc3wJoEFedM3GidCxPipJY3o30wrbCKFG1crKE2rQuteWGx1X/WD8vM
dml7LcABmDW09WAfP5MS8AETTC8BP4u0K4BQAa+OdcQZTRcOEjqT9oUgwW26Wl9o
9WS0WAVfKOc86rVCfaH4YFlnuFmOu8bWiEJOjlAl1XHfJq4NYydD+A0c8IHP0ohm
UdAs9ymD3XYIsV0adXIrjsP75cvQcW62xykghnxeSuv1Ezp9TWq87IS+b3vOe0fo
4dp5kJvIGcTvJ5Pq9O+smgmIDe7qY8A+MN7c9oDYWnbkTrHlZhNMtZCYDB5kZ6SA
abMgyTUA160N/aeypy4b77MX164e1pboajNACGXspt1ZaoAXwXvktjUKjKOmFHVs
Scnma7/H3x2KdLurtNfNJjPoN1UgId3pWkCr0o0hkm/g20g7QuEuBSJh+Y1mr8a2
eWjbAjmT9B30R6q4F7+XxJvXvzSjLt7D0FN0cv5Fukp3v7YFDWyavzOzJeYaWCpQ
MKTDoHiD/oAAkl6kikdbH5Ms6VXXO1DtaE3lfEmZby+q0vF4OOo=
=o4wm
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
