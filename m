Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8CBC11AA12
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2019 12:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfLKLmn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Dec 2019 06:42:43 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:40196 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbfLKLmn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Dec 2019 06:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=upVO43a9Ci5B5se9s37thb0usXFTi2WSd9CirMnPlUI=; b=eGxKFcH/4423IzJF91pk4eaie
        adHLOhIkDXN9vgQoAlTHZqRQe8mjyy7W1Jg7K/sZ19MzI7eml0mybh4WxnpA0Bkn/H8VjWN/8stZz
        3lridy+yMPYPiYuKjL1uwaX7V24i3QwpQUxWckpE7C/ACtZoXqA5iBN6Y12HOxK+jcPcqIQdNEeKd
        aQrEPOYPquoxrRtowk8mpWLC5wh/y0AlZ3HVfqvyyfWEzhOhbhEeDG9L5fBPkgC+bZ+fdNzHGkLzt
        /Vem5a8+pXG9vyFa2BfVj/dx5YjoNEgSzbFx0QE5QB3bp8yUlQvW7gnO7ueSHm1hCbDTBx562XZWb
        LmXzo2p3g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51518)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1if0O2-00088j-1L; Wed, 11 Dec 2019 11:42:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1if0Ny-0005pI-I4; Wed, 11 Dec 2019 11:42:30 +0000
Date:   Wed, 11 Dec 2019 11:42:30 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Peng Ma <peng.ma@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH] i2c: imx: Defer probing if EDMA not available
Message-ID: <20191211114230.GC25745@shell.armlinux.org.uk>
References: <20191127071136.5240-1-peng.ma@nxp.com>
 <20191128100613.GI25745@shell.armlinux.org.uk>
 <VI1PR04MB4431CF7F051F9439C84F84FAED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191211104347.GA25745@shell.armlinux.org.uk>
 <VI1PR04MB44313AA19A4F81BA1AD9BC5CED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB44313AA19A4F81BA1AD9BC5CED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 11, 2019 at 11:22:00AM +0000, Peng Ma wrote:
> 
> 
> >-----Original Message-----
> >From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
> >Sent: 2019年12月11日 18:44
> >To: Peng Ma <peng.ma@nxp.com>
> >Cc: festevam@gmail.com; s.hauer@pengutronix.de;
> >linux-kernel@vger.kernel.org; linux@rempel-privat.de; dl-linux-imx
> ><linux-imx@nxp.com>; kernel@pengutronix.de; shawnguo@kernel.org;
> >linux-arm-kernel@lists.infradead.org; linux-i2c@vger.kernel.org
> >Subject: Re: [EXT] Re: [PATCH] i2c: imx: Defer probing if EDMA not available
> >
> >Caution: EXT Email
> >
> >On Wed, Dec 11, 2019 at 10:25:26AM +0000, Peng Ma wrote:
> >> Hi Russell,
> >>
> >> I am sorry to reply late, thanks for your patient reminding, Please
> >> see my comments inline.
> >>
> >> Best Regards,
> >> Peng
> >> >-----Original Message-----
> >> >From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
> >> >Sent: 2019年11月28日 18:06
> >> >To: Peng Ma <peng.ma@nxp.com>
> >> >Cc: linux@rempel-privat.de; kernel@pengutronix.de;
> >> >shawnguo@kernel.org; s.hauer@pengutronix.de;
> >> >linux-kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> >> >festevam@gmail.com; linux-arm-kernel@lists.infradead.org;
> >> >linux-i2c@vger.kernel.org
> >> >Subject: [EXT] Re: [PATCH] i2c: imx: Defer probing if EDMA not
> >> >available
> >> >
> >> >Caution: EXT Email
> >> >
> >> >On Wed, Nov 27, 2019 at 07:12:09AM +0000, Peng Ma wrote:
> >> >> EDMA may be not available or defered due to dependencies on other
> >> >> modules, If these scenarios is encountered, we should defer probing.
> >> >
> >> >This has been tried before in this form, and it causes regressions.
> >> >
> >> >> Signed-off-by: Peng Ma <peng.ma@nxp.com>
> >> >> ---
> >> >>  drivers/i2c/busses/i2c-imx.c | 16 +++++++++++-----
> >> >>  1 file changed, 11 insertions(+), 5 deletions(-)
> >> >>
> >> >> diff --git a/drivers/i2c/busses/i2c-imx.c
> >> >> b/drivers/i2c/busses/i2c-imx.c index 40111a3..c2b0693 100644
> >> >> --- a/drivers/i2c/busses/i2c-imx.c
> >> >> +++ b/drivers/i2c/busses/i2c-imx.c
> >> >> @@ -369,8 +369,8 @@ static void i2c_imx_reset_regs(struct
> >> >> imx_i2c_struct *i2c_imx)  }
> >> >>
> >> >>  /* Functions for DMA support */
> >> >> -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> >> >> -                                             dma_addr_t
> >> >phy_addr)
> >> >> +static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> >> >> +                            dma_addr_t phy_addr)
> >> >>  {
> >> >>       struct imx_i2c_dma *dma;
> >> >>       struct dma_slave_config dma_sconfig; @@ -379,7 +379,7 @@
> >> >> static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> >> >>
> >> >>       dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
> >> >>       if (!dma)
> >> >> -             return;
> >> >> +             return -ENOMEM;
> >> >>
> >> >>       dma->chan_tx = dma_request_chan(dev, "tx");
> >> >>       if (IS_ERR(dma->chan_tx)) {
> >> >> @@ -424,7 +424,7 @@ static void i2c_imx_dma_request(struct
> >> >imx_i2c_struct *i2c_imx,
> >> >>       dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
> >> >>               dma_chan_name(dma->chan_tx),
> >> >> dma_chan_name(dma->chan_rx));
> >> >>
> >> >> -     return;
> >> >> +     return 0;
> >> >>
> >> >>  fail_rx:
> >> >>       dma_release_channel(dma->chan_rx);
> >> >> @@ -432,6 +432,8 @@ static void i2c_imx_dma_request(struct
> >> >imx_i2c_struct *i2c_imx,
> >> >>       dma_release_channel(dma->chan_tx);
> >> >>  fail_al:
> >> >>       devm_kfree(dev, dma);
> >> >> +
> >> >> +     return ret;
> >> >
> >> >Some platforms don't have EDMA.  Doesn't this force everyone who
> >> >wants I2C to have DMA?  The last attempt at this had:
> >> >
> >> >        /* return successfully if there is no dma support */
> >> >        return ret == -ENODEV ? 0 : ret;
> >> >
> >> >here because of exactly this.
> >> >
> >> >>  }
> >> >>
> >> >>  static void i2c_imx_dma_callback(void *arg) @@ -1605,10 +1607,14
> >> >> @@ static int i2c_imx_probe(struct platform_device *pdev)
> >> >>       dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter
> >> >> registered\n");
> >> >>
> >> >>       /* Init DMA config if supported */
> >> >> -     i2c_imx_dma_request(i2c_imx, phy_addr);
> >> >> +     ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> >> >> +     if (ret == -EPROBE_DEFER)
> >> >> +             goto i2c_adapter_remove;
> >> >
> >> >This happens _after_ the adapter has been published to the rest of the
> >kernel.
> >> >Claiming resources after publication is racy - the adapter may be in
> >> >use by a request at this point.  Secondly, there's been problems with
> >> >this causing regressions when EDMA is built as a module and i2c-imx is
> >built-in.
> >> >
> >> >See e8c220fac415 ("Revert "i2c: imx: improve the error handling in
> >> >i2c_imx_dma_request()"") when exactly what you're proposing was tried
> >> >and ended up having to be reverted.
> >> >
> >> >AFAIK nothing has changed since, so merely reinstating the known to
> >> >be broken code, thereby reintroducing the same (and more) problems,
> >> >isn't going to be acceptable.
> >> >
> >> >Sorry, but this gets a big NAK from me.
> >> >
> >> [Peng Ma] I saw the revert commit e8c220fac415 and understand your
> >concerns.
> >> I scan the i2c-imx.c driver, All platforms that use i2c driver and
> >> support dma use an eDMA engine, So I change the code(compare with last
> >patch) as follows, please review and give me your precious comments.
> >> Thanks very much.
> >>
> >> diff --git a/drivers/i2c/busses/i2c-imx.c
> >> b/drivers/i2c/busses/i2c-imx.c index 12f7934fddb4..6cafee52dd67 100644
> >> --- a/drivers/i2c/busses/i2c-imx.c
> >> +++ b/drivers/i2c/busses/i2c-imx.c
> >> @@ -1605,8 +1605,11 @@ static int i2c_imx_probe(struct platform_device
> >> *pdev)
> >>
> >>         /* Init DMA config if supported */
> >>         ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> >> -       if (ret == -EPROBE_DEFER)
> >> +       if (ret == -EPROBE_DEFER) {
> >> +#if    IS_BUILTIN(CONFIG_FSL_EDMA)
> >>                 goto i2c_adapter_remove;
> >> +#endif
> >> +       }
> >
> >You haven't understood _why_ the problem occurs, you're just attempting to
> >patch around it. You're hacking the code, rather than engineering the code.
> >
> >The infinite deferred probe occurs because:
> >
> >- i2c-imx is attempted to be probed.
> >- i2c-imx sets up the hardware, and then calls
> >  i2c_add_numbered_adapter()
> >- i2c_add_numbered_adapter() publishes the bus to the world, and then
> >  searches DT for any children to create - and it finds some and
> >  creates them.
> >- the children devices are matched to their drivers, which bind.  This
> >  triggers a deferred probe to be scheduled.
> >- back in the i2c-imx driver, we get to i2c_imx_dma_request(), which
> >  fails, and you return -EPROBE_DEFER.
> >- the i2c-imx driver probe actions are unwound, and probe exits.
> >- the driver core processes the deferred probe request, finds the
> >  i2c-imx device(s) on the deferred probe list, and attempts to
> >  probe them.  Goto the top of this list.
> >
> [Peng Ma] Thanks for your quick reply, No, I don't think so, when first,second,third...... time probe failed, the i2c_del_adapter will be called(it will remove the i2c children device). I think if We build-in EDMA, after EDMA probe successful, the deffer probe of i2c will probe with no return -EPROBE_DEFER.

Yes, i2c_del_adapter will be called, but that is neither here nor there.
The deferred probe is triggered by _any_ driver binding.  The facts are:

i2c_add_numbered_adapter() creates devices.
These new devices get bound to drivers.
As soon as any one of those devices binds to a driver, deferred probing
is triggered.
When i2c_imx_probe() returns -EPROBE_DEFER, it will be added to the list
of devices to be re-probed by the deferred probing.

> So you say " Goto the top of this list " just i2c drive probe failed with i2c_imx_dma_request() return -EPROBE_DEFER,
> If the EDMA build-in and probe successful this case not happened. Now I am worried about EDMA failed to probe, your case is correct.

You are assuming that EDMA has successfully probed. What if EDMA hasn't
been probed yet, because it has been deferred for some other reason (e.g.
a clock)?

The fact is, the way i2c-imx is structured at present, it is unsafe to
propagate the EPROBE_DEFER error code from i2c_imx_dma_request() under
ANY CIRCUMSTANCES.

> >If, for whatever reason, i2c_imx_dma_request() ever returns -EPROBE_DEFER,
> >the above loop WILL happen.
> >
> >The FUNDAMENTAL rule of kernel programming is that you do NOT publish
> >before you have completed setup.  i2c-imx violates that rule as the probe
> >function is ordered at present.
> >
> [Peng Ma] Yes, I agree, but kernel provide the deffer probe and for the platform devices we don't decide who probe first.

So, because the kernel provides a facility, you think it's fine to
create infinite loops using it?

> >i2c-imx has been written for i2c_imx_dma_request() to be safe to call after the
> >device has been published, but with the current probe function order, it is
> >unsafe to propagate the EPROBE_DEFER return value for the reason above.
> >For the reason the original attempt got reverted.
> >
> >So, if you want to do this (and yes, I'd also encourage it to be conditional on
> >EDMA being built-in, as I2C is commonly used as a way to get at RTCs, which
> >are read before kernel modules can be loaded) then you MUST move
> >i2c_imx_dma_request() before
> >i2c_add_numbered_adapter() to avoid the infinite loop.
> >
> [Peng Ma] To do this, the i2c devices not probe and i2c adapter not register before edma probe.

Which is the correct behaviour, rather than having the kernel cycle
through creating i2c devices, probing i2c drivers, tearing down the
i2c devices and repeating endlessly.

Until you see this, sorry, no, you can't propagate the return value
from i2c_imx_dma_request().  We've tried it, it's caused regressions,
and a problem has been identified that you don't seem to be willing
to recognise _as_ a serious problem with the approach you're trying
to re-implement.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
