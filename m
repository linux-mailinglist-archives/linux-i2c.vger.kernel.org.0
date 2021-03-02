Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2217A32B130
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbhCCBJ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243378AbhCBDqE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Mar 2021 22:46:04 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00C6C061756
        for <linux-i2c@vger.kernel.org>; Mon,  1 Mar 2021 19:46:06 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id x29so4732492pgk.6
        for <linux-i2c@vger.kernel.org>; Mon, 01 Mar 2021 19:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lZ9D5nQ78UicwZ05zNOlu/xqak1dEhzdw1oZvwOpVzc=;
        b=HwjgFy0H8CYtyaCnrlXuMDGwjDjwRv9yZvu7+uHKaio+bBddEiURo41nalRCFef/2w
         4QeTMaiR7qZgYBUQoO6zoLuPAqzjMFqAbnKK+C/wXWo845P3qOLiIWHgO/VGGn2TNVfw
         kda5wS9FXhmcPNx4B0Iz5Np9A7s/XHFJ854u45gV+XrKT1G4MU6PaqTLjSJUHA/uYce3
         6KcaaW0vNEIRf5kYP+TWzCL0y59TwrNuQNlEPgeQmi5wk3cjs7oBxZOcSiuOQzQN5Gow
         dHUHe/+Ess7m7xjMGV23v+SpJVDvqZYK/Az4yI3LcvTZyAIuW2fCzWGdOtLZrjhjCiOA
         +TGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lZ9D5nQ78UicwZ05zNOlu/xqak1dEhzdw1oZvwOpVzc=;
        b=cNAIcOHXyAhGjowHxuKR9JueuFWaC928JV28x6tiuw6y7HmN+hx/4hKXyM5Hszq1wB
         2AkdLs1eaEK8y8gc05g1gxutTiILtlek2jjsxbqlZ1QWlx4CN9PpldP8UOS0tUNDCxEC
         pjjLwOYBJW1kVBN/4b79jtW67knzarLCdoemV1ZlCGj0suK23DQK944YryfR4LLodia6
         IsSbmqe4mcE/jtjfO1U/x2ThFwc2MM0cqdVGlTkcUTqvBb3YnFJRvA/ZI6nXc/oDezGi
         8FNSZyUcsz+1GHRdF8q3vOA8iyYXhEb9U7Pm7wmDJqIWwJ/8ctmnvucdzKYM8x5WQRcw
         dsrg==
X-Gm-Message-State: AOAM533+CQwF88qdbJLzoufwTUY7ehVK3Hp0xxsYF7y1zhMG7qFhSoJu
        0z7+g1gD/eYLI78GUFl/rgy7Vg==
X-Google-Smtp-Source: ABdhPJzxZSZ5SrS7qXhH7FcGzN7Bjt06r2mQWyGyqU1jpmDGCpiC22JfGV9oIF3ajzkSRvVj7FnrhA==
X-Received: by 2002:a62:b50d:0:b029:1ed:c0d:3778 with SMTP id y13-20020a62b50d0000b02901ed0c0d3778mr1631518pfe.72.1614656766299;
        Mon, 01 Mar 2021 19:46:06 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id f3sm18598942pfe.25.2021.03.01.19.46.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 19:46:05 -0800 (PST)
Date:   Tue, 2 Mar 2021 09:16:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jie Deng <jie.deng@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        conghui.chen@intel.com, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Mike Rapoport <rppt@kernel.org>, loic.poulain@linaro.org,
        Tali Perry <tali.perry1@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        yu1.wang@intel.com, shuo.a.liu@intel.com
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210302034603.4vt5ix5oxjtiilg7@vireshk-i7>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7>
 <YDzZdc9+6hEvIDS1@smile.fi.intel.com>
 <YDzZocYCA8UC1FCW@smile.fi.intel.com>
 <CAK8P3a1g_UXKVnDfDEfj=swqgUNb+bu+1O7mDMfCt55o0w0jxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1g_UXKVnDfDEfj=swqgUNb+bu+1O7mDMfCt55o0w0jxw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01-03-21, 16:46, Arnd Bergmann wrote:
> But the driver does not support this at all: the sglist always has three
> members as Viresh says: outhdr, msgbuf and inhdr. It then uses a
> bounce buffer for the actual data transfer, and this always goes either
> one way or the other.

Yes and if the driver doesn't support the specification fully then it
should say so in a comment at least and also fail in case someone
tries a full duplex transfer..

-- 
viresh
