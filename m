Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445F13E8472
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Aug 2021 22:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhHJUjN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Aug 2021 16:39:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:42008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233083AbhHJUjK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Aug 2021 16:39:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3D2660462;
        Tue, 10 Aug 2021 20:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628627927;
        bh=3v1C2pVzxz8nVcXwxb846InW7nHhF7yawMRQv1FGnAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QkUE4Oxbg1+luP2bI431riss1k9fpXjNthHUWtX0m34dU+9xaxPeQAdl5lTVwp4RH
         UYd04vlICp6YhU0eb0uC0K9BIl11KNDW3icgkCJxfpah66ql5tS8MBgfE8VHLKznFF
         w4oilGOOk/ZC1Ss5IbnrGME7yk4LIdX0FEQ0xBCivXzRULDQS8rlDxDiHYtcWxw2OK
         ByoceJjIyqA5oraU70I0+DlakCm9fPfmonsWuBdRQmrZc8sgNsABQYf0tblCoRB0+M
         U9CUVFU9WOAF+a428AYNYlaM54N8P+bYyZp++jGK8JGnI2lNQBnIpv5M/6vXJf3dqX
         mtqJ1eW3PcFqQ==
Date:   Tue, 10 Aug 2021 22:38:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 2/9] i2c: i801: make p2sb_spinlock a mutex
Message-ID: <YRLj1HuExOxa4dVf@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <90aee333-6490-db08-01ae-c0de1e18368a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lt+f4GZL6Ci2gWGX"
Content-Disposition: inline
In-Reply-To: <90aee333-6490-db08-01ae-c0de1e18368a@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lt+f4GZL6Ci2gWGX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 11:13:29PM +0200, Heiner Kallweit wrote:
> p2sb_spinlock is used in i801_add_tco_spt() only, and in process context
> only. Therefore a mutex is sufficient, and we can make the definition
> local to i801_add_tco_spt().
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!

>  #include <linux/platform_device.h>
>  #include <linux/platform_data/itco_wdt.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/mutex.h>

Can you also sort the includes while cleaning up the driver? Then, it is
more obvious that mutex.h was already needed for acpi_lock. That would
be great!


--lt+f4GZL6Ci2gWGX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmES49QACgkQFA3kzBSg
KbYNdg//cYMkPKcEQ7aExtf4CUT9nr6oK65Mr1mL/KbZHrSwHZDU66geiVxwtqfQ
+6cj7lwKGFi1kMJhbud8E+nXr4d8fqqr8uQ1snPyDAy4XLiddavlnbgHI+4WfH10
SnmQJHEUAtPBMaMBHaIvJ4W4lgxtdQy1Q/CYxRkgiNUZpgHeW5eR64K0EzuCgtzs
V5O0k28cHcTT3IjOTx+xrXMZUeZsA0KB3U4we0PJbscyWLAaH9Kv8qnTkV0QKoWN
BVWw62sl+crP+bV9jm70zraYo2Axs0phputL66WhymFUOZeyiIWrMBOwSbOcoX3N
8tihucmhKdnSQOm3vniTxbW1YMOsJ8SOzt6RndNduweB/QXkK95Va12vc06vBHkh
rNa/sXQK/GPHWVKmt4LV+csitgMxAKaQlJeLo0TCkeX/nTV8qEIEXaQPIyRCUFHe
vVPiZ03rJN020S0UVr4pTcXzFvi9ZPyTE0mu1fJFl5+nsheohRxviHbhqqyAcKb9
U5J/1pvBt1pMAwjsPrp5Y2aX/cVpfUqQqjpq80cmhfqVq0DyDKy6DXk0a17paL0L
aCK9FhIw6Ds5/DzaLLDXaFnA1mQnl+OD77olD6NXBS5MI8BO8qJFpdYfHaSKO3w1
EtxWSRM8EFuBxiaf2kV2TlFHoqykHcPVIDxMmZlxcEGUzYZ5Hnc=
=HOBV
-----END PGP SIGNATURE-----

--lt+f4GZL6Ci2gWGX--
