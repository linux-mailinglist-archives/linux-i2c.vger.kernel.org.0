Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA96B6E152A
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 21:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjDMT1y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 15:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjDMT1x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 15:27:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31E55B9A;
        Thu, 13 Apr 2023 12:27:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7AA5363D93;
        Thu, 13 Apr 2023 19:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1166AC433EF;
        Thu, 13 Apr 2023 19:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681414071;
        bh=b94MZJk9di3vyZrDudjAp4+A7p5kQn0chF+PSIoN2MM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=REkiwTzrsbIwp9lbm9IIEtnlHfuPLTa1FkgkEF+K5OQmH6vY/83Z8E4qVWRvrm5cS
         nG2ljqycdJHgdjNy3wXDCv7RzEcNs3Ttbmm5XNKgf6loApfQvJoEJDhBarkA8L2Zbh
         VuitD+HJojjZS1dVZ7Jtpb1VD605nwcaLWC3T1IhWhhap+GSw2QhGOWDQuV/PHyo0a
         +tHXolUoSmXtJxHzOChPmvE6LKWLAajdw5x+Zd01XfvMDk3A9WU4UBbOKst+NBI4uN
         IiroTHlcsqpN8+rBqlDYs0Wncxr4Ax94Zy9E6gTDhd+6Ao25VQ6QLk1ZWnb+yKdMyF
         5ybujo0izWVjQ==
Date:   Thu, 13 Apr 2023 21:27:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: gxp: fix build failure without CONFIG_I2C_SLAVE
Message-ID: <ZDhXtDLiTtm2iXGW@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>, Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>, Joel Stanley <joel@jms.id.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230403074939.3785593-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YSLKM2vUjZb+N5Xo"
Content-Disposition: inline
In-Reply-To: <20230403074939.3785593-1-arnd@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YSLKM2vUjZb+N5Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

> The gxp_i2c_slave_irq_handler() is hidden in an #ifdef, but the
> caller uses an IS_ENABLED() check:
>=20
> drivers/i2c/busses/i2c-gxp.c: In function 'gxp_i2c_irq_handler':
> drivers/i2c/busses/i2c-gxp.c:467:29: error: implicit declaration of funct=
ion 'gxp_i2c_slave_irq_handler'; did you mean 'gxp_i2c_irq_handler'? [-Werr=
or=3Dimplicit-function-declaration]
>=20
> It has to consistently use one method or the other to avoid warnings,
> so move to IS_ENABLED() here for readability and build coverage, and
> move the #ifdef in linux/i2c.h to allow building it as dead code.

Can't we have a solution which modifies this driver only (maybe by
defining an empty irq handler for the non-IS_ENABLED part?)? Doesn't
feel good to touch i2c.h only because of this...

> -#if IS_ENABLED(CONFIG_I2C_SLAVE)
>  enum i2c_slave_event {
>  	I2C_SLAVE_READ_REQUESTED,
>  	I2C_SLAVE_WRITE_REQUESTED,
> @@ -396,9 +395,10 @@ enum i2c_slave_event {
> =20
>  int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_c=
b);
>  int i2c_slave_unregister(struct i2c_client *client);

=2E.. especially with moving these two prototypes out of the protected
block. The functions themselves are also protected by the same symbol
via the Makefile. I'd rather get a build error right away than a linker
error later if a driver misses to select I2C_SLAVE. Or do I miss
something?

> -bool i2c_detect_slave_mode(struct device *dev);
>  int i2c_slave_event(struct i2c_client *client,
>  		    enum i2c_slave_event event, u8 *val);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +bool i2c_detect_slave_mode(struct device *dev);
>  #else
>  static inline bool i2c_detect_slave_mode(struct device *dev) { return fa=
lse; }
>  #endif

All the best,

   Wolfram


--YSLKM2vUjZb+N5Xo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ4V68ACgkQFA3kzBSg
KbbCbg/+KMqGcmARpv4WTOLrw8dNeL7kGcYB8y8JBS5rZNf6WFS/suaqj5KGTon6
+4x9oSnNvDzcZIdcgaTuggayelF33q90mKiuctnXd3uRc4bEzfS2sEgdHsOOoDkj
Qazub13ObNSHM3nzfquGyCOde/wPWNazwdurQYU/EDmCz1uhe32vjZJx8YlW1RwV
u3VtH3ur2k5g2p50oY677jnTUsw23DY0AhFFRNRFHcTk0SKnb+2we8NzcvRYX0J7
CgXzjm7xvkJ2vwdwjzbTIcTxbHs9y1pPhwpQVB+xE06t+jk6aYkXPCKx2KWQo5in
LZD2prPO/L0sqRYZci9AfQSyfe1j4ctihTjRPps/xO0Tdfbh3d7mavL5FtpU/hdH
zrYyUGJ66kB1hp5NzHXMLyLEAroEPsIIy666z0R3JwAKy0T5/gbEASN3r60io/l7
l/35pXnj6E4mBQRc7V7OShi+jloZAUhDRBWpq5vnZAXm799hbIMpoYUuqBdt6OhO
K4ny9xlEczj+6MPJOwTYt5p8bZa5trRTsupm7J0eQifiIiR0IS0ABGkHydq4BrdJ
3/PDgNcGT6mHVi4vcFOWoFuqciGBUpwiSAAp/S0lKwcjAj1dKYsTEjh1F6cHslCC
tBBikemwBHscnDmJBQ4Ob4peTNE/EIUtY7P2gCI5NBENg+U8cT8=
=1Kzt
-----END PGP SIGNATURE-----

--YSLKM2vUjZb+N5Xo--
