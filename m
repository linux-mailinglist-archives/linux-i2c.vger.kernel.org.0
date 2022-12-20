Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC2E652499
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 17:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiLTQ0S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 11:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiLTQ0R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 11:26:17 -0500
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAA620F;
        Tue, 20 Dec 2022 08:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671553577; x=1703089577;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=nAWCvvThSyACoXOhd7zz/i3FNA10KAOXnjZzrQOuOKE=;
  b=W9Za0nCHV9B9L+ZTpFQzxT2a+oQvlQM1wmFh669ltB3VpplL1Aw6uogo
   HxpoNpoqcuWjV+tN+huq5V8PQ2KYx6Cr1bSgJQVvoIimuH+0MgNuCM6MT
   O+M4MK9NwlgSrDvY1KRBYvyhwH0HemnSP5rmKU5z1usqj8oQ3JMyP55UG
   w=;
X-IronPort-AV: E=Sophos;i="5.96,259,1665446400"; 
   d="scan'208";a="163430472"
Subject: Re: [PATCH v3 1/1] i2c: designware: use casting of u64 in clock
 multiplication to avoid overflow
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-32fb4f1a.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 16:26:14 +0000
Received: from EX13MTAUWA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2b-m6i4x-32fb4f1a.us-west-2.amazon.com (Postfix) with ESMTPS id 9439EC366F;
        Tue, 20 Dec 2022 16:26:11 +0000 (UTC)
Received: from EX19D021UWA001.ant.amazon.com (10.13.139.24) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Tue, 20 Dec 2022 16:26:11 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D021UWA001.ant.amazon.com (10.13.139.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Tue, 20 Dec 2022 16:26:10 +0000
Received: from [192.168.1.158] (10.1.213.27) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Tue, 20 Dec 2022 16:26:06 +0000
Message-ID: <c5f79b8c-a93c-d17f-3d4f-006bd4bad249@amazon.com>
Date:   Tue, 20 Dec 2022 18:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>, <lareine@amazon.com>
References: <20221219171713.10108-1-hhhawa@amazon.com>
 <Y6GSt8AOS1nsN0dn@smile.fi.intel.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <Y6GSt8AOS1nsN0dn@smile.fi.intel.com>
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



On 12/20/2022 12:47 PM, Andy Shevchenko wrote:
>> Fixes: 2373f6b9744d ("i2c-designware: split of i2c-designware.c into core and bus specific parts")
> It's not clear if the second patch you sent (about unsigned long --> u32) is
> required or not, can you clarify this in the changelog?
> 

Sure will add to the changelog, it's not required to have the second 
change to avoid the overflow.

>> Signed-off-by: Lareine Khawaly<lareine@amazon.com>
>> Signed-off-by: Hanna Hawa<hhhawa@amazon.com>
> This should be last part of the message body. The cutter '---' line makes it
> so, currently you finish your message with a changelog and not tags. So, you
> need to move the changelog after the cutter line.

Thanks for the info. will update.

> 
>> Change Log v2->v3:
.
.
>> -             return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + offset;
>> +             return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL,
>> +                                          MICRO) - 8 + offset;
> There is still a room for 'MICRO) -' part on the previous line.
> Ditto for the similar cases.

Ack will be fixed

