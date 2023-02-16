Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4186995BD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 14:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjBPN1a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 08:27:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjBPN13 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 08:27:29 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41AF3C78A;
        Thu, 16 Feb 2023 05:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676554049; x=1708090049;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CEM0w1UDoLyzR0b0tmmtouGGH6aqxvMrAbjlA9AnySA=;
  b=iJfs44Ye4o+O8VUdW5fIpfQBthmqpePGTYW0v0UwCoY+V1qFL3UvcEmb
   72wCgFNpQ23CfrefdbPYrD5xuKeQAnCYUw1410QowJQtlEKSJAVHIIkDv
   rMgTErmJA64eVkh8O+sGeo6nEWxTSNg1kz2HoZ4RbnxYDdLTpRWsSxR3Z
   rrSWjbRCg1uy0BqCYPnY45FGHkkFWWZLOIdpNSiP0llqpcoyMKB0ve83M
   LAm7i+ga4jz5PBHZm9uFb/QDJ1DeJXdUoHK6fKgCLQyXjpv4Yh/lhOn85
   LWAM593Z5Qr4+SnbSy38G6JnYBT/KqOaaJ6HI0BigGog7CW9AtbTbLYUw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329434353"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="329434353"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 05:27:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663453310"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="663453310"
Received: from mylly.fi.intel.com (HELO [10.237.72.67]) ([10.237.72.67])
  by orsmga007.jf.intel.com with ESMTP; 16 Feb 2023 05:27:24 -0800
Message-ID: <703033aa-1293-307d-42a2-9734a51c7190@linux.intel.com>
Date:   Thu, 16 Feb 2023 15:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.2
Subject: Re: [PATCH 6/6] i2c: designware: Use PCI PSP driver for communication
To:     Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        Lendacky Thomas <Thomas.Lendacky@amd.com>,
        herbert@gondor.apana.org.au,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-7-mario.limonciello@amd.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230209223811.4993-7-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/10/23 00:38, Mario Limonciello wrote:
> Currently the PSP semaphore communication base address is discovered
> by using an MSR that is not architecturally guaranteed for future
> platforms.  Also the mailbox that is utilized for communication with
> the PSP may have other consumers in the kernel, so it's better to
> make all communication go through a single driver.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/i2c/busses/Kconfig                  |   2 +-
>   drivers/i2c/busses/i2c-designware-amdpsp.c  | 141 +-------------------
>   drivers/i2c/busses/i2c-designware-core.h    |   1 -
>   drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
>   include/linux/psp-platform-access.h         |   1 +
>   5 files changed, 9 insertions(+), 137 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a7bfddf08fa7b..9e2202ca73ec7 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -566,9 +566,9 @@ config I2C_DESIGNWARE_PLATFORM
>   
>   config I2C_DESIGNWARE_AMDPSP
>   	bool "AMD PSP I2C semaphore support"
> -	depends on X86_MSR
>   	depends on ACPI
>   	depends on I2C_DESIGNWARE_PLATFORM
> +	depends on CRYPTO_DEV_SP_PSP && !(I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=m)
>   	help

Would this look better if split? I.e.

	depends on CRYPTO_DEV_SP_PSP
	depends on !(I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=m)

