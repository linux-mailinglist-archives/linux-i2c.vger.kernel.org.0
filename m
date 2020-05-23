Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5048A1DF87B
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 19:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388065AbgEWRJi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 May 2020 13:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388017AbgEWRJh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 May 2020 13:09:37 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F1EC061A0E;
        Sat, 23 May 2020 10:09:37 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id m1so220168pgk.1;
        Sat, 23 May 2020 10:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8bgnQ1KLCVEjAO9szlA67IscwztAgRigBVDr++Cu17U=;
        b=BTN8eeatqn/NGZp+VWE9G00KOaCnzl+GiQKQjwjz82ZhG1oorKNCWfXhpUp5jQXsh+
         nIAB5h/nvtHuYpM63gVFN3HIVbhGvNVsKpr8WRV9dgVt2I8hheeLuXdSeK7fd6KzaGJj
         H4QvcYXR+P7WEHKcScl9NXSapWYnCzmuWsK6w3JZn0jRCA+2gTOTHhPzhGXNpse4fKJy
         lY0egm4BftY/zBdC6HkgGfwk20NEX67O0V2t1VmrrIR4TVd+u6yI6o1PBPo8hWjEyyGz
         mb44H3TuxbOs1Pn4xSqmMc42yhdbsXqbtayyfJQ/V5D5tQoDrzt0GIxN37Yqj0Rtbrlw
         VE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8bgnQ1KLCVEjAO9szlA67IscwztAgRigBVDr++Cu17U=;
        b=KGu8R2mTdcLF7Za0W8sEduDYCiYaV6vo1jxBEOs5Ct81pTec1q+WHSqn5XYlNwzbzP
         +Tlnnt5dm2atdEyt4Fwzb1akgaOwH/ttl0IWaIqZ6EyineYICLF7JTxlBZ3jquqsAWwZ
         ccvvLfsWzvZJ+Y+LJ/sXPfAfmWcn1v3X1CspqBQlRkCEtivPKhr3ZIv/43nDQfARpKUU
         TcRlYAuF1Sc7IZmWM+6AgYSBaCun4bZ1Je5GMMsTtIAvF4HjhMcXRYP4MI27AJGMFAXL
         nMTD8PzkLEJ67Hqf8csD8lA+2uWSxuZfvAkSSw6YMlgpkOY9htrAeA7zWESsqCh73Xcj
         RX3Q==
X-Gm-Message-State: AOAM532Ke6+EnVkqs0sYw2d4GIzas1rfnz5E6BkzCObpQo+b3a7vnlxn
        owPgfjB4C5SmpTPBoJLmxkA=
X-Google-Smtp-Source: ABdhPJwLZLxXE7FoTSOMuP4MjGOWJtGYT8uG8p21Xp6bviW0PfjTIZ3Zf9sjtfHQ2BVP37n4lOd1GQ==
X-Received: by 2002:a62:3381:: with SMTP id z123mr9774612pfz.274.1590253776635;
        Sat, 23 May 2020 10:09:36 -0700 (PDT)
Received: from localhost (176.122.159.134.16clouds.com. [176.122.159.134])
        by smtp.gmail.com with ESMTPSA id l9sm9986840pfd.5.2020.05.23.10.09.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 May 2020 10:09:36 -0700 (PDT)
Date:   Sun, 24 May 2020 01:09:33 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        michal.simek@xilinx.com, baruch@tkos.co.il, paul@crapouillou.net,
        khilman@baylibre.com, shawnguo@kernel.org, festevam@gmail.com,
        vz@mleia.com, heiko@sntech.de, linus.walleij@linaro.org,
        baohua@kernel.org, ardb@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drivers: provide devm_platform_request_irq()
Message-ID: <20200523170933.GA16771@nuc8i5>
References: <20200523145157.16257-1-zhengdejin5@gmail.com>
 <20200523160828.GE3459@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523160828.GE3459@ninjato>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, May 23, 2020 at 06:08:29PM +0200, Wolfram Sang wrote:
> On Sat, May 23, 2020 at 10:51:55PM +0800, Dejin Zheng wrote:
> > It will call devm_request_irq() after platform_get_irq() function
> > in many drivers, sometimes, it is not right for the error handling
> > of these two functions in some drivers. so provide this function
> > to simplify the driver.
> > 
> > the first patch will provide devm_platform_request_irq(), and the
> > other patch will convert to devm_platform_request_irq() in some
> > i2c bus dirver.
> > 
> > v1 -> v2:
> > 	- I give up this series of patches in v1 version. I resend this
> > 	  patches v2 by that discussion:
> > 	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
> > 	  The patch content has not changed.
> 
> I don't understand. v1 has been nacked because of technical reasons. How
> did the discussion above change the situation? Am I missing something?
>
No, you are not missing something. Maybe I did not explain clearly.

The v1 has been nacked because Grygorii told me that the
function platform_get_irq() should be done as early as possible to avoid
unnecessary initialization steps, and the function devm_request_irq()
should be done late in probe when driver and HW are actually ready to
handle IRQs. It can do the other things between the two funtions. I agree
with him that it may be necessary in some complex drives. So abandon the
patch v1.

Base on the discussion of you and Michal, I think maybe this patch is also
needed for the simple driver or the driver of already use it like that:
	
	irq = platform_get_irq(pdev, 0);
	if (irq < 0)
		return irq;
	ret = devm_request_irq()

It provides a common error handling and reduce one function call for each
drivers, more easier to use and simplify code. So resend it.

BR,
Dejin

> > 
> > Dejin Zheng (2):
> >   drivers: provide devm_platform_request_irq()
> >   i2c: busses: convert to devm_platform_request_irq()
> > 
> >  drivers/base/platform.c            | 33 ++++++++++++++++++++++++++++++
> >  drivers/i2c/busses/i2c-bcm-kona.c  | 16 +++------------
> >  drivers/i2c/busses/i2c-cadence.c   | 10 +++------
> >  drivers/i2c/busses/i2c-digicolor.c | 10 +++------
> >  drivers/i2c/busses/i2c-emev2.c     |  5 ++---
> >  drivers/i2c/busses/i2c-jz4780.c    |  5 ++---
> >  drivers/i2c/busses/i2c-meson.c     | 13 ++++--------
> >  drivers/i2c/busses/i2c-mxs.c       |  9 +++-----
> >  drivers/i2c/busses/i2c-pnx.c       |  9 ++------
> >  drivers/i2c/busses/i2c-rcar.c      |  9 +++-----
> >  drivers/i2c/busses/i2c-rk3x.c      | 14 +++----------
> >  drivers/i2c/busses/i2c-sirf.c      | 10 ++-------
> >  drivers/i2c/busses/i2c-stu300.c    |  4 ++--
> >  drivers/i2c/busses/i2c-synquacer.c | 12 +++--------
> >  include/linux/platform_device.h    |  4 ++++
> >  15 files changed, 72 insertions(+), 91 deletions(-)
> > 
> > -- 
> > 2.25.0
> > 


