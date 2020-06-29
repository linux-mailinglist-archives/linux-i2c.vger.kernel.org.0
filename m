Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD14520DDF9
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 23:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732970AbgF2UV0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 16:21:26 -0400
Received: from www.zeus03.de ([194.117.254.33]:49112 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731308AbgF2UVZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Jun 2020 16:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=/8H8N19CQPIhSgeYE73JogSoY3IN
        OOL1UOCRTXSrujI=; b=RUb5dmF1o9QxcdV5en+G+1IjTM7MxkYNYMA7KxrSN0Ly
        sWO6ssVo1K45G0vNyvFh1/AjmvW5WAzBuPNnNiS/vGWm55fSjS4qJA9pvRo26YPh
        CPV90t6jmna+kLY+/hpIyCcFr4OID0luujEbO9OAAnNeYODlSPPMlXHGamdm/oQ=
Received: (qmail 2013549 invoked from network); 29 Jun 2020 13:21:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2020 13:21:22 +0200
X-UD-Smtp-Session: l3s3148p1@KG00QjepBLAgAwDPXwOPAD5GWjq5uCZs
Date:   Mon, 29 Jun 2020 13:21:19 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] i2c: add Kconfig help text for slave mode
Message-ID: <20200629112119.GA1932@ninjato>
References: <20200628185522.5902-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXFgR__hnUO-o+2ukxOYc_6U63wjP1PJyip3KGg277gDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXFgR__hnUO-o+2ukxOYc_6U63wjP1PJyip3KGg277gDA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  config I2C_SLAVE
> >         bool "I2C slave support"
> >
>=20
> Why the blank line here ^^^?

Sure, I can fix before applying.

>=20
> > +       help
> > +         This enables Linux to act as an I2C slave device. Note that y=
our I2C
> > +         bus master driver also needs to support this functionality. P=
lease
> > +         read Documentation/i2c/slave-interface.rst for further detail=
s.
> > +
> >  if I2C_SLAVE
> >
> >  config I2C_SLAVE_EEPROM
>=20
> The rest looks fine to me.

Thanks, Geert!

> As you don't like conditional R-b's, I'll add mine on v2 ;-)

I don't? I can't recall that :) Maybe there was a corner case once...


--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl75zqsACgkQFA3kzBSg
KbaBCxAAo8uyl2zQVjdA2+42wBODb9obA6VRWcP4xNV5dUnQRB6yzRuxQql6Zbo+
OLNTUaB/fHl7oyeMtOU59Izg4MtBFH1OPTZrDhEpvevTgK9UoTcAv/5wD1JPl8Pi
bwZYVSx5C8FvnQhvsNGDifG7YAJvIq/wYpEfwourdZFoPBO1w3DXGjZ/Snws+5+N
837CKODOOB6xptCy5aLTkVCfjLSmeblPa9zVz2stNzAQB7br9ydAkJ60XuBR5Ij0
KeDupiPs0St72ajvKB7MXHq5gNlWlDRYzQr2nnvhv8dR6dqUWooXnzdlteAztC8g
fQOxqPmHHL3uBEaHaSDkWF1ABywWBXFEMJLgeOSScliLAxeHXinXlh1TNkEOUXok
8GldErKi6NTESMFyaK1NdADXY8jeEbOhqgS8lJjTWsrLKcpF1azUWku+en8omk0W
PZ8HT4Q2CoB34WhMqSNyrPQvGqkpVOjNBBhjwWeO1IzF6El+cgmSjtQM+6dFrlx6
DwmCk7TNB2/IfoP6y3BJrRJy3/DRI3g0FIe0eGGrjlTiI/0tgZyDrhc3xeOhdbzo
TL2YkS6bUFrcvULolq3p7AaHw+fzwcDj7BmNbkAmbatMphkROBx+s6Vb3OGciWGh
JKJBL/GtFJN+jku6Vj1Md5p5w3hN32u2V3YDXMKuAbPiytABnKI=
=p8e4
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
