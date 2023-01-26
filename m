Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBDE67CC85
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jan 2023 14:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbjAZNo7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Jan 2023 08:44:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjAZNoz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Jan 2023 08:44:55 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CDB5D11C
        for <linux-i2c@vger.kernel.org>; Thu, 26 Jan 2023 05:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674740688; x=1706276688;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7jpZziSv+ilAhaBzB1L0zxb8M79vcjDIwEFlEQKlymA=;
  b=e2J8PWG5/zhVGzJXjVy72TsczdoWBeAFzU2TtjGktreAyagNZasOOJnx
   V+4u2YiFQH9VyUoDOZ4+tBTc2yJHtcpo5UjqGGWsq1RTANZB4k58IYMqm
   Qlsbkls+C4zOYXmTFXP8jIfruNknNDUGnWMBt8NQBJdIf2tLpFJSNnwPe
   0V5NuHK84IX7LzApG4m4yW2UWBOhbFj7YxwTgwKVCctXE0G4lxy9FgSpS
   7h/AdftzaCM4fBYJGXu2o3LRLYIJ/j2EXb6eaY1VY/q5RUk8BZnCWbV4k
   YRoOhoMVVxwlXYA3u0UEUTEiRrsudzUsJGbJlVYiFwiGdMBSrNLSDx+XQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="307158824"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; 
   d="scan'208";a="307158824"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 05:44:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="695087235"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; 
   d="scan'208";a="695087235"
Received: from mylly.fi.intel.com (HELO [10.237.72.143]) ([10.237.72.143])
  by orsmga001.jf.intel.com with ESMTP; 26 Jan 2023 05:44:46 -0800
Message-ID: <c39ad0ca-ffe1-79b9-651c-ce86ac5d43fb@linux.intel.com>
Date:   Thu, 26 Jan 2023 15:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH v1] i2c: designware: Change from u32 to unsigned int for
 regmap_read() calls
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
References: <20230124114732.1387997-1-Shyam-sundar.S-k@amd.com>
 <e32d5647-530c-80d0-e7e5-a92e5f5a82dd@linux.intel.com>
 <Y8/W8ebLVoN0WHQq@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y8/W8ebLVoN0WHQq@smile.fi.intel.com>
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

On 1/24/23 15:02, Andy Shevchenko wrote:
> On Tue, Jan 24, 2023 at 02:54:52PM +0200, Jarkko Nikula wrote:
>> On 1/24/23 13:47, Shyam Sundar S K wrote:
>>> regmap_read() API signature expects the caller to send "unsigned int"
>>> type to return back the read value, but there are some occurrences of 'u32'
>>> across i2c-designware-* files.
>>>
>>> Change them to match the regmap_read() signature.
> 
> ...
> 
>> Hmm.. I'm not sure about these. We know registers are 32-bit and change to
>> unsigned int is a step being more ambiguous. I'm wearing my old embedded
>> developer hat who likes to see explicit types when dealing with HW.
>>
>> Andy: what was your rationale to propose changing u32 to unsigned int in
>> another i2c-designware patch? Has gcc started complaining if regmap_read()
>> is used with u32 type?
> 
> To be the same type as regmap API is expecting.
> 
> What you are talking about makes sense for the direct IO accessor calls.
> Actually something like this had to be done when driver was converted to
> regmap APIs.
> 
> Here we might have 16-bit registers, they are fine when variable is u32,
> but goes over boundaries if we declare it as u16. So unsigned int makes
> more sense to me.
> 
> OTOH I agree that this change is subjective since there is no functional
> or other changes as long as we have unsigned int == u32.
> 
> So, up to you, guys. But I'm fine with the change.
> 
Fair point.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
