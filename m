Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1137027A243
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Sep 2020 20:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgI0SGT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Sep 2020 14:06:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:39550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbgI0SGT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 27 Sep 2020 14:06:19 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C29823A05;
        Sun, 27 Sep 2020 18:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601229978;
        bh=2G9SbJ/cJpywKU3C9LDI23sdvEaOKHzPJIaoxw96RnA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YwrArF11uS67h3nQpwyvKAdyGkuArwYeZC7BVinQI3FmyVa+oiuq75RckZTCbjxMu
         eB7X645Flqjj75iWFIiATsZyAiLq084vg3xPg9RWIMVkB1fMFMuL1jK9jgrg+uS26I
         lAwDWwA2wCn60JtroaeaosvZrSzxAvZZC8TqJ7XQ=
Date:   Sun, 27 Sep 2020 20:06:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     andriy.shevchenko@linux.intel.com, kunyi@google.com,
        benjaminfair@google.com, avifishman70@gmail.com, joel@jms.id.au,
        tmaimon77@gmail.com, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: npcm7xx: Clear LAST bit after a failed
 transaction.
Message-ID: <20200927180616.GG19475@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        andriy.shevchenko@linux.intel.com, kunyi@google.com,
        benjaminfair@google.com, avifishman70@gmail.com, joel@jms.id.au,
        tmaimon77@gmail.com, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20200920204809.132911-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Content-Disposition: inline
In-Reply-To: <20200920204809.132911-1-tali.perry1@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2020 at 11:48:09PM +0300, Tali Perry wrote:
> Due to a HW issue, in some scenarios the LAST bit might remain set.
> This will cause an unexpected NACK after reading 16 bytes on the next
> read.
>=20
> Example: if user tries to read from a missing device, get a NACK,
> then if the next command is a long read ( > 16 bytes),
> the master will stop reading after 16 bytes.
> To solve this, if a command fails, check if LAST bit is still
> set. If it does, reset the module.
>=20
> Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Applied to for-current, thanks!


--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9w1JgACgkQFA3kzBSg
KbZh3g//XYIGDk4pDY8HrG7y81c38n5KYK+HXD635lZxwr0D3Hp/DVeAw2YWmS4f
15It6nyQIk9ENrURatSHh2fVbh5EAhdXlnmHVWF5Ey2XS7Rv/RL6QLxanBHl385E
3q+FHqSMrcSjfQqqPILlGEDpHfOmVEDLV+pwcxbeku5P8CPzThXT1ZVfxB5Ild9j
eysaEdluZ/KFtDQnnzLupeOUYsTt69a0Kz/8vSvfFOS1QnLQfObyZoW9801odQEl
b2SzGSPYKMaiZLX+rSlONIA9ZLzyIsB1YE0R3gU1V4blzdHdxkVtK1tyaW69UPxs
kIP5WnjTvAHKxeN9juz+61qH5NpEUg8vrBjRM8Ey6FSZf6g+672Q6vVQcnqO7MNm
PG0LgmVwd0GzDlSDt4pHZLt2o9OkVcYgyul5ZoFV5rDatILSlOGPiCUTUWG7QgK4
hZEhhlgyib7o7S9eEzB5ORiMw4pF+C4cPpQmPryQetnvWmkxU/PIQgAHzSfS+Jvo
UaEKWzlZrdfx7SKSikJEDXn6y6FFWyIyD/S/WRBTolvqP9XXmiHIhdDrEc95Mqwu
/r4x4GP/k5ec4qkwAu4JTdup2WUs+lD5ZEzRu8SelWURCKp2in0Yu2ZZLeMlYFZD
zUO2lAkwE/LbQuflJ0MVqHcMiJz/W22FkxYDttpvATSoq0f7wig=
=gCdm
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--
