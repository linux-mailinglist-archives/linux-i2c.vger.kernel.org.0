Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B104120FCEC
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 21:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgF3Tpc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 15:45:32 -0400
Received: from sauhun.de ([88.99.104.3]:55622 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbgF3Tpc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Jun 2020 15:45:32 -0400
Received: from localhost (p54b336a9.dip0.t-ipconnect.de [84.179.54.169])
        by pokefinder.org (Postfix) with ESMTPSA id C3ADA2C2066;
        Tue, 30 Jun 2020 21:45:29 +0200 (CEST)
Date:   Tue, 30 Jun 2020 21:45:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200630194528.GB999@ninjato>
References: <20200618150532.2923-1-uli+renesas@fpond.eu>
 <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
 <20200625070636.GB970@ninjato>
 <CAMuHMdWM3VUNUY-r_4cJw8FNFHcfpjY=s=sj2CiC67FRmNkALA@mail.gmail.com>
 <20200625151658.GB1041@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline
In-Reply-To: <20200625151658.GB1041@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 05:16:58PM +0200, Wolfram Sang wrote:
> Hi Geert,
>=20
> I spend some more thoughts on this.
>=20
> > > > In general, pm_runtime_get_sync() is not safe to call from atomic
> > > > context.
> > > > For Renesas SoCs, I think both the power and clock domains are safe=
, as
> > > > the respective drivers don't sleep.  The PM core might, though.
> > >
> > > Still, that sounds to me like we should protect these calls as in V1?
>=20
> I still think we should guard these calls just because it is not safe to
> call them from atomic contexts.
>=20
> > And talk to the i2c controller while it is disabled?
>=20
> Is there maybe some "always-on" property which we could add to the
> respective IIC clock?

Ping to this question...

>=20
> > That does seem to work on R-Car Gen2 (similar to SMP bringup accessing
> > registers of a disabled WDT?), though.
>=20
> Yes. Uli's patch will not cause a regression because we are already
> calling i2c_transfer very late. And we do call the runtime_pm functions
> currently. So, it will improve the situation there.
>=20
> > Needs testing on R-Mobile A1....
>=20
> That's armadillo, right? I don't have that, sadly.
>=20
> Thanks,
>=20
>    Wolfram
>=20



--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl77llgACgkQFA3kzBSg
KbaxzBAArrt8SbV9ATqgzXjOKZNWpNTsHMNQdXQtE2Wu88NcDZUsb4oUMpTCWcam
7ObyR30xttvvFwVOJtHsNs45qN0qpVjXleP2P3jLZDwjXx283w3dvYeBLRJCMg0B
YkaUu4Om0RZsnmmlhlqhd4iBQtVW8ZYqH6kIJbne0XW+g2i2lzbB8ozFkyV8GoDi
dRDSVJr7S/mI98Kiu1ST6WyRfkyBcpSlO5dTmCA53nZ8xSDWdrvddCipvVzEbcsW
YWbGxI3Xeg07AkWOETkhCKbliTeEotn2fNtehiWfwguID9xg7BtJq8OE2GAW9f2U
r/hPGMS8AYsK8IxO/pM5UMGF7s17ie/QRftaasB5SI9mPB11+FvHW2mnPHpuOjvA
vbZQzwsuEB0OcvmAwFEwZy+AbcPhPRVUgJfKuxZaRR+R+n/i4uDVY43FkGKQhpsr
NfcZlGv54NrFdalldFTnb9PgANP/gAdWBVwVhhuelqyKi1YkQrq0Rv/M8oZJUTYI
mBd1YNH7cNGjrVvnUKJzIEgiAsjFSoWVg5e4zvFbJ02wWqC7uwZDxPfUAMXaDSpT
ApohbDFMnDK8b8nj1ZIpxxThs3B2u9FgRJnbyblJsMfYm0COW2/v4nN1rSE2SXhD
merrSRqnq0umA+RBpaDaLBdSQSZSJDyjS3+YdjiUQp792/D1iyQ=
=BmBg
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
