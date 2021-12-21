Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D8947C67D
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241294AbhLUSYq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241288AbhLUSYo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Dec 2021 13:24:44 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CB3C061574;
        Tue, 21 Dec 2021 10:24:44 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id n15-20020a17090a394f00b001b0f6d6468eso3364409pjf.3;
        Tue, 21 Dec 2021 10:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LLbUERErP8J6jv3rEhpLyeIsQ6Y5Chn8ZKVmoVrvT1Q=;
        b=gUdLCr7tIqYT0FstkfKFNni3dCXHvquFn1mWfR8KYu8UH7w7XbfaIW5ksBGM5s1O9w
         ob2zMeUz819V9CHIWlhK9k+SyyEOz0DycIJE6tiuheQxNwwXJF9GjmyYfeijVComxl/c
         Zll8l9LG8EYvUBE7+W5Axp5w8iP61MWFBPMGFPXgUaZZU3tYKc6HWKTbe3Svrda9V3m9
         WVaC0mqucGBogcsjkRbBlfXljAqqX+qJOZoeO5WxtoCDictiTy/m5gfrbnMFFj255OUS
         rNafDGJdSI/vtLOr8wql4On0+AotvBSrwlArFDaY0hvfaho6tGWA93EGzv2KqrdgooRr
         DSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LLbUERErP8J6jv3rEhpLyeIsQ6Y5Chn8ZKVmoVrvT1Q=;
        b=enq3UyDsL9bYdTOxFAfgF8nNRiLKMjyUPaH+i8ZChuWkgWKjmjYpwOQnOcTRLvhTme
         ae0Qf9HOCGI41PxrtzS2/+IOJIFZqPbQsSCj5lzXpfiFq4pONO44Zmwq3OQl0GRzeg6w
         JU6rgIk5UQromTvX37L2CEtQbalZclOTWqp6/2qjiWYd6O3X8rNpyvlB+3mTIXKOG6Aq
         Gj1cY/RpQ6nmhzzFszZwz4UAkWn3+H27OHNbabpS4jgGgj+YPLGINDXRG+uNcS37FV73
         flRxOByLaJN+fWggOBqAHIoi9TmyjkEqFDfV/YBlVWOEQ/1D7F/7mg4Phvde5lUO/ukm
         rEIQ==
X-Gm-Message-State: AOAM532VM7oGHFmPDbpu2lUuq8XiZ9KZcKIlyUrF/Zdp8g4VUdJcQXFd
        I6b+d/woaGvmrz6sAyVpF2g=
X-Google-Smtp-Source: ABdhPJz5oLM+PeV9yzFzBcXDcWja5YwG3oCGMLGc1k149XndFaMv17o6/4F0iuNdwTSaOhiAMA7uBg==
X-Received: by 2002:a17:903:4041:b0:148:b052:45ba with SMTP id n1-20020a170903404100b00148b05245bamr4451705pla.130.1640111083897;
        Tue, 21 Dec 2021 10:24:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id q28sm3250434pgn.14.2021.12.21.10.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 10:24:43 -0800 (PST)
Subject: Re: [PATCH v2 1/3] i2c: bcm2835: Use platform_get_irq() to get the
 interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Prabhakarprabhakar.csengg@gmail.com
References: <20211221175322.7096-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211221175322.7096-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6e11a8bc-4d7b-db2c-87ff-4a6b1f5419a0@gmail.com>
Date:   Tue, 21 Dec 2021 10:24:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221175322.7096-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/21/21 9:53 AM, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
