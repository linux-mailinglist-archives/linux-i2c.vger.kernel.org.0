Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A4A65440A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Dec 2022 16:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbiLVPOc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Dec 2022 10:14:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235335AbiLVPOV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Dec 2022 10:14:21 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A759424F2F;
        Thu, 22 Dec 2022 07:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671722060; x=1703258060;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gyODYh2bF0u1w4lb06K7uWpgiRl7PFX7XVgYO3KlnoI=;
  b=Ef8pahAoZ6c2PyxVzwX8UzIgpAk1GalnhH08P5zhFRJXVVYw++2e13Lq
   zn7vOpzjVdRcoeJUHLohXDA1FpJB1XfTzxtDq0m7YKTmniB2hte4zqsC/
   HooB0rtZbJ9tgTC+CQLkyh4AD8FaQuase9jMJRxEllwdOCoKFZp6aOQox
   2F3kwutNOechoUzmcnJ5kr6vTIuHkcE+9oSWp4w7Y8VW8mIbjXN+E+Sep
   ORSwjCIQbq17mf4PhlInXFw0RM4Xt+1gFSgggKUy91k4LaLv/9xPzJtEo
   bU/KTFzj2/OKqWrfrdkrQuMdKhTxCekneeQQnP+h4ZGHv2f60916GeSvI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="300489202"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="300489202"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 07:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="651806882"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="651806882"
Received: from mylly.fi.intel.com (HELO [10.237.72.179]) ([10.237.72.179])
  by orsmga002.jf.intel.com with ESMTP; 22 Dec 2022 07:14:15 -0800
Message-ID: <9c663363-49a0-da2f-508b-dbf3906b4d61@linux.intel.com>
Date:   Thu, 22 Dec 2022 17:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v5 1/1] i2c: designware: use casting of u64 in clock
 multiplication to avoid overflow
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hanna Hawa <hhhawa@amazon.com>
Cc:     wsa@kernel.org, mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linus.walleij@linaro.org, ben-linux@fluff.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com, lareine@amazon.com
References: <20221221195900.23276-1-hhhawa@amazon.com>
 <Y6NnkDwD9UUQ8Ro/@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y6NnkDwD9UUQ8Ro/@smile.fi.intel.com>
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

On 12/21/22 22:07, Andy Shevchenko wrote:
> On Wed, Dec 21, 2022 at 07:59:00PM +0000, Hanna Hawa wrote:
>> From: Lareine Khawaly <lareine@amazon.com>
>>
>> In functions i2c_dw_scl_lcnt() and i2c_dw_scl_hcnt() may have overflow
>> by depending on the values of the given parameters including the ic_clk.
>> For example in our use case where ic_clk is larger than one million,
>> multiplication of ic_clk * 4700 will result in 32 bit overflow.
>>
>> Add cast of u64 to the calculation to avoid multiplication overflow, and
>> use the corresponding define for divide.
> 
> Perfect, thank you!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
