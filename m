Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929A252722C
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 16:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233459AbiENOr6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 10:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbiENOr5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 10:47:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F229588;
        Sat, 14 May 2022 07:47:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 669F9B808CF;
        Sat, 14 May 2022 14:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513F5C340EE;
        Sat, 14 May 2022 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652539673;
        bh=96QjL+OprZRjV2X3/4FwD7Eu1i7V9gHRJCzXuKCsUD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K0p2wXwwjlEvJbEDb9qe6UzKn/x5tZKdKuAGfA7JTCI3vT21xwYioYs0kGmZ8cffn
         cuJH3z3NaIm3XPQ3PPFqhKESmDQ8eZ7xPXfIm3aMwFR0yr/H7W+WL9BSQn3y5SuybD
         do7rXnhVFHTOqqB2NEvlSXys2Mb0tP3FubY8cmmvLYvabZM0Z2VLo8Jn3Piw8vB7Bq
         IAt7hTYPy2shrCU6pVtU8GGt1ZMdh7ky0VqYmm4YeT3vuFEEMIDUJxtgn/QhD22ZPG
         tGc2jbcNnK9LwtKNWlExXo62BPlhVWaVj3loDnnAiFxF9pFYT4P9Dc57QIrK9Jyagd
         rPTrkT4wvi3pg==
Date:   Sat, 14 May 2022 16:47:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/9] introduce fwnode in the I2C subsystem
Message-ID: <Yn/BFKwzVLwrjF/F@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>, Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20220325113148.588163-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CWEGzloJfYGyEJWo"
Content-Disposition: inline
In-Reply-To: <20220325113148.588163-1-clement.leger@bootlin.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CWEGzloJfYGyEJWo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

O
> This series is a subset of the one that was first submitted as a larger
> series to add swnode support [1]. In this one, it will be focused on
> fwnode support only since it seems to have reach a consensus that
> adding fwnode to subsystems makes sense.

=46rom a high level view, I like this series. Though, it will need Peter's
ack on the I2C mux patches as he is the I2C mux maintainer. Still, I
wonder about the way to upstream the series. Feels like the first 5
patches should not go via I2C but seperately?


--CWEGzloJfYGyEJWo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/wRQACgkQFA3kzBSg
KbZJfQ//R0rV8DTGd3xrIPGTB9PzBgKFLGuP1U5pe1/vBWfXIcV7u1rriR6/dy0L
8blaWksrkgq1lMlr63D9bjbQ7q3tT4MlWECfAb9XPDdCYJUuwj0FJlSwFFBwBqrl
m809ClSPjIu8G59UQ9YhdxR4XKmdfGk0nA3t9Drj5KwJ9u2nLLiOXAz3fehdLf48
J22eDeq0+JmWDJBppbZNfnU51Dy5entBzUsRcj5QkOP2zKQEQeH4Rqv+8ZWI2sqK
l283onwpJvow6+sEFz6BcqFUyoE3khpLRQgfyzlzuXR6zAG/g9HYG7txyEcIx4t1
+5cuXh+8iHEO3iiikqbo1UevNjWl7LI0YAKAJppWIiNY75Xm5JBqHbZ8wW2C34qU
4adXtsn+JRvf3g9CKA/fMvGzO2hSSGclY8UG8L3jJbh+1o2tI3C3jNldhH478rFx
srq4Cm5Ohs6yMRXRCsc0eGFNgsOiaUN9/R5LP0/51JuYAEAURAM2zh/2ilcdjjOA
/rH590vI6INl17s4/Hg5Na3WGM3n8agOuNeDL8AecyjrRvCzhc/CVtUveXwIpYAK
jWpRzFsjHFvbLN5Tgx4AAT71br0bGdDfrDSJfJlb2KjS2r1ar7VGECcXFzrG/WMO
tyvf/XgTohsZaYDO/Q0Vr1wKTh2D+rwpcK1IkM+Nu3oPgtt8I6s=
=dJXb
-----END PGP SIGNATURE-----

--CWEGzloJfYGyEJWo--
