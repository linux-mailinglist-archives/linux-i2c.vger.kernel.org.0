Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDDB421816
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 22:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235614AbhJDUCu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 16:02:50 -0400
Received: from sauhun.de ([88.99.104.3]:40152 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233317AbhJDUCu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Oct 2021 16:02:50 -0400
Received: from localhost (p5486ca22.dip0.t-ipconnect.de [84.134.202.34])
        by pokefinder.org (Postfix) with ESMTPSA id ABCFE2C0182;
        Mon,  4 Oct 2021 22:00:59 +0200 (CEST)
Date:   Mon, 4 Oct 2021 22:00:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next 4/4] i2c: mlxcpld: Allow flexible polling time
 setting for I2C transactions
Message-ID: <YVtde3Havjk5glrq@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>, peda@axentia.se,
        linux-i2c@vger.kernel.org
References: <20210823144504.1249203-1-vadimp@nvidia.com>
 <20210823144504.1249203-5-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pausyYI9K8v2Xe58"
Content-Disposition: inline
In-Reply-To: <20210823144504.1249203-5-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pausyYI9K8v2Xe58
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 05:45:04PM +0300, Vadim Pasternak wrote:
> Allow polling time setting according to I2C frequency supported across
> the system. For base frequency 400 KHz and 1 MHz set polling time is set
> four times less than for system with base frequency 100KHz.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Patch is good. Just needs to wait until I merge the next rc into my
for-mergewindow branch, so dependencies are met.


--pausyYI9K8v2Xe58
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFbXXsACgkQFA3kzBSg
KbY+GA/+PbazpVysx4sEspoKCAt+dlQYGDlRm/D8VSAr34ocx2TVKZ282Xr3cDin
8AsK0hGgYaRmzHMFJnD8AeY3OU3U2h+Bn2Altop+JRAfCqxLCdijGzul661kOfPD
0UZwW7kxyrNhImite1QW7Oa0Z+E0VdUixjuBRkXncBI7C7kY6Qak5nEkrBmhV52V
aQ9qUW14q1TYEYh+4J7oyvxp1FeDj5osVLzkBMhDZzxxKl4e/nB6c1qgZD9zEXFl
teKoFOqrwQxqZpTqQBlO+1GvvZBeOrR4QN7bjNhIrzAzcrQiroCZJcSqPsWSPvb6
JALYxhL5RMqKO8UR9nAWNbIs0rmCF2fLCXan6E9nWiiXE3sLP+NrQhdXww8zDNyX
QrdcPGH81Y3CHupvi6TNhR5j5t6jXvvquju1kc22KmWC/Wiy6UkU1z7ajytZS+n/
YgLdHhgEZt4XNwP6RfECcErooajACdyarP94RioiA9UVlVXeg7pTnshWn+/y9/l5
UTNwlXF9zjDojmA2dlre666kQrXR6SOCd9bHmsk6WBTMOITj/yp//g2iIU/f4v0D
MlCT+fab2goewcLz0VwbQlR6HjCM+P3LOTbw/O2Mm49ZjXG/ne0I1AfszRWvRKaJ
jTc97u2T/d2E84a0IHfdXU7GLrD14TAa/aOj1N3QaPMxI5dRtlM=
=2RVX
-----END PGP SIGNATURE-----

--pausyYI9K8v2Xe58--
