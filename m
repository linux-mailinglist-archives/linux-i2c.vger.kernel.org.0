Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED9E27A132
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 15:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgI0NRG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 09:17:06 -0400
Received: from sauhun.de ([88.99.104.3]:35166 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbgI0NRG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 09:17:06 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        by pokefinder.org (Postfix) with ESMTPSA id D28CD2C0548;
        Sun, 27 Sep 2020 15:17:03 +0200 (CEST)
Date:   Sun, 27 Sep 2020 15:17:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: updates for v5.10
Message-ID: <20200927131703.GB7298@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200925133636.10950-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline
In-Reply-To: <20200925133636.10950-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2020 at 03:36:36PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Wolfram,
>=20
> This release's PR is surprisingly big for at24. We have some new features=
 and
> some minor tweaks - details are in the signed tag.
>=20
> Please pull.
>=20
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
updates-for-v5.10
>=20
> for you to fetch changes up to 61f764c307f6b2079b7af0d4fb7951402b824967:
>=20
>   eeprom: at24: Support custom device names for AT24 EEPROMs (2020-09-25 =
15:33:04 +0200)
>=20
> ----------------------------------------------------------------
> at24 updates for v5.10
>=20
> - add support for masking sensitive data in VAIO EEPROMs
> - set the nvmem TYPE to NVMEM_TYPE_EEPROM
> - add support for the new 'label' property
> - set the nvmem ID to NVMEM_DEVID_AUTO by default (for backward
>   compatibility) or to NVMEM_DEVID_NONE if label is defined

Pulled, thanks!


--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9wkM8ACgkQFA3kzBSg
KbbQ4g/9Hj9h9Dcu5Rnf8AehoXKMfGnKhNvL/kObEhJADfF+gbT2oiFM2HKgrGo2
lJphRaJiZXcoFveJD+hL3qoy4p460KcoaO339S6kVi6mWoUg0hsTQ+kTVuP1xQ1o
3SV71KYtyTRCXWxtXWNrY+rBj0SYyz2hhV4LzZ/4UdjORbtWxyetZCJdyMI+dIpc
Vzi07YyK77uHG2nK9isipdRkkZ99CHz+gJv0JPkElcWAJRQGBiLDJQkVtCIKyGc7
HpQeSC7KkM3j7rfFzzLce8lt0Dt72KWlmRpOlo+0iOXmDaRVcUT8a7iOJy0yTR2H
+mtt5+aaSJK7Yw7ju5Vb64gCbh0QUyuvHTvvTk2bryFHTrOJTqhR7a+IQyaBBayP
iyu+ANCTO048Mpr7BxcCaxEAphSnhmqQfShjrPbOdoNSg581E63vCJkm8pdet4g/
LNK1ymDY7/UaiC1mg5CQeC2GP9p6bqajnig5JatieIf6tJOjF8HPRw+NaqngdnA7
NOlYwJIDda0BkguNP7WBSdRavVMdRqG5SeNucQK9zgt2THklYlYDJcvuud1cyvAt
VsI5Q3Rn7wkPiH3IUDKxDxeeU4Qh0liyDtG3QqXr7HodGA0ftSXukrHXkYgG/lG1
5r3P1kG+DCc90fnw/zO2nlC75YDv1PD/maqBijnv9FCqNmZPzvY=
=iXE/
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
