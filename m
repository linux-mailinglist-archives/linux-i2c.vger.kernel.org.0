Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54017A969B
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 19:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjIURJb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 13:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjIURJR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 13:09:17 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::615])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94596E9D
        for <linux-i2c@vger.kernel.org>; Thu, 21 Sep 2023 10:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SE0ZKfnOeDXYd4ZqmGD07nSWBdVHrge9XTxZ0yp1qn29d4IngsqinnBs1J9HCI09T8Rw1ocZvSbgiCHmRwjaUozTUt0EVo7XalLnGji66GclGfSfvNlowaj3wEhXCNnDB1CuYEuN2zzibSd3xulPKSYEyfhYkp9k05FkTR8nTRJPI6JL1VvlKOFyciT1GPDSFq2GS/bNnmBw2nk2hYZ8QTIeYSCKSDZqburQPBwBgo6YVYkB5U35ZNa7W+Iy4//2hrxNL6kOlgVEHBNI9E8m3Ej5ip2Dd4gA9oRyJJMsQ2Wxsjmu12MQP31FRi2yMjLjAUA56/3t2aoa8fqbobiAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5J3i34cQ+ODP+KTOMu5cH5JgWN3bHomVEkUW+Cj9WQ=;
 b=QdxHNT94EKJRRIPaelha/6YSBJhh746VDAmeYYHcLYYLjkbGjLzbAu4CrU6oe6NwTA9HbGQtjzucru6g7KeGt1O7PiOccdlxCZq+LKA10RvEDoA1nAtqsIuPI359yqYJAUvioa40X9iVnWJ0aFTvaJ06f4R4/8aHbok9IroQgAAgVNpfDDCR2EYahQKl5yXKnAR/hIphDoX+L+pBbOhpKE/qp3GXWIs3UkeY4su9FV3VZb/evxLjUVduWLC08PQ28r5B9Q5RwEuPTyp99zx7n8q37QYIKt3p6XXlqE+KDbZCDfbQ6ydCtJ0iRs9WiveUPZX4wfvNAc3b+vRncA9Z2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5J3i34cQ+ODP+KTOMu5cH5JgWN3bHomVEkUW+Cj9WQ=;
 b=L1ww2WoZGjI06NLa4lhxxgX9TLMAYk5zQvzgph8WGwQV9HKhEoCXIHcAHM8tgpbd18n1ab1SvIMNSumAu1lrtiSKTMRxgtxSoIkfo5BtZiyzRKJfujF98eu15ud3ralgjvI47SI8yZD19ScDnN0WlxL9xy+qtH5SsC3yxDkAYd0=
Received: from SN1PR12CA0100.namprd12.prod.outlook.com (2603:10b6:802:21::35)
 by IA0PR12MB7556.namprd12.prod.outlook.com (2603:10b6:208:43c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 12:13:23 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:802:21:cafe::be) by SN1PR12CA0100.outlook.office365.com
 (2603:10b6:802:21::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30 via Frontend
 Transport; Thu, 21 Sep 2023 12:13:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Thu, 21 Sep 2023 12:13:22 +0000
Received: from [192.168.137.2] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 21 Sep
 2023 07:13:20 -0500
Message-ID: <9d7c23aa-b87e-45ea-843b-576c5552a6c6@amd.com>
Date:   Thu, 21 Sep 2023 14:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: xiic: Correct return value check for xiic_reinit()
Content-Language: en-US
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <20230920134109.2232769-1-dan.scally@ideasonboard.com>
From:   Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20230920134109.2232769-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|IA0PR12MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: b99efdf2-eb06-47b2-617d-08dbba9c2650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MdOrpvTFyC9DraHdFSS7nFP4pxe5gMGNzpUi6Is9T8dAVbPeSor7iZBMrxpW1C9IT2kFwU4jh7X7ObEBPaVuMYhl72CAfkpJHl0K/c4iFKcpUVLC+pFcrwQoRZPAUztwLBG6F84F5kLu6orVTeJXZLQcMGGWdVUjjuygZ9b1DCiPeGTQI7hclzeI4rll9sWrkRl7t/hyVk7+sWrQexvifTsc+pDc79RO8hFx5IyPqRLR5tlky+i/iINJjrKswgCBSpM8rZjB5E4moOykuh6RdiSHycs5vL4l8/6lk8fxtrHKR3Djl/zhwHCnzWpUxgWKwQygIn3HYA7LQdzJ9JdPV0mh4qjS0MLjUCFxyps5qV68zfAhx/lbfSe1QfqJLOJNSbedy/scCW1pMB1Rk98h9rzKrfIUPhbv4d2om0q6WNfViUIwrzhizWcAkUVBO2D2ud+RsccnHtYcu+lmRYWThEaAOIuMTVjdZOSgNS1BuvYDZA1OyJGdlXR86nwICiXQVSyUuiHzT1Ea0mrV6pqWykF4FjJwUbapaNeLWXrxW6bs3BfDI5FFKGxeGqt3ybZzRl2V4c7s8ljfTs5z77rNOl9qw6vP4QqCAYVFYMtjqVzQkUu7SOa/q3IcqcqW3JxZxnB6GN38qm1nH1JP20J/YYCeVafdVVPeRKmGAj3tF3ewXNvgSjq1a81HioxgTsujkTQNyfLDPG5rhINSSODr+ZGTkhtLqYUlrB90FDwRVslVD3z2LLTtogBdovIqjK92SElL8zxVbLEDKNLdj5MObt53W1AUgsV5wY04LITsPBx3ZykLJs9iRH8b3UPjPT/fM3E02lbseNq7kpibms7NOA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(1800799009)(451199024)(186009)(82310400011)(46966006)(40470700004)(36840700001)(31686004)(53546011)(81166007)(40460700003)(40480700001)(36756003)(356005)(82740400003)(36860700001)(86362001)(31696002)(2906002)(16526019)(426003)(44832011)(2616005)(336012)(26005)(478600001)(8936002)(47076005)(83380400001)(5660300002)(110136005)(4326008)(41300700001)(316002)(70586007)(70206006)(16576012)(8676002)(36900700001)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 12:13:22.2898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b99efdf2-eb06-47b2-617d-08dbba9c2650
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/20/23 15:41, Daniel Scally wrote:
> The error paths for xiic_reinit() return negative values on failure
> and 0 on success - this error message therefore is triggered on
> _success_ rather than failure. Correct the condition so it's only
> shown on failure as intended.
> 
> Fixes: 8fa9c9388053 ("i2c: xiic: return value of xiic_reinit")
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index b3bb97762c85..71391b590ada 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -710,7 +710,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
>   		 * reset the IP instead of just flush fifos
>   		 */
>   		ret = xiic_reinit(i2c);
> -		if (!ret)
> +		if (ret < 0)
>   			dev_dbg(i2c->adap.dev.parent, "reinit failed\n");
>   
>   		if (i2c->rx_msg) {

It would be interesting to know how origin patch was tested.
Anyway
Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
