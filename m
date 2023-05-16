Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBFC705900
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 22:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjEPUlX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 16:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEPUlV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 16:41:21 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DD62112;
        Tue, 16 May 2023 13:41:18 -0700 (PDT)
Received: from mercury (unknown [185.254.75.45])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F2AB6605902;
        Tue, 16 May 2023 21:41:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684269677;
        bh=C9zDqyuOb63WjaYQL4pSv774nnw1AN03fB2+IgNujDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BSHGgGTAPtElpz2DMg1YB3AsFPEtc6bFiMHdgt47HXaPmi4QZa7POQMs/rj4nSTxZ
         74uX30i7bu6xoAtdbOsVlZ3jvci8fqGBr7Vk7gPE/x9aZ/IDMYQX1K1+cyEPZ0HlXF
         2APD2YiRmzvLea+cszomdYj6iXe7tOs6a0bp5os10rWXDwuAR3TUqzGpWOkEB7CaSc
         uFNeb4GGd3eW4ed9acaX4zSBNveCGcy+z9fhjLiFDFVCTH4gIzMxsVoVaE8leJ1V3b
         /O4DBw9oIfBmZxsx//BKJqB2LGVWLuV3BdpSd61N1dEddN8JTYD5kj7O+Tq9vTNQl3
         egkRQa9hb0uuQ==
Received: by mercury (Postfix, from userid 1000)
        id 5C5B610623DF; Tue, 16 May 2023 22:41:14 +0200 (CEST)
Date:   Tue, 16 May 2023 22:41:14 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     heikki.krogerus@linux.intel.com, rafael@kernel.org,
        ajayg@nvidia.com, andriy.shevchenko@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Evan.Quan@amd.com, Lijo.Lazar@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH 1/2] power: supply: Use the scope of power supplies to
 tell if power is system supplied
Message-ID: <20230516204114.vv5w2vmcyulmhmm4@mercury.elektranox.org>
References: <20230516182541.5836-1-mario.limonciello@amd.com>
 <20230516182541.5836-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="loy7qsitjthxsozd"
Content-Disposition: inline
In-Reply-To: <20230516182541.5836-2-mario.limonciello@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--loy7qsitjthxsozd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 16, 2023 at 01:25:40PM -0500, Mario Limonciello wrote:
> The logic used for power_supply_is_system_supplied() counts all power
> supplies and:
> * If no power supplies found assumes AC
> * If non-battery power supplies found uses online to determine AC/DC.
>   - If any are onlined, assumes AC
>   - Othewise DC.
>=20
> This logic makes sense for desktop systems that don't export an ACPI
> battery, but it fails once you include a dGPU that provides a UCSI
> power supply on a desktop system without any other power supplies.
>=20
> The dGPU by default doesn't have anything plugged in so it's 'offline'.
> This makes power_supply_is_system_supplied() return 0 with a count of
> 1 meaning all drivers that use this get a wrong judgement.
>=20
> To fix this case adjust the logic to also examine the scope of the
> power supply. If the power supply is deemed a device power supply,
> then don't count it.
>=20
> Cc: Evan Quan <Evan.Quan@amd.com>
> Suggested-by: Lijo Lazar <Lijo.Lazar@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Good find; the current logic should also break with a desktop PC
once a POWER_SUPPLY_SCOPE_DEVICE battery device is attached (e.g.
a HID device), because it increases the counter.

I suppose I can just apply this to my fixes branch since there is
no compile time dependency to the second patch?

-- Sebastian

>  drivers/power/supply/power_supply_core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/sup=
ply/power_supply_core.c
> index ab986dbace16..d57f420ba8c3 100644
> --- a/drivers/power/supply/power_supply_core.c
> +++ b/drivers/power/supply/power_supply_core.c
> @@ -348,6 +348,10 @@ static int __power_supply_is_system_supplied(struct =
device *dev, void *data)
>  	struct power_supply *psy =3D dev_get_drvdata(dev);
>  	unsigned int *count =3D data;
> =20
> +	if (!psy->desc->get_property(psy, POWER_SUPPLY_PROP_SCOPE, &ret))
> +		if (ret.intval =3D=3D POWER_SUPPLY_SCOPE_DEVICE)
> +			return 0;
> +
>  	(*count)++;
>  	if (psy->desc->type !=3D POWER_SUPPLY_TYPE_BATTERY)
>  		if (!psy->desc->get_property(psy, POWER_SUPPLY_PROP_ONLINE,
> @@ -366,8 +370,8 @@ int power_supply_is_system_supplied(void)
>  				      __power_supply_is_system_supplied);
> =20
>  	/*
> -	 * If no power class device was found at all, most probably we are
> -	 * running on a desktop system, so assume we are on mains power.
> +	 * If no system scope power class device was found at all, most probabl=
y we
> +	 * are running on a desktop system, so assume we are on mains power.
>  	 */
>  	if (count =3D=3D 0)
>  		return 1;
> --=20
> 2.34.1
>=20

--loy7qsitjthxsozd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmRj6mYACgkQ2O7X88g7
+prYYw/+J1BuDhX+ZFGDR0/voAC5dCfIpZGidEQyTgvGCXkk3ZoQr/saqgv5SwPf
ED/OgJSCJWV/gvj8QTbdtFoEkWia30zwyjEw4Ny1GiOHq9FidHhMo4mUaKPyCr79
p4EBPSLcD8EQlD0iQT3Gz5rEDm4qb43GBa/HT4odWpkd/AM1H0V9hNeXTrWB7F95
SgAI7tru7pP9nhHszkn2phhX0AION0IszUhI3Eq92VFPojyPk9akh/HVtTPF4UbZ
5pXoDrzup1Y46xlxB3lP7l0Hvy5HpVPYtevp350hvPB44ymvgfQ2XRjoPCQO/a8a
uOudiWg05SFb7/uyp3+4vTGJKoWtZ96DWIX2Ihw6b2f+3atPSBNZaHZ695rJrPT7
v1QXz8k1HViUAKxqFMWo1LMuv7pT5B0Iphyujr1RD0WyWw/Ib9UMTkmu6ZGkcu3/
1Looi7Fqnfmd6lXjkVZWbgXmPLyaaRlviObAa/5we/MLWPPxsFCIJSAW7dbULpcq
NTHviGtf/fUIAIhiy/hphCKmXMMjINsEjleHOjD8+GrMXEp3zvbl+nocrJA/v6K6
2d48jfZnEheRyJAGkY8L2NibU2q61ABianuuiPzFbokxwoWfvIXwXPVpUNrHyR1t
/GbgS+V1RmgP0wYzbXgPNkEVz8zXNWH53QH/z+zAIPwJvDj7DlA=
=GZta
-----END PGP SIGNATURE-----

--loy7qsitjthxsozd--
