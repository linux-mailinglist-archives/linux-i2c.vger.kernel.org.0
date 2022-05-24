Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 222BA532CE0
	for <lists+linux-i2c@lfdr.de>; Tue, 24 May 2022 17:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238674AbiEXPGI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 11:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238668AbiEXPGF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 11:06:05 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDFCF0;
        Tue, 24 May 2022 08:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPSG1hXMQvDWRpJfhbcraNjQIKEAAw1usIF0ntvgdEkLTIsCxBJ0Y+i84vzIyOVsEBqv2YBsM2dniKThLHBN0LVc0XYS/tA4I6+yZRa2r6H9/lZd2sjk9vskmrH5vvwULdS892Y8N004CTIFgGYH2qTmS141tOoX09wb/rR5U1mH+74CQsf5rKvY/3MYCRpb8DtfzP7p/nH+fagG7j/vfADxPiPoX4uXYZrIBNFeoUpt9MCfvOKfBqFoJpRVHmSIklsAfcAq9vI2stN12zlYqvLk26Fg00+TMtAYsGBqMz4fsEjeiT7uE4OHQxyrnps8XvzpLnHpXUQqrBaYxAeDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fp3IYZm3PyZ1zPEGsYQl1Wi0Qa5U93WxIzPsK7b6kFw=;
 b=VqcyNK/CLix2oVrQQcp+PlC9mA/kFVWdzMUBFML3o6ORYbw888kyl5mizQ9/xlyodZxI1KF172P+7S1/D3E9oClPAEEb6sRx9r7R7J3GF+Wg26osbhjsetW44ApSBG8bDnIQnx9FsKuRYDDNt5j0YfUcU9TQBddcPd5FQZtntB0zvVWMB4IfMUOEsYwe62DoBsoewz5R6wSpRdvWwyVIzwzXnysjRMlHKOgzr4c6wAcJjXA18ITT1ftzFtH1P/TTk3yFlscDPDJmBS1sXBnbW3fcd+haZ1mrd/1slCQCie6TgS1VPNNPw53VkzPaVzrP72bh9GtdNbhLvC5SwGb+zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=wujek.eu smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fp3IYZm3PyZ1zPEGsYQl1Wi0Qa5U93WxIzPsK7b6kFw=;
 b=MzOaoTvK6drDqHgCT2Ma2swtTv4WWTym5uB4zhxM+ZaZEri+u2LL2tIRTKJbTiISHOsvJEnO7mArAptGj/yXQEKn3w68rcVTYGNcN9CJBzuuRoxZDmgBrGJwpfIvcW9wkkWvXK4R+XBLn+79vRpKvGpb/n2pq3ugqzMCYFA3hug=
Received: from SN1PR12CA0107.namprd12.prod.outlook.com (2603:10b6:802:21::42)
 by BL0PR02MB4817.namprd02.prod.outlook.com (2603:10b6:208:52::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Tue, 24 May
 2022 15:05:58 +0000
Received: from SN1NAM02FT0030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:21:cafe::a4) by SN1PR12CA0107.outlook.office365.com
 (2603:10b6:802:21::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 24 May 2022 15:05:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0030.mail.protection.outlook.com (10.97.5.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 15:05:58 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 24 May 2022 08:05:56 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 24 May 2022 08:05:56 -0700
Envelope-to: dev_public@wujek.eu,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [10.254.241.50] (port=39154)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1ntW6e-000F01-3K; Tue, 24 May 2022 08:05:56 -0700
Message-ID: <006cdaf6-2fe3-7f01-2597-50e7da1f88c8@xilinx.com>
Date:   Tue, 24 May 2022 17:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] i2c: busses: i2c-cadence: fix message length when
 receive block message
Content-Language: en-US
To:     Adam Wujek <dev_public@wujek.eu>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC:     Michal Simek <michal.simek@xilinx.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20220519124946.387373-1-dev_public@wujek.eu>
 <20220519231058.437365-1-dev_public@wujek.eu>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220519231058.437365-1-dev_public@wujek.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 726df282-8e73-4e03-7d87-08da3d96e8a4
X-MS-TrafficTypeDiagnostic: BL0PR02MB4817:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB4817CEF55F1EA055BE71FDEDC6D79@BL0PR02MB4817.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nHcCLTZtNCchF1/iKMrawwMxEBfwjDZ5uMzFg9z2pSg4VO/JDXbrnjvnyAirNVwIcORBZAUZR9AJdF32uuJq9UWqk25FI5EM6fbTdRaKWEGkYMxHYT/c0fGCjdgfX6H+mD5bxtbyzgdG/d9OqZUxkKr6MWFGpfV5sAsEQOji0pcFJ9MAGVnNxImpWZl6nJCbwVGQDccvFwDDgY2/pTvAQVkjbbvk4iDkna6++sN43Qt9b9MJTcoL2/Z+ijoKJPJgELwhRBQTzeFPLvjhldWNvlq/ernyHMrMe7Yi49ex+bVvB7XS4qHL2Z5tcNC2Rd7asmM3DB3+5M7cppFhgCZm8QlcLuJ07dKzFO1xvoupJPz6F7vnlZogmbSRM8br0dFw7f1uMrUrf+59XTaHx0btVSZmarPmfhHGNb+OuX12KAIGTA+cNds7K0hWzZiUti7XcHJgxh47hX+uEpAXWI20pDzLqFAR+6TdGtmmxJSrqKDvaPkfPoOqD8en8m8E2OOWdWmUGB0pS97RrEsRHLQA+BIdrLhDe54mjHOaK5w9NZAWYOHxSm9PLzAnJI2Bd0BQ1S9DiyXjTDDmmfmkuVamG4edpKCmFxWUeQr4/QY+ma2ZgQ5u7zbYpwYoSLbmOwueCvcOwT15aOfKMmfkc4XjmmR1M+L0Pu9oLznhyYmefhis3DLuFlkIO2+C0w2CTLrgUO3y2EFlC/mNI19hmtyo4Gf7o6DUbRxezQuYqrm0mjo=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8936002)(6636002)(36756003)(82310400005)(316002)(8676002)(70586007)(70206006)(4326008)(53546011)(110136005)(508600001)(15650500001)(5660300002)(54906003)(2906002)(31686004)(44832011)(9786002)(40460700003)(7636003)(26005)(356005)(186003)(31696002)(2616005)(47076005)(336012)(426003)(36860700001)(83380400001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:05:58.3048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 726df282-8e73-4e03-7d87-08da3d96e8a4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4817
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/20/22 01:11, Adam Wujek wrote:
> Needed by hwmon/pmbus_core driver to calculate PEC correctly.
> The hwmon/pmbus_core driver relies on bus drivers to update the message
> length of receive block transfers. Only in this type of smbus transfer
> the length is not known before the transfer is started.
> 
> Signed-off-by: Adam Wujek <dev_public@wujek.eu>
> ---
> Notes:
>      Changes in v2:
>      - fix multiline comment
> 
>   drivers/i2c/busses/i2c-cadence.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 805c77143a0f..a679eb390ef5 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -794,6 +794,13 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
>   		return -ETIMEDOUT;
>   	}
> 
> +	/*
> +	 * Update message len, as i2c/smbus driver (function
> +	 * i2c_smbus_xfer_emulated) relies on i2c device drivers to do this.
> +	 */
> +	if ((msg->flags & I2C_M_RECV_LEN) && (msg->flags & I2C_M_RD))
> +		msg->len = msg->buf[0] + 2; /* add len byte + PEC byte */
> +
>   	cdns_i2c_writereg(CDNS_I2C_IXR_ALL_INTR_MASK,
>   			  CDNS_I2C_IDR_OFFSET);
> 
> --
> 2.17.1
> 
> 

Shubhrajyoti: Can you please test it?

Thanks,
Michal
