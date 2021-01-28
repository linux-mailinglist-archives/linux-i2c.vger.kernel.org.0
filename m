Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89B9307203
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 09:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbhA1Iu4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 03:50:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:47912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231433AbhA1Itx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 03:49:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EE0664DBD;
        Thu, 28 Jan 2021 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611823450;
        bh=+rgbJKufy26IHZu23xm+S6i1LOemte3QUajMr6KqkX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NKjBgvzoxwUeYfuVdsae2f4pSsudS2RzYlOG2GwZDxFdNqrQci7EspyenbiEdJTAl
         8+sjOAlak3fxb31H992DwFPIVzWrHDF6UI4bOOmt/53IV/takh96anpHF2jSVlCYpz
         v4yiIGFqZFKsfVCpQT/5Z0Z+Y007uYt+791ztFBtUK4D+EMgult6jpa2DnLnGhGf0B
         1uvRi7tKQCNhII8ojEV3OD4JWft7hCFXSc9m1V8ewS3Epr2WCooWC2rIybHuHYgmSk
         1OQjALtGG6kR9JEC6WtwR+fLICJuqUYQISgwBHJXZPtYQhJhEsfHUusaAMhmr4BTeH
         3V6KZRM4R/N5A==
Date:   Thu, 28 Jan 2021 09:44:05 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 10/20] dt-bindings: i2c: mv64xxx: Add H616 compatible
 string
Message-ID: <20210128084405.GA963@ninjato>
References: <20210127172500.13356-1-andre.przywara@arm.com>
 <20210127172500.13356-11-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20210127172500.13356-11-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 05:24:50PM +0000, Andre Przywara wrote:
> Add the obvious compatible name to the existing I2C binding, and pair
> it with the existing A31 fallback compatible string, as the devices
> are compatible.
>=20
> On the way use enums to group all compatible devices together.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Wolfram Sang <wsa@kernel.org>

Applied to for-next, thanks!


--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASeVEACgkQFA3kzBSg
KbYF1w/+MCKCR5WY8DgISyJtBI5LweEOVDKugSqgJOKJzX7kBGj28nw6YeTFmYx0
wPb5LjgKr45odH3Gq5IGXJFd+zD4UgNNYnIUV6ThymiVZCVOrfD64wES5Kijj0wb
4WfkcCTVDXwR6Y0FGvwrBR6nix+y55xgWkIeMrfX8+Do31NO/u6Ovoj0+7+xJdbg
9n0jdAy1ooatJgrNcWJZlAWYyXAk/ziRyFIkGNWKe2Thpa9aGBWRrKLw4lLqSzpZ
uBq7VMm8SRLAlLVQr819psInJsbIawer9EocIlAPkooaB0hcGig7hv5PCjRexf/f
7yALoXT6S7SEUhZQPl7Jl748DnVAlS1hEGZUUWb7whnpqL6jYWSvuNbr51igb5C7
GsIv40s6NbsZnL9uTk0sDWx/MfwZHPJo7ZoItW0WBDEQ72ymJDQzRPqNy+qE2s0y
2bsea+u459iEtZKoVij8XSNp7kPVi7jTCDw+cDtkRU8UYAgt/6pFX1CwiefNZ9Ce
0blfjhr5do2/pTvzfKZ26GBOPAIHkIsPYqtOvkWG2a0Fo2EUanIJV0RkOuP3YV8s
ruXDyAvTuX0uRac4Oy//NNSCYdDLsOr/AZny7Ub9jkRLTDfdQns8YgVzmH6Xr2qh
ydsfuaCcrUyUml25TOMBc3ta78kCuKjpkJsFrb5adUd+1JuRapg=
=PojC
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
