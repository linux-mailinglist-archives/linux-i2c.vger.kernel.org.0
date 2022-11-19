Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2133B630FB6
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:25:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233833AbiKSRZZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:25:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbiKSRZY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:25:24 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2097.outbound.protection.outlook.com [40.107.21.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE99C13F8A;
        Sat, 19 Nov 2022 09:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExkS9V8vmDmzSdMnS7W+4h7pn5/YAytvoWDq4aqBZsRNn9E+7nOA5nVFLmwvm6tAtBOtZDNMy/YH7zQekJyiQnE6HIeMzDsbK1/4MJvXTJOEYsJK/mH+orC/c1wLVrRGm/6qSgvZMETJYb2THLHw8n+yOGOjmyYUEpZLmrNJlQhGRXK95sEA8+ysWXfYKWBwCX/0YfxtpkSa99EoTtAxrBnCCbmevhSghB+CeswP3kCxXAr/yFVAOdEEK4LQGyg6F1M+saZnfXwkFI/NfxlazVjdvGp90Tc4Kt1FajSWc4t4GnsAPKTn705hSMtYAABGs7pL79hQm2S5GIOOhlceCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be5gUGlOPTzUf/0oSrnycfVJED3XhRh2MtdKVYO/SYQ=;
 b=hMNE3EbzBGR2wNll4jLiv0TEwaC+HpJ01PSWIzgoxXfyTBkqsnywL17gf3b+B4gMEwF0wYKlf/5yrR8z/irszv8qKxYtKy7RpOfl4YocBWP/3FyDLC0i/cuSBAUNGYsFxVUDK0wnQ6NMtoyHv1dv+tL51fPX+VbcdaaHBTvyQb1s62rp9jXXx4j0SdAEMx0DF8i81GPM5EQFbTjLouNnG3mNW2lFz3w3pJ/acyD7Drq8t57Va8glkGPCzvk13ebNGp5VHTCmtWRI59Z1zs+AEfsoQntSrWeVF767dq353GbShGWk3JBCVHTE4an4WnoM8s5Mu8YJ7SZNa8ktRFnNvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be5gUGlOPTzUf/0oSrnycfVJED3XhRh2MtdKVYO/SYQ=;
 b=Y2Uh3i5tRXor0pvV5DkMEQqsWHuvUVwuYTgr3CaV5CHUxNTVdKCseblzbpF6F7KL5xwoFE6B1pdlsEU5ZGU23FixZqHwU7LTeGWgLRJ7jnuwSOm+HMR0D0adA52inU1lljIEtK8MFCWc1kHKRAqsK2D0TMbLHYpgVimhCQo8o7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB9650.eurprd02.prod.outlook.com (2603:10a6:20b:5a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 17:25:20 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687%6]) with mapi id 15.20.5813.022; Sat, 19 Nov 2022
 17:25:20 +0000
Message-ID: <d9250695-e2c3-c4d3-8cdc-a9a2fd71c116@axentia.se>
Date:   Sat, 19 Nov 2022 18:25:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 048/606] i2c: mux: pca954x: Convert to i2c's .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-49-uwe@kleine-koenig.org>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20221118224540.619276-49-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0117.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::32) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: d0257b4e-c79d-469d-1de9-08daca53088b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kptSF8/Hoj6rowh06KReD4higvlYdoYiFpfAJUjyUImyIgx2shHYV447jY9IDbzs4OhxoKJjr5v9wNNK4lNUZ6E21Vu6dJouLkc61cODwuWQiE9OmFFRNVZuxpyXbtrqv+9K4McwhKm/IvyCvjZcDOsrpo8Lh6EW6u22bYLLjpzdMH0qYrPiVr/f2oCa+NCLx3gMyOIDyCXc/MU4Baa4Xp70HmRpWpLY3iOygEkRQAoxuT2El+mWgMhjsRolhbWd1rMos8MTWEahPtcRRfS4LUdtzht7f+Po87r0r6Jlv6+GBKbOdieTiruR/lruuqvdoEW0HEJkTnl/+c5nfTjwx6OwYYwKDn+MPBceYPWEZ3aOtTIYAhZSjb+K2T2KrvYoUdMzoJPHLtilaBdxNwT9dbRkMgu+p4YtH8nsztZoboLjSRtFnXukkuPRH5ClMQ4vh9hcF6GILjJhuehw7tFVWDuxUnRpoCAcuno2PVdudUdWmmj+5BYP/zBPuaYP9H6+N0uq/sn1EGsCp+dy3cEOVTZMzt37MImoP9NDlKBeNe5Op7GHwzV8mkHrwUO6W4xNy5yYs2rHpr2vnm1CSjIa3yuxh5e6MmEO5HLJfDh7jbJXz/jqSNoCqSe7bdoKc5B7Ky3TKWxPzHWOoWdJNEDiQnvgb5cIW9R10MbH7AS4vHl8OxKkLWJ3lk0CPQ+Q4LFuTojtWgmNy6a3dF24MbUqEoEbUc2uSsalDnuATSW4YxpcZmnSBBjh+7HZ1k7l/In3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39830400003)(376002)(366004)(346002)(451199015)(6486002)(6506007)(66556008)(478600001)(66946007)(316002)(110136005)(36756003)(31686004)(86362001)(31696002)(2616005)(186003)(38100700002)(83380400001)(6512007)(26005)(8936002)(5660300002)(66476007)(8676002)(4326008)(41300700001)(2906002)(4001150100001)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dExLai9abDJPQ25sQ3BRdlF2dmdQNHRIbjFjam0yZkV3MzRnbWdZcDhiTkRP?=
 =?utf-8?B?U2pLaWp2RjRDV0pidkF0UDRYcUVaTmdOcitvS0tKbWxjWWtpZENPKzdGa0gy?=
 =?utf-8?B?L3gxcmdza3hIUjc1UTVlY01PWW1JYmltc25TZ2dwQlNXUEQxUVdkV3JMeGpB?=
 =?utf-8?B?NWNCVDlPUml6a0NyWk5VQ2luMWRJRFJRc1d6QlFnUGdaS2xNVnRubEdCZVVH?=
 =?utf-8?B?ZEJndHRXOTdJajlVd0FrcW5FZnZjL2tpSGJHcVA1OXlLOWVsODhYS0tyZ2hV?=
 =?utf-8?B?emNxbWIvNGdDUThUYTBIL0t4eEI2dG1tSisranJlcnpWMFAxY0NBQ093Vmdi?=
 =?utf-8?B?UGZ5Z01ydkhkVWxmVy9sNTM4Z3VLTGZpMzdqSUpNU0xLQkl3YnpZZTA0YlNI?=
 =?utf-8?B?ekFWWkViR2NYYUlQUEtLeklCcUMvUk4xWEx5N2g1MDVNMUhXUUVjTmZvYStB?=
 =?utf-8?B?NkVGRDhxeFg4QStUeThVVllsN1VsU3Y0QmpMQTNwRGZjK0lwVktSVkdQcVdx?=
 =?utf-8?B?TGh5VmI1VEd3d2FxUVZOallLOVVFMkFxaXFMWUhUbENXVXI3ZGExZTNlbm5E?=
 =?utf-8?B?a2dMc3BRUFZzWTN3UFRlUFJDc0tvMzJ6V2FQQ0hEcVpaeFprNGljaHNYV3BB?=
 =?utf-8?B?a05GSmxiK0VJSXRHVytMZDZ2ODlkVktrSVB5ZTRCbkVlL3ZheUVONXl0Ky9n?=
 =?utf-8?B?TTNqSnZ3emFEaWh3aE5nRXc1TlFvMWNSV3B4bW8xcHdFM2N6RUt2c1lveVJs?=
 =?utf-8?B?WTIxSzZoT0NRMGRjWnhDT2xBSjFnQTRWVzB5RVE2aDYwaldQNENYd2R1Y0FG?=
 =?utf-8?B?bGVtQnI2RjFncitENVJyWS9uSEYzbUdxLzlnVk9MclBORWFzdGhLb0lJQVRv?=
 =?utf-8?B?T1l0b1VDQkowS1Y0YTV2V2l4MmN3eWs0Q1o1Mk8yTVpiaERmMmRZang3RTNU?=
 =?utf-8?B?SkJ5cEgzbEtlU2RtNXRoZklBMllrSmdENEVZcng5aWI5R2lpdFkrQitjSjdS?=
 =?utf-8?B?YXJoWTNlMHhyMVQyWmdMRFU0N2NIRmZxd05aMzcrWjUrYXJYblNWUTRBUllO?=
 =?utf-8?B?alN4VnFYb3RDczAvZFFLdysvQzBRa3V0a0t6QWVsR2RmUVYvbkV3WG5CMVdO?=
 =?utf-8?B?bEZVaTFQUlh0dVIrZXVvNTB0ZGcybFBpdFJjVkJQOE8rVWVKb1JkRkVVYVQ3?=
 =?utf-8?B?eTVTeVZtM0pLeWRZaXVlMEFEcTBFWXNzQjFuYjI1TFMyTlJhSnI3YWFHS2xE?=
 =?utf-8?B?b3lWb082c2QyS2p2UnBqSjdlOEpycjRmK2RZWi9aa3dieTJKeWJ0N21nYmoy?=
 =?utf-8?B?SkpqakJEZ2UrdEM3OU9Ycm1PTHZKWVpTdG14TEI3em9MRi9PWHAvVGUrZlF4?=
 =?utf-8?B?RlhhaHM5MGNCdFIxQmpJbExiaDVpVTNLeFB4OFFCeGtXZ0YvWGZOZ2RsYkNs?=
 =?utf-8?B?dDBvU0xCbW1nUTdDT0dJN0pTK3lVVDhiREJobTVUaTRUUlkwaG9td0dYWGNj?=
 =?utf-8?B?SzZXTzFwcG8xTVVXK29kczRnVHBiMmxUYjhGeWN4MGNnWkhVMWwwL043OHl4?=
 =?utf-8?B?bGFrUTRGZ24rcUVydCs4VnEwMXpOMURmcVpmQUlUcHIrdlY2Q2V6S1IxVTVI?=
 =?utf-8?B?SktsamZwTzZBNElKVzY5eW1yKzNnRW45KzQzRlBRNmpUSjhISGlzU0RjSEdR?=
 =?utf-8?B?RnVqYVlwdktKNGIyaCs3T2tTRERJN1BDUldaZ1V5MklpNjJCak9mTnRoNXRE?=
 =?utf-8?B?SllYcVlPa1JEZHJVSWpVdmVNZ1FQSUlGbGcyaVNaRGl2LzVHUzZYSVcvY3Ew?=
 =?utf-8?B?R1JjbmZEbjg1Z1JmNjlyV3ZoUFIzdSt5Ym4wQlRLVk5DSXRmdUVqSHRpanBQ?=
 =?utf-8?B?QTF3VVZ1TTYrdXJqbHJMOThxUWk1WkN3Y2orWE1qMkNOWStXc3NQcm1NQk5o?=
 =?utf-8?B?OWxlLy9DN09hRG8za1FoK2h1N3ZUdm9pZW9YNU83RlF3Qk9lbGFSb0JZWGw1?=
 =?utf-8?B?UTRpbUZZdDQzWEMrN3R1bDdoa0NHMGN2WmlCN0R1b1B5MzhnZHFBZVB4dDZx?=
 =?utf-8?B?WWkzN3pUMCtQSTNtMFhWa3NzQzFrYjVlNjh0c1NpaW5uR0VOMXk0OEozMGFU?=
 =?utf-8?Q?RM7bB3dAOvfS0wCaxJAfmnUja?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d0257b4e-c79d-469d-1de9-08daca53088b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 17:25:20.2496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhK8GznPnQrVXWCLUSsVPsR87WBqFYUDdgyxiwqf0iUJFFGBTWDbO7OoVeoH9iKt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9650
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2022-11-18 at 23:36, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Peter Rosin <peda@axentia.se>

> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index a5f458b635df..3639e6d7304c 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -411,9 +411,9 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>  /*
>   * I2C init/probing/exit functions
>   */
> -static int pca954x_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int pca954x_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	struct i2c_adapter *adap = client->adapter;
>  	struct device *dev = &client->dev;
>  	struct gpio_desc *gpio;
> @@ -554,7 +554,7 @@ static struct i2c_driver pca954x_driver = {
>  		.pm	= &pca954x_pm,
>  		.of_match_table = pca954x_of_match,
>  	},
> -	.probe		= pca954x_probe,
> +	.probe_new	= pca954x_probe,
>  	.remove		= pca954x_remove,
>  	.id_table	= pca954x_id,
>  };
