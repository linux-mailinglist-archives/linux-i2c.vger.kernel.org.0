Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5465D658AE8
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Dec 2022 10:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbiL2JXm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Dec 2022 04:23:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiL2JXY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Dec 2022 04:23:24 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF86F593;
        Thu, 29 Dec 2022 01:23:23 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="322250641"
X-IronPort-AV: E=Sophos;i="5.96,283,1665471600"; 
   d="scan'208";a="322250641"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2022 01:23:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="742253680"
X-IronPort-AV: E=Sophos;i="5.96,283,1665471600"; 
   d="scan'208";a="742253680"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Dec 2022 01:23:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pAp89-001455-1j;
        Thu, 29 Dec 2022 11:23:17 +0200
Date:   Thu, 29 Dec 2022 11:23:17 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V8 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y61chbeq9bo8bi7p@smile.fi.intel.com>
References: <cover.1671688961.git.zhoubinbin@loongson.cn>
 <9d3e4997519fd9ecebae6fd241148cc22d3fe04f.1671688961.git.zhoubinbin@loongson.cn>
 <Y6tqPenv3NBEl9qD@smile.fi.intel.com>
 <CAMpQs4L-2stVQA43hd2Q-uR8fgekLZJmWzmBZvEDg1+AvT3uSQ@mail.gmail.com>
 <Y61bwY4OpRFixx5r@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y61bwY4OpRFixx5r@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 29, 2022 at 11:20:01AM +0200, Andy Shevchenko wrote:
> On Thu, Dec 29, 2022 at 03:31:47PM +0800, Binbin Zhou wrote:
> > On Wed, Dec 28, 2022 at 5:57 AM Andy Shevchenko <andy@kernel.org> wrote:
> > > On Fri, Dec 23, 2022 at 05:00:51PM +0800, Binbin Zhou wrote:

...

> > > > +static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
> > > > +                          struct i2c_msg *msg, bool stop)
> > > > +{
> > > > +     int ret;
> > > > +     bool is_read = msg->flags & I2C_M_RD;
> > > > +
> > > > +     /* Contains steps to send start condition and address */
> > > > +     ret = ls2x_i2c_start(priv, msg);
> > > > +     if (!ret) {
> > > > +             if (is_read)
> > > > +                     ret = ls2x_i2c_rx(priv, msg->buf, msg->len);
> > > > +             else
> > > > +                     ret = ls2x_i2c_tx(priv, msg->buf, msg->len);
> > > > +
> > > > +             if (!ret && stop)
> > > > +                     ret = ls2x_i2c_stop(priv);
> > > > +     }
> > > > +
> > > > +     if (ret == -ENXIO)
> > > > +             ls2x_i2c_stop(priv);
> > > > +     else if (ret < 0)
> > > > +             ls2x_i2c_init(priv);
> > > > +
> > > > +     return ret;
> > > > +}
> > >
> > > Still this code is odd from reader's perspective. It's in particular not clear
> > > if the stop can be called twice in a row. I recommend to split it to two
> > 
> > Sorry,
> > Actually, I don't quite understand why you keep thinking that the stop
> > can be called twice in a row.
> 
> Because nothing in the code suggests otherwise. You need deeply understand
> the flow to ensure that it won't. This means that the code is fragile and
> needs refactoring (even comment, which you can do a least won't help, because
> changing code in the other parts may break all this and you won't notice it).
> 
> > As I said in my last email, the logic here should be:
> > In the first case, stop is called when the last msg is transmitted successfully;
> > In the second case, stop is called when there is a NOACK during the
> > transmission;
> > In the third case, init is called when other errors occur during the
> > transmission, such as TIMEOUT.
> > 
> > The key pointer is the stop function will only return a TIMEOUT error
> > or 0 for success, so if the stop function above is failed, the stop
> > function below will never be called twice.
> > 
> > Anyway, I also admit that this part of the code may not be concise and
> > clear enough, and I have tried the following changes:
> > 
> > 1. put the start function into the rx/tx function respectively. As followers:
> > 
> > @@ -177,10 +177,16 @@ static int ls2x_i2c_start(struct ls2x_i2c_priv
> > *priv, struct i2c_msg *msgs)
> >         return ls2x_i2c_send_byte(priv, LS2X_CR_START | LS2X_CR_WRITE);
> >  }
> > 
> > -static int ls2x_i2c_rx(struct ls2x_i2c_priv *priv, u8 *buf, u16 len)
> > +static int ls2x_i2c_rx(struct ls2x_i2c_priv *priv, struct i2c_msg *msg)
> >  {
> >         int ret;
> > -       u8 rxdata;
> > +       u8 rxdata, *buf = msg->buf;
> > +       u16 len = msg->len;
> > +
> > +       /* Contains steps to send start condition and address */
> > +       ret = ls2x_i2c_start(priv, msg);
> > +       if (ret)
> > +               return ret;
> > 
> >         while (len--) {
> >                 ret = ls2x_i2c_xfer_byte(priv,
> > @@ -195,9 +201,16 @@ static int ls2x_i2c_rx(struct ls2x_i2c_priv
> > *priv, u8 *buf, u16 len)
> >         return 0;
> >  }
> > 
> > -static int ls2x_i2c_tx(struct ls2x_i2c_priv *priv, u8 *buf, u16 len)
> > +static int ls2x_i2c_tx(struct ls2x_i2c_priv *priv, struct i2c_msg *msg)
> >  {
> >         int ret;
> > +       u8 *buf = msg->buf;
> > +       u16 len = msg->len;
> > +
> > +       /* Contains steps to send start condition and address */
> > +       ret = ls2x_i2c_start(priv, msg);
> > +       if (ret)
> > +               return ret;
> > 
> >         while (len--) {
> >                 writeb(*buf++, priv->base + I2C_LS2X_TXR);
> > 
> > 2. define the variable 'reinit' in the xfer_one function to mark the
> > cases where reinit is needed. As follows:
> > 
> > static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
> >                              struct i2c_msg *msg, bool stop)
> > {
> >         int ret, ret2;
> >         bool reinit = false;
> >         bool is_read = msg->flags & I2C_M_RD;
> > 
> >         if (is_read)
> >                 ret = ls2x_i2c_rx(priv, msg);
> >         else
> >                 ret = ls2x_i2c_tx(priv, msg);
> > 
> >         if (ret == -EAGAIN) /* could not acquire bus. bail out without STOP */
> >                 return ret;
> > 
> >         if (ret == -ETIMEDOUT) {
> >                 /* Fatal error. Needs reinit. */
> >                 stop = false;
> >                 reinit = true;

Why do you need to initialize stop here?
Why not to call reinit here and bailout?

> >         }
> > 
> >         if (stop) {
> >                 ret2 = ls2x_i2c_stop(priv);
> > 
> >                 if (ret2) {
> >                         /* Failed to issue STOP. Needs reinit. */
> >                         reinit = true;
> >                         ret = ret ?: ret2;

All the same, try to be less verbose with unneeded variables.

> >                 }
> >         }
> > 
> >         if (reinit)
> >                 ls2x_i2c_init(priv);
> > 
> >         return ret;
> > }
> > 
> > Do you think this is better?
> 
> Slightly, but still twisted at the end with the play of error codes. Try to
> make it even more clear.
> 
> > > functions and then do something like
> > >
> > > _read_one()
> > > {
> > >         ret = start();
> > >         if (ret)
> > >                 goto _stop; // Do we really need this?
> > >
> > >                 ret = rx();
> > >                 if (ret)
> > >                         goto _stop; // Do we need this?
> > >
> > >                 /* By setting this call the stop */
> > >                 if (stop)
> > >                         ret = -ENXIO;
> > >
> > >         out_send_stop:
> > >                 if (ret == ...)
> > >                         return _stop();
> > >                 // I don't like above, so this error checking/setting parts
> > >                 // also can be rethought and refactored accordingly
> > >
> > >                 return ret;
> > > }
> > >
> > >
> > >         if (is_read)
> > >                 ret = _read_one();
> > >         else
> > >                 ret = _write_one();
> > >
> > >         if (ret)
> > >                 _init();
> > >
> > >         return ret;

-- 
With Best Regards,
Andy Shevchenko


