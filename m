Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0417C6B74
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 12:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343811AbjJLKtP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 06:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbjJLKtO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 06:49:14 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2103.outbound.protection.outlook.com [40.107.22.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7389090;
        Thu, 12 Oct 2023 03:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkFaDHFdriwVkims9WrI9xKUC2KI+uUSM2KECVpsDTNqjbMhbr384hZjasSavnfNCP6KmdJIKO59Y+VVLk/UcQAJ3h9+SXhSXuie9jU7ZrfQ69UjeY9Xq14tXpcztExI0JSOQpAnT/yLKFlv09OUSUAN7PqQjW/vayuY48+rtgxm1jb5XbIxPvUYaDqlCEGcmhYCzwzsDhvGLvElAeUmWX8DRItpA+cqhjTPpcE8unohpkSl6/vIpox0c9rXwGxV0vBN1grsPvxjTxdBAArq9wjei7mlZauaBzen/crovqCRaMr3DUOH3z+ji71HAdql3B3ehc59DUoObCT0/OYEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/wyIA0JenScA1RTENeYZs9coz7r4tAvVJ7RmRTMG4w=;
 b=ALXJJCB0J895iSUYiXI2iDQpMqI1p4qdoJWSBsCgTCNiKciMzQj1Gw0gJayAUZnbFwYSTrW1hj5RBueKzY5vSXsE3qRaVSfPDRO2nCvlwgA2rUtEWFLBWn5U1qH62mrVu4wgPcvduFX5oG/22GwAUDGnj+ENxpDkTQPyBoJpjTDjusLW0lJUtrS0OA26kgI7k/6aFy8kggevOAUXlNI06ep1njFS0HrQ5o92UwN9pAIkKEqp9x/30FoUAmjEGIjmDLWj4aQoXdNTNrbPTW6Jy9ZTXBLnQ5IG7y5Ul8Bi3orY/h5z7xoVna5oEFxBYA1KprPsdgtvhi1DoFFcutsDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/wyIA0JenScA1RTENeYZs9coz7r4tAvVJ7RmRTMG4w=;
 b=VzOt+lArYTnw4PLZ2AatIG3DvrLdcbuOmenYqVsQL88VLoJ7MxUMdOxaI5WK3dWDODbE5K13uYMkD5lbCvoTR4aJ20lPIgT1KUP2nbjOiWvOrmfUdeSiFvbUwQkTc+Od0GEVu4NfqJCgoBS/yvDcySymiAEZikk+b6A/kzM2CY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PRAPR02MB7906.eurprd02.prod.outlook.com (2603:10a6:102:29e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 10:49:09 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 10:49:09 +0000
Message-ID: <63403365-2d23-b4a0-d869-070686d62ab5@axentia.se>
Date:   Thu, 12 Oct 2023 12:49:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] i2c: mv64xxx: add an optional reset-gpios property
Content-Language: sv-SE, en-US
To:     Andi Shyti <andi.shyti@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231012035838.2804064-1-chris.packham@alliedtelesis.co.nz>
 <20231012035838.2804064-3-chris.packham@alliedtelesis.co.nz>
 <20231012102140.kydfi2tppvhd7bdn@zenone.zhora.eu>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20231012102140.kydfi2tppvhd7bdn@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0118.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:9::8)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|PRAPR02MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c6d968-fce1-4e74-b3ba-08dbcb10dd39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1yk/eRedcR7TTELGAj+zWJ/OuR4ecGi2IjrF206GXIEYrV2XJyE7czShv41Bf7xgna3qNaXs5Ez1Kqjr8F/l90RglgASSOv9uoAvnqVvUVWzk2F6Om0BGCASCsePwwOQkSNWcTFb2/3TcqxQNYL2x60Z8AHe0eEFeOte2V5UYbYjLMee3FFg62hPvhkJIG113QHRw7mdKG8rZKdhfkRZJrg5gwNhQaMwvWDONOZYVNFbI43Oq5wi3GYGkx468dxcmdyWi+TxBLMCNNIsixOPfwrGXmUmDGqvKqPJx8kPJjDpTBhIodiucEhycelqDa7o9c4B1fWVva4RyTZZLqVtxEuM/A/U/ZQyoURuQECLwjaUTMGAd8oJ1Jf6tu+qs58IxR6ar4UPi1jv/MyWsTyOOXy61tg/nYH0KgDpPutnn/XQV+zCgtOrOEUfjNIHf6CCd1nxqI572KRr7sQPaWTpyl5SxjGiTdqh5ilIQcOYYLnVsiAfBikkDtgBb0YUCsfSCwyr5hgpJBHqjKKm2I9AotNEzAT/dtX95wlVPrV9cMZmcJ49E8k5p/6PeRU79bCTIe8iJamu9iO6S4j5P9/Pt4qjycaoaKdLq0qu8R88kx+xjTjfd063A9STeUnXQ1tav3VXFlvpeAv77BF1cABRvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39840400004)(346002)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6506007)(31686004)(26005)(2616005)(6512007)(38100700002)(6486002)(31696002)(2906002)(8936002)(5660300002)(8676002)(86362001)(4001150100001)(316002)(66476007)(66946007)(41300700001)(110136005)(36756003)(66556008)(4326008)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE9HL0d5NnFhR3hyYSt4MHpXWThsYU0yMkdSV1dtS3haWXIzeW9xV3JlZHpZ?=
 =?utf-8?B?R3VqbkJDWXNVRzVTWlVINTA0SHVrR1AxZmN1ZndieXlIUDJMOWsxNHJDd2tJ?=
 =?utf-8?B?dElhUWN4RWJxR2RYekJVMHlFMVE4bEJoVXNZQTI3aHhyRWtFOXFueEw4bmJj?=
 =?utf-8?B?TllYOGhFUysyNTBuOUlOTExiK1NmQmp3angzZEI4ekRQNitYd1FqSDNHZUxa?=
 =?utf-8?B?MjNWWVowcnFCWXJQUFh2THNseUNFYUxzdWlGNE1qWWU5MDl6UVk2N2ZtdG15?=
 =?utf-8?B?RVNQM3N0YkVxRGw1ZVBLSUhEZTE0d3Z1b1Q5VXcxQ1h4TGRJRkFpRk1GS3p0?=
 =?utf-8?B?QkQ1dDVkNWZqNmFKeWZEamRWKzZoeGtBK0xwcElpd2dPVzg0d25lL21iS29q?=
 =?utf-8?B?RFp1cUVSOWp0M0NPRUVuNGd3NjYrbWhtMWRSMHZYdmhFSVdmczdBcmVOS1VO?=
 =?utf-8?B?NVFWVm9HMEtaMkM2UXREMEwrTUFVTm1FWEhITGpPdjhRV0NtZVJ1QlJCUHMx?=
 =?utf-8?B?UkhWWjJVOEtOY01PRUJidXYxL0VnSVpEeDFva1U5cGd1ZEZ0Zk90dDROakxv?=
 =?utf-8?B?MTF6bjhSSVdvckZDKzR0WGRLWUZ1RHJZRkdKcUxBMFB3eitLSDVLOHJJaGoz?=
 =?utf-8?B?M1lhNjFLdUtsSWw3NkRCbzFJNUNxR2xWb2RQZEpMVHQrSWFzaExKS21HYVF0?=
 =?utf-8?B?dXFUMmZNVWJobnFtam1CVStMY1JuNUh0VDY3UVFzb0lOTXcwOEpuWjl5SElO?=
 =?utf-8?B?azFsUmpGcitWM3JITHRydHBBbWVYeTRyY0wrQ0orUHUySVRvM2NJem1wOUN2?=
 =?utf-8?B?ZlVTY1ViM0xEdGZLYU9jd2hpdkRvWHBEeis0cHFtcUhsa29RTHdkemlYY3M1?=
 =?utf-8?B?VFRlcFNpZmY5RHZ4Q2hkMmFvS0ZWc0ZNendLN0RtazU4MkRzcUM4emlQRmEz?=
 =?utf-8?B?OW56ek9nQVhySS9WZ21WSlhTVDdqWmIyV3JRVUZBU3RwRm1FY3FIZWtmc3li?=
 =?utf-8?B?TmQ0WU5aT0M1NUVNU29TMC9ac2JMVkY3LytWdUo2KzhCSExFNUVrbHV3T211?=
 =?utf-8?B?WXhIN1I5ZlExb1IxV2kyWlhRM3ZnUUZFSW1Ja25ZMFRBNHpWQXA4dnNxWHlq?=
 =?utf-8?B?WmExdW1HQnR2aFdCL0VDR2hxODZwcHAzS0o4U1kzSXI3dDlFa2p6VG1BWWlF?=
 =?utf-8?B?NllJVERuUFh0UWZPZ2w0SDNlOFpvcWRseit6dG0rbkQzUEdPd3JCbmpUNXBz?=
 =?utf-8?B?YnI5ZTlaTFNNTGdxMmZwYTlDSzZ0ZXY2NWlhOStCWklELzVHZzYrckthYVF1?=
 =?utf-8?B?YS9TQ0Y2R09udXREcld5RHIxZTZvNm9qRVlvQTdaU2VIaFZGUmltcHc5M2JN?=
 =?utf-8?B?YzRMQkR2M1BDTlJ5bjRpQ1k5NG9KSDlCTXpqMmM5K1BON3ovVERqQmFqVjRX?=
 =?utf-8?B?TnVLMzd1UHFiZ21ZbU1qLytjOEdHYTBkaVhYbTdRNGtseGo4clBSdmdlVThn?=
 =?utf-8?B?dmlNb3hod2oybXp5NDBSMml5Qnk3UnhHVno1eUNpSm9LWUw0ZWwzMFZHNmN1?=
 =?utf-8?B?dmNyNTk4MmR3Vk1nZEJza0VHMXI5Q2NpQU55UVVheW9ZTkV4bDBmWE1TWVVO?=
 =?utf-8?B?bFNYN1FFSmJVZmhtTEJXVFQzM1VBUm1wUTh6QWR1RFo1MG5kS3dCNzBZSThl?=
 =?utf-8?B?clNtb1IrS0c2dXRzaXBBdURqYllpZURCKytwYmRHUWxWeGlNMU9mUFJxQXN6?=
 =?utf-8?B?bnZCeWxvd0VaUFU5NzJLanNHVUhHNU1ldGJ5TDVKV3U2WTB6ay9PaWNZdmZp?=
 =?utf-8?B?NU5Eb0VVay9tUE9hS3d6b0pJOTF1Snk0WVVMTnNmTTU2MWlwS1ZIM2Foekpx?=
 =?utf-8?B?NkJTck9RbVFMT0JjUVlCR3ZrZ2IzUHBBVzZOUzB0d1d4MDdSTjRzZEhJcmhu?=
 =?utf-8?B?aWwxRVZHOE5EUGJOM3hZbjhmUys2b0hZeFRPc2hVTXl1aFBqOW5PU2xIS3BE?=
 =?utf-8?B?YVRzYVhOenFvZ1JLcjVQRjdrVkpKTEh0c05nSG1SNVczYVBYTHFSR25OK3pi?=
 =?utf-8?B?aUZicG90Q29mZnNiZHBOSFFRbFdCbHNqQW04UzBkaWZsS2tPcTJCMFR3ZWF2?=
 =?utf-8?Q?oN0kTkfNVTdGCLrlt5nf4aPeK?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c6d968-fce1-4e74-b3ba-08dbcb10dd39
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 10:49:09.6156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HU4/Hx6Y1sdEj4ULhA1+tyyeT2OZTiIaJqZdrkDP7DAZNwV4y7Nghi+/ZB/fe/sG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR02MB7906
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-10-12 at 12:21, Andi Shyti wrote:
> Hi Chris,
> 
> ...
> 
>>  static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx = {
>> @@ -1083,6 +1084,10 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>>  	if (drv_data->irq < 0)
>>  		return drv_data->irq;
>>  
>> +	drv_data->reset_gpio = devm_gpiod_get_optional(&pd->dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(drv_data->reset_gpio))
>> +		return PTR_ERR(drv_data->reset_gpio);
> 
> if this optional why are we returning in case of error?
> 
>> +
>>  	if (pdata) {
>>  		drv_data->freq_m = pdata->freq_m;
>>  		drv_data->freq_n = pdata->freq_n;
>> @@ -1121,6 +1126,12 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>>  			goto exit_disable_pm;
>>  	}
>>  
>> +	if (drv_data->reset_gpio) {
>> +		udelay(1);
>> +		gpiod_set_value_cansleep(drv_data->reset_gpio, 0);
>> +		udelay(1);
> 
> you like busy waiting :-)
> 
> What is the reason behind these waits? Is there anything
> specified by the datasheet?
> 
> If not I would do a more relaxed sleeping like an usleep_range...
> what do you think?

Since this is apparently not intended to reset the bus driver itself,
but instead various clients connected to the bus, there is not telling
which datasheet to examine. It is simply impossible to hard-code a
correct reset pulse here, when the targets of the pulse are unspecified
and unknown.

I find the reset-gpios naming extremely misleading.

Cheers,
Peter
