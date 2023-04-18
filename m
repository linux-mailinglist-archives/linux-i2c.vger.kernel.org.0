Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752B16E6716
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 16:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbjDROZJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 10:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjDROZI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 10:25:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C8B183;
        Tue, 18 Apr 2023 07:25:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4BF1162E36;
        Tue, 18 Apr 2023 14:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088A1C433D2;
        Tue, 18 Apr 2023 14:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681827905;
        bh=JjvHV44AW8fU6gt5sWWn5MYeufuxDsNYjEhFnzDlPy0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sI9M3xspqi+Y/NNWYm/NytNctShNlUXJcV9Ix2jq08NRcH4RgkWwtnwxY5PJcEBTQ
         STA5GupBEkw08+iWQfnuY+Wp0f2XRCjMkMdcAwEtFVu9SHwkP4s0CCcbuihldOPhwH
         i/DWOmPLpXc3JmnzRqCvGnpZF7k8KwXQHBqHEG6Um801Z4J3yjpo2VffU8sh9+nW7O
         mrzw20v+GMMCjsGBxhFMhD3wuMFzfDTMPFepKT6Ud7/zZsMLFmXY2Y/T6HTuoKYx2A
         bEXCMUK1H9nXtrQ4Yy47rEg6jYvjHxvLR7gr5aakVih1LwgNWNbzQQuG6QMwoI59ST
         eOzRFm6m9XpdA==
Date:   Tue, 18 Apr 2023 16:25:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v10 1/8] i2c: add I2C Address Translator (ATR) support
Message-ID: <ZD6oPq+Na/80E7Mv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <20230222132907.594690-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q5HMx4PIUFk/wOvT"
Content-Disposition: inline
In-Reply-To: <20230222132907.594690-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Q5HMx4PIUFk/wOvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tomi, hi Luca,

as mentioned on IRC already, good move to use bus notifiers here and
drop the generic attach/detach callbacks. Those were a show stopper for
me. This version is nicely self contained. I like that!

> diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
> index 6270f1fd7d4e..aaf33d1315f4 100644
> --- a/Documentation/i2c/index.rst
> +++ b/Documentation/i2c/index.rst
> @@ -16,6 +16,7 @@ Introduction
>     instantiating-devices
>     busses/index
>     i2c-topology
> +   muxes/i2c-atr

The muxes-dir is only for the description of mux drivers. I'd prefer to
have this document not in the sub-dir. Also, renaming the document to
"address-translations.rst" might be worth discussing.

>     muxes/i2c-mux-gpio
>     i2c-sysfs
> =20
> diff --git a/Documentation/i2c/muxes/i2c-atr.rst b/Documentation/i2c/muxe=
s/i2c-atr.rst
> new file mode 100644
> index 000000000000..da226fd4de63
> --- /dev/null
> +++ b/Documentation/i2c/muxes/i2c-atr.rst
> @@ -0,0 +1,97 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Kernel driver i2c-atr

Maybe "I2C address translations"?

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Author: Luca Ceresoli <luca@lucaceresoli.net>
> +Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +
> +Description
> +-----------
> +
> +An I2C Address Translator (ATR) is a device with an I2C slave parent
> +("upstream") port and N I2C master child ("downstream") ports, and
> +forwards transactions from upstream to the appropriate downstream port
> +with a modified slave address. The address used on the parent bus is
> +called the "alias" and is (potentially) different from the physical
> +slave address of the child bus. Address translation is done by the
> +hardware.
> +
> +An ATR looks similar to an i2c-mux except:
> + - the address on the parent and child busses can be different
> + - there is normally no need to select the child port; the alias used on=
 the
> +   parent bus implies it
> +
> +The ATR functionality can be provided by a chip with many other
> +features. This file provides a helper to implement an ATR within your

I'd like to get rid of all "your". Maybe "client driver" here?

> +driver.

=2E..

> +Usage:
> +
> + 1. In your driver (typically in the probe function) add an ATR by
> +    calling i2c_atr_new() passing your attach/detach callbacks
> + 2. When the attach callback is called pick an appropriate alias,
> +    configure it in your chip and return the chosen alias in the
> +    alias_id parameter
> + 3. When the detach callback is called, deconfigure the alias from
> +    your chip and put it back in the pool for later usage

Remove all "your", please. Some can simply go, I'd say. The others
replaced by "the".

> +
> +I2C ATR functions and data structures
> +-------------------------------------
> +

=2E..

> +/**
> + * struct i2c_atr_cli2alias_pair - Holds the alias assigned to a client.

I stumbled over this one because "cli" is "command line interface" for
me... The long version isn't much longer: 'i2c_atr_client_alias_pair'
But I'd be also fine with: 'i2c_atr_alias_pair'

> + * @node:   List node
> + * @client: Pointer to the client on the child bus
> + * @alias:  I2C alias address assigned by the driver.
> + *          This is the address that will be used to issue I2C transacti=
ons
> + *          on the parent (physical) bus.
> + */

> +EXPORT_SYMBOL_NS_GPL(i2c_atr_add_adapter, I2C_ATR);

EXPORT_SYMBOL_GPL, please. We can then later think about using an I2C
namespace for all I2C symbols.

Pretty high level comments only so far. I'll keep at it this week and
might come back with more detailed comments. But in general, this looks
quite good to go. Moving the alias pool handling to here is the biggest
question I have.

Thank you for your patience!

   Wolfram


--Q5HMx4PIUFk/wOvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ+qDoACgkQFA3kzBSg
KbaEqA/7BSdyL0W6zqSIUkHTHRbY6TFIBZ5YQuYxvJ4O2GbF+HxzKksrNCZ8mbXM
lMf8Na5VzuG6yeAbip6leNZZRBc4yI7B1A8d1BQ7sKDcHjvaN+OU4kPjj4UeFK7V
fGJ1zGDS/2klcQnPrompqPujAMgyzSQO4P5MN90mc7IxWiu4z83+6DYn6EYTyt/U
nviOZY4n9S38V0+Zerz8tksoDtJZe/YH7mH0Q8SQPS4mkVt0ii++O2ifZTabQvpy
r0129J3uQPM4CrjTDJoNQ0YT6S/HbcJcpR/iIS/KACk/oWedTPD7eEY101kks/AS
AbT7/qhUFNV15B97iDu30GEEXsccJVmoekE/5Sdx+H/nKmS1hT19nIVbK3htshh+
PoaJQUogSfEXlx/ethvwSbiVXYkBYsj93M+6vddPY2cK7rCUAF6ZlkEJV5un+QM0
/KBrijD8bCTmg0o5sSacDkbC0KzAmDdL+KZe1edXgcf8v8U1+JDP+j59CeANUoeq
oGuv2C8nIObFwLd8mFRR9EqRTSbCAWrTBUnQk0La8+36XLBluy4vIvdLrXoDcHXh
ql0EPjpErEH6nCyuYbuyX0Bzi8JoDspmq83UyEnxni73oooKvqtJ0gQz1gj8pQli
Zw3zYz9Gtb919Ts97E7sSH9ZVzJ1tcdsQ8bkKRyINwrMRAXdn+M=
=Rt6W
-----END PGP SIGNATURE-----

--Q5HMx4PIUFk/wOvT--
