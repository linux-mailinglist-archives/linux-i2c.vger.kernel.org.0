Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE048486552
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 14:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239486AbiAFNf0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 08:35:26 -0500
Received: from sauhun.de ([88.99.104.3]:50624 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230323AbiAFNf0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Jan 2022 08:35:26 -0500
Received: from localhost (i5E860FB9.versanet.de [94.134.15.185])
        by pokefinder.org (Postfix) with ESMTPSA id C4DAD2C0160;
        Thu,  6 Jan 2022 14:35:24 +0100 (CET)
Date:   Thu, 6 Jan 2022 14:35:24 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [GIT PULL] at24: updates for v5.17
Message-ID: <YdbwHLj5NOtBAYaG@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org
References: <20220103105749.85404-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OzLo1WGBLSAISms2"
Content-Disposition: inline
In-Reply-To: <20220103105749.85404-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OzLo1WGBLSAISms2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0d=
bf:
>=20
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
updates-for-v5.17
>=20
> for you to fetch changes up to d08aea21c89dc2d302cadb5c2cc5410b6c3395c8:
>=20
>   eeprom: at24: Add support for 24c1025 EEPROM (2021-12-13 14:42:39 +0100)

Thanks, pulled!


--OzLo1WGBLSAISms2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHW8BwACgkQFA3kzBSg
Kbbm6A//eOIotEio9AOauIjuubqHmPezv1FW22Hyj7JPTgBCLMjSoAxdtX84A9Ye
pDQmEo8uPOHtYg9gQE95kpngT7zhW7bguNwpWNtTFaIgpEy21aPmYK60Pbk95GX8
zFir8oZkDyLgLx7VQQ0RaLMzIqItJY3AqrtJuUDf4XqVAJU/IPNUNAAV+2EHAs/1
7yLDuoJQCP+C3l3JfWNV6Y5OjboljTNc63BLCeWsEWFx9xsc9x9HP7jGqUZBPDjZ
xxmAnVWHzNuNi8ZIv0YSuPnUTiHDVykhnudX44GI1ONfZkdvqIjHL/xVoR4OjRN5
vC9IOmGkxDrEH2PbdkwNVOwAEE7gG9AkPj7WVM6BAWZUXUyJhCFKtJBM4ukOa6ke
OospkEl2v3ugKSUtznb8sT4CynkmUdcBzXI8hPcqB8m03CAKs51uSeWUWHO4w4px
IDaE7WdsicXU3nSD97Cy+UCVM7BDgYWT85F/H2viskUuQAhQo2GJs7fSKrg9f/Xp
KrRzZrt0m0eesxfgpaENJNBlEc7xbBIFwftY0IGSchuSexRKwj0SVDd8vpzeot8W
G47nn2jXzDkAJwCGtpg+cZ0MBK/urxgnv1ip6/rwLihpunVJMQLe8zyE0/xDcTJw
TSOAgf5fn9QVdMtmo8IbH6EDqva+1LqU/kgGxDncld5qgs0SzZE=
=Frp4
-----END PGP SIGNATURE-----

--OzLo1WGBLSAISms2--
