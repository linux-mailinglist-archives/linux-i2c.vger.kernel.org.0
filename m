Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85F575EF6E6
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 15:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbiI2Nst (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 09:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234634AbiI2Nst (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 09:48:49 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140127.outbound.protection.outlook.com [40.107.14.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E47414C9D6;
        Thu, 29 Sep 2022 06:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5J+deLFyaQkRbr23QkI0XAEJlGvGluz4junlAcmjiYXkYqd9tWBdY+bYSBYgzbkOlr+BdUe9iNRL9Un7VVOW8086jVOB3JG0xlIHkNud9UfScEmjgQnpIttqsih1jNmXObkPHByfEzARJanxjlcld9V/dvnVwoyTiQjZeaIpcaONWYRMcVJvqIh5DuVxazSNEwmdWEUdnHNnDY1968iMTccqmR5aLjYw1WMyyiFkMIAxW5Ew1av4PjLTdxZu2fFzfM/yy8vlultXMdHrzNeqzVmT/Or6OuA8DyzWGZiiyEKeQFQdIpp81DUwT3db6KVJR4d0+MzvQqmVrC77OWG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRGhGElFG67KmEogwmOAHJ4F2pgvg+f678Rt/WcT0vI=;
 b=YZZV2T0f9ogy+WchT3+9YKmVIuB1yamqCsvtsDHCHePzE0KaXpa5cfmyHBXpPV7Za4k4hdjMEcyRw7NoLO+f9XtIvT/YrDshk1WUrykIahS/GAY40FvNL5jn+MGRzk1hscBRxN22WZZ01KK8/ZL2SLNn87vOVgtn3CCQNda0Mup25khhu5tFETWInRrqssrt7hlHcjLyHt9An9fOszvn6D8np9C0q9yIyVZoPGt90vcpeRdFXz/zHrywJnQJMYtmSyLVRI089A/Ke/RqsXeKFt1p4CtJtktvHlDDK1Inj+somgj32hqXVC+4bQfDF5EMYdiV4M/lorUAqTqkeAwR+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRGhGElFG67KmEogwmOAHJ4F2pgvg+f678Rt/WcT0vI=;
 b=FPldxbX0tJqFIDCYnsMEH31HlvCJOFVaZHPN5js4uI++1cFGYa8oIYdoSibueH3++dmGpULm9yNu26HBMuCbDfXvxvDnPvkxVdKR54bSLZzCfo27sURTsieNZpc5JXT9S+U278zBmsuBrgKDMoF94EgEuFr8E6EBHs08gAjPCKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS2PR02MB9214.eurprd02.prod.outlook.com (2603:10a6:20b:5fb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 13:48:44 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6384:43c5:f773:70de]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6384:43c5:f773:70de%5]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 13:48:44 +0000
Message-ID: <ed5480d5-f92b-3cb1-6e61-84d3c08fae32@axentia.se>
Date:   Thu, 29 Sep 2022 15:48:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 1/5] i2c: muxes: ltc4306: fix future recursive
 dependencies
Content-Language: en-US
To:     Matt Ranostay <matt.ranostay@konsulko.com>, jic23@kernel.org,
        gupt21@gmail.com, benjamin.tissoires@redhat.com, jikos@kernel.org
Cc:     linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20220927025050.13316-1-matt.ranostay@konsulko.com>
 <20220927025050.13316-2-matt.ranostay@konsulko.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220927025050.13316-2-matt.ranostay@konsulko.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0095.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::6)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS2PR02MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: 76cfaa40-4806-4776-bc19-08daa2215380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V7vcz4RBDZDZcIvWGqwP42LACrNQiahBYiQJ6MgSXozwj7ffUhYbqWYVBD5XbfMSupCT+ocRJi+BSxa8jYOrdp+01pcoGwnrxsv+YCTKMwRPN/lGKF7AZLsruUAP4BO3ob8ZXR+GrRVwqj84l9hCsBx35P1p5LynOvm06WQj0pZ+dGPvFkHDK2O2Ht3fZOXlUQodjn4qq+b79Uv0TEVg3cIN0ER9JXJd+XPwnQ0s0s+AQvTRiZxEv5V/AGd28m9/D74Iiq+7sgYqj32jMXHYLJhy7p3DlVyYI5/VKVRnLHS6dx0wXYBwtV56t+WFJklx5yo/667oP6lexLbzuxAJknRDef/QSAsgN4+kP9yNnuibrnw08fAJCBY1K1FL2ls2EYyoGM3yMOq6w7jBkNNUzCVzG6dnOV1ZD+GMx1aT2Rz7rCEImtgJb3uDIHLjklJMS66g3qfazaEUTH68rSGDnpth8+SPNrxFdhgmotXox4F1+n6cL8GN9Sy7AILtv+eLWdGmOXOJxg0Ch8Qa3BnpctqHPynumOCEMotX2vkBaJknTMeNDqeAUEspgoEBtsAwLwWBEFZadbdXqNxfzlr2SLqB+jVlSsOLWQ9j6q9mshfdLHBIUPlWB5fRdzmwKQ+M/nHJquL/uyPUPZNkrog1ptG3PRFAjzfT6nJtYWqNXNIUudjR752Tt1MK62dggWxG/hvJw9XGuuRZQkk7mNEJn5eE66ekWZW+UPjgXzDAJdlViQuYMX9Qvok2+MSrySdOstYD1rDQZ1MmdqgG+UMHM/vPdmdvaz6QJKor7dusE7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(136003)(39840400004)(376002)(451199015)(38100700002)(31696002)(86362001)(36756003)(41300700001)(6506007)(66476007)(4326008)(8676002)(66556008)(26005)(5660300002)(6512007)(8936002)(478600001)(66946007)(6486002)(316002)(83380400001)(2616005)(2906002)(186003)(66574015)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkFKeXhBLzFMK0FnSUU0Y0pKY01QSXk4YTVoSC9OQ3dqTEZUMzUzUkFwUE1X?=
 =?utf-8?B?dUJhdXlRdzRTLzhkZU82emdOWElPMXlUbUc1Z1oxakdmbFhpQnU1T0F1cXMz?=
 =?utf-8?B?TENtVmorUU5RdVUxeUFBYVloMnBRY3hPOFFJTFgyaTFuQlVlYWtDSGp1WDk0?=
 =?utf-8?B?b2d5L29JaFhmRFgrbXZqK0xZcEh6ZHU2SG1HYXl2K3R6MXFTYTVKekZ5cnhi?=
 =?utf-8?B?MGtCMnlyb05yV0tmZjI4U05HUGo4SHJSQ2tkM1hnZ2c2UktlSEJtZjhFZ1dv?=
 =?utf-8?B?ZkRTclhOUVVUb1oxK3NRN210SkhZemNYcmdDdlN3RG1hanZlRE9DTjZKYjR1?=
 =?utf-8?B?VktmVzNCMDU0QlRSOGNLNVF6NUg4VHYweUhaSFZjenVJOHZKNURnTFlvOWc2?=
 =?utf-8?B?aFd4WEk4WVdGNFo1NXMvU3ZtcDBqd3pwNTF2TE5kMzBQSTkxOGJYdUhkWTh3?=
 =?utf-8?B?RGRXOVM5cExVTFNmZTAzdGJoeHdpZlpxNlF6M1p1WkFGdFZyYzI0b2VTZFE0?=
 =?utf-8?B?aXVIUHk5Y2ZNbFBNeVZ6RzNQN2JoRHozbGt6MGdGUkRwNnhnQWtkKy8ycE56?=
 =?utf-8?B?R2R3RUV5UFdCMlFZWWQzSlJ2cFJ5MkU5WTZJc2Y5dTVoZVpSbEo2UXRURXpV?=
 =?utf-8?B?NVg2bjVkRmNIZU9jSzdyMmQwV20zZUN5Y2pLd3FqbGJXcjNhTk5tdGdtdXYx?=
 =?utf-8?B?R2FTd05RYXlKYWQrTFhKbVY1ZHZZanVoTWs4WHNJV3p5NXFvR1ByUkhXVUdm?=
 =?utf-8?B?SDhkS1hKc0g1d0diSyt0dDdSam5JY3lUeXhzTEg0cmZXdlozQmtLc0tDVkha?=
 =?utf-8?B?b21TcVJCNnNDZXlZNWIrSkhOQTRicnZhUTNzWkRnUURBS2dnVG5US05YWG9z?=
 =?utf-8?B?clZtWjJaaVZKQVhud0tSTmVwRUIxQ2lFb2p6S2xZMmhJUnJOdXYrN1lBdlBa?=
 =?utf-8?B?OTNsMEZzdzBhZnZwNVJMYWZWOTU0Q3k3TE52QjRZUXViYXYzUWRhWVhCRmFj?=
 =?utf-8?B?ZDhuSUIyNzBuMTFqdThnL2VMU1B0TTRPbjE4dUpSTWZuVXU1OGY1R1RLMHlJ?=
 =?utf-8?B?a1lQa25udFI1Ym4vaTF0ZUtmQjNrbG5sc01OZVBYakRRbzl4Vnp4ZnFtZVdu?=
 =?utf-8?B?ZUNXa0UrVW9MSHZ3a3ZRaURoYTFvWkhFRkRxVys3M2QvTmhaSmNiNGlVc2tn?=
 =?utf-8?B?VkNYUzNOb1NKbWJpMWFnTDVhWkc4d0laVmpXc2QvdklqWldWbHN3UWJTVWpU?=
 =?utf-8?B?d0dpVjYySFBEbVJvWjZKWncxOXQvWnIzVERjL2ZDRXhJZWFCNndaazRwaFM0?=
 =?utf-8?B?TGJhelE5S2ZQdk5kUVptNkljY3RKKys3WWlSYlhhQkhVYllROFV2OFZlYzkz?=
 =?utf-8?B?VXJtQTlua2FsWEFKWmJUVTQ1aUtxbktoM3EwR205NUo2M1c3Rk5yZWFhYnZi?=
 =?utf-8?B?L2dLVzNFazNGU29lc1lPQll2dEl4engrNE5kMXo5akZZWXZtMTJXb04xTUxV?=
 =?utf-8?B?QzJEaEFNZGYxamdKM0dXaVpHamVaWWNCMFVLK2wrNGtRTEJOQjE5cXFBY3h0?=
 =?utf-8?B?VVpVZ3JoR0VRMDdOcEZ6ckdzbVdWN3FaKzNpN3doeEZkZDZWbVJIcG5oN056?=
 =?utf-8?B?M1FNREoreVB6dlJLS2pMc0RoZ2UvMmwvc20xeGEyUkxLTjI4WHIxWmQydW9p?=
 =?utf-8?B?ZVJDVGNKMUVBQk5VRHpLUVNlMTJMWklIcyt5M3JXVkxKZ2tpYVJtYkkxOFJr?=
 =?utf-8?B?cGxYU2pzcUttc0l0ZkxmQjZEZkY2ZW9vb1JjanJBeUl1eGRHWU1MTmpET0cr?=
 =?utf-8?B?U2h4SXZORXN1YmZFOGY2M05OeDgvdmtmejR4c1MwOE9oTDg5alpYaEpoYUgz?=
 =?utf-8?B?alhtZ1NtR25qSjhySENLbjgvcGV3ZFN5R2hCK3RtZXdUQWwreTIzUWlkb1E3?=
 =?utf-8?B?NDYzUnR3RUoydHhJU0xVNGl4NHM0VkpmaTAwWWhQbFhNOHlSS1RvRS9kVTBr?=
 =?utf-8?B?NTZJbkhLcjB1ZlFOaFVYaDk5TXMvb2dSZ0xrelg5WHRMa3E2SUdkUGdKNldN?=
 =?utf-8?B?S3o1bEFxN05kZU51MUYyanZ6TjRoSmd5Z2J1Qmt5OXBuMm5Nd3RaaW45WnRV?=
 =?utf-8?Q?TdpSBFH6roIqyd8eheDSrZPVv?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cfaa40-4806-4776-bc19-08daa2215380
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 13:48:44.6475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohtyciiO3m9vMcX4TaUIb9aRDBlNEddvzXZRvas5y91o9RU1sobOV+GCRLbiImZU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9214
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-09-27 at 04:50, Matt Ranostay wrote:
> When using 'imply IIO' for other configurations which have 'select GPIOLIB'
> the following recursive dependency is detected for I2C_MUX_LTC4306
> 
> Switch from 'select GPIOLIB' to 'depends on GPIOLIB' to avoid this per
> recommendation in kconfig-language.rst

I find that it is a bit sad and unfriendly that drivers are hidden from
the user unless the user has previously selected GPIOLIB. Configuring the
kernel is bad as it is. Since GPIOLIB is not really a strong dependency
for this driver (at least I think the device may function well enough
without GPIO support) couldn't the mcp2221 driver "imply GPIOLIB" as well?

Then it's only one driver that is affected and not a set of random drivers
like this.

Cheers,
Peter

> drivers/gpio/Kconfig:14:error: recursive dependency detected!
> drivers/gpio/Kconfig:14:        symbol GPIOLIB is selected by I2C_MUX_LTC4306
> drivers/i2c/muxes/Kconfig:47:   symbol I2C_MUX_LTC4306 depends on I2C_MUX
> drivers/i2c/Kconfig:62: symbol I2C_MUX is selected by MPU3050_I2C
> drivers/iio/gyro/Kconfig:127:   symbol MPU3050_I2C depends on IIO
> drivers/iio/Kconfig:6:  symbol IIO is implied by HID_MCP2221
> drivers/hid/Kconfig:1227:       symbol HID_MCP2221 depends on GPIOLIB
> 
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>  drivers/i2c/muxes/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index 1708b1a82da2..8642ea8e0a3d 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -46,7 +46,7 @@ config I2C_MUX_GPMUX
>  
>  config I2C_MUX_LTC4306
>  	tristate "LTC LTC4306/5 I2C multiplexer"
> -	select GPIOLIB
> +	depends on GPIOLIB
>  	select REGMAP_I2C
>  	help
>  	  If you say yes here you get support for the Analog Devices
