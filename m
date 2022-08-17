Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55FF0596D4F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Aug 2022 13:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236106AbiHQLBl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Aug 2022 07:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235718AbiHQLBk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Aug 2022 07:01:40 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E62140BE
        for <linux-i2c@vger.kernel.org>; Wed, 17 Aug 2022 04:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660734098; x=1692270098;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=s/qBO60uILrz04kO2Fx/TlpzTX3I7GcVgnGIpvhHvvI=;
  b=HH3/BKQlbQijfaZIXfnNTRK/iDsvK8virYV4z/eA3o6t1EMY1eMeNB63
   f8kJsbq413E+CPxcHtuySIBdQHZtzaWkgEjAuLPyJL3TakNMZkSZnteXi
   z1yl3obc9cqUjN4rHsCmeA2+b/yVLl2j0TnY2wVOk+KebvJya9h/4NoX/
   5e+nVJn5BnfOqveghQPFjMK/enODpBlGK53rCq/wOUaZTXbJNGsD15pZF
   jGmCK4O2M4kjMTbqjJ+Wtaf1FWhbgIIizNUBrNW4BNttpHVYjIpUXBsS7
   Ye+uCkaN+I9wthb2mD7lk+IYEIvwVSQ0KLFIb2otbmo/8KG6y/8OEMtzp
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="318472070"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="318472070"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 04:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="667569220"
Received: from mylly.fi.intel.com (HELO [10.237.72.177]) ([10.237.72.177])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2022 04:01:36 -0700
Message-ID: <b7d50ba0-2e77-707c-19ca-d0c74cea5960@linux.intel.com>
Date:   Wed, 17 Aug 2022 14:01:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.1.1
Subject: Re: [PATCH] i2c: designware: fix direct modify risk in xfer
To:     wolfgang9277@126.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, p.zabel@pengutronix.de, linux-i2c@vger.kernel.org
References: <20220816025111.3702045-1-wolfgang9277@126.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220816025111.3702045-1-wolfgang9277@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 8/16/22 05:51, wolfgang9277@126.com wrote:
> From: wolfgang huang <huangjinhui@kylinos.com>
> 
> bind two or more slave devices to master device.

What does this sentence mean?

> while master device is process reading, dev->msgs
> used as a buffer to process the read data,
> while the other device uses i2c_dw_xfer to read/write,
> this will directly change dev->msgs, causing the
> first device reading process to crash or other confusion.
> 
> so we should to check the device status before modifying
> dev->msgs and others.
> 
> [ 1244.815334]  i2c_dw_isr+0x2c8/0x5e0
> [ 1244.819238]  __handle_irq_event_percpu+0x5c/0x168
> [ 1244.824350]  handle_irq_event_percpu+0x1c/0x58
> [ 1244.829201]  handle_irq_event+0x40/0xa0
> [ 1244.833449]  handle_fasteoi_irq+0xcc/0x1b0
> [ 1244.837956]  generic_handle_irq+0x24/0x38
> [ 1244.842376]  __handle_domain_irq+0x5c/0xb8
> [ 1244.846883]  gic_handle_irq+0x94/0x1c8
> [ 1244.851043]  el1_irq+0xb8/0x140
> [ 1244.854599]  arch_cpu_idle+0x10/0x18
> [ 1244.858588]  do_idle+0x19c/0x260
> [ 1244.862231]  cpu_startup_entry+0x20/0x28
> 
I would like to understand this more. Like is the bus not busy wait move 
enough or if it's just masking the issue away.

Are you able to share what kind of setup you have and do you know how to 
trigger this or does it occur randomly during run?

> Signed-off-by: wolfgang huang <huangjinhui@kylinos.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 44a94b225ed8..07f7d5e2d12d 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -557,6 +557,14 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>   
>   	pm_runtime_get_sync(dev->dev);
>   
> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		goto done_nolock;
> +
> +	ret = i2c_dw_wait_bus_not_busy(dev);
> +	if (ret)
> +		goto done;
> +
>   	/*
>   	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
>   	 * As it is polling based transfer mechanism, which does not support

Here a few lines below the lock is never released in case of 
MODEL_AMD_NAVI_GPU since code goes to "done_nolock" after returning from 
amd_i2c_dw_xfer_quirk().

Jarkko
