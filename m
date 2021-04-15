Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7466F36030D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 09:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhDOHQR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 03:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbhDOHQP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Apr 2021 03:16:15 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D78C061756
        for <linux-i2c@vger.kernel.org>; Thu, 15 Apr 2021 00:15:53 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u7so9740076plr.6
        for <linux-i2c@vger.kernel.org>; Thu, 15 Apr 2021 00:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RgNR7eI/Uw8a9iJY+TsDCOg5IUfvzI2+Hb5tNImKknU=;
        b=jkziAWgRadT6a7zgsT7qTCXkAiJIDK64WqeqveOXp/mjGzPoYyjZPhTpV7UITLOZP3
         j28yVzN5zaBkf64iDfT4D4y9zqYVIwDooBNacLA0Z7beJXbd3R7W/cxry7VBpmSTwFGX
         +OziTWo6GsvDGhurk4TnnN/kAyzlHTOKHzfsGrG/wadzgUoMTXhwR9euEWApLSr3SiKL
         +fnm7+5yMBaoIMnj5Q7n6kwHmOF2d5C8kjACO5Y3LeSQCxDEKzjhy14d09GqjkV06Qb2
         NcNnE7vAqnPhlnnGmt7YyMebnqbqP16v7te8F/mAFEU5hRIWOe3Uq8j0wwa5aliXJM5w
         XZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RgNR7eI/Uw8a9iJY+TsDCOg5IUfvzI2+Hb5tNImKknU=;
        b=a1BjSG/Bd9nGJ+FKfJVu1GM51RuDF+bOb6KZ5rtdza4qJLH5SlVMx4foEazFwCE/QF
         Vva59tFXt5URoM0r0ZW2OyI0owTiYcwLU1kTs7LOyUqJOCdlW9+w73wOLDlB5DJCJKUa
         Pl+ExXCFgwroN2YaipLthbUMSumviZ0P6LAJ0TyLjCHfiMq4a9+6KO2cDzjsknNrSRyY
         +6WMvkp+kmU+4oIpPoTKAD8hkTY0ZZULbCoEFhP+J/8aEfyLRnQcfYNmNaQy1PqItHkB
         iZ6QWYj4/jvrFYiQj4YErlcJcReXQ8tuwp+vOeM2+Q3WTH3Bx0DS4yf0cFV4JC9aGACO
         hvTQ==
X-Gm-Message-State: AOAM5328krhWXennTjfH8iHVd29VhSFHQ6O+20KCNkFl46Vk+GyQY9ZH
        hwFCM0bccxUjfuoFJvg4INowhQ==
X-Google-Smtp-Source: ABdhPJw/bpZ7i6ekhnOCzmBecFj4xM2sUaMjFHMYOxR0OgOAPlIWdbZFsGlzKM5st71MKrRx4NV2rQ==
X-Received: by 2002:a17:90b:1904:: with SMTP id mp4mr2331401pjb.193.1618470952483;
        Thu, 15 Apr 2021 00:15:52 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id p22sm1385614pjg.39.2021.04.15.00.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 00:15:52 -0700 (PDT)
Date:   Thu, 15 Apr 2021 12:45:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Message-ID: <20210415071549.mh4tgb6dqfjzuflx@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
 <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
 <CAK8P3a3OBUZC2nxaQ2wyL9EeT3gzXUX9sfJ+ZJfJUiJK_3ZkrA@mail.gmail.com>
 <20210415064538.a4vf7egk6l3u6zfz@vireshk-i7>
 <b25d1f4e-f17f-8a14-e7e6-7577d25be877@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b25d1f4e-f17f-8a14-e7e6-7577d25be877@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15-04-21, 14:56, Jie Deng wrote:
> 
> On 2021/4/15 14:45, Viresh Kumar wrote:
> > On 23-03-21, 10:27, Arnd Bergmann wrote:
> > > I usually recommend the use of __maybe_unused for the suspend/resume
> > > callbacks for drivers that use SIMPLE_DEV_PM_OPS() or similar helpers
> > > that hide the exact conditions under which the functions get called.
> > > 
> > > In this driver, there is an explicit #ifdef in the reference to the
> > > functions, so
> > > it would make sense to use the same #ifdef around the definition.
> > Jie,
> > 
> > I was talking about this comment when I said I was expecting a new
> > version. I think you still need to make this change.
> 
> 
> I didn't forget this. It is a very small change. I'm not sure if the
> maintainer Wolfram
> 
> has any comments so that I can address them together in one version.

Ahh, okay then. That's fine. I have been waiting for the final version
to give my Tested/reviewed by :)

-- 
viresh
