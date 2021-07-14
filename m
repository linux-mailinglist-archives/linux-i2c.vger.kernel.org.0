Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414243C7A7D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 02:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237047AbhGNAUb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 20:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237022AbhGNAUa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jul 2021 20:20:30 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39AB8C0613DD;
        Tue, 13 Jul 2021 17:17:39 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso692960otu.10;
        Tue, 13 Jul 2021 17:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=ANBre7e/SeOgwL/kzxB4MEQhrNdFwAa+nXG5MhaUU/0=;
        b=twt0VPxbYbALN1uhWFP6Q0BG5HRHqjR3t2ca4CF8GG5CU/m30bRD3WkEtSJ6tHEG+4
         vSUWF4kkATG9F+c81vIvEas4+9lQu/S+LbMIfpCP8KLwlTrErq3QPIK5szgJRP1d0hs0
         FLVE13Y4IPT9W4WJOSUToCNSMqSONZyqJOG2bTnAvcdD5VsM+6gbsxHqQs9kzXws7O3z
         L+MgSqzTp4W3V70D+WkwXZjsC9/QbLQzBVZcuSAzmi1sMbS/IMqYByrFyGlwsMGgA+l4
         J/C7HFkvfe0f59+oc5TxXzip62eZYk6netAVqjPfRWWkAhiIExvfejPDKMgzceiOelHB
         pUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=ANBre7e/SeOgwL/kzxB4MEQhrNdFwAa+nXG5MhaUU/0=;
        b=mjUAO3zCQ0V+Fk4Xn7OTNxsjsEnX7j1LWkyy2wUvGLCUsHTku+urm9uXG7hsJ9q3dW
         SAyccQqSTOgtUI5ggw7oM9aMSWaE47rQwr/B83x9X0PQgBd907qzgiHR/BMTMCRA+6iH
         k4r/Fu3oHPzj6j8fkpPXIHcvUa2g0cy1fGo0eujr3uiBPoMMQNZQ43Zk8SpB2SjsW1DW
         Z6wss5ZQtu4TohuwrM5LkWJFyclBVZi+69MpSUSl5fy+oHG2KsBTnbjsfNTZLwYHTYu0
         iRaErYxUXJO1hchxva8BfGYQcpBcJI6QcAWpElHnOXjTTKVnNNE/J2bPlB4KoHRzqDvV
         0mAg==
X-Gm-Message-State: AOAM5304Mxk+kCxBgpaAuR5sd43kHzjxvyEyO6cBmXPeSWsP5hyPgSwM
        3x2gJ+2nPKEocViQYxmxxA==
X-Google-Smtp-Source: ABdhPJwl33HIb5+qvgtynzyVDjT324T1pKdLQUnPLKYfWQHVqv5GYScqiZwm0JmSDRuTot9Y/rHQKA==
X-Received: by 2002:a9d:2c61:: with SMTP id f88mr5834409otb.62.1626221858570;
        Tue, 13 Jul 2021 17:17:38 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
        by smtp.gmail.com with ESMTPSA id s29sm170136oiw.54.2021.07.13.17.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 17:17:38 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:6938:a190:9608:2d5d])
        by serve.minyard.net (Postfix) with ESMTPSA id 3ADD518005A;
        Wed, 14 Jul 2021 00:17:37 +0000 (UTC)
Date:   Tue, 13 Jul 2021 19:17:36 -0500
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
Message-ID: <20210714001736.GD3406@minyard.net>
Reply-To: minyard@acm.org
References: <20210713055425.30636-1-quan@os.amperecomputing.com>
 <20210713154405.GB3406@minyard.net>
 <f7dd5b0f-a2a7-0a5f-3521-6721e8e52cb5@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7dd5b0f-a2a7-0a5f-3521-6721e8e52cb5@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 14, 2021 at 06:29:27AM +0700, Quan Nguyen wrote:
> On 13/07/2021 22:44, Corey Minyard wrote:
> > On Tue, Jul 13, 2021 at 12:54:22PM +0700, Quan Nguyen wrote:
> > > This series add support the SSIF BMC driver which is to perform in-band
> > > IPMI communication with their host in management (BMC) side.
> > 
> > Per the kernel build robot, looks like patch 3 introduces slave_enable()
> > but patch 1 uses it.
> > 
> > -corey
> > 
> Thanks Corey,
> 
> The order is not correct and kernel build robot found this hurts
> bisectibility.
> The patch 3 should be the first patch.

Ok, can you re-submit in the right order?

Thanks,

-corey

> 
> - Quan
> 
> > > 
> > > SSIF BMC driver in this series is tested with Aspeed AST2500.
> > > 
> > > v4:
> > >    + Fix recursive spinlock                                      [Graeme]
> > >    + Send response with Completion code 0xFF when aborting         [Quan]
> > >    + Fix warning with dt_binding_check                              [Rob]
> > >    + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml                  [Quan]
> > >    + Added bounding check on SMBus writes and the whole request     [Dan]
> > >    + Moved buffer to end of struct ssif_bmc_ctx to avoid context
> > >      corruption if somehow buffer is written past the end           [Dan]
> > >    + Return -EINVAL if userspace buffer too small, dont
> > >      silence truncate                                       [Corey, Joel]
> > >    + Not necessary to check NONBLOCK in lock                      [Corey]
> > >    + Enforce one user at a time                                    [Joel]
> > >    + Reject write with invalid response length from userspace     [Corey]
> > >    + Add state machines for better ssif bmc state handling         [Quan]
> > >    + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
> > >      SSIF BMC driver                                               [Quan]
> > >    + Change compatible string "aspeed,ast2500-ssif-bmc" to
> > >      "ampere,ssif-bmc"                                             [Quan]
> > >    + Toggle Slave enable in i2c-aspeed to turn on/off slave mode   [Ryan]
> > >    + Added slave_enable() to struct i2c_algorithm to control
> > >      slave mode and to address the recursive spinlock      [Graeme, Ryan]
> > >    + Abort current request with invalid SMBus write or
> > >      invalid command                                               [Quan]
> > >    + Abort all request if there is pending response                [Quan]
> > >    + Changed validate_pec() to validate_request()                  [Quan]
> > >    + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
> > >    + Print internal state string for ease investigating issue      [Quan]
> > >    + Move to READY state on SLAVE_STOP event                       [Quan]
> > >    + Change initilize_transfer() to process_smbus_cmd()            [Quan]
> > >    + Introduce functions for each slave event                      [Quan]
> > > 
> > > v3:
> > >    + Switched binding doc to use DT schema format [Rob]
> > >    + Splited into generic ssif_bmc and aspeed-specific [Corey, Joel]
> > >    + Removed redundant license info [Joel]
> > >    + Switched to use traditional if-else [Joel]
> > >    + Removed unused ssif_bmc_ioctl() [Joel]
> > >    + Made handle_request()/complete_response() to return void [Joel]
> > >    + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request()
> > >    [Corey]
> > >    + Remove mutex [Corey]
> > >    + Use spin_lock/unlock_irqsave/restore in callback [Corey]
> > >    + Removed the unnecessary memset [Corey]
> > >    + Switch to use dev_err() [Corey]
> > >    + Combine mask/unmask two interrupts together [Corey]
> > >    + Fixed unhandled Tx done with NAK [Quan]
> > >    + Late ack'ed Tx done w/wo Ack irq [Quan]
> > >    + Use aspeed-specific exported aspeed_set_slave_busy() when slave busy
> > >    to fix the deadlock [Graeme, Philipp, Quan]
> > >    + Clean buffer for last multipart read [Quan]
> > >    + Handle unknown incoming command [Quan]
> > > 
> > > v2:
> > >    + Fixed compiling error with COMPILE_TEST for arc
> > > 
> > > Quan Nguyen (3):
> > >    ipmi: ssif_bmc: Add SSIF BMC driver
> > >    bindings: ipmi: Add binding for SSIF BMC driver
> > >    i2c: aspeed: Add slave_enable() to toggle slave mode
> > > 
> > >   .../devicetree/bindings/ipmi/ssif-bmc.yaml    |  38 +
> > >   drivers/char/ipmi/Kconfig                     |  11 +
> > >   drivers/char/ipmi/Makefile                    |   1 +
> > >   drivers/char/ipmi/ssif_bmc.c                  | 781 ++++++++++++++++++
> > >   drivers/char/ipmi/ssif_bmc.h                  | 106 +++
> > >   drivers/i2c/busses/i2c-aspeed.c               |  20 +
> > >   include/linux/i2c.h                           |   2 +
> > >   7 files changed, 959 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
> > >   create mode 100644 drivers/char/ipmi/ssif_bmc.c
> > >   create mode 100644 drivers/char/ipmi/ssif_bmc.h
> > > 
> > > -- 
> > > 2.28.0
> > > 
> 
