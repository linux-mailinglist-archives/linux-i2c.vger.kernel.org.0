Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDAD60E2CE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 16:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbiJZOAv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 10:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234132AbiJZOA2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 10:00:28 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1182CDE7
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 07:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666792825; x=1698328825;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5kZZiVsihBToB/s6CKhEnVhuZsqMp9Tgdi4GI2s9apw=;
  b=RkhqqJ3wLioAwsl1KsH37hE7sWNqebyy+AhTcf7Wq7YAccBCpK/TGLJm
   UtVP6/6aO8xJNzmc6viPy7w5uJ58m4RWzdJB35wMNOwcO/zPNlX+F+aVQ
   rr/SN3heHyiRciCUy6kbhZH2su7D+S/Y/A8TV1Cdz0JrY3RlXCzJ5LAeT
   SkkPfiQfhYZq972PGl34Y51IGuP9IbYeKlny2gq7AeXt4u3P1NwG22awR
   RTAYklOc9u/Z+dEgiVze4d3JbestExc4Snurc1y/NsxlJtHsTTdrSqDFW
   hpJs1aQTtpIlcJ3R6LeUEElC9CAQTs6fjY3QFVPBhVDaSq5o41VVQv0Q9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="372160276"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="372160276"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 07:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="634494719"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="634494719"
Received: from mylly.fi.intel.com (HELO [10.237.72.55]) ([10.237.72.55])
  by fmsmga007.fm.intel.com with ESMTP; 26 Oct 2022 07:00:22 -0700
Message-ID: <b39f34a9-12c6-a519-0448-afc8e9e2d3cd@linux.intel.com>
Date:   Wed, 26 Oct 2022 17:00:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.3
Subject: Re: [PATCH 10/11] i2c: designware: Remove common i2c_dw_disable_int()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>
References: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
 <20221026123912.2833271-11-jarkko.nikula@linux.intel.com>
 <Y1k3Y0D8qr8q5o7s@smile.fi.intel.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y1k3Y0D8qr8q5o7s@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/26/22 16:34, Andy Shevchenko wrote:
> On Wed, Oct 26, 2022 at 03:39:11PM +0300, Jarkko Nikula wrote:
>> i2c_dw_disable_int() and disable_int pointer in struct dw_i2c_dev were
>> introduced by the commit 90312351fd1e ("i2c: designware: MASTER mode as
>> separated driver") but it looks i2c_dw_disable_int() was never called
>> through the pointer.
> 
> But the last part is not true... See below.
> 
Well, perhaps needs clarification, commenting more below. I need to 
update patch anyway since I realized I forgot to remove kernel doc 
comment for disable_int pointer from i2c-designware-core.h.

>> Since i2c_dw_disable_int() is just masking interrupts and the direct
>> DW_IC_INTR_MASK register write looks more clear in the code use that and
>> remove from common code.
> 
> ...
> 
>>   	else if (unlikely(dev->flags & ACCESS_INTR_MASK)) {
>>   		/* Workaround to trigger pending interrupt */
>>   		regmap_read(dev->map, DW_IC_INTR_MASK, &stat);
>> -		i2c_dw_disable_int(dev);
>> +		regmap_write(dev->map, DW_IC_INTR_MASK, 0);
>>   		regmap_write(dev->map, DW_IC_INTR_MASK, stat);
> 
> Not sure I understood this dance. What exactly happen for the interrupts
> that are getting masked and immediately unmasked? Is that the core of
> the above mentioned workaround?
> 
This workaround was introduced by commit 2d244c81481f ("i2c: designware: 
fix IO timeout issue for AMD controller").

>>   	}
> 
> ...
> 
>> -	dev->disable_int(dev);
>> +	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
> 
> Called via pointer, didn't it?
> 
Well, a bit messy by itself since pointer is unconditionally set and 
used in the same module.

I guess original patch was accidentally copying the same idea than with 
->init pointer that will be pointing to different master and slave init 
functions.
