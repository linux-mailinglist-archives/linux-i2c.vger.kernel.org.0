Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61B222F404
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 17:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbgG0Pml (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 11:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730727AbgG0Pml (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 11:42:41 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159E8C061794
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jul 2020 08:42:41 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k8so4921878wma.2
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jul 2020 08:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q30VrVY5X0HHdrGzlOgbzohfZx9h3nY4CKObZ9uief0=;
        b=N64yA6enn2h2KhVpllPNrEdDz0RrQ7jqd01zk5ciCF9VgY1wF6gi8LNAggzubBmIfk
         4uGhhEPE2QX/cY7tKM+QCjTPoj/KkOGBlDnJ8TiZHV/gEKNVAlTmgNsfoNvQZPhbpaVK
         OiOAEVmyXwW432/bO8bsIg67ZINiqTIrjqc9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q30VrVY5X0HHdrGzlOgbzohfZx9h3nY4CKObZ9uief0=;
        b=YrAKIEiBvq0CENeD7XwEv802vkatVHqw+day/YJ/ZECecS3HfptlAclT7IA4jOsE6Z
         IGdwhdyObEr2YL4bXS1Abvv/st0v8gVoEOaX83J6TJ5rDlUUtugLrwHPh+Dm0QgRagFZ
         vPhU1iUdJCPGYTzI1D0jW9pJbss/bZpFcOE7T4TyYOltdga1sy/RByyOCqoqJj2/2cwH
         ffY+8jI+Lr/yKmAE/0QecZLoY+T00Zz1caGNq8iomsxo5Vb65VG9yIpnuxWaQQW/cIHf
         /t46pQQc2d2N/mli+Tc8s3+RdMqNrfAOtYERv4L41nV1iiKOZBO/fqhFMXZA9xPwlrAu
         3g4Q==
X-Gm-Message-State: AOAM532S7gVmqDFngqJNlBdIZo6gqgSiH6lKaLKQhUT7e32CiD8ankZd
        A3j4bVUHzlFC3bVk+jH202/u3g==
X-Google-Smtp-Source: ABdhPJw2AFsLQ3QfoNPjcQVXUMOo94VGbLrWaNX6UgSpcDfrl2zhz/5cV8jTG+eKSfbeiAD3UuccXA==
X-Received: by 2002:a1c:9914:: with SMTP id b20mr20577167wme.15.1595864559486;
        Mon, 27 Jul 2020 08:42:39 -0700 (PDT)
Received: from [10.136.8.246] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id c25sm1318wml.18.2020.07.27.08.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 08:42:38 -0700 (PDT)
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <1595115599-100054-1-git-send-email-dphadke@linux.microsoft.com>
 <116ac90c-8b49-ca89-90a4-9a28f43a7c50@broadcom.com>
 <20200722104128.GK1030@ninjato>
 <5048cf44-e2c2-ee31-a9fb-b823f16c2c7d@broadcom.com>
 <20200725101815.GA1519@ninjato>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <4cf12c92-889d-ffbf-f8de-c1e08cfb8ce9@broadcom.com>
Date:   Mon, 27 Jul 2020 08:42:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200725101815.GA1519@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 7/25/2020 3:18 AM, Wolfram Sang wrote:
> 
>> I think the following sequence needs to be implemented to make this
>> safe, i.e., after 'synchronize_irq', no further slave interrupt will be
>> fired.
>>
>> In 'bcm_iproc_i2c_unreg_slave':
>>
>> 1. Set an atomic variable 'unreg_slave' (I'm bad in names so please come
>> up with a better name than this)
>>
>> 2. Disable all slave interrupts
>>
>> 3. synchronize_irq
>>
>> 4. Set slave to NULL
>>
>> 5. Erase slave addresses
> 
> What about this in unreg_slave?
> 
> 1. disable_irq()
> 	This includes synchronize_irq() and avoids the race. Because irq
> 	will be masked at interrupt controller level, interrupts coming
> 	in at the I2C IP core level should still be pending once we
> 	reenable the irq.
> 

Can you confirm that even if we have irq pending at the i2c IP core
level, as long as we execute Step 2. below (to disable/mask all slave
interrupts), after 'enable_irq' is called, we still will not receive any
further i2c slave interrupt?

Basically I'm asking if interrupts will be "cached" at the GIC
controller level after 'disable_irq' is called. As long as that is not
the case, then I think we are good.

The goal of course is to ensure there's no further slave interrupts
after 'enable_irq' in Step 3 below.

Thanks!

> 2. disable all slave interrupts
> 
> 3. enable_irq()
> 
> 4. clean up the rest (pointer, address)
> 
> Or am I overlooking something?
> 
