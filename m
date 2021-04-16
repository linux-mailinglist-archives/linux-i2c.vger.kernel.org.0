Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D35362BC0
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 01:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234757AbhDPXIP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Apr 2021 19:08:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:56178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231510AbhDPXIN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Apr 2021 19:08:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E704610CC;
        Fri, 16 Apr 2021 23:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618614468;
        bh=IDLg5GKGHK1OBBMGZDUjHBTnTvdLBaM3NW3skxfvbzo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tPDn90vwb4swV5eJAvT6oklgR13yKUTEQxWwkX7HGQDEOY4zkW8+3jqXeo/ew/Gs0
         /OGjt5QfxgGEdoglxtZcUz1lgfa0iWT1b+eB+C4tdKyHZy6fWrUy2G+cYuHxU93S7i
         CeOIrV6htT7Fwt7K92nW9WoWpTOCA/C5eO62LJ+SxpNFT5wq5ho49Fnyf3hf8vcOZa
         bcTjKk101gN2Y0GEVkNyO17WbF6sjSnZjrftIu97GFTO/bEhtvFDGHwXIHLt3rAuU4
         W++1ktrm7BBqc3f/dJLesNR78HjteScp11xjBry/bIZA0+cB2jAQtoq/2y06urZsn0
         szEq5X3BiiL2g==
Date:   Sat, 17 Apr 2021 01:07:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 1/2] i2c: s3c2410: simplify getting of_device_id match
 data
Message-ID: <20210416230745.GB2680@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
References: <20210415093803.162673-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <20210415093803.162673-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 11:38:02AM +0200, Krzysztof Kozlowski wrote:
> Use of_device_get_match_data() to make the code slightly smaller.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied to for-next, thanks!


--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB6GMAACgkQFA3kzBSg
KbYffRAAnnn3vspVKUrVmBXJemPTwLD++LTh/3irqP6Mjqo3y7FunN2HPLE8DT8G
mLXyUKdATft5Dv1k/rotbsc1jU03ntRlZixVwsp87RYqkiay8nLkvgJd5zSiEadc
BCu/8Ru3t4qTNPTjseZukpl0QCv3flnxy+WkWixwCaLI6+ezafhyVDqPYNZGI0Ts
aMdCauosaO3JMlExfENT8UrHgz4eVKVQUGr0cPOfbQIUc/Bll4qG27anj7K2MvyE
Ig6DJKNY5NktU1MKmk+Kug2scAtwK5S0ieNkPciUz4qEJO6CgUg7ZD2/StcbTi/B
I23yHobCA11QvynONITP0ZAzM1YgYrkXgi0WT5+ylhZAg6jnhZQwp/a4Ey8ah7N/
eYBzAoozfy2Mgng8xQHm3U6cpXuJu2UQmjprqDv+lx7nTK5tdLehDPDhl8RoTKp5
pFxFKWWEX48CZjZLRSLZgZHq1brCwL4pOrhKHYkKiDhFm+QYz7/Qja6BAXd+gUw8
p0wrqC1wpCXobvsw2HKRf6o0YJm0Vi1ylTFdRun0ruK83Jbq5Ll7LcVU+PyFLoMK
4ZKul2jPm3TtoT8IBTwUUH1zdA5W/152oT5tKFLlmy0meduOsG7mrylq6q6O+8bB
V2qNHQUn4Q4RhxU7NAoY61itrsKQR+qLixq2sZDcHgc4GDp41OM=
=xrL6
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
