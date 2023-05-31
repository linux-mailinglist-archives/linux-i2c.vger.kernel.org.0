Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17C0717C0D
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 11:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235561AbjEaJgE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 31 May 2023 05:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235551AbjEaJgD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 05:36:03 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBEFC0;
        Wed, 31 May 2023 02:36:03 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QWPH00mwQz67lVg;
        Wed, 31 May 2023 17:34:20 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 31 May
 2023 10:36:00 +0100
Date:   Wed, 31 May 2023 10:36:00 +0100
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
Subject: Re: [RFC PATCH v2 2/6] i2c: aspeed: Use platform_get_irq() instead
 of opencoding
Message-ID: <20230531103600.00006551@Huawei.com>
In-Reply-To: <CAHp75VdNXtnorvx+aFhkkQZdgArVLuU_0-W-OKUyyarntt6vwA@mail.gmail.com>
References: <20230530145601.2592-1-Jonathan.Cameron@huawei.com>
        <20230530145601.2592-3-Jonathan.Cameron@huawei.com>
        <CAHp75VdNXtnorvx+aFhkkQZdgArVLuU_0-W-OKUyyarntt6vwA@mail.gmail.com>
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
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 30 May 2023 22:45:30 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Tue, May 30, 2023 at 5:57 PM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > A cleanup in it's own right.  
> 
> its ?

Pah. English - a language that I can't write in despite it being
my native tongue ;)

> 
> > This has the handy side effect of working for ACPI FW as well
> > (unlike fwnode_irq_get() which works for ARM64 but not x86 ACPI)  
> 
> ...
> 
> >  #include <linux/of_address.h>  
> 
> >  #include <linux/of_platform.h>  
> 
> With your commit message I'm wondering why these are still there. Do
> we have some OF calls that are optional and do not affect
> functionality (in ACPI case)?
> 
> 

