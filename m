Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C05D43CAB3
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Oct 2021 15:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236225AbhJ0NeU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Oct 2021 09:34:20 -0400
Received: from mga04.intel.com ([192.55.52.120]:27487 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233685AbhJ0NeT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 Oct 2021 09:34:19 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="228910567"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; 
   d="scan'208";a="228910567"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 06:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; 
   d="scan'208";a="555351913"
Received: from mylly.fi.intel.com (HELO [10.237.72.56]) ([10.237.72.56])
  by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2021 06:31:51 -0700
Subject: Re: [PATCH] i2c: i801: Fix interrupt storm from SMB_ALERT signal
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ck+kernelbugzilla@bl4ckb0x.de, stephane.poignant@protonmail.com
References: <20211019141700.764413-1-jarkko.nikula@linux.intel.com>
 <20211026232815.513362d6@endymion>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <4d4a7699-456c-3f9c-0558-a6a6dcd4c940@linux.intel.com>
Date:   Wed, 27 Oct 2021 16:31:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211026232815.513362d6@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/27/21 12:28 AM, Jean Delvare wrote:
> Hi Jarkko,
> 
> On Tue, 19 Oct 2021 17:17:00 +0300, Jarkko Nikula wrote:
>> Currently interrupt storm will occur from i2-i801 after first transaction
> 
> Typo: i2c-i801.
> 
Will fix.

>> Hi Conrad and Stephane. This patch is otherwise the same than the one I
>> had in bugzilla but this adds also acknowledging for the SMB_ALERT
>> interrupt. There is short time window during driver load and unload
>> where interrupt storm will still occur if signal was asserted. Also
> 
> The storm only starts with the first transaction, loading the driver
> does not start it, so I can't see the window at load time.
> 
> For driver unload time, maybe we should restore SMBHSTCNT_INTREN to
> its original value at that time, to prevent an interrupt storm from
> happening. If we don't, then I suspect we'll have a storm not only for
> a short time window but actually forever.
> 
I had to hack and retest how I got that load and unload time interrupts 
but managed to do it with a code that doesn't acknowledge SMB_ALERT. It 
wasn't actually straight after boot but hacking with rmmod/modprobe, 
transactions and SMB_ALERT during runtime. Here in simplest form:

0. Boot
1. Do transaction and get the SMBHSTCNT_INTREN enabled
2. SMB_ALERT or rmmod
    - if SMB_ALERT first, then interrupts during this unload
    - if rmmod first, then interrupts during next unload
3. modprobe
    - SMBHSTCNT_INTREN already set
    -> PCI_STATUS_INTERRUPT set, "An interrupt is pending!" followed by 
interrupts between devm_request_irq and i801_enable_host_notify where 
SMB_ALERT disabled by the code change.

>> -	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS;
>> -	if (status) {
>> +	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
>> +	if (status)
>>   		outb_p(status, SMBHSTSTS(priv));
> 
> Might be worth a comment.
> 
...
>> -	if (!(SMBSLVCMD_HST_NTFY_INTREN & priv->original_slvcmd))
>> -		outb_p(SMBSLVCMD_HST_NTFY_INTREN | priv->original_slvcmd,
>> -		       SMBSLVCMD(priv));
>> +	/* Enable host notify interrupt and disable SMB_ALERT signal */
>> +	outb_p(SMBSLVCMD_HST_NTFY_INTREN | SMBSLVCMD_SMBALERT_DISABLE |
>> +	       priv->original_slvcmd, SMBSLVCMD(priv));
> 
> A more verbose comment would be welcome too. Right now we know why we
> are doing that, but in a few years we won't remember.
> 
Agree to both, will update.

>>   
>>   	/* clear Host Notify bit to allow a new notification */
>>   	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
> 
> Tested-by: Jean Delvare <jdelvare@suse.de>
> 
> (But my system was not affected by the issue in the first place, so
> it's only a non-regression test.)
> 
I was fortunate to find a reference design in our lab where SMB_ALERT 
wasn't connected anywhere else than a pull-up and was able to 
relatively safely pull it down by a grounded wire. Just have to be 
careful to not touch anything else with the wire :-)

Jarkko
