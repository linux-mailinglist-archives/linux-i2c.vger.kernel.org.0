Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5481955A73
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 23:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfFYV6v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 17:58:51 -0400
Received: from sauhun.de ([88.99.104.3]:49142 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbfFYV6v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Jun 2019 17:58:51 -0400
Received: from localhost (p54B333A7.dip0.t-ipconnect.de [84.179.51.167])
        by pokefinder.org (Postfix) with ESMTPSA id 299292C376D;
        Tue, 25 Jun 2019 23:58:49 +0200 (CEST)
Date:   Tue, 25 Jun 2019 23:58:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kjetil Aamodt <kjetilaamodt@gmail.com>
Cc:     "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>,
        "WANG Xin (BT-FIR/ENG1-Zhu)" <Xin.Wang7@cn.bosch.com>,
        linux-i2c@vger.kernel.org
Subject: Re: Bug present in at24.c in 4.14 kernel
Message-ID: <20190625215848.GA2987@kunai>
References: <12a06d759e3d44a89ae41f65631c16c5@de.bosch.com>
 <20190624170228.GB6164@kunai>
 <CAKAz2q0x8Qi8+RT2dFNv74X1Cm_SyTUvzBmnZ-YN_x6d3bQS4Q@mail.gmail.com>
 <20190624184330.GA8035@kunai>
 <CAKAz2q3_jCRB0=tOF4BWMc8Bof0GGw_G_rQaeFM+ZPjxfD7WLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <CAKAz2q3_jCRB0=tOF4BWMc8Bof0GGw_G_rQaeFM+ZPjxfD7WLg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > That makes sense. Porting to 4.19 means, using 4.19 as the base for this
> > patch and then send out. So, the patch will appear in the next release
> > after 4.19 earliest.
>=20
> My understanding of this is that
> the 9a9e295e7c5c0409c020088b0ae017e6c2b7df6e patch
> was written for 4.19 and sent for inclusion in mainline, but not added
> before v4.20-rc1.

Not quite, please read again: v4.19 was the *base*. The patch was put
*on top* of it. It can't be *for* v4.19 because v4.19 was already
released.

> If you can send your 4.14 patch for inclusion in 4.14, and ask for
> 9a9e295e7c5c0409c020088b0ae017e6c2b7df6e to be merged to 4.19 I think we
> are all good here.

This goes to Jonas, I had nothing to do with this patch other than
applying the version which was sent to me.

I agree though, that it would be nice if Jonas could send this patch for
4.14, so it could be send further to stable kernels.

Regards,

   Wolfram


--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0SmRQACgkQFA3kzBSg
Kba5Vg/9EA7GwgNFCpa3TcioAjf64ZbvxJJVJJQlrNp+nLZnBLTWCqIZJtEozA1E
6aQlnYoSomm1vfTQkQfS2kwCLWKZqX61m3xz5qlSGhnPT5Td+MsSuS/AUIFUw3NL
Ig3HgJrYmX8I1edbbnbc3ji1uMPk5vLZMMEBdg//kX96ohOMaQg1n3RYRyrTz/l5
VoJ44TX6EM76MTnwbjCGk5ozCEzHke611GpEQ3x5u7wBeA20tPEKA4yWVDyOVtkA
qDkzrT5CDicAqim/tuy+EAC30uLWNe0IY4QWRm5C5gHPzYRmT2QfuI4dAFXx8f4x
VSGbXzewBg+9UzklwA1QdQmn6cxYhrS2Ts8AHP7cGdwkoNh7elzaITUo60fB4ILs
aqm1GZz6AfmdDmBg89vJf8xim4lTb8BaosVF4EoG/LrM4qn2bxUNFvQ58kpI+mrh
QizpSy78+3OB1BsRnE+1u04SAUH8mJSxkUCsDETs7mR/Ix5Y2uqiS89fmlq3Hled
kTKmIVlo5rgkuoc+/q1ffy3CwYMhwQBPYEnu1pbfHRC0Yq/nR9+4hVZsaeQPzU9u
cBA7HX8SYD87egiitpU203SfIEsesIhrUQmjjJEyXbqXLuxk7rgcEyvpUpLxEWak
TFeP5vwEa6byl+v0YYzEtRSTAU5aLnGgzDRHSLkzAEi9J4oHPPw=
=1IF5
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
