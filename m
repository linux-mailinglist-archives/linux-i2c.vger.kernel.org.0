Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1578D66DC41
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 12:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236058AbjAQLWt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 06:22:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236262AbjAQLWJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 06:22:09 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FD6B760
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 03:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673954514; x=1705490514;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=P209IveLtzxr4BxGezPdl0bO1RIVixNSNA7UJKwbmH4=;
  b=Sboio8G1uBL8CL7XYuPWv6XyuVUtVKrJM5pNszI0aMpb7e9dOZglESL/
   /WETryCmhaPJghiIsgYgxskIXZRB9aGgHVWID5rRG7yhSvUndXMyoa5Su
   DD5EuhdLxIfNIeqJ+2QZKziWfyifk7zryxkFjujhrgyUYeESHEAJJrbz+
   W0x3+jz72XuAPHvrarXPO3iznsvdOyktQigaUZw7kltxnFb8k66ZyLciU
   7MbH4rQhj/qvwQbHVhGCqx27LEx1uocli9JvJ8OYMR/feiGMyryRcq7R4
   F1f5FXi4qnTxMoGPVTcwHL2LrhXDEcdPQIlsy/9yohXHuB853A9H3Uskv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="304355123"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="304355123"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 03:21:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="801712500"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="801712500"
Received: from mylly.fi.intel.com (HELO [10.237.72.143]) ([10.237.72.143])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2023 03:21:53 -0800
Message-ID: <2e640cb9-476e-6d3c-97c8-5500f59eb5e3@linux.intel.com>
Date:   Tue, 17 Jan 2023 13:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: designware: add a new bit check for IC_CON control
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
References: <20230116043500.413499-1-Shyam-sundar.S-k@amd.com>
 <59fbf54d-9bbc-efaa-bb2a-74880156e310@linux.intel.com>
 <fda9b261-0b42-1c13-b40c-8ad93088cbf2@amd.com>
 <Y8Z6n7HEXBQx6Nxg@smile.fi.intel.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y8Z6n7HEXBQx6Nxg@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/17/23 12:38, Andy Shevchenko wrote:
> On Tue, Jan 17, 2023 at 04:01:21PM +0530, Shyam Sundar S K wrote:
>> Double checked with our HW and FW teams, and understand that (atleast in
>> AMD platform designs):
>>
>> 1. BIOS actually programs the BUS_CLEAR_FEATURE_CTRL and also enables
>> the detection of SCL/SDA stuck low.
>> 2. Whenever the stuck low is detected, the SMU FW shall do the bus
>> recovery procedure.
>>
>> Currently, the way in which the "master_cfg" is built in the driver it
>> overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
>> cannot initiate the bus recovery if the stuck low is detected.
>>
>> Hence this proposed check should be sufficient enough.
> 
> Maybe you should elaborate this in the commit message and/or the code.
> 
Yes indeed. Makes obvious this is not dead code if somebody looks only 
the code and specification.

It is also important in the future if somebody adds the same 
functionality into driver that this AMD platform must be taken into 
account in that code change. I.e. no two instances trying to do the same 
recovery.
