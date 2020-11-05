Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60B72A7835
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 08:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgKEHqq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 02:46:46 -0500
Received: from linux.microsoft.com ([13.77.154.182]:49522 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKEHqq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Nov 2020 02:46:46 -0500
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id 5B48D20B4905; Wed,  4 Nov 2020 23:46:45 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5B48D20B4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1604562405;
        bh=+4vC5pdHWhZcsC4RLqsaXzruecfzwJvr9SPbBGML92k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PUIS5sSOund47b2bGCatf6rcJhvYsR39zR8hdPoD83WmfHmrpB6rxs14MbPhsoEd0
         KFNmGAaZHP9tI4uCmlbnRUskomHcymw9Iya0xpHsON9Wgsm0Eu8BBtKoryEpgkXCdR
         nF4PlSCGPSYxyH65Bt0DWHlMENv9ctS8mwcvB7R0=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     ray.jui@broadcom.com
Cc:     andriy.shevchenko@linux.intel.com,
        bcm-kernel-feedback-list@broadcom.com, brendanhiggins@google.com,
        dphadke@linux.microsoft.com, f.fainelli@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, lori.hikichi@broadcom.com,
        rayagonda.kokatanur@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, wsa@kernel.org
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
Date:   Wed,  4 Nov 2020 23:46:45 -0800
Message-Id: <1604562405-25414-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <97a8d7bf-e877-c03a-f789-16cac9bb2643@broadcom.com>
References: <97a8d7bf-e877-c03a-f789-16cac9bb2643@broadcom.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 4 Nov 2020 10:01:06 -0800, Ray Jui wrote:

>>>> +#define MAX_SLAVE_RX_PER_INT         10
>>>>
>>>
>>>> In patch [3/6], you've enabled IS_S_RX_THLD_SHIFT in slave ISR bitmask,
>>>> however it's not actually used in processing rx events.
>>>>
>>>> Instead of hardcoding this threshold here, it's better to add a
>>>> device-tree knob for rx threshold, program it in controller and handle
>>>> that RX_THLD interrupt. This will give more flexibility to drain the rx
>>>> fifo earlier than -
>>>> (1) waiting for FIFO_FULL interrupt for transactions > 64B.
>>>> (2) waiting for start of read transaction in case of master write-read.
>> 
>> Yes this is one way to implement.
>> But do you see any issue in batching 64 bytes at a time in case of
>> transaction > 64 Bytes.
>> I feel batching will be more efficient as it avoids more number of
>> interrupts and hence context switch.
>> 
>>>
>>> The Device Tree is really intended to describe the hardware FIFO size,
>>> not watermarks, as those tend to be more of a policy/work load decision.
>>> Maybe this is something that can be added as a module parameter, or
>>> configurable via ioctl() at some point.
>> 
>
>Yes, DT can have properties to describe the FIFO size, if there happens
>to be some variants in the HW blocks in different versions. But that is
>not the case here. DT should not be used to control SW/use case specific
>behavior.

So the suggestion was to set HW threshold for rx fifo interrupt, not
really a SW property. By setting it in DT, makes it easier to
customize for target system, module param needs or ioctl makes it
dependent on userpsace to configure it.

The need for tasklet seems to arise from the fact that many bytes are
left in the fifo. If there's a common problem here, such tasklet would be
needed in i2c subsys rather than controller specific tweak, akin to
how networking uses NAPI or adding block transactions to the interface?

For master write-read event, it seems both IS_S_RD_EVENT_SHIFT and
IS_S_RX_EVENT_SHIFT are detected, which implies that core is late to
drain rx fifo i.e. write is complete and the read has started on the bus?


Thanks,
Dhananjay


