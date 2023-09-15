Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BAD87A1EFF
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Sep 2023 14:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234967AbjIOMoN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Sep 2023 08:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234986AbjIOMoM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Sep 2023 08:44:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993A1DD;
        Fri, 15 Sep 2023 05:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781846; x=1726317846;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UdF/yb3hDzUX34AS52kDXjTGovRQt8ow6ztwyihEg7s=;
  b=Quh+NLtKbBFx8/gUg5mEi+LGrW09rkejE03p/Nr8wHqOIe1IMRnuXjma
   0o8NxEW65bHIFzgiHHXckDisNAxjJ0odXO80eWiUIrAbWEVa9NmHgsSkb
   IP9FUwqme8Qa6iJ6hyN/DbFylmsm73QP8F5bFx39iEdtO0eu2LRA6Kpr3
   dpKH9nQbnGeSH1So5rKfPmYCU8AiUHwXoDNnHIEChl9ijRidAjTmiYKOS
   la4C2Lr5gOk/KT5z/S7PWNKAn5zL8ga084Uss5KhCKWv6S9BUkTvF+5jy
   NVjtjQpjEOol5x2u5azezVDaf/TwNJ/ote27Zyg8+i1XdaKnXsEV9oLqI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369555957"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="369555957"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 05:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="1075783226"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="1075783226"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2023 05:44:03 -0700
Message-ID: <a330da0f-e8f5-4703-872b-ae1037d7aed9@linux.intel.com>
Date:   Fri, 15 Sep 2023 15:44:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
To:     Jan Bottorff <janb@os.amperecomputing.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230913232938.420423-1-janb@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/14/23 02:29, Jan Bottorff wrote:
> Errors were happening in the ISR that looked like corrupted
> memory. This was because memory writes from the core enabling
> interrupts were not yet visible to the core running the ISR. The
> kernel log would get the message "i2c_designware APMC0D0F:00:
> controller timed out" during in-band IPMI SSIF stress tests.
> 
> Add a write barrier before enabling interrupts to assure data written
> by the current core is visible to all cores before the interrupt fires.
> 
> The ARM Barrier Litmus Tests and Cookbook has an example under
> Sending Interrupts and Barriers that matches the usage in this
> driver. That document says a DSB barrier is required.
> 
> Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Tested-by: Yann Sionneau <ysionneau@kalrayinc.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
