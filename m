Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9251478F486
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 23:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347524AbjHaVYr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 17:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347517AbjHaVYr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 17:24:47 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2112.outbound.protection.outlook.com [40.107.21.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78304B8
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 14:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jANyuoEtggnAW/Ux0giepgqgF69VtYdS17WYq34ghJQc3lBrsTKExbb6RCHz0Rhxwpw4Jz7JedQRK21Hm0aPRbdgUORPJSvN9al84tvUpsTHc7zT1lXfBzOw8s6aQ6h1LIiTLSFVFzS3ziRbEKZliUPlBJtUw7FROdhZUgS6CxxvFJP9X72qhTJuaFOZv5bmes9gSxBBflxtZAnWlSRrsQBd8F0nJRWxnShIeV5bmKJJItbY4JhD+aR08GwtWF8cofhKe6ED5ctV35DxKGkgDe958L3LcPeC6H2karO3GkIwKzk2rfd6jWd3BwJwNgUjuK3hSgehtxWpxOruayBcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxRrFuNEb5dQiWT4jvydYwGepdHODQn+TTyCViSejqk=;
 b=fkJeMfbIBQ/dScCR0CEAyjPKEJ1KAXV3r6JQwWIrJ2GX7ffWJ4xkczJScDGSuYzqJjSUuSkg1CxLbOhVViJp36AvuDwkMhRZsyBh6HFlFdCYmYtUTPhYVAPCTMSFs17+v9eS2f4tBS1Ht5MH2/gVIRy6Jf9ccdkVwrcFozDpKhBQaMzwPa/ftw2JKoZacmhrR6Gxj8/nZEvZTi5qF6INp6DF6REawXrGHEru/z0HSvNuoPswGQlBeVzeJ3P9Vl4XF6z9Iw7YKfVxtg0N/Dogn5nzH9rSkWwnd2DS2g/oq2mqXkydnOG3S2h1oVRtGbTEnFt/rKBsMZuLaOMD6jqrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxRrFuNEb5dQiWT4jvydYwGepdHODQn+TTyCViSejqk=;
 b=acl4NQPzMKGNPvPEOtNPsKSYEVmG48rcS1gLeA6v1g+3JGo8GSA5XgOoWX6G8MFPS/X3GimHjajCAio95dpch0d7+9aXDAI8zdwxBT/J1qkjroVKdnpzbf2Ggpw/4Vkx2KU5DbP3zcps8zlurVUKHdbwKC0xJFBL3DWacwBt9m8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM0PR02MB5924.eurprd02.prod.outlook.com (2603:10a6:208:17e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Thu, 31 Aug
 2023 21:24:40 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 21:24:40 +0000
Message-ID: <0d768c94-604e-7fa3-21b4-65598e30edf4@axentia.se>
Date:   Thu, 31 Aug 2023 23:24:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] i2c: mux: pca954x: Make sure the mux remains
 configured the same as before resume
Content-Language: sv-SE, en-US
To:     Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>
References: <20230831181753.154787-1-marex@denx.de>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230831181753.154787-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::12) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AM0PR02MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 6196009b-6a13-4691-e239-08dbaa68afc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5fr0SyFk1TDKA3O4cb7mOFykXD1VY6BbvHcxgVBWweEaPruJdqUNFZ/+rkkm1jb9Z/EZSpjoBsEelcAyBhW8g3khtXb3V82Keu+/urVO728vv9XNwUBJuLkz5b3bFj1D2R/4win29CdLvFAOv2owerdDwDr6/IiIoC2thGh7dO90lKIN6s6L4jaPN5RZmNvgNBXSV2TeCe6va/AioqKLfXbBNBuuxEWtDuOk43BozLMwU6pZnAiBJqvc03xiltczGvMQgsYDunVtpwszfQfUMxsClVh9auJwyr9beM5oR246pPJhEs+FHpdJ+kVgLqvaTf4yJWG+k1DSSiC4OiBxamv5X49B7GgkHW7BOQzBYVc5FtHUqp7PlQV8dVjEVuPaK87G6PkkGRP2HF5hmsgbUSCetQpEEcNVJ/9qp8fzvxEa99IbEr7WEqzIZDJnYjbxd+/4He6xq9VWe6v2qkdgkLqU+ylkUOpZfi1J+q0Z5N+qdr8/6Ny3k8v4WhvYP7bIQEtmROi8AeRsomXoI2sD8wqU6ez8qvpsByjn8P8dOqI87jbY/SlWumTYYUt0j1N0tkqsmCvNVlefoy8XUlodiLBhQAVlMl9AIRIKv8MYbayrZGyWrS8I13cspRC6WyGybSbuHJHNbJFRa6X2hSLj1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(136003)(396003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(8676002)(478600001)(66946007)(6506007)(6486002)(6512007)(26005)(2616005)(66476007)(2906002)(36756003)(83380400001)(66556008)(8936002)(41300700001)(4326008)(316002)(5660300002)(86362001)(38100700002)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTFVVHN6Rmc0dFJ2R1pPK05nazZaWWxFWjZyM1g3Sk1pN04wbnRQTDFRc0ZH?=
 =?utf-8?B?WkcyWjdrcmFramcyMTFwYkQ1K1lNYkowaXRzTFNmRjVRYlhYSDZ3cld1UE9q?=
 =?utf-8?B?Q0V3dkdMUkVZUFJaYnU1T0FkL2NyMk56OGpVWkZMdWN1NVhMeFZlY013ajUx?=
 =?utf-8?B?MEJ4UkczbktoQjlDa0o4ZTByMjFDMzVWVEV2QzJaWHR2cklBNXliVzFKeE5r?=
 =?utf-8?B?VHFsU2tHaTlzd0ppSXNsZWNyd2dvaitqS1JKS1ZEQ1ZiQ1huMnU4OXhGc1F2?=
 =?utf-8?B?d2ZaSDBOWWNxN3U3dHFIb09VRFRVa25YSWpOMFJUblVZNHVybkluaFdFazF1?=
 =?utf-8?B?T2dLYTRtRFRsblZJWk4rd0lKVzRwRU9wd1V5cDFkZTBQZkFGeUdTM3lzTUtt?=
 =?utf-8?B?TzFmbUJDbEd4N3BrZXZrVi96WDVIYWk5SFZwRlYyUnB2ckxkWnQvK3cvZThM?=
 =?utf-8?B?a2ZnbTljdG5YUWUwWFl2YjBXOC82UGlIYVg5TS8yekRjaXJjenhuay9keGRp?=
 =?utf-8?B?cnhubmQ5VldtdDhzK3ZkekViaVJUS21JU25YMFlHWEpUVFVXUzlXSThkQzVR?=
 =?utf-8?B?aEgzNmxGWHp4SUhlOTRKa0hhY0hEbE9TcDN5dkZQS0pwd0NmR1BZUWNycWFD?=
 =?utf-8?B?OEVhZXJ5Y2oycytTUFAxMm5ZYjZqcnZYWitYb1FReDBXM3hDUjFLWG44YjN0?=
 =?utf-8?B?bmlKSFFwWGg5TWxvNDkxVDdBZUdPWHdBZnVVRUtoNlRIa1lSdGJHbjZqemZh?=
 =?utf-8?B?Njc0ak5ESDFvSFFzcjFOYVIwSTluUjExM2xrdEZGWldCUHlkT290TWF5Tmpa?=
 =?utf-8?B?aWhuNUZjRVl0WlAvendadStKZ2Znb0o1YU9CTHpjaTRIdU9yNmlJT2JIdTNS?=
 =?utf-8?B?R0w2aUViaVVRUmdWOWNwR2dNOUpNUTVYZmVHUDNwdlRpUk9DdC9EWjFBYnp1?=
 =?utf-8?B?c3JackdvYnVjNUQyWGI3a3ZFakg1Vys4NXEvMDNSeGIzUEZIWW53bStQYWZN?=
 =?utf-8?B?SmtZaTFkT0R0eEVIbTdDOFcvRzNNZXQzbXhOTDFOZnpHWUtGZWtyZ0pHQUlo?=
 =?utf-8?B?ZzFjenl0K1dOdkZKcHFMQ0lPZTYrOGk3bjRtUnQwajArWURMZnlDUkRpWU95?=
 =?utf-8?B?Uk1ZSm82REJGSE8zTmtEbVFUZVE5THRYK3UxNGgxLysyZDdFQlB4UVdsbUdZ?=
 =?utf-8?B?MzJKTUVSY3lFT0djcVZuUkU0ZTBsUUVkdW84NVdsVGRjUXB3Y21sZTRkaHJD?=
 =?utf-8?B?TktpcDlnK0YvbGdkSWNWWGtvN1NqRXFnbVp0ZjdDcjZrWlErMXlKakowV3oy?=
 =?utf-8?B?bkpvcHNTeVlMOXgra0ZsTFFlempZRk5xU1BzM2JKM1JHZXFwUER5K0xKdnZU?=
 =?utf-8?B?bE44S3UrRE9LMTRyaTQzUW83K1JTS1YyRGlRTWQ3T0xNQWxPZlRwcHk4VUk3?=
 =?utf-8?B?MS85TG5uZGpxTU5GZDJTTGhML2F3U3IrbmRVeHhzL2NwY0cvQ3dhc0NnUjdS?=
 =?utf-8?B?QU1kOENKT0JoZ2JjSUY5OFEzOWgwdUJYcjQ4T0RuNnd6V2RXTGdQcHF5d1ZS?=
 =?utf-8?B?c0NCYWpzSkI3eEx0SW5EbktHbkdlRUFVUVhmY3ZONGVpR2k3UGtpTTBRUC9a?=
 =?utf-8?B?M3JjbnMvcEFRTmZTRVNoR21tWTl0eHpSR0c0bFp4bi8wa1RQZ3FLdzdxVm5C?=
 =?utf-8?B?RU1Mek0rQ1g4bXlTNEhzOG40QW84blQyR2ZQSFIyYkoyY3REUjZqaTAvT0th?=
 =?utf-8?B?OHcvK2FWTXpoWFpieno5RTA0TDViS011MG92NmdBZkV3WWVOZnFZcitmTjJB?=
 =?utf-8?B?NU9LTXFtUUdNQmlZYmdQZTZFTHlXK0poZUlzMnp4T1BhbVRBa1pCcmhlY255?=
 =?utf-8?B?b1Nxdmo1NmhsYXdSN1ZUZWU4S0hTQVpHZks4Wm9kcXZSaE1tYkFzOUt5YjB5?=
 =?utf-8?B?L1FUSzZuVG9qTjZUaWNBMXlyeXlaYVRncnh6QkJUK2JtWk9SMFJIZGtsaFhL?=
 =?utf-8?B?OGViTFpXSDVRbjJ4TXBzemlLOEkyem5xRlMxa1BidmlFclNRRDdVQTJ6dE4y?=
 =?utf-8?B?K1N1UEpBMTByMU4rRW9ydUVYSThkNmRlcEdjeWVtWkR5UytPS0F3OFhTc2N5?=
 =?utf-8?Q?6YrGJTIb5lBjP4Zk7JZb5Grfc?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6196009b-6a13-4691-e239-08dbaa68afc3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 21:24:40.6600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xxa72uVxEUAZTJxE0tTl08qiHU2BOG+xIa55e9eISRqyrUhVZQo25HSlsLV81oPe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5924
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-08-31 at 20:17, Marek Vasut wrote:
> The current implementation of pca954x_init() rewrites content of data->last_chan
> which is then populated into the mux select register. Skip this part, so that the
> mux is populated with content of data->last_chan as it was set before suspend.
> This way, the mux state is retained across suspend/resume cycle.

I fail to see in what situation this change makes a significant
difference? For me, it's a nice conservative thing to initialize
to the default state after something comparatively heavy such as
a suspend/resume cycle. If there is a significant difference,
then maybe it's not the usual access patterns after resume since
there are probably other chips initializing as well, in which
case this change might make things worse depending on what
devices you do have and what idle-state you have configured.

> Fixes: e65e228eb096 ("i2c: mux: pca954x: support property idle-state")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-i2c@vger.kernel.org
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 2219062104fbc..97cf475dde0f4 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -620,9 +620,9 @@ static int pca954x_resume(struct device *dev)
>  	struct pca954x *data = i2c_mux_priv(muxc);
>  	int ret;
>  
> -	ret = pca954x_init(client, data);
> +	ret = i2c_smbus_write_byte(client, data->last_chan);
>  	if (ret < 0)
> -		dev_err(&client->dev, "failed to verify mux presence\n");
> +		dev_err(&client->dev, "failed to restore mux state\n");

data->last_chan is no longer cleared in case the write fails. Is that a
problem?

Cheers,
Peter

>  
>  	return ret;
>  }
