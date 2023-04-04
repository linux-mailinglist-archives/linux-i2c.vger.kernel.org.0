Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42FBB6D59A2
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Apr 2023 09:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbjDDHax (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Apr 2023 03:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233962AbjDDHah (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Apr 2023 03:30:37 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AD23AB4
        for <linux-i2c@vger.kernel.org>; Tue,  4 Apr 2023 00:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680593426; x=1712129426;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xbGovW3XUbccCHcDL7wSshsqhpI0jwqYcl/EeuZka8U=;
  b=hlJuin6bTtvFDwzwmhsOtWZwbnsCh7vCAG6oNqhagrBOeJKCZ2l3t/Sa
   uxcKyKoKA/ublgY4x1j/6/dUc/C8e1Dhr6g83v/u527pPp3saAuo02Kxn
   R6D8iTY8wYy5OtDdaC8xp5dogSycTVMysZ2zvId/yjz0vvEco1GFyZznA
   OeZB5/OdkOj4milk64Me6l0Aj/BkR6OxY0buSO8PtFhmoY6dyMHOtsHOM
   mAjO5atUdbSupVWmONzzftKr69/QSuR+X65IKB4oiNfj31XcVGgeKZcjc
   oWb2AeEKMC120V5ZaUHojynjr106p849ivW4NIyaShVsJGGI2HqogchGI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322507316"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="322507316"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 00:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="775541456"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="775541456"
Received: from unknown (HELO [10.237.72.51]) ([10.237.72.51])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Apr 2023 00:30:25 -0700
Message-ID: <43382258-cd1f-d7c8-2cc7-1869a49e3d10@linux.intel.com>
Date:   Tue, 4 Apr 2023 10:30:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] i2c: i801: Add support for Intel Meteor Lake-S SoC
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20230330105502.4100351-1-jarkko.nikula@linux.intel.com>
 <20230403173426.2cc3af2a@endymion.delvare>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230403173426.2cc3af2a@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/3/23 18:34, Jean Delvare wrote:
> Hi Jarkko,
> 
> On Thu, 30 Mar 2023 13:55:01 +0300, Jarkko Nikula wrote:
>> Add SMBus PCI ID on Intel Meteor Lake-S SoC South.
>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   drivers/i2c/busses/i2c-i801.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index ac5326747c51..8172e2767b25 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -77,6 +77,7 @@
>>    * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
>>    * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
>>    * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
>> + * Meteor Lake-S (SOC)		0xae22	32	hard	yes	yes	yes
>>    *
>>    * Features supported by this driver:
>>    * Software PEC				no
>> @@ -233,6 +234,7 @@
>>   #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
>>   #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
>>   #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_P_SMBUS		0x7e22
>> +#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_S_SMBUS		0xae22
>>   #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
>>   #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
>>   #define PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS		0x8d22
> 
> Sorry for nitpicking but since 34b57f40a6a2 ("i2c: i801: sort IDs
> alphabetically") this list is supposed to be sorted by ID.
> 
Ah, true. Will fix and resend.
