Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011FB294C78
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Oct 2020 14:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411745AbgJUMWQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Oct 2020 08:22:16 -0400
Received: from mga04.intel.com ([192.55.52.120]:55895 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2411742AbgJUMWQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 21 Oct 2020 08:22:16 -0400
IronPort-SDR: hIgNyzk5qcqGVxtpeTCUxnFQ3QWoYszF1e6qPsnM+zXQtB25HXIwSR4inaBv2t2SlapIBAk+wG
 khWJlUrcAG8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="164750061"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="164750061"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 05:22:15 -0700
IronPort-SDR: +2UvfjcawuPd1uZWUtuBUisgOC99+F3y4cNfUQJkidaaJgIvR5wnJ41I7NrSIAG8o4QBL660sr
 LIlEwKAPb5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="332567763"
Received: from mylly.fi.intel.com (HELO [10.237.72.187]) ([10.237.72.187])
  by orsmga002.jf.intel.com with ESMTP; 21 Oct 2020 05:22:14 -0700
Subject: Re: [PATCH] i2c: designware: call i2c_dw_read_clear_intrbits_slave()
 once
To:     Michael Wu <michael.wu@vatics.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Morgan Chang <morgan.chang@vatics.com>
References: <20201020083310.7489-1-michael.wu@vatics.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <02c0362d-cf4b-090a-3fc2-40039eba2cbd@linux.intel.com>
Date:   Wed, 21 Oct 2020 15:22:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201020083310.7489-1-michael.wu@vatics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 10/20/20 11:33 AM, Michael Wu wrote:
> i2c_dw_read_clear_intrbits_slave() was called per each interrupt handle.
> It caused some interrupt bits which haven't been handled yet were cleared,
> the corresponding handlers would do nothing due to interrupt bits been
> discarded. For example,
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
> The root cause is that i2c_dw_read_clear_intrbits_slave() was called many
> times. Calling i2c_dw_read_clear_intrbits_slave() once in one ISR and take
> the returned stat for later handling is the solution.
> 
> Signed-off-by: Michael Wu <michael.wu@vatics.com>
> ---
>   drivers/i2c/busses/i2c-designware-slave.c | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> index 44974b53a626..02e7c5171827 100644
> --- a/drivers/i2c/busses/i2c-designware-slave.c
> +++ b/drivers/i2c/busses/i2c-designware-slave.c
> @@ -159,7 +159,6 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
>   	u32 raw_stat, stat, enabled, tmp;
>   	u8 val = 0, slave_activity;
>   
> -	regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
>   	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
>   	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_stat);
>   	regmap_read(dev->map, DW_IC_STATUS, &tmp);
> @@ -168,13 +167,11 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
>   	if (!enabled || !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
>   		return 0;
>   
> +	stat = i2c_dw_read_clear_intrbits_slave(dev);
>   	dev_dbg(dev->dev,
>   		"%#x STATUS SLAVE_ACTIVITY=%#x : RAW_INTR_STAT=%#x : INTR_STAT=%#x\n",
>   		enabled, slave_activity, raw_stat, stat);
>   
> -	if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET))
> -		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
> -

...

> +
> +	if ((stat & DW_IC_INTR_RX_FULL) && (stat & DW_IC_INTR_STOP_DET))
> +		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED, &val);

Was this move a leftover that got committed by accident? I think it's 
better to have this logic change in another patch. Or was it even 
questionable to move the I2C_SLAVE_WRITE_REQUESTED reporting after all 
other?

Jarkko
