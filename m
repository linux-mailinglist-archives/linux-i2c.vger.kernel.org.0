Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27917717BFE
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 11:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234739AbjEaJdJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 31 May 2023 05:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235600AbjEaJdA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 05:33:00 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4F6A0;
        Wed, 31 May 2023 02:32:53 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QWP7Y5pJDz6J76m;
        Wed, 31 May 2023 17:27:53 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 31 May
 2023 10:32:50 +0100
Date:   Wed, 31 May 2023 10:32:50 +0100
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
Subject: Re: [RFC PATCH v2 6/6] HACK: i2c: aspeed: Comment clock out and
 make reset optional
Message-ID: <20230531103250.00006911@Huawei.com>
In-Reply-To: <CAHp75VcaE2-9ZKgmcZXaA668mLZ8XETcUuUdt2asF4aEzx97gg@mail.gmail.com>
References: <20230530145601.2592-1-Jonathan.Cameron@huawei.com>
        <20230530145601.2592-7-Jonathan.Cameron@huawei.com>
        <CAHp75VcaE2-9ZKgmcZXaA668mLZ8XETcUuUdt2asF4aEzx97gg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 30 May 2023 22:59:50 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Tue, May 30, 2023 at 5:59 PM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > Needs tidying up - hopefully can do clock right using ongoing
> > work from Niyas
> > https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28832333867/ACPI+Clock+Management  
> 
> I'm wondering how this will be solved for the cases where the
> "clock-frequency" property is used, see below.
> 
> > ACPI does not provide an equivalent reset deassert / assert. _RST
> > doesn't fit that model, so for now make the reset optional.  
> 
> ...
> 
> >  - Left the clock with the hideous hack to keep it obvious that it is
> >    a hack given no way for us to get the clk rate on ACPI firmware yet
> >    and I don't want to pretend there is.  
> 
> The workaround in some cases is to read the "clock-frequency"
> property, which is standard de facto in several drivers / subsystems.

That's the wrong clock frequency.  I believe that property is the i2c bus clock
frequency Documentation/devicetree/bindings/i2c/i2c.txt 
The one being used here is the input clock.  I'd imagine there is some division
done, but probably doesn't make sense to represent that using the clock framework
as the i2c bus clock signal isn't directly derived from the input clock
(pulse stretching and all sorts of other fun in I2C).  Also massive overkill
given no one else can use this clock.

> 
> That said, why not split this patch into two and switch the clock to
> be optional and use the above property? Okay, one thing is that this
> can collide probably with the generic I2C bus timings, which this
> driver uses with a non-standard property name.
> 

I'd rather provide the clock from ACPI using Niyas' stuff when ready -
it looks like a promising general solution so don't want to put an
partial solution in before that.

I kept these two changes in the last patch as I suspect they are the
ones that can be considered a hack, given we don't actually have a
real platform using ACPI with this device.  Anyone on aspeed know if
anyone cares about ACPI on those BMCs?

Jonathan
