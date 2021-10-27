Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED37243C7D1
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Oct 2021 12:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239634AbhJ0KoF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Oct 2021 06:44:05 -0400
Received: from mail-eopbgr140114.outbound.protection.outlook.com ([40.107.14.114]:1537
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232122AbhJ0Knz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 Oct 2021 06:43:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuIrUFakkKJhrXtG1YkJgrJ8mlU5P33zDbGR/kOcVfq632AkUtBTyik7DjAEEW+gUOrgbintRHJ2SZButbVIoAnFp7TIRygxq6vUPnZoDOisedJv8RrODMapp773RUmdCrr/ejfiaJ90sh1hdLKVTEhcSel+5prKxAFzpnpDYzHHdEDlPYsAD2a4Z3PXwkhqDyfqrraiPG9Kjzf93wA7N2ghnWiGMw+pwiNgSdWYuy3weYQnEfqzvNhMvPnJj1/TR1T3S20d4HNcW+BWricrfmTGNMWVJT5FWW5OZhXqUTZVfticCnf5AQPOoBHmDJ6hTdEsZ6bDaKj9ejjzdwKAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eYcyllt5mw1bP6hXgMaZ6QDpUpjeA2GV2K7388aJfc=;
 b=CVhDWxQrIGeyISlalAGGYYK78+Dhl8s04SABs3E7M0+gx65yAz7l+mQFzb5ggnv+1GyImrWQwhIPee7TL6zB371J6kOs+Qy65Q13A3AmAmm6wLpY+DflmaSVA0nFlHQXbDTnpoTPNeF1RYR7Pyr+8hmxD4wNk+ufr1RhGSGCoQCBhmpFBTbv6uvE9ITSXKYjJhr0X2/WTqQ/G0NEX3vRVOLaJNOn9c4OQwY1kVRdsU6M8zpZBsz4nR2/6EiF4lsfmiElUXh1cJweAVS4zeUYmRFBBnIeV/I6et2laBZpF7fYgmt3APTzYPaeJY9ILxL7rXLM1cU1p1y41G6Ka/q/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eYcyllt5mw1bP6hXgMaZ6QDpUpjeA2GV2K7388aJfc=;
 b=nwvx9gCqp02c5bbFCxaSAjwjvPt53WITWJwAheiTWEj2z8781wHhrAn+W/zBFC6Zzpa6BYfV/P55R6VI7/M/+gja7a/qCJH4LEoFfWc6/Vm7GHLy9LV3NsheVpgu6oHIUXaew5pjZrUozIk+NnuLUPqqer7UiNPoY7M3mTLBOUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB3PR0202MB3324.eurprd02.prod.outlook.com (2603:10a6:8:6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 10:41:27 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 10:41:27 +0000
Message-ID: <9fe92c02-40af-a077-4189-6f0c0a934745@axentia.se>
Date:   Wed, 27 Oct 2021 12:41:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] i2c: i2c-mux-gpio: Add support 'select-delay'
 property
Content-Language: en-US
To:     Horatiu Vultur <horatiu.vultur@microchip.com>, robh+dt@kernel.org,
        peter.korsgaard@barco.com, lars.povlsen@microchip.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
 <20211013141003.2388495-3-horatiu.vultur@microchip.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20211013141003.2388495-3-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0008.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::13) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by AS8PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:20b:310::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend Transport; Wed, 27 Oct 2021 10:41:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 055a738f-6ff1-4c6f-5b41-08d999365438
X-MS-TrafficTypeDiagnostic: DB3PR0202MB3324:
X-Microsoft-Antispam-PRVS: <DB3PR0202MB3324B9DA7F5D85A550BB6C7EBC859@DB3PR0202MB3324.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: onF8TGBCSyxvmHP3EmiLxODr/6k6nV+neGfPWT0uTo6GIC8200yXJ59IfJuHrkUCg1yMxuzZjvr+pXNnFamdOijCXzStKT6bokDa48oFCXbR0V/GP1Nwfs05VATTXrz4BTZtw4Qm+yFxS607oXIzqmoC63vquBsK55FnlV3G9xiD/z2gnGiGMfVsRNmfZ1r5PbPaSN/3H4zKQUkmjj6Nt0M/CSfr384hpQf8zxKnTbgpts1wuKLurAc7MDMnxaLGIXVmunMrW6SkCIrXwCQERI2vcQeY0yShqtindBs+LissAODBugE11MFlDgSP0r6vRbhWZeNGi5kvce/lRdqWIX+8mTEuNbunYQD8TmcXLeBfc/7Z+BJLgA9eY7UQ7nZUwUmw64MSYxflC+jZtqTpXPNF2gMLuyDJMjunomoOpMaTa+CXoeS7rEGqImEADWMUBPj9QGSyw7iUVl2nYqGwWjYro04j2dkCqSP8E7m2vKn80rJ1BbEFxPxCDEWavtq8O0nz/GZqJ6TE8hIrS3ymcHtx5mtMg3vZy5QIquhCORjenhIYKCWFIBqgnbOGcCFWFaDD48peJRporPIKASVtIOb5wrYdxBYJAZmqnnt0w26r5SCeIlz++ATVO81Y8INsxoBRiVf+iKQR7f3ZVjZn1hHEhL/R8/E+ee8EWgJVMEFDPzjhW8zN72C/TpYfqGfy3rrJ9YlITZVl7iY6KvoSjh5jhlWjSuMS0lWz4U23mVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39830400003)(346002)(376002)(136003)(366004)(2616005)(38100700002)(53546011)(316002)(31696002)(83380400001)(186003)(956004)(6486002)(5660300002)(36756003)(16576012)(86362001)(4001150100001)(508600001)(26005)(8936002)(8676002)(66946007)(36916002)(66476007)(66556008)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1g0R2ZubWcwaHZtS0sxdW9CdUtqK1EwTGlKd1VRNWw0bXFlRTRhS2NobW5O?=
 =?utf-8?B?Q1BCdXIyWVpJY0NLT2V5cWtma3FIYVJVWTJGZUk2N05Bd0RRb0pzd0E4RkFH?=
 =?utf-8?B?akx4eUhuaVVoeTZjSlpiWXlMbXpJbC9FcG1jYkhCaU5tVUtRc3RnNDY3V1cy?=
 =?utf-8?B?QUR4bFdDS1JFMWVmQWMxRVJYcFpST0JLanBOQWpuNlBRVFQ0djFWa3Z5dkJJ?=
 =?utf-8?B?YlJ0TDVSaTc0dTh2TXVNS1lRbHdUWkFCaEJvV1NZUlpFcEtRZ0Q4QnRSWkJi?=
 =?utf-8?B?VnRCSUVTMGd1NkR3NFd4S3BJUXQ3amRCMjhjYmpvUStCN2dvUnZBNHpQL0w4?=
 =?utf-8?B?aHZEU0NyeFdVcjFYVk1xaGsreXAwMzlTYWpxbTZ0NjcyTkNhdHRvL3pud0sw?=
 =?utf-8?B?MVJ2WXhlTllBOGN4bUlyRmMyZkNsSXI4OGY0OVA5eEdZekVLK1RjdFUxTnRU?=
 =?utf-8?B?K091S2RIYXFBclo0Sk9Qa3c1bHVkdG9HV2JDOTBNYkZlTHIzdXAwYXQ5YThG?=
 =?utf-8?B?MHFPU3lyL2pxQU0zeE9Ja2NqRElnY0dRR3lrZE1ySWNhM0wxL0hRZmFJNTFt?=
 =?utf-8?B?QjFzckJpaGkrSzBOQ0xFOGRYYzVEdGFCc3ZaSkx5RFRmMG9yZFFDYkgyTERv?=
 =?utf-8?B?RkdDYXNVbk8xck13SjRydjdFUkJ5ZVozZUQweFJTbnUydzE4czhQQUZZbUlT?=
 =?utf-8?B?cE9uSGZZazBoSW45RzVUVTNmRXZjaGFOT1JhaFQ5Y1VMRGwxN2RJL1pLOXNv?=
 =?utf-8?B?VDNnSFZZeXZCQjRVUUo0WGthMWhBd2trblhYc0FwNk5td2Y3bnp1VXBsVXBl?=
 =?utf-8?B?OTFVOUM2OTc3YmFpN29HVUFBM3lKSTVEOGZwWndTazFWRHg4YjJGYWZOQXpz?=
 =?utf-8?B?YVkwWlNJSEE1Z2VmNXVWeVplWjRVS2d2RW44b0VtM3QrVUtqTEdkYkl2aW9H?=
 =?utf-8?B?ajNRUzQ4ZytDNUZldW5NS2EvamVQUUhRYmFEMnBlaVZFamtMdWJTNVF4Y242?=
 =?utf-8?B?TjhndzFuSnZYMGZvYTJ2MFI5Y24yczJMZkRkNVFMTDZlcmRQQ2g0eFRtS2Vm?=
 =?utf-8?B?TGZ1bGFlRU9Mb0tEU1BBQU1KRmo0MTlHUEo4eFVzWnB5ODBUYXRqYzhqTUla?=
 =?utf-8?B?enY2YXpPVEgwd1JDdlNKZTlLN3owS2JldSsra01hNk5iWFFsTnk2ZUU0VDky?=
 =?utf-8?B?OGw4eXRhcUtUclJzYTZKbm9XSncyek1LOHc3c1JNL05ZTGRydE1SU1lISVBn?=
 =?utf-8?B?THFtOXl1YTVpTzVIZSsxdXhLNXV3QUdBc3p3MHFFTExvcE96ejlDNXVSMito?=
 =?utf-8?B?UVBlN2VWZHhGQWVuVXM1S0xQZzZsaDRrU2xVL0FvMStYbDNpemt5djdpS3pS?=
 =?utf-8?B?TmRIUHdFbW5PaW9lUWwvUDVlNE5WUFVseGJ4UTRjZkNFdlo2bFJ5bFpYUkpW?=
 =?utf-8?B?aVdCWUJjcnliQ1QzM1ZNb0ZEQUx3aXhibXh5cWtoc1VJcGwvRG5XNFlMRHhB?=
 =?utf-8?B?eElzY3E2djlmcDRxK2J3RlB1TURMNXRrOUVnQnE4bUxKUTZtMFJDWkxhTDZ5?=
 =?utf-8?B?OTd3ZzFDUEViVElDYjlvRytqYWtZM0tqajlySVlwcGtmZTVpSUdKUEE1MDhJ?=
 =?utf-8?B?ZmJ4QU02ckJkMGd5STRVTmNFVjhXbDlRN2YzMmNaMU9odzhzNm0wVnBPZjdH?=
 =?utf-8?B?aFlidEt1RWFtVHJGRmw2a2RXcWZ4cU8vVmw2ZEZ4ekcyWlNMeHVKMElOWTMz?=
 =?utf-8?B?QW1kVzhvckRJQkdWaHhSTFN1YUdDTlgrTTdybXlBMnVqdTdtVFdCTDJWL1NH?=
 =?utf-8?B?OEc3VzJ3WFR5eHVDR3dlQmZpSG1NRkxZRXpmbFI3ZURBMjllNGt4bmpnUlRo?=
 =?utf-8?B?Q3RVdm9rcGxUbXUvTUVMMXAxL1QvRnpkQjRMQVFIa2kzVTA4Qmo5bnltMkh0?=
 =?utf-8?B?OFhCYTQ1bFI3RnAxTVl5WVdYY3RzSi9yS0VObHZyaHY5WEJyV1p1QWd2dDJH?=
 =?utf-8?B?bm5MY2ZHbHMwZ0YrTzg1QzV3UlVnNkF5SWNhMElKMDJtUGhNSjZTSkV1OHN6?=
 =?utf-8?B?Zm5PNUwzeWxvdzg3Y21uNmNOTW92d0ZmdDVFZ2QyTit1NU9pa0hlbjRjWW5S?=
 =?utf-8?Q?v51E=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 055a738f-6ff1-4c6f-5b41-08d999365438
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 10:41:27.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5uk6tTg/hEpRczOP+GrWgXJ4xrILtp7peARDVXgHA3CViowwUbugpSdST53p+Vr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3324
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

I'm sorry for the slow response...

On 2021-10-13 16:10, Horatiu Vultur wrote:
> Use select-delay property to add a delay once the mux state is changed.
> This is required on some platforms to allow the GPIO signals to get
> stabilized.
> 
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  drivers/i2c/muxes/i2c-mux-gpio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index bac415a52b78..1cc69eb67221 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -13,6 +13,8 @@
>  #include <linux/slab.h>
>  #include <linux/bits.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +
>  /* FIXME: stop poking around inside gpiolib */
>  #include "../../gpio/gpiolib.h"
>  
> @@ -20,6 +22,7 @@ struct gpiomux {
>  	struct i2c_mux_gpio_platform_data data;
>  	int ngpios;
>  	struct gpio_desc **gpios;
> +	int select_delay;
>  };
>  
>  static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
> @@ -29,6 +32,8 @@ static void i2c_mux_gpio_set(const struct gpiomux *mux, unsigned val)
>  	values[0] = val;
>  
>  	gpiod_set_array_value_cansleep(mux->ngpios, mux->gpios, NULL, values);
> +	if (mux->select_delay)
> +		udelay(mux->select_delay);

Use fsleep(mux->select_delay) if you don't know how long the delay really
is.

However, you needlessly invoke the delay even if you do not actually change
the state of the mux. In order to fix that, you need to keep track of the
current state of the mux, but that's a chunk of boring code to write. If you
instead switch to using a mux-gpio from the mux subsystem and point an
i2c-mux-gpmux to that instance, you get that for free, and you can make simple
changes to the i2c-mux-gpmux driver to get this sorted properly, basically
exactly as this patch but with this

-	ret = mux_control_select(mux->control, chan->channel);
+	ret = mux_control_select_delay(mux->control, chan->channel,
+				       mux->delay_us);

instead of the udelay/fsleep in this patch. That will invoke the requested
delay, but only if too little time has gone by since the latest state change.

That interface (mux_control_select_delay) is brand new though, but available
in linux-next and scheduled for the next merge window. But, since I fumbled
this series it's a bit late for this merge window anyway (sorry again) so
that should not be an issue.

Cheers,
Peter

>  }
>  
>  static int i2c_mux_gpio_select(struct i2c_mux_core *muxc, u32 chan)
> @@ -153,6 +158,8 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>  	if (fwnode_property_read_u32(dev->fwnode, "idle-state", &mux->data.idle))
>  		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
>  
> +	fwnode_property_read_u32(dev->fwnode, "select-delay", &mux->select_delay);
> +
>  	return 0;
>  }
>  
> 
