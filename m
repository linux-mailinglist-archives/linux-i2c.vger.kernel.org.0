Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943846D1F80
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 13:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjCaLxo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 07:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjCaLxo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 07:53:44 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F8510C1;
        Fri, 31 Mar 2023 04:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680263622; x=1711799622;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TiD7kBj7hPUvnVmeWbsYTqnEqugIerIB3YPInRd7EuU=;
  b=Hdk2z7S5+YOfjDrqzd6kMDgEi6w8SzK0Ug9vbyUq4Gp3bshVodU31IjL
   OY5oVDsTiUhb2JZoDbYWRdqOodO4pNJOk4jupvfOzAQ2UQWP3cT6Lek+P
   a7zGSs06lldplWXHHSGRS1qFAEaBKQwHzk0EOyXxuHpFizz/o0c9CCuda
   DxXSykIKDveerMiRWSRNPu8DH8d/zIv3SxNv2GbjOwJqA1Xg0DYlo70rY
   bGZ4TzQiSvbeRv5AteasiVFfdsDcfA6ctmvzMAdHIGjc3GXyXGD/WlNLy
   mQDDD/E+Gpfc9Bf6IY2YfBTds96M1k+DQSUwWg7W1VIETtIi7TKzKidkY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="325398821"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="325398821"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 04:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="828681733"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="828681733"
Received: from unknown (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2023 04:53:39 -0700
Message-ID: <c298b247-1bdc-340c-ad7d-df3653cc9027@linux.intel.com>
Date:   Fri, 31 Mar 2023 14:53:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH v7 5/6] i2c: designware: Use PCI PSP driver for
 communication
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Felix Held <Felix.Held@amd.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230329220753.7741-1-mario.limonciello@amd.com>
 <20230329220753.7741-6-mario.limonciello@amd.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230329220753.7741-6-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/30/23 01:07, Mario Limonciello wrote:
> Currently the PSP semaphore communication base address is discovered
> by using an MSR that is not architecturally guaranteed for future
> platforms.  Also the mailbox that is utilized for communication with
> the PSP may have other consumers in the kernel, so it's better to
> make all communication go through a single driver.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v6->v7:
>   * Also imply CRYPTO_DEV_CCP_DD to fix build errors
>   * Fix error message acquire/release inversion
> v5->v6:
>   * Drop now unnecessary asm/msr.h header
>   * Fix IS_REACHABLE
>   * Drop tags
>   * Fix status code handling for Cezanne
> v4->v5:
>   * Pick up tags
> v3->v4:
>   * Pick up tags
> v1->v2:
>   * Fix Kconfig to use imply
>   * Use IS_REACHABLE
> ---
>   drivers/i2c/busses/Kconfig                  |   3 +-
>   drivers/i2c/busses/i2c-designware-amdpsp.c  | 177 +++-----------------
>   drivers/i2c/busses/i2c-designware-core.h    |   1 -
>   drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
>   include/linux/psp-platform-access.h         |   1 +
>   5 files changed, 29 insertions(+), 154 deletions(-)
> 
One note below in case there is a need to have another version of if you 
want. Not a show stopper for this.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

> @@ -214,7 +95,7 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
>   	if (ret) {
>   		dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
>   			(i2c_req_type == PSP_I2C_REQ_ACQUIRE) ?
> -			"release" : "acquire");
> +			"acquire" : "release");
>   		goto cleanup;
>   	}
>   
This looks like worth of being an own patch. Maybe even for the 
linux-stable. I think it's very useful to have an error message to show 
correct information what operation actually failed.
