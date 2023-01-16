Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE7766B805
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 08:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjAPHR7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 02:17:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbjAPHR5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 02:17:57 -0500
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2137.outbound.protection.outlook.com [40.107.104.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9982681;
        Sun, 15 Jan 2023 23:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya0bEAjGgRdVRIJVMidD/cqIn7wl9GT9F8u9LCHDmCNqcd1Q8XIL0bP1MzwwuZ41T9p0DgLoNQ/J/EB+2W94l7KP9fE45qEOODavR2VJA5qCRKmSR24I07mrpNqrgnIsNNgr6VN8JT1sbVb0HMtiA0WBg0jzgnT8SwiVtEt8r5nneAJKK22Ud0+t3zrZHSdEC7lLPXQPRTiN3/y3VlQT6LysUIGEklkZKUe9SCXIxVn2b0hzsW+/EhxdAtnPeiUkthvSUJx7aNvlfqspYD8+qgGWNhLRJzpb1kZ4nxHE/VLQRO8zyOX1kGc0750LS69w7BAHqN3WH4xrTdLtWtuAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ETlz3qwankEPnPMHjaRHiZ6JUZ/ChBWZSO+zkEqnEY=;
 b=nLMsr0tDjOeQVLwdRjh9FdxX06sxI7xY5UtRleR6KcGjUq2THHAjpwPpEJ6ijeEcr7nZ3ReNieu5tshEiFjFRdlZjgJZI9mR5A4n4pu45+2egzu3kSPrLKLYbK+8Oz4vmo4grjBHXSywEkay6H58umgPvwWvTBYMD5SvOuoRXplQHBr4JIJMdTv3ZHE3GDhsASKuowvu1D4nVr5GR1DhTEKlGPTzet5aS230gb5TV8zCVOauce2Ai7AC+lm8buX/E7yBePk5v0StjojRgQ8FoBnZlRSIxeIUh3DYfV4hqcGtEe0iaqwMy/C1TPwJ73jzK3gN6XsrgoHA9iMoJ96jrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ETlz3qwankEPnPMHjaRHiZ6JUZ/ChBWZSO+zkEqnEY=;
 b=apOUFwEv0pPz7DO7/24NRL1H9C10EST1KItA44f16vUv1qhCp115JN841vXVJ/I98pCqwjhOH/k3VYiRD32eha3Cw2pIxHi6yxzS+A+7W9jAB4uOUcXBvWuDBQsohDs/WBC41FrySkDH7DNx4GCI5dUsZ4RgNpsKFkLoZlippiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DU0PR02MB9679.eurprd02.prod.outlook.com (2603:10a6:10:42d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 07:17:52 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687%4]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 07:17:52 +0000
Message-ID: <7ebc1687-d962-d087-aaba-33f62fa65f8a@axentia.se>
Date:   Mon, 16 Jan 2023 08:17:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/3] i2c: algo: bit: allow getsda to be NULL
Content-Language: en-US
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
 <b70a9deb-5dc2-fbde-20f1-06b2a80c2697@gmail.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <b70a9deb-5dc2-fbde-20f1-06b2a80c2697@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF000013D4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::10) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|DU0PR02MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: d54a6e38-7f32-45d4-0a22-08daf791c7f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K11ldp98tMdk2YIfv+xaJw8Oiqqae3kqhh1o0jVBSk98FChdkzOICq5DSgK9GuJb50Z4R5fHuCPR9t8c0lub0X6RaZ98mjkPPt0M1RV18hRxl4foutl0AxCQQD9XqntP9l++P7eq2/o3bRU0bTc+/i+T8kXZlqcRLjzZyu+WYLfZXqXEZ6YJQKex9pXf6R8O10kwNClnWBlI2u4lfaVesIeAd6+nYcIobPRpTYPeX+whCuemTh3f7XchFNPUEHx4RDku6ImgmgiNIFoDL1ezqCELANzpb5xliHw6KZpXxsF0FGrxgo2nGfsRsiHKI9+HDanatcGJc194qHujX1q6qxIpN+MF+V2svX3BQWg7YKaz/ADGgaPBBb27VqOAZWA+8Nb+jNq3xgwFQ1W9uk4Fq0SUdcV96RKE0TOmdhdXezCMO0/J+F/mjyNsmQF98Cb2hfMmC5gwaAXwXRTjpRpezBFn/11xgSx4EvMJQJp3H7sfYrvGt6bPYqQjvtH+tHoTSs3iAcbzSb9L/2mbVs9xrh/vk+Q9zPZDgCInLIOrPzJw4B9lYGj4XMzUFuj+f4C/tgrJNguDXexXzIky+0JKajSMr7dklkMDFVBzlBR/VzCkGUAG567op46u4hy/XsxEONKVZtqSe9NqlexWDx2XCiz22K7C22HvGNJ+wTlsfQmpLDs5wMtCwAZaCvhJ1emZCKs8WsmMquEXR/+QV3Ak/t4qmJVhilI7QkwRCvBea4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(136003)(39830400003)(346002)(451199015)(2906002)(316002)(110136005)(54906003)(26005)(36756003)(2616005)(38100700002)(83380400001)(5660300002)(6486002)(31696002)(6506007)(6512007)(86362001)(478600001)(186003)(8676002)(31686004)(66946007)(66476007)(8936002)(66556008)(4326008)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SklWOEI0L0t4OURsTlpFeHZhMFlRYThOVzA0TmczRjZOWEs0cjVTZitWL2dh?=
 =?utf-8?B?eDJqSUVZRWNOZXdrY1diVWwzY2hzcmxNWnZkN3ZJT1Z4Wll6L2dQNUZpd3l5?=
 =?utf-8?B?V3ZNSjQ4Q1ZvcUJtMXFpM0NYTEd3QVp3U3NqbXpHeFBxbXlYa2NoNC9GOUMy?=
 =?utf-8?B?dGRud3NGaWFtQ0luOXJyOTdURXRuZG9XeGlWdlU5QUNiVTRtRlY0NFdiaWFt?=
 =?utf-8?B?VURSUGpEVTZkM1pRQnd0YUhUSm12aWplbTJiV0QwSFpVMjBwWGUwWFZRZnk0?=
 =?utf-8?B?M3RQNWtOeWNodzNMNFpQVnRzem16Z29RaDdUanNzaGl1Und2RkV2NjVmbURO?=
 =?utf-8?B?K0FVTnFieGw3RkFiUXBNVmlKaFFBaEp4bmt4VmJTYytja0dOSmg0SjFoaG1r?=
 =?utf-8?B?R1ZVd1hhcVF2Z3E2dWFIbVlwSTh2OHpqQy9rcDlGOVB2clRmd01ET3V4aTFG?=
 =?utf-8?B?VmdQNm5jUUR3MlBjaVRhRkZieGtmTGFZMWZsYVlrck10U2tCUWIwd0pxSzJX?=
 =?utf-8?B?NzVqYTAvWWx0RHNaOENNM0xzNjZ0czIvK3g0UU1mb3JGTzJONjlGYnFhR2JZ?=
 =?utf-8?B?UjhBMkxFSm5oNFhpLzFkWVBWY3BKV00yVE5KNU0yT3NLWThrZjl1NXp1VVF6?=
 =?utf-8?B?aWJodXVRajZJdWlEUjM2ZXJBeUREOTlMS1BpTXVGcGZJM29lN3VIM3IvcDZv?=
 =?utf-8?B?VkRnVXdFTkxvdlIzalNMSVZmazRIQjFMUUJHeitjWjZQeGtVUmN3QURPVThG?=
 =?utf-8?B?eXRWUFdzeERINWpSRmZjRks1QmJqcEllUGNhdTYxNkd2eHdXdDF2QWFnTHpR?=
 =?utf-8?B?RWRxKzZKRTRBeW43c004bS90eVV4Z29FaEFTeGY2WUFDYUIvaUVscDRWZW9X?=
 =?utf-8?B?a2l4bm83bTZDNkUrbm9VY3RGQUNRWVVOQkQzL0xQZTlvS0krRW9NZFFKa3o0?=
 =?utf-8?B?Qitva3QyM1hnMjl3clZ6NW5sZjV1c0tISzdnbXpxc2VCTGpiY3BYRFZYbUxw?=
 =?utf-8?B?SlFqSVNKaGZXVHRzQmNwMy80VkFOU3Q1UjNmNDRINFZub0owLzhQRE50WG9N?=
 =?utf-8?B?VktSa01SVW9EOFplcFFtd3QxTUpiR1RKdUlGOTV1c1VjOXQzWit3KzB4OGVz?=
 =?utf-8?B?eVMvNlBFa2tsMmdRSFdiNldSY3VPNUQyRzNtQzllT1Mra2hQSVhURFJPRkNi?=
 =?utf-8?B?TWJJNlBUdDVTUTJZdDRJZnhEVTJ1UDJadkIzMUVVMm1DWDVqOFpDakY3RTNj?=
 =?utf-8?B?VXhkajJOWkJXekdZSks5aFVlQmQzeUlGWHJ1SVBoWG5uci9SbnZacklmQXhK?=
 =?utf-8?B?eXUxcURuZE9zTWtUcFdmbGlnSUYrL3dmSWNYcDVVNWpIaHRSQWF2eGlzNUg5?=
 =?utf-8?B?bFcrc0N1TWZxWG9ONGpIaVhSWmJPM2x0QUM3RmxtQVp4UGFLMk16SHVkeERP?=
 =?utf-8?B?bXpybllFYURFNGdFK1Roa3dkMVhpZDkwQ3JsQzRYRGkzZk92OGNrVzdPQy9J?=
 =?utf-8?B?SVRLNU1ac3ZmQUFraUhrSGtYTDMwVTg0bVdVbmlnTnp1d0ZRK2RLeW12NWdP?=
 =?utf-8?B?Q1JJdjVaOXV0bFVMWEprODNocklZVE1jNGxRS3EwRlprYStRU3VINHZ4NEVm?=
 =?utf-8?B?QWdWOEZPNE1YdHpyRGI4WlgwNUJieEZHNmlydWtCaC9xVkZZeFJUQlhoU0ZS?=
 =?utf-8?B?ZTU0ZmMyRmw5ZXhjTVVoQUpVeHJYemFVbWlIdTg3SXRyTURObzFEZWlpK3Vu?=
 =?utf-8?B?Mkd2cGs0eG54N2NxZFBtK0xON0hhM2Q1REVxWFRUK3Mvc09oT3N0K2IycXc2?=
 =?utf-8?B?R1JGVXVKdXd4cXpOWEdRbUxJbGNua3pBS2h0RGp0OU8xNVhWTlh4LzNMU25l?=
 =?utf-8?B?MC9YSTY3YXh2YkMwdTU3UHkrd1BPZEw5NXFKYnl5VEs2dDJTQUplelZMV1FW?=
 =?utf-8?B?Vis0M2cyZjJnd2dtSmMya0FnK2JkWjZKUjRlZnBMVDF2bjA4bTV5UC9YVlk5?=
 =?utf-8?B?Si93VTJZN1Z3SXp6RnQwRjBzZDQrNmVsRlBNTWJNd3huc0srMFByYmNCbUNU?=
 =?utf-8?B?M2pHSlFKa1g0dzlIOEtOZ0l2RGZHaTJkR01pZVNzWXJrSDB5YzZUUXBWdFJ0?=
 =?utf-8?Q?7QgpJDRD1AOsdMPgR+wgGY0d7?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d54a6e38-7f32-45d4-0a22-08daf791c7f6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 07:17:52.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjLPNxWhz5GZBfDm2HE+qo1jpkXkwdl+rTLC0pbgiz6Zs8+o0O4I7xN8ctsTjm+U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9679
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-01-15 at 11:15, Heiner Kallweit wrote:
> This is in preparation of supporting write-only SDA in i2c-gpio.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v3:
> - check for adap->getsda in readbytes()
> - align warning message level for info on missing getscl/getsda
> ---
>  drivers/i2c/algos/i2c-algo-bit.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
> index fc90293af..a1b822723 100644
> --- a/drivers/i2c/algos/i2c-algo-bit.c
> +++ b/drivers/i2c/algos/i2c-algo-bit.c
> @@ -184,8 +184,9 @@ static int i2c_outb(struct i2c_adapter *i2c_adap, unsigned char c)
>  
>  	/* read ack: SDA should be pulled down by slave, or it may
>  	 * NAK (usually to report problems with the data we wrote).
> +	 * Always report ACK if SDA is write-only.
>  	 */
> -	ack = !getsda(adap);    /* ack: sda is pulled low -> success */
> +	ack = !adap->getsda || !getsda(adap);    /* ack: sda is pulled low -> success */
>  	bit_dbg(2, &i2c_adap->dev, "i2c_outb: 0x%02x %s\n", (int)c,
>  		ack ? "A" : "NA");
>  
> @@ -232,6 +233,10 @@ static int test_bus(struct i2c_adapter *i2c_adap)
>  	const char *name = i2c_adap->name;
>  	int scl, sda, ret;
>  
> +	/* Testing not possible if both pins are write-only. */
> +	if (adap->getscl == NULL && adap->getsda == NULL)
> +		return 0;

Would it not be nice to keep output-only SCL and SDA independent? With
your proposed check before doing the tests, all tests will crash when
adap->getsda is NULL, unless adap->getscl also happens to be NULL.

So, I would like to remove the above check and instead see some changes
along the lines of

-	sda = getsda(adap);
+	sda = (adap->getsda == NULL) ? 1 : getsda(adap);

(BTW, I dislike this way of writing that, and would have written
	sda = adap->getsda ? getsda(adap) : 1;
 had it not been for the preexisting code for the SCL case. Oh well.)

> +
>  	if (adap->pre_xfer) {
>  		ret = adap->pre_xfer(i2c_adap);
>  		if (ret < 0)
> @@ -420,6 +425,10 @@ static int readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
>  	unsigned char *temp = msg->buf;
>  	int count = msg->len;
>  	const unsigned flags = msg->flags;
> +	struct i2c_algo_bit_data *adap = i2c_adap->algo_data;
> +
> +	if (!adap->getsda)
> +		return -EOPNOTSUPP;
>  
>  	while (count > 0) {
>  		inval = i2c_inb(i2c_adap);
> @@ -670,8 +679,11 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
>  	if (ret < 0)
>  		return ret;
>  
> -	/* Complain if SCL can't be read */
> +	if (bit_adap->getsda == NULL)
> +		dev_warn(&adap->dev, "Not I2C compliant: can't read SDA\n");
> +
>  	if (bit_adap->getscl == NULL) {
> +		/* Complain if SCL can't be read */
>  		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
>  		dev_warn(&adap->dev, "Bus may be unreliable\n");
>  	}

And here you'd need something like this to make them independently select-able:

	if (bit_adap->getsda == NULL)
		dev_warn(&adap->dev, "Not I2C compliant: can't read SDA\n");

	if (bit_adap->getscl == NULL)
		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");

	if (bit_adap->getscl == NULL || bit_adap->getsda == NULL)
		dev_warn(&adap->dev, "Bus may be unreliable\n");

Anyway, as is, this patch is broken if getsda is NULL while getscl is not.
There is no documentation describing that limitation. It looks easier to
fix the limitation than to muddy the waters by having ifs and buts.

Cheers,
Peter
