Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F10752A123
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 14:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbiEQMDl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 08:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233376AbiEQMDk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 08:03:40 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2057.outbound.protection.outlook.com [40.107.95.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0D062FD
        for <linux-i2c@vger.kernel.org>; Tue, 17 May 2022 05:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JISOJrk1Ovggwi3tNIL9gB4QKz2Qa0LAAeMNzrUD7G4oo5tWgs4hD2IMZlnKgzdCpOj4SjhcL6vv4CDiZTfsViNVBSwei1vxH3CdYOoWaxxt5uqojFwr6R5ayIBR56zJ09AHReRRTHT6KYSgR7zz0JVcCLreWGIHNox2SlyIGR0gPfkdr4IvW+wKN/RsVKDCH/NpwIzD4YBsAxxKgh4Q5jxAoVn3Demcen0aysDBufU5wBt7SnXN2MNdxktDTmmNspyfNe30EaZGGmksx9W+fYmPy912Con3VGEM3PK/dueryB/MRioGjPuZSPMru4vbJUNU2LDekCsdJRN/mbgUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONbVu0b/+SLe7BDVH0Mv0b6mnOLlLfgvfdYOz+wSQLc=;
 b=CjB0jyEpuH8YZQr3AXL3oI1EiiisifzEYTdChE8g3mmemchfL1JwwnZOjUC1RXf+Aa8/QUEb0PZwNmHbEXtzmBiq9G7ek4/zayykrIoCd918Dyy0i2ykK4whD7rrnnUuwYb/48tMq+Qo+w6AY2wygJLIvJn78cyN2BXB1zQEiqiuOK02+R722c3jquSTyfpNLLEjq7VAS4XhU6WjlhlLfb/HZR89AmdwiA1RJYWNUZ9EW7f/oe4P1/PkQSJCdiSgqjVMWrwCrKSxy5qN2sMfM2yEIVJHEHwwhUTfBpcKXkdIvzsmCYMXP4MPSz+Qtka5poz/poZF0uhmUkDPifW0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONbVu0b/+SLe7BDVH0Mv0b6mnOLlLfgvfdYOz+wSQLc=;
 b=hGScaNVISObi13w212Kn+SsgzhS0HLys266kvCRQCI7Abf4cXUWuCtq8XrTtWlfMew7nMlRNybYmFLjY1ipblGtuPRJZa1GXQlk9vIY+Et78Ac76Kp3NttGXNsBZFU073AN3HnYe22H5yjtC8aeANCTIvcQ+TmtMdXV7wlGEgpI=
Received: from BN0PR04CA0188.namprd04.prod.outlook.com (2603:10b6:408:e9::13)
 by BL3PR02MB8083.namprd02.prod.outlook.com (2603:10b6:208:35c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 12:03:32 +0000
Received: from BN1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::5e) by BN0PR04CA0188.outlook.office365.com
 (2603:10b6:408:e9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Tue, 17 May 2022 12:03:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT017.mail.protection.outlook.com (10.13.2.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 12:03:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 May 2022 05:03:29 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 17 May 2022 05:03:29 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org
Received: from [10.254.241.50] (port=36950)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nqvvF-0004t8-08; Tue, 17 May 2022 05:03:29 -0700
Message-ID: <a9f99838-8e4b-f6b9-2426-7e4b9f37e6fe@xilinx.com>
Date:   Tue, 17 May 2022 14:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] i2c: xiic: Correct the datatype for rx_watermark
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@xilinx.com>
References: <20220517053452.1526862-1-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220517053452.1526862-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 066c2b97-882d-4eb9-f012-08da37fd4350
X-MS-TrafficTypeDiagnostic: BL3PR02MB8083:EE_
X-Microsoft-Antispam-PRVS: <BL3PR02MB8083A377FD5CAB75CACD6C7BC6CE9@BL3PR02MB8083.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K7H0mf6MtIGPdGfX3t/PXkTtpqOKBvudUMkz9117NRXMNMmedys8v+7AQeDG3rgomkNeeNWasmsnj+P8/khNc3RJoTyaZR7hpLvtkYLVVrpP0GWVxg+FIMh1i8AqxtWOvMwVvJUvES/hJz/ETCh9Yd+xvqR3ykL0tuOCfQC+MQY9gqwPGNQqCeL9oDcgsg2vGXKlJPP4ZTXIvhwvDpYTv9/0HNrD1y6qzQNh9Z8vNA++BAolZnvKZRdKPbKCypBirEenAYEdhTHwxB4MrAsdZAJj+4PsgnnDdOn5NfLPvwACbNYJsUIYzzOdXgnMOYPtXC3is38VHB6gNzouZL5AwVYdjZzc9wB1V7Je//ECsxynCfEKgHNTF55ddYfH/24xWd9ffLbUIdxeJ4TVTNqCnAz1S361uH58rcaJemiy3vBx/9VDZjNc3RWK64a8008NmAOC56RbP1yzbtXtei8bD1FReM2ssGJ82B7P23x2YDhGkXPcaRZz7OBSJSntGTMNLEFCjFM5l9tiV/ZEBLD+YpxKR+GMv79Up2qsLUjKKK4oKLbVcF+EtYyBiWSgCqs7ZKFvIfoiPgZ9drlWw6iEIYyp3zyaSUZYbk5JP3sOMUszoqPYdYLmXh1Ray3vGzjqOeLm5CIdt0o8p9a4KaGqUc1u/ZxrzXiYGiPI/Yx9ViJNw6rN3cSyMKqLyw7Oo5nuYQ9y3Q69zmcuHnvoZ7QgN6X7yS1HFkZgFVeD93MrBY4=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(31686004)(26005)(36860700001)(5660300002)(107886003)(70586007)(83380400001)(9786002)(36756003)(70206006)(47076005)(53546011)(336012)(426003)(82310400005)(186003)(44832011)(2616005)(8936002)(316002)(110136005)(54906003)(2906002)(508600001)(8676002)(356005)(31696002)(4326008)(40460700003)(7636003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 12:03:32.0571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 066c2b97-882d-4eb9-f012-08da37fd4350
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8083
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/17/22 07:34, Shubhrajyoti Datta wrote:
> The message length data type should be u16 as per the i2c_msg structure.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v2:
> Typecast xiic_setreg
> 
>   drivers/i2c/busses/i2c-xiic.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index aa6e37a9f275..9a1c3f8b7048 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -578,7 +578,7 @@ static int xiic_busy(struct xiic_i2c *i2c)
>   
>   static void xiic_start_recv(struct xiic_i2c *i2c)
>   {
> -	u8 rx_watermark;
> +	u16 rx_watermark;
>   	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
>   
>   	/* Clear and enable Rx full interrupt. */
> @@ -593,7 +593,7 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
>   	rx_watermark = msg->len;
>   	if (rx_watermark > IIC_RX_FIFO_DEPTH)
>   		rx_watermark = IIC_RX_FIFO_DEPTH;
> -	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rx_watermark - 1);
> +	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, (u8)(rx_watermark - 1));
>   
>   	if (!(msg->flags & I2C_M_NOSTART))
>   		/* write the address */

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
