Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D81DA6521B2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 14:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbiLTNtN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 08:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233718AbiLTNtJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 08:49:09 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D1C1A81D;
        Tue, 20 Dec 2022 05:49:06 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="299288632"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="299288632"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 05:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="739763460"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="739763460"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2022 05:49:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p7czM-00CtIU-0L;
        Tue, 20 Dec 2022 15:49:00 +0200
Date:   Tue, 20 Dec 2022 15:48:59 +0200
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
Subject: Re: [PATCH V7 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y6G9S6i1EHyvB/EW@smile.fi.intel.com>
References: <cover.1671451604.git.zhoubinbin@loongson.cn>
 <d44eb07245020431f98fd08e0c05b6926fb31b24.1671451604.git.zhoubinbin@loongson.cn>
 <Y6BhRsPAU30Dqbdv@smile.fi.intel.com>
 <CAMpQs4KcskSZdezVdNk9Q8UFYA3rFJm8CguiTRLdmffqkZ9FCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpQs4KcskSZdezVdNk9Q8UFYA3rFJm8CguiTRLdmffqkZ9FCg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 20, 2022 at 07:47:25PM +0800, Binbin Zhou wrote:
> On Mon, Dec 19, 2022 at 9:04 PM Andy Shevchenko <andy@kernel.org> wrote:
> > On Mon, Dec 19, 2022 at 08:28:33PM +0800, Binbin Zhou wrote:

...

> > > +static int ls2x_i2c_xfer_one(struct i2c_adapter *adap,
> > > +                          struct i2c_msg *msg, bool stop)
> > > +{
> > > +     int ret;
> > > +     bool is_read = msg->flags & I2C_M_RD;
> > > +     struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
> > > +
> > > +     /* Contains steps to send start condition and address */
> > > +     ret = ls2x_i2c_start(adap, msg);
> > > +     if (!ret) {
> > > +             if (is_read)
> > > +                     ret = ls2x_i2c_rx(adap, msg->buf, msg->len);
> > > +             else
> > > +                     ret = ls2x_i2c_tx(adap, msg->buf, msg->len);
> >
> > > +             if (!ret && stop)
> > > +                     ret = ls2x_i2c_stop(adap);
> >
> > So, we will send stop here...
> >
> > > +     }
> >
> > > +     if (ret == -ENXIO)
> > > +             ls2x_i2c_stop(adap);
> >
> > ...and if it fails, we send it again here. Is it okay?
> 
> First of all, I think the logic here is fine:
> In the first case, stop is called when the last msg is transmitted successfully;
> In the second case, stop is called when there is a NOACK during the
> transmission;
> In the third case, init is called when other errors occur during the
> transmission, such as TIMEOUT.

This is not obvious from the code above. Maybe the comment is missing, maybe as
you said the function should be amended and the code is refactored accordingly.

> The key point is that the current implementation of the stop function
> is probably imperfect, it directly ignores the NOACK. The more
> reasonable method would be to judge by LS2X_SR_BUSY(bus busy state).
> The basic idea: if the i2c bus is detected as idle within the timeout
> range of the stop command issued, the stop command is considered
> successful, otherwise -ETIMEDOUT is returned.
> 
> As follows:
>  static int ls2x_i2c_stop(struct i2c_adapter *adap)
>  {
> -       int ret = ls2x_i2c_send_byte(adap, LS2X_CR_STOP);
> +       u8 value;
> +       struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
> 
> -       return (ret == -ENXIO) ? 0 : ret;
> +       writeb(LS2X_CR_STOP, priv->base + I2C_LS2X_CR);
> +       return readl_poll_timeout(priv->base + I2C_LS2X_SR,
> +                                 value, !(value & LS2X_SR_BUSY),
> +                                 100, jiffies_to_usecs(adap->timeout));
>  }
> 
> Now, in the case you mentioned above, the last msg transmission is
> completed and the stop command is sent. If the stop command fails, it
> will only return -ETIMEDOUT and call ls2x_i2c_init().
> 
> Of course, I will use tools like i2c-tools to do more tests.
> 
> Thanks for the detailed review.

You're welcome!

> > > +     else if (ret < 0)
> > > +             ls2x_i2c_init(priv);
> > > +
> > > +     return ret;
> > > +}

-- 
With Best Regards,
Andy Shevchenko


