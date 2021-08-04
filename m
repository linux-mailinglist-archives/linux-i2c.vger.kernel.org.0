Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DF03DFC47
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Aug 2021 09:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbhHDHua (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Aug 2021 03:50:30 -0400
Received: from mail-eopbgr00103.outbound.protection.outlook.com ([40.107.0.103]:26126
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235952AbhHDHua (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Aug 2021 03:50:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCBt4K6sEdiXf3P+RbzgBA2GKz01DDq1q8fEjxCAelbToMJ//Fxl5lU5Uemgz8/D6lU1RJL1/Jt3ORERusxFDF9qIo+VlQIYxTK7umXk/TU+6iKeKYHE5SKKmiEyy/EpLzvTeH1VMFwPPOe42e1dofLviAa10SiP81gfhkWFPZuZLo5MZ1irWpS700Vm+/PkwYtfG1N/m6R03k0AGnXLM6hRg4LLSZTDfbDxtKu5iSXx3KYdlyPREtl+w1bltu0MBQ9Lb3fU+OFpTrozG7EiVcH/Iq8TPub8IPn+MEjH8SDQFDrDGIRu9E8gUL7xDOXiC5q6iaxdu/t3pRpzOt/L/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC++k3aiTlF/gR0PaOM9TcR1vT+SV6wOyjG0Q+z/BnA=;
 b=AZccMH6wKqSczg4mfYOi1HaHHmv488My1Btf9Cwclnm5HxapYTcZ0X/dEDOEjLzd7lw3gt7blz8VnG5amlSDukUVXXuzmRtGNElXYbun+W+m1vsNK2H+BUzFZTGaoX5UoHhiw8Nhf5AMDvkoMlGPie1wS8Pm8KkyXxVg7i9lgCXZE+nZeuriXhvvAKPf8GVnM7ZSRLir7WxwMrr1eoL9O8wSFuEEVt8UughGuz6HgaoUz0qchFcTi+ogUqigd72f6Xo21gaRw8AOo1R2dg5W/oLgcLpBTZJkiNbDUEYLqUWuHpffPC1G1efrymqlzouLL1mKBnmuw4HEy82ArMi0vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC++k3aiTlF/gR0PaOM9TcR1vT+SV6wOyjG0Q+z/BnA=;
 b=Ze4wjwT/PfbQRcGqpmQmmnLATwbuBw+Fw8tZWqD2LYQXFAqNjhSC4JtkUg50kjHFzNotki/Iroj5GxO382bHwMq4v4yVaDc3/Rt/fLL2+ILfaydLdI7ozGsU7WOLhA7r2J3csHbu5IbtWHWTfwZNK/fPNegJsMFUoSkyow+ABfM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5961.eurprd02.prod.outlook.com (2603:10a6:10:119::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 07:50:14 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::14ca:a41:2218:3578]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::14ca:a41:2218:3578%6]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 07:50:14 +0000
Subject: Re: [PATCH v2 2/2] i2c: mux: pca954x: Support multiple devices on a
 single reset line
To:     Eddie James <eajames@linux.ibm.com>, Rob Herring <robh@kernel.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210727160315.15575-1-eajames@linux.ibm.com>
 <20210727160315.15575-3-eajames@linux.ibm.com>
 <YQhZimPDbNJk5nbR@robh.at.kernel.org>
 <29d72be98ebe3e5761f4c3da7b4daf2f05fbbf3b.camel@linux.ibm.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <209d9f68-e6c4-68c9-d495-d7e3f5050440@axentia.se>
Date:   Wed, 4 Aug 2021 09:50:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <29d72be98ebe3e5761f4c3da7b4daf2f05fbbf3b.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR1001CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::18) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR1001CA0008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f7::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend Transport; Wed, 4 Aug 2021 07:50:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beaca6f6-10a1-4cfd-41ae-08d9571c7eaf
X-MS-TrafficTypeDiagnostic: DB8PR02MB5961:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5961B7F516305A7CA5C7EC87BCF19@DB8PR02MB5961.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mYd7D0I510EvP/dk8cOjIHMogp+4cVsM414TWadYEA+ser2AnMKs3fXNAC7gS5CGMjhAK1/vjJTdPHGwn4MB+Dy0rKhjWg1d/fcDRpu/G2siIPdixuRaS94Dvt0Iu6HDSLr96wJ0kFysn7bB1uy3dn/OYIfcuyyrRvdbKu4y5Fd+SV0gRrz7p1esfnjswAna7DliftlXPqZ0sbgTmoE0Ac2BLLYXvU50SiIYaE9tHA639KNN0fQ4m9XGPAIBJH2a4qjCZq7D7ktzf4OiA75qrw0i3mF2kf0ur73nudiEKF50L+3kRMuk/+z0/HUOoXvb/rKeQND1BhA9BvihQqgDMdkgZ74sA0g7OYGp5axjZ7I8IJVeVRyd2rBHvtI3NAsIkWpP9XZlMBXG3fCBfRQDBl1HxX8v8WSNatbzAWbenYRKIQp31wzbLEJm+wWSLfzST0zvEEAUqTMYjeRaSpnPh4RFuyS+npIcDyaozk1Hu8jNxuljoS0E9TQw1WzPwtJOM1wOECMN1ftGI9kd6jljYSZ5pBdf+tHJ6sswjHhb5U9Cu7sj589SIPd8kOUrNoeIX21d3A0w3S20/BL0JQkPc/JKEufsZvxzKvZx2E08FVe3U7K5gNLFHVdxcRSq2XZDeORnhRryNWszUhsyszPk45ldxhiDxOhCvNs0Fmu8iJ8pVVvXQ0zVcSnLDQkQjSZL17jLbHI9qHaHLc7U02WGm69vvLMLJ2Qlen5ngcC4QcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(39830400003)(366004)(396003)(136003)(8676002)(4326008)(2906002)(2616005)(8936002)(66556008)(66476007)(66946007)(478600001)(83380400001)(53546011)(956004)(86362001)(36916002)(186003)(31686004)(26005)(36756003)(6486002)(38100700002)(316002)(16576012)(5660300002)(31696002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1JjdUtxclRxNEE3UTlvVk1iU3U5UU45blZTWGFZWXViKytNSEs2UWFkOTN3?=
 =?utf-8?B?bGQrUWp4ZFAxelBZM2U4QVo2bDlqeTFQU2N6WENrcVhNa2tSaFczaXBna3My?=
 =?utf-8?B?ZnpOT3JEbmI4cmw5Q3VUOUVFOGVGS0h3c3UydzVjYkZLWi8ydkNCNXJVOFNT?=
 =?utf-8?B?a01HNGUyMGVrbXFidXRhQnIxb2lrRzFrdlZ3cVVxcVFOUEZkWVYyTitBR1lp?=
 =?utf-8?B?dzZWbHBDbG5MdlRGdlJvWFdicFM1ekpwa2g2LzU1QzluL2NUSGlJaXFraDJ4?=
 =?utf-8?B?d2I2TkhkZStMSVNBZ2VuWE5HbFJNMnhxdHI1SzFxb0F5YzVOQVhrM1RId0Rt?=
 =?utf-8?B?N3BidW4zTUpNODNQWTNXbWtLRnFSV0IzTXBBcWtNVDhyZkRuRGN6aUExTUZX?=
 =?utf-8?B?eEVabmZJamJoQlpHSlVwUEhQM1k4Lzk5WnRacGZ2UndUZjZ0L1ZGTUNwcXIw?=
 =?utf-8?B?ck1UVERTZEhMbHl0TzJOTWlTT3hydHM0TURLV3pETk1LWXZJaExuQXh4NytV?=
 =?utf-8?B?RTZPRjR5TlpBZmhONnhFQ1FUd2V0S29Jaml3bG5yWVc1d3M3UW9mWmFlbWRF?=
 =?utf-8?B?aDJXOTdySEk5SS9obHY2QWhwNlZ5ZFAyZ25WZHRWdXFYdkJXZ3hiSEFRdkhp?=
 =?utf-8?B?Q2hiT3lBOTVhM1BDOUswdThXZnY5NmEwSmtlWS9IbHRoSzMvM1M1dnM2aVNQ?=
 =?utf-8?B?WGdBRWUveXFjU1AyUW5WVEZkSDZ5WFJ6SlhWbDFLV3JRTmhpTDROdDBNRXRL?=
 =?utf-8?B?TGtPa1ZWSjRFYzdDWCszYXVRSzFicWZLRkg0VmJtMVA2RlJKNWxDUWI3SFN0?=
 =?utf-8?B?Q3pwUHNwZ0RBbTRpcTB5anh4SytJM2R4akhpcTJTbnJvY3hyTmk1KzgyaUJT?=
 =?utf-8?B?NE1oQjBHaDY3N0Q1VWxtRWhNZ05JdTZ5R3IxMi84bnpUaVU1b3c4K0NSa1pZ?=
 =?utf-8?B?MDlRN3E3ZGFrOHRScCtqRjNoQmhkZFF6T3NNVVdSU1ZsSWROV1FSWU5QdHlw?=
 =?utf-8?B?bEVJV2V0bWxPL3hkdWZCTmFwYzBiL1lTQmQzczNlY3lIUkhidHg1aks3b2h2?=
 =?utf-8?B?RjB1Mm8yQjJ3TnRQRUVEenVtZTJqekpEaC8wUzhLNzBqSmRod1REMHZjNkdS?=
 =?utf-8?B?TzFXMmlBcjBqbStXL2JmQi9LY0NnYnhwSFJYZGRlRHdTS3NCUEYwTEszWVBY?=
 =?utf-8?B?WFFUSFBrQWh6L1h3Y2EzTGZYTnNPMlZnR1V1WXUxWDA0blVPbzZDaUNZM2w4?=
 =?utf-8?B?MnNqQno0cXlncXltanlqS1FvT0E0SjVSNjBsTGxkQ3dCdjBFY0V5RkdqbHhN?=
 =?utf-8?B?b3duR1JiTE10QW9aOUEzTlhCem80TnhCSDI4dlpuQ1MrQkNXcGU5dDFXTEp4?=
 =?utf-8?B?WSt0UHNFd2hmUkFNMjhlTlRzSG1HYVBXUVd1MlkxQlpudDExeHJMcng4aWs1?=
 =?utf-8?B?dklRM1dzbHNRZC9xaTN3VU1ROTAxbHY0M0NuM2hzc3lTSmdRbkNCYUxmbGxD?=
 =?utf-8?B?bURsLzNBVWhJczFTakllRTVHcDNOZWZNcktxK3pDdUdHSTNObkJHZTJUQnZ5?=
 =?utf-8?B?WUh0VjhEZ04vVlBidm9XRWpxN1JoZnYwWDkwTTR2RW95TGgyWUNtYURKeVU2?=
 =?utf-8?B?aHlyZUJQNkJDSTZyMisyZ24vbDBycWtVdG1BY2Q1SXNxQTBRRUpaaWtWN0Fu?=
 =?utf-8?B?cHdhU05QWUpPRUk2Wld6RFF4WGtmSyt6ZzRZY1lEQmRsN05XV2xCM3Bhd1k3?=
 =?utf-8?Q?k4+Tb5Ml28KONZDMHrMrHpcK/CSMcVVEmbZ6cMH?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: beaca6f6-10a1-4cfd-41ae-08d9571c7eaf
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 07:50:14.8509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsmBXUp3IZKJDs94YaQbXz5lRXVp6qldgtVMWtqh91jp2sVZEpZyo8mn3jwrH2fE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5961
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-08-02 23:51, Eddie James wrote:
> On Mon, 2021-08-02 at 14:46 -0600, Rob Herring wrote:
>> On Tue, Jul 27, 2021 at 11:03:15AM -0500, Eddie James wrote:
>>> Some systems connect several PCA954x devices to a single reset
>>> GPIO. For
>>> these devices to get out of reset and probe successfully, each
>>> device must
>>> defer the probe until the GPIO has been hogged. Accomplish this by
>>> attempting to grab a new "reset-shared-hogged" devicetree property,
>>> but
>>> expect it to fail with EPROBE_DEFER or EBUSY.
>>>
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> ---
>>>  drivers/i2c/muxes/i2c-mux-pca954x.c | 46 +++++++++++++++++++++++
>>> ------
>>>  1 file changed, 37 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c
>>> b/drivers/i2c/muxes/i2c-mux-pca954x.c
>>> index 4ad665757dd8..376b54ffb590 100644
>>> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
>>> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
>>> @@ -434,15 +434,43 @@ static int pca954x_probe(struct i2c_client
>>> *client,
>>>  	i2c_set_clientdata(client, muxc);
>>>  	data->client = client;
>>>  
>>> -	/* Reset the mux if a reset GPIO is specified. */
>>> -	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>>> -	if (IS_ERR(gpio))
>>> -		return PTR_ERR(gpio);
>>> -	if (gpio) {
>>> -		udelay(1);
>>> -		gpiod_set_value_cansleep(gpio, 0);
>>> -		/* Give the chip some time to recover. */
>>> -		udelay(1);
>>> +	/*
>>> +	 * Grab the shared, hogged gpio that controls the mux reset. We
>>> expect
>>> +	 * this to fail with either EPROBE_DEFER or EBUSY. The only
>>> purpose of
>>> +	 * trying to get it is to make sure the gpio controller has
>>> probed up
>>> +	 * and hogged the line to take the mux out of reset, meaning
>>> that the
>>> +	 * mux is ready to be probed up. Don't try and set the line any
>>> way; in
>>> +	 * the event we actually successfully get the line (if it
>>> wasn't
>>> +	 * hogged) then we immediately release it, since there is no
>>> way to
>>> +	 * sync up the line between muxes.
>>> +	 */
>>> +	gpio = gpiod_get_optional(dev, "reset-shared-hogged", 0);
>>> +	if (IS_ERR(gpio)) {
>>> +		ret = PTR_ERR(gpio);
>>> +		if (ret != -EBUSY)
>>> +			return ret;
>>
>> Why can't you just do this with the existing 'reset-gpios' property? 
>> What's the usecase where you'd want to fail probe because EBUSY
>> other 
>> than an error in your DT.
> 
> Hi, thanks for the reply.
> 
> Are you suggesting I use "reset-gpios" and change the driver to ignore
> EBUSY? I don't know any other usecase, I just didn't think it would be
> acceptable to ignore EBUSY on that, but perhaps it is a better
> solution.

Hi!

From a device-tree point of view that might seem simple. But it becomes
a mess when several driver instances need to coordinate. If one instance
is grabbing the reset line but is then stalled while other instances
race ahead, they might be clobbered by a late reset from the stalled
first instance.

And while it might be possible to arrange the code such that those dragons
are dodged and that the reset is properly coordinated, what if the gpio is
supposed to be shared with some other totally unrelated driver? It might
seem to work when everything is normal, but as soon as anything out of the
ordinary happens, all bets are off. I expect subtle problems in the
furture.

I see no simple solution to this, and I also expect that if gpios need
to be shared, there will eventually need to be some kind of layer that
helps with coordination such that it becomes explicit rather than
implicit and fragile.

Cheers,
Peter

> Thanks,
> Eddie
> 
>>
>>> +	} else {
>>> +		if (gpio) {
>>> +			/* This is really a problem since now we don't
>>> know the
>>> +			 * state of the gpio. Log a warning and keep
>>> trying to
>>> +			 * probe the mux just in case it works.
>>> +			 */
>>> +			dev_warn(dev, "got hogged reset line, expect
>>> error\n");
>>> +			gpiod_put(gpio);
>>> +		} else {
>>> +			/* Reset the mux if a reset GPIO is specified.
>>> */
>>> +			gpio = devm_gpiod_get_optional(dev, "reset",
>>> +						       GPIOD_OUT_HIGH);
>>> +			if (IS_ERR(gpio))
>>> +				return PTR_ERR(gpio);
>>> +
>>> +			if (gpio) {
>>> +				udelay(1);
>>> +				gpiod_set_value_cansleep(gpio, 0);
>>> +				/* Give the chip some time to recover.
>>> */
>>> +				udelay(1);
>>> +			}
>>> +		}
>>>  	}
>>>  
>>>  	data->chip = device_get_match_data(dev);
>>> -- 
>>> 2.27.0
>>>
>>>
> 

-- 
Peter Rosin
+46 730 746 224
Axentia Technologies AB
