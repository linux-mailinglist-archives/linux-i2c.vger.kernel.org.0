Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A72A56E12B9
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 18:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDMQt0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 12:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjDMQtZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 12:49:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1F93C11;
        Thu, 13 Apr 2023 09:49:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C386F64020;
        Thu, 13 Apr 2023 16:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FB3C433EF;
        Thu, 13 Apr 2023 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681404550;
        bh=PuPOEovLO0twQtnLYrf3MKJlFAcOQo0EcvYK1HRswxo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C7hhCm38bpRkJJ6KFCHLT7wLpK1vC6fCLybkUi3sfmW8GH4svIHIeBVJgCz7P85NR
         c6zEhQ8TkYKaDTd4DhA5qQKNdxz7R2YpH0DdEpchfSAof2DYYyG1H2WM2bDFiiqFWf
         9gXauclJ/ZafAXehp48ctPi0WUmi2T3X8g0gEeDmcDBgSzKuFqboo4aamktInrs3Ms
         CTjZSfS+pyhPpQo6fE+efF/PFkPhem/Rk6q8GS3HS1XqTDK740/mfL/VaLgckalMvp
         sObJGb2LkG6C4e2jnTWvQ78WAQTJuoJHHPbUaQX0jXI+YTjNeu9uTCbNvFe7Jfm2/E
         jSBdprs4nkI2Q==
Date:   Thu, 13 Apr 2023 18:49:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Vignesh R <vigneshr@ti.com>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Improve error reporting for problems during
 .remove()
Message-ID: <ZDgygggnMLfqn86W@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Vignesh R <vigneshr@ti.com>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
References: <20230402105518.2512541-1-u.kleine-koenig@pengutronix.de>
 <20230402225001.75a32147@aktux>
 <20230403054837.6lxyzznzntvw2drg@pengutronix.de>
 <20230403060404.GX7501@atomide.com>
 <ZC5qUU4JLI9Negyi@sai>
 <20230406082354.jwchbl5ir6p4gjw7@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rOVRl6TSD4jp04kC"
Content-Disposition: inline
In-Reply-To: <20230406082354.jwchbl5ir6p4gjw7@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rOVRl6TSD4jp04kC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 10:23:54AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> If pm_runtime_get() fails in .remove() the driver used to return the
> error to the driver core. The only effect of this (compared to returning
> zero) is a generic warning that the error value is ignored.
>=20
> So emit a better warning and return zero to suppress the generic (and
> little helpful) message. Also disable runtime PM in the error case.
>=20
> This prepares changing platform device remove callbacks to return void.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-next, thanks!


--rOVRl6TSD4jp04kC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ4MoIACgkQFA3kzBSg
Kba2Lw//b0WwKrYovKtazbVC+UUuNWEz4QvZy7mWKWR/RQKE/NetcIRpvfB/pTcn
oPfg5JL8lCJh1bTmy9MtEhrhgF+emj/i64pu+Tz+C/piU+S3flJgD2FcJMLhU1Lj
QkusCw5o5+fNq9kyivRkVWR7aaD1aYQs4U0s0c1uZZaCT4uyM0lZUbLvRc+xDxA/
4Rt+uQNJmABKKfVMWaL9JIjuh3h1uKqp/wWAMikG+Hwt/+43njYX6o/RJo7Tb97h
uyj/br5FBCssQStMfZbCQS/gyr6qxdfzPlgCNGLEzJysiazmcSwb0rfYQpBI4olC
jGtIC9kdd3ZUblhj/VxsvjUbzYy4THKiWoIQD13/pUpinloY68L217iRMTUY1J/3
f+tPlkIBokjV3FpaULloQK5hbVyiRB5/WPRqbn+v/uSODGCbcvDScR0dzd/wpAZQ
rECFyq/LEwWvKMNf67jXqqdw9sEzAW8rlT6VkohqWfmQW8D8t15t3qd+ySVmWHGY
s50LP9GIG5u/IOGKKKmjBG2wwed068S/j+co+R0dXgMY0Vc1xTbhK57JFia7KOjA
3hAx5OQLcf3To5/OQcV+wSIiFAQa9hUI0gjzHXvFXh4t7VSZG1poC+/W3A1UgVmh
c0EZC0EN55NqZbm3gAN7nqkXWgsrliyLaMzC5vvaAp6MsF/vvjE=
=6+gW
-----END PGP SIGNATURE-----

--rOVRl6TSD4jp04kC--
