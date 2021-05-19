Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A420A388E26
	for <lists+linux-i2c@lfdr.de>; Wed, 19 May 2021 14:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346441AbhESMfY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 08:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbhESMfY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 08:35:24 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D98C061760;
        Wed, 19 May 2021 05:34:04 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id j75so12910201oih.10;
        Wed, 19 May 2021 05:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=VrjofVBqpi4EHgG9TcMkr4kH1OnwVdI3jKjQrhy1Fug=;
        b=WSbmTBjMuGsiyyywp5Dh3Q3mVYW2nbZQjg0K6XpN0ym7Jrl7a5IQuCF3IA3QXe4shk
         Ng8JJSYbNTWhKXk9LZm6Ks6Q4VkQ67uzl+BHacClNTEsfVOw/4DTeqzd/8NTDS2Xbk0Z
         ta+hXBtHynyG4MWZyKPg6/es2FymwlidZMkU7Z+7qGt2kU16NoC7yi0X/hKPBlybJxLS
         nW30UfL3+CWamV4v6eEu79DvmCx7vOijxZNl6iGcLa6U530GJ6DakL3VwL2DteDB0c9M
         xoJXf0W7rhuoTQrHKa1N7zPYAfPaMS9yiITcKYvZaU4xDeDvS0H6OHndrcIElujRWsT0
         j8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=VrjofVBqpi4EHgG9TcMkr4kH1OnwVdI3jKjQrhy1Fug=;
        b=TwBGtqkPxxYQkCBgm+7AxeQuNqihyDhR8AIujeE/pXteuIpfAbDotYEe3DAPYkEhAj
         fcr6jpdFOw3aux34XphR9wpx5KnR1b5x8j/8XfYCKfnPmsCT1qVmItYjO/iJLhxuxA+q
         zD0Da4qpgFQRdToiEuiGnC4LoG3ld0T0szG6pD3UWxkYvHaJVtmrCEm4DUmNoYfaml9L
         HlJEpgl3lkICqRArffqCt6rumDgSu3Oeid1FUuwTZm10IUljH0yJhNXHVStwvprNAT7E
         gwPDQTfr1UWx4aca6WrL+S1h1b0RmhMzHgyqLl4sRXvRD+sXfkd93qUVGL26uEB4dp2X
         pEBQ==
X-Gm-Message-State: AOAM531WZeqO4L+iNFQVt/a5J435qtOHYZRPOWiWwJWedbSqCNmBvI5e
        q8SuVPPqq8Eib9WDqHusjg==
X-Google-Smtp-Source: ABdhPJzF+Fy8did2QXIYwMFyj+Pr3q+myW/DhiifWrK0n5h2AtQhvpL+QDG4LfcQO07Tc5btOdZCGg==
X-Received: by 2002:aca:b5c4:: with SMTP id e187mr8250914oif.149.1621427643980;
        Wed, 19 May 2021 05:34:03 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
        by smtp.gmail.com with ESMTPSA id x78sm888530ooa.15.2021.05.19.05.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 05:34:03 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:9144:ba66:ea13:f260])
        by serve.minyard.net (Postfix) with ESMTPSA id 93A3618000C;
        Wed, 19 May 2021 12:34:02 +0000 (UTC)
Date:   Wed, 19 May 2021 07:34:01 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 0/7] Add Aspeed SSIF BMC driver
Message-ID: <20210519123401.GG2921206@minyard.net>
Reply-To: minyard@acm.org
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519074934.20712-1-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 19, 2021 at 02:49:27PM +0700, Quan Nguyen wrote:
> This series add support for the Aspeed specific SSIF BMC driver which
> is to perform in-band IPMI communication with the host in management
> (BMC) side.
> 
> v3:
>   + Switched binding doc to use DT schema format [Rob]
>   + Splited into generic ssif_bmc and aspeed-specific [Corey, Joel]
>   + Removed redundant license info [Joel]
>   + Switched to use traditional if-else [Joel]
>   + Removed unused ssif_bmc_ioctl() [Joel]
>   + Made handle_request()/complete_response() to return void [Joel]
>   + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request() [Corey]
>   + Remove mutex [Corey]
>   + Use spin_lock/unlock_irqsave/restore in callback [Corey]
>   + Removed the unnecessary memset [Corey]
>   + Switch to use dev_err() [Corey]
>   + Combine mask/unmask two interrupts together [Corey]
>   + Fixed unhandled Tx done with NAK [Quan]
>   + Late ack'ed Tx done w/wo Ack irq [Quan]
>   + Use aspeed-specific exported aspeed_set_slave_busy() when slave busy
> to fix the deadlock [Graeme, Philipp, Quan]
>   + Clean buffer for last multipart read [Quan]
>   + Handle unknown incoming command [Quan]
> 
> v2:
>   + Fixed compiling error with COMPILE_TEST for arc
> 
> Quan Nguyen (7):
>   i2c: i2c-core-smbus: Expose PEC calculate function for generic use

Note that for this I2C-specific change, I will need acks from the I2C
maintainers to be able to include this in my tree.

>   ipmi: ssif_bmc: Add SSIF BMC driver
>   i2c: aspeed: Fix unhandled Tx done with NAK

For the aspeed changes, they don't really belong here, they belong in
the aspeed tree.  I see that you need them for the device to work
correctly, though.  I'll need acks from maintainers to include them.

>   i2c: aspeed: Acknowledge Tx done w/wo ACK irq late
>   i2c: aspeed: Add aspeed_set_slave_busy()
>   ipmi: ssif_bmc: Add Aspeed SSIF BMC driver
>   bindings: ipmi: Add binding for Aspeed SSIF BMC driver
> 
>  .../bindings/ipmi/aspeed-ssif-bmc.yaml        |  33 +
>  drivers/char/ipmi/Kconfig                     |  22 +
>  drivers/char/ipmi/Makefile                    |   2 +
>  drivers/char/ipmi/ssif_bmc.c                  | 605 ++++++++++++++++++
>  drivers/char/ipmi/ssif_bmc.h                  |  93 +++
>  drivers/char/ipmi/ssif_bmc_aspeed.c           |  75 +++
>  drivers/i2c/busses/i2c-aspeed.c               |  51 +-
>  drivers/i2c/i2c-core-smbus.c                  |  12 +-
>  include/linux/i2c.h                           |   1 +
>  9 files changed, 884 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 drivers/char/ipmi/ssif_bmc.h
>  create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c
> 
> -- 
> 2.28.0
> 
