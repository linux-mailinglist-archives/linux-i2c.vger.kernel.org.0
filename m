Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074CA36037A
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 09:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhDOHiY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 03:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhDOHiY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Apr 2021 03:38:24 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747E5C061574
        for <linux-i2c@vger.kernel.org>; Thu, 15 Apr 2021 00:38:01 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so13887539pji.5
        for <linux-i2c@vger.kernel.org>; Thu, 15 Apr 2021 00:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bV8z4QSd0nufHzVv3FL+uGmmlw7+lydosaJYFrEHYIM=;
        b=UlXuelMDXOoQSVWdYVm2kZk4GmYCUjr0cAHLr0AQ+3BA1MzeSVMVy1h2vCnO1EPv9C
         rkDF4+GXpcv7tHZEABCGbcwf0zfSlwAIPHxkIBYxc9fYgGUiNYMabMW1FLO2hLMq6TP0
         l0IyPL+NxG/c72io6h0KUGqauy7raYnmy+kivq9yfq62st2oNXlHG0cPv47XlawxE8gJ
         6DPgZ61OkXIQUyM1/Z1wSATDquXtYwR5D8OTpmCvHlPQ/dtBEQfEMQHgB8PcAFcUQhXQ
         xvQ+rAq4wcUMQWb7yozMQoQQhQAYmHXOfmC/26QioeT4JSCNcvQOw6CTGGVVcVFn+i2Y
         14xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bV8z4QSd0nufHzVv3FL+uGmmlw7+lydosaJYFrEHYIM=;
        b=E3hU0RulorDuRJSnacQXK5wJ5HcuvBlMmNlYqHFATrhVysj/VKUHBHlLth7vNb5Iga
         BBNWQdhW4SlPngpcRNzm8RRMF7stcMz6w87RWlTDmYcUu4phtSd1nwfgYy1kEFrRldue
         2f5+aGHjHMPA+D3Ufb9XT/xo9Xs9AQ3pQ+PTVGd+05NHEXsb869dLyPb30WeYgIHTOqq
         YINQugbUcKVZj+GCQ+226kNSlSmyhUtSejoWfAX4UzTGILSpAR5IEMWybVSU5QZeJ1Kh
         T4PDyLiEiKfwD5wPfXKCktzbgkr3AZoJ5KnyCVaTa5NPK7LFeOtlihZViYFIZAXCRzz8
         Q5qA==
X-Gm-Message-State: AOAM532qs1EQ0RWFY2FFwm0X0VbM/KHo8I6CAmeWZ8iCXdcAUnrHT1u5
        YCU6tw+QBuXNcVA9bxjPXMhokRbwx3GnAA==
X-Google-Smtp-Source: ABdhPJyDYUPYXOVD7f9hOJgeXWzMe7D3X1xGDL494j5mzSAYQne7ZxLnlrs5fKIxjtxA6Lc6K+skHw==
X-Received: by 2002:a17:90a:f298:: with SMTP id fs24mr2491679pjb.176.1618472280905;
        Thu, 15 Apr 2021 00:38:00 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id h68sm1312274pfe.111.2021.04.15.00.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 00:37:59 -0700 (PDT)
Date:   Thu, 15 Apr 2021 13:07:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, Jie Deng <jie.deng@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210415073758.lfy33n6y6kvp3yvk@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
 <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
 <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
 <20210415064538.a4vf7egk6l3u6zfz@vireshk-i7>
 <b25d1f4e-f17f-8a14-e7e6-7577d25be877@intel.com>
 <20210415072131.GA1006@kunai>
 <20210415072431.apntpcwrk5hp6zg4@vireshk-i7>
 <20210415072823.GB1006@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415072823.GB1006@kunai>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15-04-21, 09:28, Wolfram Sang wrote:
> 
> > Now that we were able to catch you, I will use the opportunity to
> > clarify the doubts I had.
> > 
> > - struct mutex lock in struct virtio_i2c, I don't think this is
> >   required since the core takes care of locking in absence of this.
> 
> This is likely correct.
> 
> > - Use of I2C_CLASS_DEPRECATED flag, I don't think it is required for
> >   new drivers.
> 
> This is definately correct :)

Glad to hear that. Thanks.

-- 
viresh
