Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD46714D234
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 21:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727361AbgA2U7A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 15:59:00 -0500
Received: from sauhun.de ([88.99.104.3]:41656 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgA2U7A (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Jan 2020 15:59:00 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id CB5C72C06AB;
        Wed, 29 Jan 2020 21:58:58 +0100 (CET)
Date:   Wed, 29 Jan 2020 21:58:55 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: updates for v5.6
Message-ID: <20200129205855.GC7586@ninjato>
References: <20200124164644.20020-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline
In-Reply-To: <20200124164644.20020-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2020 at 05:46:44PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Hi Wolfram,
>=20
> I'm sorry for the late PR. I was (still am actually) OoO for family
> reasons. I hope you can still pull this for the next merge window.

Yes, it will work. Enjoy your OoO!

>=20
> This time the release is pretty big for this driver. We have moved the
> support for write-protect pin control into the core nvmem library so that
> all nvmem users can use it automatically. All nvmem changes were acked by
> Srinivas and have been in next for some time. The DT binding document for
> at25 was updated and the patch was acked by Greg KH. The driver also now
> supports regulator control and has suspend/resume callbacks.
>=20
> Best regards,
> Bartosz
>=20
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>=20
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24-updat=
es-for-v5.6
>=20
> for you to fetch changes up to cd5676db0574cc1c0b234bc3b17565b07290aa72:
>=20
>   misc: eeprom: at24: support pm_runtime control (2020-01-23 12:52:57 +01=
00)
>=20

Applied to for-next, thanks!


--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4x8g8ACgkQFA3kzBSg
Kbb9lA/7Bzjb2yZbT3sS0j5F4PJLNFS9KDt7TDAeP3gf5FZ4iaVP0pHKmc2/IkEI
d7Ruh9N7omMbbRP6IM8RODgPKswNM1n6PUulP82Di18491dUyKO/wS2XXFVZHiMI
BvOj9mBarItdqZd5iyCjIhgp04OZdmB+Dj1RUnZwFn0kVCd+Pe6pWoZ45OVBuxiP
JXxwWb7O8quuTa4xbvG4fHcRKgbMN9GImPAs8Xk1Y9pw01JizYSwdGyLYFfZtrzZ
/SWI00CYz+k6+ings1aZDZQh+OvmRkZ3l+iQCORQJfPPkKJZno78U8RqJZvqRHVd
+u5shCzIh77HuAOdPwG5LiNHt0ZzWYuXjNe8DYyfFdWhDZeMLKKqgrYI6fO+1ZW1
sq7Uwz8J2c40UPZFrVO551al5Dcr9LKrSPv9ltDrigEJgDL65DnYfaGaXs/xS1lZ
8y0EeF3x6H6GjXtRiXA8mh1/9GaOBcdS2N8GUdxSbQnEKX60Q5DzAzbG66pQifGR
BKvGfYo6bbgLrGdmn2hhErHbVwYryxTjk3j2t/Cm9gISaVCVz8Ioco7CwEWK9daY
unParqeqoTMCBRZuwh8mKgs1XAqWGvAPLNYOlafxB4WhlDCv/MJSMS+7jjb7DSFv
GdevKN0BmIkMDH92SKle2PXqaotf/5nryWA5+b1FtlgADBlCJAA=
=2K8W
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--
