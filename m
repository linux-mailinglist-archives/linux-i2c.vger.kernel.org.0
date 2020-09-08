Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB4BB260B41
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 08:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgIHGvQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 02:51:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728501AbgIHGvO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Sep 2020 02:51:14 -0400
Received: from localhost (p5486cc72.dip0.t-ipconnect.de [84.134.204.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACDCD21532;
        Tue,  8 Sep 2020 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599547874;
        bh=R7MjdEEGVm6BQDKQNaKG/tSDmJf1fkUiZNTpzn/zWHg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kdt+KcjX4qYaqZN60/S6yaYwTzeTPYZjPnYoumTn2YjbzGdqwoV3KHUrChg4d1BP0
         K7GcxTqDmaAg2olmhcEJpoULQRIJn9lUhrsRzmNsyK9jqsLF4WXdJ+TNYZEdJt28aV
         WWARrBJMl7yDDa5/9uc6i5dyp8Z+APsFd+L3UueM=
Date:   Tue, 8 Sep 2020 08:51:11 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        David Jedynak <sileasresearch@gmail.com>
Subject: Re: [PATCH] i2cset: Fix short writes with mask
Message-ID: <20200908065111.GA5936@ninjato>
References: <20200903110054.52a3a69f@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <20200903110054.52a3a69f@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 11:00:54AM +0200, Jean Delvare wrote:
> Short writes used "daddress" for the value, but the masking code did
> not expect that, and instead applied the mask to a variable that was
> never used.
>=20
> So change short writes to use "value" for the value, as all other
> commands do. Adjust all code paths accordingly.
>=20
> Reported by David Jedynak.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Passed my test as well. One question:

> @@ -140,7 +140,7 @@ static int confirm(const char *filename,
>  	} else
>  		fprintf(stderr, "data 0x%02x%s, mode %s.\n", value,
>  			vmask ? " (masked)" : "",
> -			size =3D=3D I2C_SMBUS_BYTE_DATA ? "byte" : "word");
> +			size =3D=3D I2C_SMBUS_WORD_DATA ? "word" : "byte");

Does this really change something or is it a refactoring leftover?


--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9XKd4ACgkQFA3kzBSg
KbZMKRAArK48vAWMbNvB9djLeeIJJ9lsD8Y719rFRgOq6gDVrYw34GLL2NRoxEVL
R3Aw4JvAkWXeXsPsHXwkTmvBB7Pa8no8SN4MC7kh5ZEbIAWdwxNbL+3pN2kno2Kj
FWS6zt22KH7eAHDGIVbJB0JWRhS2cdsCi6hWnilk0vaQLQ1Z9ft6dz4vzhgOEv4x
jxoZAAwOVQ6VecEwN12qjAyreaBYj0IFM1CDsqaFtCgKc6Q2SjTI/lhzqc845Lmy
TJGd0BUsTCIY9gFDksqBskfRg+I9pBWPbf+voYWIZk/c3hsYds5Q3iWo3Oq+wIPp
xB12Ll1cpUzgP64uDJC7UwYnkRXRu7SDNzB6NnPh70hQgJ+SWLKlaGOj43dGjYGR
tJTOwecaHgidQopFpk+ONxB7mN88UULXs+RpnOc32Il2+LJcsBc/aVHUOj819mCZ
iGC9C6l02q1lS4tJM5o4cwV66eRUCxw2PYuYJsvomiAtljr542mG81Ivr95L1Kwg
6sRa6VXsM7PfhJdHiuBcVKEeaUZD9QoJ/SsxoCNVYUoUgAogoM7Xjo1rZzdHl1gY
0+C5dAHlLHUMRzHPQOVX4e6X83IxYJahbBA2Rcq05Sef5I89Bw+yx+AgeyddefCM
LtrYh6NFjRMxfT03RTSJ96MPET/S1w5vnUqMy1M04MaZZ58oLk8=
=Fj2b
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
