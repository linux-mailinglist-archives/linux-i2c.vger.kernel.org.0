Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D7D46EA39
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 15:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238829AbhLIOqd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 09:46:33 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:48932 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233886AbhLIOqc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 09:46:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9B60CCE25F8;
        Thu,  9 Dec 2021 14:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278E8C004DD;
        Thu,  9 Dec 2021 14:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639060975;
        bh=5sYKLdatVEeqw+k9x1l+DqDRM33F4Pw6XW6oGbdVEGQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=boAfB6+7zxF+T9Scu4vRMT4bTp/2BPbZ3KOREh7W+2k6UwwYSXeETAOxJxSkn0rFN
         A3bU7NMWvf+SqqXKQ4H4pJhpWwdwmaFmkEaa9wmWWB5jvYkiISMx6BvEh8UhBxKpmI
         fU+mpX8GAs9T/R9esfd0U7mbz2ke69Ic+tw+jaWg3b6uaQ/4jRdQTPg3favnUngc98
         jetZy2vVPrSBTGGO12BnLFLGI/1IJsZ1aWJ6DAf4ttnRGOd22K502EMWvRUd0WnTaz
         of+ez2T/mUiLWh4VJb4zNUaByYz4PH8FxC9xo/57GzzxVr8ba92RrP+RGr0Y4mRT9M
         GUfvYmBVGVeJw==
Date:   Thu, 9 Dec 2021 15:42:52 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 6/8] i2c: exynos5: Mention Exynos850 and
 ExynosAutoV9 in Kconfig
Message-ID: <YbIV7NJdakfRE3pg@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
 <20211204215820.17378-7-semen.protsenko@linaro.org>
 <CAPLW+4kCH7Z3ZJrYcHtjMeq1_mhPg1FusBQb5KyV2nvBc60n5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="meM80/YF6RpjsyZc"
Content-Disposition: inline
In-Reply-To: <CAPLW+4kCH7Z3ZJrYcHtjMeq1_mhPg1FusBQb5KyV2nvBc60n5Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--meM80/YF6RpjsyZc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, can you please also take this one in your tree?

Sure thing, I was only waiting for a resolution for 5/8. Will apply them
now.


--meM80/YF6RpjsyZc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGyFegACgkQFA3kzBSg
Kbb6XA//TOfZhGOFAhxfFYDMWx0bsuoF64lEsWK9a6Nd9vshXttDQ8Ed/lxkxtol
qVceM/idbUdkIDtl0C8cAKI8qIzmETmz0rGP9Z0xNOYJ5/8WZ8Bgb9FoijghCsBT
OovMyv6QXMEKfBeIAaiGQeufBa9dd+StqLC0OzTDS/aBcnOnmE+VDXEqWU8eL7Pq
XvLAqFllvXCVhogJAnFZ86TbuuCPSrki6F82uHMshcjQ4ckRp/lz1PyN+AMKQ2En
83cHAslT4UQyEErbi2CRYxE6aTV83U4PySYcbz51z00JfvqS0Hx6MK+5BpL1Td9m
B21rNuv9JhYPnWnEp1+7USa/gfjKZYKOw3te/pFti4HX/PGHj/Qivix+ik/btvRo
fe9gxONDgzoj7N0hzIYBjjJcA/FCnAH2aGtyGBwPDVlxC7CDzcGYED8LwjXxFxbI
/6z0Sfe4E/BF0V1BG+gaGiqcnxE5I4OxfiPUAbbrl7JvrKWcN8aTa/C1Aq7BRsSe
wrvxt0WpPqRzIBuCAagPA+0EIXdwsts7oJaktEQtqxecPc9V0CMtffVTuu8R6gK7
B12FHeu064NKO6z+Z6kaDvECpl/CzfzKEbNJfqy2WKK0xZ/ZsGlJ5LOc3DjBNwAD
L5eh1E8x/c4mo1j4c6bcxN+mU/uogn+wFWEJ23lna5XhAU2Px/k=
=LEmQ
-----END PGP SIGNATURE-----

--meM80/YF6RpjsyZc--
