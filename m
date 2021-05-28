Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB6D394762
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 21:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhE1THR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 15:07:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:33254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhE1THP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 15:07:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53258613E3;
        Fri, 28 May 2021 19:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622228740;
        bh=lqi3vTldrg3lO2uMoy79gkn+ZcxnYUyNsZ59gzqQAQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PVpoQi74raVze44HIFtMvfDSSFlIhYshwtx9vF0D/KJKWC0busEzp5ix4pv3953VB
         RT1kNi4j1auGPUMAsLHR2gecAz8jnQfL2y40jzhDcn8vvtlU6WbbbjjJdWC/BDuBtV
         CFvXyglRZoHJhKIbTsuAKON9gvZiz8dYr8vb5DXbrwNz1AWmcxMzwg+csCTmjMEIKz
         RRB4YIeKRIZ0rHH4gd4TOUuHCd3iD90loJdtBwXHLTT1DOOWX7kAsNNRtHN6XA1xZE
         RG7Xe56Gd0k58/8JALvn0njtw8A8Yr0A5+8Bx8rdcknbJ4nSdkPTy9RFhBWmLjJc35
         uvXI/sfgKKl6A==
Date:   Fri, 28 May 2021 21:05:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <khali@linux-fr.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v21 RESEND 1/4] i2c: core: support bus regulator
 controlling in adapter
Message-ID: <YLE/ASUV9vNWxKU4@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
 <20210527075556.1709140-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZcBwgiaQRAiB+3tH"
Content-Disposition: inline
In-Reply-To: <20210527075556.1709140-2-hsinyi@chromium.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZcBwgiaQRAiB+3tH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 03:55:53PM +0800, Hsin-Yi Wang wrote:
> From: Bibby Hsieh <bibby.hsieh@mediatek.com>
>=20
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>=20
> We can control bulk regulator if it is provided in i2c
> adapter device.
>=20
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

It looks good to me. I have to admit, though, that I am not a PM expert,
but I trust you guys here. Let's apply it and see what happens.

Applied to for-next, thanks!


--ZcBwgiaQRAiB+3tH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxPv0ACgkQFA3kzBSg
KbbDAQ/9EHqJnm0ee4GH2yEYDaqegGNIzj7KFvtNQVb9I86E8sJgTda4xocrGxu1
5y1fUo/jWXBFiQkfZpwSMAKhhh9ZLkFwr/sOInd/HzLoYkg23E1GdXP5qwm1CCtC
P6mDHQ6q6bjpXnX1y2s1tL9hgc9n0WyUbHw6y5PA5Ecrnc2BphnPUq+eyVm4CcYe
mIZV40uS2jX7lothPyypA5nAtf2OxplnNrVHpW8QNcg4GcdEfApJikppvOnmH9IT
K1dY329k2n8wt6qiHKKepLdq+g9fDlaYzw1Rcum+3JIdqzMM4w3h5/hKsBf7YsG4
hdodoTEKZGg3jbp+bPYSP1igLJtOrSgb18FNpTcG3/paczxkVE2k8+YRBbl4YMfV
pB6u7AI2QYofPthhQMUCkqR/UC02+i4XE3ayZrOveZ4RBMMtHO2Qx7wC+08gUwnd
0EFNeUnW5xrSZph7Hsucjfkuu87kY3a4zTCPqgPZblXz5CFCnNT/ko4hgC+ogjRn
epaQpCFSDFexQZ5YgPJPqFDlItG3sEHfi+mWguGX71grM22x9Mi6MsPQsS8qIe6K
IUYzYNa0pbEys5dnsYvi8bxG1Ta0kSvA6uBYgAZv6UF/aVj4VY6R4o9Vjz8pMYyz
8m2Vc5HWoS4swVGOl2ukrixo+yZ4oH8UwIGcNlFRctw7HCyKiPo=
=W39l
-----END PGP SIGNATURE-----

--ZcBwgiaQRAiB+3tH--
