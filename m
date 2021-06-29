Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2C63B7131
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 13:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233382AbhF2LTQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 07:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233366AbhF2LTC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Jun 2021 07:19:02 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40938C061760
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 04:16:33 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id mn20-20020a17090b1894b02901707fc074e8so1757375pjb.0
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 04:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xjV/iKi34jYFMReQkJHVyPn/3R5zf+ElzbUkU1MRvAQ=;
        b=dKJFli8NYw/mQKH3Kw4Xh/mZ1c75VxNBWzg2+Q31Y4qkdcoAI/y405XkWNU8+TlS4f
         zX3H5e5QzRv47ovxV/fZR0a2D8g1VDKvN37yUK9i7Lk3xCny/f5logx3MyHjdJO00P8e
         u3Js/sBNx6gl08KPRHp6lzQsxUCb60h+4Ep1hlpzJTACykLZhadUKt+onNeH3ossfpx7
         INL/XMqjN/KfiLrBaVcUGAIokQh9Bxz4z2/9ESGXFmx7KQFDFzuT64+WsCU/yR+1eyVR
         RQ8nO2Gz2D4W46BWxZDzoNW6tUm6i4eTxkp4IyfBwzJ6ZvZlzrNZUifZ/BmrVwPdXlq/
         gAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xjV/iKi34jYFMReQkJHVyPn/3R5zf+ElzbUkU1MRvAQ=;
        b=e8s/jcci6i9JfJsweGZOw20jOXBlX1PwUYTRN0gXesEWh98IBOvQqrRR4fdZO3u4G9
         fT2aPXRE+LO/iyXaxL013s92gPiQAe24rw6QISvfVmm4n4hSWTSQHIUTS2AGnUJRAssF
         jPA70PR0ekoXIeFUl4vCSqGfnfBfTJCcCOCq9zKh0xeq96ubBieElUMEZVm6BdO7Xe4i
         AQ2u5AUlqzYOMQ7h9c/sZ3DoeA+A+pp+VJrZSSLSJgCHSbliALogHgJulF7nCmwXcVxj
         7l/nOOt63Rh7j6TGfNz17IYY1dd5VwUdui8R09l9fiUCqQmDOp7ooCXvHCXTKMoXY3yk
         zdqg==
X-Gm-Message-State: AOAM530zhSVpyBg4snxZTVNF7U4UBDrkFX8fch1a8h8D8kqUyTRIuhdA
        XaUE3OlOYGvqADR2elXrL/6QUw==
X-Google-Smtp-Source: ABdhPJy+UGCUCuflwbi6dPqqusA18cX4k4AwlBxGfReRGnObOnWyb1uOJgfgGDyhAKi/3y/XEkRRMw==
X-Received: by 2002:a17:903:18e:b029:127:a5ba:7243 with SMTP id z14-20020a170903018eb0290127a5ba7243mr22916869plg.4.1624965392695;
        Tue, 29 Jun 2021 04:16:32 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id u11sm17854532pjf.46.2021.06.29.04.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 04:16:32 -0700 (PDT)
Date:   Tue, 29 Jun 2021 16:46:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>, Jie Deng <jie.deng@intel.com>,
        linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210629111630.badum3mtumcujbyk@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
 <YNr0uDx1fv+Gjd7m@ninjato>
 <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
 <YNr5Jf3WDTH7U5b7@ninjato>
 <YNr5ZRhT3qn+e9/m@ninjato>
 <20210629105649.nt63mxtiy6u7de3g@vireshk-i7>
 <YNr/2E/T4FRjLOgy@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNr/2E/T4FRjLOgy@ninjato>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29-06-21, 13:11, Wolfram Sang wrote:
> 
> > The case when ``length of \field{write_buf}''=0, and at the same time,
> > ``length of \field{read_buf}''=0 is called not-a-read-write request
> > and result for such a request is I2C device specific.
> 
> Obviously, I don't know much about the specs and their wording. Still I
> wonder if we can't call it a zero length transfer?

Maybe that.

> This is allowed by
> the I2C standard and SMBus has even a proper name for it (SMBUS_QUICK).
> From my point of view, I would not say it is device specific because
> devices are expected to ACK such a message.

Actually we should skip the last line from my diff, i.e. completely
drop "and result for such a request is I2C device specific".

The device (host in virtio spec terminology) still needs to return
success/failure as it does for other requests. Nothing special here.

-- 
viresh
