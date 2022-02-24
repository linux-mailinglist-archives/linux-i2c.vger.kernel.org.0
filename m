Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0B64C2C6C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 14:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbiBXNCj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 08:02:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbiBXNCj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 08:02:39 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8142416A58B
        for <linux-i2c@vger.kernel.org>; Thu, 24 Feb 2022 05:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645707729; x=1677243729;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7k2OkbwG17MWsiHsuTMXcOfZS0/GkIli71L/pL+iyDo=;
  b=XYyx3hjibT/CHIUN79P94kf1dLcaAnYSXa7g8AkQRtWX6HgND0ktMEpv
   lEknVjOWB7d/Bp5/1GY4x/cdK278PmrpG/uZMANvPKTBMGodkXqJ4lgzc
   eHaa/HRnNB6wJcqpj3wXZHrIYrMMiDouh318ArHRk4cfc6a3iNXdRk3j6
   YpekYwD/oo6G2ePPKapwfMMYj4FhAoQyM8pUSbQOjrrLLdh9oFN38SwIn
   LV5CpCNDzQp3S9il/bZIPkCi8aeWCOsWbnLHZk5f1uqEb+EBrUAD3xmhR
   rnXS6V9hn3Vhi2+OScG3Ki1d5SUPLVls58qLCHUM6j0HQx5422MV2krr0
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="249808845"
X-IronPort-AV: E=Sophos;i="5.88,134,1635231600"; 
   d="scan'208";a="249808845"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 05:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,134,1635231600"; 
   d="scan'208";a="548737984"
Received: from mylly.fi.intel.com (HELO [10.237.72.156]) ([10.237.72.156])
  by orsmga008.jf.intel.com with ESMTP; 24 Feb 2022 05:02:06 -0800
Message-ID: <45af786f-3d68-6730-2160-c92f79ab8c05@linux.intel.com>
Date:   Thu, 24 Feb 2022 15:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] i2c: designware: Lock the adapter while setting the
 suspended flag
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <20220223134839.731138-1-hdegoede@redhat.com>
 <YhZKNqpeD9M9xxk6@smile.fi.intel.com>
 <8589d685-b075-cce4-89b2-129588a5dd2e@redhat.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <8589d685-b075-cce4-89b2-129588a5dd2e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/23/22 17:15, Hans de Goede wrote:
> Hi Andy,
> 
> On 2/23/22 15:52, Andy Shevchenko wrote:
>> On Wed, Feb 23, 2022 at 02:48:38PM +0100, Hans de Goede wrote:
>>> Lock the adapter while setting the suspended flag, to ensure that other
>>> locked code always sees the change immediately, rather then possibly using
>>> a stale value.
>>>
>>> This involves splitting the suspend/resume callbacks into separate runtime
>>> and normal suspend/resume calls. This is necessary because i2c_dw_xfer()
>>> will get called by the i2c-core with the adapter locked and it in turn
>>> calls the runtime-resume callback through pm_runtime_get_sync().
>>>
>>> So the runtime versions of the suspend/resume callbacks cannot take
>>> the adapter-lock. Note this patch simply makes the runtime suspend/resume
>>> callbacks not deal with the suspended flag at all. During runtime the
>>> pm_runtime_get_sync() from i2c_dw_xfer() will always ensure that the
>>> adapter is resumed when necessary.
>>>
>>> The suspended flag check is only necessary to check proper suspend/resume
>>> ordering during normal suspend/resume which makes the pm_runtime_get_sync()
>>> call a no-op.
>>
>> Both patches look good to me and seems like a nice clean up. Not sure if the
>> first one should be backported (and hence have a Fixes tag).
>>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thank you for the review. As for adding a Fixes: tag, this was inspired
> by an actual bug-report, but it did not help in fixing the bug, so I left
> the fixes tag out.
> 
> If you or Wolfram still want to add a Fixes tag, then it should be:
> 
> Fixes: 275154155538  ("i2c: designware: Do not allow i2c_dw_xfer() calls while suspended")
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
