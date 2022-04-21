Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECDB509B38
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Apr 2022 10:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243092AbiDUIyu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Apr 2022 04:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386992AbiDUIyo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Apr 2022 04:54:44 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08on2041.outbound.protection.outlook.com [40.107.102.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7701EAE8
        for <linux-i2c@vger.kernel.org>; Thu, 21 Apr 2022 01:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6kXG4aWMW8aPhLe5nT/4WohvT4Bwzt+wgXb2I1t+kpd4oyKwgpGIEg6uN0wubdkH+qFbVxkAouXyOcdWABC453RxAftRk0zQ+mIgKjCQkA9chTbnX3wAcdkZSvAHluRWHr2ED/Y3nv7HKGzIjfASDDOHQwW0VbYV7mpf7KbcIawRIKvNyNR4ZufDjIvQh+5EzDHUYpxYFcRPv/gSiY12mKu1a9UrYDkSCUC57INAUE5gGn2fHqgD8sLSgt5/f8JGge8f38UmgY/7v0UpBEiXDWG5viJxoQej77DIdAUpg84HDozWUO+l6KAi5XXmm+yP2uzuf53sl8buQ9Q0d72aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPwnyOYNLQZIxqve7JKDYTjWDqB5THt3g9ILciIpGHU=;
 b=GShrVgqy/632a8Xag1dL0RrAB2HqeqfjR019G/zp8HgJiWIG6wZdDT3dSyeq2N8rA5JZsiB89SB7xoEdtR+wROk8SJiRz6WnL7thdyOb43BhiSVRBkYAKzYuB7HinNHqmAqCuK3BeoMhgLUeGvBkk2kfSfpmyR5zUB2hsZpCA/cjMrZ687hncjAF2/BCXLiRSKX3HdlZQYYFVvtVfCSZWg2uSSKauIoW162jCdODK8N9EnJDMlhyZ1f6534lYH9GOg9r0GK7/oCBb0+1Erp7cPgIdrClDraAx/0DNypYLUBJ2VetRCSKiN1uW9a9NnasF0wEnK2g5Rl5m0mE/t+n9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPwnyOYNLQZIxqve7JKDYTjWDqB5THt3g9ILciIpGHU=;
 b=oRfyTg+QhqcJKKheXQTX4Cr9Jf6lpDFquvM++HTDpwoRFbtkGhLx2vXFoQwbszSXAnjPwLeop054y4DMXlH8kvfO98zSqWAcWIrcl/5PttW3uK9fgP4VpdBXfFKE2SZhBD+w8VZZSH1jprP11v1L+D8DGg5N3Nbm6OcM9eh/A5g=
Received: from BN8PR12CA0018.namprd12.prod.outlook.com (2603:10b6:408:60::31)
 by MW4PR02MB7105.namprd02.prod.outlook.com (2603:10b6:303:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 08:51:51 +0000
Received: from BN1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::5e) by BN8PR12CA0018.outlook.office365.com
 (2603:10b6:408:60::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Thu, 21 Apr 2022 08:51:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT021.mail.protection.outlook.com (10.13.2.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 08:51:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 21 Apr 2022 01:51:49 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 21 Apr 2022 01:51:49 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.254.241.50] (port=42914)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nhSXV-000Esb-4W; Thu, 21 Apr 2022 01:51:49 -0700
Message-ID: <cb06daeb-507f-d094-dcc2-4a37fde98241@xilinx.com>
Date:   Thu, 21 Apr 2022 10:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] i2c: xiic: Fix Tx Interrupt path for grouped messages
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
 <20220420075924.14546-5-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220420075924.14546-5-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd2e858c-b293-4087-022a-08da23742d92
X-MS-TrafficTypeDiagnostic: MW4PR02MB7105:EE_
X-Microsoft-Antispam-PRVS: <MW4PR02MB7105FE9A9BFBB3485F272338C6F49@MW4PR02MB7105.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJ8n30rQw29cBrCjJ0xSiWzhcTRSoc4Hng/r/N+1yNG+XDN16MXsmi4s8a4OdjGcMCxAt+CVnCCkyCDk/PhE3v3bGPNKxNoG02maiQ4sbgLW7C8j0/Llllur06z/O5QtZqXT1/H8uLC0eQaSsRzGiRIWxtHS/SA+pXfw5iotsYx7jhpqZZNpVwc8AtBVwWpwa6HwCk1F4R2EyDuUbvj8MwVzJeC6TrsBHcPEhXTvWk0/VSgsnUmAnB1eUq47p7Gw3euJHyXRMMbbNLqy94vUts4eg1pvuecjpP332JUwUgUjeCj/X2tghjFe8NvNID2DG1QMJITUsDGyOGuXMGOnVtvN4hmsuXtEz5QyrwQGRvBFJIUwZOzTX7lucZljR0pJU4rlNVbBEnPCpdr6ofetCz2fBPa+2B5PmWK+yCzYWwORn2vw6lGlIuWRLJ0RIxb/a9mUpYJicCiIN2l2f8U/0HQzDBepRQ3bLyYv8/8+G9ffCHnPE5VlQBiQJ/r9or99p7a7Cl33BkMgoz8i3ebYdbXjxJ2WlLt2Ry7FSouRVJ9Re0NL0nS5iUZUjCTJSB6FpzLRGH5EjwaSJC7WmTx6PGH0++4OqKumFV1GYwtmgP/FNj70KYkdt6sIigRpQ4kf57YPn6s6OJ7EzeOXAo6xlMBk4xAQkq77MCXZPquOHn4AuCHtphjTzsEX8WfIUloRhTLYncxo+KDna4VIPRxqBH/PKBsxEFu+VWtX3mCp+7Q=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(26005)(186003)(47076005)(426003)(336012)(31696002)(53546011)(2616005)(107886003)(7636003)(356005)(36860700001)(9786002)(8936002)(5660300002)(44832011)(8676002)(4326008)(70586007)(70206006)(31686004)(36756003)(82310400005)(2906002)(15650500001)(316002)(54906003)(110136005)(40460700003)(508600001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 08:51:51.2506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2e858c-b293-4087-022a-08da23742d92
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7105
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/20/22 09:59, Shubhrajyoti Datta wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> 
> When a group of messages are sent from user space as a set, if
> the last message has less than Tx FIFO DEPTH number of bytes
> to transfer, Tx half empty interrupt is triggered continuously
> from the hardware. It is due to Bus not busy interrupt coming
> along with Tx half empty and tx empty.
> 
> Hence, service the Tx interrupts before Bus not busy interrupt
> to update the i2c message status correctly.
> 
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 38 ++++++++++++++++++-----------------
>   1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index eb4d34e7c0fe..953f7cffe0d8 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -468,24 +468,6 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
>   			}
>   		}
>   	}
> -	if (pend & XIIC_INTR_BNB_MASK) {
> -		/* IIC bus has transitioned to not busy */
> -		clr |= XIIC_INTR_BNB_MASK;
> -
> -		/* The bus is not busy, disable BusNotBusy interrupt */
> -		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);
> -
> -		if (!i2c->tx_msg)
> -			goto out;
> -
> -		wakeup_req = 1;
> -
> -		if (i2c->nmsgs == 1 && !i2c->rx_msg &&
> -		    xiic_tx_space(i2c) == 0)
> -			wakeup_code = STATE_DONE;
> -		else
> -			wakeup_code = STATE_ERROR;
> -	}
>   	if (pend & (XIIC_INTR_TX_EMPTY_MASK | XIIC_INTR_TX_HALF_MASK)) {
>   		/* Transmit register/FIFO is empty or ½ empty */
>   
> @@ -522,6 +504,26 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
>   			 */
>   			xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK);
>   	}
> +
> +	if (pend & XIIC_INTR_BNB_MASK) {
> +		/* IIC bus has transitioned to not busy */
> +		clr |= XIIC_INTR_BNB_MASK;
> +
> +		/* The bus is not busy, disable BusNotBusy interrupt */
> +		xiic_irq_dis(i2c, XIIC_INTR_BNB_MASK);
> +
> +		if (!i2c->tx_msg)
> +			goto out;
> +
> +		wakeup_req = 1;
> +
> +		if (i2c->nmsgs == 1 && !i2c->rx_msg &&
> +		    xiic_tx_space(i2c) == 0)
> +			wakeup_code = STATE_DONE;
> +		else
> +			wakeup_code = STATE_ERROR;
> +	}
> +
>   out:
>   	dev_dbg(i2c->adap.dev.parent, "%s clr: 0x%x\n", __func__, clr);
>   

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
