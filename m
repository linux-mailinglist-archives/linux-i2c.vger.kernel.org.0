Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9179A4E9F56
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Mar 2022 21:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245467AbiC1TDK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 15:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245424AbiC1TCx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 15:02:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D923734653;
        Mon, 28 Mar 2022 12:01:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D8E0611D8;
        Mon, 28 Mar 2022 19:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D00C004DD;
        Mon, 28 Mar 2022 19:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648494071;
        bh=yvaaCgkKBw/wP5pC/CxghAEA/MkhepzW343jCYdxRlw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CktgMdy63xvsQJ48Ef+BwQtyqnflrPL1QdRCfQskIL1Y4ax1SKH5/+8f18GE7gO0o
         DZnqLtXoae1mbFXbqGRonkbj5g3rvSU5VIDe4bUEg7CnYOXbtth8ZDOc+NOdCQDk0B
         TEXAz6BCbFoElulz+98p9LA9yVklDw/xJddhoj4ztYIEPkEOtM3UWlq6sWfI6fls07
         2Y9sLCUqvZdIqigpGkDzdHaFK3QDfZpe3TXd1YS3ki2RZ+SFM7omavpz+S3si7ur8l
         eIxu5RNjqOP4MqvW8U4vUTeWlDvdNr1RI2lPnLel9qHdVmPwQVMLw963DEUKzSgMrO
         bmpbqxciuB7Zg==
Date:   Mon, 28 Mar 2022 21:01:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PULL REQUEST] i2c for v5.18
Message-ID: <YkIF9OqbZQ8yinz8@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Terry Bowman <terry.bowman@amd.com>
References: <Yj19RH3qpzQsIV/O@shikoro>
 <CAHk-=wgoeUc15-8Wu8U=4FnwhgmyU3C13R107oigbmJRpi_sZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E7iTNvwRJK4hNqtW"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgoeUc15-8Wu8U=4FnwhgmyU3C13R107oigbmJRpi_sZA@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E7iTNvwRJK4hNqtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 26, 2022 at 12:58:36PM -0700, Linus Torvalds wrote:
> On Fri, Mar 25, 2022 at 1:28 AM Wolfram Sang <wsa@kernel.org> wrote:
> >
> > I2C has for 5.18: tracepoints when Linux acts as an I2C client, added
> > support for AMD PSP, whole subsytsem now uses generic_handle_irq_safe(),
> > piix4 driver gained MMIO access enabling so far missed controllers with
> > AMD chipsets, plus a bulk of device driver updates, refactorization, and
> > fixes.
>=20
> It feels odd/wrong to use the piix4 driver for the AMD MMIO case on SB800.
>=20
> Would it not have made more sense to just make that a separate driver?
>=20
> It feels like now the piix4 driver has a lot of "if SB800" for the
> probing code, and then a lot of "if (mmio)" at runtime.
>=20
> I've pulled this, but just wanted to mention this "that looks a bit
> odd". How much code is actually _shared_ in the SB800 case?
>=20
> I'm not insisting on splitting this up - maybe it all makes sense. I'm
> just questioning it.

Adding Jean to CC, he maintains the PC-style drivers.


--E7iTNvwRJK4hNqtW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJCBe4ACgkQFA3kzBSg
KbbCFg/6Auuw5ANAZruLaiGI24QQzxC6+s6g3SKjue4LQeR8iw07tnPpulI56ugn
aZo3JTe8+/LJEcVFZokMPhQs6KH3qiByWj1J2BTWRu6Q1DJm7P8QsM/6ouHh0N+l
llI9p+Qdav9dhFcbrl0pjdEh/WrNnqYsUxnplY77cxFdQjV7j1U5oZbnseg91fZF
pAMfLADhqCUJVwvh3v4kQ7CUDgM5800zc2C6Eq7btiU8Fh9uKbDNkhprc+lNpg0y
kXY/3sAdhWZmxBuZXAUh2HumVNggOTOf6Svk76iJ2YoK1slp34C5YuP/Z4jsvhEY
zCwuGPdAVezo59pXe2s19qG5f49jEiO777s47UgZeK4nSSj2RUqTF1L5bF5UF4AI
H58A7ohnZ5SLEyDfvJ1HWQHB+RmUU3bRvSGHtP62cTnIdZqeGxoZtOo8FPupQ2+C
ZgRLdE4sKI6Sh2u/dt1VDuXXZFP95uTG/DHhQwgsHFHfaSdUDMvAmxSYMejfOv8s
+ua1mUF1mkNiR719ksAdgaWr2IMMB9726G6PdBnywSHnb6kUCeKioBg8GBp377t4
l2mXgzvW5OEyLorRE/db0hGmybhTjQ5TjCIaLa6iX03n6IO5Iu6Ji1YLI+1HUzwa
WiAvmsykMIe8m6/0uxk23YOc64bJT/rLS4ufNYr9am4wEtZ38RE=
=XFSv
-----END PGP SIGNATURE-----

--E7iTNvwRJK4hNqtW--
