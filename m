Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763E7209A3E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jun 2020 09:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390107AbgFYHGn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jun 2020 03:06:43 -0400
Received: from sauhun.de ([88.99.104.3]:42254 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390096AbgFYHGn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Jun 2020 03:06:43 -0400
Received: from localhost (p54b332a0.dip0.t-ipconnect.de [84.179.50.160])
        by pokefinder.org (Postfix) with ESMTPSA id 08C792C207C;
        Thu, 25 Jun 2020 09:06:41 +0200 (CEST)
Date:   Thu, 25 Jun 2020 09:06:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200625070636.GB970@ninjato>
References: <20200618150532.2923-1-uli+renesas@fpond.eu>
 <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thanks for the review!

> > @@ -581,12 +585,14 @@ static void start_ch(struct sh_mobile_i2c_data *p=
d, struct i2c_msg *usr_msg,
> >         pd->pos =3D -1;
> >         pd->sr =3D 0;
> >
>=20
>     if (pd->atomic_xfer)
>             return;
>=20
> and be done with it?

I like Uli's version a tad better in case we ever add something for both
cases after the following if-block. But I don't care much, we could
change it later.

> > -       pd->dma_buf =3D i2c_get_dma_safe_msg_buf(pd->msg, 8);
> > -       if (pd->dma_buf)
> > -               sh_mobile_i2c_xfer_dma(pd);
> > -
> > -       /* Enable all interrupts to begin with */
> > -       iic_wr(pd, ICIC, ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE=
);
> > +       if (!pd->atomic_xfer) {
> > +               pd->dma_buf =3D i2c_get_dma_safe_msg_buf(pd->msg, 8);
> > +               if (pd->dma_buf)
> > +                       sh_mobile_i2c_xfer_dma(pd);
> > +               /* Enable all interrupts to begin with */
> > +               iic_wr(pd, ICIC,
> > +                      ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
> > +       }

=2E..

> After removing that check, it starts complaining:
>=20
>     BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:281
>     in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 1, name:
> systemd-shutdow
>=20
> In general, pm_runtime_get_sync() is not safe to call from atomic
> context.
> For Renesas SoCs, I think both the power and clock domains are safe, as
> the respective drivers don't sleep.  The PM core might, though.

Still, that sounds to me like we should protect these calls as in V1?

> > +                       time_left =3D time_before_eq(jiffies, j);
> > +                       while (time_left &&
>=20
> Who's updating time_left?

Good question :)

Kind regards,

   Wolfram


--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl70TPwACgkQFA3kzBSg
Kbb80w//ZxFdMxDD0p0GACwqvy1Xd3buYp3cKGFFk6K0pJWbtZZtLkhgGsn9GgKf
D4s29pS1nleSD/zkNqhaPYowh11wF0FlE5qCMp+FawqK+9ShfiiI884kocdsHc8d
0g1V+mUVIN3J8SZfUQFDqgOxIMRxFeQqhhbeHLF/cB0NX5PJvQwEthRapJABj9dQ
UGIZbj5/DMwX0SjPPXWFOPyq5Sc2bEgU9qSIwghn3PDey56irAZ4vEqnKS2mKgi3
p3X5Inukuqi1Moll2W+6AFYxtvMu86ueTemg5D+5HwvRfLDlXZl7kK9hjLoP6cwK
ItGmRBwG84BOjzg58bRhxYoyRZUT870sra06SLzVk+/xFc/q5lrahEtsZEzCHnIl
l02ioOf0j31kTjhhfLMkayvjxdB5Z0qsVD321NKwX4z1czjtlsyomvWfTFIHeZqS
7ZLnJdNCXyBcK/CNXjuDEFytO+HWJf9StW5zzRwaV+Z6t4G5CL7eg263ZEdvFMbH
KwsEoGIpLp427BLUwqFUgpykFJZq62Ma+yVoNx2RLIaKc1RJ3t3QTU/TMv9rLFHP
T5ni5dq3MAci5bbWfoYDJeFmfIklKziOr+/OwuoXrBYR6MoMfEaSscq+SyVYws0o
f3qkF75bztgLidgGuwn73icnbJylXKgT/Z2w06qOtQ4q4zf+cOQ=
=pqD/
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
