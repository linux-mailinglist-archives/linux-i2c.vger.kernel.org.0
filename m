Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B302F2180
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 22:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbhAKVFk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 16:05:40 -0500
Received: from sauhun.de ([88.99.104.3]:47668 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727057AbhAKVFj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 16:05:39 -0500
Received: from localhost (p54b331ec.dip0.t-ipconnect.de [84.179.49.236])
        by pokefinder.org (Postfix) with ESMTPSA id CCF582C08AE;
        Mon, 11 Jan 2021 22:04:57 +0100 (CET)
Date:   Mon, 11 Jan 2021 22:04:57 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-iio@vger.kernel.orgi, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i2c: smbus: switch from loops to memcpy
Message-ID: <20210111210457.GD17475@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-iio@vger.kernel.orgi, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-4-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline
In-Reply-To: <20191112203132.163306-4-dmitry.torokhov@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 12:31:32PM -0800, Dmitry Torokhov wrote:
> When copying memory from one buffer to another, instead of open-coding
> loops with byte-by-byte copies let's use memcpy() which might be a bit
> faster and makes intent more clear.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>=20

This one I like very much! Applied to for-next, thanks!


--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/8vXkACgkQFA3kzBSg
KbbCMA/9HN2XjJ2lHiqTDk4AA6OqOX36Dfgmhkdo4gTlVLCi47jOQnEBj3K2ukEm
/fW2M+/a6OfPaP8MoaCt5Z3ibNR1MK+8ESNDG7iZMLfZbTEEsBdQxH15AcJkrUpB
HWOi8pELHmkUzxTms0dIV9t27xGaKosDT9iTffgEU5zudKFe993KjMU5pXMOh7+L
9NzZQ+9ZYZtv673eb/92LdoswTIxSsVDrj/1szHSddZnShcPDU7LO520mGpKYkzL
+3oozvrC3UyRbxLnls8zV2R26KlMC8AHIvRB6SpqMRgVBC5wMqTQaaaEmUJv6aOx
VmUWnaWRcgNDpOx+E8tIyIH0zMGFcxWWvzNycmh3HlPntb9JLcQMmQJV2d3lFfQj
uz+s8K9CLjopO2R0KAUGTd2Cjig56a+stymFqh7mPJ/JRvH9Zdcb6c024RZYwy2T
ybo69Ag9hIdva0JzAnxcPj6Fm/pp9G1mbA+gd5AR43aK01cZVyvcyMJbhkU637al
t9zoOxaDD5HBrpapoIwnfFe0Q5em6sJ9WcBOj2N9nuoP8AA7UboX5jatR0mmdBE0
81d2tWhNrSWImzNyz2HyrH5TvgS+JpRdawc23Ir08CEVA2ilm1P73MtW5yo0hNug
Ao5fbjCJfqGds2QFpYMUn5TLCmnilUgRcQe4HOkAteKVAPcLvGE=
=8niq
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
