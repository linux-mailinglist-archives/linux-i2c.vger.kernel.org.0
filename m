Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7947A461666
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 14:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245427AbhK2Nbe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 08:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235896AbhK2N3c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 08:29:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2CBC08E867;
        Mon, 29 Nov 2021 04:08:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EAD9F612DD;
        Mon, 29 Nov 2021 12:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1A1C004E1;
        Mon, 29 Nov 2021 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638187697;
        bh=AVNKEkmJUQ9Akh0ujLWrgjE9ECPTii2J34p78F6aXfw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jSaMOTsYyspim30zg0bDBb0uVEec5wgFmTHi9GaQon+uGOH/tc+TdBVNmersVCrEo
         0HMFB0cCHq2DxHhktXImsyBWj9aGglvO/WwnGNPJ/rUq86FXT3sw0/k+nVYAJCihYq
         Exr0epUXaL8/6JUFdJiIrQSygdI/kYE7Toaj+9tWP1nxbfqxE3oI00pTMBd2JpdJuN
         taXK9z2gxdO6iIGRBQSkuVoBj35BM+scvhvaK83u/zg/dWST6O0yRN+Y/YO5XVzosZ
         afP4niJMSN84BgZWulguW0TH8IsP3XhMS/+Tifm32XgplWwkYo0udX1BYOV9Cz/1q2
         0WaT0OPtYW3MA==
Date:   Mon, 29 Nov 2021 12:08:06 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 05/15] regulator: Introduce tps68470-regulator driver
Message-ID: <YaTCpgYaPDssQp+N@sirena.org.uk>
References: <20211125165412.535063-1-hdegoede@redhat.com>
 <20211125165412.535063-6-hdegoede@redhat.com>
 <YaAdIG+2MZPsdI+F@pendragon.ideasonboard.com>
 <19aeff06-d397-5f88-6d07-f76a2073b682@redhat.com>
 <YaLBeq0+0A6R2FZG@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RmSGVEEsRbHLX9Ig"
Content-Disposition: inline
In-Reply-To: <YaLBeq0+0A6R2FZG@pendragon.ideasonboard.com>
X-Cookie: Thank god!! ... It's HENNY YOUNGMAN!!
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RmSGVEEsRbHLX9Ig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 28, 2021 at 01:38:34AM +0200, Laurent Pinchart wrote:
> On Fri, Nov 26, 2021 at 12:22:35PM +0100, Hans de Goede wrote:
> > On 11/26/21 00:32, Laurent Pinchart wrote:
> > > On Thu, Nov 25, 2021 at 05:54:02PM +0100, Hans de Goede wrote:
> > >> The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
> > >> the kernel the Regulators and Clocks are controlled by an OpRegion
> > >> driver designed to work with power control methods defined in ACPI, but

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > >> + * (1) This regulator must have the same voltage as VIO if S_IO LDO is used to
> > >> + *     power a sensor/VCM which I2C is daisy chained behind the PMIC.
> > >> + * (2) If there is no I2C daisy chain it can be set freely.
> > >> + */

> > > Do we need safety checks for this ?

> > There really is no way to deal this condition needs to matches inside the driver,
> > this should be enforced by setting proper constraints on the 2 regulators where
> > the PMIC is used with a sensor I2C daisy chained behind it.

> Right. I tend to be cautious here, as incorrect settings can destroy the
> hardware. We should err on the side of too many safety checks rather
> than too few. I was thinking that the cio2-bridge driver could set a
> daisy-chaining flag, which could trigger additional checks here, but it
> wouldn't protect against someone experimenting to support a new device
> and setting different voltages without the daisy-chaining flag.

> My biggest worry is that someone with an unsupported machine may start
> by copying and pasting an existing configuration to try it out, and fry
> their hardware.

There's really nothing you can do that prevents this, especially in the
cut'n'paste scenario.  Overrides tend to get copied along with the rest
of the configuration, or checks hacked out if people think they're
getting in the way without realising what they're there for.

--RmSGVEEsRbHLX9Ig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGkwqUACgkQJNaLcl1U
h9CAgAf8CzQIgZiHFaA5iv2jE3nlJ5tXNUlPqGuiPWQ/ZvLAOTS7xrHL0cWrUuTQ
T1Rci4/aDPHWanPC43f9AR6nopwXJkzEhmc46AQn2bho+YIqta//ue7YrGX3TDCS
vn/KYo8jTKMrXMd1QCItfhdYPhHpL6t5qHvmtyQSz2/UxGH7k+SzmPQQI7Wo3bwx
wIi09kgVKlwCEpmFMI3TyoCCpJgVKYJXi6XiLsA6a8pW2O/IkoeMZc8mcMbFYbL3
MeZzRi7KZ7xNneWZfyZ10MZqx70nGtARsQUn1yv/gyz66hdGtGg/a0l9BQufgecB
n3mz+wbWmgILk3zQivafxzUdjYsEow==
=qPlL
-----END PGP SIGNATURE-----

--RmSGVEEsRbHLX9Ig--
