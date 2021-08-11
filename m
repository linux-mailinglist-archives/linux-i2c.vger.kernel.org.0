Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F253E9A2E
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 23:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhHKVFn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 17:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhHKVFm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Aug 2021 17:05:42 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E65EC061765
        for <linux-i2c@vger.kernel.org>; Wed, 11 Aug 2021 14:05:18 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r6so4945410wrt.4
        for <linux-i2c@vger.kernel.org>; Wed, 11 Aug 2021 14:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gdhycNUF+ZoqVHgszBDw6oGl7UN01EELAVk6uskBiRo=;
        b=AcDwPM8Gm8Mt9wHjD+1pl+niQuwaF7RjvBJqIZREogHJBPlxFmOmGF+ZetZJzx/r7B
         rdwE2Hcq/SWXmdhwLK1O+oU02n/ClBxrBMo5dNlmq5kBOOvAFpwhXYQK3WzzBNQnkqHj
         No3fpUkFu+TgNK9/WmABAWzd25apbbgsoq015yoVqkN0B9zNQ9LhqJBhJT7yZQVJj39D
         zuoieSc1bQS9cLbHk5kVqWIrA3M/Iq2MmQxkyIOSfkCZu7uAXPWN0aCMHE/0aI6e5rgr
         dD1D4oP/1BkG4r5JU/Vagv5M3T+0NKUdmcepOQnM0pXAz7x9DA6LN2xY39lvdrkjw12a
         Jvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gdhycNUF+ZoqVHgszBDw6oGl7UN01EELAVk6uskBiRo=;
        b=FBSJSbDRvBtTjCyzpWwvIdxn9TZppnj+9inTXM8aIpcSMrbw+emxGSQ8VS212W8TNj
         crseoFUyvs49ZEGJjFxodC56CB1ApIJ0fZ3pwcvwLkpQk+dYdYqJwbgXvR9zvUjHNzE+
         eegnw2RDcTRUdfSjmgG6/IiVwfGU2NHmLLHBFPUw/tZmmpeSnLbb8iDMWyxXVXJ8mXZx
         UJpR9fldq/+344oIWphtIhzX3zzLjmvrgDy7fcSRgGZSf3gSUIC3LsNSG7lgXkuZC5ji
         SUS0WXaloxthINaM/ZYTd5vJmU2NzpvmB6L0feyQ7B1eG25jeRwq3n19fF2G183ERpVC
         SzEQ==
X-Gm-Message-State: AOAM531Wf60nO83IRPCmH7enc+8EoRKEPw11BVOYus8uFlj2+9W0XeLI
        0bGABtCtLHx6La6OlMWkPGL6ZIOO56IByw==
X-Google-Smtp-Source: ABdhPJymvIFbX66JS3rwbFPMkuD2Ft8/i33oVYUCT9DMS9Dp5zq0TicE9MD3ybrzi8EVAIUlBLEWmQ==
X-Received: by 2002:adf:e6cc:: with SMTP id y12mr402302wrm.200.1628715916966;
        Wed, 11 Aug 2021 14:05:16 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:988:dfda:c500:b22? (p200300ea8f10c2000988dfdac5000b22.dip0.t-ipconnect.de. [2003:ea:8f10:c200:988:dfda:c500:b22])
        by smtp.googlemail.com with ESMTPSA id v17sm555258wro.45.2021.08.11.14.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 14:05:16 -0700 (PDT)
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <90aee333-6490-db08-01ae-c0de1e18368a@gmail.com>
 <YRPwMkQFLWfpTULY@smile.fi.intel.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 2/9] i2c: i801: make p2sb_spinlock a mutex
Message-ID: <3a35757b-d0f4-fa7b-6946-548782904ab8@gmail.com>
Date:   Wed, 11 Aug 2021 22:27:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRPwMkQFLWfpTULY@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11.08.2021 17:43, Andy Shevchenko wrote:
> On Fri, Aug 06, 2021 at 11:13:29PM +0200, Heiner Kallweit wrote:
>> p2sb_spinlock is used in i801_add_tco_spt() only, and in process context
>> only. Therefore a mutex is sufficient, and we can make the definition
>> local to i801_add_tco_spt().
> 
> The problem with either AFAICT is that it should actually hold PCI rescan lock.
> See the discussion with Message-ID
> 20210308122020.57071-1-andriy.shevchenko@linux.intel.com for the details.
> 
Thanks for the link. I see that you use pci_lock_rescan_remove() but at a first
glance didn't see this being discussed. Maybe because it's obvious ..

i801 was discussed here:
https://lore.kernel.org/linux-i2c/20210310155145.513a7165@endymion/
However discussion seems to have ended w/o result. What's the status of your
p2sb series? Backgroud of the question is: Does it make sense to wait for
your series to be applied, to make use of your new ps2b library functions?
Or change the mutex to the rescan mutex for the time being?
