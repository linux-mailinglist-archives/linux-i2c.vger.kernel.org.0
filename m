Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9721432B256
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Mar 2021 04:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242075AbhCCBPW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Mar 2021 20:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835931AbhCBHZr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Mar 2021 02:25:47 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF2CC061788
        for <linux-i2c@vger.kernel.org>; Mon,  1 Mar 2021 23:24:34 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id j12so13229865pfj.12
        for <linux-i2c@vger.kernel.org>; Mon, 01 Mar 2021 23:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5wYZaEnwAqVbbp8B0+QBU0IRndFZm49vxUSUHZwmsFg=;
        b=BzAZUTsyimLb0JLWMpsCWt5rf1w8ctown476IvdFZSem5oSmf1XMLF+SSRf5D4cdMv
         Rvx1zpCDGe/fMkBL61KWb/IVvKJBBxrvQrw+wa7q/1cbmWMC3Wh4NI3Lr0G3TMvv8fnm
         b6cA6knrE0Kun2mBSHD3HtJZ9se31V8wKXFYfXXE7Po/k+6OdoRrk2MIeeaHBAO9dHg0
         4yOPNpQ+ooAmxa8f1Q3s516C18zeOcC+XaqoLC4rpwmlqbIMoeHIBNu+p4M/pgoUZs1W
         M1CHsnLI468pBY0cIo2ya7rOXMSRxYtTLjb/biv2lCQTppAtzrhrAhx4mTTpAnY7zA6e
         Bvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5wYZaEnwAqVbbp8B0+QBU0IRndFZm49vxUSUHZwmsFg=;
        b=Az1qtxQF1lzL7BCIg0hzxkiTlzzpX2HgT0cGpT7aj+38s6oUOrG8yEbDVxYS5rutvf
         OnrUUiCh2lwar3FnaFSc+lw8nOL1J/SM4KGZBFBaw2QZworlA3XD0lYo1YL5mMfx5ouY
         KqxCKyEweLLG5X4VpL0KbxLD6YSyzW0+W1CWQ+w8nktnVgtHYEU/egefWZh18ZyXXDlk
         20ByONGtz2txV14Gkv095q1eh2SePhtbUmMD7R6wFcsa0mDg5TC0HFLlZRCFXGZnefR1
         x0DUOQkCvc1fwoVE3CQJyTrvCEWvlRvbrJx1FJh7c1bVJZfwMLc0bb61pQCWw/bqDraf
         Rbaw==
X-Gm-Message-State: AOAM531rBGoyKCxRHhE2mJnCurW0nYzcZHQPI+/PbUG3RH/VHJpsvYu3
        ko1baXAjiME4G27n2ron4hqVkQ==
X-Google-Smtp-Source: ABdhPJwTPlhyzLGzDiLqHW+AXHqwOhHpyeYe3uvKommNC8+IrWmqvwPgoQt+7oME7Mc5nc6OK0MSwA==
X-Received: by 2002:a63:a22:: with SMTP id 34mr17028944pgk.328.1614669874042;
        Mon, 01 Mar 2021 23:24:34 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id v4sm1846198pjo.32.2021.03.01.23.24.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 23:24:33 -0800 (PST)
Date:   Tue, 2 Mar 2021 12:54:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210302072431.ml4veczbelyjbhkt@vireshk-i7>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7>
 <16efea9f-d606-4cf9-9213-3c1cf9b1a906@intel.com>
 <20210302034323.gkqymzngyqofrdsr@vireshk-i7>
 <b99b18e1-06a5-f526-a885-dc663da3612b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b99b18e1-06a5-f526-a885-dc663da3612b@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02-03-21, 14:24, Jie Deng wrote:
> Not for the full duplex. As Paolo explained in those links.
> We defined a combined request called "write-read request"
> 
> "
> This is when a write is followed by a read: the master
> starts off the transmission with a write, then sends a second START,
> then continues with a read from the same address.

I think above talks about the real I2C protocol at bus level ?

> In theory there's no difference between one multi-segment transaction
> and many single-segment transactions _in a single-master scenario_.
> 
> However, it is a plausible configuration to have multiple guests sharing
> an I2C host device as if they were multiple master.
> 
> So the spec should provide a way at least to support for transactions with
> 1 write and 1 read segment in one request to the same address.
> "

> From the perspective of specification design, it hopes to provide more
> choices
> while from the perspective of specific implementation, we can choose what we
> need
> as long as it does not violate the specification.

That is fine, but what I was not able to understand was how do we get
to know if we should expect both write and read bufs after the out
header or only one of them ?

I think I have understood that part now, we need to look at incnt and
outcnt and make out what kind of transfer we need to do.

- If outcnt == 1 and incnt == 2, then it is read operation.
- If outcnt == 2 and incnt == 1, then it is write operation.
- If outcnt == 2 and incnt == 2, then it is read-write operation.

Anything else is invalid. Is my understanding correct here ?

> Since the current Linux driver doesn't use this mechanism. I'm considering
> to move
> the "struct virtio_i2c_req" into the driver and use one "buf" instead.

Linux can very much have its own definition of the structure and so I
am not in favor of any such structure in the spec as well, it confuses
people (like me) :).

-- 
viresh
