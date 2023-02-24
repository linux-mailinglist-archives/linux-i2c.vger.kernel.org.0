Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81ECE6A2118
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 19:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjBXSEE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 13:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjBXSED (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 13:04:03 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FD712F30
        for <linux-i2c@vger.kernel.org>; Fri, 24 Feb 2023 10:03:50 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVcQ6-0003ST-SQ; Fri, 24 Feb 2023 19:03:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVcQ3-007Elu-Ru; Fri, 24 Feb 2023 19:03:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVcQ4-006IuD-BE; Fri, 24 Feb 2023 19:03:44 +0100
Date:   Fri, 24 Feb 2023 19:03:46 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] i2c: Switch .probe() to not take an id parameter
Message-ID: <20230224180346.dbbjcetbjrmjt4fs@pengutronix.de>
References: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
 <20230224120600.1681685-8-u.kleine-koenig@pengutronix.de>
 <20230224170218.22c0af0c@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zzuurrxhunk2mhmd"
Content-Disposition: inline
In-Reply-To: <20230224170218.22c0af0c@booty>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zzuurrxhunk2mhmd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Luca,

On Fri, Feb 24, 2023 at 05:02:18PM +0100, Luca Ceresoli wrote:
> On Fri, 24 Feb 2023 13:05:58 +0100
> Uwe Kleine-K=F6nig         <u.kleine-koenig@pengutronix.de> wrote:
> > [...]
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index d84e0e99f084..c3e022d53182 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -272,14 +272,18 @@ enum i2c_driver_flags {
> >  struct i2c_driver {
> >  	unsigned int class;
> > =20
> > +	union {
> >  	/* Standard driver model interfaces */
> > -	int (*probe)(struct i2c_client *client, const struct i2c_device_id *i=
d);
> > +		int (*probe)(struct i2c_client *client);
> > +		/*
> > +		 * Legacy callback that was part of a conversion of .probe().
> > +		 * Today it has the same semantic as .probe(). Don't use for new
> > +		 * code.
> > +		 */
> > +		int (*probe_new)(struct i2c_client *client);
> > +	};
> >  	void (*remove)(struct i2c_client *client);
> > =20
> > -	/* New driver model interface to aid the seamless removal of the
> > -	 * current probe()'s, more commonly unused than used second parameter.
> > -	 */
> > -	int (*probe_new)(struct i2c_client *client);
>=20
> The kerneldoc for this struct should also be updated:
>=20
> - * @probe: Callback for device binding - soon to be deprecated
> - * @probe_new: New callback for device binding
> + * @probe: Callback for device binding=20
> + * @probe_new: Transitional callback for device binding - do not use

Indeed. I will send an updated patch series near the end of the merge
window, with your suggested change squashed in.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zzuurrxhunk2mhmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmP4+/8ACgkQwfwUeK3K
7AnW2ggAgs0kOrMaBR1hMEZNM7UPtqYjl18LYmtcokGpOrUdWybqFwBzETr7a079
xo76DXvsL3E3z6YjbaUwqCZ11SUWqUI6NMMIQSR71CLDF3Uts9rHhGxrGQ4u3wwV
/hZi3Oib9vQ0GkaLHgV5LX0cEWV+UhZDDPamKS4WQfNA1QCcqKk7+Dk+DMVOyGwj
2zbB7cOnKBNZ24Z/KUSldcOIUqce3xchOP0DqW7C9LeBTNWjgtW2hEnTMU2eMPj+
q3Xm75q+czQd/5MNuLmP/VRP0RKy5rLrEg/xb8GqKE2T71hEidaS+EuK0KCsIa+4
ACRaYxTlEd3Ofcc4UdwuhP0FTtIzAQ==
=plub
-----END PGP SIGNATURE-----

--zzuurrxhunk2mhmd--
