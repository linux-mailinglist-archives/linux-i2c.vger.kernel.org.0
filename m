Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A02856537F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jul 2022 13:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiGDLaZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jul 2022 07:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbiGDLaZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Jul 2022 07:30:25 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86584E087
        for <linux-i2c@vger.kernel.org>; Mon,  4 Jul 2022 04:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hu/tec3povgGjGJte2dRBLFK6Tve6L6h8HnsG7m7QUGGx0PM60JAoy1hDs2zGSIS4FicropeCu4WijPinC1eaNcv4Yx2g49OvvxMNwZ1nKFmtTeLWq/kU9lWXRd4HDpnHW23VW1/B508Xq7DU1G6O9zgedCfZgdsB/8UNZ0tgaNHMldK6uNdS0zbFw1qysOq5MPAJ1YUrAbQ+ObD1QYlEZEoOf0Qdtwpz2rtUmTkqxBTX8/EgysCsC+Kjz/Fe/kLxhdRo3WT+fg5V4IMCay0bz04K8kL5A9kyUXvnjwhBVsRGWix9Lfvu4DMemzk+x6ZoCl9O+e+LIzOUW+X7ARsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaVCnvPpegTaMI5RZ5A2FP0jSzhGFCZ0gfiCshaiYiI=;
 b=Zmr9ZB6x4M2t/d7D2xHqyVsX2qo17zzq6yTPqR88hrXv/gA5epgNj1DH982YjZAXaa3p/sU551vJabDWZfxPV9tH9Q9bati+670T70JA9//cbR6b3byUxfTdanm3gJ5bnmHOfqEwG6E07gk4NC4fkC8t+mpVUvVrGuFg4i8pZlCioHCUweUWBnh9KvvIXLdcJWu3I0CdgKHc3SdLrQi/YJpqbNjL7c8SLb7tzPEB3MjT0NlLktPCe2AnsvZtfzYaPmV4EHZYDHZeaADLaKnpSzedU3kznx0Z6Du9Ge3OLKOmXN8NTMfuFZU453oYkXxKVkCje+C49bVheQroaDauWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaVCnvPpegTaMI5RZ5A2FP0jSzhGFCZ0gfiCshaiYiI=;
 b=3LIIiAFgMrGNybRaIi4kPJxFVMxYytp8FsVqbNraL+E6n4KAPWgqx3g6aYWlHIiqD5V7jBP3yw+T2A8mTTAUm9ghtr16PlANFHSXX7K/zLH8Z7aqpfuY+ZJO0Ewq3wNkv7He9Mn3nTHmby7qkEWX64BDimsl/vGSv2wodzSVbV8=
Received: from BN6PR1101CA0016.namprd11.prod.outlook.com
 (2603:10b6:405:4a::26) by DM5PR1201MB0027.namprd12.prod.outlook.com
 (2603:10b6:4:59::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 11:30:21 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4a:cafe::2c) by BN6PR1101CA0016.outlook.office365.com
 (2603:10b6:405:4a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Mon, 4 Jul 2022 11:30:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 11:30:19 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 4 Jul
 2022 06:30:10 -0500
Message-ID: <b5cf2f85-37a5-07ab-9ce6-a4cfab60b7fe@amd.com>
Date:   Mon, 4 Jul 2022 13:30:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] i2c: cadence: Add standard bus recovery support
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>,
        Robert Hancock <robert.hancock@calian.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
References: <1656914060-24445-1-git-send-email-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <1656914060-24445-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9e6e3b8-b1de-482c-bc38-08da5db0933c
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0027:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mOMLKzZh4tZBdqKef6fHEGbVFI9WbrSdnsRjr3BhrDH4/zCm7XnjmvpM80DG/rhKxcabM5P6n7kmTjR4w1yQfBrbCL6o5oKI8hjYioFZEf8TauUrN1lmDScgu3GufRdoOWHWm1G5hu4SmChLav771hd3qGXTWxULvhO+q6OxAOl9jALgX9vgVJLOSyHIIP6aQjbXbP+9sObJnR/690CRNJ0qpWaKIDwu97kiEijPCRAqtC3Zrg1wMEgbfKO0TOP8P3wVhTjeuFf/urMAdE1lB4u7wV0gOLyllX3I6gE58Rh/LtIAx4+2L5RCPvO4o7D6KPnPCtnKRJ6kIwkxqQUS9L/xq6NpAtNBydyHE3ad5Weyjm8A6d5N2T/RWUcLykF1zzfVOBGDO1pD2KmhV9KQpQyYu11Yzl5FMvVgt0fISZv42XYw1qP2BIM1i7p/gfp3VYI7LnWGDMvAJmvmdQ8WzViX1zTtRWtE0xe7DiLn8FL5LZ7/xYvAZUGHSozxz4SjcLqU8D/qvSeeTU313IbE0JniW32zoabVYnqzZOiA15282J8yNEUsmd9lGt4eZPFNxKDTxmWJSU/RfMmQRXClN8NjpCDfYdzl1pztmy5f4CI8BRqYbGXe5DG276rzTuNqzECrqiKylBHA7w1+EitJ6iaAJXSUj4V9FzBftJwppMjReTDlfLO5+l0zt4DrwzOy4YIFnMtVv/97ZAWAHNqdajdXAblbtzZxmdDQog/VlFwJeUHtRtz0dZjYCqB0CCZfuVBhla5Dk/DiDctkW/9rTiniPERnfaOrW4fpEkxtsWKgSECwgHlC8zERVERFY3bcegA8MZc0jgUJMRW5zMMyMfH3lWgW0lfKpxmF6n+9J+Ud5wKnKspTx+LHaei64MSDk4P9V+JwlmKIF31ZKl7hOyJiLLytDP8bfATSl5RCVaN5C4ENNp6z2nUpKLNJfDiH
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(40470700004)(36840700001)(5660300002)(2616005)(86362001)(478600001)(6666004)(8936002)(53546011)(2906002)(41300700001)(44832011)(26005)(82310400005)(356005)(81166007)(82740400003)(8676002)(83380400001)(16526019)(31696002)(40460700003)(47076005)(426003)(336012)(186003)(34020700004)(36860700001)(110136005)(54906003)(16576012)(31686004)(36756003)(70586007)(70206006)(4326008)(316002)(966005)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 11:30:19.0954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e6e3b8-b1de-482c-bc38-08da5db0933c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0027
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/4/22 07:54, Shubhrajyoti Datta wrote:
> From: Robert Hancock <robert.hancock@calian.com>
> 
> Hook up the standard GPIO/pinctrl-based recovery support..
> In the discurssion

typo

> https://patchwork.ozlabs.org/project/linux-i2c/patch/20211129090116.16628-1-shubhrajyoti.datta@xilinx.com/
> 
> recovery should be done at the beginning of the transaction.
> Here we are doing the recovery at the beginning on a timeout.
> 
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> v2:
> Updated the busbusy check on a timeout
> 
>   drivers/i2c/busses/i2c-cadence.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index b4c1ad19cdae..cf15eca1f9e4 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -10,6 +10,7 @@
>   #include <linux/i2c.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> +#include <linux/iopoll.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/of.h>
> @@ -125,6 +126,8 @@
>   #define CDNS_I2C_DIVB_MAX	64
>   
>   #define CDNS_I2C_TIMEOUT_MAX	0xFF
> +#define CDNS_I2C_POLL_US	100000
> +#define CDNS_I2C_TIMEOUT_US	500000
>   
>   #define CDNS_I2C_BROKEN_HOLD_BIT	BIT(0)
>   
> @@ -179,6 +182,7 @@ enum cdns_i2c_slave_state {
>    * @clk_rate_change_nb:	Notifier block for clock rate changes
>    * @quirks:		flag for broken hold bit usage in r1p10
>    * @ctrl_reg:		Cached value of the control register.
> + * @rinfo:		Structure holding recovery information.
>    * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
>    * @slave:		Registered slave instance.
>    * @dev_mode:		I2C operating role(master/slave).
> @@ -204,6 +208,7 @@ struct cdns_i2c {
>   	struct notifier_block clk_rate_change_nb;
>   	u32 quirks;
>   	u32 ctrl_reg;
> +	struct i2c_bus_recovery_info rinfo;
>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
>   	u16 ctrl_reg_diva_divb;
>   	struct i2c_client *slave;
> @@ -796,6 +801,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
>   	/* Wait for the signal of completion */
>   	time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
>   	if (time_left == 0) {
> +		i2c_recover_bus(adap);
>   		cdns_i2c_master_reset(adap);
>   		dev_err(id->adap.dev.parent,
>   				"timeout waiting on completion\n");
> @@ -852,8 +858,12 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   #endif
>   
>   	/* Check if the bus is free */
> -	if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) & CDNS_I2C_SR_BA) {
> +	ret = readl_poll_timeout(id->membase + CDNS_I2C_SR_OFFSET, reg,
> +				 !(reg & CDNS_I2C_SR_BA),
> +				 CDNS_I2C_POLL_US, CDNS_I2C_TIMEOUT_US);
> +	if (ret) {
>   		ret = -EAGAIN;
> +		i2c_recover_bus(adap);
>   		goto out;
>   	}
>   
> @@ -1278,6 +1288,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   	id->adap.retries = 3;		/* Default retry value. */
>   	id->adap.algo_data = id;
>   	id->adap.dev.parent = &pdev->dev;
> +	id->adap.bus_recovery_info = &id->rinfo;
>   	init_completion(&id->xfer_done);
>   	snprintf(id->adap.name, sizeof(id->adap.name),
>   		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);

I have no problem with it. I expect you have tested it on the real HW.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

