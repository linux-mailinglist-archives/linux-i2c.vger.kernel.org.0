Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435EA352B61
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Apr 2021 16:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235548AbhDBOVa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Apr 2021 10:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234161AbhDBOV2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Apr 2021 10:21:28 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC1BC0613E6;
        Fri,  2 Apr 2021 07:21:27 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so5070376otk.5;
        Fri, 02 Apr 2021 07:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=wFmEeiu8O3e8Ysh2Egg3y980B0w0wNYvL3AQsHO1K90=;
        b=TEke5GjgaqkttHMJd3gpOWOLZlhz+MiKptNdXq8ft1He/cIpADCj3tiZwUM9IYSw4V
         Gvvu7NIe9GL7P0s/lWgZAEyAviwLVRetY8SiH2c1VbyO1i/Tg8l9AY+WD+1EF/woPpfw
         rZBUW88EJspY50LRle0kjWmjeV/75EIcGor9r23rtDPE1G/M2kQMM3+y/hl6247D6rrf
         y7vV3SgypcrgIZcQipJSxG4KqvseVfEv3W9fsNylo2RXNfyFebh5btWeiLqZ4G04uUYr
         V4Cpss+112fE1xJx7eNhLhi30991uwkZKC31i9X3CgMq/2og6LMqgjONxTaOAPOtmXMz
         SGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=wFmEeiu8O3e8Ysh2Egg3y980B0w0wNYvL3AQsHO1K90=;
        b=IA5++HDuJo7x1aitCT7JXsGSYbisldjnknUbFICjZkPfWdiJt8mrEziW5LQeh/uNnU
         p5f1K3MyB2ZEI/IpBco4843ZK2D6MFieUBgLpuEewEgJsRXtzXK5A/FfAGYxjNBbXq63
         CwNInn89tAT2A8jBvHLao6XngRLYwo2jtqusXt6P/JVwk9+WPE7qkb1wdPjjtrfNeK6m
         IN2wZS5DLdBG1ShKP49J84jzfg96TSrnBPbjehsq71kmNTb3SXWsTJBTdVQD+usT52QE
         2eiBs0EdRXUl3/nF2rt7mj5PCjRrjXTHIcAtX3Edii4ZO4v8xphpb6JjERoT7w9F4SAQ
         tdyg==
X-Gm-Message-State: AOAM5304tLN1svkjus4XBwzIfq8UShRMRgaRHKHRE8zd9AF+gjy+Vxtn
        9wZq+33jJ6W6Vg9nHarC6Q==
X-Google-Smtp-Source: ABdhPJwB49R/AXpP58aqRK6or0bUV24xyuHImwp2nt06uXJKkyQwip4E4SqGVpKu38xSByynoJ4+9g==
X-Received: by 2002:a05:6830:15d2:: with SMTP id j18mr11707892otr.75.1617373286969;
        Fri, 02 Apr 2021 07:21:26 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id b22sm1904897ots.59.2021.04.02.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 07:21:26 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:f99f:823a:495e:5af])
        by serve.minyard.net (Postfix) with ESMTPSA id 371D6180570;
        Fri,  2 Apr 2021 14:21:25 +0000 (UTC)
Date:   Fri, 2 Apr 2021 09:21:24 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v2 0/3] Add Aspeed SSIF BMC driver
Message-ID: <20210402142124.GV507977@minyard.net>
Reply-To: minyard@acm.org
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330141029.20412-1-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 30, 2021 at 09:10:26PM +0700, Quan Nguyen wrote:
> This series add support for the Aspeed specific SSIF BMC driver which
> is to perform in-band IPMI communication with the host in management
> (BMC) side.

I don't have any specific feedback for this, but I'm wondering if it's
really necessary.

Why can't the BMC just open the I2C device and use it?  Is there any
functionality that this provides that cannot be accomplished from
userland access to the I2C device?  I don't see any.

If it tied into some existing framework to give abstract access to a BMC
slave side interface, I'd be ok with this.  But I don't see that.

Unless there is a big need to have this in the kernel, I'm against
including this and would suggest you do all this work in userland.
Perhaps write a library.  Sorry, but I'm trying to do my part to reduce
unnecessary things in the kernel.

Thanks,

-corey

> 
> v2:
>   + Fixed compiling error with COMPILE_TEST for arc
> 
> Quan Nguyen (3):
>   i2c: i2c-core-smbus: Expose PEC calculate function for generic use
>   drivers: char: ipmi: Add Aspeed SSIF BMC driver
>   bindings: ipmi: Add binding for Aspeed SSIF BMC driver
> 
>  .../bindings/ipmi/aspeed-ssif-bmc.txt         |  18 +
>  drivers/char/ipmi/Kconfig                     |  22 +
>  drivers/char/ipmi/Makefile                    |   2 +
>  drivers/char/ipmi/ssif_bmc.c                  | 645 ++++++++++++++++++
>  drivers/char/ipmi/ssif_bmc.h                  |  92 +++
>  drivers/char/ipmi/ssif_bmc_aspeed.c           | 132 ++++
>  drivers/i2c/i2c-core-smbus.c                  |  12 +-
>  include/linux/i2c.h                           |   1 +
>  8 files changed, 922 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 drivers/char/ipmi/ssif_bmc.h
>  create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c
> 
> -- 
> 2.28.0
> 
