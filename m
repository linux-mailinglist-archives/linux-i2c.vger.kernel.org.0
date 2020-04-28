Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B53B1BCF69
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 00:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgD1WGT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 18:06:19 -0400
Received: from sauhun.de ([88.99.104.3]:47588 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726256AbgD1WGT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Apr 2020 18:06:19 -0400
Received: from localhost (p5486CA03.dip0.t-ipconnect.de [84.134.202.3])
        by pokefinder.org (Postfix) with ESMTPSA id 3DC962C0710;
        Wed, 29 Apr 2020 00:06:17 +0200 (CEST)
Date:   Wed, 29 Apr 2020 00:06:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 00/12] i2c-pxa cleanups
Message-ID: <20200428220616.GA7698@kunai>
References: <20200427184658.GM25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
In-Reply-To: <20200427184658.GM25745@shell.armlinux.org.uk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 07:46:58PM +0100, Russell King - ARM Linux admin wr=
ote:
> Hi,
>=20
> This series cleans up the i2c-pxa code via the following changes:
>=20
> 1. replace i2c_pxa_addr_byte() with the functional equivalent
>    i2c_8bit_addr_from_msg().
>=20
> 2. removing unnecessary headers, and rearranging those that remain
>    in alphabetical order.
>=20
> 3. rearranging functions in the file to flow better; particularly
>    placing the PIO specific functions next to the PIO algorithm
>    structure, so all the PIO mode related code is together.  This
>    eliminates the forward declaration of i2c_pxa_handler().
>=20
> 4. group the register bitfield definitions, which were split over two
>    separate locations in the file, into a single location, and add
>    some definitions for the IBMR register.
>=20
> 5. always set the 'fm' and 'hs' members for each hardware type; the
>    storage for these members is always allocated, we don't need to
>    bloat the code (neither runtime, nor in the source) for this.
>=20
> 6. move definitions private to i2c-pxa out of the platform data
>    header; platforms have no business knowing these details.
>=20
> 7. group all driver-based IDs match (platform and OF) to one common
>    location rather than at either end of the file.
>=20
> 8. fix i2c_pxa_scream_blue_murder()'s log output to be printed on a
>    single line as it was intended, rather than being printed one
>    entry per line - which makes it difficult to read particularly
>    when it has been enabled and you're getting lots of them.  Also
>    fix decode_bits() output in the same way.
>=20
> 9. fix i2c_pxa_wait_bus_not_busy() boundary condition, so that a
>    coincidental success and timeout results in the function being
>    successful rather than failing. (This has never been seen in
>    practice, but was spotted while reviewing the code.)
>=20
> All in all, these changes should have (and have had so far) no
> observable impact on the driver; therefore, I do not see any reason
> to backport any of these changes to stable trees.
>=20
> This series has been rebased on the linux-i2c for-next branch.

Applied all to for-next, thanks!


--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6oqNQACgkQFA3kzBSg
KbaqVBAApxwcS04cVAkhn4dwzU+4l2rD/iqvsCR1byyGmXOkvflbvRLjAgsJKFaO
jxXrIsp/9Jt7TOdl2LKgKeKY/+C6tUrYL3cafWxXUgXyx1787AYp7y/EbxdylHHb
f/faryeemNLoYlHyy6xbcZaf8IZ/i9ISccEPA1+u7eRJEnMEZt8hw1IxWQYJ/r6H
IvECViV2ZnP6GFYkgurs55IhpZ71AwYuS/DcdH+o+VXDnwaT4joXqESq92A9IOlY
FVd/pt2xjjQHSfsMmzumUsu5BeNUWlpl7itJHDzlFywrZgPuOwPbQoqczpmN6Gat
ZzzyjYzWcMlNndWI93KfO3iJ2m2hIdkd2RDnUFB965cmdg1+ilTTmrIMcBMBBz96
lsdDpbc/Xw0+QfJoqw8GJbLGgSvgA3qGsIbh+7k36BMZUsvWNMNctG2J9/JKlxrd
zi2OSmyq915XGadFQQQbhf3nZ/MTKrvs9T+PFLwjiCNay3uxzcdTM059E+Dnnl1T
dCLkcSYkwvUAUv3ELYTuQ0xVXbvs/gyXrf9Ir0Ui+P+6myJalVyRnqhY4H5ky/MI
lrOCfFMEcKVCrv4tbkTcUhYPM5/dhu31V2Deo2yQrMiKSClLUAEt33QymgaDqPP+
tWBqpDJn5K7wRF1opx7iRWGnpUAeReex6VJmfUX32/iGkdANzRs=
=8mGv
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
