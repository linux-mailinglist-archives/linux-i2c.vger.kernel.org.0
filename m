Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0205C31D7B7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Feb 2021 11:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhBQKuv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Feb 2021 05:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhBQKus (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Feb 2021 05:50:48 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5D2C061574;
        Wed, 17 Feb 2021 02:50:07 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id fy5so1231609pjb.5;
        Wed, 17 Feb 2021 02:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fXkbLQATOKndDvfr5Qj7u/6zI0+WmDIYmlBTAHrdBJI=;
        b=Re5WaqAlVW/yYnQMKI1D7aRaPmDFeZ0xnry8HD//r2RAYzhy9Gtuv9cDaPKRltcqpr
         pjq1efKzduQz2XnpF2s2gdqtaJCU7TlzYf3NokXArovSHkDOsIDCYONvDYPJfueQH16F
         8+aMBjuJnGU/edQgLa/+hEkI6/NUUbOvK2aZ0icNXEvLgnkwO5XpDOzFxtP5UQ/pxJ3t
         rKEfJI8p7pgNl+Bg6Wg/xej1sVzWaasgaoTIbR/FgJg3/SS7FFImrxpvo4cDSeOaLKsP
         s3PS8C+gS+tEe25IAjTZPI3gb6QOVpPnLJqusLnDDHQS1dx4zf7T0KO1LZbEFXDuYsVG
         jL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fXkbLQATOKndDvfr5Qj7u/6zI0+WmDIYmlBTAHrdBJI=;
        b=bzsyifd5ERCYPwLRoukMOrg6Ccr+NV4qAIDqzxGkT5WOK0jGYDJH4ft80+IbsRg+CF
         0jxFbTABUUIr69ueL9qVJYAcjla2cRVWOdl50eYmGEDWAKygf7WzyIQEBvx/PFMpGWg8
         wEl9yN9PJc+NEyO6NuByKfoYFTC7AiD17EdTiRJlgVjnySTVkEJwftuAO/qkbxPSBAWf
         BCQq51qri0A6HqcnnwE5OlX15fUKXXTU4RxzyhCWXf7scbGfzUBtoh8Ecwwo8B3/94f9
         1QavUBBIhTv2Hs7sH7aif2hJaAinEIr5jpsFNpIWzW9Hpp0E3I1xc8z+3rybUtUv9c8S
         xXPw==
X-Gm-Message-State: AOAM5316bUJTLbgLLycKLd3i9Xfkkt3WZWdXCqmvwtlARb7QPFdpVWEV
        v49rhQKn2ClZMN5YEiKpM5o=
X-Google-Smtp-Source: ABdhPJyUuNLPIvFuTkno50Z8KunBg8GLSaabHpi5Wb+v6bVPPax/PEVJbocspeMf5EIGu0YuhIqq1Q==
X-Received: by 2002:a17:90a:4606:: with SMTP id w6mr8742831pjg.205.1613559007197;
        Wed, 17 Feb 2021 02:50:07 -0800 (PST)
Received: from localhost (89.208.244.53.16clouds.com. [89.208.244.53])
        by smtp.gmail.com with ESMTPSA id u22sm2053238pfn.62.2021.02.17.02.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 02:50:06 -0800 (PST)
Date:   Wed, 17 Feb 2021 18:50:04 +0800
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rric@kernel.org, helgaas@kernel.org, wsa@kernel.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] Documentation: devres: Add
 pcim_alloc_irq_vectors()
Message-ID: <20210217105004.GA766103@nuc8i5>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <20210216160249.749799-3-zhengdejin5@gmail.com>
 <YCv8nCX0ZdAb+CHm@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YCv8nCX0ZdAb+CHm@rocinante>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 16, 2021 at 06:10:52PM +0100, Krzysztof Wilczyński wrote:
> Hi Dejin,
> 
> Thank you again for all the work here!
> 
> > Add pcim_alloc_irq_vectors(), a device-managed version of
> > pci_alloc_irq_vectors(). introducing this function can simplify
> > the error handling path in many drivers.
> 
> The second sentence should most likely start with a capital letter.
> 
> Having said that, people might ask - how does it simplify the error
> handling path?
> 
> You might have to back this with a line of two to explain how does the
> change achieved that, so that when someone looks at the commit message
> it would be clear what the benefits of the change were.
>
Hi Krzysztof,

The device-managed function is a conventional concept that every developer
knows. So don't worry about this. And I really can't explain its operation
mechanism to you in a sentence or two. If you are really interested, you
can read the relevant code.

I think it is meaningless to add a lot of explanations of general
concepts in the commit comments. Maybe it will be better let us put more
energy and time on the code.

BR,
Dejin

> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> 
> Krzysztof
