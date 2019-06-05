Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E90935CC8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 14:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbfFEM1Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 08:27:25 -0400
Received: from mail-eopbgr820087.outbound.protection.outlook.com ([40.107.82.87]:61366
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727273AbfFEM1Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jun 2019 08:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTzsgvddTaMa6DaEvlBoHTLOG5aJ0YdahiPzZwA0QU4=;
 b=VNXaheX2Lor0A/DpQ255y8vLuedoc7LMFp39h0LKAitRhEOmNx8ywN0ASPYW/G2Q5jDMl2a0DEHx5D1izNxzzAA7IomAUGOXj7sEISTe9dGgirXRLg9PoKCC5c8v1ut14PO1EVAISmLK1Q4JZ4OLaq/Al3lBnk33Y3EWReecQuw=
Received: from MN2PR02CA0033.namprd02.prod.outlook.com (2603:10b6:208:fc::46)
 by DM6PR02MB6233.namprd02.prod.outlook.com (2603:10b6:5:1d1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Wed, 5 Jun
 2019 12:27:23 +0000
Received: from CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by MN2PR02CA0033.outlook.office365.com
 (2603:10b6:208:fc::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.18 via Frontend
 Transport; Wed, 5 Jun 2019 12:27:23 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; sedsystems.ca; dkim=none (message not signed)
 header.d=none;sedsystems.ca; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT049.mail.protection.outlook.com (10.152.75.83) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1965.12
 via Frontend Transport; Wed, 5 Jun 2019 12:27:22 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hYV0k-0000a0-0R; Wed, 05 Jun 2019 05:27:22 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hYV0e-0002e1-TU; Wed, 05 Jun 2019 05:27:16 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x55CRA9s021074;
        Wed, 5 Jun 2019 05:27:10 -0700
Received: from [172.30.17.116]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1hYV0Y-0002dI-82; Wed, 05 Jun 2019 05:27:10 -0700
Subject: Re: [PATCH] i2c: xiic: Add max_read_len quirk
To:     Robert Hancock <hancock@sedsystems.ca>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-i2c@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhraj@xilinx.com>
References: <1559604825-23517-1-git-send-email-hancock@sedsystems.ca>
 <abfb762f-115a-7607-f228-923db07f551e@xilinx.com>
 <61a08c7a-ec0e-0555-f42b-d5360ddd7f2e@sedsystems.ca>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <4894a865-52a6-c129-fdc4-912f8b38802d@xilinx.com>
Date:   Wed, 5 Jun 2019 14:27:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <61a08c7a-ec0e-0555-f42b-d5360ddd7f2e@sedsystems.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(199004)(189003)(9786002)(426003)(2486003)(4326008)(76176011)(52146003)(23676004)(44832011)(106002)(6246003)(229853002)(36756003)(476003)(81166006)(81156014)(8676002)(356004)(77096007)(107886003)(316002)(31686004)(53546011)(126002)(31696002)(2616005)(8936002)(336012)(63266004)(186003)(36386004)(58126008)(110136005)(230700001)(305945005)(486006)(478600001)(65826007)(70586007)(70206006)(11346002)(5660300002)(47776003)(2906002)(64126003)(50466002)(65956001)(65806001)(446003)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB6233;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 864cdc5c-a086-421c-1359-08d6e9b12905
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:DM6PR02MB6233;
X-MS-TrafficTypeDiagnostic: DM6PR02MB6233:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB6233B1AC0E21B5F0ED73ACB2C6160@DM6PR02MB6233.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 00594E8DBA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ryYiOcT3mVgOeAlPsf5dEWACLmVf474uov74cX/7VjG0dc8Jo+B3rymdvl9irnlPuEoDJXq9ogNmYBR3vWTPgIVHzGssM4yeLdrNzlfmKDAydVRWwsoAN+mewRucSFDlYZ3b2TO+ZCroVwq3h3lTgdVKcOdc/T61CdhLQ06H3Mc9B024RTJKyR6dv30s3QeSTkj6yP3a/+YOz+cthCCVZm4GnbaMTAgn70b/IdcG9qWLuTZ6z0JUpFI5YTmswsQekzOgf6RQH+1LFcAsApVdWRBcMEtsA+lvVzmg95p/Bb3T4MrnPggyxzhyhZ0P/WvbIuuMYgKuzg9eEd7lSbQolReXv0iLpzFR9dC55gRVTaXmDAofRtXzjVM/a3MsumFC03o/DDmkkZoPqd2ptZ3BCTRuj1b/GrOEt15GKpomUqE=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2019 12:27:22.4504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 864cdc5c-a086-421c-1359-08d6e9b12905
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6233
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04. 06. 19 17:41, Robert Hancock wrote:
> On 2019-06-04 12:22 a.m., Michal Simek wrote:
>> +Shubhrajyoti,
>>
>> On 04. 06. 19 1:33, Robert Hancock wrote:
>>> This driver does not support reading more than 255 bytes at once because
>>> the register for storing the number of bytes to read is only 8 bits. Add
>>> a max_read_len quirk to enforce this.
>>
>> How did you find it out?
>> Any particular issue you have had that you were looking for a solution?
>>
>> I think there is more things behind which should be described in commit
>> message.
> 
> We ran into this issue with the SFP driver which attempted to read 256
> bytes at once from the I2C device. It seems like this caused the driver
> and/or logic to get into an invalid state because it treated the number
> of bytes to read as 0. Rejecting the unsupported transfer at least makes
> it easier to debug what is going on.
> 
> I can respin with that in the commit message if it seems relevant.

Yes please will be good to have this in commit message.

Thanks,
Michal

