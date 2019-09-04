Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F61A9488
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 23:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbfIDVKa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 17:10:30 -0400
Received: from sauhun.de ([88.99.104.3]:46164 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730324AbfIDVK3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 17:10:29 -0400
Received: from localhost (p54B337F1.dip0.t-ipconnect.de [84.179.55.241])
        by pokefinder.org (Postfix) with ESMTPSA id DA3022C08C3;
        Wed,  4 Sep 2019 23:10:27 +0200 (CEST)
Date:   Wed, 4 Sep 2019 23:10:27 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>
Subject: Re: [PATCH v2] i2c-eeprom_slave: Add support for more eeprom models
Message-ID: <20190904211027.GA23608@ninjato>
References: <1567589393-19752-1-git-send-email-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <1567589393-19752-1-git-send-email-bjorn.ardo@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2019 at 11:29:53AM +0200, Bj=C3=B6rn Ard=C3=B6 wrote:
> Add a 32 and a 64 kbit memory. These needs 16 bit address
> so added support for that as well.
>=20
> Changelog v2:
> * Updated variable names
> * Changed idx_write_cnt to u8

This should be below the '---' line but I removed it before applying.

>=20
> Signed-off-by: Bj=C3=B6rn Ard=C3=B6 <bjorn.ardo@axis.com>

Applied to for-next, thanks!


--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1wKD8ACgkQFA3kzBSg
KbYjUA//dZohtwT6/+szWhJPH/YR3pjsHtNaS8deWnVxAX86rCLl3/E+ShoIWCpd
QUi1Oi5td7RAcVKoLRZL77kz/PQcTEdwl5cLggIpQ89WiZiDine6sFEg4KhhouB5
43yFUbPydvapk/aAwU88/175ZCXsSSmpqdN9ghgoaN1Ey1/AwehBnqZVYrm2opuB
buxYe5WFBYHAKLSvhhCesdnvieGT42Zdk6OiMz4qNxBnzIfDyWeKjTOvwfzSMuzF
Akiz9FozqseCwX5up1mzr4ePTreoYmd/5hEvp/8L+74aYk7ExQML+d7VFXBXEFrN
kVERqEeqIpwIjS4cFIMfyXHwqt/2bgPfq9KSjnNigHq/3W1tuT/hukofmS8M1AgP
UDA9193STk1bdtA4veWA9x98RcS9FovoyvBS2GggcIMTyQBuy7LixV4HA5UaDrOZ
4rThoBxgPMIfC4NO7BVA9kpXWUqbuBGp0q6Zl9s+C1/zFClCGiCgXFRYWGyCfs3w
UPcQk85NgHO6tL016y4kxn7tcAwC6kJ9+AAIr9wShx2sfwtd/4PbtM59EClqR5Sv
qrslSAegQ4eX6tfT7IywAuApel9s5UShRT5AmP/vISjVd/Rk68quTlS5UJgvmnmE
roEYpWFU71fy8DG2HReylsYHAcL5j0mSz2YJEJG7dGpcjOotMfg=
=ajrz
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
