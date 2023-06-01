Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE023719661
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 11:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbjFAJIf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 1 Jun 2023 05:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjFAJIe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 05:08:34 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6AE128;
        Thu,  1 Jun 2023 02:08:33 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QX0fk3wqxz6J7S8;
        Thu,  1 Jun 2023 17:08:30 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 1 Jun
 2023 10:08:31 +0100
Date:   Thu, 1 Jun 2023 10:08:30 +0100
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
Subject: Re: [RFC PATCH v3 5/7] i2c: aspeed: switch to generic fw
 properties.
Message-ID: <20230601100830.000036d7@Huawei.com>
In-Reply-To: <CAHp75Vd-4p=3QvCPpzUpZt_sAWfFS4r93aqDLAjHqZguhn3NSQ@mail.gmail.com>
References: <20230531100600.13543-1-Jonathan.Cameron@huawei.com>
        <20230531100600.13543-6-Jonathan.Cameron@huawei.com>
        <CAHp75Vd-4p=3QvCPpzUpZt_sAWfFS4r93aqDLAjHqZguhn3NSQ@mail.gmail.com>
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

On Wed, 31 May 2023 20:45:08 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Wed, May 31, 2023 at 1:08 PM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > Moving over to generic firmware properties allows this driver to
> > get closer to working out of the box with both device tree and
> > other firmware options, such as ACPI via PRP0001.
> >
> > Tested only via QEMU emulation.  
> 
> ...
> 
> >  static int aspeed_i2c_probe_bus(struct platform_device *pdev)
> >  {
> > -       const struct of_device_id *match;  
> 
> With
> 
>   struct device *dev = &pdev->dev;
> 
> ...
> 
> > +       device_property_read_u32(&pdev->dev,
> > +                                "bus-frequency", &bus->bus_frequency);  
> 
> This can take one or both parameters on one line.
> 
> ...
> 
> > +       bus->get_clk_reg_val =
> > +               (aspeed_get_clk_reg_val_cb)device_get_match_data(&pdev->dev);  
> 
> This one as well I believe.
> 
> Also others, but it can be done in a separate patch.
> 

I thought about it, but decided out of scope for this set.
I'm not aiming for too much general tidying!

Jonathan


