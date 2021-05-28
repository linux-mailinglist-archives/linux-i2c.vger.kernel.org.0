Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B7139476C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 21:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhE1TKH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 15:10:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhE1TKH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 15:10:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98D7B613EB;
        Fri, 28 May 2021 19:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622228912;
        bh=AEDyA3GATipU4hjbgBy152fdxUujTQ6/M3AzuQDd838=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dTyLo6IPvVsO506QWoyW4La64eQ+DPvauUwVzQuZuhghRJRYN0F9sKgbITYBU+D0Q
         2yPm+4pzvrvPsdBZVfrwIzuDkPpbEOc/Bmd7YrHvaOxfObVWv8nRxMfcpTT34tBYv7
         fJPCh0pTFdDMCvTxaThRVAkljJdziRyOnISWfODNVfVx08Lqx6E3creAP9ktpx/YgZ
         zHQ3MQ1hyw9w9Qw+3sYTAvOYPWDkTd24cID+DcyW3bZ0ceMaH4OQcouylAOFM28eto
         0Wyq0SNe/+7qnvN3Iwpaj/kQgZlSB5oiIPHuuVlJHjVKOWPd8XSzuV7APtgig9t0jc
         qlzu4O89WRyug==
Date:   Fri, 28 May 2021 21:08:29 +0200
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
Subject: Re: [PATCH v21 RESEND 4/4] arm64: dts: mt8183: add supply name for
 eeprom
Message-ID: <YLE/rSP1jBTRVcHW@kunai>
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
 <20210527075556.1709140-5-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jMGR8adNjQ4lPsSH"
Content-Disposition: inline
In-Reply-To: <20210527075556.1709140-5-hsinyi@chromium.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jMGR8adNjQ4lPsSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 03:55:56PM +0800, Hsin-Yi Wang wrote:
> Add supplies for eeprom for mt8183 boards.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

I dont' take DTS patches, but this can now go into -next via arm-soc.


--jMGR8adNjQ4lPsSH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxP60ACgkQFA3kzBSg
KbaBlA//Tm2W+IM6kmH+B+RLRVS97l3JsNwtueEWM6MpariwdqX6ZQ2uZwFqZVMX
7iCJyhjfI+mtGRBsOZW016Mb1Rjokkv+mEBgV6EhhVqzFUCLSRAyhgpCr5/chexY
9sRB/2ogVNDIW89SRl7MGWnt/9tokLy/gP644kNdCksCcvX3d+Gpi90utYMeIy5G
N8i5ZaoAnMUaC14mlCxWuYe4lc7LER/lsuc7LFVXZMQwGJyGEdupVgY56lOnZFHL
xYl8oegikELcjGVV8YQ04fPdm2+1CyF7+dBu4Sj7UNyRSB8tNrDxo24iG8bj/iGj
NCQUnA3AnWLOfG1RsmKkMRg9dTa1CGfQ0xfIR6gXGPLDlebRSR2aC04Z+ImWvKYl
TxAz36CFm7z2b6w8PU9khSP5VNym586Zf2vnYSpMf1t4Zlj/h1OEOB+70kNZ11zM
n6A3PU1Q3E8NTVjhxpOCXA23bMQOIsjAihZd7qS4O6e+4CwRF88DQLWxA4NpAFso
WFWyywyF//zcvsMfXrgSB4ENcS/3yf+Xfz2DyCh85VFWW718PGBzR8ZNzSvkt9aA
Jf+srk4Y+x+7xiP7k2yriSB0QmxsztBt3c/v3TiqeCu62MbUQ+7wnyplJAa+TiR+
LV2IJoOoFCI6+Dg5sFqOi/DsTJoKB6Or9kqdLSfrIieXbVFlrAU=
=D4Si
-----END PGP SIGNATURE-----

--jMGR8adNjQ4lPsSH--
