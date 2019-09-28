Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6012C11A7
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2019 19:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbfI1Rvz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Sep 2019 13:51:55 -0400
Received: from sauhun.de ([88.99.104.3]:36320 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbfI1Rvz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Sep 2019 13:51:55 -0400
Received: from localhost (unknown [46.183.103.17])
        by pokefinder.org (Postfix) with ESMTPSA id 2AA842C0489;
        Sat, 28 Sep 2019 19:51:39 +0200 (CEST)
Date:   Sat, 28 Sep 2019 19:51:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>
Subject: Re: [PATCH v3] i2c: slave-eeprom: Add read only mode
Message-ID: <20190928175114.GB2196@kunai>
References: <1567778769-25485-1-git-send-email-bjorn.ardo@axis.com>
 <20190913140907.GA1022@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline
In-Reply-To: <20190913140907.GA1022@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2019 at 03:09:08PM +0100, Wolfram Sang wrote:
> On Fri, Sep 06, 2019 at 04:06:09PM +0200, Bj=C3=B6rn Ard=C3=B6 wrote:
> > Add read-only versions of all EEPROMs. These versions are read-only
> > on the i2c side, but can be written from the sysfs side.
> >=20
> > Signed-off-by: Bj=C3=B6rn Ard=C3=B6 <bjorn.ardo@axis.com>
>=20
> Applied to for-next, thanks!

Hmm, I probably did something wrong because it was not in my first pull
request. I am sorry about that! I added it to my second pull request now.


--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2PnZIACgkQFA3kzBSg
KbbkhQ//f8atL8G1NUZHGMswPWUlb13zEMSWtvbIyZiYxbft3APzz/WSXVgmX1nr
gzjljHsG2Ph492tfP3hwgSO3153CdmKFOdd0ocbpAd2J+3+kLB33B3e4OOBRkBDT
P3yO/5FvWU69VMkQPrueBfdOLQg32JTujiO6M97a8/3em5pB1IOEGoDlv/yG8iyu
uCqQFQNK8OJB7dhN10Cc00xr35KWBg1b90Cmog28snb9AU5CbISFvP2+g4njhLzi
TsmtGB6phCxpJakUXPjKlkLa3JxxnS4QW5d1BBaY3aMN+fbsBLg9PTeTbVpOv7LR
0ndMulLbyDKA5qwGcc9L0wwaWV5r01bJGL4bx2EwxBISJ2BZs03N6NUP2SnlcU7Z
vJS+S3tY/IFa94s86GCaB/ABZSrdf9Ys4UUTpVjZlaQ3QtuswVAx5wwgqxfwVjax
EJ+/XN6a9DnloCVN2rFHQFTCGTcrwNnRCmnWnkz3QGcFmvXg9TJ3pxf77tChzZuW
pwn6STtDGQ8uIUvz4cbVhZYe+i5953fWURM8HRiQx89LILgFMLocUzyiGFxIzWlW
YJ3xx925c4VRwIiUlGVtWz2ljvSseNMpA9PF0lR6Qd1vNjggMtnVuFHnYFZPFZAC
121tSMIY8Kvp+5y2gV5ahJyAJAgcDC8FCbxwcat68IQwVDjx87g=
=Qbej
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
