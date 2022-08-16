Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE57595A03
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 13:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbiHPL0V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 07:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234813AbiHPLZe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 07:25:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463E713FA0
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 03:40:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B9DD4B816A3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 10:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979A8C433D6;
        Tue, 16 Aug 2022 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660646403;
        bh=OoZXdR/hwZeuZ/t2bEntrHM/+Ny86fvpk6mV61veyGs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F6LPg67hpg/+s9HE99asgcKOicPlezSuUWamz7rFf7/TWenzbNCX1JQZT8KpwCBwH
         BwlxPgkZgpXsEBy7XulI9kL30d7XarQB6LDfJkioWx7g8CSPSCgfCKSbItWOw3u+ni
         ViFMO2vVEYhkJ51SJeqwm28MBkRYd/ft6YtL55nrIgfxTgvT3FOj2FdUye+3GKzVJ/
         kP4jrhehyrwUAg0ciegIzB01hT/YQ533/zAppaFcUSkdG7vbi2qCw8lbaqjvI/Hwaw
         yxjwdOW2YtDe5qk6+dG+pHmNTlY7eZZnoZaH6GwRsz2nZSjZbx/fclqT9H3xzFQVfv
         q/SSYxV3//SPA==
Date:   Tue, 16 Aug 2022 12:39:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Crt Mori <cmo@melexis.com>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Petr Machata <petrm@nvidia.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Peter Rosin <peda@axentia.se>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Corey Minyard <cninyard@mvista.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Pavel Machek <pavel@ucw.cz>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v2 6/6] i2c: Make remove callback return void
Message-ID: <Yvtz/9nMZN6F3YpC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Crt Mori <cmo@melexis.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Petr Machata <petrm@nvidia.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Peter Rosin <peda@axentia.se>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Corey Minyard <cninyard@mvista.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Pavel Machek <pavel@ucw.cz>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Miguel Ojeda <ojeda@kernel.org>
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
 <20220815080230.37408-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bt9IRZq/2G3Hwf52"
Content-Disposition: inline
In-Reply-To: <20220815080230.37408-7-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bt9IRZq/2G3Hwf52
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 10:02:30AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
>=20
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
>=20
> Reviewed-by: Peter Senna Tschudin <peter.senna@gmail.com>
> Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Crt Mori <cmo@melexis.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Marek Beh=C3=BAn <kabel@kernel.org> # for leds-turris-omnia
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Machata <petrm@nvidia.com> # for mlxsw
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com> # for surface3_power
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> # for=
 bmc150-accel-i2c + kxcjk-1013
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl> # for media/* + stag=
ing/media/*
> Acked-by: Miguel Ojeda <ojeda@kernel.org> # for auxdisplay/ht16k33 + auxd=
isplay/lcd2s
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net> # for versaclock5
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # for versaclock5
> Reviewed-by: Ajay Gupta <ajayg@nvidia.com> # for ucsi_ccg
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> # for iio
> Acked-by: Peter Rosin <peda@axentia.se> # for i2c-mux-*, max9860
> Acked-by: Adrien Grassein <adrien.grassein@gmail.com> # for lontium-lt891=
2b
> Reviewed-by: Jean Delvare <jdelvare@suse.de> # for hwmon, i2c-core and i2=
c/muxes
> Acked-by: Corey Minyard <cninyard@mvista.com> # for IPMI
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for drive=
rs/power
> Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to an immutable branch, thanks!

--bt9IRZq/2G3Hwf52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL7c/8ACgkQFA3kzBSg
KbZc4hAAlG2SyR+Ar7HiF3a3K7WvM5cxbcfBSynKLjBIweSTnKYbOvNs6uzVtbFq
go2QkV80IInm40XmMLS/1Nr92CtEcVGzckngRULnsTGm7vUGwEPsGiwrgRGRE/w5
WuMg3x5tLF/kPJb2nKBQY2DEpIao1VgKbLMRlUBE/jVkmkbye0uRPHOXUzzHTCzh
4C6/A4aTv+3nfvdavabKSSfCzIg6z/apk7SEfcUxB6P3FNylZPnF5A9mx4GqudSs
iEoX5AP1KNzFbdVWejBocb6I9eYuvHL/m5ALHk+c6+3WH91tHEYDkT5N5KoO6IaT
++zPEgWMGcL0PjQYbcseJqQ58cmF7qV8CSj4s4qnFM0/r8KOJHyLEQRR5R9EN5re
koMEhQe/eTxvYRb1H7Dk3KgBYHXI/XHZyolmqssRSJC1EALUe5zabCZBvY/G3vtY
iQnvrdRsVvkYx1qwagu6I51I1ci7O7/ISyRuO+BITH5tLqbsCFhxbImDlC/fVJ+k
FjC6WslDDVqLL3xElBEBhYxoxcKWR3E+lA3Y7zEjWi4W+3OarakUHi2bzJe5x9Y4
eUz+kI4uoEy/fAuo2p+uT/SmIltgdO0HZEOp+JWZXNOlQQ1IyHf5Czi7oCMsPZvD
SujnRpqa7Rzg5VCXYMUK1JeiAMLhrvQQb8v6kMtkooiF0TXeoEQ=
=JhHN
-----END PGP SIGNATURE-----

--bt9IRZq/2G3Hwf52--
