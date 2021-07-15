Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0993CAFAF
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jul 2021 01:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbhGOXfr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jul 2021 19:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbhGOXfr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jul 2021 19:35:47 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562DDC06175F;
        Thu, 15 Jul 2021 16:32:53 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 42-20020a9d012d0000b02904b98d90c82cso8003638otu.5;
        Thu, 15 Jul 2021 16:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=HlStEC6or+9N8Cwt9oF7vYLgwg9asjNsBZZ4MGIjNuM=;
        b=XwTyE5pm0jwBWOsd9hfC3ExcIg9nDiFjftH6RKtP2U6uxrFd3HpIt+/6uhbQsvK+m4
         +WgH8vS6kSCb6llnSZN2Cg7QvWlP+uATjtMBLc3O0xbahN6kZoPlLFMEcb6sZxi33/OH
         Hxi9DhfOQEmy6ogjJc1gNBMa4gjYMAvnGsVyeWmultjZndXZUBO6SW40v0t+cJvieZBz
         bsaK2qIUVHX5chaC6NFB8ix/HsUTzUuhekYeTY2lvVxvvZ7YbAN1KlcyB2d6ANbDDYEH
         /o2euloqJZRbeaFQt+0TubLigYBEExc7MO9Y2AkNEDIzfHNV5bEOiMxEKmz/jMNXY56M
         19qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=HlStEC6or+9N8Cwt9oF7vYLgwg9asjNsBZZ4MGIjNuM=;
        b=MQNIrGTj+tz1OlTgxquk2BSzJzMO6orrMJBzLQ2xIDf8GXhTwVUl/EtHa72hIlNek7
         YoMcbWP/oWzsjHlx6q+LXUy8/Jnb2BWRwDOOxDMeAcf5xQAFql6aTPDPrziu0ky9mSL4
         eLDGSP1vXuoXEp0E1bcqzZsOHURuJKW44f3bOwqnnzFbXdDlC9oi8anoD/T/4o2yiI4q
         W4c8CPOOW4rgN5sL9woxW+8Ah/BISzJL4nlGS8rSQbX9SElgXob2ZmHBh3UdfjLogdap
         aIIaxTSgQL95kr1C6w/xTvGK3H/S4JFdEnOXRtEpvTH0RD3daA08S1S1CceE4mq1tUJ5
         RD3w==
X-Gm-Message-State: AOAM5320GQO3WT9TyhnhS8FSLE95/+m7Tcd4Ad+rxZYkEK6+4ZUCjUcs
        HjY5NIlxXpScVaTIBFpXLQ==
X-Google-Smtp-Source: ABdhPJyRd2kar/SWjGLB/Gtxx9oUFFRXtmYqGetIjej3d7xwi0kq0iA0ROOS36HUp113zMuPAXTt0g==
X-Received: by 2002:a05:6830:114f:: with SMTP id x15mr5751678otq.356.1626391972537;
        Thu, 15 Jul 2021 16:32:52 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id x129sm1566206oia.26.2021.07.15.16.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 16:32:51 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:8515:1333:671e:f6ae])
        by serve.minyard.net (Postfix) with ESMTPSA id 2B629180058;
        Thu, 15 Jul 2021 23:32:50 +0000 (UTC)
Date:   Thu, 15 Jul 2021 18:32:48 -0500
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
Subject: Re: [PATCH v5 0/3] Add SSIF BMC driver
Message-ID: <20210715233248.GF3406@minyard.net>
Reply-To: minyard@acm.org
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714033833.11640-1-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 14, 2021 at 10:38:30AM +0700, Quan Nguyen wrote:
> This series add support the SSIF BMC driver which is to perform in-band
> IPMI communication with their host in management (BMC) side.
> 
> SSIF BMC driver in this series is tested with Aspeed AST2500.

Ok, I have queued this and added Rob's review.  Five versions, you had
to work for this one :).

Thanks,

-corey

> 
> v5:
>   + Correct the patches order to fix the bisect issue found by
>   kernel build robot
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
>   i2c: aspeed: Add slave_enable() to toggle slave mode
>   ipmi: ssif_bmc: Add SSIF BMC driver
>   bindings: ipmi: Add binding for SSIF BMC driver
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
