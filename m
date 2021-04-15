Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B3F36033B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 09:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhDOHY7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 03:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbhDOHY6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Apr 2021 03:24:58 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF68C061574
        for <linux-i2c@vger.kernel.org>; Thu, 15 Apr 2021 00:24:35 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u7so9751625plr.6
        for <linux-i2c@vger.kernel.org>; Thu, 15 Apr 2021 00:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m8DeQWG9KEDynT5LsxE499wF6Jjldde7Gdw6tjI8mlU=;
        b=eZ/SrbRyNsOdHBJv+PPQB5u0DBBBrqjDN9wB85pqiqZUYOSG2v6sExV769zTHLCsem
         lh3U3u3Jt+WD1k3qPNE4v2In1evp5wMA6+m7o4ptPfyxyOBYnflaGZjxRBz+MgsOaFtS
         Vd27V7jgcxdrkB8i1I2M9DWuqI5X4qm+X73vYQ3mx/LuUtmrRL5e3lcyKCCy7kvV3L4z
         lM281T34X7neXewDXTqIsLHV4mCdG1IbpzGY4N0NAWinfwp7Xa6sCUDpXd4NjfqQ3K8F
         htYHAq+SdRc8uGUx08wI0UnRwhvQNXJAcpS+8MOPpqKV1OKUYx7x3Gcd0q6l34tkyc8s
         K+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m8DeQWG9KEDynT5LsxE499wF6Jjldde7Gdw6tjI8mlU=;
        b=Lwcw09YYXOZE4eodkMqmoQZ0/Cnbi8ePDSRyPpRhiLrx8PaMbvOHSMBolwLVcVQmDf
         Zghk1W7dlCDSxhhJ4frzfPz39UALHe9pGlNJREj4a3Dksgdfpu89yL5c7sSljTMTYLQQ
         1++TdDDZs2YIFXHV6DIQsCZ1tO9rXjreMGB388PJU5QFI7FtiwjCuZS76ETjknAk95WM
         HXvUNjwFR9GDt+rZDKreti4yHLw2HtUBfqPk9PdevIz4EeWrIoEPz2HPFi1UzFINSDR2
         3R2IJhmEyAHKrI4mRnYgUVwyfSq+XAcOXQdaRgnK8HQdp6s1rd/r6lihlttrnDnbbNHH
         jjzA==
X-Gm-Message-State: AOAM531vN3MRNbgdaPGGNdTndrYWVmDxIsW5euV5zwI+dErT3pFeixeN
        m164xHFpuiKP7P0hkfE0IivumQ==
X-Google-Smtp-Source: ABdhPJyTWNqs9DMkceI2bV/ilNrmZO65Qj9f980HcPSnamOeh+qG5A4tJDY1TZtsTUgIHcmNN9ZN1g==
X-Received: by 2002:a17:902:7b92:b029:eb:6fc0:39e6 with SMTP id w18-20020a1709027b92b02900eb6fc039e6mr2439407pll.83.1618471474705;
        Thu, 15 Apr 2021 00:24:34 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id i22sm1513886pgj.90.2021.04.15.00.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 00:24:33 -0700 (PDT)
Date:   Thu, 15 Apr 2021 12:54:31 +0530
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
Message-ID: <20210415072431.apntpcwrk5hp6zg4@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
 <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
 <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
 <20210415064538.a4vf7egk6l3u6zfz@vireshk-i7>
 <b25d1f4e-f17f-8a14-e7e6-7577d25be877@intel.com>
 <20210415072131.GA1006@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415072131.GA1006@kunai>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15-04-21, 09:21, Wolfram Sang wrote:
> 
> > I didn't forget this. It is a very small change. I'm not sure if the
> > maintainer Wolfram
> > 
> > has any comments so that I can address them together in one version.
> 
> Noted. I'll have a look in the next days.

Now that we were able to catch you, I will use the opportunity to
clarify the doubts I had.

- struct mutex lock in struct virtio_i2c, I don't think this is
  required since the core takes care of locking in absence of this.

- Use of I2C_CLASS_DEPRECATED flag, I don't think it is required for
  new drivers.

:)

-- 
viresh
