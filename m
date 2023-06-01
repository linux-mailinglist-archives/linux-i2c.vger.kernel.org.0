Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88B7F71965E
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 11:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbjFAJHq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 1 Jun 2023 05:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjFAJHP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 05:07:15 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBBDB3;
        Thu,  1 Jun 2023 02:07:14 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QX0dB3mqMz6J7RV;
        Thu,  1 Jun 2023 17:07:10 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 1 Jun
 2023 10:07:11 +0100
Date:   Thu, 1 Jun 2023 10:07:10 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Niyas Sait <niyas.sait@linaro.org>,
        Klaus Jensen <its@irrelevant.dk>,
        Andy Shevchenko <andy@kernel.org>,
        <linux-acpi@vger.kernel.org>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>,
        <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
        "Viacheslav A . Dubeyko" <viacheslav.dubeyko@bytedance.com>
Subject: Re: [RFC PATCH v3 4/7] i2c: aspeed: use a function pointer type def
 for clk_reg_val callback
Message-ID: <20230601100710.00000456@Huawei.com>
In-Reply-To: <CAHp75Ve2mpPPoRG6SQ3nT1uE-y35+-sMDMPQSu97i9_5SDCYZQ@mail.gmail.com>
References: <20230531100600.13543-1-Jonathan.Cameron@huawei.com>
        <20230531100600.13543-5-Jonathan.Cameron@huawei.com>
        <CAHp75Ve2mpPPoRG6SQ3nT1uE-y35+-sMDMPQSu97i9_5SDCYZQ@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 31 May 2023 20:42:15 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Wed, May 31, 2023 at 1:08 PM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > Rather than having to define the parameter types of this function
> > in multiple places, use a single typedef.  
> 
> Suggested-by then?
> 
Good point.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Hopefully Wolfram uses b4 and that will get picked up automatically.

> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >
> > ---
> > v3: New patch to switch to a function pointer as suggested by Andy.
> > ---
> >  drivers/i2c/busses/i2c-aspeed.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> > index 4363bfe06f9b..be93de56f7e4 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -137,6 +137,8 @@ enum aspeed_i2c_slave_state {
> >         ASPEED_I2C_SLAVE_STOP,
> >  };
> >
> > +typedef u32 (*aspeed_get_clk_reg_val_cb)(struct device *dev, u32 divisor);
> > +
> >  struct aspeed_i2c_bus {
> >         struct i2c_adapter              adap;
> >         struct device                   *dev;
> > @@ -145,8 +147,7 @@ struct aspeed_i2c_bus {
> >         /* Synchronizes I/O mem access to base. */
> >         spinlock_t                      lock;
> >         struct completion               cmd_complete;
> > -       u32                             (*get_clk_reg_val)(struct device *dev,
> > -                                                          u32 divisor);
> > +       aspeed_get_clk_reg_val_cb       get_clk_reg_val;
> >         unsigned long                   parent_clk_frequency;
> >         u32                             bus_frequency;
> >         /* Transaction state. */
> > @@ -1011,8 +1012,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
> >         if (!match)
> >                 bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
> >         else
> > -               bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
> > -                               match->data;
> > +               bus->get_clk_reg_val = (aspeed_get_clk_reg_val_cb)(match->data);
> >
> >         /* Initialize the I2C adapter */
> >         spin_lock_init(&bus->lock);
> > --
> > 2.39.2
> >  
> 
> 

