Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D71885B0DAA
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 22:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiIGUCx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 16:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiIGUCg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 16:02:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24614BB03A;
        Wed,  7 Sep 2022 13:02:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CB60FB81E0C;
        Wed,  7 Sep 2022 20:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04AEC433C1;
        Wed,  7 Sep 2022 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662580953;
        bh=i5lNnyjtXWJmJn27Py5urxTe6IXY9j5ZKnDCFNTYG0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PFGd/NSHw8YEaJJOR7tkFN5jlXwTzcU/x/ZeIawQPQHFHSLdLZmCnHP/UMjtqEbgt
         QtApJ6eqm1OKNY6rlBmg/TyflH4h7pH25eAoNeBESxXxYEW63X3fFI1z8+7e7Ut2lr
         8cROkL9XjSUD/W1jzTJUPaqmTcfsb6D1YM8+uA3Ag70mCk+cVuLFDFJRXmkbc9b8Xd
         F6yi38B6QnZ7zE0y811tcH9vI1q/uyLElITta/GJ7Vm7iiGNS8Ic6eZW4JXyF9gIfh
         6dhEjU5xzI1B141Ra+XtTsO3FD/JlMET9DUEyCqx7PosVZaaChKLGrIpPMNmHPM1Yq
         UxY+aQVZq9JvA==
Date:   Wed, 7 Sep 2022 22:02:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] dt-bindings: i2c: mv64xxx: Document DMA properties
Message-ID: <Yxj41IrD/WzMSeac@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220830020824.62288-1-samuel@sholland.org>
 <20220830020824.62288-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rn7f98v4cUvWaQJs"
Content-Disposition: inline
In-Reply-To: <20220830020824.62288-2-samuel@sholland.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rn7f98v4cUvWaQJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2022 at 09:08:22PM -0500, Samuel Holland wrote:
> Allwinner's I2C offload engine includes bidirectional DMA support. Add
> the properties for describing this in the devicetree. "dmas" is optional
> because not all instances of the controller have their DRQs hooked up.
> For example, R_I2C0 and R_I2C1 on V536 have no DRQ number assigned.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to for-next, thanks!


--rn7f98v4cUvWaQJs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMY+NQACgkQFA3kzBSg
KbZAiw/+J2yhbseTTo5AOFkGKns7ZfvwXDVCQmYWPmc5fD1S3OAn0VfUujMVKLSa
RMHpMPT2ULliNHTDia4KniCKyRh6iLc/gK2tZ7QzJnyilFXzWzKUfFKXS/DpR1EB
ASVeXMVTyle7NaAwGt7J1aNrKc6ODgnTMdk85uDcxOYArLmK8dYiWtw9ZlGycFZE
gifRFlqjGG4HhXSok/fLyT2sLxLm0SWArs4cyX9wR5vOgS/L57DaUmF2A1e7S1c+
J2DX9N7Y6ZUKUNCGfOF+kRMOmIJ/bgujpR7E7pGv0W3h2wkSBWAJWDH9naJrk32x
/kZSrCEVDxm3kRrJMyaSTtNOrgSTCQKYEProJ0e/eZoU2RckLwUZEWY2xL689HNf
Sp7VEZNockVyAw5DxdoqL2iteJQUWsauI4hGeaoeFam3LpSLT+78n8qSwfhbsMwk
AR67wmCZwvU3SM2pYJQLUkMnbo86fPEjxA5qSpArebtjG8ePTa8bP+ies0kemj2s
IfhWL/uRo7TCE1Gcx8ZwRvPa6JYZsNHP9hgXzkYneTduPbxEpdr8GdtoxW8tlYB0
kj9h0SEamcaPfn4REhZo19zKPfJwibu0tAeHaqOSXU7B4ha/fENWpMv5JsVDo2UG
crD5ByPZnKcSnhEKsGO0I9BiSdqWPI/ZosFMaj+rjxfkUFjXiRc=
=c47z
-----END PGP SIGNATURE-----

--rn7f98v4cUvWaQJs--
