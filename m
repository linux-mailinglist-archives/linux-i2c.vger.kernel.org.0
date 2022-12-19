Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A69651359
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 20:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbiLSTgP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 14:36:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbiLSTgA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 14:36:00 -0500
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com [207.171.188.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA26B33;
        Mon, 19 Dec 2022 11:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671478555; x=1703014555;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=iIM+QNtkCiYNEuAmFEEQ7eyvDejEK9bsnMBFMWQMDzU=;
  b=CmqM8hFteq3HdySkzipcoH5nt8YqTScrRq0V7E1dqyU+/KVWeh8ou+Vu
   70LfNwjY50m9agU4ZlAmNV4LCTjs40ezmr69q5NcpuBC6Rb8cukTFBKRs
   Zt9AVuByGlldWvuFdkDJLC1WnMadbxOWoWUA0CT0GNvfLL8Wdtr9lnYRd
   4=;
X-IronPort-AV: E=Sophos;i="5.96,257,1665446400"; 
   d="scan'208";a="1085009297"
Subject: Re: [PATCH v2 1/1] i2c: designware: set pinctrl recovery information from
 device pinctrl
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-a893d89c.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9103.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 19:35:47 +0000
Received: from EX13MTAUEE002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2b-m6i4x-a893d89c.us-west-2.amazon.com (Postfix) with ESMTPS id 6F453416D0;
        Mon, 19 Dec 2022 19:35:42 +0000 (UTC)
Received: from EX19D008UEC001.ant.amazon.com (10.252.135.232) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Mon, 19 Dec 2022 19:35:41 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX19D008UEC001.ant.amazon.com (10.252.135.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20;
 Mon, 19 Dec 2022 19:35:41 +0000
Received: from [192.168.11.202] (10.1.212.6) by mail-relay.amazon.com
 (10.43.62.224) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Mon, 19 Dec 2022 19:35:38 +0000
Message-ID: <d60e9cb7-a162-0b49-cd21-33c622ae0e58@amazon.com>
Date:   Mon, 19 Dec 2022 21:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <jarkko.nikula@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dwmw@amazon.co.uk>,
        <benh@amazon.com>, <ronenk@amazon.com>, <talel@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <farbere@amazon.com>,
        <itamark@amazon.com>
References: <20221214142725.23881-1-hhhawa@amazon.com>
 <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
 <efa9171f-98ac-f518-e59e-f6c4d7d3d4e6@amazon.com>
 <Y5r2pZhe17dVBMme@smile.fi.intel.com>
 <1408bbef-10e3-f76b-b66d-b95e84748e18@amazon.com>
 <Y5yE0SsfGrwaB5zA@smile.fi.intel.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <Y5yE0SsfGrwaB5zA@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-10.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/16/2022 4:46 PM, Andy Shevchenko wrote:
> Can be simplified with help of Elvis:
> 
>          p = bri->pinctrl ?: dev_pinctrl(dev->parent);

Can't use this, as need to set the bri->pinctrl to dev_pinctrl() in case 
it's not set by the driver.

>> I based my CC/TO on get_maintainer.pl script. Will make sure that Wolfram on
>> CC next time.
> All the same about Linus W., who is pin control subsystem maintainer, and be
> sure the respective mailing lists are also included.

Sure, thanks

Thanks,
Hanna
