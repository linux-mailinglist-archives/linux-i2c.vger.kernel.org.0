Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CCE44D873
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 15:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhKKOmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 09:42:21 -0500
Received: from mga17.intel.com ([192.55.52.151]:21173 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230177AbhKKOmU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Nov 2021 09:42:20 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="213645932"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="213645932"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 06:39:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="733196349"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by fmsmga006.fm.intel.com with ESMTP; 11 Nov 2021 06:39:28 -0800
Subject: Re: [PATCH v3] i2c: i801: Fix interrupt storm from SMB_ALERT signal
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>, ck+kernelbugzilla@bl4ckb0x.de,
        stephane.poignant@protonmail.com
References: <20211110141032.2429745-1-jarkko.nikula@linux.intel.com>
 <YYv+YdRWzU9HzEY8@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <71a5c6d4-4ae8-2c54-78e7-94a37b43a986@linux.intel.com>
Date:   Thu, 11 Nov 2021 16:39:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYv+YdRWzU9HzEY8@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 11/10/21 7:16 PM, Andy Shevchenko wrote:
> On Wed, Nov 10, 2021 at 04:10:32PM +0200, Jarkko Nikula wrote:
>>   	/*
>> -	 * Clear irq sources and report transaction result.
>> +	 * Clear remaining irq sources: Completion of last command, errors
> 
> irq --> IRQ
> of last --> of the last
> 
Ah, worth of changing while changing the line.

>> +	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
>> +	 * assertion independently is the interrupt generation blocked or not
> 
> is --> if ?
> 
hmm, I don't know which one is correct or neither. Or should it be 
something like "independently of whether the interrupt generation is 
blocked or not"? Grammar polices, please help me :-)

>> @@ -975,9 +984,13 @@ static void i801_enable_host_notify(struct i2c_adapter *adapter)
>>   	if (!(priv->features & FEATURE_HOST_NOTIFY))
>>   		return;
>>   
>> -	if (!(SMBSLVCMD_HST_NTFY_INTREN & priv->original_slvcmd))
>> -		outb_p(SMBSLVCMD_HST_NTFY_INTREN | priv->original_slvcmd,
>> -		       SMBSLVCMD(priv));
>> +	/*
>> +	 * Enable host notify interrupt and block the generation of interrupt
>> +	 * from the SMB_ALERT signal because the driver does not support
>> +	 * SMBus Alert yet.
> 
> does not support ... yet -->
>    has not supported ... yet
>    does not support
> 
> ?
yeah, yet is speculative, perhaps better to drop.

Jarkko
