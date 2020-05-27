Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31021E4444
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 15:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388699AbgE0Nrd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 09:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388082AbgE0Nrc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 09:47:32 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C725C08C5C1;
        Wed, 27 May 2020 06:47:32 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n18so11846244pfa.2;
        Wed, 27 May 2020 06:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e+LlzM8eRRXovrDneSFuJkBLmDZwpojAdLmJnEys/Lw=;
        b=c7wuBZLu+ZvfRprjThesksjt1WuCEeFEQaTj53GZ55hX6AisYzy8NmW5x1JOjAhw8G
         e2P6qbEzWfCAFVVJ540TBSWFil1agP2BgF4x/ou2r/qPC58u1kjDoqmJlU74jIT2fKuQ
         M+63K/fuRwrxPZESK2m0Tnobl+Evn7gP5CkXjQOmepijiz9WxyL00fEUXVWVG0EQmo50
         U3tLJvmx21wrspo6lsQMg5OIdysurU3lDpKoRxq0Y+8qTuz2aRmhEHOpTO51zriqx7bQ
         483fNU4RHGYXqZQMlAlP0zEeXNlbU5EgdJpNA8xPqAdFrHYN2aYO0Ffxx0EKF+YlU9wo
         0fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e+LlzM8eRRXovrDneSFuJkBLmDZwpojAdLmJnEys/Lw=;
        b=XSDx99ViC8enSOnmJq/wA643GNMRUcGhzspYKeGWK1kHOCV1R/iWi9tqDINs6kWkAQ
         9ehzlQfHMussfgplVp3CJk4ns0mWnRbb4By1OQQUd1JSchDERyElWtRX++JTOJckYwD9
         /aDBR0+4TRjMsxkWa7KJMQwFEhKc6gBqjtgn5m6boYFlOeBw3YMyxPy7N39R2zQD6KMO
         LSw5czEATw4FV7btWxynGf5Xm3ytrHgbBxhaSwx7eW65d8dplF/FZ0JFcwt4kGfe5M5o
         9s0c0DMa03MgYh/GpdiyN7MtLMol09uCAajOp7F+nWgCOj2U7ZHQtV57nDGmlYcwMDWB
         XjHw==
X-Gm-Message-State: AOAM531iKuBZn7Q+HWq4Xf5A7Eznvhu8GttCKOHxmAyHA1Ecs46HMwac
        LiErx4jvqjUXeUIf/2v+U5Y=
X-Google-Smtp-Source: ABdhPJxUkwmN6QnH52X0T6J4spSmP08lob0DVRsK8ZKWK3zAR5Qheiptq3GrbeAHU5Kkh3adpkxddQ==
X-Received: by 2002:a62:ee07:: with SMTP id e7mr3956340pfi.42.1590587251985;
        Wed, 27 May 2020 06:47:31 -0700 (PDT)
Received: from localhost ([144.34.194.82])
        by smtp.gmail.com with ESMTPSA id v197sm2320727pfc.4.2020.05.27.06.47.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 06:47:31 -0700 (PDT)
Date:   Wed, 27 May 2020 21:47:26 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drivers: provide devm_platform_request_irq()
Message-ID: <20200527134726.GD7143@nuc8i5>
References: <20200523145157.16257-1-zhengdejin5@gmail.com>
 <20200523160828.GE3459@ninjato>
 <20200523170933.GA16771@nuc8i5>
 <ad90d9b5-5906-fef3-85b8-00c7eff70e61@xilinx.com>
 <52fdb5f6-2108-4857-8d0f-3f17ee863781@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52fdb5f6-2108-4857-8d0f-3f17ee863781@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 26, 2020 at 08:13:25PM +0300, Grygorii Strashko wrote:
> 
> 
> On 25/05/2020 10:05, Michal Simek wrote:
> > On 23. 05. 20 19:09, Dejin Zheng wrote:
> > > On Sat, May 23, 2020 at 06:08:29PM +0200, Wolfram Sang wrote:
> > > > On Sat, May 23, 2020 at 10:51:55PM +0800, Dejin Zheng wrote:
> > > > > It will call devm_request_irq() after platform_get_irq() function
> > > > > in many drivers, sometimes, it is not right for the error handling
> > > > > of these two functions in some drivers. so provide this function
> > > > > to simplify the driver.
> > > > > 
> > > > > the first patch will provide devm_platform_request_irq(), and the
> > > > > other patch will convert to devm_platform_request_irq() in some
> > > > > i2c bus dirver.
> > > > > 
> > > > > v1 -> v2:
> > > > > 	- I give up this series of patches in v1 version. I resend this
> > > > > 	  patches v2 by that discussion:
> > > > > 	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
> > > > > 	  The patch content has not changed.
> > > > 
> > > > I don't understand. v1 has been nacked because of technical reasons. How
> > > > did the discussion above change the situation? Am I missing something?
> > > > 
> > > No, you are not missing something. Maybe I did not explain clearly.
> > > 
> > > The v1 has been nacked because Grygorii told me that the
> > > function platform_get_irq() should be done as early as possible to avoid
> > > unnecessary initialization steps, and the function devm_request_irq()
> > > should be done late in probe when driver and HW are actually ready to
> > > handle IRQs. It can do the other things between the two funtions. I agree
> > > with him that it may be necessary in some complex drives. So abandon the
> > > patch v1.
> > > 
> > > Base on the discussion of you and Michal, I think maybe this patch is also
> > > needed for the simple driver or the driver of already use it like that:
> > > 	
> > > 	irq = platform_get_irq(pdev, 0);
> > > 	if (irq < 0)
> > > 		return irq;
> > > 	ret = devm_request_irq()
> > > 
> > > It provides a common error handling and reduce one function call for each
> > > drivers, more easier to use and simplify code. So resend it.
> > > 
> > > BR,
> > > Dejin
> > > 
> > > > > 
> > > > > Dejin Zheng (2):
> > > > >    drivers: provide devm_platform_request_irq()
> > > > >    i2c: busses: convert to devm_platform_request_irq()
> > > > > 
> > > > >   drivers/base/platform.c            | 33 ++++++++++++++++++++++++++++++
> > > > >   drivers/i2c/busses/i2c-bcm-kona.c  | 16 +++------------
> > > > >   drivers/i2c/busses/i2c-cadence.c   | 10 +++------
> > > > >   drivers/i2c/busses/i2c-digicolor.c | 10 +++------
> > > > >   drivers/i2c/busses/i2c-emev2.c     |  5 ++---
> > > > >   drivers/i2c/busses/i2c-jz4780.c    |  5 ++---
> > > > >   drivers/i2c/busses/i2c-meson.c     | 13 ++++--------
> > > > >   drivers/i2c/busses/i2c-mxs.c       |  9 +++-----
> > > > >   drivers/i2c/busses/i2c-pnx.c       |  9 ++------
> > > > >   drivers/i2c/busses/i2c-rcar.c      |  9 +++-----
> > > > >   drivers/i2c/busses/i2c-rk3x.c      | 14 +++----------
> > > > >   drivers/i2c/busses/i2c-sirf.c      | 10 ++-------
> > > > >   drivers/i2c/busses/i2c-stu300.c    |  4 ++--
> > > > >   drivers/i2c/busses/i2c-synquacer.c | 12 +++--------
> > > > >   include/linux/platform_device.h    |  4 ++++
> > > > >   15 files changed, 72 insertions(+), 91 deletions(-)
> > 
> > If you look at all driver except for cadence one it doesn't do any
> > change and I can't see any issue with it because sequences are the same
> > as were before.
> > 
> > Regarding Cadence and Grygorii's comments:
> > We are not checking that id->irq is valid that's why even if that fails
> > driver continues to work. Which means that this change doesn't increase
> > boot time or change code flow.
> > On Xilinx devices cadence i2c is connected to ARM GIC which is
> > initialized very early and IRC controller should be up and running all
> > the time.
> > That's why I can't see any issue which this change on Cadence driver too.
> 
> 
> My main point was to pay attention on changes, which may be risky
> especially when they are part of bulk changes (such optimization tend to spread
> fast and all over the kernel without proper review).
> 
> Sry, if i introduced some misunderstanding, but it seems worked and this patch has got more attention.
> There are no objection from my side to use devm_platform_get_and_ioremap_resource() if driver
> owners find it acceptable.
>
This should be my misunderstanding regarding your comment in patch v1,
Anyway, thanks everyone for using your precious time to review my patch.

And also I very sorry for the Gmail will prevent me sending messages to
a large number of recipient, I had to reduce the number of recipients to
send this email. so sorry!

BR,
Dejin

> -- 
> Best regards,
> grygorii
