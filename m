Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2142AD64C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Nov 2020 13:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgKJMdr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Nov 2020 07:33:47 -0500
Received: from mga05.intel.com ([192.55.52.43]:4473 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728478AbgKJMdr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Nov 2020 07:33:47 -0500
IronPort-SDR: VP12WtQkAlrkz7JtQWyta2z4lkpSjLAxu+OQDXfjTkSwYgJTl0Detw9pQFdzsUN1xVjWg3jrpm
 U98jhhECPqDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="254673074"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="254673074"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 04:33:46 -0800
IronPort-SDR: 5VgMFXK1eKUN71n09RR62krilaaQACcguLziG1evT+VskxSeRsAYc3SAku+i2UzsAh2rFw3Q79
 ZggGdiz3rosg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="541307141"
Received: from mylly.fi.intel.com (HELO [10.237.72.73]) ([10.237.72.73])
  by orsmga005.jf.intel.com with ESMTP; 10 Nov 2020 04:33:44 -0800
Subject: Re: [PATCH v1] i2c: nvidia-gpu: drop empty stub for runtime pm
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Ajay Gupta <ajayg@nvidia.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20201107082151.58239-1-vaibhavgupta40@gmail.com>
 <20201107090442.GA107675@gmail.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <6989eb51-a36c-6e43-86f3-9b02ab490d95@linux.intel.com>
Date:   Tue, 10 Nov 2020 14:33:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201107090442.GA107675@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/7/20 11:04 AM, Vaibhav Gupta wrote:
> On Sat, Nov 07, 2020 at 01:51:51PM +0530, Vaibhav Gupta wrote:
>> After the commit c5eb1190074c ("PCI / PM: Allow runtime PM without callback
>> functions") we no more need empty stubs for runtime-pm to work.
>>
>> The driver has no device specific task(s) for .suspend() . The stub was
>> placed just for runtime-pm, which can be dropped now.
>>
>> Reported-by: Bjorn Helgaas <bhelgaas@google.com>
>> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
>> ---
>>   drivers/i2c/busses/i2c-nvidia-gpu.c | 10 +---------
>>   1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
>> index f9a69b109e5c..6b20601ffb13 100644
>> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
>> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
>> @@ -353,15 +353,7 @@ static void gpu_i2c_remove(struct pci_dev *pdev)
>>   	pci_free_irq_vectors(pdev);
>>   }
>>   
>> -/*
>> - * We need gpu_i2c_suspend() even if it is stub, for runtime pm to work
>> - * correctly. Without it, lspci shows runtime pm status as "D0" for the card.
>> - * Documentation/power/pci.rst also insists for driver to provide this.
>> - */
>> -static __maybe_unused int gpu_i2c_suspend(struct device *dev)
>> -{
>> -	return 0;
>> -}
>> +#define gpu_i2c_suspend NULL
>>   
Perhaps we can put NULL directly into UNIVERSAL_DEV_PM_OPS() for the 
suspend callback?

>>   static __maybe_unused int gpu_i2c_resume(struct device *dev)
>>   {
>> -- 
>> 2.28.0
>>
> The patch is only compile-tested.
> 
It should work also system suspend point of view. This patch affects 
also it since callbacks are set with the UNIVERSAL_DEV_PM_OPS(). Means 
the same callback is used for runtime PM and system suspend.

I quickly debugged this with an another driver and PCI stack does put 
the device into D3 state in system suspend from pci_prepare_to_sleep() 
if the suspend callback is not set and device was on prior it.

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
