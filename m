Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4C563A778
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 12:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiK1L61 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 06:58:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbiK1L6Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 06:58:25 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C435162CD
        for <linux-i2c@vger.kernel.org>; Mon, 28 Nov 2022 03:58:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWnk9haXfvfSN5wXBqTdOkeq3eS3iOk0N7urYNPxTQ+mhNxeWuq1BbkxhXFOJOEmikpf6s4wqkI6tMYHqjseSzvcKus+8mVyLTaB110iqWkULfUiA8+rNCLZzscQ3Jxf4+Atwty/lxaiVm58eZ6V7ptlBQfm5uI9Nt47KLk3Vmsl4nR5A+eYoHXdMBcchYqI3TOi4r1PG97oQEvFTu0dZHNM3tjrl9p6kr7QKo2d+ftBIydUCXBCIaKlo5wgVp9ZfaR5T8xXNFhLQwcjkPudRZvxr5m+usKQ58eeNV+tgoN0nLQcD9bU/lTkvRafqquafHC1j6502G2uD8nb9sof6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amKG0bTHUUasHOCc7Nshn2n6A1gSBstBuAirbqaeY58=;
 b=Ca5oB2yncFYUSfL4n/sxkME850kYhBPYgiNdwSSyG87toZPpaeguOOWQhdYZPkWzkOuIscxuOv/x729zBFznlKikk7YFa38eV7AcNveDUlgiPI+p3YrOua5PFuGMIIBojuD5bwFtm9zYV+l/n4KvqNU4Mie+XrtlT3kcacxKUFPNnbtiwiF1t3/6JlzXonNKx/oiV8bwsUR47fwrhVgC2zbqS48hL6F4u++umP/e1Y/BCjBjdArPcB1eUmgA/bEMdwuA7q0jt2gtCS5zljA9IDPGouSD5hPlzsCa+uqEkJcS2sr9hbQbNdTNdhLrNA26SUNTMRU+tl/flBnI3VjnHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amKG0bTHUUasHOCc7Nshn2n6A1gSBstBuAirbqaeY58=;
 b=qA2/gmY3SSdKHaWML4tJYzmItboBACkE/jRRXiGocFNsV9h0/NhKDI7OWLbKKRfFNWWyHliwS8ubFkp47S7daC/PWcndIdDJcTcEGI55IMMeuvB3yJivfR50mohzdMTQsc2FDr+q7cojFdfSeWMfZeEu0O+i/iMSK0pADd8rszc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AM7PR08MB5416.eurprd08.prod.outlook.com (2603:10a6:20b:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 28 Nov
 2022 11:58:22 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637%2]) with mapi id 15.20.5880.008; Mon, 28 Nov 2022
 11:58:22 +0000
Message-ID: <ec30bbb7-88f4-f24c-c080-d195d91c2b95@wolfvision.net>
Date:   Mon, 28 Nov 2022 12:58:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] i2c: cadence: make bus recovery optional
Content-Language: en-US
To:     Michael Grzeschik <mgr@pengutronix.de>, linux-i2c@vger.kernel.org
Cc:     kernel@pengutronix.de, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org
References: <20221023215121.221316-1-m.grzeschik@pengutronix.de>
 <20221114155700.GA18924@pengutronix.de>
From:   Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20221114155700.GA18924@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0015.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:800:be::25) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AM7PR08MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a2d69a-d8c6-4f97-02af-08dad137d936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: glzSd74qfMVz7viRk8wK2cV7VP3Fg4e3dkaVU/3qF5ldvr3ttplYip5mxxsUOfHf2lolM2mbbfAzHGGqei+Fa5v+M4nqI62sQrPg4oTH160kfh4cPZikp2gUY8s6C0raD3scWqoOaB5v1/Vsi4iGlr1LAZEJz7hEJCOU4mC+FPf9dJJIpjemzgfQCUTH5bgcOESYXUMiac3UcUqR/Ufx6BQEEowLetRypB9m6tBNPK9sf+is40TLZ/vyLXr99BwZ4NsO2UHccPqN7BsgO6zflj2vcqDIyxd/HDGBvtmHal6z/PfGIRNWhrfWUu/ZAEA9xUnSiAeKGpDEfIWgmb3agjHJQpxVY/85b8iLBLXizGoD37TMfesvD5lw6ALsgFNiQvYQt8ZaHxlK5HJ1MQmkLeAq/TRoJYJ2r1tj3LJf4kBE3ELW+E4k5zFhfUD6C1SXx5UrRuftZopRUkhneuu+w2D2RZM3tciaDwnOn+EC98fH4gVXjjtIa79WHDfdLpoUZ42xGFwIGVMwb7XS2fT2eatCveyuWAg8GOXNCI7Ve50bZ07Qzs4zK7/T7IHQGUsR2cstWYS2NDrRO3l+zV7f7/FgWpzISKJNWOTJWs/lbUaIzumsDHHZkGJVpyePUgX4PNRLA3Rw7VaZasVwur4R20pTbHJlyYmFVC8BaLE3Ix1s2tH0RHgIyZ46tUbIDBDjFKc10lHrDFt+zNtDS/gkJcfpmgYGdY6ND+nF0pP3+zztzXTiqR2SJPQsszyA8EGQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(396003)(39830400003)(376002)(451199015)(966005)(316002)(38100700002)(6486002)(86362001)(478600001)(31696002)(5660300002)(44832011)(41300700001)(36756003)(4326008)(66476007)(66556008)(66946007)(8676002)(8936002)(186003)(2616005)(31686004)(83380400001)(52116002)(53546011)(6512007)(6506007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWhhUjhXZU5VQlpuaTZQNFg1YnVrMU9YT2Rrb3JnYWF2Tmg5R0xFWllHRmMr?=
 =?utf-8?B?NTFGTUlCemJldWlUdTJEWlMzS2xlSkR2VmhCUGc3KzR2VUpCcXMxTDBBR0ZJ?=
 =?utf-8?B?QlBDWTA1UUtKMDVpQjVKRG1RZ2ZGREFPOTNDZkZNL3lsMjlTUmRRNzluMXhj?=
 =?utf-8?B?c1IzZVhiSTBmNWlabHJ4N0xTMWRmYmN3aDBlcFBKbTN2cmNORGNrZE5tUUhI?=
 =?utf-8?B?TWNKL0xiN2FMZzRWc21SaVJScUdYYUVEbXpHeWVacTFvU2Z3QTNRNlpJWFlC?=
 =?utf-8?B?UUxhakdIS3BiQkZ2d1lMNVBTTE41cUFEbTJSNEhYLzRXNi9QTFhSZXpiMTRI?=
 =?utf-8?B?WXRVZG9XVzQzeTFUdzB0OWwzaVF5Q2MwSVdXY3hUOEprUlRFblN0TTB0OUxj?=
 =?utf-8?B?WW5NWHk1czJOSDM0aFA5OVAwV3BVdUNjanJnQVUya1hRam9IT2Z0L1U2dGpy?=
 =?utf-8?B?TWk5UTFYZTFKZ0l3ckplc3NkUEJ2RjZab245QnZ4aHFsSDFXaHdnK29MRTBi?=
 =?utf-8?B?VmNZcWhTZFpXQjlhd1FPbWt6aXlLU1NwaHBUVTJ6VHNLVW43QXpaWDY3THdr?=
 =?utf-8?B?RjUzN2VoUkVGNzEvcWtrMkJJbWdUdjhoclA0Tm9XRWJxakNzSDBPdHgwdmxk?=
 =?utf-8?B?SlBuK21rTGd5c25XK3hGK3FVaktYS0V4MjN4Qy9XdFhQd1FINFIzT2pxTDhP?=
 =?utf-8?B?aXp6N2JVbU9iQXdCRDRIdFcwaHBlV2RRYS9pK0prbU1ybXlCM2VEbXcwcXVR?=
 =?utf-8?B?ei9DUFNFSWM2bjhGT0QxbG9DL3RVY3VnL2NjdEpER2pIYVpZZFcwZjByZHhs?=
 =?utf-8?B?K3ZwYjVna2lwbUVSTGtxOTQ2L1RnYW9KV3NydjFTcVZkNWpudVI4Y3NDbGRu?=
 =?utf-8?B?aDM1YkRDZCtkWXpwQjFpaEJzZjlQUjFmWDRLTnFmRnNLUktRMU16VWRGMWI0?=
 =?utf-8?B?Z1pqQmc3ODU3a1Z5aFFzVU5DMTVtRnFZK0ZQalNNY25FcVg4aWlQUE5CS3pr?=
 =?utf-8?B?djJOSzlsUkpqbU1FQUJzQ0h1MTNGWVlPd1JzNlhrcVFJbksyVGJuSDdTc0ZT?=
 =?utf-8?B?WlhJRU51Q0pDNUVUZ2I1RFZuVXo4aUxaODd4QjJBeEhDeTZQNVRuTHp1REIw?=
 =?utf-8?B?bjViK0ZNOXN6eTk5UHNyYUxacTBvOUNsaVorWEl0MVIwZnNuODBreVhZLzA2?=
 =?utf-8?B?YU1Ja0Z2b0pqNXVxQmVHZHJFYm5wVDB6WnY1S2tvNXlIajNmM1FqcGNncTVr?=
 =?utf-8?B?TVB3a2hLalZyWUJhZnlhQUMwU0JwNEw1TlBxcnM5UU1FM3FqYlFvYmxtbVMx?=
 =?utf-8?B?ZG5TWjlNbEZObU1teTlpRjRWVnV5RVdSRUJlRXhacDRyR3Z6bzFwRlAyb1F0?=
 =?utf-8?B?VGNPaHF1VUZuOFd5VkN6VlJXN052Z3pGQTVmTVY1VldTK3VoeHZoRzZnQ05N?=
 =?utf-8?B?c3lTdVJNUkVCdG9vdlY2OTV3Y1NTU1dLTlVsN1hLUjBCRkswRVg3Ri9UNC80?=
 =?utf-8?B?VEhtWDB1WlFXWnMvNW5oM3YvemR1clc1RjBUQkJIWVhUaWZEUnU1U3grVGh0?=
 =?utf-8?B?WWl5Rktqc3NBZXEydXdjbGlURGhmVnAxSEpOQkdMR09FRmZ2QUZTbFprVkVr?=
 =?utf-8?B?QVRkY3dPaTJsc1BHK0sxOUhjeHlUZDR2QVhyYVY1VjJEWnFncTNHa25pdCtu?=
 =?utf-8?B?OUJMYWNyNjYzcEc3bGNDc1JWMjg2YlQwNEtxYjN2cUw4dFZXaUd4a1FTVTd3?=
 =?utf-8?B?QWlwWFd5Y0h4NnNaV01FdkdtejgySmp1NmdDYXoxTURXWlB6TTFjQ2FKb082?=
 =?utf-8?B?S2xIZWF3Y3dwc25UV3hiaXdyTHUySG5NeEJTRmZZdFFmN1AyNmVCNFduSUwv?=
 =?utf-8?B?K2o4dW9YRmJvU2dXSWx1T2FVdXROd3VWUWJVbXhyRjJTQ1piWUg4NWVKcDdY?=
 =?utf-8?B?bENuTWJlaDllY1hUNjFrZ0dYRXFmbVFieWU2YzVhK2pmVHRLeEhKaGlsbllk?=
 =?utf-8?B?UnFXNjFQQ3dXempvcFpUQkVIRmEzNlA4aG4wYW5pYVg2QnJub3BobG82WU9B?=
 =?utf-8?B?enBKWnR2WWRMR1pwU1BjcnFCMHdMSXN4M2tpckhyelVFNitQNWFNSisydHFh?=
 =?utf-8?B?cDJMNnp5MzN2TG9mSWt6TEF4VzJCSFNrZUlHWVJXUnJ2KzBXZkpqeEhtRDlC?=
 =?utf-8?B?aXRzYjU0cjdrN3VOQmJnZytxRkg4bW5QSVV4RWpoalZjUFJkd2djQ3BsaTNR?=
 =?utf-8?B?S3ZmNDJZOFd5T0NCbnRnN2M4TDdBPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a2d69a-d8c6-4f97-02af-08dad137d936
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 11:58:22.5198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvYjNf4HeQyxSO3SKZOx3B+IO/KuUkn7qL3fEeUdsjux6nPikAxgq7OaJnsHGhrfPLq6SQIb1ub0Pa2hFSpcXSobkqIgnH62qHRGiWnos+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5416
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Michael,

On 11/14/22 16:57, Michael Grzeschik wrote:
> On Sun, Oct 23, 2022 at 11:51:21PM +0200, Michael Grzeschik wrote:
>> There is no need for the i2c driver to have functional bus recovery to
>> probe successfully. We patch this by only adding bus_recovery_info only
>> if we get usable pinctrl data.
> 
> Gentle Ping!

Thanks for your efforts. I believe this issue is adressed in a more
recent patch [0], which seems to be on its way to mainline.

Best regards,
Michael


[0]
https://lore.kernel.org/lkml/20221128105158.1536551-1-carsten.haitzler@foss.arm.com/

> 
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>> drivers/i2c/busses/i2c-cadence.c | 7 +++----
>> 1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-cadence.c
>> b/drivers/i2c/busses/i2c-cadence.c
>> index fe0cd205502de9..cf212b8ffd56af 100644
>> --- a/drivers/i2c/busses/i2c-cadence.c
>> +++ b/drivers/i2c/busses/i2c-cadence.c
>> @@ -1262,10 +1262,10 @@ static int cdns_i2c_probe(struct
>> platform_device *pdev)
>>     }
>>
>>     id->rinfo.pinctrl = devm_pinctrl_get(&pdev->dev);
>> -    if (IS_ERR(id->rinfo.pinctrl)) {
>> +    if (!IS_ERR(id->rinfo.pinctrl))
>> +        id->adap.bus_recovery_info = &id->rinfo;
>> +    else
>>         dev_info(&pdev->dev, "can't get pinctrl, bus recovery not
>> supported\n");
>> -        return PTR_ERR(id->rinfo.pinctrl);
>> -    }
>>
>>     id->membase = devm_platform_get_and_ioremap_resource(pdev, 0,
>> &r_mem);
>>     if (IS_ERR(id->membase))
>> @@ -1283,7 +1283,6 @@ static int cdns_i2c_probe(struct platform_device
>> *pdev)
>>     id->adap.retries = 3;        /* Default retry value. */
>>     id->adap.algo_data = id;
>>     id->adap.dev.parent = &pdev->dev;
>> -    id->adap.bus_recovery_info = &id->rinfo;
>>     init_completion(&id->xfer_done);
>>     snprintf(id->adap.name, sizeof(id->adap.name),
>>          "Cadence I2C at %08lx", (unsigned long)r_mem->start);
>> -- 
>> 2.30.2
>>
>>
>>
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
