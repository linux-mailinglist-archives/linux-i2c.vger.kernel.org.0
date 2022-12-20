Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDC46525B1
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 18:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiLTRnY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 12:43:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiLTRnW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 12:43:22 -0500
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0687713E02;
        Tue, 20 Dec 2022 09:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671558201; x=1703094201;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=BjCnO8PguhLLexezTYpS2G/8ZfeJQxMhcmZDfzryvbQ=;
  b=Q+GrDnkAHxDbkwEedDodvEB5m1sN7isG51LM7nn2bsurNhXFc0UKyJ6M
   Jyo/F2hWIDBCmwwMzptm7bKuOx20Unt0d5UAv0sWvTZXXpcO97IsiB26U
   8t4VtmfrgFonNHngX+TV+T/GwXkahX89SR/VxTLCeBrclqMuL9kbrr770
   k=;
X-IronPort-AV: E=Sophos;i="5.96,259,1665446400"; 
   d="scan'208";a="292572513"
Subject: Re: [PATCH v4 1/1] i2c: designware: use casting of u64 in clock
 multiplication to avoid overflow
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-44b6fc51.us-west-2.amazon.com) ([10.25.36.210])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 17:43:15 +0000
Received: from EX13MTAUWA001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2a-m6i4x-44b6fc51.us-west-2.amazon.com (Postfix) with ESMTPS id 12D8BA357A;
        Tue, 20 Dec 2022 17:43:15 +0000 (UTC)
Received: from EX19D021UWA002.ant.amazon.com (10.13.139.48) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Tue, 20 Dec 2022 17:43:14 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D021UWA002.ant.amazon.com (10.13.139.48) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Tue, 20 Dec 2022 17:43:14 +0000
Received: from [192.168.1.158] (10.1.213.27) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Tue, 20 Dec 2022 17:43:07 +0000
Message-ID: <cc16a489-f711-0c54-8576-ef7974b3cb79@amazon.com>
Date:   Tue, 20 Dec 2022 19:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <linus.walleij@linaro.org>, <ben-linux@fluff.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>,
        Lareine Khawaly <lareine@amazon.com>
References: <20221220164806.77576-1-hhhawa@amazon.com>
 <Y6Hs1xwB45K3Ufb8@smile.fi.intel.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <Y6Hs1xwB45K3Ufb8@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-11.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/20/2022 7:11 PM, Andy Shevchenko wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On Tue, Dec 20, 2022 at 04:48:06PM +0000, Hanna Hawa wrote:
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
> ...
> 
>> -             return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + offset;
>> +             return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) - 8 +
>> +                     offset;
> 
> Broken indentation.
> 
> ...
> 
>> -             return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
>> +             return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf),
>> +                                          MICRO) - 3 + offset;
> 
> I would still go with 'MICRO) -' part to be on the previous line despite being
> over 80, this is logical split which increases readability.

Okay.. will move the 'MICRO) -' one line before
> 
>> -     return DIV_ROUND_CLOSEST(ic_clk * (tLOW + tf), MICRO) - 1 + offset;
>> +     return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) - 1 +
>> +             offset;
> 
> Broken indentation.

Why it's broken indentation? I'm asking to know for the next time. The 
word 'offset' is not part of DIV_ROUND_CLOSEST_ULL parentheses. In wrong 
indentation the checkpatch shout about it, but it didn't happen with the 
above.

Does the below the correct indentation?

--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -351,7 +351,8 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, 
int cond, int offset)
                  *
                  * If your hardware is free from tHD;STA issue, try 
this one.
                  */
-               return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + 
offset;
+               return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) -
+                                            8 + offset;
         else
                 /*
                  * Conditional expression:
@@ -367,7 +368,8 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, 
int cond, int offset)
                  * The reason why we need to take into account "tf" here,
                  * is the same as described in i2c_dw_scl_lcnt().
                  */
-               return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) 
- 3 + offset;
+               return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + 
tf), MICRO) -
+                                            3 + offset;
  }

  u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
@@ -383,7 +385,8 @@ u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, 
int offset)
          * account the fall time of SCL signal (tf).  Default tf value
          * should be 0.3 us, for safety.
          */
-       return DIV_ROUND_CLOSEST(ic_clk * (tLOW + tf), MICRO) - 1 + offset;
+       return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) -
+                                    1 + offset;
  }


> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 
