Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79248A71BC
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 19:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730199AbfICRdr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 13:33:47 -0400
Received: from sauhun.de ([88.99.104.3]:56062 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728854AbfICRdr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 13:33:47 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id 7F52A2C4F2F;
        Tue,  3 Sep 2019 19:33:45 +0200 (CEST)
Date:   Tue, 3 Sep 2019 19:33:42 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: updates for v5.4
Message-ID: <20190903173342.GA2171@ninjato>
References: <20190903120652.26708-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20190903120652.26708-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 02:06:52PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Hi Wolfram,
>=20
> just a single trivial commit this time. Please pull.
>=20
> Bart
>=20
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca=
4b:
>=20
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
v5.4-updates-for-wolfram
>=20
> for you to fetch changes up to 10742fee98eb3b3e8453ef27a33dee314b15f7bd:
>=20
>   eeprom: at24: remove unneeded include (2019-07-22 14:36:56 +0200)
>=20

Thanks, pulled!


--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1uo/IACgkQFA3kzBSg
KbbYbRAAoESyKIY2LoBafkFNR71brekcJh1GcI2dYrK8xVNEu2Uqhf0cKzHiIT0v
0XTuZG4lUA85K5c12UeKbJcomx3iBKcISxzJ220A3kEnVVG7fSCJEq5q910ms+GL
0a9XnWKnb/kcSmLTwNVxA/vwQ982GiM02nq2YIrXMgDnjk7lCkLetbj2hPqeANBc
79CdaDK62DGezc8xOMpi7RwHbAubXDYCfl4sxhYtCd/IiV8Zn4b2peb0Xs/JKTEO
YjSSm5VGrz92NDpHDV1JHUM6449Bbb4NwQkM3753pw9ryr+evv1hfzU3m4V2RwHr
bJVaZcu5SMXDtM3C+3sWRiHC9oUQFL2zKltKooNoUhDWrmSxSFbhVgmA++cNOEIr
YdgJasa2cn4mm6nqalHgbMC1tlJPA4SBS0RKsYA8QbCo1U99YgmAVoXGV2okE372
SzucS/rvGqIgL2Gxd/MHbJ0gach5EtzVUV/w2orEBb5Wo2mLTlOYfzqqg1ts+ag2
4uPxj0D4NOsOBR6WBKmok79jgG2bGXAHLb/Gdt6F7u4CNJ2XsohcElUbg2yfpp/c
xpp+Ffs3Qlk9JFTP6znFCQ14nf0vLWmHVoyauKKR3jm58frOpfdjNzeytmoVZXqZ
WlgNJjWIIthXxgoEQ+ltwZHn/xtL3W4BfM5vJKdaeQFBndaVP9I=
=Tf9V
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
