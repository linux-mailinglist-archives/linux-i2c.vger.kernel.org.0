Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC99E6B7408
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 11:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjCMKa0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 06:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjCMKaS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 06:30:18 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F7B49C2;
        Mon, 13 Mar 2023 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678703412; x=1710239412;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=V9Ltx44TzVADbinhfDkmzLH8nUcktDcB6CsUraacKNQ=;
  b=iVXNSuJJPz/3xrHOieBiqx4RPoAKE55RKRIuNU4LOMduZpHEgBrzZAIn
   mHAkNp3w8E8lEPrEbfX2iHXOpQYRjNkeSnmMA+dWwh1mdGhja2fe3qX5+
   peag6wtYFdrE7HrzJ/2c9uD02PcDJFS/NHGsLt0gH2oiBEtK4Z8f8xOFF
   fO2N97d65CU/fSfsZT65xkFC+PEbjQfg2CtQx5XqxfC9Ry5OHMnHH0O0M
   wU5ec4UZ8UVKbrClddq4UwGzoyXfmPfWW40xO7YpoI9IL1mP4aHd+Z3Qw
   D30dCrPpDzoWhjl7WGQB+1VN+J/SXqk7ng63Jw9JMB4cs5P6CEB5MwOit
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="316758999"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="316758999"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 03:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="924453427"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="924453427"
Received: from unknown (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga006.fm.intel.com with ESMTP; 13 Mar 2023 03:30:09 -0700
Message-ID: <c24b35f6-5bc5-7e24-ab63-499381f5b134@linux.intel.com>
Date:   Mon, 13 Mar 2023 12:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v4 6/8] i2c: designware: Use PCI PSP driver for
 communication
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com, herbert@gondor.apana.org.au,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Felix.Held@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230310211954.2490-1-mario.limonciello@amd.com>
 <20230310211954.2490-7-mario.limonciello@amd.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230310211954.2490-7-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/10/23 23:19, Mario Limonciello wrote:
> Currently the PSP semaphore communication base address is discovered
> by using an MSR that is not architecturally guaranteed for future
> platforms.  Also the mailbox that is utilized for communication with
> the PSP may have other consumers in the kernel, so it's better to
> make all communication go through a single driver.
> 
> Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v3->v4:
>   * Pick up tags
> v1->v2:
>   * Fix Kconfig to use imply
>   * Use IS_REACHABLE
> ---
>   drivers/i2c/busses/Kconfig                  |   2 +-
>   drivers/i2c/busses/i2c-designware-amdpsp.c  | 142 ++------------------
>   drivers/i2c/busses/i2c-designware-core.h    |   1 -
>   drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
>   include/linux/psp-platform-access.h         |   1 +
>   5 files changed, 11 insertions(+), 136 deletions(-)
> 
For the i2c-designware parts:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
