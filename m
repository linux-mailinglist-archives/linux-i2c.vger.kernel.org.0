Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44A646F367
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 19:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhLISzs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 13:55:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhLISzr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 13:55:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719FCC061746;
        Thu,  9 Dec 2021 10:52:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 31799B8260F;
        Thu,  9 Dec 2021 18:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FC1C004DD;
        Thu,  9 Dec 2021 18:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639075930;
        bh=H/Jr3TdLNxeHxHNtPWdT/VfKemaRYhozTkxTkPKDXVk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KsOFnWAcwTajHGN5gDdcLtz3RuuPJMVTpdplVDT6SSf9rRFl51pio53CV9KfaDOYS
         PNldMWBFkE14fmnXwjj3MA2V6NZ/pf5qFazMnzFnb7HW4cAzPuxIQUpahnWiDQyd4m
         e69KVnecozzcN8TW7uAYDBAdF3clSb6sF3SCLOnULlmjwyhtExXJXz43DL/2b9zd91
         4csLllfUTIu6KPkMMrs+rYs4zUWrviOZAHI9MV3DVX/FFPZ4RyDt5Fs129M3sfc+3r
         ju+BQrmUqca1k5rAsLYf0mfnlpe568YiUsTzeZ0f7j0sYFGHo+bZz8HNslTwwYeUsu
         5g+SUSDoWGBxg==
Date:   Thu, 9 Dec 2021 19:52:07 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 7/8] arm: dts: exynos: Rename hsi2c nodes to
 i2c for Exynos5260
Message-ID: <YbJQV3kwFz7RR1FM@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
 <20211204215820.17378-8-semen.protsenko@linaro.org>
 <YbIXVw+as1Sj6yDW@ninjato>
 <f0e01fda-b153-9d74-ae7d-7ef0fc2112aa@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YY765/7WdObujyJT"
Content-Disposition: inline
In-Reply-To: <f0e01fda-b153-9d74-ae7d-7ef0fc2112aa@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YY765/7WdObujyJT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Applied to for-next, thanks!
>=20
> I applied the DTS patches, because they should go via arm-soc tree.
> Please drop them from I2C.

Sure thing! I replied to the wrong mail, I am sorry for the noise. I
didn't apply patch 7 but 6.


--YY765/7WdObujyJT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGyUFIACgkQFA3kzBSg
KbblVRAAjO523dWeogRIyI5+aZNPhE3AjLGUDJlRGOwXoWynARkgq5ndtr3HThkn
Hr2N7f3kg/KoEZ4XPu0lOmEz02eOW5tiPzOzvxX6CfNBo4nkhy4S4f0nz1Dt7hFr
dYYPVevJawDzow2HQVliv36LqSIlPOj9v7ZBUHdc4ofyILwsGz32BgzvsdXXlDss
69zR5VwnmNLAN58lDnsyOkcQQBdHnk8gijatTsiP+86/aNJZ7zF4AZWmHysefIJh
AxIihpD1LysGMtT5/tWJCDHEfAR/KWBPpXo6rjTuwQQ4cs77xeaJtrcIC8OAu0WK
edgUFJNPul+PIgzhYgSj0m2q4ZR12cidpzj0rFakqHWC24GIo6mW9r5NkiFkP8Cj
WrAmb2afnqZfLvhbmoBx/OH6o4vHNJxGE4N2JvC6JRTV0uPM6MZ9wYp0ixts6L7f
7rHctg6hR8yI5ivpn7m/yJU+y3bpHXQAV/GLw9UmaNJLAlY2s5OpvTzIpEKa6bAJ
LPZXG3MM0TwyI1TTSIdsuiQR96kUsdYZNS8jI6wcztroNYhp4hqRZgWsbRV67rRl
KcF/vt8SQEgLs5b8tygLrcqFx8hk2Nj/Nzca9DodGl+JXSXnfjf8Rc5CknmPWGVC
BCl10MBgSn1JgGDGnpqvqALOiIf7AqAQmtKeZ9Pp4nOLmC3jDtU=
=GKh2
-----END PGP SIGNATURE-----

--YY765/7WdObujyJT--
