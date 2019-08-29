Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8720BA267F
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 20:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbfH2Swx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 14:52:53 -0400
Received: from sauhun.de ([88.99.104.3]:42140 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727798AbfH2Swx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 14:52:53 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 65D502C001C;
        Thu, 29 Aug 2019 20:52:52 +0200 (CEST)
Date:   Thu, 29 Aug 2019 20:52:52 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: bcm2835: Add brcm,bcm2711
 compatible
Message-ID: <20190829185251.GD3740@ninjato>
References: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
 <1566925456-5928-2-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline
In-Reply-To: <1566925456-5928-2-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2019 at 07:04:14PM +0200, Stefan Wahren wrote:
> Add a new compatible for the BCM2711, which hasn't the clock stretch bug.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oHwMACgkQFA3kzBSg
KbZRRg//Ryv7Zq+mHMTNa3cr8ox0/gmPrj0BRADdaDUn/V4haoxNg/ItcG0N94zf
rBUXZ1IwcGXQ3AiI+5lmEcj+kAVGRPvN1IYqK6MNGEcIRQq8KO9U1xHYesdORiNh
EQRxyJpjGdxXHSoEduhdHx5CLPTAFScj7xVMBiueVNdJWEXO7RvWIJyAfLQ8uTuG
HUGikkBmOb8aTLRvP5ltNJWKCjaF53MH8mel25KyykhdN+oYfZhxRkkxVLd1pF39
mb6olPxLpPPIODm4iLCC88e6hXY8BB08dne9d73vZI3WSgBr2eNYT0M/5ZzNbRbc
elrzOGUi7aLeRGZDeT6noC/rxEIGSmiKBRdrgOT4oKVvh1SvdkZCEq+TTTodHQ3p
RPlBcgyrJp6NtvrV/AjmSwyWrhU5wxMfGbH2K0ALmndlCWSt19AWhOF2jNWAbqzC
sTnbOi4b1oCPW1fSI7hRf7sHu8QB+CAr6plmPFoGdMqxRW8J9LTvNj3xT4Vegf9z
rCzsucbOn1T0d/R80dnbRAyb5LuYj5hOlZyky1GiN2kqCL0ApQ3FGb4Kcxa700wH
0WLciVQAZJqqAf6SW0by/DTtp1FrGcY8GuBxogw6UbeQzeRZEnT9U7WEpkekMTce
zOgMioM3Hw84yQgo5CVDubafVNBQIJ671UCxmwm1prdXI/c61Gw=
=Wx3G
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
