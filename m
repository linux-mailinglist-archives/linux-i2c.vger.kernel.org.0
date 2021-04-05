Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86ECE3547CA
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 22:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbhDEUuv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 16:50:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:55884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232860AbhDEUuu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Apr 2021 16:50:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52752613AD;
        Mon,  5 Apr 2021 20:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617655844;
        bh=+wGRlzta/c+bjiOYd0eragT1f7GQIkNEGJwhNvEisXA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T7tkwCweFIZZQHILi2ONZGvApGW1bJSGb9h8KJSwBZXmDtbZJwgliGS/2Tadj+ia+
         QMdXCIRSwsfFb1J5ErA3T90ZEadlPoSsihzT1Kk8kw9Cd3XkVdf7R+AgGIDbh+V8En
         8SsvpeIsmGuiH4KaXgoDGUOg7CJLpbuhIS1s6u99kBoqAQf1C+4cKFSrZtdUBWHayY
         ycwjL89EjSzSJG16AAdlVXkjf9j90w6yDw19zRGku2Ih5qwf6cSArn+weCDfLkJPu+
         yYYYCTW4OPm2cQjVeXeyAALD9rAOvsItpKX1mR5+y4zDfJc2rdKBbS6zxrLmlKOLau
         xYAC8252NMdUQ==
Date:   Mon, 5 Apr 2021 22:50:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH v1 1/1] i2c: designware: Adjust bus_freq_hz when refuse
 high speed mode set
Message-ID: <20210405205040.GC3945@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
References: <20210331110510.67523-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline
In-Reply-To: <20210331110510.67523-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 02:05:10PM +0300, Andy Shevchenko wrote:
> When hardware doesn't support High Speed Mode, we forget bus_freq_hz
> timing adjustment. This makes the timings and real registers being
> unsynchronized. Adjust bus_freq_hz when refuse high speed mode set.
>=20
> Fixes: b6e67145f149 ("i2c: designware: Enable high speed mode")
> Reported-by: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBreCAACgkQFA3kzBSg
KbZijA//XZg/kk/T3SObfzobXjACtyQNCYADrtrwzsso66VX+KoWn030w+vq39pm
5kNYak5j8pY0aFESyx5UCtbI3e4KN2uPR81LfUIFPtxFCTV6NSmo2FrAUktvHgvH
AWgkDYFEvxYWQQlbeKnobFgYbAFd1r37ZTRyVxUC2fyibJAIiFWsp6XnuMOErgXZ
Ni8SlRTOLKEOw5X+810qii9cIVy2mQvyESyTOcAynw7as491s1DB3afPAYY0j/rt
Gq6vxg+GyfihOG6Mn99ML/Iu+z2b0xle1J/2Nxe5IAUSNydOOZMvyy0OUXdUYFo7
ddUQXUbTxD1BW+VPn9S0lw853dwBvB2HTrzJATBD/qjqrp43LU8yq9zWZwBZhw7w
utg7agYkrwMgdV6jeCpF/REFRh8Xk3p+fgtvZxGvOjf6OEBYkh+qi7+PFqKTxF3w
TJ2746Hxwt7M8Oi24EinaMP39r5tLwDdstMvnB5/HdK4WqMMR5ISezR2iM3WKjIO
bimQkDkTPyuwHEqtQ2rBLN95ROmmZeLIP2528+qI4IXQDCkaQJ98aeCG/o6xsSqz
jXw+47XyDPWCQFhbh9MT+3U5MhPaWkCcIKEXo6XJ4E8cpYQrEe+h202dCpWOwIFT
Rv6BUu9qZHtW7T5v0E+S1nMPwQ9gYj04Ken8FFXGjM50FtsFtTU=
=k6+i
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
