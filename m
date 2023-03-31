Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F6C6D17C6
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 08:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCaGt0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 02:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjCaGtZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 02:49:25 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91626171E;
        Thu, 30 Mar 2023 23:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HemTx4LTys6pfzLJDKLHUZ8vb69TO54jU7sRM5aidA3oNpGSeog6JOvTkOFg98r2DI8oZZYp4fErkQotDlM1NBTHUqj0L6Iq47gviJYE5aY9A/Yzb7pauOcRxdNgJ5ls3U0wgNt0drqfyiGoYG1sjtvMRYuoH4MeSEJ7bxjVyc2ouRSaMyZU/HIiL2BDXy1sB8cJZwLTKvPvjDY3YYVMhSrciDnPD1kLepNJ1KEoPP6bp4XKls7eYJtv8zOex0SELPLkYzeXsBU3L9WflqU3xYvW7DF2YaJJ+dsBlmGIHn9tx8nMxsUzS5d/8CVwZFkYpzgvU9nPuMUrEtFuW4QgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa5wgIMFtc9nWz/dMH3AIA7iAkCLOi9dzyl2/VV91Xc=;
 b=Za00mXcy4GfbXShFZoB69RAS2M6qCxW2ETW2m6DakqZycXMtKnQiD/WJkX3KbSb+H9j36d5UEUBZb0aIoVM/ZJ6dUGyAbowpVhHvWOjrheYQ2keXT31s4wWBq0aJkri4FjaHIcQ6F4aH1Psh8rp4Ue7qSbw9gZdaycX6e1W1zJ7lV1qT31Gr2kTvY8mBu7Iw7fG4CUBDhVcpx80wIn4Q6RF8ZBWr0jaa+7N0TvQ9WiUjfJz7LnnsPYKhBndLYO6FJYdfxqId91OXz9fLab5oMXVwTCY1NpuPVUjJ/mR+Rs4if9ql3b+Ibx3c47lvBmS5w33fDVMb7GLiTsWAnVNuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa5wgIMFtc9nWz/dMH3AIA7iAkCLOi9dzyl2/VV91Xc=;
 b=noKwKKjpCY6Ymy95tW1fcvQZxcxEu6glXFQLMysl3gZBydqh8uiuaIA95k427LwizQ4GY63iYxBfIsKpsK2rjIfamFk9gmJwBx46vV/7jswuJEYUV7srzGdGhWGY1JZHUjT3lhTVLc8A100Hrxd5hhE3TaPwbvpyxgeP2iPMYHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 06:49:21 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6222.035; Fri, 31 Mar 2023
 06:49:21 +0000
Message-ID: <1e929c0d-9a3c-1adb-b5de-e953f2cf3795@amd.com>
Date:   Fri, 31 Mar 2023 08:49:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] i2c: cadence: Add reset controller support
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230330180448.269635-1-lars@metafoo.de>
 <20230330180448.269635-2-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230330180448.269635-2-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|IA1PR12MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8ddda2-356a-40fa-2f7b-08db31b40ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2UVal4E7rirLg0wXTJXHTwXK4LErdFhPpiYVr0UFTHJ0BDQdOdh5t7dwj9UUAmc7MEATea923W8lt6QlNFQC4koAz5Ra9D7kNeE8mRSZ3g8jZdlVG+QmHpdcIdMv0+TzjdCVmRvMr+AfjGCOxxNI9NtqwPV8FE/tcQ2pqfO4aRQk1rQJ0YrLAjSFAYic9/r3d/qFm8hbJA19blpj4J+hpAG6pGPTNR/p4A8pZXVZwEKjJcyUdNIcSkIKiD3zmp/Dzu7WJTIgP9NZod60J5qwLZsZl5KEIZeG53dYXJ9sP7rbIYr3JRgtRc6QKu81wYUQj/jC1Ez/nDajOTY0R1JPsTJp4+gNWLKkbYfwB3C9Y3skYCKQ7ezrMjAYsqViegjLJGvR2m6VPKRMFHUHmHUOaU+EOX/0pITvjqcVIV0ALmR1ZhSZInv8D8KBuAX1y5pz06xnuRCbSay59yiyTjSJzLHqra45jgZ5aLfW6L/pqv8UFlPs7PgLIACp/dw9/BT+AOahNR/mUW3irR1RY6J7oyQR0UOTFf3Wz3PS7fv4efZ6DjvLZl8nvp7eYfEuFgMm/LBPysKx+di/VVwlPe6MC/y1I2q05QwkDREisvIieiMiGDZVRMtRY3TbMESK7b5PmLnCZNj+sQ+krdM6uPtRTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(66946007)(478600001)(6666004)(6486002)(53546011)(6506007)(26005)(31686004)(6512007)(316002)(110136005)(54906003)(186003)(66556008)(66476007)(83380400001)(2616005)(8676002)(4326008)(2906002)(41300700001)(5660300002)(38100700002)(44832011)(8936002)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWdYeEJZZS81M2hSQXJlZVNleGUyU1VtdmdnYTRDKzZiMnllTlVwQklhK2lZ?=
 =?utf-8?B?N2Jmb0xVL1V5QXpYZjZubWptY28rN1V5cTRhVnRpbnlwUUIyS1A3M3dUU1U4?=
 =?utf-8?B?VTRLU1lCWDdIRFR2UmpDRzd4aFY0cHBOTjNqSlIwZE5HQytQWit5QWtKSC93?=
 =?utf-8?B?WVpWWEIwR3ZGdjlnRVJ5bmpKQ0hlenNWWVBYT0pJQllvT0lqbFdoKzdLSThF?=
 =?utf-8?B?QktjTTdWeEV2SWxvZmUydXI2Sm03Yzk5K3lydTllMERLM2dJRTFPUS9HQysw?=
 =?utf-8?B?SUFqSHhBazZkeHdUR1dvMTNPaFA4RWx6QW55ZFVOd1VETjZYSjJYSkFKR3Ez?=
 =?utf-8?B?VmZZMGRTUVl6azFJVFU1blNFRTliNjVIQ1ZTRmFJVkpLRG9XVkFHWUllM3VH?=
 =?utf-8?B?ellNWkVYZFdkM1pKSWUybHVzVjRubXoxQ0pyckQ1Vm4yUWJpNXRPMW1XVE9h?=
 =?utf-8?B?ZGx6azlRalRwL3JaUUo1VkEwZEg3cFR0M2tUb2pLQ2lIcWRWRnJIM1RPUkFp?=
 =?utf-8?B?eW9iZnhFek9IZE41WnZVVFMxbEFGMTJwaEFJYVFvcytUNDB4Sk5jREJRUkFl?=
 =?utf-8?B?RW9TckdVVDkweVVZR3RxdnF6MzVjcVBnaUJWSHloMDNVU1huQUZkUzY4eXFk?=
 =?utf-8?B?d21OcldqQkZTeWFiOXkrNHhpY1dzdVJkOEJkMUdqYzJlcVRPaHE4b29oVjFq?=
 =?utf-8?B?L1VLMVRFU3dVUkR2QkJJSDg5L2czTGFscmZnemxvNWwyUE9pNVNwQWhXemlZ?=
 =?utf-8?B?TTJYeFRhdUMxTit5TEhOR0hYNHNvYzN5OVFHU0hJMS9jUncwaTk2N0dYL1dI?=
 =?utf-8?B?TTBoZ3doa2RwRTAwT2FsU3hLNmFHSWZadklIVlFMM3hlRnpWSU9TWWN3cDFt?=
 =?utf-8?B?aXB0K3l4RUFoVGxyQURSaHd4QmlnaWc1cVZLNjJSSTBGcnI5dTlEbEhlN1VJ?=
 =?utf-8?B?S1VOdDhab1U0UEJLa0RPVFRGbG9zZFROaUw4Zk9jcWQ4cUU2QVgyMU40cmM1?=
 =?utf-8?B?MjhNNHltTGM1aTc4MTJLVEhzZHdpSDYxcUFYSFBiTS9WMFVNeDk5YjkyTzVy?=
 =?utf-8?B?WXBuUTdNaHYybXdLQ1pzbDQ2SUw3VU0vNDQ3a3gzTklhK25KMzN0ZkhiWklI?=
 =?utf-8?B?WGlSUnhjakY0Vml6cTZnc1kzaEZDVTcyc3A0N01mb2k3RzR5MzYxYlJuSDFt?=
 =?utf-8?B?Y3JGSDhPcjNBc0VwaW5QWjJtcVlOQittMy8zSHljMnJLMVFPOTh4WUxWbmZq?=
 =?utf-8?B?STcvNDIzNXB3cGhjM0pCYi9tcGs0bEVCNFNjdi9mOFlvanBzcGF2NnVZdkhw?=
 =?utf-8?B?c2NDaFZtU3h1ek0vQlNIK3paL29BTUV2dUR0dG1HeThCV2NQU21BL1pDWG5a?=
 =?utf-8?B?Q2pHTUJqM0IvbFVRWGFUdk4zWnU1WGJnUHZpZ1k3QW9Jc3NLalR1bGpOM09h?=
 =?utf-8?B?eFFZNDZ0L0NmYUpDbGFDaTY3a0wyREhhWEtpbXN4d1BKdXJ2S3dicTgzcmlP?=
 =?utf-8?B?WGtOUk00Ly9ZdTh0UjdwWWtJSFcxeHErcWllaUZ3c0R6dGp3OEFVQjQ5S3ZU?=
 =?utf-8?B?RGUxc256TEJRKzJzTDllZHhDRXgxSlNZYkdXeGJKVFFlUVYzOEZxajRwSDY3?=
 =?utf-8?B?ODNSQThxelBkWWZFbC9sMDNNdVNWSUhCQU9JcVZCcjBFN0FreVdXYkZ2TUF3?=
 =?utf-8?B?UGVncEtGUWtWN0ZWTHczamlpSTZtTnJuaENET1Ftb3cwRUUxWldjeFhmVjFl?=
 =?utf-8?B?LzR4UWFCaXJYY3dlcTUwbXo3dXJrYXFWaDU1WWlBL1Q3YkVnVzArbitQNnlW?=
 =?utf-8?B?NHZUMFlwRlloTkpvUmJrY3l1alIvQWJ2RGJuQ2Y5SHVnY25jdG9pM2FTeDR6?=
 =?utf-8?B?bjFMWUpGZXh3NkFoNlZkYUI2bU12S0dvZzgvS0NkcG9RWHRjTEViWVpYRXVy?=
 =?utf-8?B?WGhmZnkvcDIxNVM2ZDd1S29JcTloRnFNeDNEcEpnYjMxWGxwcFVoU1lJdi9P?=
 =?utf-8?B?aytYdC9YVDJUSWh4N2NrM0hGcEZIZCsveDRHWHdZN1FVdllKblNveFpCVmNt?=
 =?utf-8?B?T2hGTUNPYTV1ZHVMMEw2WFlDNFV2YStUbWVTenkrYTlDSXdjRGlCSEFMdEU4?=
 =?utf-8?Q?gPq6XBYYzyet6RttkqsuBDyO6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8ddda2-356a-40fa-2f7b-08db31b40ebc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 06:49:21.6620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abCkpghWavN3EAikrui4ybVGI7AliBCfKmtNQYUYFNnH9eXpBKRM/+CPobR8O628
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 3/30/23 20:04, Lars-Peter Clausen wrote:
> The Cadence I2C controller has an external reset signal that needs to be
> de-asserted before the I2C controller can be used.
> 
> Add support to the driver to be able to take the peripheral out of reset
> using the reset controller API. The reset is optional in the driver for
> compatibility to systems where the reset managed by the bootloader.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 8f61a633c42c..102774ab2497 100644
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
> +							 "Failed to request reset.\n");

incorrect alignment.

> +
>   	ret = clk_prepare_enable(id->clk);
>   	if (ret)
>   		dev_err(&pdev->dev, "Unable to enable clock.\n");
>   
> +	ret = reset_control_deassert(id->reset);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret,
> +					  "Failed to de-assert reset.\n");

incorrect alignment

The rest looks good to me.

M
