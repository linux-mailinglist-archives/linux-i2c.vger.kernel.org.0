Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1B1A727A79
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 10:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbjFHIv7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 04:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbjFHIvV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 04:51:21 -0400
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD8D2D46
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jun 2023 01:50:51 -0700 (PDT)
X-ASG-Debug-ID: 1686214248-1eb14e2b470b140001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id oomv7PARMZERp71L (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 08 Jun 2023 16:50:48 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 8 Jun
 2023 16:50:48 +0800
Received: from [10.28.66.68] (10.28.66.68) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 8 Jun
 2023 16:50:47 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <1af84fbc-4b44-54c7-8509-0775a7962472@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.28.66.68
Date:   Thu, 8 Jun 2023 16:50:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
To:     Krzysztof Kozlowski <krzk@kernel.org>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
CC:     <cobechen@zhaoxin.com>, <TonyWWang@zhaoxin.com>
References: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
 <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>
 <87c0be06-0ac4-5d34-671c-5668739bdb8b@zhaoxin.com>
 <e5ecb4ca-f56a-b0cd-cd17-eff0277dfd14@kernel.org>
Content-Language: en-US
Reply-To: <e5ecb4ca-f56a-b0cd-cd17-eff0277dfd14@kernel.org>
From:   Hans Hu <HansHu-oc@zhaoxin.com>
In-Reply-To: <e5ecb4ca-f56a-b0cd-cd17-eff0277dfd14@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.66.68]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1686214248
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1019
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0004 1.0000 -2.0186
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.109761
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,


On 2023/6/8 14:37, Krzysztof Kozlowski wrote:
> On 07/06/2023 14:33, Hans Hu wrote:
>
>>>> +
>>>> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
>>>> +	if (IS_ERR(i2c)) {
>>>> +		return dev_err_probe(&pdev->dev, -ENOMEM,
>>>> +				"devm_kzalloc failed\n");
>>> Don't print ENOMEM.
>>
>> will change to just return -ENOMEM;
>>
>>
>>> Run:
>>> 1. Checkpatch
>>> 2. Coccinelle
>>> to fix trivial issues.
>>
>> I used the checkpatch in different versions of the kernel, and there were
>> no errors, just a warning about the modify MAINTAINERS, will modify it.
> You did not run Coccinelle/coccicheck, so you have trivial issues in the
> code. There is no need for us to manually review something which tools
> point out.
>
> Please run Coccinelle/coccicheck and fix all errors.


I installed coccinelle/sparse that checked out some errors and warnings,
and these trivial issues will be fixed in patch v4.

Thank you,
Hans


> Best regards,
> Krzysztof
>
