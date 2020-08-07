Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCBDE23F160
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 18:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgHGQkd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 12:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgHGQk2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 12:40:28 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F55C061757
        for <linux-i2c@vger.kernel.org>; Fri,  7 Aug 2020 09:40:28 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r4so2247160wrx.9
        for <linux-i2c@vger.kernel.org>; Fri, 07 Aug 2020 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=7MlPgb6G7MRWKetSxLBPIn4G5T6xBNw3EZ7AtQ9Ybwc=;
        b=arPbKFhxxyyboW1VBkC62G21qD3kowo3A8JmoTGQPfZ22/u6amzmKXjsRjlqgTwqiL
         uez3c5KPFX90oOIQK5z9X9s7bkUlWB0bTHO6MLOLeuMn1YRNQqN/h7rO8C4Q89zd+eIH
         6dWJ9kGtlZv7f7IUm+tw5eGtXP7vjE/WfgkrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7MlPgb6G7MRWKetSxLBPIn4G5T6xBNw3EZ7AtQ9Ybwc=;
        b=O7zXhsVQOYG4JdoFMG7VEEUw9kImQdGkWkIqoAXU20po7smEGEcu8DahyH1s47XeHR
         KYdCKw8Ko836iSAt/PjBHp1JxiXXiawdjn0QvM6psxzdqExPbFSn3ljxsfqgST+uthfJ
         V3wL4PdIJu6QxS4Ep5Ma/4msRhgh0xgvDmceWFLqIoX+a0DlIRx+GtULlHEzJlPAXQkW
         2i/h0fcRAlbkrmPQAvAQp2CjgwU/CTnEgLw1NuSwBrXVnJlcQoT10V4cFlXHfSkHGrNk
         AdroEatboe8jXkyAfnTM8AFtfRzC88z8fJsk9Sa2omHnqeq35TGkvOddVnqqkT+x8++W
         VV9g==
X-Gm-Message-State: AOAM531dCH0jJDMRs6smg9zJXsR6cLjQn+AbIczs4QkW/ESH8dn3rd8u
        nd1pGfqgq7fiO7Px7r0uihfdqQ==
X-Google-Smtp-Source: ABdhPJxM/rARbNhKBESgK7EulY4/kSt9kA9NAL150pa7F2wfnfK4IBvCCdeGYpPL2rk8S+oVipwHgg==
X-Received: by 2002:adf:b602:: with SMTP id f2mr12258316wre.186.1596818426294;
        Fri, 07 Aug 2020 09:40:26 -0700 (PDT)
Received: from [10.230.0.249] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id d21sm11018559wmd.41.2020.08.07.09.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 09:40:25 -0700 (PDT)
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
To:     Wolfram Sang <wsa@kernel.org>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
 <20200722104128.GK1030@ninjato>
 <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
 <20200725101815.GA1519@ninjato>
 <4cf12c92-889d-ffbf-f8de-c1e08cfb8ce9@broadcom.com>
 <20200727181346.GA1034@ninjato> <20200727202657.GA18997@ninjato>
 <f56b0f2c-f723-a4b6-8c03-4b397aaa375c@broadcom.com>
 <20200805091725.GI1229@kunai>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <574e1d63-cfe0-8e0b-1b45-f91ee9b3cb84@broadcom.com>
Date:   Fri, 7 Aug 2020 09:40:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200805091725.GI1229@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rayagonda/Dhananjay,

On 8/5/2020 2:17 AM, Wolfram Sang wrote:
> On Mon, Jul 27, 2020 at 01:43:40PM -0700, Ray Jui wrote:
>>
>>
>> On 7/27/2020 1:26 PM, Wolfram Sang wrote:
>>> On Mon, Jul 27, 2020 at 08:13:46PM +0200, Wolfram Sang wrote:
>>>>
>>>>> Can you confirm that even if we have irq pending at the i2c IP core
>>>>> level, as long as we execute Step 2. below (to disable/mask all slave
>>>>> interrupts), after 'enable_irq' is called, we still will not receive any
>>>>> further i2c slave interrupt?
>>>>
>>>> This is HW dependant. From my tests with Renesas HW, this is not the
>>>> case. But the actual error case was impossible to trigger for me, so
>>>> far. I might try again later. But even in the worst case, I would only
>>>> get a "spurious interrupt" and not an NULL-ptr OOPS.
>>>
>>> Let me explain how I verified this:
>>>
>>> 0) add a debug print whenever the slave irq part is called
>>>
>>> 1) Put a 2 second delay after disable_irq() and before clearing
>>> interrupt enable register
>>>
>>> 2) unbind the slave driver in the background, triggering the 2s delay
>>>
>>> 3) during the delay, try to read from the to-be-unbound slave in the
>>>    foreground
>>>
>>> 4) ensure there is no prinout from the slave irq
>>>
>>> Worked fine for me with the Renesas R-Car I2C IP interface. As mentioned
>>> before, I couldn't trigger a bad case with my setup. So, I hope this new
>>> fix will work for Rayagonda's test case, too!
>>>
>>
>> Sure. I suggest Dhananjay gives the sequence you proposed here a try
>> (with delay added during the testing to widen the window to cover corner
>> cases). If it works, we can just go with your proposed sequence here.
> 
> Any progress yet?
> 

I don't know if Dhananjay is actively working on this or not.

Rayagonda, given that you have the I2C slave setup already, do you think
you can help to to test and above sequence from Wolfram (by using the
widened delay window as instructed)?

Thanks,

Ray
