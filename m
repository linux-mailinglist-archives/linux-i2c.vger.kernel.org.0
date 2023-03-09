Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A73126B2F5B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 22:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbjCIVMX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 16:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjCIVMW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 16:12:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B831BAFA;
        Thu,  9 Mar 2023 13:12:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 664D2B81F49;
        Thu,  9 Mar 2023 21:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78835C433EF;
        Thu,  9 Mar 2023 21:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678396338;
        bh=emwxev2joapuzWTO2f23F5wjNsgEZTMzeCLrmUxz/FA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ob7Um5kAO7CzU59lJLPrYGoOplTDNcR1lqQU6UxANZX9ZLaHjs1EfDbjrwnu09o/c
         Wm5lYIveSHn1KFBMxBeyi8AZQGIk13uJLqbG7V7Eof+vJj2mHctYJXq4AK9H8X5SvN
         ZqoaVo4tAn9TST3j1CBWn6jgp4gnysyEbQY7xOTWMLAJk5t/xn9LatMfFQHxFzcZHn
         YjFTc/G2ZjTevT1WhTPnrYsBoERCVMcvJSj3Wc/zioP6B6aSSvW+OHj1G2xaFEP6/9
         NCpIynDWFmsi+fyf4NIHY99HQ8alW5INj0MiIWZunHeVRzOTYrt6itTVnSMi10vzGA
         FYGj3lkobq3ew==
Date:   Thu, 9 Mar 2023 22:12:14 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-mtd@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>,
        Crt Mori <cmo@melexis.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jean Delvare <jdelvare@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/9] i2c: Switch .probe() to not take an id parameter
Message-ID: <ZApLrpD9Op59FgnB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-mtd@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>,
        Crt Mori <cmo@melexis.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jean Delvare <jdelvare@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>, Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
 <20230303220856.ebloz7kjw7sskxym@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="11BnIObYxkIk2nlY"
Content-Disposition: inline
In-Reply-To: <20230303220856.ebloz7kjw7sskxym@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--11BnIObYxkIk2nlY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So this series is ready to be applied once Linus cuts -rc1.

I applied it to for-current now and plan to have it in -rc2. Thank you!


--11BnIObYxkIk2nlY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQKS64ACgkQFA3kzBSg
KbZPuw/5AdHfkTRDnxz7iP/injeW9ZuXdUyU2WNYPhKG7gjBIddIl62rm7/IEca7
p3URnVMb58tnKqvQ8waKpNu/SdPTrtQ/Xp35h3lBN9z2hvybGDjHztUar08DijrQ
EU2K76NS83pZ2vQ0S4NRk3JQdGJVXmYs04hz3XBe9Fk61l+XgOaXjDfVMRYQdAHs
KvjbHB+fCKrRY4pTYO/+3rah9NGj7Igm6bxWs8bwqqSHL7O95xan/NyDFSj6ast7
5otOpDeFE90FeYuvJVhaDThUTf65ko6szMFT7tHRIYo2VPitA28I/Vq2/wei9e1K
d8hwgwd5X73mVLAWK6zYsLN2hyjna6/O/6+AaUSjYzHoKlOHCqjMhfllzCTmqrBc
tbxj4kw5uhH315V+S1wjdpQ/cCYqQQU1c1Lugrkgm/pAdFiyz9PxDap9ovxO5whY
cElHujAXXDjCHU/wVB8rGCjJMlwpr1/mWOrmt7AcWCLUsK7CvuQjqgvDkZ7XuoRJ
4PylU8+/MH+06JGUusE/bdCc1tR/lm1ZPWu0OVWTTdgvuWQ6fqT9xveERYleRl/M
SEUbzagdMe1OqVzEFNoymReVc4Ds8n3IvyltPkR4w4rwSAdWLtoRCXmlf/L6WrBj
SK0w5ZBTZKGdORg7eil1rxWED6YrQaAFOM9GnyCKapCPtM0zp+w=
=wGSr
-----END PGP SIGNATURE-----

--11BnIObYxkIk2nlY--
