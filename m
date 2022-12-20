Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E5E652717
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 20:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbiLTTdb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 14:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234001AbiLTTcy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 14:32:54 -0500
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4665C2AE2;
        Tue, 20 Dec 2022 11:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671564742; x=1703100742;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=XLm7cNL3POipI7HaTToaL7zsWVQbDAv5oCT+Dy2vuxc=;
  b=I3Ewi1c0gz+jy+rBpp3Xx0WEsMJhiRz6cifpWjzsVvS7W+/GmTBkAONF
   ZYP4Or3PFyEAoF0mnoxoIcN3DtbDV25JfMgELJ0T8dXM1gXx3uY4sMgN2
   3jaxeHODu7IZ8vzA7L8L9EgQCUj8coD0h2oHbKIF+p6mZCjuC61udxmRV
   g=;
X-IronPort-AV: E=Sophos;i="5.96,259,1665446400"; 
   d="scan'208";a="275441227"
Subject: Re: [PATCH v3 1/1] i2c: Set pinctrl recovery info to device pinctrl
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-189d700f.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 19:32:18 +0000
Received: from EX13MTAUWA002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-pdx-2b-m6i4x-189d700f.us-west-2.amazon.com (Postfix) with ESMTPS id 93BFF41713;
        Tue, 20 Dec 2022 19:32:16 +0000 (UTC)
Received: from EX19D021UWA004.ant.amazon.com (10.13.139.67) by
 EX13MTAUWA002.ant.amazon.com (10.43.160.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Tue, 20 Dec 2022 19:32:16 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D021UWA004.ant.amazon.com (10.13.139.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Tue, 20 Dec 2022 19:32:16 +0000
Received: from [192.168.1.158] (10.1.213.27) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Tue, 20 Dec 2022 19:32:12 +0000
Message-ID: <a82ba757-3b9c-d54b-76bf-ceef84239295@amazon.com>
Date:   Tue, 20 Dec 2022 21:32:11 +0200
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
 <4344f575-65f5-2fde-e2d5-3dd5a18d13cb@amazon.com>
 <Y6IKit5XMcSLBgpO@smile.fi.intel.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <Y6IKit5XMcSLBgpO@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-13.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/20/2022 9:18 PM, Andy Shevchenko wrote:
>> How you suggest to simplify this?
> Using Elvis operator, which is ?:.

Are you refer to use 'return dev->pins && dev->pins->p ?: NULL;' ?
Can't use Elvis operator in this way, because it will return the result 
of 'dev->pins && dev->pins->p' and not the value of 'dev->pins->p'

> 
>> I can use 'return dev->pins ? dev->pins->p ?: dev->pins->p : NULL;'
> Have you even try to compile this?
Yup, the code compiled, but i think the first suggestion is more readable.

> 

