Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9244C1A856B
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 18:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436531AbgDNQnE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 12:43:04 -0400
Received: from sauhun.de ([88.99.104.3]:38692 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404908AbgDNQnC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 12:43:02 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 93EC22C1F85;
        Tue, 14 Apr 2020 18:42:59 +0200 (CEST)
Date:   Tue, 14 Apr 2020 18:42:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, linus.walleij@linaro.org,
        patrice.chotard@st.com, info@metux.net, allison@lohutok.net,
        nehal-bakulchandra.shah@amd.com, tglx@linutronix.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: img-scb: remove duplicate dev_err()
Message-ID: <20200414164259.GA3708@kunai>
References: <20200414142650.29359-1-zhengdejin5@gmail.com>
 <20200414143837.GV34613@smile.fi.intel.com>
 <20200414155047.GA10848@nuc8i5>
 <20200414162002.GX34613@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <20200414162002.GX34613@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > scripts/get_maintainer.pl --git --git-min-percent=3D67 v1-0001-i2c-img-=
scb-remove-duplicate-dev_err.patch
> > linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS)
> > linux-kernel@vger.kernel.org (open list)
>=20
> Nice, you found a bug in MAINTAINERS database.

No, all fine. We don't have a maintainer for that driver.

> I recommend to resend a new version with those mailings lists followed by
> Wolfram included in the Cc list. Don't forget to add my tag in the commit
> message and bump the version.

The patch is already in patchwork, so no need to resend from my side.


--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6V6A4ACgkQFA3kzBSg
KbZcVA//ecH3hRW4Ka5Lxz6+xz4JrhX+/5Q0Rjgoweu4RsAm6026QmHBuJCQtD1e
3NfZC9uGQVtM0/33LAhXFcYdluOcMMfgs6KFzyKwFAOvLCne1nRyyJ5po5q9rhWz
rlTI10G2aWoyr7itAcyOy+JkR/efmqSCHlSsTq/xtejPxD5Ys53dZ3rz4PJP1IC3
XDa0csByBjXN7CQjIi4mhcJlLwiHEMQ3jc5d9UxZ4ORioP6uZdgtb+t40u2Btt2l
OkjPtdQIYrLLmqq+LnpGqaMJwUYJvYuBr9I+GeFUtEstfxA7dfjIrMVQKPEoWXP9
4dvS4vw6SzBkM7gD0R/y5XXSMoA01Vy7MPYALBOpQU8xrxr0wfozXAcbPXEKxVHO
cZXK9sFdNkBI4NuoHHipNi4xJTjILSHjk4cUH7rFE4+XmdnlBldlvLLiYjCSgzNr
2crrIVbduKrHkmgEvMicfaorZR8zzKuYO34yaWXNTU67DxVqNxxe3Qj6o/iSuCln
cWOqCxxJ+nxtTOHYiJahLh5zu3Y/5cjLatJwHLx3ZT1WSEL86Ep3rgMn6C4s6Vj7
KDEyzWlKJtyLpR0PUucX2dSFbr6q9lUNTt+J5GoQcZoYgDfaAxlAtP4MtkUjh3U6
XaQE3CoT38dV0QHtzoUsIBtpDQzqPjw2J7XojJgrtCwhHU9zwww=
=Mqwf
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
