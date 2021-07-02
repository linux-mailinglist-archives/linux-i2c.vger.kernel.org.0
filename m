Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC4D3B9BB7
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 06:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbhGBE7M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 00:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbhGBE7K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Jul 2021 00:59:10 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2293C061762
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jul 2021 21:56:36 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id a2so8457419pgi.6
        for <linux-i2c@vger.kernel.org>; Thu, 01 Jul 2021 21:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qqSo2EHKnteCkmvIob7W7h8j2bBButMHNumXS1B2l4o=;
        b=THUTh9lL4gLgfoWs25q+r7nEzcReUOTkjZ6PBQSvLYhT5h22qQghqFKTbnb+SueClW
         yzFZUuYKHvmbk60MxqoXkPEIZT7QKSU230n1xDMIOEwPaorDYxvR+1FO6c9gXmnUAEyd
         jRmw9Ho2/f6zYuDYpi6/dqnwUEhzU5C9ovYEp1pvzM/GkwAC5SJQdnZMiT9DQsTp3we/
         sIht4/YeX7Sq2U/klwO/Men0mMiCPsDJsV+ip84CFwlRVcNtk1HMWKNMqPPCxaTt42f8
         Ts26/9nOMSVMKIGqnJ4Kejd/m3y2N8FnH+a2Kij8aGj64AQIdpA7vu2IusgPFP7lMtgD
         GrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qqSo2EHKnteCkmvIob7W7h8j2bBButMHNumXS1B2l4o=;
        b=SlhnxzfG5rVgA1GA1q6iwAg107PyvzwVbfK45SAwW4slWRpLxCJpVq80PU8GEgpF0o
         P7pF7z2JovjCDVJ8eTnxomCJUUkcbiHJALfLr0JS5gu1tXuCVWYIoUaIp20e3zbcUi3Z
         hIcXwDg4gAzm66a9ulFVnE3YAHOSgp7kmfoUyni+k2P15kZwmPwg4qijnnsg5C/tTFs4
         GKfRVm23bjrbsR9p2OXWNFxb0ttHXH3GHhkPCsEc7eWDJNV0GYmhWf2qIpXfxdhLYj5E
         jI5PlJLv0FWrnfpRWD7c7HVAfP2ch/he3qGO891yYpu9S5/35G+8LQqj+7u92YnMXXAQ
         ngGw==
X-Gm-Message-State: AOAM531cJk7N7U9a7KkhK3yWXx1J+zmmnT4a4EtZLBp/uX4JIWRW05I2
        NDSTyFKyUpThQEWvgl3dLbPMrg==
X-Google-Smtp-Source: ABdhPJzQoHvs4UddAnwcfgRrte2ZXexLQGMoAiszR4up3WGDmvkA5xdPaNw7h+vVUySdvsIcdSrxSg==
X-Received: by 2002:aa7:96cf:0:b029:30f:d1e8:9264 with SMTP id h15-20020aa796cf0000b029030fd1e89264mr3262408pfq.33.1625201796138;
        Thu, 01 Jul 2021 21:56:36 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id w6sm1824644pgh.56.2021.07.01.21.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 21:56:35 -0700 (PDT)
Date:   Fri, 2 Jul 2021 10:26:33 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210702045633.gblpud7wcffd5kyj@vireshk-i7>
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
 <cb35472d-f79e-f3f8-405f-35c699d897a1@intel.com>
 <20210701061846.7u4zorimzpmb66v7@vireshk-i7>
 <34092cb2-03f9-231d-8769-4e45ed51c30f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34092cb2-03f9-231d-8769-4e45ed51c30f@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02-07-21, 11:36, Jie Deng wrote:
> OK. Let's add the following two lines to make sure that msg_buf is only
> sent when the msgs len is not zero. And backend judges whether it is
> a zero-length request by checking the number of elements received.
> 
>  + if (msgs[i].len) {
>            reqs[i].buf = i2c_get_dma_safe_msg_buf(&msgs[i], 1);
>            if (!reqs[i].buf)
>                    break;
> 
>           sg_init_one(&msg_buf, reqs[i].buf, msgs[i].len);
> 
>           if (msgs[i].flags & I2C_M_RD)
>                   sgs[outcnt + incnt++] = &msg_buf;
>           else
>                   sgs[outcnt++] = &msg_buf;
> +}

Perfect. Thanks.

-- 
viresh
