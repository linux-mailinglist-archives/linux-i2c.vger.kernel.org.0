Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69F274E2CFD
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Mar 2022 16:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348248AbiCUP6x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Mar 2022 11:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236298AbiCUP6v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Mar 2022 11:58:51 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A8F1817A9;
        Mon, 21 Mar 2022 08:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heGBAiss2gGUjffD2xOOg4C+Km9CELn9ZzoM8pKlVquKP1J0dZ4gntYNsl6sgQmElmeaTi3z0wBQKao5SKgVPmMz4tSw7W+wMQr7tULxYJal8iFoEeYm1sGi6aIXm0Te7fVdbAGaLKLsuJp1OqlL+3LF7M2xRgamGKsWJ1tdp0puK3cngwlls8Tg1oHfMIoR6T8a6PIeFSDfZ7lUASOBxArtHIzQTBui/8ynjhf1pPw9f43I1tZ99sUImMYJqJa52vY/ZYBqhfhNYto2g055x//FtF14Cyw77eIYBT46UImcUzD5lrYx9zQLEC2d+nacc7iSIdxpH2HJz/UkHjo0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLUbdUpnDeOElD7GlXamCZsg/mvNxKFSF0rXj2zS0Ec=;
 b=mkyc8xzvMSCFwnIN6JeIRlITFjjvMPUvwmhGKKYGFtUCam319plDqih0DqbRgZAVB+3C3B1b3yUbxo06XNzSlEL1TOhRcwlfM1iB0V+4OVtlNhkJ/uFQXxyGy5FdhPS1hT/aCAQXHPWj6H3sDhwnlUKBSTGoiZx3Dl576ImV75dWISK34vSPAglTVLheKaEkb4h10t9vmO+stpq6q84dSMD+jXYxZPKyDbExcr/OaHtOYM7IUTILqYkq3q72KeI/ThmpxUA99APoRsoLQ5nGcJ8waRUOwWB0w+AA8NEbzxIgeCBMgsqgG+owGHFZuO29SxmJC7IpRquhltwj7V7exQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=opensource.cirrus.com
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLUbdUpnDeOElD7GlXamCZsg/mvNxKFSF0rXj2zS0Ec=;
 b=cyy0QXxumfI3+TXQvoDpc9Seh3svqT977cgZ+cMxAO3o58cHFz7NaYaQxobiKd5DSQlLY4BoPOuGes4hwClxdM5CncX82DiKQ3f4JptRTywag98kZQIaVqWSzs06MHlnju3qlg4fzP/5W1vvq/Fymrms23RceSPsKX4QHnCN15g=
Received: from SN4PR0201CA0037.namprd02.prod.outlook.com
 (2603:10b6:803:2e::23) by MWHPR0201MB3419.namprd02.prod.outlook.com
 (2603:10b6:301:77::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 15:57:24 +0000
Received: from SN1NAM02FT0022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2e:cafe::fe) by SN4PR0201CA0037.outlook.office365.com
 (2603:10b6:803:2e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22 via Frontend
 Transport; Mon, 21 Mar 2022 15:57:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0022.mail.protection.outlook.com (10.97.5.0) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Mon, 21 Mar 2022 15:57:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 21 Mar 2022 08:57:15 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 21 Mar 2022 08:57:15 -0700
Envelope-to: tanureal@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Received: from [10.254.241.50] (port=49066)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nWKPD-000C07-IC; Mon, 21 Mar 2022 08:57:15 -0700
Message-ID: <dd26fa4a-870e-d969-04df-1f42487e2b54@xilinx.com>
Date:   Mon, 21 Mar 2022 16:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] i2c: cadence: Increase timeout per message if necessary
Content-Language: en-US
To:     Lucas Tanure <tanureal@opensource.cirrus.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20220309093147.102385-1-tanureal@opensource.cirrus.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220309093147.102385-1-tanureal@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c3b160e-5024-420e-8af2-08da0b537d30
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3419:EE_
X-Microsoft-Antispam-PRVS: <MWHPR0201MB34193A7EAC35EC4C47AEF21CC6169@MWHPR0201MB3419.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qrHPYdIa8okcdXQFllfsPfBLY9QTZRC+n0BC/b53ML9tOEpsDIA9FXb5wHvqPXeojNfu1qZYaQRqH+OLyLR8Epaxr86p7V/3RdzmxqUiH4y7RQpwQ6spyr9xafjLOpRnBKkaQZq7+uD0hphxOR96Awj8fDTWaE1xcNsiK3kZJ3U0d2pdqLktmOEJaoidasDQMzFqWCrQzh786vrZiahh4AN0H6YXk10dNOTPrTrvpM7L0K9iEdWlWc+Gl1VRKbzqKifVcGDq6E0aNJgxN9w5ok35IoewLSL+3AKvLSFkMCMfh1hs4mnxvqujXPFJ7HF27VjATuPEbRDIypADsoh//uA5OnWPOiiIqPUIQCbmSt5rZ919Io7H9EyLVeWeWbk+dAm94QdjsZ68JGQpKwFhVhKvRq6r6XK+C9SGPc5qZ47BryP+FpyMAnc0lpyCh6l3cUtQTLKORTZMs5LFptmNv1TY+7Hs05h78tTRzmjymmcBxkXZnK5pCEfJIjupcAYVkMI1anreTMX0IZsO3WhfglkETlj62xi+1zilnPcqAi3+5CSfIZhjYghJI7ZshCOfMDZdVvQagUau1uGrz1PtLT7hHUH1a2w5raJP5goMrjDvUArcS1OAPs+Ewk6ZyWaPLVeluJ4YlwazNkR4Tp1bKJ9BvO9Fl9PLfTQz7I9GEfGE2TqNP5N+r6kTRZDYO2H44hobiN8zi3dSyIzrMF0CqnIMYl/36gmESWML8dgF/Fg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(31686004)(336012)(47076005)(356005)(70586007)(36756003)(5660300002)(70206006)(40460700003)(7636003)(186003)(26005)(8676002)(53546011)(426003)(36860700001)(110136005)(2906002)(4326008)(15650500001)(2616005)(44832011)(31696002)(6636002)(508600001)(9786002)(8936002)(54906003)(82310400004)(83380400001)(316002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 15:57:23.5933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3b160e-5024-420e-8af2-08da0b537d30
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3419
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Shubhrajyoti

On 3/9/22 10:31, Lucas Tanure wrote:
> Timeout as 1 second sets a upper limit on the length of
> the transfer executed, but there is no maximum length of
> a write or read message set in i2c_adapter_quirks for this
> controller.

nit: I would expect that you have run any test and you reached an issue.
Would be good to describe what exactly you have tried on which configuration to 
make it super clear.

> 
> To remove that limitation calculate the minimal time
> necessary, plus some wiggle room, for every message
> and use it instead of the default one second, if
> more than one second.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 805c77143a0f..b4c1ad19cdae 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -760,7 +760,7 @@ static void cdns_i2c_master_reset(struct i2c_adapter *adap)
>   static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
>   		struct i2c_adapter *adap)
>   {
> -	unsigned long time_left;
> +	unsigned long time_left, msg_timeout;
>   	u32 reg;
>   
>   	id->p_msg = msg;
> @@ -785,8 +785,16 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
>   	else
>   		cdns_i2c_msend(id);
>   
> +	/* Minimal time to execute this message */
> +	msg_timeout = msecs_to_jiffies((1000 * msg->len * BITS_PER_BYTE) / id->i2c_clk);
> +	/* Plus some wiggle room */
> +	msg_timeout += msecs_to_jiffies(500);
> +
> +	if (msg_timeout < adap->timeout)
> +		msg_timeout = adap->timeout;
> +
>   	/* Wait for the signal of completion */
> -	time_left = wait_for_completion_timeout(&id->xfer_done, adap->timeout);
> +	time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
>   	if (time_left == 0) {
>   		cdns_i2c_master_reset(adap);
>   		dev_err(id->adap.dev.parent,


If my assumption is right and there is any actual issue you had please send v2 
and feel free to add there my:
Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal


