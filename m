Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB6A16CF302
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjC2TUG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjC2TUF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:20:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F42135;
        Wed, 29 Mar 2023 12:20:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54BD4B8241C;
        Wed, 29 Mar 2023 19:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82966C433D2;
        Wed, 29 Mar 2023 19:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680117601;
        bh=JIWfpySDq/fAMfCAGE0DghmM+eBV3wrow/0afr4oqY4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r8edZRPS63drSybxKbPBnJ5SGDvGfM/XmXNkwVuAaMQaOhFc6ubW6JhGmL76Xnbh9
         qzLm22U4f/H3vihskD9sYWSxCLGkA9zH7jnB0/gvz+YO8FFRoh7S35TcNEhoDofT2U
         bVdS1id/P7xpzO3S1nSv0JCI4g0lOSKb6LWo6TPm1PUNpZdAyHlZCYyvdK5odmRBi3
         jCOKOYFbVaxL870Il0/wNNeT8duXAqTOhvU0rgZMUAGlmJi2kMNQCYICCl4gJUFJtR
         G/muyjP0l7l0qIfA2Az4EY3Ru4EZccDj3RtNC89wc8Xk4D5reUuLiDMvlh+9qAaYbL
         jirm1rsYvdJyQ==
Date:   Wed, 29 Mar 2023 21:19:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: cadence: Detect maximum transfer size
Message-ID: <ZCSPXfbfN9/FmLA4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230317145441.156880-1-lars@metafoo.de>
 <20230317145441.156880-3-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GiOq4c6oqa/zRcCv"
Content-Disposition: inline
In-Reply-To: <20230317145441.156880-3-lars@metafoo.de>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GiOq4c6oqa/zRcCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 07:54:41AM -0700, Lars-Peter Clausen wrote:
> The maximum transfer length is a synthesis configuration parameters of the
> Cadence I2C IP. Different SoCs might use different values for these
> parameters.
>=20
> Currently the driver has the maximum transfer length hardcoded to 255.
> Trying to use the driver with an IP instance that uses smaller values for
> these will work for short transfers. But longer transfers will fail.
>=20
> The maximum transfer length can easily be detected at runtime since the
> unused MSBs of the transfer length register are hardwired to 0. Writing
> 0xff and then reading back the value will give the maximum transfer lengt=
h.
>=20
> These changes have been tested with
>   1) The Xilinx MPSoC for which this driver was originally written which
>       has the previous hardcoded settings of 16 and 255.
>   2) Another instance of the Cadence I2C IP with FIFO depth of 8 and
>      maximum transfer length of 16.
>=20
> Without these changes the latter would fail for I2C transfers longer than
> 16. With the updated driver both work fine even for longer transfers.
>=20
> Note that the IP core and driver support chaining multiple transfers into=
 a
> single longer transfer using the HOLD bit. So the maximum transfer size is
> not the limit for the length of the I2C transfer, but the limit for how
> much data can be transferred without having to reprogram the control
> registers.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied to for-next, thanks!


--GiOq4c6oqa/zRcCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkj10ACgkQFA3kzBSg
KbYk9hAAghutWpgZ1GRN8yfcQeuM6/8wUMELs87EN/Al0vw+7eNxxbNHkTEi64j4
iMHhutrJhieCs7lrbhoYVkp5CHHkw/vJDBb+Riohn/IcNfUo7WfFTUJ9Nz8Cm5oR
yy3aN978eg/Q0e3MvlGjapqfOzhYqq+yEarf93JfhEI3PQvrxIlyWudsjUnWotOW
qsCIfLS//L0SfvX8rc4WwWf2dbm+yDCrEF6HA1NoerHwtpsgxgDEobUHVuASOTmh
7HaFR2O5b4ebisU9bzQvliGuWQ+4oDoUwXD9qUT0gC+AojZejrTJCKIFZ1Teqvv/
FHpMhl0vcKtumHrf4Uy73MVyXQODJwIgqgDx7MWry9U5UscrJEUx3dWd6ivteDYd
XgXO85TwPgj5G9GwIIY0IBIxABxeYuY9gN/1kZ7Q+TUE8Q3xW9llWvWSzQwCpPhV
VRbcmqGaVBW7qixe4okPCO3J0ElgR4gWPKIHK5pYhKOyPMpgWryeKeTBpJlwB5lt
DWLWsjANBwavB3jeMft4yiM1lAFes/z0It4moE5afGDQRDr5JZBHe2pNg9ViWN7S
4lNpyJPh+ZDZM2NRwEisI5oBrmiYI5Z4SmPHkuN4ln79IPovCjAbT30e+UjrhjzM
XYl67U6mXP77xmlVH7a1o0ixK0Df1yyLa8wiSRvbqh7nze/4dzc=
=2nfL
-----END PGP SIGNATURE-----

--GiOq4c6oqa/zRcCv--
