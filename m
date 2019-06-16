Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84FD047454
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2019 13:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfFPLPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Jun 2019 07:15:35 -0400
Received: from sauhun.de ([88.99.104.3]:45562 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfFPLPf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 16 Jun 2019 07:15:35 -0400
Received: from localhost (p5486CA8A.dip0.t-ipconnect.de [84.134.202.138])
        by pokefinder.org (Postfix) with ESMTPSA id D57D72C3112;
        Sun, 16 Jun 2019 13:15:32 +0200 (CEST)
Date:   Sun, 16 Jun 2019 13:15:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 1/3] i2c: i801: Fix kernel crash in
 is_dell_system_with_lis3lv02d()
Message-ID: <20190616111531.GA3258@kunai>
References: <20190613164529.63482-1-andriy.shevchenko@linux.intel.com>
 <20190616115957.661f1a7c@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <20190616115957.661f1a7c@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Fixes: 19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device=
 on Dell machines")
>=20
> Are we certain it will be the same commit ID in the upstream kernel
> tree?

Yes, because I don't rebase my tree and Linus pulls as-is.


--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0GJM8ACgkQFA3kzBSg
KbYp0g//Vtg/CkIOZqciLntyUyV32jk590cQyYr5eSud7lNeakgHqFmz7sTZHbQl
JwH0FeeMrIkVlqYcG9p2CpfWNPNooxl0jM/amQpORrIJ52l38O7EVked5oAA7OAh
OyEsorsZbZXwqGmyqykdZ3pyx7+2JJrLqe1df0+saiVlU7K6UMBgW2lrVi2HXKux
TU7Dm8pnyVCG6Xnet3EMI885m2Kh0f/8/66Vuk5eOmCXBs2gXFFuPL61s1ZvjBIZ
N0bhKWkNoXUHub4jRR71Ui/JXUzSx9Igy+pEOgooGzkMz3bQKN6J9a5ykTnmJgo4
yAklqP8kBP6SQjXdP22EP7T4f7+c10Bsp89MCURK2Yc8XcmhJ4JtPjbITcjqRcbm
+nLS0WKII+ViOstlYtkD9Ts05dLyZxEfruoBZoFoVfDluhjVv1jWEqXNPMPVyu4r
NVxErcIHAtKlSHmpkL5Ir/dvSIT9tG4rijuYb0hNJfMXuC6QMy+aUvPQzXtaFAhv
F+g1yRDnTSSa6CsYN5e2hDp8bu/hQKwJbkKEyAz1FIRheJtm654lsgqiUhSbcQi6
GacPKFfs8lmtbDm1ZC4TGaS8UgSVuWc6nU1tx1hC2W8jdWDIjOH9kI2t8oJl5Prf
q0n5bBoCEKpWn0qWZ/P+LqDqa/z1BLIG565ZV3FYj5uXJkKhpw8=
=VXQK
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
