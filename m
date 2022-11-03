Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2E8617908
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 09:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiKCIsl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 04:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiKCIsj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 04:48:39 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E492728
        for <linux-i2c@vger.kernel.org>; Thu,  3 Nov 2022 01:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667465319; x=1699001319;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iDXwCFOjmqXnonPIY48ZRzbTIgQFuk3z80KogL6V5wM=;
  b=UjR6aOCXcIWUosCYFhgXGA6cMbyaKU+1tjOjO/MA4iO33UHN+r4T2Khv
   R/98rSUDK0M0ZtU8tzwCbq4vLd1kj0QytZ36ZseE97f+cdRUNzHxXGTAw
   0nfnELeBROXoy2Kz6H9oWgwh8m5QVx4a0FERFUP96IsUsy78CS0zvM9ki
   YelbhKUtr5cn+2XKa5AUfHO5GtsVgxPmjKWjAMAxNW6jaqWUdmDbwQZq5
   O/llvNFQDNIDngiqjkoRqJH3YhYO1zfF+2BhaWVmAGzhhU01BidNRT59n
   ID61nzGu3mC3d0TsmHwq9KKi2gPNMT5QqOBFPitg8rOdHf0fY0uci5RJJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="310740059"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="310740059"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 01:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="723863591"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="723863591"
Received: from mylly.fi.intel.com (HELO [10.237.72.68]) ([10.237.72.68])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2022 01:48:36 -0700
Message-ID: <ba33ef90-fe7b-7553-19ac-d89835ed3583@linux.intel.com>
Date:   Thu, 3 Nov 2022 10:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH v2 12/12] i2c: designware: Add comment to custom register
 value constants
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>
References: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
 <20221102131125.421512-13-jarkko.nikula@linux.intel.com>
 <Y2KAteiXN87LZ72v@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y2KAteiXN87LZ72v@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/2/22 16:37, Andy Shevchenko wrote:
> On Wed, Nov 02, 2022 at 03:11:25PM +0200, Jarkko Nikula wrote:
>> DW_IC_COMP_VERSION register contains the ASCII representation of the
>> Synopsys component version followed by '*'. Here 0x3131312A == "111*"
>> means version 1.11 is required for DW_IC_SDA_HOLD register availability.
> 
> The '*' means "any letter, starting from a", so I would put it as 1.11a.
> And perhaps explain that the fourth character meaning.
> This will be in align with their datasheets.
> 
Sadly a few Synopsys datasheets I have don't much explain this or refer 
to AMBA release notes so I don't want to carve things I don't know in stone.

Jarkko

