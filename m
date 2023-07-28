Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9459F766BD6
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jul 2023 13:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235823AbjG1LdS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jul 2023 07:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236264AbjG1LdP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jul 2023 07:33:15 -0400
Received: from mgamail.intel.com (unknown [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4223C07;
        Fri, 28 Jul 2023 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690543991; x=1722079991;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uAiSCACue2/Yc7IB3UDBv81ePECoMUEDVW8spdeHU98=;
  b=nyAAkG35HlI3xc5RHUAJTEW1fG/Uyl2T6QOthhWz95yMz1k27CTJo6UB
   x74tuXTJNo224SJAEjx/pAwmUFxOuhytAkxWqdeHvD3VI481IyL56z65R
   mUCoBIm2hrlhdz/Du6VWuPsk+hzCGoTy82FaHC+B24gHtVw44BkrM1gBP
   rR/+gGv4ahZ7KrJKgrm5Xc70SAfS+G+fi9x0fQ1qkg8RAtpOJdHglgUrb
   BPzTw/G8pl9sdMrG5/Rvn9iiv1k1uapetgUoGNcj4hnh/WiEvkRtkfxiz
   KLouyi1Q2OQdP9seSeBadyjKIGuwVh6CkMuvhY1dhP6H0sYcPckpG2tNZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="366031009"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="366031009"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="851177485"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="851177485"
Received: from mylly.fi.intel.com (HELO [10.237.72.59]) ([10.237.72.59])
  by orsmga004.jf.intel.com with ESMTP; 28 Jul 2023 04:33:07 -0700
Message-ID: <928d54c4-ec71-5f09-ed66-5f9c52aca6ba@linux.intel.com>
Date:   Fri, 28 Jul 2023 14:33:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/9] i2c: designware: Move has_acpi_companion() to
 common code
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-2-andriy.shevchenko@linux.intel.com>
 <20230725214521.zxjqinryvva2zanx@intel.intel>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230725214521.zxjqinryvva2zanx@intel.intel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/26/23 00:45, Andi Shyti wrote:
> Hi Andy,
> 
> On Tue, Jul 25, 2023 at 05:30:15PM +0300, Andy Shevchenko wrote:
>> Instead of checking in callers, move the call to the callee.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>   drivers/i2c/busses/i2c-designware-common.c  | 11 +++++++++--
>>   drivers/i2c/busses/i2c-designware-pcidrv.c  |  3 +--
>>   drivers/i2c/busses/i2c-designware-platdrv.c |  3 +--
>>   3 files changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
>> index cdd8c67d9129..683f7a9beb46 100644
>> --- a/drivers/i2c/busses/i2c-designware-common.c
>> +++ b/drivers/i2c/busses/i2c-designware-common.c
>> @@ -255,9 +255,8 @@ static void i2c_dw_acpi_params(struct device *device, char method[],
>>   	kfree(buf.pointer);
>>   }
>>   
>> -int i2c_dw_acpi_configure(struct device *device)
>> +static void i2c_dw_acpi_do_configure(struct dw_i2c_dev *dev, struct device *device)

Because of this dual dev pointer obscurity which is cleaned in the next 
patch and Andi's comment below in my opinion it makes sense to combine 
patches 1 and 2.

>>   {
>> -	struct dw_i2c_dev *dev = dev_get_drvdata(device);
>>   	struct i2c_timings *t = &dev->timings;
>>   	u32 ss_ht = 0, fp_ht = 0, hs_ht = 0, fs_ht = 0;
>>   
>> @@ -285,6 +284,14 @@ int i2c_dw_acpi_configure(struct device *device)
>>   		dev->sda_hold_time = fs_ht;
>>   		break;
>>   	}
>> +}
>> +
>> +int i2c_dw_acpi_configure(struct device *device)
> 
> I was about to ask you why are we keeping this int, but then I
> saw that you are making it void in the next patch :)
> 
