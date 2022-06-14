Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD0B54A9F2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 09:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239438AbiFNHBg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 03:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352810AbiFNHBe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 03:01:34 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D813B2AE
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 00:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5PZqj43Oa+oad/ziPZn8+3qoJxGdTRcsj4v5MpgknSW/nQBt+KdziUoAn1hrhSuFuisAddXLdYMjiTYdGtKqpgpgfY7aQaOQ/Oyp9YvIY3E6G9f+ubBiY6Wbb3RjGDt5RVVQfrKPMvUq8bI6dOtH6RbftATIJxAi/Ki8joP1yuHd2YiZ0U+MY0HeoL4twEF3u7Xm/8w0VhoHE3+nTDhBzFYxcV8bwliK+MYnl34+yzy3Y03oS433ItS9Gxk/Zv8xfFOuRGyo+cLagfZjTpH74A2/U35iZCwBOe8ES+BdXdzuPQyH6WfPZosJ30e+ka21Hkitl3zSyru23KcKPChIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6uqPC06YOVAi0wKzAXbRmX54XIqBqqDlwiW1CShCTw=;
 b=dgH+9y9qGgtw9xLBrZmzQDgjzQr1K4vGme+j5483emiEP7jE84baB7rCBzPxfTnwVFHvTcADOCFSmPuDWIbzMVxB03srIWBf3L05nikcXCc2Ef6oFobhmlkoZ5N9Q5vJJXStEBjNf2jnJGUTdxGsAsNVeOw0zyBJsvvY7RmpVQLJLWQLYr6j1LU3FGnpgUeLmnuKLXlAZh1gZrL0SCs2rye58Il2vfGYuF9ilJa6cAEj+wiZrZR25bB019aNfOwwqMn4iNBcXObIyTbXC8hkI1Ub2VzJ2aZLbwPVDpbjX7lTPEeeBSlnDjzi8jWQnacyeAN6QggjEPcqz7HYftFpMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6uqPC06YOVAi0wKzAXbRmX54XIqBqqDlwiW1CShCTw=;
 b=UwE8B57QTyPuBy9O03wpGLWnH3oFqjhp4gLfcvm8uNR2ziKfOV78EQtSMv0veNlC5KsKBw623H3a0rF1gEDqfyj5o3YAcWUW2WX49mdTWJ7LClsxybsX++5w+ww3FDUpM/FUF6qLIV8LXS2FPKGpPGY/oWOIdjf+YKloqgo9Bgo=
Received: from BN9P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::35)
 by SN6PR02MB5023.namprd02.prod.outlook.com (2603:10b6:805:78::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 07:01:31 +0000
Received: from BN1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::b) by BN9P220CA0030.outlook.office365.com
 (2603:10b6:408:13e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16 via Frontend
 Transport; Tue, 14 Jun 2022 07:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT021.mail.protection.outlook.com (10.13.2.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Tue, 14 Jun 2022 07:01:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Jun 2022 00:01:29 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Jun 2022 00:01:29 -0700
Envelope-to: git@xilinx.com,
 wsa@kernel.org,
 linux-i2c@vger.kernel.org,
 gregkh@linuxfoundation.org
Received: from [10.254.241.52] (port=47474)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1o10YK-0006f3-Uh; Tue, 14 Jun 2022 00:01:29 -0700
Message-ID: <36da7a53-9bb4-26ae-0ac5-1ebcdf0ac695@xilinx.com>
Date:   Tue, 14 Jun 2022 09:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>, <michal.simek@xilinx.com>,
        <git@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220613043002.28152-1-shubhrajyoti.datta@xilinx.com>
 <YqdPtexPiukMlUcG@shikoro>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <YqdPtexPiukMlUcG@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaf0d6cf-0545-4d3a-fd56-08da4dd3b61a
X-MS-TrafficTypeDiagnostic: SN6PR02MB5023:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB502325BD038E46AA72FE7BD8C6AA9@SN6PR02MB5023.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mh8kQITeSFJ2mghHK75u7oecDSH4nT5k61pkjUbO+oaTC56m+sI9a4jFA/yEloH+bTnblLE9t1DNHcWTDr5vQ7V7Zc9qvqGO+KDpf7sX+VQGT8s0DVXzr2wQFgsRybdIbxclc+833Ri/NH7XToovEaPNLsCn1BjFPLsaVhh/lA7NRuKwZ69U8OcB6ONnhEDsqXk+P2qO6UGjQWVSI3TypITV/xKJRztIYOHJObjFgvhpgfYtoqaAtOI88HzCDaamBYgnhjjZMdd9h6qMsYiaSqbF59yjPGedFLs4IPFCnPzOZERPXvGLtq90cWVT3zCWmSWpu1PPM3sZcDb/aKfbCh3CSgS/+ffeFgi/uTEyfNDp/BKy+TeNORp4Q+yK06HvSHTeXVsg6wgMa2ypz2gdADabFyaWBCGEpn9fcIKljTocgvwHfYsaO21Eg0X3QfLzZC7gyQUoMjtJnp8FLXQ7OZmiyFk3oPSzduDDfsYamnSbb1Ef5DyMMTsS29+niBRxVDoAQvYeQW5aDQ/XbFvXSdD4oY5DyDXQ0YlSiIdCG0/Z9ERMuM4dky/mrDAIqRLlKwBPD5Rd/MuMc7je71HeUaqBCoosNwFP86wHtRyTr0gW8+O29SfOpdCYeHxP5Btm0UMLsN4IMxMsW54H5l0QcaAAQjqWCQYCGD+ojP/6uDg3x4CVVUHj98tO7O897I/12M+iTTEI0lLyzGbvamMtLdRnwgdnuV1P2G+92/VJ7ZC3VVp3bw8NbbAzvYfHxejxluTwIZpTQgc2qRk/N4F8Drzy06Fw0ExbAgpftkQ4Q02Llki8yyMJs16OS1C+pVqf
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(336012)(426003)(47076005)(186003)(82310400005)(83380400001)(7636003)(356005)(40460700003)(36860700001)(2616005)(6666004)(53546011)(26005)(110136005)(316002)(508600001)(966005)(2906002)(4744005)(44832011)(70586007)(70206006)(8676002)(8936002)(5660300002)(9786002)(31696002)(31686004)(36756003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 07:01:31.3600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf0d6cf-0545-4d3a-fd56-08da4dd3b61a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5023
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 6/13/22 16:54, Wolfram Sang wrote:
> On Mon, Jun 13, 2022 at 10:00:02AM +0530, Shubhrajyoti Datta wrote:
>> Fix the coverity warning
>> mixed_enum_type: enumerated type mixed with another type
>>
>> We are passing an enum in the xiic_wakeup lets change
>> the function parameters to reflect that.
>>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> 
> What is the difference to the V2 you sent 4 days earlier?
> 
>>   enum xilinx_i2c_state {
>> -	STATE_DONE,
>> -	STATE_ERROR,
>> -	STATE_START
>> +	STATE_DONE = 0,
>> +	STATE_ERROR = 1,
>> +	STATE_START = 2
> 
> No need for initializers.

Actually this was recommended by Greg in one of our thread here.
https://lore.kernel.org/all/20200318125003.GA2727094@kroah.com/

That's why we started to initialize all values in enums in our code.
It shouldn't be really any problem to do so.

Thanks,
Michal
