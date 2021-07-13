Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D17B3C737B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 17:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbhGMPrB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 11:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236932AbhGMPrB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 11:47:01 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F54DC0613DD;
        Tue, 13 Jul 2021 08:44:11 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id e1-20020a9d63c10000b02904b8b87ecc43so8991307otl.4;
        Tue, 13 Jul 2021 08:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=retq6liOP8LyC4cjQJYBW1Hq0tEy4WkIXq1yMZpGIss=;
        b=l5diPwu63ZdwRDfFsRfLQy6ioKCxMcgkhHwIYlXxCmK8cfEIsueg3SB3anKBpHRUFL
         /ygVShxWcr+HN/+V5ri/oymhukuLDAjGZ7wzhGv9J3LNpQZRxmJ4uVnL8MX8CaGKXiem
         6863xjwYlv9r55SU7cPAxwSnubqtyzFaIL7/WWAWmncdYPMNYhLBxdOOPsLH5ogoja8I
         4MB/Ghh455+ouxNT3gtRiQFhNsx7hN+MGYLiMkhrFWeN+levLLFjQOL8rEXE6EecfxQt
         DptmuInoEjccYpab6fsGBKqa3jVdcmuD1AfGNLxNIa7ixzEEcMcRjx4mnTi0yXi6aeBz
         nXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=retq6liOP8LyC4cjQJYBW1Hq0tEy4WkIXq1yMZpGIss=;
        b=EXkrF/I3qDFEL1C2XM+ORqoPl+NAqYLpMNrQu+mJ0sW3faaWzVCnkn1/9oc7YIbu+F
         pA0f13hPwVfVdZ4+mTPkIHSq88DYBHEWicMWWwbFiOLIQGRPeDIMIC2b09wK1dvPzKZG
         H9w6Bh3L6YXokJpF3O+o4z/a2sIYZIzPJ8WyOtyXSKqLziQUT0fgQ9b6EakcdugliwoF
         /JvV4daHp65WRa1R77rI3TvdAhVf82VCNotQKDFsES+f5ktuF3YxkKVOX36AVGuDx2pk
         mYK/Pkqm51ID/nRlYt++ZDwdzzKWxpawfs7BY2N/Qs8QpRE4BllKmFi1mkUbDhcC4wVH
         1B5g==
X-Gm-Message-State: AOAM5305NXibudOGp2J8lYlOWvPDKr5gSzViJmflQvAzTP7V9L8yA46G
        gNdplv7dvl+lW6DGks3xRg==
X-Google-Smtp-Source: ABdhPJyx0htP9DIoOaWYr204hm25coZiD0nA2Sxr0KKjHdzpEOchF2qpDQHfdQWgEM0KXzdIvynVzw==
X-Received: by 2002:a05:6830:3108:: with SMTP id b8mr4034650ots.182.1626191050482;
        Tue, 13 Jul 2021 08:44:10 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id v26sm336142oof.30.2021.07.13.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 08:44:08 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:2514:a9eb:8442:8902])
        by serve.minyard.net (Postfix) with ESMTPSA id 08A4D1800E8;
        Tue, 13 Jul 2021 15:44:07 +0000 (UTC)
Date:   Tue, 13 Jul 2021 10:44:05 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v4 0/3] Add SSIF BMC driver
Message-ID: <20210713154405.GB3406@minyard.net>
Reply-To: minyard@acm.org
References: <20210713055425.30636-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713055425.30636-1-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jul 13, 2021 at 12:54:22PM +0700, Quan Nguyen wrote:
> This series add support the SSIF BMC driver which is to perform in-band
> IPMI communication with their host in management (BMC) side.

Per the kernel build robot, looks like patch 3 introduces slave_enable()
but patch 1 uses it.

-corey

> 
> SSIF BMC driver in this series is tested with Aspeed AST2500.
> 
> v4:
>   + Fix recursive spinlock                                      [Graeme]
>   + Send response with Completion code 0xFF when aborting         [Quan]
>   + Fix warning with dt_binding_check                              [Rob]
>   + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml                  [Quan]
>   + Added bounding check on SMBus writes and the whole request     [Dan]
>   + Moved buffer to end of struct ssif_bmc_ctx to avoid context
>     corruption if somehow buffer is written past the end           [Dan]
>   + Return -EINVAL if userspace buffer too small, dont
>     silence truncate                                       [Corey, Joel]
>   + Not necessary to check NONBLOCK in lock                      [Corey]
>   + Enforce one user at a time                                    [Joel]
>   + Reject write with invalid response length from userspace     [Corey]
>   + Add state machines for better ssif bmc state handling         [Quan]
>   + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
>     SSIF BMC driver                                               [Quan]
>   + Change compatible string "aspeed,ast2500-ssif-bmc" to
>     "ampere,ssif-bmc"                                             [Quan]
>   + Toggle Slave enable in i2c-aspeed to turn on/off slave mode   [Ryan]
>   + Added slave_enable() to struct i2c_algorithm to control
>     slave mode and to address the recursive spinlock      [Graeme, Ryan]
>   + Abort current request with invalid SMBus write or
>     invalid command                                               [Quan]
>   + Abort all request if there is pending response                [Quan]
>   + Changed validate_pec() to validate_request()                  [Quan]
>   + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
>   + Print internal state string for ease investigating issue      [Quan]
>   + Move to READY state on SLAVE_STOP event                       [Quan]
>   + Change initilize_transfer() to process_smbus_cmd()            [Quan]
>   + Introduce functions for each slave event                      [Quan]
> 
> v3:
>   + Switched binding doc to use DT schema format [Rob]
>   + Splited into generic ssif_bmc and aspeed-specific [Corey, Joel]
>   + Removed redundant license info [Joel]
>   + Switched to use traditional if-else [Joel]
>   + Removed unused ssif_bmc_ioctl() [Joel]
>   + Made handle_request()/complete_response() to return void [Joel]
>   + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request()
>   [Corey]
>   + Remove mutex [Corey]
>   + Use spin_lock/unlock_irqsave/restore in callback [Corey]
>   + Removed the unnecessary memset [Corey]
>   + Switch to use dev_err() [Corey]
>   + Combine mask/unmask two interrupts together [Corey]
>   + Fixed unhandled Tx done with NAK [Quan]
>   + Late ack'ed Tx done w/wo Ack irq [Quan]
>   + Use aspeed-specific exported aspeed_set_slave_busy() when slave busy
>   to fix the deadlock [Graeme, Philipp, Quan]
>   + Clean buffer for last multipart read [Quan]
>   + Handle unknown incoming command [Quan]
> 
> v2:
>   + Fixed compiling error with COMPILE_TEST for arc
> 
> Quan Nguyen (3):
>   ipmi: ssif_bmc: Add SSIF BMC driver
>   bindings: ipmi: Add binding for SSIF BMC driver
>   i2c: aspeed: Add slave_enable() to toggle slave mode
> 
>  .../devicetree/bindings/ipmi/ssif-bmc.yaml    |  38 +
>  drivers/char/ipmi/Kconfig                     |  11 +
>  drivers/char/ipmi/Makefile                    |   1 +
>  drivers/char/ipmi/ssif_bmc.c                  | 781 ++++++++++++++++++
>  drivers/char/ipmi/ssif_bmc.h                  | 106 +++
>  drivers/i2c/busses/i2c-aspeed.c               |  20 +
>  include/linux/i2c.h                           |   2 +
>  7 files changed, 959 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 drivers/char/ipmi/ssif_bmc.h
> 
> -- 
> 2.28.0
> 
