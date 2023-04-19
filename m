Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733C06E749D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Apr 2023 10:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbjDSIGA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Apr 2023 04:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjDSIF7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Apr 2023 04:05:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36D94C3D;
        Wed, 19 Apr 2023 01:05:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 704F163C3A;
        Wed, 19 Apr 2023 08:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45613C433EF;
        Wed, 19 Apr 2023 08:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681891557;
        bh=Pmk67VN1KWoYfHH9fjaJIYCfiu0cDeym63+mdBdupLc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cCJZZmOedUDG1K/cSy1AWLOZeG4g9dchhxqqkUkLKke4h6X0efXb0JLcMFgGQK9zj
         xKj301TGX6JOGQc3d3XNmbncOaA7zMl+Z1FFtJcg7PtcSxYNTfJvWN5saXSatOw8L0
         cQaFFeJwyy3gDVP3FYSSjx+q8L5UtpQdpeyZEgLNNKYwuSy3rerveY7+2HF8zIzMPQ
         J/OBwTuhZdHrBhHodhIlGMNelE3DvXcxH0YXX0zhqEABM49kL/uh1tZRMuwBij2Uc3
         gBm6UJD7dfx/MPmcoEFeSaynqzxz4AK39dodj08oVE443cpy+92Ys6i0SyJV3s75J6
         ayjuFUiWwO6cQ==
Date:   Wed, 19 Apr 2023 10:05:54 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v10 5/8] dt-bindings: media: add TI DS90UB960 FPD-Link
 III Deserializer
Message-ID: <ZD+g4j7jEg2AETNe@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <20230222132907.594690-6-tomi.valkeinen@ideasonboard.com>
 <ZD6VwpRya6SGBAt5@shikoro>
 <20230419091336.4e10ba65@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5uh5ZyA4HcdyiNVD"
Content-Disposition: inline
In-Reply-To: <20230419091336.4e10ba65@booty>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5uh5ZyA4HcdyiNVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Why is "i2c-alias-pool" in the drivers binding and not a regular i2c
> > binding? Same question for the implementation of the alias-pool
> > handling. Shouldn't this be in the i2c-atr library? I'd think managing
> > the list of aliases would look all the same in the drivers otherwise?
>=20
> I think that this _was_ the plan, as it looks obviously cleaner, but
> then we agreed that we should remove the pool entirely, so I didn't
> bother moving it.

Ah, you mean we agreed on that at the Plumbers BoF? I think we can
conclude this is obsolete meanwhile. GMSL encodes the target addresses
in DT. Rob is also fine with the binding here to encode the pool in DT.
Let's follow that road, I'd say.


--5uh5ZyA4HcdyiNVD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ/oN8ACgkQFA3kzBSg
KbYOVQ//SvRa7pFpZDsYmp4BoiKZFaS1vYbwJiVFgXLFu7s+LqMkohp0KNgRl+YK
VIhqZcpIR7gp52ikHDp0BinRmDoKLp2j1sAmiPzQJHKOHMWfErdDpzAybKAV/1HW
0GXCzZeDwOnURHFO8WRwqBn2LFa6HLO1F3Rnp7apuvbqb3JaKDvRdXWpIFsRgITF
73hVZKOm8bIn8cc3NRAJr6n2PIQVoLOmvcO/WZQIY2ZJZabcB7Z8LAYexHb4OPJp
qG+IN4JPqhWyKelvbDKIuvpmiNtRmO3RMczBa4MSNSipTpeRYjtJCJXJW8Gvewe8
dpqU2/1RfTH+vAo0XJ6tI7UPgmb6g1EE9d/lFRQC+t1gKFQzGtIoa+ay9okQUzln
MZJAOxu2o64uE5mA6HXFpTemhb/7H31kSxKxu1neKMCsY/7o9CRWxMlEe5s/FBmR
1ieHG7udVNqD+/z5HyiaLOEpdhcqeqEkTTdgEIjeQBEwlkFM1gT5da7sUoLNUy/e
N0ZvHG9SAejFX9hw6gtv702mUczNQHGCBp/joWRNqU+/dOSSBwYYc+mmISSSj4rh
MvxoL4dBcn81ZFIScL9RlG4UxmwdYJ0O0CFgLaO9hcosLk0kBUmWO7UlrgD9WWzu
I7dNoWqXkoPDorW0pimTPu45z5GdZu2T+p93+0cB/xO8GlYvwyo=
=FA+C
-----END PGP SIGNATURE-----

--5uh5ZyA4HcdyiNVD--
