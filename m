Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7573FC27C
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Aug 2021 08:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhHaGGs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Aug 2021 02:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhHaGGr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Aug 2021 02:06:47 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25BF5C061575
        for <linux-i2c@vger.kernel.org>; Mon, 30 Aug 2021 23:05:53 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id m2so10299471wmm.0
        for <linux-i2c@vger.kernel.org>; Mon, 30 Aug 2021 23:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LZoDYEUzD1l/oBrB+bnpmHlHKDYeIsLslbsbVLJrF4I=;
        b=aqHaK2seLOvVfgXI0p3ix9mLKKhIpI11apyncCiPFOqWmV/RYD/AmSgpf+31tgBfQA
         kFeLYMkaqHWIGMwMAXijJwEble/CZgWKysCw9kUftj5JPUXH2G74xQZIpagC93by52hc
         8vLAESukI9r8s7mt4ec4wif4J7UL7dh1IpCg/K/0gu9mmDjTdVnSGEARsVuF3bJ9zpOm
         Cppfo0Seg/OIWK5IBr4WCbZqKHHjG+FmduqRfwmY6bKo2L0xt8pWXTFnetN9CXIdPcm/
         hRiiCgbIvUVh/0xi5Poh5zAJhKCRjo3OyBMdy0d18ap+p/eSukJShXWUR2unm2sTm4v6
         5Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LZoDYEUzD1l/oBrB+bnpmHlHKDYeIsLslbsbVLJrF4I=;
        b=UbIRumJj2mPt3x9RnZcz0k23GujpkToTDJAcvp5RzDems2IEmeKgO0BeSl9CqUPEjQ
         ALmPdrwmMy3//Ht7beFvXd3GgML/mKmAGeoJP5pbWJILlDyTAUoq3aLNgbXZLmCy0Qhi
         tJAOpHlN31JwJmZPBQj7hV/0FeNF631l/Xwd6JBPDp7z4R7GDuBykGjd9KCjzPR8+9iH
         RZ13mhfqOwzFMbx4fTSHlVqPqTuPrGmm77sW6Zmq44JcES6rd3gkM0vPtCgeeYiIwKRx
         zlnNCgejvzU7xh14WiafWZ9K8AeK3I1CzESPVZYuscpszd3X3aj6+HeN8guBY5sX60Ll
         bdng==
X-Gm-Message-State: AOAM532G2V7K0j+tBvi4oUTqk8iFhcPkbUdsv8g4TgHEC1Mg5p30oJfi
        B/SORLg5rvXNh+0TYHESQF4=
X-Google-Smtp-Source: ABdhPJwKdK9cjO4uFWbcKZl8LoDVdottgLcn9PhhPDFMsUtiDjY9HUlYTkKIEBTRQ1jmy62HNgV6nA==
X-Received: by 2002:a1c:c903:: with SMTP id f3mr2335075wmb.101.1630389951771;
        Mon, 30 Aug 2021 23:05:51 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f08:4500:75c0:466f:8199:86aa? (p200300ea8f08450075c0466f819986aa.dip0.t-ipconnect.de. [2003:ea:8f08:4500:75c0:466f:8199:86aa])
        by smtp.googlemail.com with ESMTPSA id u5sm16989751wrr.94.2021.08.30.23.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 23:05:51 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] i2c: i801: Improve disabling runtime pm
To:     Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <10690555-2317-4916-70b8-870708858f9b@gmail.com>
 <YRPvtPid3EeMylSr@smile.fi.intel.com>
 <3f225422-b343-eaef-0a95-9d15a5a378f2@gmail.com>
 <YRTubuupevq0JMbW@smile.fi.intel.com> <YRwY/q2y3eIjc/nr@kunai>
 <20210826160021.67b7ed92@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <41456674-800b-a4c2-3b2c-d5af18c58e61@gmail.com>
Date:   Tue, 31 Aug 2021 08:05:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210826160021.67b7ed92@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26.08.2021 16:00, Jean Delvare wrote:
> Hi Wolfram,
> 
> On Tue, 17 Aug 2021 22:15:58 +0200, Wolfram Sang wrote:
>>>>> I dunno if it's being discussed, but with this you effectively allow user to
>>>>> override the setting. It may screw things up AFAIU the comment above.
>>>>
>>>> No, this hasn't been discussed. At least not now. Thanks for the hint.
>>>> This attribute is writable for the root user, so we could argue that
>>>> the root user has several options to break the system anyway.  
> 
> This is something we hear frequently when people don't want to address
> problems in their code, but that's not enough to convince me ;-)
> 
>>> But it will mean the side effect on this driver and typical (root-run) system
>>> application (systemd like?) should care now the knowledge about this
>>> side-effect. I do not think it is desired behaviour. But I'm not a maintainer
>>> and I commented here just to make everybody understand the consequences of the
>>> change.  
> 
> Is systemd going to actually make any change to that attribute? I'm no
> systemd expert, but I can't see any option in the configuration files
> that would be related to autosuspend.
> 
>> Jean, are you still fine with this patch then?
> 
> My original position was that there are a few other drivers already
> doing "this". It's not like we are doing something completely new and
> using an API in a way it had never been used before, so it can't be
> that bad.
> 
> On the other hand, after taking a closer look, I'm not fully certain
> that "this" is exactly the same in all these drivers. For example, in
> blk-pm.c, pm_runtime_set_autosuspend_delay() is being called with value
> -1 initially, but with the idea that someone else (device driver, user)
> may set a positive value later. It's not a permanent disable. The
> 8250_omap driver, however, seems to match the i2c-i801 driver here (I
> say "seems" because honestly I'm not sure I fully understand the
> comments there, but my understanding is that at least in some
> situations, enabling autosuspend later would cause problems).
> 
> That being said, it starts looking like a problem for the PM subsystem
> maintainers. Basically Heiner is trying to move away from an API which
> requires cleaning up on driver removal. This is definitely the
> direction we are collectively taking for years now (the whole devm_*
> family of functions is about exactly that). So it's considered a good
> thing.
> 
> If pm_runtime_set_autosuspend_delay() is not suitable for the task then
> maybe we need a better API. I will admit I'm at a loss when it comes to
> the many pm_runtime_* calls, I'm not going to claim I fully understand
> what each of them is doing exactly. But don't we want to simply call
> pm_runtime_dont_use_autosuspend() here?
> 
> If not and there's no suitable API for the task at the moment, then
> better do not apply this patch, and instead ask the PM subsystem
> maintainers if they would be willing to implement what we need.
> 
To follow-up on this: This patch has been applied already. Therefore,
if decision is to not go with it, it would need to be reverted.
