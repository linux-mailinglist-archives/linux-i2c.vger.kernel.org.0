Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A72014A389
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2020 13:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730448AbgA0MLv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 07:11:51 -0500
Received: from mail-bn8nam11on2074.outbound.protection.outlook.com ([40.107.236.74]:6096
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730225AbgA0MLv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jan 2020 07:11:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvfLzPuEbANJAWdG2z2ywkPllIBdRRAlLSqVEPbytggWVR41eiA01F2Cnw+HNhFXm6gXJwcgI0ZnZw7dT69DfyGo2p5EaxQeuGUXiFyc6H4hdXD2k8UBjShWubFK1xvXr53cN6iWtrKLIQHeNMTwz7Yg2l5CCyrOMZ5vG/Iq6ID5XxixH6xnx3z0KBRrRSsY/ENDFaPIKXiAHCEmZw3YJpDP1eETj7DT3PLlus/lrpmsDAwbsUDlcYCvB7bS15mK06PL8GgrBkMHkJaSHg4Lab2aTz04JgK3xY4lf44YKvwmnNO9zq49md2I2+hJxNcTu3dyyfg3jBz4nI0OQeIGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjxfuVJjE4dmON3PnMehkwdp+s98UjU5VxXK8cGEVSY=;
 b=AAywvrW2PRXhAXdTWauw+LSjpUEGmAC9dGLG5fUwBEKUJ0wyvm12dSGPOh6e02d5+NuGLyFxxx8u+it4hoY2ViHcFu2s42zadppmXyUMZ0iy7wKitYGuDNw0JPBEr5BpAHXujBaYiY00WcA1vaHSkr/pSvOQQVFJ0ix9G+m0hxmTXGVs/DrJmNxZmUqoBZvFrAM9xe+McgMKRUC0MFORr2KzBVEvNIPWVPLsmZrIZ1rK8hxsR8WuvTvXdfZ8+rbyrclmp3ORFfOAXvR9HgP94o2aCYzSigOVkd/eCDv/D9Ob10JEaOPOGubUNaNqm1LVMFg1CWkLsL1eqgjkYAgFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=canonical.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjxfuVJjE4dmON3PnMehkwdp+s98UjU5VxXK8cGEVSY=;
 b=l+5ZFkqowiHofTRQcH12Goi1ueFZV1l9GhyD6/t3pC2OxZ334XHThCvNSPNXfXTkSgiZHxg6S5Z3V/NXY71pwYatscJFwWcHx0lJVQUHIWJr60Aji7g7exazw6xfEHd4iLYPlbv4s3IQjZ1n8RHJ1Zx1tQ+4xFbPmBbykgtaSdo=
Received: from CY4PR02CA0016.namprd02.prod.outlook.com (2603:10b6:903:18::26)
 by DM6PR02MB4923.namprd02.prod.outlook.com (2603:10b6:5:fa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.22; Mon, 27 Jan
 2020 12:11:47 +0000
Received: from BL2NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::205) by CY4PR02CA0016.outlook.office365.com
 (2603:10b6:903:18::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.24 via Frontend
 Transport; Mon, 27 Jan 2020 12:11:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT029.mail.protection.outlook.com (10.152.77.100) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2665.18
 via Frontend Transport; Mon, 27 Jan 2020 12:11:46 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iw3F4-0001Rx-DO; Mon, 27 Jan 2020 04:11:46 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iw3Ez-00010Z-9a; Mon, 27 Jan 2020 04:11:41 -0800
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 00RCBWw3024733;
        Mon, 27 Jan 2020 04:11:32 -0800
Received: from [172.30.17.107]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1iw3Ep-0000yg-4i; Mon, 27 Jan 2020 04:11:32 -0800
Subject: Re: [PATCH][next][V2] i2c: xiic: fix indentation issue
To:     Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200127102303.44133-1-colin.king@canonical.com>
 <2dd84ab2-a7a3-fdd8-6bd6-07f1b3d5cd00@xilinx.com>
 <20200127120535.GC1847@kadam>
 <89661e5e-7662-81a5-ec36-57367825de5e@canonical.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <3b71a397-3539-1081-54e0-a7b63bc9ed26@xilinx.com>
Date:   Mon, 27 Jan 2020 13:11:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <89661e5e-7662-81a5-ec36-57367825de5e@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(199004)(189003)(81156014)(8676002)(336012)(81166006)(9786002)(53546011)(70586007)(70206006)(26005)(31696002)(36756003)(8936002)(44832011)(5660300002)(186003)(110136005)(6666004)(356004)(316002)(478600001)(4326008)(2906002)(426003)(31686004)(2616005)(42866002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB4923;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 940d6868-0ecb-4a03-02a6-08d7a32214ec
X-MS-TrafficTypeDiagnostic: DM6PR02MB4923:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4923A91FD1B1219229FF7713C60B0@DM6PR02MB4923.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-Forefront-PRVS: 02951C14DC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2R/7yzjslt2YGa8isf63Gm/bLqQc1DzZN1mOVXvNKPMeNm6Nocsc1KfwJ6/cPeNyxXZH/Jord5Uxv/FwVryvlmavMp9k5okZ1Rx1Jld8OhX59xnaOoyiXnDZybK7v56gCskDdyA96QkpTN04o95VBoN4bc8h4tcyxdAWkB+1BPlida63rjS31j1vEgjlTciYpstqr0La5rjS7eXgeTyUr7jMDk1J8huW4fdyte5aoFvVFEX8WOp4G76VMYOcsAYkPj1Ow1MFt7JrjVQ5clLCYXKRS5D91tKriyHOx8+vJvH0EjdpCxw6PL5ch2pH5ea1nbb76q5zqwg/vHz0mJVjlom+jNtOVIBEf3ziveguyLpcBgawu6xfdQeJdGXSecAPYOHQCGNnnCmlqH6taowW2byweFMxYvJ5fWA7kac5pVI4PrjbuVpyC4CfxLKxyLwPEA8a6JV3k5v9TQfF28dtZJKKwUnfcOt/OVbXxLYcGoafhevFVxoqJTeY4b7BhPVb
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2020 12:11:46.9710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 940d6868-0ecb-4a03-02a6-08d7a32214ec
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4923
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27. 01. 20 13:08, Colin Ian King wrote:
> On 27/01/2020 12:05, Dan Carpenter wrote:
>> On Mon, Jan 27, 2020 at 12:03:02PM +0100, Michal Simek wrote:
>>> On 27. 01. 20 11:23, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> There is a statement that is indented one level too deeply, remove
>>>> the extraneous tab.
>>>>
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>> V2: fix type in commit message
>>>> ---
>>>>  drivers/i2c/busses/i2c-xiic.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
>>>> index b17d30c9ab40..90c1c362394d 100644
>>>> --- a/drivers/i2c/busses/i2c-xiic.c
>>>> +++ b/drivers/i2c/busses/i2c-xiic.c
>>>> @@ -261,7 +261,7 @@ static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
>>>>  		xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
>>>>  		if (time_after(jiffies, timeout)) {
>>>>  			dev_err(i2c->dev, "Failed to clear rx fifo\n");
>>>> -				return -ETIMEDOUT;
>>>> +			return -ETIMEDOUT;
>>>>  		}
>>>>  	}
>>>>  
>>>>
>>>
>>> As was suggested by Peter you should also add Fixes: <sha1> ("patch
>>> subject")
>>>
>>
>> It's not really a bugfix, it's just a cleanup.
> 
> I'm surprised i wasn't asked for a bug number too.

ok. Up2you.

Thanks,
Michal
