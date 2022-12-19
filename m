Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2963650E2D
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 16:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbiLSPB0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 10:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbiLSPBY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 10:01:24 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C97CFD2;
        Mon, 19 Dec 2022 07:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671462082; x=1702998082;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HaSoztIlisLlVV1BG4FqM6MV6erV4GMCZIbfm5ghSnU=;
  b=RIK32m0G4V/uOQKwPq63V4Cr+evewu9AtXR5xkZBPMnowN/38e/z2yjB
   aGmK7RFqG13DbLXqEZnq6PrJ9VRXxlowGVIais9HxUiCf0aeC5/o8N32s
   /BZSPfJTDFxRvIUpyaixvYcljsz9gMSClmF/0JsZXrVDar3dpZhAc2s7k
   0YDt61Sjp3IVHam5L5eYY8SEJfe0Z1tu1P9nUz7M1bQsKop/3ahrA5Fh9
   7Nc1oL59DE0oI9qNWMtQPUinRdpvNQribyMGOhVOGYeMQicphY2XC1tPO
   EKlOF409eqkjZ2RsH6NBp4HlYBDSxG53xQCczGxHqv9gIsgAgf48UsZty
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="318052145"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="318052145"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 07:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="979396823"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="979396823"
Received: from mylly.fi.intel.com (HELO [10.237.72.68]) ([10.237.72.68])
  by fmsmga005.fm.intel.com with ESMTP; 19 Dec 2022 07:01:19 -0800
Message-ID: <b3c6f560-fb10-005d-0e61-04b15efc380a@linux.intel.com>
Date:   Mon, 19 Dec 2022 17:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v4] i2c: designware: Fix unbalanced suspended flag
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Cc:     mika.westerberg@linux.intel.com, jsd@semihalf.com, wsa@kernel.org,
        hdegoede@redhat.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20221219130145.883309-1-rf@opensource.cirrus.com>
 <Y6Bi4Q9xyPd2Tc6k@smile.fi.intel.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y6Bi4Q9xyPd2Tc6k@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/19/22 15:10, Andy Shevchenko wrote:
> On Mon, Dec 19, 2022 at 01:01:45PM +0000, Richard Fitzgerald wrote:
>> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
>> i2c_mark_adapter_resumed().
>>
>> dw_i2c_plat_resume() must always be called, so that
>> i2c_mark_adapter_resumed() is called. This is not compatible with
>> DPM_FLAG_MAY_SKIP_RESUME, so remove the flag.
>>
>> Since the controller is always resumed on system resume the
>> dw_i2c_plat_complete() callback is redundant and has been removed.
>>
>> The unbalanced suspended flag was introduced by commit c57813b8b288
>> ("i2c: designware: Lock the adapter while setting the suspended flag")
>>
>> Before that commit, the system and runtime PM used the same functions. The
>> DPM_FLAG_MAY_SKIP_RESUME was used to skip the system resume if the driver
>> had been in runtime-suspend. If system resume was skipped, the suspended
>> flag would be cleared by the next runtime resume. The check of the
>> suspended flag was _after_ the call to pm_runtime_get_sync() in
>> i2c_dw_xfer(). So either a system resume or a runtime resume would clear
>> the flag before it was checked.
>>
>> Having introduced the unbalanced suspended flag with that commit, a further
>> commit 80704a84a9f8
>> ("i2c: designware: Use the i2c_mark_adapter_suspended/resumed() helpers")
> 
> This is still unwrapped propertly, but no need to resend, it so minor, really.
> Just a hint for the future submissions.
> 
This version was working on those two machines that saw a regression 
with v2 so

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
