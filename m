Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D02E3F9633
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Aug 2021 10:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244600AbhH0IfG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Aug 2021 04:35:06 -0400
Received: from mail-mw2nam08on2080.outbound.protection.outlook.com ([40.107.101.80]:61857
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244610AbhH0IfE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 27 Aug 2021 04:35:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZFPqJz4ik3k88suOhI/XxeSh4b/3W5Xx7PpQJcCI271ijQedvEhqRHRsBa6V5JdkSdhSD43Yz6fppCigEEFebpgFtoK21Ux2EaH5BRar+DYCWJPycb4Sa+zSPIkhx61FTqdLxNHOSJAWGB38iE+4n0Q21b/GpGB5Yq8T/lOaMMPR4M9z9AbSraiGJRN9nA74IhomUtPGSG/s0PUpAEv8B7kwVVL5hCSIwJdS5vL+z2nhd+c7yfJkLKNe4eogTagoEaWF7V/jP5KIIC1GMItBXu79sMb5Z+PhldGJJ25SKChY9t9NPJ70LvVh8rzxNSEboYtQEfl6fETENnU99F3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlILFzi3NexGZC2vqUOkeLVz1nwoB+eMJ23GY3REwgY=;
 b=QPzRaVHGWRGFgaoKliGQK8oTuqS9921kCUaqt+Zx2kev9T22O56rGh8+BSz0Qh3vl0Bt1LC6ctskS8s1ONteHBekdhxTmDgJpNfZJjadXgjGHFT3XTevLOfmjzYwXbCGHGpxF1N8/AEBC8hvMmO01RaVbLTK8l9rvswqX2mMjZVZjj5vjNxK7p5miM5YiAIyFfVj/iTEAO/lm0gt6Dtp9jpMynPum6Pxw7h8Fvjncft1TCDtzIB9PPOUx1gIUixnwQK53fXGF8rIWDjd16nH4clTsS3yQk7ITgVfAyF2hBG3wePk3D3kHZP0QwTJteNAVnm5fHWY9GyfQQamGgDCXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=the-dreams.de smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlILFzi3NexGZC2vqUOkeLVz1nwoB+eMJ23GY3REwgY=;
 b=tCHe2Nn691tHPS+JCX/CDdZedzUztY677PCb+649cMN84vXtaxNzcQMch94ssKepQAccZJe8se75JHn81PHpqXy7KKTQnY8ygFDATERKqJUxHpiCK/QpnCwPH5Y1tzoEiEapcaLkASU5tMpGgnaZV+IkBmCM1IjCGTt+6NIYA4c=
Received: from BN6PR16CA0027.namprd16.prod.outlook.com (2603:10b6:405:14::13)
 by BN7PR02MB5011.namprd02.prod.outlook.com (2603:10b6:408:2e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Fri, 27 Aug
 2021 08:34:12 +0000
Received: from BN1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::ee) by BN6PR16CA0027.outlook.office365.com
 (2603:10b6:405:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 08:34:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT063.mail.protection.outlook.com (10.13.2.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 08:34:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 27 Aug 2021 01:34:10 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 27 Aug 2021 01:34:10 -0700
Envelope-to: wsa@the-dreams.de,
 linux-i2c@vger.kernel.org,
 marex@denx.de
Received: from [172.30.17.109] (port=60070)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mJXJS-000B3x-JN; Fri, 27 Aug 2021 01:34:10 -0700
Subject: Re: [PATCH v2 0/6] i2c: xiic: Fix broken locking
To:     Raviteja Narayanam <rna@xilinx.com>, Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Shubhrajyoti Datta <shubhraj@xilinx.com>
References: <20210823214145.295104-1-marex@denx.de>
 <ee2f1e22-2069-308d-2a18-c59fd14387ac@xilinx.com>
 <SN6PR02MB40934151B394A0F656E96B98CAC89@SN6PR02MB4093.namprd02.prod.outlook.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <7a17c847-397d-b106-df95-2bac11d65e2c@xilinx.com>
Date:   Fri, 27 Aug 2021 10:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB40934151B394A0F656E96B98CAC89@SN6PR02MB4093.namprd02.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20a06d37-faca-45f3-e510-08d969357223
X-MS-TrafficTypeDiagnostic: BN7PR02MB5011:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5011B04A0345C8D0FD6048F3C6C89@BN7PR02MB5011.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p0pZKJhfji+X3FjKRsPMpY1mI2VrZwG17YE6epk7k2Umr0pPac2v6b9Ka2icSol3WP5FFvVu4H3GYsrvHdbsdx8ba33es7aVYphE5C8EwUyFDl83XzaRKq43duA0bXP2eSzMuKS1UEHGQJ4Md5ZmY7sjhwf/FrlLR2+LqMhUwCJqHw/OWWB1pr/khEzBO3HTTaZnikibWxpvGHa6s8kS8Sd9W9qYobit8tRhOYMyTcxAQWtQ1WESlAj6p4l9iFU98JPd4kl++plwcsaUrt1+LvD6rxzXe94ySaTU9h03UPwrx2M5ORAXzxjLqK/rRTZDdRfM8P3UrJtayKMEzqP+NSNOCadfANCWK9EI1/G4njETIFAv/PWb5g4BjhHU3piaQJtdYM3KhxUqyxFyuMQxRRSFiBImOFOfBf2caF06Vv1S9vFbxUWOOp9+q5P4AeGt5TEXvkCdmEEbFLq2ZgES8r6mcp/mccN9QwBlKsNXz5oU29yzB4xssh88sELn9kXIv7OjL91n37mEhPbxIK3P+bNpFe6lZAmYOTKqT/dsVGeQ/jNrq32Nu53Zs+TbtzWak+w7OMePEdWjZh4cw0LHa2yQeu5rMGptX/XbI+PKp5zFTmmJts1nFfiPx1X0LAi/8rMqtxAcglxDjyKic2p5W/F4nv/yCbE8RWfyS+N9PYHRFNrwhSN3AaxBgxe7GgJQ44GWImmy80E52Wunq7UMGfFuN8x1E5S4SbCOk0Sy9kIL15NUwOPtYP42HP8DkIMTE04f/7kT7WkcbfytcY+QLw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(31686004)(8676002)(316002)(8936002)(4326008)(186003)(107886003)(5660300002)(9786002)(2906002)(110136005)(44832011)(2616005)(336012)(26005)(36906005)(31696002)(36756003)(7636003)(508600001)(36860700001)(356005)(53546011)(426003)(70206006)(47076005)(70586007)(82310400003)(83380400001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 08:34:11.7454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a06d37-faca-45f3-e510-08d969357223
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5011
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/27/21 10:31 AM, Raviteja Narayanam wrote:
> 
> 
>> -----Original Message-----
>> From: Michal Simek <michal.simek@xilinx.com>
>> Sent: Tuesday, August 24, 2021 12:29 PM
>> To: Marek Vasut <marex@denx.de>; linux-i2c@vger.kernel.org; Raviteja
>> Narayanam <rna@xilinx.com>
>> Cc: Michal Simek <michals@xilinx.com>; Shubhrajyoti Datta
>> <shubhraj@xilinx.com>; Wolfram Sang <wsa@kernel.org>
>> Subject: Re: [PATCH v2 0/6] i2c: xiic: Fix broken locking
>>
>> +ravi
>>
>> On 8/23/21 11:41 PM, Marek Vasut wrote:
>>> Booting ZynqMP with XIIC I2C driver shows multitude of race conditions
>>> in the XIIC driver. This is because locking is completely missing from
>>> the driver, and there are odd corner cases where the hardware behaves
>>> strangely.
>>>
>>> Most of these races could be triggered easily when booting on SMP
>>> machines, like the ZynqMP which has up to 4 cores. It is sufficient
>>> for the interrupt handler to run on another core than xiic_start_xfer
>>> and the driver fails completely.
>>>
>>> This does not add support for long transfers, this only fixes the
>>> driver to be usable at all instead of being completely broken.
>>>
>>> The V2 fixes a few remaining details which cropped up in deployment
>>> over the last year or so, so I believe the result should be reasonably
>>> well tested.
> 
> Thanks a lot for the patches, Marek. 
> I have tested these on our boards and they are working fine. 
> 
> I will rebase my patch series on top of this and send after rc1. 

Wolfram: Can you please merge this series? Ravi's series will come on
the top of this one.

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

