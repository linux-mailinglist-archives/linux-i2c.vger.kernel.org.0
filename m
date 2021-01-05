Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC152EB012
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 17:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbhAEQac (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 11:30:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:40682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbhAEQab (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 11:30:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 705C422CA0;
        Tue,  5 Jan 2021 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609864191;
        bh=rntfB7C5mBvVXgliBl2U7ngampY/9LrSTvoo5JN6PHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S88AqmoJInnEWhe9qFDxHx5FvAYHSp2+rb+N2gfbHNDqaltI/vzxj97J0i6Zl4ZSo
         FrMnv1h7c5jq1+J/SA2CzP53dUx9Ic5a226yVsQDL87Z/TQTi0ydw0WX0Gj6bWEpff
         Bpyl/Wv92pZ60y5kZU+mTkDBRRw0n5k3Pfp6MyjOURgVKFyTCYlDKpmW+92zkIrrio
         AiabCKPbajE3T7uFKNjPkX05HK+As0UcALR8Cs2/Crq2Iy/CX0hUrt7kpGlUCUKYks
         Y3fP0co3+5kMdsvFM/c9iGlnTGd3Eki1+zbIW6H6Q7OPVStS8Z9lIf0SRS6tjSj6fW
         QaCVt0a72co2w==
Date:   Tue, 5 Jan 2021 17:29:46 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 18/21] dt-bindings: allwinner: Add H616 compatible
 strings
Message-ID: <20210105162946.GI1842@ninjato>
References: <20201211011934.6171-1-andre.przywara@arm.com>
 <20201211011934.6171-19-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WIIRZ1HQ6FgrlPgb"
Content-Disposition: inline
In-Reply-To: <20201211011934.6171-19-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WIIRZ1HQ6FgrlPgb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 01:19:31AM +0000, Andre Przywara wrote:
> Add simple "allwinner,sun50i-h616-xxx" compatible names to existing
> bindings, and pair them with an existing fallback compatible string,
> as the devices are compatible.
> This covers I2C, infrared, RTC and SPI.
>=20
> Use enums to group all compatible devices together.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--WIIRZ1HQ6FgrlPgb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0k/oACgkQFA3kzBSg
KbYcAA//fxeNSjKkeAsUP+tmVP+6UOmYGFWuzggJQKr5y0aThBUNYPfWWF/lDRa/
wuzgurDJZhsKyb8BxhgY2Bc/EoPsxWZi30fz2l6YdTLi3NfYoky2LhUECl+JYGjV
MgMCCNdVyLZ8uU39J/PuCBH4oN2gBcuLxmOsiVnXcfkbbWjI6c1DNOxRDJdXx9WU
4YDBk98pbmW7Bxik+11pmF9nncF1HvMQ4MYU+Z7fDvQfwGV74dogLu4Psr0q30o+
zNgU/BPvf/U7DLlkcTz18ChX+v9++OZe0AnEPKMtugTZW1rI28SYvNSGhE3QDXcW
otfDp2FvmbilDX5CtK14mlIi+0mVqu0xx6o20pNVAmx4QTjuDr2zAh+EHJ11kP6O
KEKQRZIP7Wj0NBbaSi/mAieeF/DvH8lK9FNKUFMj8108wNF05NB00KuZ4DFvhpDA
M1IgSiSLqJOokZw9Kbw1coKROsYZcWuCrY4tCLVe3m7u0mE9wHIgXsnDtEKLajqL
Vd7GLY60FVPoF9OMlz2Q2liy4D+gz/NIwKYsrFU87FrMag9Lw0JZQVeH9eqw1akl
ACSHHN3JNDJUIH5g1Yiem+VGAOQSBrz4Lr0sTTHm+OAo6b9q8k7DJtyuwUrUajG9
s26hNzxVo+c5AbLTltlCd9esoPiHr4/zia2oKz8kM6WYsDLwKMU=
=9MjQ
-----END PGP SIGNATURE-----

--WIIRZ1HQ6FgrlPgb--
