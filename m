Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A9341CD44
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 22:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346434AbhI2UPg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 16:15:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:51272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346609AbhI2UPg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 16:15:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E91F16141B;
        Wed, 29 Sep 2021 20:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632946432;
        bh=8xaQPVB8PJRhNlU6vdZU9erLdUJD2O0sg/VRyNiOcLg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TNQ/qCKsJ1V1h1qd+n4eHUt2cCRxg7ZrrHht+KZtntYdtwL2TYo2qKBV6wlg+3IiH
         UHSaUzjc2aq8SKaOyVtdsMuidfjxoikGEpckvGDAwPFX0dZ4We/aah0we6hiOKNIEK
         iu1jmdLIZ0GoBRqzwg/KGJ6vQJ3rONlyFu4tkUdjxrwAfrNHHBquFMsP677fu9GKIu
         cj1M1i+/uq5tst9JjgKHRGjDvrWq5RpKWeAtEfdKfve4ujqaJEJyUFdVaD81EvdLGa
         sIkJfpBTQLMW3dHS6odHJFx3zgEmK2agniZSDASQQrp4wNaXjNzWt5yRWymbBjemlm
         pYolU+PIjmHPg==
Date:   Wed, 29 Sep 2021 22:13:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-acpi@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RESEND] i2c: i801: Stop using
 pm_runtime_set_autosuspend_delay(-1)
Message-ID: <YVTI/bkve3QkHWPs@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-acpi@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <515c9685-bad2-86e0-1be6-f9f63578b864@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YSMepRTDEtbVTZpi"
Content-Disposition: inline
In-Reply-To: <515c9685-bad2-86e0-1be6-f9f63578b864@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YSMepRTDEtbVTZpi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 10:33:02PM +0200, Heiner Kallweit wrote:
> The original change works as intended, but Andy pointed in [0] that now
> userspace could re-enable RPM via sysfs, even though we explicitly want
> to disable it. So effectively revert the original patch, just with small
> improvements:
> - Calls to pm_runtime_allow()/pm_runtime_forbid() don't have to be
>   balanced, so we can remove the call to pm_runtime_forbid() in
>   i801_remove().
> - priv->acpi_reserved is accessed after i801_acpi_remove(), and according
>   to Robert [1] the custom handler can't run any longer. Therefore we
>   don't have to take priv->acpi_lock.
>=20
> [0] https://www.spinics.net/lists/linux-i2c/msg52730.html
> [1] https://lore.kernel.org/linux-acpi/BYAPR11MB32561D19A0FD9AB93E2B1E528=
7D39@BYAPR11MB3256.namprd11.prod.outlook.com/T/#t
>=20
> Fixes: 4e60d5dd10cd ("i2c: i801: Improve disabling runtime pm")
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--YSMepRTDEtbVTZpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFUyP0ACgkQFA3kzBSg
KbbbfhAAh+8P2sCioy7vlcpWm2BFYAXbXzXMxxjVDh5gI+261Bgw3UmzgvDkZUGb
iks7ZcSx2OVS6rmZ927I5Smb0H5yFoDhiVt1LO6C2wTsSeES8PNbQX5nVgjw4Dqy
ml5m4Z/DhE1mpAny2kM4ZK0zGLXOmps/9Y/rLqbCcL5fXxsR/3WbBKIqaesb8IEl
xoDqjkDR5ou6z1shuP0oYf1WtBJKmTSQkyTmr//p11Flt6rQz0w3LoBxCGGlfft+
fRa/SEa0Eq2ks5GRehhG00WJluT5qNNbixNwWkukzx84raLXKj8w+J5tIWp0fQ3t
sOXg+3yFnen+kDjJNQWXZQ69wfdOGz3dF7dp5B7a5X4jg2FVXh8x/Oa2qrH/kVjK
23oUyu6uc1U2ohiKRKm4P8hRO3BwkY82vxD9AFPCBjWXokNiq//X+f44E9OFx2w7
2Ke0tGxV6wEt1Bz6vyPS2plZMwVZh1EEtRW7qBXUTwwop6792jViH12abvFmeBf2
upK8KE0ixNkm5MnvHTqtY8wV+xrX1fUAHFnVItEH5mS7nAASiQ7c+9qEpU3XXlZh
jEcF50h+4LPUxcxyTjOYxVR240fnrbku/WvHbXtUx3hjeEqC/qYMI2s05nTilhh1
0XSBqCQ4zY6TCETL7n1QCbC+SNaq3hNNCwco56oQj8+4ehTWVts=
=nK0k
-----END PGP SIGNATURE-----

--YSMepRTDEtbVTZpi--
