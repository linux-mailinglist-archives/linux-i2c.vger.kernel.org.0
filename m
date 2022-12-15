Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026BB64DDC1
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 16:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiLOPZi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 10:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiLOPZh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 10:25:37 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A7827E;
        Thu, 15 Dec 2022 07:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671117934; x=1702653934;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=U/vFzWlQOr6DEDJM/bvotElVQnhcnvC1D09ECQrMdsc=;
  b=bUPabGcOzotR7DVhz7cBrJoxkZHv3XUlyh4PuMwjE5qt0p4K8gBLDyu3
   yaAEf2fDhxXnLFWuL1XTJUm0dXadwDyK5uNxIvR+nS4/swfLGJPUCV31d
   EKb4ZhZVxUBoJaktltcfbWmBhXS806HyEz3mjiBO9PntMFXHo04Vy+TFS
   lkE7CixX4sW7pQCUjJfMdNjiE/LzueSrZVLuqWJsviAxtLRvRyoWv9Zk3
   Rz1idE7YUYvPo3xH65GbEXznUtSmh8tvg1+U9JRk0Wjm7Md7x74jxwYxZ
   TroHURiEdTtlEy2FjaxLx7vaK/TA+BcSa5k1PF11IROM6PxwJjoAnXhC8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="320580099"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="320580099"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 07:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="651568484"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="651568484"
Received: from mylly.fi.intel.com (HELO [10.237.72.68]) ([10.237.72.68])
  by fmsmga007.fm.intel.com with ESMTP; 15 Dec 2022 07:09:15 -0800
Message-ID: <a467bab2-c3b0-0515-cb4a-66711b972115@linux.intel.com>
Date:   Thu, 15 Dec 2022 17:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v2] i2c: designware: Fix unbalanced suspended flag
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20221213144524.368297-1-rf@opensource.cirrus.com>
 <8cf30cb2-6dec-b21b-ba15-f21490546426@redhat.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <8cf30cb2-6dec-b21b-ba15-f21490546426@redhat.com>
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

Hi

On 12/14/22 13:28, Hans de Goede wrote:
> Hi Richard,
> 
> On 12/13/22 15:45, Richard Fitzgerald wrote:
>> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
>> i2c_mark_adapter_resumed().
>>
>> dw_i2c_plat_resume() must always be called, so that
>> i2c_mark_adapter_resumed() is called. This is not compatible with
>> DPM_FLAG_MAY_SKIP_RESUME.
>>
>> The pairing of pm_runtime_force_suspend() and pm_runtime_force_resume()
>> can replace this. If nothing is using the driver, and it is not currently
>> suspended, it will be put into runtime-suspend and will be left in
>> runtime-suspend during the system resume.
>>
>> pm_runtime_force_suspend() is not compatible with DPM_FLAG_SMART_SUSPEND
>> so this must also be removed. DPM_FLAG_SMART_SUSPEND will set the device
>> back to pm_runtime_active() during resume_noirq if it cannot skip resume.
>> This would lead to the inconsistent state where the driver runtime_suspend
>> has been called (by force_suspend()) but it is marked active (by PM core).
>>
>> The unbalanced suspended flag was introduced by
>> commit c57813b8b288 ("i2c: designware: Lock the adapter while setting the
>> suspended flag")
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
>> commit 80704a84a9f8 ("i2c: designware: Use the
>> i2c_mark_adapter_suspended/resumed() helpers")
>>
>> changed from using a local suspended flag to using the
>> i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
>> checked by I2C core code before issuing the transfer to the bus driver, so
>> there was no opportunity for the bus driver to runtime resume itself before
>> the flag check.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")
> 
> Thank you. I like the new approach in this version.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
I noticed a resume regression with this patch but not all machines and 
only when resuming from s2idle. After resume all devices on those 
machines are in D0 even their runtime state show they are suspended. 
Works with v6.1.

- Baytrail based MRD7 with one I2C bus shared with PUNIT

After boot. All ok (5th bus is shared with PUNIT and not power managed)

cat /sys/bus/platform/devices/80860F41\:0*/power/runtime_status
suspended
suspended
suspended
suspended
active

cat /sys/bus/platform/devices/80860F41\:0*/firmware_node/power_state
D3hot
D3hot
D3hot
D3hot
D0

After suspend-to-idle (s2idle) resume cycle. Devices stay in D0

cat /sys/bus/platform/devices/80860F41\:0*/power/runtime_status
suspended
suspended
suspended
suspended
active

cat /sys/bus/platform/devices/80860F41\:0*/firmware_node/power_state
D0
D0
D0
D0
D0

- Braswell based reference board

After boot or after suspend-to-ram resume. All ok
cat /sys/bus/platform/devices/808622C1\:0*/power/runtime_status
suspended
suspended
suspended
suspended
suspended
suspended

cat /sys/bus/platform/devices/808622C1\:0*/firmware_node/power_state
D3hot
D3hot
D3hot
D3hot
D3hot
D3hot

After suspend-to-idle resume. Devices stay in D0

cat /sys/bus/platform/devices/808622C1\:0*/power/runtime_status
suspended
suspended
suspended
suspended
suspended
suspended

cat /sys/bus/platform/devices/808622C1\:0*/firmware_node/power_state
D0
D0
D0
D0
D0
D0

- Newer machines (Skylake and newer) where i2c-designware is part of 
Intel Low Power Subsystem (LPSS)

Patch doesn't seem to cause regression and after s2idle resume I2C 
devices are in D3hot.

Jarkko
