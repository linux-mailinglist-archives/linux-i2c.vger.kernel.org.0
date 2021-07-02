Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5273B9CE0
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 09:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhGBHYC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 03:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbhGBHYB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Jul 2021 03:24:01 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC3AC061764
        for <linux-i2c@vger.kernel.org>; Fri,  2 Jul 2021 00:21:30 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id g22so8719983pgl.7
        for <linux-i2c@vger.kernel.org>; Fri, 02 Jul 2021 00:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cTT5SBbgufyipfbulZ8UMd6eHUFijnnoOYYIn/7MP+o=;
        b=nFo7STRAeHl5/1sVuiyLsRIes/cEOzB6idGycA7fykYwfli+PR+4+ICCGHu+IR7SWr
         Glr9IqxTFZCmBRzjqDZs1GPdJduONKvf33/VV+ZYqujRcXyO2aAqsmUQcSLHtnaWc+JW
         DleBvWV/cShHHGvtf7+zKCA41D9ifMsq7VWJnEp1z6YDwXXfy9r+r5Py6YsbrMt4Uwqx
         0yQjMw6gsAg6WdsKFMwV7FtKg0Ku4kGxyN+2KHMVmHsD3b5xdSpt+uXnzInUk6UKrmnG
         Jtz779vpf4E7BPARlTn/tl5wAoVsrCwSOVS2lCqv1XWi2WWrgL3PMUsPSSl3n3/Epxol
         GeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cTT5SBbgufyipfbulZ8UMd6eHUFijnnoOYYIn/7MP+o=;
        b=VD7eO9yQ6KID1G20t55dLmL+IpJkE98c+hzHy674eCOV225kVcOEvqePoaTsW3yJhY
         MzM9m0pX+kchyrWiEUmm8VpxO7DqWPFC3Ebe0DQrYIXb24+ZuLFr9xsk0aKW0k3hCYL5
         N1/w7oD/bkcMsQJhlAZKt4rl2qQxS9psugUuJlGvqdIEoWWtCiu2EVIR8SpN+QxJOe3E
         m2vTWLxHzgxeXzuCfd5g8xioTCiBspQ+lHKb9ujDLakfcrrrmKnDGTFxrnul7J7lymGe
         oggK8MRJbIcMvCfzJMD76rILEGGgKL0wdXZnJyzRSsmn0ub+rFGq9RSjm7Gxgr9uk/zA
         D/pg==
X-Gm-Message-State: AOAM531Wa43ETRSJHqc7scN3ATjdG/G22Gr/l2VNBOKg7T4PZExlO88R
        lIwmKQCWI9oUMANnRmrytACH/w==
X-Google-Smtp-Source: ABdhPJzlpbJzMatPVcdFqFBjlHuIxZl7bMeIssuMT/0rPePDZsieD/P+Dj7GcAMS5kEGiURqgqE/xw==
X-Received: by 2002:a05:6a00:26c3:b029:304:8e6c:be0a with SMTP id p3-20020a056a0026c3b02903048e6cbe0amr4132940pfw.65.1625210489763;
        Fri, 02 Jul 2021 00:21:29 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id c184sm2348185pfa.38.2021.07.02.00.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 00:21:29 -0700 (PDT)
Date:   Fri, 2 Jul 2021 12:51:27 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        stefanha@redhat.com
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210702072127.yzofc75cuuqtvzbn@vireshk-i7>
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <20210701040436.p7kega6rzeqz5tlm@vireshk-i7>
 <YN4WeJCepCrpylOD@kunai>
 <20210702045512.u4dvbapoc5a2a4jb@vireshk-i7>
 <409b6cc3-3339-61b2-7f42-0c69b6486bb3@intel.com>
 <20210702065625.qielhnfyrlvrtrkk@vireshk-i7>
 <bdea419c-b450-f6b1-fff3-7df077b2abfc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdea419c-b450-f6b1-fff3-7df077b2abfc@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02-07-21, 15:15, Jie Deng wrote:
> Then what is the need to design this interface as "return the number of
> messages successfully
> processed, or a negative value on error". Just return success or fail is
> enough.

Right, that isn't clear to me as well. And so I asked Wolfram this yesterday.

I think it is left for the clients handle this, i.e. what they want to do with
it if something fails in between.

> Here, we didn't break the contract with the interface "master_xfer", so if
> there is a problem then
> the contract may be the problem.

So in your case here, either you should return 0 or nr (the number of transfers
requested) and anything else can only be sent if the host reports partial
failures.

Also, since this driver is pretty much independent of everything else, and won't
break anything in the kernel, there is still a good chance of getting it merged
for 5.14-rc1/2.. So it would be better if you resend the next version as soon as
possible :)

-- 
viresh
