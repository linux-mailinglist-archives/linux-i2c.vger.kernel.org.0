Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E976545159
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 17:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344449AbiFIPzS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 11:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237102AbiFIPzR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 11:55:17 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2076.outbound.protection.outlook.com [40.107.95.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1476732EEE
        for <linux-i2c@vger.kernel.org>; Thu,  9 Jun 2022 08:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgVc3a1v2rV7TsDN5eAEjn3wixA1oikA4TDNTNDaru0t8WN8R2v7oT8LETpN/Hurx6rqmfeNjqW2OVGlPa0sJhljzVuM2wnc+BnslNAsLeIoSZQuT6Bb/8mg9ixCVfaSg8DmzVpsua/tDRfy+E2FRcjsaJ9AbEgt345OMnzUG2dt+JCJmO53IkC96wHaJS1wlkHe3+tpXBj0BcLTXJhd78YF8/UagJSrPnm7uTGkA6aqU0SefIAs5qwaG1IU9F4keuAtrnSo5pQ8TNnITfV5dWAykIln6jAhcmmNFT3cAwebSNqBvjwWLPXMsbWGd8rS/mwKTGAIEEhs069g5DJxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQBjZvVKDByUdlpmceYV3PeFA330HjTbyhTNwhPej+4=;
 b=YsbmqEq/ddwtZjCpXjByF413NVCxfMETJl+zUqtSZpqtDPcax6LnCOm1YtoFXiiQjd70EO5N+qVzcy0yuLbOPOuV+Ki9Gv/FEUsxOmPDkYgnoJpW7Om5z9SvtQiaZFB0ZS/yrUFq8thZAMYCMqBqRQR7bAmiVGTd2yUKieh9l0O5GDlvE0rPaS3fMG9XX4jjkr7/X2XdkqOIJgQuqQNoFrRt7lrXjN15OMLf/a559MSTDW2NJL/2Vk9m7Qz8ntGNKzaRg564lMhOyryOay4fLh8UqAq6IcToDfafbGeJNtV4rYjlw6p99b/8cNBuhHLLo5GcEyJML7zAUkToFZ8WHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQBjZvVKDByUdlpmceYV3PeFA330HjTbyhTNwhPej+4=;
 b=DZmt4U7r1SlaWAaiaiP7290bUqcwOBLst7acD6IET0pysm3KFb4NZKW+/K4z4GmaVeAalgrzc6UfSpFA+5VYGRAnfZKr43atoWVke6s5auHaqxOGDJdI1G3kGeC2gWdd767ZxHDy3TXOtEi6RTCWzP9GhAFL1/l1PXRchEe2udA=
Received: from BN0PR04CA0036.namprd04.prod.outlook.com (2603:10b6:408:e8::11)
 by BL0PR02MB4674.namprd02.prod.outlook.com (2603:10b6:208:2b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 15:55:12 +0000
Received: from BN1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::7) by BN0PR04CA0036.outlook.office365.com
 (2603:10b6:408:e8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17 via Frontend
 Transport; Thu, 9 Jun 2022 15:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT021.mail.protection.outlook.com (10.13.2.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 15:55:12 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 9 Jun 2022 08:55:05 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 9 Jun 2022 08:55:05 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.254.241.50] (port=43394)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nzKUy-0006z4-S5; Thu, 09 Jun 2022 08:55:05 -0700
Message-ID: <a184a7c1-c211-c5f3-7d6a-b9770f343459@xilinx.com>
Date:   Thu, 9 Jun 2022 17:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>
References: <20220609153738.6557-1-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220609153738.6557-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 141b561d-22c8-4706-3e81-08da4a30700e
X-MS-TrafficTypeDiagnostic: BL0PR02MB4674:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB46743EBE96517479FDA2DF22C6A79@BL0PR02MB4674.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t6NuMYV6++7LxgNkKsQDZDXbid25BDuOZr7NFx0liXmjFe6XQ5CPkv5Lwb3M9edxYu8ZK4kRrg9cKPmcRt7j5jgguU58y+XwDgzXEjs9WBWz5y2ODpKN656ZfptGH84pTKlfMOEwjNq0QEFw19GCYGhzmpj/v9m2gJvPa+LXiDw126k/m1L/2OGNjKuOtX7BiSDH1bNsmjKomLPGdX11NgDiz9zxZ9jVdhCT4pBwEtWivDRPnYw14jp/gTr2OF3un51M1yOGAHbZziU9/1qu3n3gFZEfoIgaT+ktMPgdfrMCOPVkh0OPisuBoT7lgCb7DEXuishjUae1W7ZT2ymCK3yFjuEYRlWB9L5dHBc6QeTkPmHIHQhWCJVbimzhKWQDQq4gQsQdOz1vYAQiqKaLCEzzkmghjoWReM/q53SKAky75vWIhhH93ZfBXoDPrPOg4jSqOipeGwrSJoViQ1ITlqqU3mEiy4MIOBqhDv7aKdcRJFU/1SpLOTvc1wI1gSujipI/BunRY/Ph0MzVO5QfN3CuaasABKQyqexubRKZ5+OdFmki8HNa8vi2nHmS2D1cbGphVzNXD5PgZsEiL410tTyRTimhFjeYLvHrbIrhsA3nlXKB1qeo7yG3kX49JC8CJZQylY/4uL18wbFNlHrPgtNBN7H6DaLMRqyzsmw5jAtpBP4rld0M9Cl+ow6AuxPy27tnrTYKnvKv4bljyUyV1S57Uoj44oGKIMbDXGgNdXg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(110136005)(54906003)(44832011)(186003)(83380400001)(8936002)(31686004)(5660300002)(53546011)(2616005)(47076005)(426003)(336012)(107886003)(36756003)(26005)(356005)(40460700003)(82310400005)(2906002)(31696002)(508600001)(316002)(36860700001)(9786002)(70206006)(70586007)(7636003)(8676002)(4326008)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 15:55:12.3807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 141b561d-22c8-4706-3e81-08da4a30700e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4674
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/9/22 17:37, Shubhrajyoti Datta wrote:
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
> 
>   drivers/i2c/busses/i2c-xiic.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 9a1c3f8b7048..ec56b80653d3 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -34,9 +34,9 @@
>   #define DRIVER_NAME "xiic-i2c"
>   
>   enum xilinx_i2c_state {
> -	STATE_DONE,
> -	STATE_ERROR,
> -	STATE_START
> +	STATE_DONE = 0,
> +	STATE_ERROR = 1,
> +	STATE_START = 2
>   };
>   
>   enum xiic_endian {
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

Thanks,
Michal
