Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4B3509B28
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Apr 2022 10:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238657AbiDUIxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Apr 2022 04:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386942AbiDUIx3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Apr 2022 04:53:29 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2060.outbound.protection.outlook.com [40.107.101.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A004DF42
        for <linux-i2c@vger.kernel.org>; Thu, 21 Apr 2022 01:50:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJBMpBFqfelY21YvR0mOybBA5QAKphbKMhOvWrS71hzmWwEu5tWwqQ1E6O5aELri0Q5vylNKEkGkyL1sKR7H8yjd4MBucDKYM7afrQLzmtyoLiHbqZGc1F5rKXfDtBuXGjPSXIj0Z/V+KZ2lrDWlrj9zCq2uZ2kQ11o0WGv1RKx3++t+SjxQ6X9vi/lWvWOUfjHGoQkugXBnH23X4whVAF7e6Jw8AqRqkjXCHb2gxhHB9nL5diZqe52LL0n8mIQw8ZJA9pyD7PB/dDuHDuVBELT7JD4nnONct1N/2pr8Y7jyLG8lxRlTA2M8YuboP28VavLYUVMz35y+sOMXdqONwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PukdJfOtSI7h0CERlZfUnogc8N8r8KNuOWwhpjIwNJs=;
 b=XKNC5wmM7tjrB3DsIEYfMP/knomb1mkJqysoBvjMSkaX8EIjm8/5GnlS3Guq3QTANeC0ywZ6uwISSCKs0KNSkFKrnQmSMOmybw7gYDxIDxvE6sNxrvAt8m7etSzDI+AJKeZafgT2Vt5Jy5uiiqqjxZwA/uGMIHbVdmuygB4F8Kmjb2jbWqeLmDxUXfNBdxepNHRJ5Hm5Mgc+7oMt6kUYivQSLK0Cw41ljbdo1QBs/JSvv7fVxdD71CqvCC+5yrO+nL2pJFQHS4QZCDGqi6JF0X0C78iiNRR7/gmkf4F0YIWRzPqRNEghM7M0jtKJdtAwa5A5harj5A+rHArW3qd8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PukdJfOtSI7h0CERlZfUnogc8N8r8KNuOWwhpjIwNJs=;
 b=Sib8zax73tgw2H8GrOyidnV/T9Iam16EkK3r9iZ8wO6KQAXWX5BZHW78jasw0rh6PtAdTmZnkCfrP0P/OQW47MxrIxDVqKKCFuiiIiS5fWIC2WW6sHtYdzsJC6EVxagZJ0RzVdaQnJg87jCEfCsx2U2QiWr2IZk4+orcX4/Kf1o=
Received: from BN0PR04CA0168.namprd04.prod.outlook.com (2603:10b6:408:eb::23)
 by DM6PR02MB6874.namprd02.prod.outlook.com (2603:10b6:5:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 08:50:36 +0000
Received: from BN1NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::48) by BN0PR04CA0168.outlook.office365.com
 (2603:10b6:408:eb::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Thu, 21 Apr 2022 08:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT026.mail.protection.outlook.com (10.13.2.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 08:50:36 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 21 Apr 2022 01:50:34 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 21 Apr 2022 01:50:34 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.254.241.50] (port=42810)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nhSWI-0008Tw-Fn; Thu, 21 Apr 2022 01:50:34 -0700
Message-ID: <29058bda-e040-2b69-7dd1-33e52ba431c5@xilinx.com>
Date:   Thu, 21 Apr 2022 10:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/4] i2c: xiic: Correct the datatype for rx_watermark
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
 <20220420075924.14546-4-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220420075924.14546-4-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d302e93e-89e6-4e5e-e2a1-08da237400fe
X-MS-TrafficTypeDiagnostic: DM6PR02MB6874:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB6874C51CDD06555B6401C615C6F49@DM6PR02MB6874.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XIE0ArJoFNgidynWH8EfIbLs5+tQNSV9KjuBu2nuxBHgviAQKti7CLUFymc7vx8ypAEhXxvw+HtcNUG2T4/2rmrFISfVMBMMH6f+tsfsijjIyiKFaY4TRcPdKJyIiZRDlLnqGms1cZp2Zw/f8B89crANGQtSbzpRouI34qVhTfjLERYGWsnDjHIor0pv1QA48Pl9VM6evqaBfLiIRFj8ILn1Bu3r4j6FZD6hXS7SWNb1FrMSeSGWsSuk50/3S3uc7uJoF4MMcpUOVcE0au9HjuX1eWsqsEa6CDLsmJITaNtK2nXHVxAUCxrxN6izbFlvKBaAyXv62EJmfIs5oriiZVjRxnHkxXpMjkJeGKOA41f1tcV8cxDV3s9KK12G00ySVl3oKkOrXtJr7WM//J/3RN3AMeJURDglOIzyE4DC1YjCst87KWhoKKUv32Ng81a0rsYZnOeeXlVLQ7+auKUNWTzvf2liOy28fdwCREYgyUBpew4tf4JgR2Cw+bacm6VXkptbzgcUAxPGmBXbj6XHYA0Dxz/fwFa0NSR2CN06wxdejUxVaKEn5zAQTFEBSD/K1ohlkrS/udSAt5aGnugHiR3YmZ7PMpHvlZQRMc+Y26qW5GC4FWiwY04JPdaPfboQGrfeGgFSiKCnWlxVnxfKy7FP1VewDNRhN2qHEH3FfE1Sv2XQBhSYUlKtIMBAOQqzAFo85y52vXPnwN/Q1ybaCw+qzvottU5NwuafWOfG4xQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(31696002)(2616005)(107886003)(26005)(82310400005)(53546011)(40460700003)(336012)(426003)(47076005)(8936002)(356005)(9786002)(316002)(110136005)(186003)(508600001)(54906003)(5660300002)(83380400001)(7636003)(70586007)(70206006)(8676002)(4326008)(44832011)(31686004)(36756003)(36860700001)(2906002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 08:50:36.4822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d302e93e-89e6-4e5e-e2a1-08da237400fe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT026.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6874
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/20/22 09:59, Shubhrajyoti Datta wrote:
> The message length data type should be u16 as per the i2c_msg structure
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 16a7e3164e68..eb4d34e7c0fe 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -576,7 +576,7 @@ static int xiic_busy(struct xiic_i2c *i2c)
>   
>   static void xiic_start_recv(struct xiic_i2c *i2c)
>   {
> -	u8 rx_watermark;
> +	u16 rx_watermark;
>   	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
>   
>   	/* Clear and enable Rx full interrupt. */

xiic_setreg8(struct xiic_i2c *i2c, int reg, u8 value) has u8 value it means I 
would expect you will also recast it.
Value can't be more then IIC_RX_FIFO_DEPTH anyway that's why it shouldn't be a 
problem.

xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, (u8)(rx_watermark - 1));

Thanks,
Michal
