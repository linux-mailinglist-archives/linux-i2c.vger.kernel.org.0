Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB39B1A7FFD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 16:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391081AbgDNOkd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 10:40:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:44552 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391068AbgDNOk0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Apr 2020 10:40:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 20C0AAFC4;
        Tue, 14 Apr 2020 14:40:10 +0000 (UTC)
Date:   Tue, 14 Apr 2020 16:40:09 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave
 support
Message-ID: <20200414164009.53e70067@endymion>
In-Reply-To: <20200414115600.GM27288@pengutronix.de>
References: <20191204095348.9192-1-s.hauer@pengutronix.de>
        <20200409134027.GB1136@ninjato>
        <20200410112914.67a68e32@endymion>
        <20200414115600.GM27288@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 14 Apr 2020 13:56:00 +0200, Sascha Hauer wrote:
> On Fri, Apr 10, 2020 at 11:29:14AM +0200, Jean Delvare wrote:
> > More importantly I can't see how the ifdef'd members of struct
> > i2c_algorithm are the cause of the problem mentioned by Sascha. He
> > seems to be concerned by drivers with *optional* I2C slave support
> > having ifdefs. Why can't this be solved in these drivers directly? What
> > prevents these drivers from unconditionally selecting I2C_SLAVE if that
> > makes their code more simple? This moves the overhead decision to the
> > device driver instead of forcing it to the whole subsystem across all
> > architectures.  
> 
> The drivers could select I2C_SLAVE when they have I2C slave support and
> in fact some drivers do this already. This means that we have the
> overhead of unneeded I2C slave support when we need that driver in the
> Kernel.

I can't make sense of this statement, sorry. How is I2C slave support
"unneeded" if your kernel includes at least one kernel which needs it?

It is true that I2C slave support is included in the kernel code as
soon as any driver selects I2C_SLAVE, even if that driver is not
currently loaded. The only way around that would be to move the common
code for it to a separate module and all specific members to different,
dedicated structures. But that would in turn cause more overhead for
people who need slave support. The current implementation is the result
of a trade-off decision I made back then. It is the same design goal
which explains why I2C_SMBUS is a separate option: many system classes
do not need it and I did not want to waste memory on these. The
difference of I2C_SMBUS is that it was large and isolated enough to
warrant a separate kernel module altogether.

> I just thought it would be nice to have I2C slave support optional while
> still allowing to avoid ifdefs in the driver. Particularly this doesn't
> look nice:
> 
>  static const struct i2c_algorithm i2c_imx_algo = {
>         .master_xfer    = i2c_imx_xfer,
>         .functionality  = i2c_imx_func,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       .reg_slave      = i2c_imx_reg_slave,
> +       .unreg_slave    = i2c_imx_unreg_slave,
> +#endif
> }

Probably a matter of taste, personally I see nothing wrong with it.

> 
> The implementation of these functions need ifdefs as well and compile
> coverage gets worse.

Sorry but you lost me here. How can I2C slave support be "optional" and
at the same time going without ifdefs?

With your patch, device drivers would include slave support even if it
will never be called because that support was not selected at the i2c
core level. That's pretty confusing if you ask me.

It is true that code coverage gets harder with additional configuration
switches, that's the price to pay for being modular.

> Yes, we could select I2C_SLAVE from the driver and I don't really care
> which way we choose, the space overhead is marginal either way.

With the current design, the idea is indeed to let drivers select
I2C_SLAVE when they need it. And I think this solves your problem
nicely as it lets you remove the ifdefs from your driver.

I think it only makes sense to have ifdefs in the driver itself if that
driver can be used on architectures or systems which will never need
slave support and others which will need it, and these systems are
different distribution targets, so that the decision can be made at
build time. If the decision is not going to be made at build time then
the ifdefs only clutter the code and have no value.

More generally I think it is important to have design goals and to
stick to them. The design goal of the current implementation was to let
architectures which do not need slave support have no overhead at all.
This comes at the cost of #ifdefs in the i2c core code and increased
code coverage needs. Usually it should not need #ifdefs in the device
drivers, with the exception of cross-platform devices mentioned above.

If this is no longer desired and we prefer to have more simple core
code and better code coverage at the cost of runtime overhead on
millions of machine, then it can be done but then it must be done
completely, that is, the I2C_SLAVE symbol goes away entirely and slave
support is included in the kernel always, as Wolfram suggested in his
reply. I wouldn't be happy with this move personally but I'm not the
one making the decision and at least it would make sense.

-- 
Jean Delvare
SUSE L3 Support
