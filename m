Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8AC6E0B59
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 12:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjDMKXx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 06:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjDMKXv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 06:23:51 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7AC19A3;
        Thu, 13 Apr 2023 03:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4JbJg5ByC4rfcMCc/4ZJaWvlStsxrFjNLtLWni/OsXuL1eVmzlzG9gZnasQZ661o4qC4aAzb3RMFjXQifSrsjjfWnWYRFsUfUuY/myUnwJzTTPTM47C9GVStBtEmSjuPm+59mHk5axdp5kD+MFhyZZxVR5Iqp5+HEqROoTSR6P5E7XRdSC1k0vrBik47C5chhOkSosw0RopHqdPNdT8K2fy9Hl4z4MPtijYFxaIRoSDvLFRgmAMkliK1nANGhywUYX5RlraIxW7Z8FV3oGsoYCMTtnp7KxZGcpux+jtQx+QiT4jcjND1x519coLw3ltPevyWs8Myuy2yhABE3PvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngIoX9y3pfqrZJS2915Z9yiWX4qbZBjdXR4SZi63OvU=;
 b=Gcd8VQzBhHwym7Mv/eHh31oBuKynPo0Q6l7vGgo8HoQ6drriHjQHLjiCLmzJxPb9xk5hLCI4UXTWyXH/2Q2Sdtdv68wz4M8hvAkNCjvOPKOuH+5YvSrAhxz5uiRk+fll6qavEbho3MBnyKFJzzEa8bUMHMo8QfphxnAvTeIqN+OS7ZBWC+RWiGnf5UU83a+qO7CbvVqMMPzCAzC2pQQyCov4HcR1bIjFtsVKMJy51DGFkEkCpaixRQCIP1NLGr1YfhvaiGPBDwooIXRVB5pgAfaML2cyKwMPw5pkl1sfUq13v7CHiDn5j08OXOsn+AiVJfoYQPmyOgkjFXZ80feYHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngIoX9y3pfqrZJS2915Z9yiWX4qbZBjdXR4SZi63OvU=;
 b=31uqsFPfNVqQa6VkINrJMVNvT2MlABncRykOuXSfNCvB874zD5q5cQgyFvsxhLqb/c6pRHPgEjuzfIsO7mA0Gj0aKA7t7qsJiE44ZNUKQnrodPTYD6uNRB6J0ax8s5tQzm/404iq5ib9/jRU8LU47eyxieVNOWfEVHzuaAQcK1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 10:22:39 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6277.038; Thu, 13 Apr 2023
 10:22:39 +0000
Message-ID: <db3c31d4-e545-aad4-9864-519bf7f2e8a3@amd.com>
Date:   Thu, 13 Apr 2023 12:22:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] i2c: cadence: Add reset controller support
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230406154834.171577-1-lars@metafoo.de>
 <20230406154834.171577-2-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230406154834.171577-2-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0007.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::17) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f575a0-253a-4adc-1c49-08db3c09022c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WAaeUFYP138sa77O7WGOj4oW+6ddYRPZmTKjrDL30lWhYR2SFR4bwKmsVxRXDCQIt6lorSl2ymfSfzcN7pGtXcB/Sc6IG3tf6PpRQ+T2hyzZ1p1+fE22SbD3gOJy8D6m62expYVekqcMiyhiNIIPpIBaTdZIOtwKKDxaNmPkLtbW3ex9VqzCAruNeXwgesG1RYVPqab4QE/W7C64EFMnVPOhED9TyhpBe2cUKaF23HVW8pNB79bUSjz9mKabBKl+Nipypl8/uaVPhzjmg7UyVqYd5GTp5g2G3BB23163h6KH/98TYOOMD4r4mwa5TbqQlmW1qYEFGcRvBGSV3N4a9TFS7wGm3VniKtwSw+rSXPcbGWi7cqkkXuphvyMNl85636V4059XoP0BOCssCqIsDh3ZHi10Qxu/Lw1OxJS+1oRumnCvWLepbXE708voI3qLWeNCluRjtcisCtmfQI5E77FbCuYdUWwKBP+bAiv9O9OJ09Teo89LC1pW860hq3vhr4xW8oUy7PFNVHly/d8Mo0sQerz97MZ8IulDAM4ZBLgGdH43IRA4mZq9bEYiODFDIlQjFQVx09gGoFC1XrnEhnMIsc1WJ7musORtPXKUzXWpqwLFAFqgOXWtQSg9Lji57XHrqsMVbjWFFdvDfLcBLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(316002)(8676002)(4326008)(66556008)(66476007)(66946007)(54906003)(478600001)(41300700001)(110136005)(31686004)(36756003)(31696002)(86362001)(2616005)(6512007)(6506007)(26005)(6666004)(6486002)(53546011)(83380400001)(44832011)(2906002)(5660300002)(8936002)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TytJQmdkNGlpYzlCR01QengrVDdNSkVxSm84eEJBcCtGdjZHeDNBaVp5U1J2?=
 =?utf-8?B?RWljd3doMVlUSzdUSVNRMmtBMGo2OG9oQ2ZBWjI2RWxyNkhzVWVwTEJIdk4r?=
 =?utf-8?B?TVZRUHM4OERIY3ZvcjVtOEw4bHRsU2MxdC85ajFtZjMwV3YvaXlIRmpLV2d2?=
 =?utf-8?B?eWF6MWI4R3phUEZTaUgxRG1wT0Voa01WUlJma09aMkR1L25Jelc5R3FDQmNH?=
 =?utf-8?B?a0MzRTZyTWNZTncybTFrQTZWMXZjL1BqSndoRFhCdmttZVlnQjVaSFVhSlZ5?=
 =?utf-8?B?MmNjSjhBM1pNRTdlRjJXMXkzTXh3QU1JUHk5d3R0ZUhqTWlpRVRFVmxqNGh4?=
 =?utf-8?B?S1BBTTlRMEN4TjU5NU1RRGZQYTZJWmpsL05mcTBZUWRtMEgxam1CM2NwTG1w?=
 =?utf-8?B?cFN3WGRMdS9Fa3VyUk1yRks1cVExSWE4TkFacHBvMWtNYnZuRnJXdFVMWk8y?=
 =?utf-8?B?QjlsdEY5UjMwQ1NZaWErR1h6dzM4ekxNVnZqbklkT1phcmJ3QmpOQ2NWVlN4?=
 =?utf-8?B?MURXVzFlRjFLNlFNNlN1QTJBWVExRENSNVltRDZjOUswNVdTK3hITlFFN3cx?=
 =?utf-8?B?eVFVL3lxcHNJc3dMREltSUZFaWZ5OW0zenlRZzVIak5oQVBURHc0aVNXek56?=
 =?utf-8?B?OUxrRlNHZXE5YktHUkJvUERlSHhvdEYrS0dITExFWVk4SE15OEtiTTBFTzJh?=
 =?utf-8?B?NzNmdldsdGZmcStJbGZ0N1MwTlJBOW5HN3gyWUYyR0JRQjg0R005R2QyUFZp?=
 =?utf-8?B?THczMWtWbkpRK3d0eW50T0pBQVhmRWtwSXBML2xmNUUzSXZyWDMrZ0E3SXBv?=
 =?utf-8?B?cXl0Y1ozRDcwbXhxbGhQZ2VtZTVTYjRmWlQ0bzZ4RjRuZUhDaXF6MGhlQ0tG?=
 =?utf-8?B?S1VNaVdHSWJrc3VSYWRpR20wM0dSOWtSUXdHdUtJdjBmZWRUUm42RE5NbFFk?=
 =?utf-8?B?NHIydGhzYXVZa0tpbmFZay9INldPOFI1ZWtYR0h6NWc3TE4vUkVEY21oQWNl?=
 =?utf-8?B?WExTU3BpUjZuN3hnNlljR21VNU0rSjY3TWtGL2hjQnhBTUlEdEgyZFUwem1I?=
 =?utf-8?B?WWJ5eDUwU01YaFpwRG1HNWliQ3l6blFCZzdGaUVLd3R6ZkRpUmQrQUo2WlM4?=
 =?utf-8?B?RllvNmVOTm5SS0xHcVpkOGVOejllbjk0MGxQTXN2czlPQ3EwKzcwVHZ3L2pX?=
 =?utf-8?B?MHppbmc4NkdlMGNjbVZDd29kdmRtZVFUNDFnUTJXYzBFcTE1QzdyZzk4MHVo?=
 =?utf-8?B?OVpISEN4SGtMVDA0cG93K05oVVppaVBITmtzaUdBc1cyZ2c1TnVORTZUZkJS?=
 =?utf-8?B?TXY1K1R1cng0bzYwbzF0VjhzbTk4RTBlRkRYR2twWUlmVTJCbFFIL2dGRktz?=
 =?utf-8?B?N3BNSkM5c2sxOWF0eDYyQllBR0FoaGdFc0dhOWRjY3pyQ1RVSjM4R2g3V0Ns?=
 =?utf-8?B?bmxJUTZ2UDByaFVOMUtYN3BiYktKeHQrVS9lY0VXcUxhc0NnbGR4K0ZtM2ts?=
 =?utf-8?B?L01GQktLSFVBdWRrYVg4MGNGL1Aza0lNYnhEaWM5L1ZFZnNSYlhMTHBpcEQr?=
 =?utf-8?B?SDJLbXVjQ2hRRU9wMTNqa0lmZUs4bjVaWGdVWWVwUE81MlR2cnVLak9odm5u?=
 =?utf-8?B?UkFzMUpQRTI5YlFvak9NMmE1a3lxQUdvUGh3K2p5WGF2LzRnUURYdFJBVWtG?=
 =?utf-8?B?RTByVE4wRGtKTVhTb2pPdXBsc3N3MEFkbjdJeGhiQ3ZLRnc4WUpRdDlSVVlh?=
 =?utf-8?B?QW1PamJRWlI1SzMzSnVHeUdGdW4xM3d0RHFHdUwzdDM3VTNiSE5YUGJGYjRV?=
 =?utf-8?B?TEM5NmFTTG00Sk85bG1CRDVNRGFWY1V4SVc0Z3BXbldldVJqRkNRcnJZMWhC?=
 =?utf-8?B?bnNEOFlha3JBc0t4U2sxZ29MZUxlcmh5QkVYVzFOVXE1S3RQZXdDNEtQeTcy?=
 =?utf-8?B?bkdHMGZpYVFhTlg5VXhad09wMnZzRTF1VGNCTnpYUStad0xtSHRFMjYwdUYy?=
 =?utf-8?B?dUxFWEdNQUJML1cxZ0JtNEUvNkpUa1FzUUwyVG83YmxLbXRzbTBadEpSZm00?=
 =?utf-8?B?L25JQ2s4Y0ZENkV4UHpyWE4wVmRWK0NVUXQvK2gxU2VtTVFrdnpjOHZ5OXA0?=
 =?utf-8?Q?SiP16waJJJT6Y58JcvuvFoGRj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f575a0-253a-4adc-1c49-08db3c09022c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:22:39.5090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtkKi0Awyvy65sGNLu6AksGAgKtZOFXb4UuEjeI+9isNK13Rtgn2pLEE0eDiE1d2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/6/23 17:48, Lars-Peter Clausen wrote:
> The Cadence I2C controller has an external reset signal that needs to be
> de-asserted before the I2C controller can be used.
> 
> Add support to the driver to be able to take the peripheral out of reset
> using the reset controller API. The reset is optional in the driver for
> compatibility to systems where the reset managed by the bootloader.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
> Changes since v1:
>    * Fix indentation
> ---
>   drivers/i2c/busses/i2c-cadence.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 8f61a633c42c..f1a67c410ad3 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -16,6 +16,7 @@
>   #include <linux/of.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pinctrl/consumer.h>
> +#include <linux/reset.h>
>   
>   /* Register offsets for the I2C device. */
>   #define CDNS_I2C_CR_OFFSET		0x00 /* Control Register, RW */
> @@ -178,6 +179,7 @@ enum cdns_i2c_slave_state {
>    * @bus_hold_flag:	Flag used in repeated start for clearing HOLD bit
>    * @clk:		Pointer to struct clk
>    * @clk_rate_change_nb:	Notifier block for clock rate changes
> + * @reset:		Reset control for the device
>    * @quirks:		flag for broken hold bit usage in r1p10
>    * @ctrl_reg:		Cached value of the control register.
>    * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
> @@ -204,6 +206,7 @@ struct cdns_i2c {
>   	unsigned int bus_hold_flag;
>   	struct clk *clk;
>   	struct notifier_block clk_rate_change_nb;
> +	struct reset_control *reset;
>   	u32 quirks;
>   	u32 ctrl_reg;
>   	struct i2c_bus_recovery_info rinfo;
> @@ -1325,10 +1328,22 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   		return dev_err_probe(&pdev->dev, PTR_ERR(id->clk),
>   				     "input clock not found.\n");
>   
> +	id->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> +	if (IS_ERR(id->reset))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(id->reset),
> +				     "Failed to request reset.\n");
> +
>   	ret = clk_prepare_enable(id->clk);
>   	if (ret)
>   		dev_err(&pdev->dev, "Unable to enable clock.\n");
>   
> +	ret = reset_control_deassert(id->reset);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret,
> +			      "Failed to de-assert reset.\n");
> +		goto err_clk_dis;
> +	}
> +
>   	pm_runtime_set_autosuspend_delay(id->dev, CNDS_I2C_PM_TIMEOUT);
>   	pm_runtime_use_autosuspend(id->dev);
>   	pm_runtime_set_active(id->dev);
> @@ -1360,28 +1375,30 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   	if (ret) {
>   		dev_err(&pdev->dev, "invalid SCL clock: %u Hz\n", id->i2c_clk);
>   		ret = -EINVAL;
> -		goto err_clk_dis;
> +		goto err_clk_notifier_unregister;
>   	}
>   
>   	ret = devm_request_irq(&pdev->dev, irq, cdns_i2c_isr, 0,
>   				 DRIVER_NAME, id);
>   	if (ret) {
>   		dev_err(&pdev->dev, "cannot get irq %d\n", irq);
> -		goto err_clk_dis;
> +		goto err_clk_notifier_unregister;
>   	}
>   	cdns_i2c_init(id);
>   
>   	ret = i2c_add_adapter(&id->adap);
>   	if (ret < 0)
> -		goto err_clk_dis;
> +		goto err_clk_notifier_unregister;
>   
>   	dev_info(&pdev->dev, "%u kHz mmio %08lx irq %d\n",
>   		 id->i2c_clk / 1000, (unsigned long)r_mem->start, irq);
>   
>   	return 0;
>   
> -err_clk_dis:
> +err_clk_notifier_unregister:
>   	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
> +	reset_control_assert(id->reset);
> +err_clk_dis:
>   	clk_disable_unprepare(id->clk);
>   	pm_runtime_disable(&pdev->dev);
>   	pm_runtime_set_suspended(&pdev->dev);
> @@ -1406,6 +1423,7 @@ static int cdns_i2c_remove(struct platform_device *pdev)
>   
>   	i2c_del_adapter(&id->adap);
>   	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
> +	reset_control_assert(id->reset);
>   	clk_disable_unprepare(id->clk);
>   
>   	return 0;

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
