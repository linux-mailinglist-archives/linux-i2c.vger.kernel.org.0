Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D0B223E0A
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 16:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgGQOaf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 10:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgGQOaf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 10:30:35 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C76DC0619D2;
        Fri, 17 Jul 2020 07:30:35 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ls15so6606016pjb.1;
        Fri, 17 Jul 2020 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yaYi6h5B07rG4qeTioPMA8wvtoyirSTqGxPbp9nZgr0=;
        b=NXVxk+YlNj2Eam6zrVgjF0M4+RBDbyoBR9TVuKV9iKiNEXXMbsznnDpgzHmNo0QVkk
         FvVN2zikv8iZiT65/2RSrVb2MZlMnV4Q+prItsKSqekuu8t4y8FButbsVMyVT4IVYhxX
         Kg5RW9MLCQzrsvBSqVI+sh+cBOzrpqNodI10vi+DpAWRdCsJyw5g482am//xgazEFb2X
         ueUFfFJGPBhv92/tFMZgllhWDDfR9DHK5A4ixDGPQPZ0a6hTaETMowE888FbWutWhqiX
         biH7n/ngAM8Gn6jl7hJ4OwLSX524YJXshUEh/UvKycGJmWxAGFUsTl8Z6IsUNuVCRLw1
         vlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yaYi6h5B07rG4qeTioPMA8wvtoyirSTqGxPbp9nZgr0=;
        b=OftskObNsnVWVSzdt/iw2fxsmN6ZTppyR9OyDjfNTNN3kc5P3pmoUcBJdQj8wm3wBh
         fYS5kU0+o01Ty1Ew5d3aFOW5I9iD4I7LRbglzI26qCHKTq8olzHslnbXoQiht7RtF9r9
         Bt7hHrGkbYkVK+hqIAdcHVY44ZyNb9cOKOtDVtZ/zwV7cUdt8yw+i0SNCBIdSDmXFAtR
         BjLmaCOD561uG0rgKTb+lxnhg1N7vrPi1W6dSwK0S24hAZ+RSnoDHs81enFnPU71Sw0R
         Rf705zcB/JA61C0EMIiPRuEJMplx0LKaQ+PKWy5/WnsCB+PazCviT181YCMtme7q16F9
         NU8g==
X-Gm-Message-State: AOAM530Ya1GEDbj+yJmfBvbOarZ2Cj7iyCOc0l7LaiBzwKZ9d+vT45M2
        E8YchoxLt00NCNUWJ6f8AkA=
X-Google-Smtp-Source: ABdhPJwDrmJiLhA2SZTMj3XfHOsOUgrx43kJPrUeWY8fwYz+3Bagj07sK2ZvjRzGhbroviQYMv7sTQ==
X-Received: by 2002:a17:902:547:: with SMTP id 65mr7767642plf.191.1594996234764;
        Fri, 17 Jul 2020 07:30:34 -0700 (PDT)
Received: from localhost ([89.208.244.139])
        by smtp.gmail.com with ESMTPSA id y19sm7946672pgj.35.2020.07.17.07.30.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 07:30:34 -0700 (PDT)
Date:   Fri, 17 Jul 2020 22:30:30 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, wsa+renesas@sang-engineering.com,
        linus.walleij@linaro.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 1/2] drivers: provide devm_platform_request_irq()
Message-ID: <20200717143030.GB25998@nuc8i5>
References: <20200527142611.9006-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527142611.9006-1-zhengdejin5@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 10:26:10PM +0800, Dejin Zheng wrote:
Hi Jonathan, Greg, Rafael, Linus, Michal and Wolfram:

Could you help me review this patch if you have free time?
Thank you very very much!

BR,
Dejin
> It will call devm_request_irq() after platform_get_irq() function
> in many drivers, sometimes, it is not right for the error handling
> of these two functions in some drivers. so provide this function
> to simplify the driver.
> 
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v2 -> v3:
> 	- add devm_platform_request_irq() to devres.rst by Grygorii's
> 	  suggestion.
> v1 -> v2:
> 	- The patch content has not changed. just resend it by this discussion:
> 	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
> 
 
