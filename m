Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29559209B57
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jun 2020 10:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389652AbgFYIdG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jun 2020 04:33:06 -0400
Received: from sauhun.de ([88.99.104.3]:42888 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389497AbgFYIdF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Jun 2020 04:33:05 -0400
Received: from localhost (p54b332a0.dip0.t-ipconnect.de [84.179.50.160])
        by pokefinder.org (Postfix) with ESMTPSA id 171B52C207C;
        Thu, 25 Jun 2020 10:33:04 +0200 (CEST)
Date:   Thu, 25 Jun 2020 10:33:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200625083303.GE970@ninjato>
References: <20200618150532.2923-1-uli+renesas@fpond.eu>
 <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
 <20200625070636.GB970@ninjato>
 <CAMuHMdWM3VUNUY-r_4cJw8FNFHcfpjY=s=sj2CiC67FRmNkALA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M/SuVGWktc5uNpra"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWM3VUNUY-r_4cJw8FNFHcfpjY=s=sj2CiC67FRmNkALA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> And talk to the i2c controller while it is disabled?

Hah, stupid me! Coming back from another topic, I overlooked this. You
are right, of course. Hmmm....


--M/SuVGWktc5uNpra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl70YT8ACgkQFA3kzBSg
KbaGaQ/+Ps73ju8HHgGb+i4V/Mvtkxr7tWOWBS2wwND5MIxH65Xrkf6PVytoPDBx
VXS6kS8idAuJ8Yzb6G+EvO9pM2rK+qonlhj/aYy1Kx1YCtPcPGEG1gejbpc1UeLY
mEDJzm2ICQvsN3t/WWzw/z3kdw+y24zbyiY90UgNiLhR4O/7lMYDkQprxW8vJ86f
RfptgDY4E3uEVn3eg0+Xq/SrtvbqONc6qbxhWXw5GF/pZqT4TtvZVzAfoCzRvWRi
Hvw5oVZnX5jlVzTrcW8vuxUkfpejo27gYXxZKcXgQ8GgumYRKDYpv9x7mDVMzI+r
MJxZDAOh6vv9Zr8M9oqLg44mU0A3H6yCknNwoPAGUHQs+AZ5cWKzIAGcHBWyp0UW
6lAF2/yNYx6veIVm+aVx6dtT8khdesYGZcYPBqrS7bz1uwG691zXhWN/T3QYs6zz
hYZqwDBAOD2qYza4+MYvIdX31hvH8DeXpq8Epxf01fSVspMwHliY+QZGpasGm5BT
K9cYmB0BoS+pCNOg+9EdtIH0/GEnUrXsyBx2+UsBeHO/3HTeJTkxZd9XeZ+kKBRv
DZc57nhpKTtRsnPJTU32vb/7QZXCaZnN2I6+vvCknkIEm4VnA083zjQQbafgbLoi
ug+Be5ztjBpDLrFT2fPs3guRAF3/DaItZK7Bu2K4iS2GzujbLzc=
=Y4p/
-----END PGP SIGNATURE-----

--M/SuVGWktc5uNpra--
