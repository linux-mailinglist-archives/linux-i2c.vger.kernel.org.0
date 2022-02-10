Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 873CB4B10AF
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 15:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243068AbiBJOnw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 09:43:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243024AbiBJOnw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 09:43:52 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EE2C4C;
        Thu, 10 Feb 2022 06:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644504233; x=1676040233;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wy1OKbDjlys8WDbmOYGKsbCiELtfH7IPmgm1WpHu2Dg=;
  b=g5T/0zQgVDZBPH/bR7lRoGFx26/yN1v41l1t4uOtFbnIlohI8YvoE6at
   mvGXeV/4HsvNblDcsfU+xxvQ2o/woc4sOja86a0y2ziOc+0anWh6HZAoE
   NToNk3nNty58s1I1dMr+i4754Y1flMQng96tq9ZMJqS0kYj7IRC8eDdAR
   MUwZoMPyQ9mRvQaPY00Y7+cSdYgpf5395alljQ6SuKAr+1nw1MoN7rufB
   RvI6qoUB6hkAt+DHF9o9bPKPx/EYDBiEmtq8jCJUMnlyxPPPcndBDdFQm
   Hf2H0D3ZWZqZY+fYuJ9U0diP089B28GZkhZ8j2xRwX1UAULbjgOeHCtrQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249453007"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="249453007"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 06:43:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="485705992"
Received: from mylly.fi.intel.com (HELO [10.237.72.152]) ([10.237.72.152])
  by orsmga006.jf.intel.com with ESMTP; 10 Feb 2022 06:43:49 -0800
Message-ID: <87fcba54-b54a-ea20-63ba-f447f4d34506@linux.intel.com>
Date:   Thu, 10 Feb 2022 16:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH v4 2/2] i2c: designware: Add AMD PSP I2C bus support
Content-Language: en-US
To:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
References: <20220208141218.2049591-1-jsd@semihalf.com>
 <20220208141218.2049591-3-jsd@semihalf.com>
 <YgPdYw6hDoN198Hf@smile.fi.intel.com>
 <CAOtMz3OJNopHKgKDvGNfVWwvvo57=LyiRcnT+x6TxwLb+hgkyw@mail.gmail.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <CAOtMz3OJNopHKgKDvGNfVWwvvo57=LyiRcnT+x6TxwLb+hgkyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/10/22 10:18, Jan Dąbroś wrote:
> śr., 9 lut 2022 o 16:28 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
>>
>> On Tue, Feb 08, 2022 at 03:12:18PM +0100, Jan Dabros wrote:
>>
>> ...
>>
>> I have noticed code duplication.
>>
>>> +     status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
>>> +     if (status) {
>>> +             if (status == -ETIMEDOUT)
>>> +                     dev_err(psp_i2c_dev, "Timed out waiting for PSP to release I2C bus\n");
>>> +             else
>>> +                     dev_err(psp_i2c_dev, "PSP communication error\n");
>>> +
>>> +             dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
>>> +             psp_i2c_mbox_fail = true;
>>> +             goto cleanup;
>>> +     }
>>
>>> +     /* Send a release command to PSP */
>>> +     status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
>>> +     if (status) {
>>> +             if (status == -ETIMEDOUT)
>>> +                     dev_err(psp_i2c_dev, "Timed out waiting for PSP to acquire I2C bus\n");
>>> +             else
>>> +                     dev_err(psp_i2c_dev, "PSP communication error\n");
>>> +
>>> +             dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
>>> +             psp_i2c_mbox_fail = true;
>>> +             goto cleanup;
>>> +     }
>>
>> If you are going to update the series, consider to introduce a common helper.
>> Otherwise, consider a follow up.
> 
> Thanks for your comment. Since Jarkko is running some long-lasting
> tests with v4 patchset, I would like to keep this as is for now (and
> make a follow up commit). If there will be some additional comments
> for v4 from him and will spin v5 - I will introduce a common helper
> function then.
> 
Test run fine overnight, although I wasn't expecting this breaking 
Baytrail since patch is practically touching only semaphore detection at 
probe time on Baytrail. I'm up to you would you address Andy's comments 
as a follow up or as v5.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
