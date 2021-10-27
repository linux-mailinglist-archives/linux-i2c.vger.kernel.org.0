Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345FD43C7D7
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Oct 2021 12:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237293AbhJ0Kpm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Oct 2021 06:45:42 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com ([40.107.8.111]:38830
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232122AbhJ0Kpl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 Oct 2021 06:45:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1Iz33PzxVgP6o7LQ3CtyKJBPQUy0RIDtMSLHw+yWw62oTfpGFO76y9ZXOEiWwvaCSJW8uLVo9siyjPm9nCutSaOaRCpjBO81ktmjpYJVZCcWvkyZMX1rYN9u7mMHGavvt1rYRHT9ddRI6RuJtmF6AnBj6OpqIdSDBLDjAL60yr8+AqhLkmHLl+J7/T4rwTvtSoLAtGnXV7NzmTTNrjleLDFA/XYK8oY1/tvzLDaiowUvhlhE3OaOPmv6GyePq9Mgcg5fr9301Ljpss9+PmGxYEibWqp1euFNhgK1c290s9fw4cE9lFUzoKSqOZICdZOPsV9yA6TLSf0CRJTm1REsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XLdUT6KmnyGdt+20MKrwM3Ib+kea8BZvG1V1bgGIb8=;
 b=GgEWzh3VS348zlE9KPJSA5EK/Htm1YGernWTdG/CPWN5ZkrsW2Do7O32WFiqFs/ljSqQ2hkyj9Y5UZSUa6EXh06cd2nGqdLcRXKaXwrmnT1LA8Ixa2iud6yt6G7TzY/6wZ6bpwn2AMqDK5JzVsshHiWlu6GqL1JU1SBi+ojmm/ylKQrt6Dw+9R4TgnKiuPfOirQsvYDxXqB7liRp5GtUDM3+yViU4FsH8kPE55TE5W+f5XpiiwaNgGa++0KejqBw3DxCaAKiu/lXOGLoL4DnhLXN+pbObhWMkoUmaN8/F1NiHwualVRvwMmGyu9SEcIAut0QdAkVr9RCOHBxhHh5Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XLdUT6KmnyGdt+20MKrwM3Ib+kea8BZvG1V1bgGIb8=;
 b=fY5Z4ziDJAik284cRDLc2yxR/UKYizGt0ZpvYLX01cHbUQyLnQLPiucYjzB74SlPmMVtbxEX46tvu/1fFaPvKSQYJ9tORkJI8K0Mxiusj7lkrGH2ye+IdJA23vwCbYfMj8NCCVYkwE/mNkjgoWZrphYosz97Is3/nbHs/b00gC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB3PR0202MB3324.eurprd02.prod.outlook.com (2603:10a6:8:6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 10:43:14 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 10:43:14 +0000
Message-ID: <26785a75-11d8-ec96-47b6-ae8f2ae0af29@axentia.se>
Date:   Wed, 27 Oct 2021 12:43:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c-mux-gpio: Add optional DT property
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     peter.korsgaard@barco.com, lars.povlsen@microchip.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
 <20211013141003.2388495-2-horatiu.vultur@microchip.com>
 <YXhlEYr2zygThVsj@robh.at.kernel.org>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <YXhlEYr2zygThVsj@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::28)
 To DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by HE1P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 10:43:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 214e565a-ffde-40c9-15dd-08d99936940e
X-MS-TrafficTypeDiagnostic: DB3PR0202MB3324:
X-Microsoft-Antispam-PRVS: <DB3PR0202MB3324501D27317F525350F1D7BC859@DB3PR0202MB3324.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nj2Y+BHqZdVqFA6QvRWK+HyZCTnrgptc8BwIopP1yKjXlRJ3MIJNfy4WU25uQLD2MCPy93d92FyhEjge3nSSH0m2ynZ38gqTaWMrQPgg2mcvr2MHFkzy5N4Ye9xttIaKHfDVcLXDw5cED0JFEDKjKc/p/QF4zemX2XS1n5kdRe0UhiKSKfFbNFJLvxRMF+OMYWuvElJgy7BYdt3Z0M4OM4Bzq8Lp8Vq9NN86buvE96GWgFwi6XOsdTwFXZRLh82hAqKwOc7TsLGey8x+nWvlV72bi6fVtJzlerGC3B34osmoGtQupLWhmXAdQ/mip31+imtIzVFSg3xBZzXXsgFLii1v9KH/moPZevZ5WqKxEklfdegHo3Kbma5BrGRVY/wOzYlmSZ1Rorzh6+OxtelSiU4JvelHmofX4/LeI8slAjmm2VPymeSw5KT7S5nH9imn/mBiw8lcnx05N/fxfKJnHbL84y+gqkQkulwP3NmAWZ9CCG5IUsPuNWDjReaEl7emor5MUKNLqYu9C6AhbNcfnNs7OXlr1Tsz3i5RApct5P4cjeaS6XqkNkvO7TC6uNy9OrW8MRlxXtSu3ExRzgoC6zDmanveJAgGqVDosv66twgn2WYWqkag1IP+4XSCps0MHexrYpaMFDftV1Z0haWpegaUyqjHvd9K9/p2z4bXABLmuFzBa6hD4jSNv4sEWgD9pxvwJzDVl0bIpal9acaOsq1S4N/ojXKiCXkNzety47HKW/yzQ9HgRWx7oOJJ8uKf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39830400003)(346002)(376002)(136003)(366004)(2616005)(38100700002)(53546011)(316002)(31696002)(83380400001)(186003)(956004)(110136005)(6486002)(4326008)(5660300002)(36756003)(16576012)(86362001)(4001150100001)(508600001)(26005)(8936002)(8676002)(66946007)(36916002)(66476007)(66556008)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG55K0dwd0RTdzYzVnZHa3piQy9IRkYzMll0bldWU0J5Z2d4Q1NKeEJhNk0v?=
 =?utf-8?B?bERNSHV0eS9mSzJlcFBaUWFhbDJUcWp4V3p0NzF0OWpLRTNzUFZYbFV0cnh0?=
 =?utf-8?B?djJyYlBpMm5ORStkOFlUVkhBZDRMY2ZWVG0rNmYwS3d1UitqUElKdGJmV09P?=
 =?utf-8?B?eFo3cVpjR2ZmWm5CeUZJajQrSGVxQ2hvN3Z4cGN1T2pDUExHdU5ESGN5SHFR?=
 =?utf-8?B?QmE3dmN4blJkeVVkMXRYUEVHUEM4ejdnTGE5aVAyTTZJeCtuY1FmSURwODZ0?=
 =?utf-8?B?dWxxM1hsUlEwV2djSXMycTc5b3JjZlBQMnNxUkpka0xJTEU3ckRKbjQ0NlB6?=
 =?utf-8?B?cUsrL1FEZi9vT1IzdzVOVUkrSmJzTlJIRndFT2xtL1V2NG5iUDAwVFc1OUQ5?=
 =?utf-8?B?WTRnQkxwUzd0NEg5Z0dIczNoMEVXdUFZVFVWQkVFak1DcWpXTUlvaGgrTkl3?=
 =?utf-8?B?YktZQWdxeEFiWEtESGJlRERVanNJL3hwak5nMThLU2thYzB5YWdFNDY5dFhj?=
 =?utf-8?B?RVNyb1VHdHVlSUkvbnVzK2pCaWFPdnVqa05OQXB1NUtqYVlDR3FEeUlUTDF4?=
 =?utf-8?B?V2tEQmZzU0VVZC9hY1pnbnRzN1BpRWRMbFdMa1YrU2xOaEJwSURwRS85bUlu?=
 =?utf-8?B?R0JnbE1qRlpiRHUrTjdpTUY5OXVNakNBNXRkMFovbmhUa1lCdzlBRG9LUkE1?=
 =?utf-8?B?YWdqajhISlBXdzJvQ3BRaldYZkVuaWtzMDVqWFVwT3JPSi9HWG1UVnllcUpC?=
 =?utf-8?B?eWpSd2VSdnRUQ0NFUnNaU1JJc01BekR5bEFuWjdBTzNqWlhQVVVkYU1yaUNv?=
 =?utf-8?B?VjhNSjFub0x2N0VYbFVjbGppK1ZXdlJZMlVmajYzM1dTRER3ZVcreWlSWEhU?=
 =?utf-8?B?NUpiRlNqNm9vVVBtMFJyQTJ5b2JqNDVwU0Izak8rZzdXb0NyS21OR0VCenhO?=
 =?utf-8?B?VVFNaXZONnltcHdsWFFoZDhmNWVaN3FpUUZJRzJXaXJzbjBRSTRrYmdBZWxn?=
 =?utf-8?B?aWY4dFJsMWVxSkZKZXJLNWhibXZsenp4Ni94OUs5clhVeDhrS042akN5amFQ?=
 =?utf-8?B?RGJ2WGxtWGx4MGE5d1l4aEVYSUhObzZzTE5aTUduNXB3SlhzNlo3ZU1PWmRC?=
 =?utf-8?B?Y1NRVWRiVG5YOEo5MFptUDJhNVpRa3E2TGJkM2NMblFObnhkaUU5MWcwVUZQ?=
 =?utf-8?B?Q043TGNOdTVrNmVNQnc3dXlDTmNrS3M1aU5qb3BMR0pIYkRSK1JyRWpVRmV3?=
 =?utf-8?B?dm42SzBYS0tla1YxU1J4cWpLdGZUYUN4QWM0Ylp4MlJTaktVRkxBdTdUcHgz?=
 =?utf-8?B?N2hTN0FzbithR3dvT2UxQy90WFVPQ053TXhzeE8zaElZVzVPK1EyS0tYTFBj?=
 =?utf-8?B?bGFic0VZOWREc3dkNzNibFptNHBMTEZnU1VsSzRCeGtnazNGNUIvQVZvWW52?=
 =?utf-8?B?bWRMK3dxdEZBejBSVml0blJVU0VZOFlSWnBNK3hhZEhZYko4TWE5M3dBMWgx?=
 =?utf-8?B?K2ZlUDRMdnQ1eFpkalVMbGMwRGgrTFVjN2wzeE40OHpqUHFQdXlrRVBJRGhi?=
 =?utf-8?B?ZVhyenlxSytpeGU4ajg5dDZWS2Vsb0E5Y21CcDlod0RVRGU4ZmlQeVllRUsx?=
 =?utf-8?B?cmNnWkVnRDRVTGpNUUl6V0FQRWloU0xiUEVZYmR0Y3dqUndHSitDSk8rYXg4?=
 =?utf-8?B?bE1QWWdkVWdTeVVUUEc5MnlmclBYcWt6Unl4bzljV1Y0d3lrb1NkWXdZM1dp?=
 =?utf-8?B?U2N2T3ZnSnNSdis1K3UrZlFIRURUYU13MFpRcUQrTHo4UGwwRGtlUzU1WUkw?=
 =?utf-8?B?SnRiS3kzVnltOE4rZjhLbzlxdWF3UWtMdVpzZU1BVU1lU05zcWExMTl6b29B?=
 =?utf-8?B?U0pyM01QcVNoTkFEcTlERlZZRUVJWFpHcWliUUViTzdIelNyc0dZb3ZJS1lR?=
 =?utf-8?B?dmVwK3NmcUo0Q3Vvd0ZlM3Q1MnRmdjhLV2s0bWViZHgrcTNMbDNZSGs0K1FF?=
 =?utf-8?B?YkY0U3FWOXJaYytWNkVaYTZicmVTMTZSQzJyZXZKZjZpckN0MzNreEFoYU81?=
 =?utf-8?B?MnZyVU1uUXdKbCtyS21WSzh6VlZoYXFvM3dqQ1h3NGUxc2tCLzlKN0tLYXFk?=
 =?utf-8?Q?EttA=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 214e565a-ffde-40c9-15dd-08d99936940e
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 10:43:14.2079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CGZstQVkTef3EFlHcGH0fBQTL2k/Dpwv26ANFV+Sk8VZTAOAX7d1nfcCLi5TKaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3324
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-10-26 22:29, Rob Herring wrote:
> On Wed, Oct 13, 2021 at 04:10:02PM +0200, Horatiu Vultur wrote:
>> Add optional property 'select-delay' DT property. In case this is set
>> then a delay is added when changing mux state. The value is specified in
>> usec.
>>
>> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
>> ---
>>  Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
>> index d4cf10582a26..d0dacbad491a 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
>> @@ -28,6 +28,7 @@ Required properties:
>>  Optional properties:
>>  - idle-state: value to set the muxer to when idle. When no value is
>>    given, it defaults to the last value used.
>> +- select-delay: GPIO settle delay when changing mux state. In usec.
> 
> Seems generally useful. Can we add this first to the mux control 
> binding, then use it here (or better yet, use the mux binding if you 
> can instead)
I do not think that adding a delay to the mux-control binding is what
we want. Any change to the mux-control will be quick. What may take time
is rearranging the routing inside the mux and for the muxed signals
affected by those changes to then settle.

This might sound like splitting hairs, but the distinction does provide
a hint for where the delay fits best. And I think that any user of a
mux-control that might need a delay after changed mux state knows best
what that delay really is. Considering the case where a single
mux-control is used for two different muxes that are routing signals
with different settling time requirements. Why should a quick path
suffer the delays enforced for some other, slow, path? So, I don't
think the delay fits as a property of the mux-control.

> Also, properties with units need a standard unit suffix.

Another naming issue is that the io-channel-mux binding recently added
a settle-time-us property for this exact purpose, it might be good to
follow that lead.

However, since I'm not really happy with the implementation, it might
be easier to instead use a generic mux-control and extend the
i2c-mux-gpmux driver with this settling time. See comments on patch
2/2 for details.

Cheers,
Peter

>>  
>>  For each i2c child node, an I2C child bus will be created. They will
>>  be numbered based on their order in the device tree.
>> -- 
>> 2.33.0
>>
