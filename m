Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15E8A64DCD9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 15:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiLOOZg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 09:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiLOOZg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 09:25:36 -0500
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F212A271;
        Thu, 15 Dec 2022 06:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671114336; x=1702650336;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=fB0YJoTNZ13u7b2pqa9Vd0vWw8xXi7NcxGaEYks4tfA=;
  b=gKIoJFpcY80ieHrgK6Ur86U8vYFs6i0G4lMGVecIwJUxkTW9HNaqYNPU
   S5y5+eVHy71qOAn5BKTfh+GqVGVnC0p14L9hKpNBI8WHv9AhjnpYRP9bW
   52oQUoO44Gm27E7K9Tl25ulDT6fd91IDNiuE/pPyvmu50WtNiZPjQcXuG
   0=;
X-IronPort-AV: E=Sophos;i="5.96,247,1665446400"; 
   d="scan'208";a="161790187"
Subject: Re: [PATCH v2 1/1] i2c: designware: set pinctrl recovery information from
 device pinctrl
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 14:25:33 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-iad-1e-m6i4x-6e7a78d7.us-east-1.amazon.com (Postfix) with ESMTPS id CAAE78224C;
        Thu, 15 Dec 2022 14:25:29 +0000 (UTC)
Received: from EX19D013UWB003.ant.amazon.com (10.13.138.111) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Thu, 15 Dec 2022 14:25:29 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX19D013UWB003.ant.amazon.com (10.13.138.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20;
 Thu, 15 Dec 2022 14:25:29 +0000
Received: from [192.168.110.120] (10.85.143.173) by mail-relay.amazon.com
 (10.43.161.249) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Thu, 15 Dec 2022 14:25:24 +0000
Message-ID: <9a31329e-ca83-84de-7958-4c795c2ccda6@amazon.com>
Date:   Thu, 15 Dec 2022 16:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>
References: <20221214142725.23881-1-hhhawa@amazon.com>
 <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
 <efa9171f-98ac-f518-e59e-f6c4d7d3d4e6@amazon.com>
 <Y5r2pZhe17dVBMme@smile.fi.intel.com>
 <CACRpkdbawj+Wg2D75MdZavcfyjRa2JRAvqROnNLVH7oMcZTdMg@mail.gmail.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <CACRpkdbawj+Wg2D75MdZavcfyjRa2JRAvqROnNLVH7oMcZTdMg@mail.gmail.com>
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



On 12/15/2022 4:06 PM, Linus Walleij wrote:
>> Getter with a stub sounds better to me, so you won't access some device core
>> fields.
>>
>> Linus, what do you think about all these (including previous paragraph)?
> A getter may be a good solution, it depends, it can also be pushed
> somewhere local in the designware i2c driver can it not?
> I am thinking that the rest of the code that is using that field is
> certainly not going to work without pinctrl either.

the compilation failure occurs on platform which not define the 
CONFIG_PINCTRL , most of the pinctrl APIs are wrapped with PINCTRL 
config, for example pinctrl_select_state() or devm_pinctrl_get().

In addition if we add the getter in pinctrl/devinfo.h other drivers may 
access the pins field without re-call devm_pinctrl_get().

Thanks,
Hanna
