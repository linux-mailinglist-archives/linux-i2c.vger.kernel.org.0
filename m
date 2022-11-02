Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDB461638D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbiKBNPF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbiKBNOz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:14:55 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E36193FA
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394894; x=1698930894;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oI5Pw+G8B8WkTLY8ci0ug9XLYv/Et1qfmQHyUh9B2/w=;
  b=evCOEie/p/SViNaS5fkjKzEqLQy7xuuILLOoktoAdN5YAeXNblP+n7oE
   GQDM7VgoNgHe8/l8QltGhUuuB0b28L5OKyTabhxKRy5qYBCAs2+xtr2oO
   zCfYQSO5eP6aVedFNGy/sxNIfxMm9twK9s0IfeIIp1wAgCAC0n2NjhEmF
   zTXUev3fB1LgHf9WryREU6QAu34Vd7fJGT7Aq8F06Dh2rN7GCcmsK4nL6
   Sc4l52aGz5C03LZTy2zOqT7LbHzQ56S48ZpeS2gkOK4ctoIpj00SYDQm/
   SwEqUjkovpNiQ3KAjURPDKJts3jcvlrcCATfdUPhrT/kXhFf3UhPQ4nKx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="373626079"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="373626079"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="585391918"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="585391918"
Received: from mylly.fi.intel.com (HELO [10.237.72.68]) ([10.237.72.68])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2022 06:14:51 -0700
Message-ID: <c6f9fa95-90ae-67b3-3a40-c8baf06c4cff@linux.intel.com>
Date:   Wed, 2 Nov 2022 15:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH 11/11] i2c: designware: Align defines in
 i2c-designware-core.h
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>
References: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
 <20221026123912.2833271-12-jarkko.nikula@linux.intel.com>
 <Y1k4SoqEopMaf5q1@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y1k4SoqEopMaf5q1@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 10/26/22 16:38, Andy Shevchenko wrote:
> On Wed, Oct 26, 2022 at 03:39:12PM +0300, Jarkko Nikula wrote:
>> Align all defines to the same column.
> 
> ...
> 
>> +#define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A
> 
>> +#define DW_IC_COMP_TYPE_VALUE			0x44570140
> 
> While at it, I would add comments that show ASCII values of these definitions.
> 
Yes good idea and I did it in a new followup patch to this.

>> +#define DW_IC_INTR_DEFAULT_MASK			(DW_IC_INTR_RX_FULL | \
>> +						 DW_IC_INTR_TX_ABRT | \
>> +						 DW_IC_INTR_STOP_DET)
>> +#define DW_IC_INTR_MASTER_MASK			(DW_IC_INTR_DEFAULT_MASK | \
>> +						 DW_IC_INTR_TX_EMPTY)
>> +#define DW_IC_INTR_SLAVE_MASK			(DW_IC_INTR_DEFAULT_MASK | \
>> +						 DW_IC_INTR_RX_UNDER | \
>> +						 DW_IC_INTR_RD_REQ)
> 
> While at it, I would reformat these (and similar below) as
> 
> #define DW_IC_INTR_DEFAULT_MASK						\
> 	(DW_IC_INTR_RX_FULL | DW_IC_INTR_TX_ABRT | DW_IC_INTR_STOP_DET)
> 
I tried this and to me it didn't look as clear than existing so I kept 
it as before.

>> -	struct i2c_bus_recovery_info rinfo;
>> +	struct			i2c_bus_recovery_info rinfo;
> 
> ...and now this are consistent, but these all are inconsistent with, e.g.
> 
Yeah, this somehow slipped in. Removed this change from v2.

Jarkko

