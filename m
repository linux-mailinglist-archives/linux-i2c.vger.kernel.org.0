Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC4D664CB7C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 14:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238283AbiLNNnn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 08:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiLNNnm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 08:43:42 -0500
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3719B26AB2;
        Wed, 14 Dec 2022 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671025420; x=1702561420;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=j49w88zeX80I/lhexMJ1SYcBIfI9xA/ghlBvzz4brOs=;
  b=DdIBDmwNAmKKno/3VsmnJ6z5htnd3HMVqp0kO5AFryFkkjan3AdjHgdk
   wAL275Ifw5OSqC3u5wT2wCESFA1eJJUmJjk6526cxfUWLM7Y9HVdVRe4/
   w0i6SaWAibs5t/bQve+ExnqfYob5vGUJjV2NZS07Q6Jec0cLUm+MWTjRc
   8=;
X-IronPort-AV: E=Sophos;i="5.96,244,1665446400"; 
   d="scan'208";a="290469028"
Subject: Re: [PATCH 1/1] i2c: designware: add pinctrl for recovery info as an option
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-f323d91c.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 13:43:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2b-m6i4x-f323d91c.us-west-2.amazon.com (Postfix) with ESMTPS id 07414416D6;
        Wed, 14 Dec 2022 13:43:32 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 14 Dec 2022 13:43:32 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20;
 Wed, 14 Dec 2022 13:43:32 +0000
Received: from [10.95.76.42] (10.95.76.42) by mail-relay.amazon.com
 (10.43.60.234) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Wed, 14 Dec 2022 13:43:29 +0000
Message-ID: <806e1787-1f6d-7551-52fd-2e1e25aebaef@amazon.com>
Date:   Wed, 14 Dec 2022 15:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dwmw@amazon.co.uk>,
        <benh@amazon.com>, <ronenk@amazon.com>, <talel@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <farbere@amazon.com>,
        <itamark@amazon.com>
References: <20221214102707.60018-1-hhhawa@amazon.com>
 <Y5m2nux5Q1npXAo+@smile.fi.intel.com>
Content-Language: en-US
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <Y5m2nux5Q1npXAo+@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/14/2022 1:42 PM, Andy Shevchenko wrote:
> Can you explain, why pinctrl_bind_pins() is not enough?
> 
> (You may also refer to the ab78029ecc34 ("drivers/pinctrl: grab default handles
>   from device core") for more details.)

Thanks for your reviewing and pointing to this function.

No need to recall the devm_pinctrl_get() during the i2c probe, as the 
pinctrl_bind_pins() is enough to init the pinctrl struct. But still need 
to set the rinfo->pinctrl with dev->pins->p, will upload new patchset.

The change will look like:

@@ -832,6 +833,9 @@ static int i2c_dw_init_recovery_info(struct 
dw_i2c_dev *dev)
         struct i2c_adapter *adap = &dev->adapter;
         struct gpio_desc *gpio;

+       if (dev->dev->pins && dev->dev->pins->p)
+               rinfo->pinctrl = dev->dev->pins->p;
+
         gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
         if (IS_ERR_OR_NULL(gpio))
                 return PTR_ERR_OR_ZERO(gpio);

Thanks,
Hanna
