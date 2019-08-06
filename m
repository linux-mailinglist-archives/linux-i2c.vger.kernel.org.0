Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBBB83A58
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2019 22:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbfHFUgK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Aug 2019 16:36:10 -0400
Received: from sauhun.de ([88.99.104.3]:36570 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbfHFUgK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Aug 2019 16:36:10 -0400
Received: from localhost (p54B3324E.dip0.t-ipconnect.de [84.179.50.78])
        by pokefinder.org (Postfix) with ESMTPSA id AA7E52C290E;
        Tue,  6 Aug 2019 22:36:08 +0200 (CEST)
Date:   Tue, 6 Aug 2019 22:36:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: base: Drop unneeded check for of_node
Message-ID: <20190806203608.GC911@ninjato>
References: <20190726131421.70545-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline
In-Reply-To: <20190726131421.70545-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2019 at 04:14:21PM +0300, Andy Shevchenko wrote:
> of_find_property() will return NULL if of_node is NULL,
> thus of_irq_get_by_name() returns -EINVAL which we ignore,
> so no need to double check.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1J5LcACgkQFA3kzBSg
KbbzPQ/9FT1qY32oCCKDITZDEYjmrRMKyT2JjxqTnY3ov73ANSp7AcWufbxuLWvc
CLeUAGDqRtIYroe/AW4DmU+8La4wnaPU1g5gbUuAj9IF+NhfLAFOiifo2kcGKsT/
vYtzc1DZri+QvEWyfK/gPX+PVSOwGxVi/wRuwkmbPiqx+O5tDkT3TIswBLTXyn+D
K6khLAoWTA+0QXw3EEmytcqTJn0IImfDOktojRlK6twgWGZGuoalL0Y7OLiz/ZfE
U6RGQVPjBPgl4IfL9yVSfUIlBsPPGaSJTg6wGifGjSjpDzuMTl0oCGUq18cRmL2i
W+EhzA6z1fqqTR2SWKS+G5jiiTBujMHMy8CIiDE+VrHM7kieJHRv8Jj/1KOCZcVI
HCn5bobI0RQcYiSD2AR0fY1uUyEMOzguPsUWN66bfnX+0eaIEWMOHnFy8DRmSQ4a
WdFLJsrAlACFvAiY5hJoi61o4Q0zVdPm0yYqre2qjvDk9HeK50y6BSj9TRBvJnQy
L9ef77bnkVFHA9GO5/DNiZEQpnZ1dv65rVEihpdIHKUxFPOHK0N/60FkFMwOw4zd
pdzuqoQCECgCCuxsbt+3jpanoWvqM731S+YGWpEzGfvdF2H4kjk5KuKh1EtmXI2V
rB1I7N3Brhb59JryJ2v9UbUdTopVjg09sj3421Mqz3/BiSgS0W4=
=50nT
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
