Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6741B0610
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 11:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgDTJ5S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 05:57:18 -0400
Received: from sauhun.de ([88.99.104.3]:44238 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgDTJ5S (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Apr 2020 05:57:18 -0400
Received: from localhost (p54B335B8.dip0.t-ipconnect.de [84.179.53.184])
        by pokefinder.org (Postfix) with ESMTPSA id 545C72C1F4C;
        Mon, 20 Apr 2020 11:57:16 +0200 (CEST)
Date:   Mon, 20 Apr 2020 11:57:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     kbuild test robot <lkp@intel.com>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>, lkp@lists.01.org
Subject: Re: [PATCH v1] i2c: busses: convert to
 devm_platform_get_and_ioremap_resource
Message-ID: <20200420095715.GB2094@ninjato>
References: <20200414134827.18674-1-zhengdejin5@gmail.com>
 <20200415102158.GH1141@ninjato>
 <20200415160757.GC17519@nuc8i5>
 <CAHp75Vc+a7sQeY+W+4+-75TCMDCpnPRjUA5T8ZsBZi52PVB9dw@mail.gmail.com>
 <20200418040653.GA7120@nuc8i5>
 <CAHp75VcWRd8NUoYAVV1g8051XWZgrGm0vKAAzF_4WzTi40y+Ww@mail.gmail.com>
 <20200419163600.GA19772@nuc8i5>
 <20200420094319.GA2094@ninjato>
 <CAHp75VeGNV-Jsyu1ev843GzBuJqwojfDcbC5H9MJokurrQLjjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline
In-Reply-To: <CAHp75VeGNV-Jsyu1ev843GzBuJqwojfDcbC5H9MJokurrQLjjg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > 6. Fix ioremap(..., 0) [size =3D 0] across architectures, now some re=
turn NULL,
> > >    some return address, some may even have leaks
> >
> > This sounds more useful to me. Would be great if you have interest.
>=20
> But it much more advanced :-) Complete dive into the kernel guts.

Well, learning by doing :) Dejin seems interested...


--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6dcfsACgkQFA3kzBSg
KbYfag//ddSSfS/TAiNL2nHnAjoqxwc0qE7J6fYih9ja38imDI6aHvJ7s0jKpHOW
Q5tzWpDKMvtEQLhiIVe3m7sm93UgEco4w4I3ZboxUGpRKMnCAfdOyPh5OTPp4hLl
PvaPGflI1LFtwfqzCvfN+9hyhmTRbXkbtGbgu5qK7P7z7BjDZ5bxF8gT/N1hyH30
igWS0/fCKffIJhPH2+ryZwb0fJy/MlbE+sY4+h1GEOIrdLWlIiQjM9dH6Tu4ZaKh
fRzLFuoGdsuSN1bZNC/nr5sCrWOXsL+FuHuYDvt/MSyj2PYs99oQ1NfFg6m+XqW+
7smN6sI9G4VQYorExKHsBrnf6qIAaeVVN/GDVIYfpZhB4GGkGxtFTmrwoEYYbWFb
ORLXAJLva8GNLx2m4EQ58a2RYwHwwPU9PNyOxuOylFNiCoi7NcXu/45+Uhu2JMax
j62Nw/a7bZjQhfVP66Dd995XsyyeBIdEB9EHlWX6s/N0kxaD6hYUxT/N1ZORZNdj
WyT1bsdxLadIwxJo6pVFsxOg3UOjC42X8uQ+svCht/wIyxjO6SuFyLL87fLPVg0l
J4lU/jNmSZcV/6RZ+OdEEbV9DrTwwMQSbsUThB1auebiqyCmuQ+r51tDau1cI0tI
SJhDy5LgET++eOr0zjl466h3NIB9m1ObIr1zyRfkDT3TWCYnYGY=
=fTN6
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
