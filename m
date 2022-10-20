Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90C20605C6F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Oct 2022 12:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiJTKf4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Oct 2022 06:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiJTKfz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Oct 2022 06:35:55 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938FE11F48B;
        Thu, 20 Oct 2022 03:35:53 -0700 (PDT)
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MtP9b6J9Sz6HJVl;
        Thu, 20 Oct 2022 18:34:43 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 12:35:42 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 11:35:42 +0100
Date:   Thu, 20 Oct 2022 11:35:41 +0100
From:   Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     Wolfram Sang <wsa-dev@sang-engineering.com>
CC:     Jason Gerecke <killertofu@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        "Lars-Peter Clausen" <lars@metafoo.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH v2] i2c: Use u8 type in i2c transfer calls
Message-ID: <20221020113541.0000490e@huawei.com>
In-Reply-To: <Y1BuLyxEKLIAgF+5@shikoro>
References: <20220718153448.173652-1-jason.gerecke@wacom.com>
        <20220803145937.698603-1-jason.gerecke@wacom.com>
        <CAHp75Vd6yEctJoNT6TpJ1+h4ZQckyLsaUSeSCV4MHqg+LUDkcg@mail.gmail.com>
        <CANRwn3TutF6skHQHk08dFUa8gLMVGxui_QN7YK6nDacSpRHtLg@mail.gmail.com>
        <Y1BZ8CjSnrKi+Yos@shikoro>
        <CANRwn3SmrGX2-cqMK=dDTJR=OaxoVM9C+fsaa8jz96ADtH02DA@mail.gmail.com>
        <Y1BuLyxEKLIAgF+5@shikoro>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 Oct 2022 23:37:51 +0200
Wolfram Sang <wsa-dev@sang-engineering.com> wrote:

> > I spent a little time trying to put together a Coccinelle script to
> > take care of everything but I eventually realized the size of the task
> > was larger than I was comfortable with. In particular, even though I
> > might be able to put together a script, I worry I don't have a good
> > way to test the resulting treewide changes to avoid regression.  
> 
> The coccinelle scripts are one thing. I am quite familiar with it, so I
> regard this as "work but doable". My main headache is that I am not sure
> about the best way to upstream the result. I'd like to avoid a flag-day
> where all drivers across all subsystems need to be converted, but I
> don't really see a way around it. Preparing such a branch and make sure
> it does not regress is quite some work on a moving target.

Horrendous though it is, you 'could' take it via a void * intermediate
step.   That way all the warnings will disappear (I think).
You then move all the callers to providing u8 * then switch the function
to that.  Could happen over several cycles with coccicheck moaning about
any new entries in the meantime.

Jonathan


> 
> 

