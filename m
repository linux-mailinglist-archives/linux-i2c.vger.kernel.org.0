Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE7458D892
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Aug 2022 14:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237277AbiHIMFJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Aug 2022 08:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236564AbiHIMFI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Aug 2022 08:05:08 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34A51EEC3;
        Tue,  9 Aug 2022 05:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660046704; x=1691582704;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rIJtg6N3ukhnUG2gqKWmREiUxHfYT175zglEAUmnV9E=;
  b=AH7ui4fF4hCupigWHipG7d3CSEb5mbTh6SWBddTm2f9W+Tw8uX73YJ4w
   P4/M8PrJ5guQOcY5iM1u9/UIxx/KkHuVmy0dQ6fi/Jlabq/YuiQv0jDiW
   aQWPccRK6PN/RriletX0Dmb8D+paUYYSEyGIYNUA4WYG8tcFkl4Za0U5n
   Dnt2i7j3bv9ezUXhIaGl8PkE6F1pLqGevQO8Oi9iUXYsCK85DkmNeLvNj
   hMB2b+m8DeewU0MdETmb/3JUDfM8lnzkqSn68VsvLtn+cPkFqPF5RjlU+
   t8UkUjcyHL3BbZkZwXw6D0KJ+ambputnA1NrCxU4o7F+dp46JmWIuvFmF
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="291603911"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="291603911"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 05:05:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="633300813"
Received: from mylly.fi.intel.com (HELO [10.237.72.177]) ([10.237.72.177])
  by orsmga008.jf.intel.com with ESMTP; 09 Aug 2022 05:05:01 -0700
Message-ID: <d2be49af-71e4-978b-fe00-8b8fca6f80b5@linux.intel.com>
Date:   Tue, 9 Aug 2022 15:05:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] i2c: designware: Introduce cooldown timer to AMDPSP
 driver
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, mw@semihalf.com, upstream@semihalf.com
References: <20220725080240.106619-1-jsd@semihalf.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220725080240.106619-1-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

Sorry the delay, this slipped through my eyes during vacation. Couple 
minor comments below.

On 7/25/22 11:02, Jan Dabros wrote:
> In order to optimize performance, limit amount of back and forth
> transactions between x86 and PSP. This is done by introduction of
> cooldown period - that is window in which x86 isn't releasing the bus
> immediately after each I2C transaction.
> 
> In order to protect PSP from being starved while waiting for
> arbitration, after a programmed time bus is automatically released by a
> deferred function.
> 
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> ---
>   drivers/i2c/busses/i2c-designware-amdpsp.c | 68 +++++++++++++++++-----
>   1 file changed, 53 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> index b624356c945f..2e1bb5ae72c3 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -6,6 +6,7 @@
>   #include <linux/io-64-nonatomic-lo-hi.h>
>   #include <linux/psp-sev.h>
>   #include <linux/types.h>
> +#include <linux/workqueue.h>
>   
>   #include <asm/msr.h>
>   
> @@ -15,6 +16,8 @@
>   #define PSP_MBOX_OFFSET		0x10570
>   #define PSP_CMD_TIMEOUT_US	(500 * USEC_PER_MSEC)
>   
> +#define PSP_I2C_COOLDOWN_TIME_MS 100
> +

"cooldown" distract me thinking thermal management. Would semaphore 
reservation time/timer fit better?

> +static void release_bus_now(void)
> +static void psp_release_i2c_bus_deferred(struct work_struct *work)
> +static DECLARE_DELAYED_WORK(release_queue, psp_release_i2c_bus_deferred);
> +

I'd use the same namespace here. Perhaps _now can be dropped from the 
name since the release_bus and release_bus_deferred are near to each 
other and _deferred variant implies it's called after timeout.

> +	/*
> +	 * Send a release command to PSP if the cooldown timeout elapsed but x86 still
> +	 * owns the ctrlr.
> +	 */

Replace "ctrlr" -> "control" here since then it doesn't lead to think 
is't some technical object like register etc.
