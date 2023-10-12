Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA6C7C795D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Oct 2023 00:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442986AbjJLWST (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 18:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442960AbjJLWST (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 18:18:19 -0400
X-Greylist: delayed 999 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 12 Oct 2023 15:18:17 PDT
Received: from stcim.de (stcim.de [IPv6:2a01:4f8:151:40c4::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B72BB8;
        Thu, 12 Oct 2023 15:18:17 -0700 (PDT)
Received: from stc by stcim with local (Exim 4.92)
        (envelope-from <stc@stcim.de>)
        id 1qr3kF-0007rM-Hb; Fri, 13 Oct 2023 00:01:27 +0200
Date:   Fri, 13 Oct 2023 00:01:27 +0200
From:   Stefan Lengfeld <stefan@lengfeld.xyz>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
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
Message-ID: <20231012220127.GB27838@stcim.de>
References: <m3y1gpw8ri.fsf@t19.piap.pl>
 <CAPY8ntASwh3AcRqE+2zF4Df=u+=wJ5K9icAeOrXTMJGDd1+caw@mail.gmail.com>
 <m3o7hfx3ob.fsf@t19.piap.pl>
 <m37cnuvmhn.fsf@t19.piap.pl>
 <m3o7h5tthf.fsf@t19.piap.pl>
 <m3jzrttrmz.fsf@t19.piap.pl>
 <20231011101553.we3r73xejvqdql5j@porty>
 <m3fs2htn7g.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m3fs2htn7g.fsf@t19.piap.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

> > My understand is that an ordinary I2C device would just use normal (and
> > sleepable) I2C transfers while the device is in use.
> 
> You are spot-on here :-) Now I use IMX 290 and 462.
> 
> OTOH I wonder if such issues are limited to those sensors only.

Hmm, yes. I know no other I2C device that has these timeout issues. (*)

> The problem is I use Sony IMX290 and IMX462 image sensors, and they have
> an apparently hard-coded timeout of about 2^18 their master clock cycles
> (= ca. 7 ms with my setup). After the timeout they simply disconnect
> from the I2C bus. Of course, this isn't mentioned in the docs.

hmm. I have no idea about this sensor and your setup. So I can just give hints:

This timeout seems strange. If this 7 ms timeout is required, it would mean
that I2C masters require to fullfill real-time/deadline requirements.  For
"small" I2C master in microcontrolles this seems ok-ish, but for general
operating systems real-time requirements are hard.  The real-time patches for
linux just landed recently and it still requires fine tuning the system for the
required deadlines.

Maybe you just hit a corner case or a bug, that can be avoid, in the I2C
device.  Maybe check with the manufacturer directly?

> Unfortunately, "normal" I2C accesses take frequently more than those
> 7 ms (mostly due to scheduling when all CPU cores are in use).

Yes, correctly. There are multiple cases in which I2C transactions to the same
device can be preempted/delayed: A busy system, as you said, or when some other driver
in the kernel accesses another I2C device on the same bus. This will lock the
bus/I2C adapter for the duration of its transfer.

Do you know the I2C repeated start feature [1]? This allows to batch together
multiple I2C read/writes in a single transfer. And in the best case, this
transfer is executed in one go without a delay in between. At least in the
kernel it's guaranteed that no other driver can go in between with another
transfer.

Kind regards,
Stefan

[1]: https://www.i2c-bus.org/repeated-start-condition/

(*) Fun answer: Actually external watchdogs have timeouts. But the timeout
duration is in the range of seconds, not milliseconds. And timeout expiration
is expected (in error cases ;-).
