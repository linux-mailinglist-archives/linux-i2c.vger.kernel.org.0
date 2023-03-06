Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E5F6ABF73
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 13:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjCFM2O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 07:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjCFM2N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 07:28:13 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67CB18B38;
        Mon,  6 Mar 2023 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678105689; x=1709641689;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AqPeYtYY5t6rS02NYOXBZmKis/Hfv+UygTLYEwX23Jk=;
  b=DGqV3d5d6n48NhPx8bycPlvuwgwrUAVNWXhP1I8zlK/J5cEQ7ZLXaPdM
   cAai5MfrUG9p4CSJFhvLtpxNkyeGNgk+NyaQaDxRUcXmh30lrH4T4wPDK
   R3ipcpbhFrLykPVgA2DaHSrMnFZpb1x7WuVAUVeKtrdpVsS1QnggRC7ZB
   zxKZUmjMVgjPIa6DPZGyfFamm0cDDgnMeEFZemzjhXZJ84RIO2mXJF//T
   VfnyPTPaeUzdhUlGDgbGN+bYELHEd7aTpcKuJtnySLSJzsNFyIDoV8ZW9
   qiEU1Hzd1jXiI0M4t55paJrHC/UepS8R/Mkg+coDbLk04NjP2OdV/nhGi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="421811973"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="421811973"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 04:28:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="850279113"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="850279113"
Received: from unknown (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga005.jf.intel.com with ESMTP; 06 Mar 2023 04:28:06 -0800
Message-ID: <0a872110-3f38-0744-17f1-74de3e78f84d@linux.intel.com>
Date:   Mon, 6 Mar 2023 14:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v3 9/9] i2c: designware: Add support for AMDI0020 ACPI ID
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com, herbert@gondor.apana.org.au,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230303165050.2918-1-mario.limonciello@amd.com>
 <20230303165050.2918-10-mario.limonciello@amd.com>
 <ZAXWzMFBjo57UUa+@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZAXWzMFBjo57UUa+@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/6/23 14:04, Andy Shevchenko wrote:
> On Fri, Mar 03, 2023 at 10:50:47AM -0600, Mario Limonciello wrote:
>> Cezanne and Skyrim have the same PSP hardware but use a different
>> protocol to negotiate I2C arbitration. To disambiguate this going
>> forward introduce a new ACPI ID to represent the protocol that utilizes
>> a doorbell.
> 
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v2->v3:
>>   * Split from earlier patch to standalone
>> ---
>>   drivers/i2c/busses/i2c-designware-amdpsp.c  | 5 +++--
>>   drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
>> index 2c671973010d..44b8432458b0 100644
>> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
>> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
>> @@ -101,11 +101,12 @@ static int psp_send_i2c_req_amdi0019(enum psp_i2c_req_type i2c_req_type)
>>   
>>   static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
>>   {
>> +	const char *hid = acpi_device_hid(ACPI_COMPANION(psp_i2c_dev));
>>   	unsigned long start = jiffies;
>>   	int ret;
>>   
>> -	/* Use doorbell for Skyrim and mailbox for Cezanne */
>> -	if (boot_cpu_data.x86 == 25 && boot_cpu_data.x86_model == 80)
> 
> Ah, in this form it's getting better than I thought!
> 
These removed lines were added by previous patch. I think a bit too 
short lived if the same patchset adds and then removes lines?
