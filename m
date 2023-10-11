Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8BE7C52C7
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 14:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346356AbjJKMAE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 08:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346707AbjJKMAB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 08:00:01 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0E4102;
        Wed, 11 Oct 2023 04:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1697025593; x=1728561593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zcmqag0VQHoZA6WRMiv8S5+ydtcfke3E+IxBmneLnaw=;
  b=hwfUgvyGJsITtYVHVLYTuf+N2CypkHDRiQDtRxbnZeWsrOE3Tvc4/cRj
   m1/4C2sy1H436CjIExLYgoNNYI9DD3dVVHWAVqg4cmJN8ORb77/njgTj9
   ErkVx+50W6/Ssl/XxqUW4ERaLUie0WgTkxKkhB2b7BYL+20IwyTB/ZbIQ
   +y7L6B59K8faxuy6anvyPvVUJAzVqGvs626GKwjbSQ89mqALfkFHFoFAX
   ICIQqoJaqKeUrDLa6dBOqcIhRsP8lIx2pqpfoFetlqva3ZygfyP6nPEcw
   ZxzDk2YuK1Ph9k6+kOIfHGNEixkFDbDoepNBMFkcsjC3OoVWDmB+7fEXC
   A==;
X-IronPort-AV: E=Sophos;i="6.03,214,1694728800"; 
   d="scan'208";a="33404816"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Oct 2023 13:59:49 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id B5057280082;
        Wed, 11 Oct 2023 13:59:49 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Stefan Lengfeld <contact@stefanchrist.eu>,
        Krzysztof =?utf-8?B?SGHFgmFzYQ==?= <khalasa@piap.pl>
Cc:     linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org
Subject: Re: Sony IMX290/462 image sensors I2C xfer peculiarity
Date:   Wed, 11 Oct 2023 13:59:50 +0200
Message-ID: <2905840.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <m3fs2htn7g.fsf@t19.piap.pl>
References: <m3y1gpw8ri.fsf@t19.piap.pl> <20231011101553.we3r73xejvqdql5j@porty> <m3fs2htn7g.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Am Mittwoch, 11. Oktober 2023, 13:25:55 CEST schrieb Krzysztof Ha=C5=82asa:
> Stefan,
>=20
> > I cannot answer whether the delay is needed for atomic transfer or not.
> > But I can give a bit of context for I2C atomic transfers in general.
> >=20
> > These where only introduced for a very narrow and special uses shutting
> > down the device/power with external PMICs in the kernel's shutdown
> > handlers.
>=20
> Well, I guess I'm abusing this code a bit.
>=20
> The problem is I use Sony IMX290 and IMX462 image sensors, and they have
> an apparently hard-coded timeout of about 2^18 their master clock cycles
> (=3D ca. 7 ms with my setup). After the timeout they simply disconnect
> from the I2C bus. Of course, this isn't mentioned in the docs.
> Unfortunately, "normal" I2C accesses take frequently more than those
> 7 ms (mostly due to scheduling when all CPU cores are in use). So I
> hacked the IMX I2C driver a bit and now all accesses to the sensor use
> the atomic paths and local_irq_save() (inside the driver only).

I assume that the master clock is running independently to I2C from the SoC=
=20
the sensor is attached to. Your calculations indicate you are assuming ~400=
kHz=20
I2C clock frequency.
But nothing is preventing that sensor from running on a 100kHz I2C bus. Eve=
n=20
this "atomic" hack will not be sufficient in that case.

Best regards,
Alexander

> > My understand is that an ordinary I2C device would just use normal (and
> > sleepable) I2C transfers while the device is in use.
>=20
> You are spot-on here :-) Now I use IMX 290 and 462.
>=20
> OTOH I wonder if such issues are limited to those sensors only.
>=20
> Thanks for your immediate response,


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



