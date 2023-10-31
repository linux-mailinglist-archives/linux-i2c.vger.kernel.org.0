Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA9B27DCCB7
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 13:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235984AbjJaMKy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 08:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344217AbjJaMKh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 08:10:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B6C1D57;
        Tue, 31 Oct 2023 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698754220; x=1730290220;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JLL2YhB3kzvAEMv6/JNmvOui/jNFQSuiptKeTYCJvh8=;
  b=VKFUoxFqzQcanw/6i5xhd6s9T0gsPoPhtB7TsxHNNmIXZXL7yt+cwrnd
   EZa3LR5yyQwMFpkF/DGfU5cHhp6NzjrbpxzI6FaSYldH71f/pgs7m2ptr
   omDkQtCVtYus/qKSEXMOeek7jCymmk1ek7w4SV4qgdBA2TR6jAJ1EU3O1
   Q2ClMx7MWVTjaZqssAltayvdYabP6mdiOWegiejVW0rcHMZgZiLXCmJI/
   uCPGty0aZK4X6kufq2bfbj1gMmjpNU7TFD7J1w/yWDKLhAwTLa45hcBGb
   jRadZm+vlwyo2Srsw2hpgD+wtwNHg/5OKtJerfVMSlekVdMWGEY7/OmVL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="6897004"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="6897004"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="904322446"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="904322446"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2023 05:10:14 -0700
Message-ID: <846d933a-598f-43e7-8478-04f3a0d20d1c@linux.intel.com>
Date:   Tue, 31 Oct 2023 14:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Yann Sionneau <yann@sionneau.net>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Wolfram Sang <wsa@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Julian Vetter <jvetter@kalrayinc.com>,
        Jonathan Borne <jborne@kalray.eu>
References: <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
 <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
 <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
 <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
 <ZRSEntqne/1y1ozq@shikoro>
 <1d56ceef-6573-43b9-a050-124c341a0698@linux.intel.com>
 <ZTpLHZZYtd1WgBu6@ninjato>
 <ab57ba73-ce62-43fc-9cb1-d2db1bd13cd9@os.amperecomputing.com>
 <7ee0acbd-e332-4dc5-a6e6-0df58913ff71@sionneau.net>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <7ee0acbd-e332-4dc5-a6e6-0df58913ff71@sionneau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/31/23 10:44, Yann Sionneau wrote:
> 
> Le 31/10/2023 à 01:12, Jan Bottorff a écrit :
>> On 10/26/2023 4:18 AM, Wolfram Sang wrote:
>>> So, someone wants to come up with a patch to move to non-relaxed io
>>> accessors?
>>>
>> Is the current thinking to just make writes to DW_IC_INTR_MASK use the 
>> non-relaxed variant or something more broad?
>>
>> From a safest functioning viewpoint, we talked about making all 
>> accessors default to non-relaxed variants. A couple of pretty good 
>> arguments from knowledgeable people favored this. I know there also 
>> was some concerns about potential performance impact this might have 
>> although the counter argument was this is a pretty low speed device so 
>> some extra cpu cycles on register accesses were not likely to degrade 
>> overall performance.
>>
>> I could make the patch if we have consensus (or maintainers decision) 
>> on which way to go: 1) only writes to DW_IC_INTR_MASK are non-relaxed, 
>> 2) make all read/write accessors use the non-relaxed version.
>>
>> I'm personally in camp #2, safety first, performance fine tuning later 
>> if needed. Latent missing barrier bugs are difficult and time 
>> consuming to find.
> 
> Fine with me, let's go for #2 :)
> 
Also simplicity votes for #2.
