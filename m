Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8B027F909
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Oct 2020 07:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgJAF3n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Oct 2020 01:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgJAF3n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Oct 2020 01:29:43 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08F9C061755;
        Wed, 30 Sep 2020 22:29:42 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id c2so4121941qkf.10;
        Wed, 30 Sep 2020 22:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zhY5hxIQkMTQaQ3nm7tEbfUHYEvpPQmlr9WcnS8917k=;
        b=uSUNB1YV1xnHksocWCene6AYfImFzQe38OeAIIpF2pXuVPgqmJebEZzs8DSzWz0od8
         ji7f+nFXQmoXXiaeKy4UaG2djRyE6mZ3fUvHR5/agPA2dTlaMar/T5nIasN+tnOpbJ0f
         o+0Ja2Ard0/NH5M4gE0Xpt1ErwFWKISSg8q72J3Fw3uK6IQebb99cSLlCpcui73d+M20
         NXvbv2S0mPg+nlPWb8IfcxKHdFURFLmKElqnXZnt6dHLVTKHcgofpf3vqVCfTK6idjBS
         KdWrKH//+EWHMBOiex0fSBIBy0wPjvZ6z6wbakp48M3guMWBoSZyCjgqpZpJa4JEaLMx
         vNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zhY5hxIQkMTQaQ3nm7tEbfUHYEvpPQmlr9WcnS8917k=;
        b=tes9UjLAMxu0nzMpJ27YeLk6k14tK+g/vgWh7cqWauI3u74cd8zOSwcfxyJHMq597H
         jvKF0lntaJb77cwCN5CNNdlBRG0+wZKXWv4qsKYll5NRsxjgbxrWchyTrqwKnOWcjQsz
         Q5ajphFJjebaUvJYkktY3Y13du3sCzjzf4ZYW5AlqFfGNkjiQ+iKmDTdj/YuQFLNGuY3
         VsoxGmiTPrO3JWllHxPvl1vX22uzsdLbcvv3E+mEOG+jKJPblAjMMViXMqhy2ltZ9uPq
         yee29SvjAHZTIptwxHBjuoZYVU7Tz3C/zUzPCf2MtdidttcqactJ4goT8ImlZYwFN6/E
         zyCg==
X-Gm-Message-State: AOAM532BD42N672D0WZVo3SLWpp4ZLaTDk5B1UvEauQXe2Cv+P/NzZr4
        pCxanM+XzfbRSnbE0Oa3JjPidIvIFV6kfL1D5Qy/E2xAB+E=
X-Google-Smtp-Source: ABdhPJwFIcT/1nd4aA8mRqtPX7Afn5mDgHKLPqj0BEqHV6EY6auuZ5x+TyxSUGlFdRvfF7aKpN4c+3WG+ng0xQs5nPw=
X-Received: by 2002:ae9:e914:: with SMTP id x20mr5979986qkf.163.1601530181916;
 Wed, 30 Sep 2020 22:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com> <20200930093117.GY3956970@smile.fi.intel.com>
In-Reply-To: <20200930093117.GY3956970@smile.fi.intel.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Thu, 1 Oct 2020 08:32:02 +0300
Message-ID: <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Alex Qiu <xqiu@google.com>,
        Kun Yi <kunyi@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        avifishman70@gmail.com, joel@jms.id.au,
        Tomer Maimon <tmaimon77@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 30, 2020 at 12:31 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 30, 2020 at 10:13:42AM +0300, Tali Perry wrote:
> > Systems that can dinamically add and remove slave devices
>
> dynamically
>
> > often need to change the bus speed in runtime.
>
> > This patch exposes the bus frequency to the user.
>
> Expose the bus frequency to the user.
>
> > This feature can also be used for test automation.
>
> In general I think that DT overlays or so should be user rather than this.
> If we allow to change bus speed settings for debugging purposes it might make
> sense to do this on framework level for all drivers which support that (via
> additional callback or so).

Do you mean adding something like this:

struct i2c_algorithm {
/*
* If an adapter algorithm can't do I2C-level access, set master_xfer
* to NULL. If an adapter algorithm can do SMBus access, set
* smbus_xfer. If set to NULL, the SMBus protocol is simulated
* using common I2C messages.
*
* master_xfer should return the number of messages successfully
* processed, or a negative value on error
*/
int (*master_xfer)(struct i2c_adapter *adap, struct i2c_msg *msgs,
  int num);
....
int (*set_speed)(struct i2c_adapter *adap, unsigned int speed);
....
/* To determine what the adapter supports */
u32 (*functionality)(struct i2c_adapter *adap);

...
};

And expose this feature in functionality?


>
> > Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 36 ++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> > index 2ad166355ec9..44e2340c1893 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2208,6 +2208,41 @@ static const struct i2c_algorithm npcm_i2c_algo = {
> >  /* i2c debugfs directory: used to keep health monitor of i2c devices */
> >  static struct dentry *npcm_i2c_debugfs_dir;
> >
> > +static int i2c_speed_get(void *data, u64 *val)
> > +{
> > +     struct npcm_i2c *bus = data;
> > +
> > +     *val = (u64)bus->bus_freq;
> > +     return 0;
> > +}
> > +
> > +static int i2c_speed_set(void *data, u64 val)
> > +{
> > +     struct npcm_i2c *bus = data;
> > +     int ret;
> > +
> > +     if (val < (u64)I2C_FREQ_MIN_HZ || val > (u64)I2C_FREQ_MAX_HZ)
> > +             return -EINVAL;
> > +
> > +     if (val == (u64)bus->bus_freq)
> > +             return 0;
> > +
> > +     i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> > +
> > +     npcm_i2c_int_enable(bus, false);
> > +
> > +     ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
> > +
> > +     i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
>
> While all these explicit castings?
>
> > +
> > +     if (ret)
> > +             return -EAGAIN;
> > +
> > +     return 0;
> > +}
>
> > +
>
> No need to have this blank line
>
> > +DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%lld\n");
> > +
> >  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
> >                                 struct npcm_i2c *bus)
> >  {
> > @@ -2223,6 +2258,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
> >       debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
> >       debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
> >       debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> > +     debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
> >
> >       bus->debugfs = d;
> >  }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
