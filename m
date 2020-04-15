Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3931A998D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 11:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896027AbgDOJwS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 05:52:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:34316 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896006AbgDOJvr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 05:51:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7AEE6AE0D;
        Wed, 15 Apr 2020 09:51:44 +0000 (UTC)
Date:   Wed, 15 Apr 2020 11:51:42 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave
 support
Message-ID: <20200415115142.06bc4ea7@endymion>
In-Reply-To: <20200415051619.GP27288@pengutronix.de>
References: <20191204095348.9192-1-s.hauer@pengutronix.de>
        <20200409134027.GB1136@ninjato>
        <20200410112914.67a68e32@endymion>
        <20200414115600.GM27288@pengutronix.de>
        <20200414164009.53e70067@endymion>
        <20200415051619.GP27288@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 15 Apr 2020 07:16:19 +0200, Sascha Hauer wrote:
> On Tue, Apr 14, 2020 at 04:40:09PM +0200, Jean Delvare wrote:
> > Sorry but you lost me here. How can I2C slave support be "optional" and
> > at the same time going without ifdefs?  
> 
> static int i2c_imx_reg_slave(struct i2c_client *client)
> {
> 	if (!IS_ENABLED(CONFIG_I2C_SLAVE))
> 		return -ESOMETHING;
> 	...
> }
> 
> The code is gone without CONFIG_I2C_SLAVE enabled, yet the compile coverage
> is there.

OK, *now* I see where you were going from the beginning ;-) And that
makes sense, for drivers which want optional I2C slave support.

Now I think this is down to 2 questions:

1* Does the i2c-imx driver actually need optional slave support, or can
   this support be included unconditionally? Which distributions or
   builds include this driver, and do they typically enable I2C_SLAVE?
   I took a look at the SUSE kernel configs and we already have
   I2C_SLAVE enabled on armv7 and arm64, so it will make no difference
   there. Only our armv6 config includes this driver without I2C_SLAVE,
   so that's the only one for which keeping the slave support optional
   would help. My point is: you stated that you never used slave
   support, and neither did I, but that's not really relevant. What is
   relevant is whether kernels including these drivers are being built
   with I2C_SLAVE or not in practice. If they are then it doesn't
   matter if individual drivers go the conditional or unconditional
   way, unless they add their own Kconfig option to explicitly enable
   slave support (see below).

2* More generally, how many drivers would benefit from your proposed
   change? At the moment I count 8 drivers selecting I2C_SLAVE, 3 of
   these have a separate Kconfig option for including slave support
   which actually makes slave support optional too but in a different
   way. 1 driver (i2c-slave-eeprom) depends on I2C_SLAVE, and 1 driver
   (i2c-aspeed) has #ifdefs for optional slave support. So we have a
   total of 6 drivers which support slave mode unconditionally and 4
   drivers which have conditional support. That doesn't mean that they
   are right doing what they do though. Their authors may have gone for
   unconditional just because they don't like ifdefs, or they may have
   gone for conditional to play it safe. I'm also wondering why the 3
   drivers which have a dedicated Kconfig option
   (I2C_AT91_SLAVE_EXPERIMENTAL, I2C_DESIGNWARE_SLAVE and
   I2C_PXA_SLAVE) did it that way. Is it on purpose because they
   actually want to be able to force slave mode off even if support is
   available at i2c core level? Is it by politeness to not forcibly
   enable slave mode as soon as the driver is enabled? It matters
   because in the former case, your proposed change is of no interest to
   them, while in the latter case it is.

Unfortunately that's a lot of questions in the end and I do not know
the answers nor am I willing to spend time finding them, sorry.

> The patch I sent was a suggestion to do it like that. If that's not
> wanted I am fine with that and happily select CONFIG_I2C_SLAVE from the
> driver entry in Kconfig, or better, suggest Biwen Li
> (https://patchwork.kernel.org/patch/11271067/) to do this.

Well, there are advantages to both approaches, and without answers to
the questions above, I see no reason to favor one or the other. In such
situation I tend to stick to what we have. But of course the decision
is Wolfram's not mine.

-- 
Jean Delvare
SUSE L3 Support
