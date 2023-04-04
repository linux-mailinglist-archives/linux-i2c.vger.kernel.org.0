Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898536D5A10
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Apr 2023 09:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbjDDHz7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Apr 2023 03:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbjDDHz7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Apr 2023 03:55:59 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263041985
        for <linux-i2c@vger.kernel.org>; Tue,  4 Apr 2023 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680594958; x=1712130958;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jCYPjxqrB2ZK4ARWliNUxxWpQPAL4rCWtBM/po6Kwuw=;
  b=lg911vElixuu7tcasLEd0+/eSs1NuEW5PfidsXXrT18MDenVdjL9dP9D
   pfHvMhMyOxJDjWF7wtwwm5xblF5oAK15NOabAG/1oTC85gyMva/ZbIPBg
   KPBylH2/bWIqP4VzGYgBJqOTu0/vDXpkjv/qPM+Owty9x7AQH1fKLcGNb
   0J5lnhEnTrqUqeobXVAexvjm+pEomKtDLvXdsyQfbh8aCz6B+qMlBLrOp
   yoIqcKq0sRX/xE1/jelJUzwrXLKqdMPeS7gR90/9+kokIdMXToCPUxNbv
   NcLQGb0dQouNO61tihzixwi6ROrhdw38FizRmspPJfneZdAA7YpTjwszq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="407177860"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="407177860"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 00:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="750836749"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="750836749"
Received: from unknown (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga008.fm.intel.com with ESMTP; 04 Apr 2023 00:55:56 -0700
Message-ID: <0046bbc0-27dc-2eb4-eadf-9632a6a0730b@linux.intel.com>
Date:   Tue, 4 Apr 2023 10:55:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] i2c: i801: Add support for Intel Meteor Lake PCH-S
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20230330105502.4100351-1-jarkko.nikula@linux.intel.com>
 <20230330105502.4100351-2-jarkko.nikula@linux.intel.com>
 <20230403180357.500a8867@endymion.delvare>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230403180357.500a8867@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/3/23 19:03, Jean Delvare wrote:
> Hi Jarkko,
> 
> On Thu, 30 Mar 2023 13:55:02 +0300, Jarkko Nikula wrote:
>> Add SMBus PCI ID on Intel Meteor Lake PCH-S. Also called as Meteor
>> Point-S which is used in the code to distinguish from Meteor Lake-S SoC
>> but call both as Meteor Lake in documentation and Kconfig.
>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   Documentation/i2c/busses/i2c-i801.rst | 2 +-
>>   drivers/i2c/busses/Kconfig            | 2 +-
>>   drivers/i2c/busses/i2c-i801.c         | 3 +++
>>   3 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
>> index ab9e850e8fe0..e62a62323f36 100644
>> --- a/Documentation/i2c/busses/i2c-i801.rst
>> +++ b/Documentation/i2c/busses/i2c-i801.rst
>> @@ -46,7 +46,7 @@ Supported adapters:
>>     * Intel Emmitsburg (PCH)
>>     * Intel Alder Lake (PCH)
>>     * Intel Raptor Lake (PCH)
>> -  * Intel Meteor Lake (SOC)
>> +  * Intel Meteor Lake (SOC/PCH)
> 
> I'm confused. The patch actually adds support for Meteor Point (S). So
> shouldn't you add:
>      * Intel Meteor Point (PCH)
> 
> instead of modifying the existing line?
> 
Idea was to follow my earlier commit 80d943ab19e9 ("i2c: i801: 
Consolidate chipset names in documentation and Kconfig") to use single 
name for the same family instead of listing all possible variants.

Like here we have already support for Meteor Lake -P SoC and now adding 
support for Meteor Lake -S that will have both in SoC SMBus and PCH 
SMBus controllers.

I realized actually Alder Lake (PCH) above may not be correct. True for 
Alder Lake -S PCH but now thinking -P and -M variants may be actually SoCs.

Confusing, yes I agree :-)

