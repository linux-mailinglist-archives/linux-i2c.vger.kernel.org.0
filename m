Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6C128DF42
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 12:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730374AbgJNKnn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 06:43:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:12859 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730147AbgJNKnn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Oct 2020 06:43:43 -0400
IronPort-SDR: enc/vszMvt6+FN2C7aLOl7XMIubdZpwMuKrDZVq/0nZyXkG9OhrJME51fZpnvP2/xJTylYRR87
 g4IrRXCSWLiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="145391576"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="145391576"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 03:43:42 -0700
IronPort-SDR: 8wIME1GlY3GPDFzvauGIUIdcoh5YgtGDiqR8RW3Luq2f7r7X2NhaKLNT2UGDS/gTXPLrfwZvpo
 jYy6j5RFRRHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="357340046"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2020 03:43:40 -0700
Subject: Re: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
To:     Michael Wu <michael.wu@vatics.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Morgan Chang <morgan.chang@vatics.com>,
        Dean Hsiao <dean.hsiao@vatics.com>,
        Paul Chen <paul.chen@vatics.com>
References: <20201014052532.3298-1-michael.wu@vatics.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <f4ae83cc-b366-71a8-d174-0bb668dc1992@linux.intel.com>
Date:   Wed, 14 Oct 2020 13:43:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201014052532.3298-1-michael.wu@vatics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 10/14/20 8:25 AM, Michael Wu wrote:
> When an I2C slave works, sometimes both IC_INTR_RX_FULL and
> IC_INTR_STOP_DET are rising during an IRQ handle, especially when system
> is busy or too late to handle interrupts.
> 
> If IC_INTR_RX_FULL is rising and the system doesn't handle immediately,
> IC_INTR_STOP_DET may be rising and the system has to handle these two
> events. For this there may be two problems:
> e
> 1. IC_INTR_STOP_DET is rising after i2c_dw_read_clear_intrbits_slave()
>     done: It seems invalidated because WRITE_REQUESTED is done after the
>     1st WRITE_RECEIVED.
> 
> $ i2cset -f -y 2 0x42 0x00 0x41; dmesg -c
> [0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
> [1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
> WRITE_RECEIVED
> [0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
> [1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
> WRITE_REQUESTED
> WRITE_RECEIVED
> [0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x710 : INTR_STAT=0x200
> [1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x510 : INTR_STAT=0x0
> STOP
> [2][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x510 : INTR_STAT=0x0
> 
>    t1: ISR with the 1st IC_INTR_RX_FULL.
>    t2: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave().
>    t3: Enter i2c_dw_irq_handler_slave() and then do
>        i2c_slave_event(WRITE_RECEIVED) because
>        if (stat & DW_IC_INTR_RX_FULL).
>    t4: ISR with the 2nd IC_INTR_RX_FULL.
>    t5: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave(),
>        while IC_INTR_STOP_DET has not risen yet.
>    t6: Enter i2c_dw_irq_handler_slave() and then IC_INTR_STOP_DET is
>        rising. i2c_slave_event(WRITE_REQUESTED) will be done first because
>        if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET)) and
>        then doing i2c_slave_event(WRITE_RECEIVED).
>    t7: do i2c_slave_event(STOP) due to IC_INTR_STOP_DET not be cleared yet.
> 
> 2. Both IC_INTR_STOP_DET and IC_INTR_RX_FULL are rising before
>     i2c_dw_read_clear_intrbits_slave(): STOP cannot wait because
>     IC_INTR_STOP_DET is cleared by i2c_dw_read_clear_intrbits_slave().
> 
> $ i2cset -f -y 2 0x42 0x00 0x41; dmesg -c
> [0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
> [1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
> WRITE_RECEIVED
> [0][clear_intrbits]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
> [1][irq_handler   ]0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
> WRITE_RECEIVED
> 
>    t1: ISR with the 1st IC_INTR_RX_FULL.
>    t2: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave().
>    t3: Enter i2c_dw_irq_handler_slave() and then do
>        i2c_slave_event(WRITE_RECEIVED) because
>        if (stat & DW_IC_INTR_RX_FULL).
>    t4: ISR with both IC_INTR_STOP_DET and the 2nd IC_INTR_RX_FULL.
>    t5: Clear listed IC_INTR bits by i2c_dw_read_clear_intrbits_slave(). The
>        current IC_INTR_STOP_DET is cleared by this
>        i2c_dw_read_clear_intrbits_slave().
>    t6: Enter i2c_dw_irq_handler_slave() and then do
>        i2c_slave_event(WRITE_RECEIVED) because
>        if (stat & DW_IC_INTR_RX_FULL).
>    t7: i2c_slave_event(STOP) never be done because IC_INTR_STOP_DET was
>        cleared in t5.
> 
> In order to resolve these problems, i2c_dw_read_clear_intrbits_slave()
> should be called only one time in ISR and take the returned stat to handle
> those occurred events.
> 
> Signed-off-by: Michael Wu <michael.wu@vatics.com>
> ---
>   drivers/i2c/busses/i2c-designware-slave.c | 79 ++++++++++++-----------
>   1 file changed, 40 insertions(+), 39 deletions(-)
> 
Thanks for the patch. I was thinking this too after your report but 
haven't found actually time to look at implementing it.

But what I was thinking it is probably good to have two patches. First 
patch that changes only i2c_dw_read_clear_intrbits_slave() semantics so 
that it's called only once like here and second patch that does other 
logic changes. Makes easier to catch possible regressions I think.

Jarkko

