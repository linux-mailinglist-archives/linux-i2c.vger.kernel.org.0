Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 760975F093B
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Sep 2022 12:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbiI3Kkk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Sep 2022 06:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbiI3Kjo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Sep 2022 06:39:44 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655B23B72F;
        Fri, 30 Sep 2022 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664533674; x=1696069674;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EP5doUZ0csuXDH2IUug3FhPuvB54lOBAGBqzqRXVRdg=;
  b=MQFuCyJDmqSi7v2yeQ4ZWvUtEs6Rd3GyuP8fHFhJxjO50DYuZYlPfFD8
   l18mAe6u08CMsQPAM3FTe/eCfuuoVrYWNU9HiWk3swpYJHHAIXltitbEN
   Zer15hghp6pQ6MlQoOyA7BGL5WsuMe85P9vaZZcF88/3Hp6H7JqkLweWi
   lN8fEca7KJMtO1JMCnlf4ViHAqojeJCb9MrTszuY+MYGtrNwCkLdjvO/a
   FuXdM1btXHRnv4zzsqRWIgHA97WApPJPHQWIyw+fG5VontlkVNNDRuNXj
   OaCyIrJn+Q3XlamOeC/8DTw/YxjFOgrvsLyda3FOosVNQ0nJ+s6SSAmno
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="302132527"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="302132527"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 03:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="685238614"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="685238614"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga008.fm.intel.com with ESMTP; 30 Sep 2022 03:26:56 -0700
Message-ID: <1ee061f4-8388-4a35-e14e-853482d5fc0a@linux.intel.com>
Date:   Fri, 30 Sep 2022 13:26:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH] i2c: i801: Prefer async probe
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>, Mani Milani <mani@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-i2c@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20220826074430.1333272-1-mani@chromium.org>
 <20220929174334.44d3e6d9@endymion.delvare>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220929174334.44d3e6d9@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/29/22 18:43, Jean Delvare wrote:
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index a176296f4fff..e06509edc5f3 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1838,6 +1838,7 @@ static struct pci_driver i801_driver = {
>>   	.shutdown	= i801_shutdown,
>>   	.driver		= {
>>   		.pm	= &i801_pm_ops,
>> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>>   	},
>>   };
>>   
> 
> Seems reasonable. I can't foresee any problem that would occur from
> this change, and preliminary testing on my own workstation is OK.
> 
> Jarkko, Heiner, Wolfram, can you think of any reason why we should NOT
> apply this change?
> 
I tested this on two systems. One with EE1004-compliant SPD EEPROM and 
another with touchpad connected to RMI4 SMB bus.

Average boot time improved ~20 ms over 5 boots on the first system and 
did not see any issue with the touchpad on second.

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

