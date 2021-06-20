Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF183AE080
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 22:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhFTVBh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 17:01:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:60264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229845AbhFTVBg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 17:01:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C93860230;
        Sun, 20 Jun 2021 20:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624222764;
        bh=UJ9bjGXmIRAsMMni6ZyFfSteLmrns7ySotnzyKPpgUU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MGncaywLfUu0gPN5hVknMO4xKKXjdCltmiSVkTk8SJIFBnCWhwWiW2iJ6UcrOf15J
         l1+nlSO2E5bIrLXIk1yFcznOlOS+rMipaZ4NRAWAiKNzUFxh086zwX5cImuK5meIy1
         vw4sYDcjPFKuid7HZTddkAeWhwiC3bm1QscmAkpJfgQIGpGb/3Xvf1+rni1IyK0ZEp
         ujv2rLoheR0bXCz+G2Y08DSHuYOq73RPhxOZ0wai3kEp9bhaD6sSfH0wI5ONVeveDP
         iCPLjz/8X6SEq0jLH8dMCX5zMColx4EWktnFF6ZHISxWnHDjFdHeNmtKLHI7D0oz+i
         J7DFJcR83r9Xw==
Date:   Sun, 20 Jun 2021 22:59:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.de>, Hector Martin <marcan@marcan.st>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Ensure that SMBHSTSTS_INUSE_STS is cleared
 when leaving i801_access
Message-ID: <YM+sKYD+cbFy7BlK@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.de>, Hector Martin <marcan@marcan.st>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <cefbeb76-5f7f-036b-fa0e-1e339d261c35@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E1gSNDSPp6RELfp7"
Content-Disposition: inline
In-Reply-To: <cefbeb76-5f7f-036b-fa0e-1e339d261c35@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E1gSNDSPp6RELfp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 06, 2021 at 03:55:55PM +0200, Heiner Kallweit wrote:
> As explained in [0] currently we may leave SMBHSTSTS_INUSE_STS set,
> thus potentially breaking ACPI/BIOS usage of the SMBUS device.
>=20
> Seems patch [0] needs a little bit more of review effort, therefore
> I'd suggest to apply a part of it as quick win. Just clearing
> SMBHSTSTS_INUSE_STS when leaving i801_access() should fix the
> referenced issue and leaves more time for discussing a more
> sophisticated locking handling.
>=20
> [0] https://www.spinics.net/lists/linux-i2c/msg51558.html
>=20
> Fixes: 01590f361e94 ("i2c: i801: Instantiate SPD EEPROMs automatically")
> Cc: stable@vger.kernel.org
> Suggested-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-current, thanks!


--E1gSNDSPp6RELfp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPrCgACgkQFA3kzBSg
Kbb+JBAAgY2LFVu5SW+DdfBxGpkcSOPsU5bp76RH3tPK42QAzcqsOse1L38qV2J+
vgKCf2PAJgNOXGYbywYJb56x+p4M4G29OOLKQhj0GvYgGkk3KuWQ0uRMGOdPR/YG
v0F5B9EUumLUH5ybMWEWL2dTJ0v7xEWr6HuqypZJoKSNR6PrVtrjaQw45E3kCYc1
8BLOyvkkWw8t47keZUsatSWy2+z9EglJGpns/vRwdPT7MtLEZ708ScKH9vk6QQeI
iLTyM87T/joHF7Mmu0n2HCwpStQmK08ITqJgmXWYI8jX1bA7+Gue8AFkhohx6cfQ
haO/J34ivM+ITmzvzGryVVjpM+o3gpbPKX7U195P2hL5TNTPvIpF7W/YUOHoWcIs
YkkQqyeM0wXMFHwK1EjfE8nrgmKoUQD+pyCDVySDGtKUyuyMwP4foevQ2Dz5tYW7
gPdkrXQktYhTwPY/VvNI3IDP1PJ1gNJ10ijWtG4IazHEyNdRY1rm/o7ryYdWEvMC
iMfqyKxRb55b1rF2Lmu+ySHR57nJCE+hVJktm1dJY35tiyTSaT0bXRQiH3PRXIJG
9uNfQhxIKR2F75JkDqsYdpi7DnPnaiCh5kYOEDHvOgsHa4kAkoTBJE3Z1aBEJy9Z
HV06EN7VzLECUO+8b+JS5bU47jXt8uGkWLOZOnPWgd4XIHNRCDw=
=g3xd
-----END PGP SIGNATURE-----

--E1gSNDSPp6RELfp7--
