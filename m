Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE669509B09
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Apr 2022 10:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379503AbiDUIuC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Apr 2022 04:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386867AbiDUIuA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Apr 2022 04:50:00 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7174C15712
        for <linux-i2c@vger.kernel.org>; Thu, 21 Apr 2022 01:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flcy+EIxHPtDABnU2U97GPGMATlNvuUjW2cbB9yZOeCEQHwcfTgBuMz6bpGPupyrzmaUJmw2F3uFCZ34SW+H8yl3Gbuts5Mt3evqgHZYnz0newpOkKtQ4HgfP2nBYEWj7Rp6qnCqtfR1GQhyUwe/xLZa3KdWwxms5YnKyedCwWSmA8L5I+m9HxL+9lwv8zkKfpgtgcPHLNVMFavfpa5uKEX9IRMBxAMBX/MD4a/C1kapSwBdg5vnsVqJflDK20AG7qylzJRyrqZJ3uYdQDe2JB5DwpDGea8O84efmhAJpEWOEtWPNaA9ycVNEA+N2fgdYFW6E6mrg9DDd3k0tlV3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvPmBoR4EO7IzhYfOBYem1UsmOyyFfgs3TG8TPhxKjI=;
 b=nAA8hDa236ycOCiAuTR76EUliq148/u2O15hMsC/LBVJxGZTG4h02GSX5Rz9xufRlNynwtlIO8ojWxOn5m41njHhEzCLLNS6gf7EBLrbcLZJ3lrjtcF9sXb2tBnOmQVxDFZNE+FCY/aDR4AmLy4B+g3VAPzKxbhRAkJWD7jZIBzDxyfEGX5zwZ2KQ+sDZ6xkvA5cWoG2hxXVwGottmtmkmGrFcR97Ou94599jmBR3znG+MH6qqDkfanbIZiqYc5sL8CfLSyVBMqn6HJwowA9yZR5DkkDWAIh6Y9ZDjG22RziIIY/7mL+bqMCoRN4YS8VMKHMhRtduoJ4RCahUkLEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvPmBoR4EO7IzhYfOBYem1UsmOyyFfgs3TG8TPhxKjI=;
 b=bO9W/8K6Jt09lCAUt7v4Og57QQ8mtyQCjGw2k2P2C2/Zez/NTM2KU9VihXEa1Ukm4uvQdq7DPQMDddaLzLBRTOMhW8Ek5+BYbmZv3bOPpn1sWbQ71ObgEgTFCPgGIrzJKG8GOLnfHGZjAPr6xJrKdcPWbVGp87hGQ8QvRTznxV4=
Received: from BN9PR03CA0974.namprd03.prod.outlook.com (2603:10b6:408:109::19)
 by CO6PR02MB7828.namprd02.prod.outlook.com (2603:10b6:303:a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 08:47:00 +0000
Received: from BN1NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::fb) by BN9PR03CA0974.outlook.office365.com
 (2603:10b6:408:109::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Thu, 21 Apr 2022 08:47:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT004.mail.protection.outlook.com (10.13.2.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 08:47:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 21 Apr 2022 01:46:58 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 21 Apr 2022 01:46:58 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.254.241.50] (port=42502)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nhSSo-000EHi-JD; Thu, 21 Apr 2022 01:46:58 -0700
Message-ID: <586bf2ff-06a6-6a73-aecc-38fc37c3b3bd@xilinx.com>
Date:   Thu, 21 Apr 2022 10:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/4] i2c-xiic: return value of xiic_reinit
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
 <20220420075924.14546-2-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220420075924.14546-2-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e21856d-7f64-45aa-85b6-08da23738020
X-MS-TrafficTypeDiagnostic: CO6PR02MB7828:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB7828AF2651A779FAC0434406C6F49@CO6PR02MB7828.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXvVFHvgnFB9Vyea00tFORs1t1+vlVvJ7Ku1IMDwo/618deaBYKQyhXyvXKm34uqEdleDN8s8MhEy4B+He+DlltucY5RquLEAY30i8u9Q/2EosDtGp2aR8S8TsDUH8KRaVrtSrtoFYrO+dvuc/2JsCfCZrlfLmBEce4RX0LsKJ5UMZsLF8FHzUxVMwNLXBKhiQQAsuP4ZzQXsiYiEy7PJdFdadU2JT2jP48Wp/1MFUswLTwXmjR5aVtHyCQVv7cx7KyeErtIzzdcf7VGiAjuiZLTzik+UVQ/pPGHqHdEaKB7NcuJEZfYddt35PwwChiYFxZi1HHkEdHykgFhosn9Z84NKu8hsgJVLx5Xhf1xo69VnKhQ9lTo3oMmFSeUFV8anT/vDC+0yTQj/TGzjG9kWsf8UYxcYMDNSePDULvrdTZodKmnNKWi9cGD56m2Rv/JxaQuv3A0aBJF+ngBKE3cKLUm2j9lh9L2sYsTgmWlX2KnlCAYPHaxefRVSw8/7zaVDdCj3rEzdPusxQvvnFPueKUKMvMRmc3wxhoFXmycj+KDzEzmVxaSoVvlOFZQ4CF5dfhInXkK6qxcwGsH1WatkeFdXcmdEvpheH4xKdqd8ICx+BbgpwPbR35PhSvHzogCNh6aN8S8dvDuz0QvpuBZGeu2YYvIrmAg61CftkxW83OfAf1LMhKQ7uVKuBUOsqFfkL+mv0mewaoBE3clxQ3HRhq853X06KUl4f7dO67B1Nw=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(83380400001)(70586007)(8676002)(54906003)(508600001)(36860700001)(356005)(44832011)(316002)(8936002)(9786002)(40460700003)(82310400005)(186003)(426003)(26005)(2616005)(336012)(53546011)(47076005)(4326008)(70206006)(7636003)(110136005)(107886003)(31696002)(2906002)(5660300002)(36756003)(31686004)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 08:47:00.2766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e21856d-7f64-45aa-85b6-08da23738020
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7828
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/20/22 09:59, Shubhrajyoti Datta wrote:
> Check the return value of xiic_reinit.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index ffefe3c482e9..8b39f9c7e773 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -381,6 +381,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
>   	int xfer_more = 0;
>   	int wakeup_req = 0;
>   	int wakeup_code = 0;
> +	int ret;
>   
>   	/* Get the interrupt Status from the IPIF. There is no clearing of
>   	 * interrupts in the IPIF. Interrupts must be cleared at the source.
> @@ -415,7 +416,9 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
>   		 * fifos and the next message is a TX with len 0 (only addr)
>   		 * reset the IP instead of just flush fifos
>   		 */
> -		xiic_reinit(i2c);
> +		ret = xiic_reinit(i2c);
> +		if (!ret)
> +			dev_dbg(i2c->adap.dev.parent, "reinit failed\n");
>   
>   		if (i2c->rx_msg) {
>   			wakeup_req = 1;

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
