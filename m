Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375134671AE
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 06:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378493AbhLCFik (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 00:38:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhLCFik (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 00:38:40 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF068C061757
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 21:35:16 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id i12so1836869pfd.6
        for <linux-i2c@vger.kernel.org>; Thu, 02 Dec 2021 21:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1MNPz6WE52QSr+7j6Q9Dzeo7RAlFzOR7yieEdRW5DUg=;
        b=LNr6GWB9XpqtlOa6lOOVUPMjte+sUfDC8tYwcxhqkLYMyOxDeLzJD2P9Lhdbx5JWaP
         rsFRO/doQwQ+vWvx0kWBDSsOCRyKGYEvVZ3sinZ1z6T5tlD/VUc26AqnUiiJ4emN+Z6c
         cUnHYqwrz5Hot0raOBt4mkQSF/uTCukbPoRf/l7ThAtkbmAuj4lfTHSV48cOyl4abcjM
         sJ6Em0MQsfGI2HNrLbhWLJCQRBhVMnB3qBsGpgB8pMHMdxXazLq+5d2YOAzPz8HNsSHj
         RlMRzCZ1uraWlXY9gIpwaPKmLIr75T4lsS8DdeNflnl8DaSyHEBJerCBqi5Lz+MtlQP5
         k7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1MNPz6WE52QSr+7j6Q9Dzeo7RAlFzOR7yieEdRW5DUg=;
        b=eN7WwOvq2bY9oueKm21uvSshjJ8F2DGpKDWe5HpiJPOsgGk5HwNahDF1whWoKicxhg
         k7BQMdZ53JGdZL5KQwfn9i3zPMBbfaSDMaRHQJP4Tdv94dD0SWEoEStzcttAieEX/uAv
         EQuAGcXyak0axLkCzZ6Dulfx78qWqqJt3fE9Txz+mIWO3xhNXVh1146Tcm0wjN/l+Xcy
         YN0V1cRdckk/k0tgEHbwJaJ734TeAv/DP+lB/PTWEjaoHcNOgvpIFCGjvpoKKsq/p8C9
         PS5MJ5PJojleh6A8C58GEYhZlUXasbF2WwYjvvl7u1wHT6lkAXumDieo8PIF8K6Ao1kq
         CXAg==
X-Gm-Message-State: AOAM531BzPira4oiMY+KS4Iberyi8Bo9fTK4z7h8BG4BmMoaJrQRhYy7
        HISGjKsgn1VbWG1tJ8s+gQwnOQ==
X-Google-Smtp-Source: ABdhPJwfEKBuVAwyPLEbgiyRgYzjB/g3+CZ7ZcN067XoXFLuPgfSdoSs/5GNP9AhFYeiYJMmFC8daw==
X-Received: by 2002:a63:4d8:: with SMTP id 207mr2900748pge.549.1638509716161;
        Thu, 02 Dec 2021 21:35:16 -0800 (PST)
Received: from [100.115.92.196] (c-73-189-176-14.hsd1.ca.comcast.net. [73.189.176.14])
        by smtp.gmail.com with ESMTPSA id t8sm1181698pgk.66.2021.12.02.21.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 21:35:15 -0800 (PST)
Subject: Re: [RFC Patch v2 1/3] i2c debug counters as sysfs attributes
To:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, tali.perry1@gmail.com,
        benjaminfair@google.com, krellan@google.com
References: <20211203023728.3699610-1-suichen@google.com>
 <20211203023728.3699610-2-suichen@google.com>
 <10e59e850894524d34cc7d89c126ab9133e6a1a7.camel@perches.com>
From:   Sui Chen <suichen@google.com>
Message-ID: <c3e3d7fe-765e-defa-275b-0b5e731c77ce@google.com>
Date:   Thu, 2 Dec 2021 21:35:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <10e59e850894524d34cc7d89c126ab9133e6a1a7.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/2/21 6:50 PM, Joe Perches wrote:
> On Thu, 2021-12-02 at 18:37 -0800, Sui Chen wrote:
>> This change adds a few example I2C debug counters as sysfs attributes:
>> - ber_cnt (bus error count)
>> - nack_cnt (NACK count)
>> - rec_fail_cnt, rec_succ_cnt (recovery failure/success count)
>> - timeout_cnt (timeout count)
>> - i2c_speed (bus frequency)
>> - tx_complete_cnt (transaction completed, including both as an initiator
>>    and as a target)
>>
>> The function i2c_adapter_create_stats_folder creates a stats directory
>> in the device's sysfs directory to hold the debug counters. The platform
>> drivers are responsible for instantiating the counters in the stats
>> directory if applicable.
> 
> Please try to use scripts/checkpatch.pl on your patches and see if
> you should be more 'typical kernel style' compliant.
> 
> Ideally, use the --strict option too.
> 

Hello Joe,

I thank and really appreciate your spending time commenting on the 
patch, and on its previous version too. I ran checkpatch.pl and found a 
few code style fixes on patches 1 and 2.
Sorry for not checking the format before sending the email, I will 
definitely do the format check next time.

Regarding the patch itself, code style aside, we're wondering if this 
idea of exporting I2C statistics to sysfs looks reasonable? Do we need 
to accompany this change with design documents too (similar to PCIe AER 
reporting?)

We have done some more I2C-related performance and reliability tests; 
however it might take some more efforts to explore those ideas and 
summarize them into patches/documents. For now we would like to know 
about the comments on this sysfs attribute change first, since it is the 
initial step to the larger effort. Any comments will be greatly appreciated.

Thanks,
Sui
