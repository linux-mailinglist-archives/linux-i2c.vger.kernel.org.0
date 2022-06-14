Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 347E454ACD1
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 11:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242736AbiFNJCs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 05:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240296AbiFNJCl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 05:02:41 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A72A2F00B
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 02:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4IIH4M8ZoHGZruF27EdgsFXj8FUdyGmJgIa8RhbwRoiUd422R0k7rUc10kMMdRHvofcvxHQM8usALjIo9aTnqvQrTRwk5uOmrImzCd8HIZXkOI5VwuCD/N/uNY60VW0cbfaH9O1CyLwzjOxM+EIReEUY809NNrmZKYOhrIvpNavcxF2IJVI+ZseMj3xYlMHWxcIVmAQIHjqZovkWyOxPh8eNLrwJdwBNMWBfQp47tehtjf6L9G7fMtK8SIwDaKx7J9tLBjzFsgfGqrlelANFglpO3O1O11Rnr6OMeRO6BHxqbu32Jphj3EJflLr/BpENHYJO4EBkeNIXqz+ev2j+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgoJNT2U76d78oTtsf1jKNZrKxyRTQfQ0U3EMYPuR2g=;
 b=kAE4X5FsPQ9rx22Rr2wYoXMFWuLx2qzAHb8CXxfZTf7YwyZiyQy9rFQgiQvJXghI7XsIXocfC7cwnv3Eh6lt8Ixg8aHX6nbca9qnzGnaUwORpGWK2BfUpI7XGU2sagVHvV5r0qRhrFnVceNZcKaINy86j+JZi+GJl2TIrWMs20vgGjyxku8uqFrUsZOKQK+WQEx/o9Zx2t6+nOwMDu+GKLxY8zUlcqMhdvR1aPVgd09BJTaZsw7Rj7Tyf9nQRVOJKI0cCgPPYIQFXVNaF2Qa9RuTZK3+QmXMX1jj6/LzJumgXqGtkCtMuWhHHDGUASQHUzheL4t//kX3viRmMGJGiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgoJNT2U76d78oTtsf1jKNZrKxyRTQfQ0U3EMYPuR2g=;
 b=pmFUYi9a2AzmnnSx3VE0DHr1bdpmssPPyksaLUNsWneRdErY1hn4Ik+1GUduFofMRkimEAou+VwO3yFKBbVxpan9EPau1ekA8SC/q6716L+r64fMf5PKKllGDsw4AVZmiAmPDkoSA3UvlaKSPsDFZiwz0Nb6My3XnKLi2olfyeY=
Received: from SN4PR0601CA0004.namprd06.prod.outlook.com
 (2603:10b6:803:2f::14) by CY4PR02MB2262.namprd02.prod.outlook.com
 (2603:10b6:903:9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17; Tue, 14 Jun
 2022 09:02:38 +0000
Received: from SN1NAM02FT0015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2f:cafe::90) by SN4PR0601CA0004.outlook.office365.com
 (2603:10b6:803:2f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Tue, 14 Jun 2022 09:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0015.mail.protection.outlook.com (10.97.5.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Tue, 14 Jun 2022 09:02:37 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Jun 2022 02:01:44 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Jun 2022 02:01:44 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.254.241.52] (port=60056)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1o12Qi-0001gA-2W; Tue, 14 Jun 2022 02:01:44 -0700
Message-ID: <d5e8d7fb-a89f-123a-cae0-1766996c2e8c@xilinx.com>
Date:   Tue, 14 Jun 2022 11:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] i2c-xiic: Fix the type check for xiic_wakeup
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>
References: <20220614061855.24210-1-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220614061855.24210-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71de65f4-3065-4c26-1c6a-08da4de4a122
X-MS-TrafficTypeDiagnostic: CY4PR02MB2262:EE_
X-Microsoft-Antispam-PRVS: <CY4PR02MB226276764C65D809CF7C7EBDC6AA9@CY4PR02MB2262.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EznMRC3xX4Zj80X5v6M+j7jTxyj0fJTJsTYTXHLQIjcDkTjAsDjOhOj2v+P9M0bm/jF047URGbmL1pcGMJPB1Ci8Q6NCpKsF4di5MK1/8DvlKUQfCUqhVWxihE95+mTG/kBckVmt9EWRXznlMKyyc6r8l0K0ZYGZg1jiiop66TSPDVtk8YRF5+lppdO6kk+pZMAosnvQ2OOY8aKB5lEnpunK55bDw9XPt9+8VDtLRgBeaC3kgqjk3Z2kqoatBiXLd/wGlWOMwKuCkwrKh3xZjIdIuf1w8tiAJA+PeL7PC4Aohu7K1fqN2orTy5g88OatKpvIRx38YoEdNpJUtU3UhsHFAkMOms+ONmeAaI5JW6dTQaMhov8LHZF6Lpx/Y2E3cR2y1KWQhZegSNLh8j4mExipht73l92Qhzag6K4hOa82sePMPg13Zt7X4NCNI/gwVgpvhOSboq+sVQDSgVTX/q+xq+OfFEy5b7fLiHn9Pcyitw0StU80OM3vxiIrg+r/A7XEGRKIWeE78IgJEo0D4fE0uZiNBcj6xlJoDGiOygji4bsj/6xp3al4GwAZIALwsf+MEGBfRwA7t7y1zoQCclPQidLELyDmKzrTPxXBKEO+G7auLMUBL806DNC/CwVFXSBRzOnp9wEu7p0VmA17Z/GOi6hPuEiFyANdlR41xRYD5FJz9pkDCN34Ta9GQYaH/arFA8e7iXm7PZT6YHg0JqJAyRnuB/CJOpMp9eEffuE=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(7636003)(31696002)(53546011)(2906002)(9786002)(83380400001)(508600001)(8936002)(5660300002)(26005)(36860700001)(47076005)(40460700003)(356005)(36756003)(54906003)(107886003)(336012)(186003)(70206006)(316002)(82310400005)(44832011)(426003)(4326008)(70586007)(2616005)(110136005)(8676002)(31686004)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 09:02:37.6814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71de65f4-3065-4c26-1c6a-08da4de4a122
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2262
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/14/22 08:18, Shubhrajyoti Datta wrote:
> Fix the coverity warning
> mixed_enum_type: enumerated type mixed with another type
> 
> We are passing an enum in the xiic_wakeup lets change
> the function parameters to reflect that.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v2:
> Update the wakeup_code to enum
> v3:
> remove the initialisers
> 
>   drivers/i2c/busses/i2c-xiic.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 9a1c3f8b7048..b3fe6b2aa3ca 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -367,7 +367,7 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
>   	}
>   }
>   
> -static void xiic_wakeup(struct xiic_i2c *i2c, int code)
> +static void xiic_wakeup(struct xiic_i2c *i2c, enum xilinx_i2c_state code)
>   {
>   	i2c->tx_msg = NULL;
>   	i2c->rx_msg = NULL;
> @@ -383,7 +383,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
>   	u32 clr = 0;
>   	int xfer_more = 0;
>   	int wakeup_req = 0;
> -	int wakeup_code = 0;
> +	enum xilinx_i2c_state wakeup_code = STATE_DONE;
>   	int ret;
>   
>   	/* Get the interrupt Status from the IPIF. There is no clearing of

Acked-by: Michal Simek <michal.simek@amd.com>

M
