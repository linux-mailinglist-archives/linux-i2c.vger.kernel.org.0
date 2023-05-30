Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7641371646F
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 16:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbjE3OkR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 30 May 2023 10:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjE3OkQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 10:40:16 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B11B0;
        Tue, 30 May 2023 07:40:11 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QVw0f3CQsz6J7bl;
        Tue, 30 May 2023 22:35:14 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 30 May
 2023 15:40:08 +0100
Date:   Tue, 30 May 2023 15:40:08 +0100
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
Subject: Re: [RFC PATCH 5/6] HACK: i2c: aspeed: Comment the clock and reset
 out.
Message-ID: <20230530154008.0000444b@Huawei.com>
In-Reply-To: <CAHp75Vc=HgNT8WL6pPU3cJy_J5_aC8pomBpSPbe_hDEiJugUvg@mail.gmail.com>
References: <20230525152203.32190-1-Jonathan.Cameron@huawei.com>
        <20230525152203.32190-6-Jonathan.Cameron@huawei.com>
        <CAHp75Vc=HgNT8WL6pPU3cJy_J5_aC8pomBpSPbe_hDEiJugUvg@mail.gmail.com>
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
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 27 May 2023 00:16:36 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, May 25, 2023 at 6:24 PM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > Needs tidying up - hopefully can do clock right
> > using on going work from Niyas
> > https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28832333867/ACPI+Clock+Management  
> 
> For the current code base the easiest way is to switch to _optional
> for clock, or request them based on the type of the fwnode. (Personal
> preference is the _optional() API to call). 

Absolutely agree that would the way to go if people want to support my
crazy.

However, that will leave the input clock frequency unknown which means we'll
program a garbage value into one of the device registers. Doesn't matter
to me, but not good in general.

This is avoiding for now the questions of:
1) Why devm for a clock we hold for 2 lines of code, none of which
   have an error return path...
2) clk_get_rate() is documented as not guaranteed to do anything for
   a clk until enabled, so this is relying on it being enabled by
   someone else or a quirk of the the chip. 

> For the reset isn't it
> transparent already so we got a dummy control (as for regulator)?

I don't think so, but maybe I'm missing something.
There is a devm_reset_control_get_optional() though, similar to the clock
one that returns a NULL if not present. 

I'll use that here to make this a slightly less ugly hack.
If I can handle clocks nicely using Niyas' work then can revisit
whether the i2c and aspeed maintainers would accept making the
reset optional.

Jonathan


> 
> 

