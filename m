Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1385E5E7FA7
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 18:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbiIWQYz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Sep 2022 12:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbiIWQYs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Sep 2022 12:24:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119FA1F63C;
        Fri, 23 Sep 2022 09:24:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 303CDB83456;
        Fri, 23 Sep 2022 16:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2507FC433D6;
        Fri, 23 Sep 2022 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663950281;
        bh=0h0G5qcWNZsqzimJb0sgAh+jjQ412Y6KYXXPIOoyNmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CyXZq1+tJW008nJ91KYfLuuEQZPqXcqBhI7gY+AeOpnxYBrVQKqB+ueru5AhnNdFY
         a93knk2pH7zXMUtKzjWFTEn5w7LXKUIuD73kasJ7uCjoupPWitlJ2IkSEmsF1rdEr2
         X46vmFWXBxbx5lJVxqqDX0zAobV1bTduuuVMSlKTAut6+ihiMnYVJluQ9gNyznBqbc
         EHPPgAhUQ4iq2uKYXIjqFAghdmUyLeMzcyftubKOu/oMRsdh0j0zTotcqt4FepNMZg
         et44soQflvfQZ1mYPT9Y8uCdssFKV22DCHpeBP7locIPi4RVcWNHQlyVyLcFpvq9tX
         Tuu6li+CPRAdQ==
Date:   Fri, 23 Sep 2022 18:24:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tharunkumar.Pasumarthi@microchip.com
Cc:     UNGLinuxDriver@microchip.com, krzk@kernel.org, arnd@arndb.de,
        andriy.shevchenko@linux.intel.com, robh@kernel.org,
        semen.protsenko@linaro.org, sven@svenpeter.dev,
        jarkko.nikula@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jsd@semihalf.com, olof@lixom.net,
        rafal@milecki.pl
Subject: Re: [PATCH v4 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Message-ID: <Yy3dwhFSTBH9942n@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tharunkumar.Pasumarthi@microchip.com, UNGLinuxDriver@microchip.com,
        krzk@kernel.org, arnd@arndb.de, andriy.shevchenko@linux.intel.com,
        robh@kernel.org, semen.protsenko@linaro.org, sven@svenpeter.dev,
        jarkko.nikula@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jsd@semihalf.com, olof@lixom.net,
        rafal@milecki.pl
References: <20220907161143.897289-1-tharunkumar.pasumarthi@microchip.com>
 <YyY1vESf5JalT6GR@shikoro>
 <55e6769b1d7e890f4211b44f821b11654a5b9f4d.camel@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c+XyHOeASBRR/HeV"
Content-Disposition: inline
In-Reply-To: <55e6769b1d7e890f4211b44f821b11654a5b9f4d.camel@microchip.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--c+XyHOeASBRR/HeV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I need to make sure: do you intentionally want autoprobing for SPD? I
> > ask because it could be needed but it costs boottime when not needed.
> > And changing the class once exposed is troublesome.
>=20
> Autoprobing is not required. I can modify code.=20
>=20
> All these comments need to be addressed now or can be fixed later after t=
he
> patch is applied?

The issue above (autoprobing) should really not be fixed incrementally.
The other two issues could be, but if you need to resend anyhow, just
tackle them as well, please.

Thanks!


--c+XyHOeASBRR/HeV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMt3b4ACgkQFA3kzBSg
Kba0lw//ZuqZnoJAR1dk2RRZp2Eq2uaCuPCI7zXVK2N3XzgPVsDPG2pMEiMuJvHo
kW4j8rTbmCdGQnJ3ZC1f+CHPJkIT8UhH3NgSjG+agYVj9T3leY2pS/jF+vRhLQld
JJk9alBqn6JzPXDva3h89ZGZTyq4O3OYdCXAe0V4J9XUTxdS6y/Fj2Gy7GRdDZcq
LHmGqS8iKu8gi9YynUEdyyjYP/NKybvgUOu1cze9uGkEHgZdZTrmCZjgY39LE49b
b1csprsSoj/8i4OJ4y4D6PBYGM2hTNbF33Q6nGBfdzugT30sQLn6ENUV0SW9xAy0
MHyVdosnH7yMAjWXZ7BQU9p2VwdeymXgASQzaM5sW8qe2eg3RaDswmk0/EcD71er
PbXmHCsV/dv3YTJJoT+dMfuyKObgKQKdZnAzowFayCjoWkT7DYkZdKNvRVnCjh1Z
tZ/hMsX4CP4f14AnvCuMmFK8Vfbp71vok3mKlZVElKAJt7pUxs5Oa0fv9bU6Cd9v
hVxX7xxZB1U3UecqRgB4I9oVVjaB3pU0dWR/PCC/Kpue/UJTflezyHAnC4yJmBVH
WPSzAQ3t61K574LNo90SdxSA2gc/tMVQTbaPideLZyaDEnqQNKkiYGlz/oxQbWBA
B0C6JzfafzK2vqvIv6bXPkEQVAD/I1JoAll7L3WaXwv3+BEhe6A=
=jUZa
-----END PGP SIGNATURE-----

--c+XyHOeASBRR/HeV--
