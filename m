Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28CD0527FCB
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 10:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241874AbiEPIgf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 04:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241840AbiEPIgZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 04:36:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D698EE0C0;
        Mon, 16 May 2022 01:36:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 71E1861208;
        Mon, 16 May 2022 08:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E280C385AA;
        Mon, 16 May 2022 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652690182;
        bh=RFUuu65dv4iB6/1sFh3kQ42iMYe1058D2q5TSspj+KQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HCs+nExO5LAGap7FHBM6v6Y/qei7u0YxCf3vO7U2Ls5jqFYpJu/pjJnXbyaRktQzm
         ekjlVdA80nimsoZ3w+NktSIZWPYl+c4QyNrczLChwpmnzqV9xg0MddiGPZLamsgs80
         C8qC2jM8ic0nsrZ0f0FpcVB79cvU5jQuiWYHJtFHvuH2VV5iYaNgQgUXE4ZCPbdFfC
         xp18ez6uMQiNPjVJJRuTDm15mVtxjb7PMui1BYGMc4ckN5OyycvawXozw2KwkC2lbk
         S7nuDWGLlsKPU2r/HKN6jFs/FkGdPNcqIUOxOPxvyKF1/IcjrGlIU0DO3/7K6XNsqG
         UoMfoKcewCgBA==
Date:   Mon, 16 May 2022 10:36:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
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
Message-ID: <YoIM/4O4UPaLRVjg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>, Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Allan Nielsen <allan.nielsen@microchip.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20220325113148.588163-1-clement.leger@bootlin.com>
 <Yn/BFKwzVLwrjF/F@shikoro>
 <12be48dc-b5d1-063c-87a0-050886cc2505@axentia.se>
 <20220516093418.0038845c@fixe.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WFP/yrmed1NCLdav"
Content-Disposition: inline
In-Reply-To: <20220516093418.0038845c@fixe.home>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WFP/yrmed1NCLdav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> While doing the same conversion on the reset subsystem, Rob Herring
> stepped in and mention the fact that this could be done using
> device-tree overlay (even on system with ACPI) .

Thanks for the heads up, I'll drop this series then.


--WFP/yrmed1NCLdav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKCDPsACgkQFA3kzBSg
KbbHbw/+PGfOkObnz8N94i8/XJkTK5uDekSlAaYlBWilWLLcLzLa4PZX1xu4L9m3
PZWQbl6zFCI+EmEXoNuUXuHtXTBn28TQ8Qp4e5GYmr+3A260AiuWvDc7pxBuhH8D
BQGzLYeUUPdvbv81f52Abl3br8l2Kuzd2G4S3ozirjZhaTyWz/20+S5C9ngriIu6
i9djDWgdhBEFM9/bxOYjAudAU4O7VEnlK9cBzijJv4lvQgXITc1G5x4smbXIooCk
1t7ldL+Mis2J0Yl0IjfuKjKSuSocFKjhssZ6hssil8T2sVgA19WywSNeZdn1ND/x
x+ttsX6OqRtVpyZRI3IekHgq4jEnAsW7d4AbrkmWGlS8Sfgt6xGEQGallp7wF/+F
pMIEQzOGw929+SzRhBdxLa+fz9+0a6Edxz5SH4VaOLnSm9sXKqlFZzbRW4n9cDWZ
zRFDNwYSqBVbTr5XgBW8Cv63CWcsot6DuCI74GZTi3+Hdb5/VXUZWBNl7Wr0Dvnr
/Z7ZojFWM8Asgod6FIbZr7Qco/u+CRo3CWpbAaMnRJvko5ib622x3ngAiT/7vFw3
EytV8+0DUFPYYEqHlhOU80r6Xlf8Wzmni54QpRqzM6BvnzDoF9mVi2NxjkD7EUym
bCKTzRQM2aHyTJ1n2WjpSVMzrw93AtURknOcMatejClcDSFEdxM=
=kMPE
-----END PGP SIGNATURE-----

--WFP/yrmed1NCLdav--
