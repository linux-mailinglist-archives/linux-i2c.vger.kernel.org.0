Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0B14652523
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 18:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbiLTRIE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 12:08:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiLTRID (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 12:08:03 -0500
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECE61DD;
        Tue, 20 Dec 2022 09:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671556082; x=1703092082;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=CJcRN8lmItUCYsoEzHAUyMmtBD/aumhVmGcaTarBcCc=;
  b=leVA0STCj/zvqC28N3YX6eYBbW5a4rbejIcX+T/VvTsJR2ImwIsjSRUU
   IXJ9SdynViLYzXfvTaIuaX/Ud/OziDuvUraYujWJPT5Ax/713WVFlEwxd
   lIgkSocTZi6hgThD2RNv0QKZRBPsPtW8JwZqmkPUnm/UJ71BANoKgoPfT
   o=;
X-IronPort-AV: E=Sophos;i="5.96,259,1665446400"; 
   d="scan'208";a="279159272"
Subject: Re: [PATCH v3 1/1] i2c: Set pinctrl recovery info to device pinctrl
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-a893d89c.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 17:07:58 +0000
Received: from EX13MTAUWA002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2b-m6i4x-a893d89c.us-west-2.amazon.com (Postfix) with ESMTPS id EC0C34163D;
        Tue, 20 Dec 2022 17:07:56 +0000 (UTC)
Received: from EX19D021UWA004.ant.amazon.com (10.13.139.67) by
 EX13MTAUWA002.ant.amazon.com (10.43.160.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Tue, 20 Dec 2022 17:07:56 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D021UWA004.ant.amazon.com (10.13.139.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Tue, 20 Dec 2022 17:07:56 +0000
Received: from [192.168.1.158] (10.1.213.27) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Tue, 20 Dec 2022 17:07:52 +0000
Message-ID: <4344f575-65f5-2fde-e2d5-3dd5a18d13cb@amazon.com>
Date:   Tue, 20 Dec 2022 19:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@kernel.org>, <linus.walleij@linaro.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <dwmw@amazon.co.uk>,
        <benh@amazon.com>, <ronenk@amazon.com>, <talel@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <farbere@amazon.com>,
        <itamark@amazon.com>
References: <20221219193228.35078-1-hhhawa@amazon.com>
 <Y6GUKf5TCumM1Swy@smile.fi.intel.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <Y6GUKf5TCumM1Swy@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-13.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/20/2022 12:53 PM, Andy Shevchenko wrote:
>> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> > The same comment about changelog. Place it in the correct position.

Will be fixed.

> 
>> Change Log v2->v3:
>> - Add API to get the device pinctrl
>> - Make the i2c init recovery to get the device pins
>>
>> Change Log v1->v2:
>> - set the rinfo->pinctrl to dev->pins->p instead calling
>>    devm_pinctrl_get()
>> ---
> 
>>   include/linux/pinctrl/devinfo.h | 11 +++++++++++
> 
> This should be a separate patch.

Sure, will move and create cover letter with the change log.

> 
> ...
> 
>> +static inline struct pinctrl *dev_pinctrl(struct device *dev)
>> +{
>> +     return dev->pins && dev->pins->p ? dev->pins->p : NULL;
> 
> GCC supports Elvis, you can use it to simplify the above.

How you suggest to simplify this?
I can use 'return dev->pins ? dev->pins->p ?: dev->pins->p : NULL;'

> 
>> +}
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 
