Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D071B60B6C
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 20:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbfGESaP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 14:30:15 -0400
Received: from sauhun.de ([88.99.104.3]:53398 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727708AbfGESaP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jul 2019 14:30:15 -0400
Received: from localhost (p54B334DF.dip0.t-ipconnect.de [84.179.52.223])
        by pokefinder.org (Postfix) with ESMTPSA id 297892C7A4F;
        Fri,  5 Jul 2019 20:30:13 +0200 (CEST)
Date:   Fri, 5 Jul 2019 20:30:12 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 2/2] i2c: i801: Add support for Intel Tiger Lake
Message-ID: <20190705183012.GC4717@kunai>
References: <20190701131534.19537-1-jarkko.nikula@linux.intel.com>
 <20190701131534.19537-2-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline
In-Reply-To: <20190701131534.19537-2-jarkko.nikula@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2019 at 04:15:34PM +0300, Jarkko Nikula wrote:
> Add SMBUS PCI ID for Intel Tiger Lake -LP.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0flzQACgkQFA3kzBSg
Kbbbhg//Xnb5F7Iy51dbC8YqI907fBk2I1wjGoi8nw1p48gTViD5osIz9VVgrWPc
oW3u9uKKuFnbMhYc1rpuxHvS16HxptELp6dz9Q8inh1+81GfskWBCdKZ4o/akL5q
VXoFG+hr8oxEER7nDXV5V/1a3Dm8F9Zg79SUP/CnlNzpHtwHuG5aWL+Dw6IOcJkc
gyV68MaXyJLsyZ/Ynu63DjO+Phy98LoIjmRqPIX+8fr3WHpDK1M+iEOEGfmeCgd+
1dl48ai1c/5B+jtK4T7Pw2TvTVt20SXvz1Iywg1qd/u5i6Ir635zEzBh5mPZoKB5
vyNvADdUKfJNazLe7rfw+u7z3RLuALfnhSBfL/HWGBzyA1xVL9OjxEUdT6BKS0rT
6kbacpp8hqeA3VXPQyNZ/Dh8To9LQPt4M/3lHBD3Ng0YjOc8meh+BL5fQ7oi1KLD
+I5Tgfcm++RRCF2tF6092EPVpZeFc4x0GhQbEg5AZdc3tusnJ01qlWj/PfCu7f4V
GP48d6/1t6/2ZVQqe9OnZjuHNbQ1iBeZVnwQpbn2o/zv/kZDC7bH6g0fY02LMect
jx/3JsPgkRpPo816oxKeJFf6TuWEYDxt5WcQxv0KMnWknbpYF9apH+OQ/7O37xs2
kCtTDH0M7K4HngB9uUi7XtHHbO416gAgp3+QS4cVVT9i3iuCZzk=
=9hSD
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
