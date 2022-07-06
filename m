Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD6C56929E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 21:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbiGFT2m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 15:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiGFT2l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 15:28:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D637E1C926;
        Wed,  6 Jul 2022 12:28:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 72E3262095;
        Wed,  6 Jul 2022 19:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E76C3411C;
        Wed,  6 Jul 2022 19:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657135719;
        bh=uwG+1CitE2piA97muv9vt6iTl0bsdOymgXHEbkJNXow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R/K5znm4it0BtlyD7fV+8uAfk79vFS9nve2y21ZzBAysD/xiw5IsrMmqRTN/rSL4p
         jAhsc0C8RzavTe4Rx5gxLvZSe1yX+K0roBUfalliLpLqeByxa5LGYc8U5YhzddaXQX
         EThbaxpTgCv3+UCEQA9X0PzBW+FDMxZ9XiBpOage4luZ0i3TUilPSwDpsr60ua0KtU
         fRCX94jEROBmV6AqoirjuPmJqQbVbAuAX9Sh/Jt8v22JgLWEi6fRNsPiPhwxnjv9Jp
         aTNFdKYouR/ZMqEF+MHlJruNubIlfLmq9X0Kc+fix1UEPDjpi35R3drAMj/Iiy+LQy
         5Dr6gS3+8sFzQ==
Date:   Wed, 6 Jul 2022 21:28:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mv64xxx: Add variants with offload
 support
Message-ID: <YsXiY7aT4X/m2nWP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220702052544.31443-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W7otrsCSuiGI17/i"
Content-Disposition: inline
In-Reply-To: <20220702052544.31443-1-samuel@sholland.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W7otrsCSuiGI17/i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 02, 2022 at 12:25:42AM -0500, Samuel Holland wrote:
> V536 and newer Allwinner SoCs contain an updated I2C controller which
> includes an offload engine for master mode. The controller retains the
> existing register interface, so the A31 compatible still applies.
>=20
> Add the V536 compatible and use it as a fallback for other SoCs with the
> updated hardware. This includes two SoCs that were already documented
> (H616 and A100) and two new SoCs (R329 and D1).
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Wolfram Sang <wsa@kernel.org>


--W7otrsCSuiGI17/i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLF4mMACgkQFA3kzBSg
KbbL0w//VAuq1mehyF2EBqeOXhdhsb4yiKfwBRHPAq43PVdwECXbcDCBEo2XZT2T
4BxhF7I7MJ/TIvau2shw3az7kBGac+ZweyxDFMrC/1NjJG0ytvmBHH2xZEZFDjCh
S255kBLsnMNuq27+SHhO2qVGMHOKU/Qp311jd6zMK7twOFBmEZIuTDHOqS6fHQat
uIiIrqcOb5bRrVGPzosql5DR+0KoJ1J9ses0AhK6UeKGSlqPz94GzeKFQn5k5S3L
IA5E+q2J2K6IMq5sX+rEVBm+Tmojb17ZNhwY1yXpoJEBx1Gbo8fTZosUfeent3yW
uvabaks07g2YBr0YiBC64XIWYs4OmH9spaSN1rUhh6IpUWgOA9j5ZlKVUqpUcIZB
VG8RIzDpZnp7SSOVWKKvXCMTO6u6fEAlt31ly9U1T2BzXP4k28skd1W4YVKppLD/
LeZX4NxDpN0mTNYBlUlEfXbWlo9iMRNMk94QGC6JRmVHEl6Lvo25jtwlk9i/o8n5
hEMETlTL+wIKEdiES1U8fRkZjkOkBmCZl2xMEJXSlwmaxTyJgznSmNvca+HKU94C
aAzAM0R5/VVuzGemtfHZpbfwtyUQ+eNosZp2EaOzeiaMYi1hS5VVIFcJx0zm1J8l
lGuz+D7qx5FfNuoTUbGHGZfa4MlAFDklYmdDMzOUeGXpmwd4AC4=
=y2UY
-----END PGP SIGNATURE-----

--W7otrsCSuiGI17/i--
