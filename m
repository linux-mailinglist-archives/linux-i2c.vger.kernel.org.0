Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05AEC3B6FF1
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 11:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbhF2JQI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 05:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232680AbhF2JQI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Jun 2021 05:16:08 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28849C061760
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 02:13:40 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c15so10529942pls.13
        for <linux-i2c@vger.kernel.org>; Tue, 29 Jun 2021 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/mbR5W4jZNhMRD0mHPnAUx4Qn6VhbPpqpMkPdEN+qCw=;
        b=h3kBBqZh8DPMfpKRMWrkgKG29VmYBFChBsDU6VX3DQIGT21s30+n7loOWNEwLULJYI
         Jt8PlO/AdtorV+BXuwyRi5kVsr/8ziGzZMkIs3sJlT5fkFZCzN4jQe6G5vENi2ghiEy8
         iSNsGWR26aZam456igvzC+A99sXH2vJu5VKvcUa2iqjv8WhojD8w1sNmx2vVtIh6nG9f
         kGvt0hXL+39Ps8C7+wFO1T4JDY4eqpFtYTpVjsIOpfDJ/37P8Mv1qQdYb+kdtERLN5x3
         feYqRfWr4ac7x/b6I81iyeAC/Ivqgui8c/Oha+9yYCJN4UyNY+e21Tm5FyYlLQlnrI+2
         s81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/mbR5W4jZNhMRD0mHPnAUx4Qn6VhbPpqpMkPdEN+qCw=;
        b=P1RZK4I2f8nTWxLr4PSzZ5LiDHQiJeV1Dbu9lffBLTSUqkVaVFZwIstz0iehU84vgN
         uXGHUWdUorXIKQ2mIwifQ35kZQzUrBeNGgiTZyQVIQPRP34j9GPI3sL9s6iFrEzhRVWt
         GVl0olVfRB0eMk9sI2ercSo08uL6JcZRwQjNAxtTvHBUcV6v1Fib4F3jxQ7T5j3YmAIr
         EetD68cb6+a/JAa33/IuUpAfLKt7XACV+aW2AJwY8hGY69otgWCS76UiNatuynh1itBf
         AzPrXAcMrmvt8F33sIklzt2DTH+lrnR59URzKK8+FG+UBG6SY33TUxKYJ2PsPoDt5uaT
         QAOA==
X-Gm-Message-State: AOAM530YibBV11Zjm91tm0zZM3lu7UAovPgrCfVu9JyZvScVNcIijFoO
        5plcIaB3wzzFdB/xq3rpWX+Ucg==
X-Google-Smtp-Source: ABdhPJwX62WyP4ZnIeHKOlZFjp5zh7GhKe84JXR5nkRF7xvHcouHhy1+axXBjzQ/kCNnfCWFOYX/iQ==
X-Received: by 2002:a17:90a:4dc5:: with SMTP id r5mr42292126pjl.203.1624958019649;
        Tue, 29 Jun 2021 02:13:39 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id y4sm17167803pfc.15.2021.06.29.02.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 02:13:38 -0700 (PDT)
Date:   Tue, 29 Jun 2021 14:43:37 +0530
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
Message-ID: <20210629091337.bcerprdyupvgr6gf@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNmK0MP5ffQpiipt@ninjato>
 <CAK8P3a2qrfhyfZA-8qPVQ252tZXSBKVT==GigJMVvX5_XLPrCQ@mail.gmail.com>
 <YNmVg3ZhshshlbSx@ninjato>
 <CAK8P3a3Z-9MbsH6ZkXENZ-vt8+W5aP3t+EBcEGRmh2Cgr89R8Q@mail.gmail.com>
 <YNmg2IEpUlArZXPK@ninjato>
 <CAK8P3a3vD0CpuJW=3w3nq0h9HECCiOigNWK-SvXq=m1zZpqvjA@mail.gmail.com>
 <YNnjh3xxyaZZSo9N@ninjato>
 <4c7f0989-305b-fe4c-63d1-966043c5d2f2@intel.com>
 <YNraQMl3yJyZ6d5+@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YNraQMl3yJyZ6d5+@kunai>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29-06-21, 10:30, Wolfram Sang wrote:
> 
> >     3. It seems the I2C core takes care of locking already, so is it safy to
> > remove "struct mutex lock in struct virtio_i2c"?
> 
> Looks to me like the mutex is only to serialize calls to
> virtio_i2c_xfer(). Then, it can go. The core does locking. See, we have
> i2c_transfer and __i2c_transfer, the unlocked version.

Right, this is what I have been suggesting as well.

So do you want Jie to send V11 now after fixing these three issues, or
you have more concerns ?

-- 
viresh
