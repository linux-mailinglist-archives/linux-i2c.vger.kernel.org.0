Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31B8F705A05
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 23:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjEPVzm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 17:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjEPVzl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 17:55:41 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514267687;
        Tue, 16 May 2023 14:55:17 -0700 (PDT)
Received: from mercury (unknown [185.209.196.239])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6EAFE66058F7;
        Tue, 16 May 2023 22:54:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684274094;
        bh=TYATkcZpn+WF2fVP6g3L/fkTDnNdYXbfzcSxHe1/ToE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oYdOwjbrip9BGlXm6HZ+l0C94cXRf0My31K76qbu4K62GaU/xXohQ66lGxxSDL0PK
         GPV4i/RC1LZbiVRm92vsQy7p16K4jIpiLeMly3Lx9WBoODHsUar/W/rUSyNV3+YJ7s
         ALDtoDy42HA7P+VYSHIMMDWQaGLgKI1Bdn2Irp82PmXMdBwxYPgyhSqgkGFXNgw+Rd
         3SOToyy/z7jA1E7M5pWVq18JE6XQwH2JxzHEZj2ewENTnZJa9NK+dtw1sZXDA7c6Sq
         4xyjdKDNehoBdcvgT+4MDHNXev4mfhWT6WcYX7Yjwb9PKZyYXpCHwHTbeLttmcGEpa
         rzSHuFiCfw4fw==
Received: by mercury (Postfix, from userid 1000)
        id 4A65710620FE; Tue, 16 May 2023 23:54:52 +0200 (CEST)
Date:   Tue, 16 May 2023 23:54:52 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     "Limonciello, Mario" <mlimonci@amd.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        heikki.krogerus@linux.intel.com, rafael@kernel.org,
        ajayg@nvidia.com, andriy.shevchenko@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Evan.Quan@amd.com, Lijo.Lazar@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH 1/2] power: supply: Use the scope of power supplies to
 tell if power is system supplied
Message-ID: <20230516215452.icwx6vb2763hybxs@mercury.elektranox.org>
References: <20230516182541.5836-1-mario.limonciello@amd.com>
 <20230516182541.5836-2-mario.limonciello@amd.com>
 <20230516204114.vv5w2vmcyulmhmm4@mercury.elektranox.org>
 <8cd8d02f-f4b2-3ad3-a3e5-f9857d8519e2@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x7qrij76ovy2qfiw"
Content-Disposition: inline
In-Reply-To: <8cd8d02f-f4b2-3ad3-a3e5-f9857d8519e2@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--x7qrij76ovy2qfiw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 16, 2023 at 03:44:17PM -0500, Limonciello, Mario wrote:
> On 5/16/2023 3:41 PM, Sebastian Reichel wrote:
> > Hi,
> >=20
> > On Tue, May 16, 2023 at 01:25:40PM -0500, Mario Limonciello wrote:
> > > The logic used for power_supply_is_system_supplied() counts all power
> > > supplies and:
> > > * If no power supplies found assumes AC
> > > * If non-battery power supplies found uses online to determine AC/DC.
> > >    - If any are onlined, assumes AC
> > >    - Othewise DC.
> > >=20
> > > This logic makes sense for desktop systems that don't export an ACPI
> > > battery, but it fails once you include a dGPU that provides a UCSI
> > > power supply on a desktop system without any other power supplies.
> > >=20
> > > The dGPU by default doesn't have anything plugged in so it's 'offline=
'.
> > > This makes power_supply_is_system_supplied() return 0 with a count of
> > > 1 meaning all drivers that use this get a wrong judgement.
> > >=20
> > > To fix this case adjust the logic to also examine the scope of the
> > > power supply. If the power supply is deemed a device power supply,
> > > then don't count it.
> > >=20
> > > Cc: Evan Quan <Evan.Quan@amd.com>
> > > Suggested-by: Lijo Lazar <Lijo.Lazar@amd.com>
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > ---
> > Good find; the current logic should also break with a desktop PC
> > once a POWER_SUPPLY_SCOPE_DEVICE battery device is attached (e.g.
> > a HID device), because it increases the counter.
>=20
> Yup!
>=20
> > I suppose I can just apply this to my fixes branch since there is
> > no compile time dependency to the second patch?
>=20
> Yes, that's correct.=A0 I don't see a problem with the other patch going
> through another tree.

Ok, I modified the commit message to also mention the HID issue and
applied it to power-supply's fixes branch.

Thanks,

-- Sebastian

>=20
> > -- Sebastian
> >=20
> > >   drivers/power/supply/power_supply_core.c | 8 ++++++--
> > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power=
/supply/power_supply_core.c
> > > index ab986dbace16..d57f420ba8c3 100644
> > > --- a/drivers/power/supply/power_supply_core.c
> > > +++ b/drivers/power/supply/power_supply_core.c
> > > @@ -348,6 +348,10 @@ static int __power_supply_is_system_supplied(str=
uct device *dev, void *data)
> > >   	struct power_supply *psy =3D dev_get_drvdata(dev);
> > >   	unsigned int *count =3D data;
> > > +	if (!psy->desc->get_property(psy, POWER_SUPPLY_PROP_SCOPE, &ret))
> > > +		if (ret.intval =3D=3D POWER_SUPPLY_SCOPE_DEVICE)
> > > +			return 0;
> > > +
> > >   	(*count)++;
> > >   	if (psy->desc->type !=3D POWER_SUPPLY_TYPE_BATTERY)
> > >   		if (!psy->desc->get_property(psy, POWER_SUPPLY_PROP_ONLINE,
> > > @@ -366,8 +370,8 @@ int power_supply_is_system_supplied(void)
> > >   				      __power_supply_is_system_supplied);
> > >   	/*
> > > -	 * If no power class device was found at all, most probably we are
> > > -	 * running on a desktop system, so assume we are on mains power.
> > > +	 * If no system scope power class device was found at all, most pro=
bably we
> > > +	 * are running on a desktop system, so assume we are on mains power.
> > >   	 */
> > >   	if (count =3D=3D 0)
> > >   		return 1;
> > > --=20
> > > 2.34.1
> > >=20

--x7qrij76ovy2qfiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmRj+6kACgkQ2O7X88g7
+pqvTg/+LiE+XBlOO714ueWEP/EpOGvtW5I4kA2i49P+zyNLuHehWNy35sG7kJDE
mUkzN0tpGQmnvGbRLkQr/GCMwcIsz3C5TJV40zbX7zTz/5ItbgCV19JP+BYu9n1Q
9CYT57ya7NawRZgitSMxbcbl1+vo07sUf49JsT4aXkO68oWAYWBwF+h7QrZoWyjr
VI246w/BYFcR6kcEt6s6tXERflLNbqFbcQpGKOBvPP/DgkSWs9LygC/roMqWH+Q5
0FoTBIuOg5KcVHPys9fLZ3491Gf+9be+vq+3tksOAH4JTGBRHhh4rlUjMO8FEaJo
1NKa5whdnEIrzBweXJsInH6NccubeLrCAvmEygWHwY2URPWGwV2G5zmxhXwg/JDY
UdgFu9Xzz1u1tIUMPR/3Ztuj8ZFut8zeOR9XRlt1ddsFh6Kq5AKq3PvM4ZKiFbDw
9QMYIqNAiku9mZvSBnOQM6Uamvy+cMp8fCReyvEoj/QO4/B9WSFN7P1eAroe4nta
rusGx/mFqTjq2jV4vhCFWyPg2EpsrRwR54xt9h8HuLiJJGFltK0VvpRQXmy8lTtY
/wMffGG0LbfAIxyKIGtoe84NRLg3yvfxkNqJWKnAhPqbWOKbqXIvT2J0hCWMDmwF
Fnvu2RonE8kd31YDRs6bL8lhHS9vOYb6719RhCq0dW2hj1kNpjU=
=ksLZ
-----END PGP SIGNATURE-----

--x7qrij76ovy2qfiw--
