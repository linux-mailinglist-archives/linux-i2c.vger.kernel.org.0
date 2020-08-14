Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070DB244FEB
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Aug 2020 00:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgHNWl0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 18:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgHNWlZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Aug 2020 18:41:25 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8707AC061385
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 15:41:25 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id j10so5018618qvo.13
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=NwP7R3sUWjUCvQilbKFaBvMQtYWYWMvIVKcfmM9idD4=;
        b=NhiBMfMiPTNlvrv8p8tPHgfaLOSi7A+BQsoz/REz+0DnKkU5sFCQfkZkh3T90/gzJ0
         5J+hGg1qaBQLlxrqMzSmDsstZRoop46T+uIJyGytP8blrd0UxZETtTSPMRucjCfpN72Q
         jdhwxfBXLVOstq/rEMdw8JkOy7L/qYZo6/Ejc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NwP7R3sUWjUCvQilbKFaBvMQtYWYWMvIVKcfmM9idD4=;
        b=ji/FK1HrglzC813zDf9qE/spjt7W99h5nuiGq+dhXtT+bpEY+fDL6f2qrQi46pL5Hf
         XbOc1Z+CbjjsPXPsFSCwmPnpsVhPbeGFmvxp1mxD3k6ZDS8jakjmswEpjemdWwPtbCrs
         kWkAAzs45J/2fB3g1iUaW6kzpGVz0CBb6xYaJ3N+rzJATdEVW1ykfgL31pO62YCNeiF5
         cVA5Z9AEvBbfkwd5ySpLfqM9F1VA65MLzAfByx9LI4AAtsaivuJNzv+pVZdMpPuG3P9P
         WbWOJCPoiPW1LP9B8BsffmrY0PGc4Vkwh17+V8JbppLF/U/Y5j5XMW9jMx2wClAR/TmY
         u0nQ==
X-Gm-Message-State: AOAM530quK3GZ39ri2D+M888dblfKIRpjRVsUPZKqHII3EeNX0cHJ/22
        Km9s1iCdVyTky0bu1t7qpbAf+A==
X-Google-Smtp-Source: ABdhPJzmvxciENbhgRXiBw8y4DfMgAR2CS8X7D8VhxF/goMLy9tdh3BSmqaYzlOrHLdVnWPQ7Vjcvg==
X-Received: by 2002:a0c:e00c:: with SMTP id j12mr4832800qvk.127.1597444884509;
        Fri, 14 Aug 2020 15:41:24 -0700 (PDT)
Received: from [10.230.182.181] ([192.19.224.250])
        by smtp.gmail.com with ESMTPSA id n128sm10065854qke.8.2020.08.14.15.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2020 15:41:23 -0700 (PDT)
Subject: Re: [PATCH v3] i2c: iproc: fix race between client unreg and isr
To:     Wolfram Sang <wsa@kernel.org>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <1597106560-79693-1-git-send-email-dphadke@linux.microsoft.com>
 <20200812200659.GA2324@kunai>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <4ec35ab5-b2e7-a050-64fb-bd741419ce68@broadcom.com>
Date:   Fri, 14 Aug 2020 15:41:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812200659.GA2324@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/12/2020 1:06 PM, Wolfram Sang wrote:
> On Mon, Aug 10, 2020 at 05:42:40PM -0700, Dhananjay Phadke wrote:
>> When i2c client unregisters, synchronize irq before setting
>> iproc_i2c->slave to NULL.
>>
>> (1) disable_irq()
>> (2) Mask event enable bits in control reg
>> (3) Erase slave address (avoid further writes to rx fifo)
>> (4) Flush tx and rx FIFOs
>> (5) Clear pending event (interrupt) bits in status reg
>> (6) enable_irq()
>> (7) Set client pointer to NULL
>>
>> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000318
>>
>> [  371.020421] pc : bcm_iproc_i2c_isr+0x530/0x11f0
>> [  371.025098] lr : __handle_irq_event_percpu+0x6c/0x170
>> [  371.030309] sp : ffff800010003e40
>> [  371.033727] x29: ffff800010003e40 x28: 0000000000000060
>> [  371.039206] x27: ffff800010ca9de0 x26: ffff800010f895df
>> [  371.044686] x25: ffff800010f18888 x24: ffff0008f7ff3600
>> [  371.050165] x23: 0000000000000003 x22: 0000000001600000
>> [  371.055645] x21: ffff800010f18888 x20: 0000000001600000
>> [  371.061124] x19: ffff0008f726f080 x18: 0000000000000000
>> [  371.066603] x17: 0000000000000000 x16: 0000000000000000
>> [  371.072082] x15: 0000000000000000 x14: 0000000000000000
>> [  371.077561] x13: 0000000000000000 x12: 0000000000000001
>> [  371.083040] x11: 0000000000000000 x10: 0000000000000040
>> [  371.088519] x9 : ffff800010f317c8 x8 : ffff800010f317c0
>> [  371.093999] x7 : ffff0008f805b3b0 x6 : 0000000000000000
>> [  371.099478] x5 : ffff0008f7ff36a4 x4 : ffff8008ee43d000
>> [  371.104957] x3 : 0000000000000000 x2 : ffff8000107d64c0
>> [  371.110436] x1 : 00000000c00000af x0 : 0000000000000000
>>
>> [  371.115916] Call trace:
>> [  371.118439]  bcm_iproc_i2c_isr+0x530/0x11f0
>> [  371.122754]  __handle_irq_event_percpu+0x6c/0x170
>> [  371.127606]  handle_irq_event_percpu+0x34/0x88
>> [  371.132189]  handle_irq_event+0x40/0x120
>> [  371.136234]  handle_fasteoi_irq+0xcc/0x1a0
>> [  371.140459]  generic_handle_irq+0x24/0x38
>> [  371.144594]  __handle_domain_irq+0x60/0xb8
>> [  371.148820]  gic_handle_irq+0xc0/0x158
>> [  371.152687]  el1_irq+0xb8/0x140
>> [  371.155927]  arch_cpu_idle+0x10/0x18
>> [  371.159615]  do_idle+0x204/0x290
>> [  371.162943]  cpu_startup_entry+0x24/0x60
>> [  371.166990]  rest_init+0xb0/0xbc
>> [  371.170322]  arch_call_rest_init+0xc/0x14
>> [  371.174458]  start_kernel+0x404/0x430
>>
>> Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
>>
>> Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>
> 
> Applied to for-next (i.e. 5.9), thanks!
> 
> BTW my code checkers found this (unrelated to this patch):
> 
> ===
>     CPPCHECK
> drivers/i2c/busses/i2c-bcm-iproc.c:723:14: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
>     val |= 1 << M_TX_WR_STATUS_SHIFT;
>              ^
> drivers/i2c/busses/i2c-bcm-iproc.c:741:19: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
>   val = addr | (1 << M_TX_WR_STATUS_SHIFT);
>                   ^
> ===
> 
> Use the BIT macro here.
> 

Thanks, Wolfram. I just sent out a separate patch to address that.
