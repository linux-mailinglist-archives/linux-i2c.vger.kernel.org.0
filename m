Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC4871637E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 16:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjE3ORm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 30 May 2023 10:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjE3ORl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 10:17:41 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02C111B;
        Tue, 30 May 2023 07:17:09 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QVvYW0nc3z67mXG;
        Tue, 30 May 2023 22:15:11 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 30 May
 2023 15:16:49 +0100
Date:   Tue, 30 May 2023 15:16:48 +0100
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
Subject: Re: [RFC PATCH 3/6] i2c: aspeed: switch to generic fw properties.
Message-ID: <20230530151648.00007d32@Huawei.com>
In-Reply-To: <CAHp75Vd3ARzzWjWV=cRRghHKXMFWkrRXBa2ssCGRCZAqDEAjAA@mail.gmail.com>
References: <20230525152203.32190-1-Jonathan.Cameron@huawei.com>
        <20230525152203.32190-4-Jonathan.Cameron@huawei.com>
        <CAHp75Vd3ARzzWjWV=cRRghHKXMFWkrRXBa2ssCGRCZAqDEAjAA@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
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

On Sat, 27 May 2023 00:11:09 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, May 25, 2023 at 6:23 PM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > Not tested on device tree but works nicely for ACPI :)  

I was planning to abandon these as 'on list for anyone who
cared' but now you've reviewed them I guess I better do
an RFC v2 :)

> 
> Needs a better commit message obviously :-)

:)

> 
> ...
> 
> > -       ret = of_property_read_u32(pdev->dev.of_node,
> > +       ret = device_property_read_u32(&pdev->dev,
> >                                    "bus-frequency", &bus->bus_frequency);  
> 
> Oh, please avoid double effort, i.e. go further and use I²C core APIs
> for the timings. Oh, wait, do they use non-standard property?!

yup :(

Though it is documented as having a default of 100kHz in the devicetree
binding so the original code shouldn't be calling dev_err() and should
just do:

	bus->frequency = I2C_MAX_STANDARD_MODE_FREQ;
	device_property_read_u32(&pdev->dev,
				 "bus-frequency, &bus->frequency);

Fixing that is an unrelated change though. I'll do it for dt
in a precusor patch then carry that forward to here.

> 
> ...
> 
> > +       bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
> > +               device_get_match_data(&pdev->dev);  
> 
> Personally I prefer using pointers in driver_data so we can avoid
> ambiguity for the 0/NULL value returned by this call. But if 0 value
> is considered invalid here, it's probably fine.

It is a pointer, just a function pointer rather than to a structure.
I could wrap it up in a structure but that would be an unrelated
driver change so at very least a separate patch. 

> 
> > +       if (!bus->get_clk_reg_val)
> >                 bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
> > -       else
> > -               bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
> > -                               match->data;  
> 
> 

