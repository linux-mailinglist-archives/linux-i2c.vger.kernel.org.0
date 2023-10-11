Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D942E7C5791
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 16:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbjJKO5U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 10:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbjJKO5T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 10:57:19 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2117.outbound.protection.outlook.com [40.107.22.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CE190;
        Wed, 11 Oct 2023 07:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1DYON/IlSGaB/fj0njYQiUVQLI5NFEjg38wjoqv4mflKhyVdBBolccO0iOFkkf3g0fO973HohIXbDjzGwYQ+1MCGqaM4nPOwn/ZobX2piCR+YiCY5rm3EOQKXX8eSAmu+OuHDma0dDguL37xNv06Fj9+Nh6EQ1cc8CV8XlO7rOtI1Im7HLzFhk2Yd7U+NbfJuGy09bjCPFqiGFIOmRVuNq6atDpwF6w6es9ndlYjmbxr5MHCa/dxgCqTpS3l1BbvILXgNy19elI6lw+Ne9UdwWPdu8JHyT/eMB3xlHk6RIPMA6U+PpmqTGjHgql6Mpv/GFqPDD9LMYgqnA2Q9NCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5P7vR+HPy1/Dxtr/pev5YqJpI3Q2p2pSkQOvRAWc14=;
 b=WjzLmD9WtrIoFJ/SSfhlgI7kgSVYgAVtXxzhxsm+tUzmIVwllovTQnrt9XcNxe8lOkz41d4lprvow65gFhB9pFpadfygEhX87GosY4JF9YTzKzoBZCDV7cpTT3lqffIP1sU64hmUTEMNlc6MmuurkU46oLUNKGCfqJ6PfRYwUDEvGDKe75ZAsuHu/UzcUyB8AnN2pg6Jrv/5ouqyLbTl1JVnrAie7T0Qq22B04f+TYa7OeaqyhX2ykT2OsExxXv9MZc7Vu72RXDg0p079SOTMKWiM8+WQEbJKt7J6Ix9rpFChEA8bT6YxZTtRK3IFRCBDuDKRpn2WEBwF6J5fUhe/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5P7vR+HPy1/Dxtr/pev5YqJpI3Q2p2pSkQOvRAWc14=;
 b=PM2sDrdPgatVggRwPlko9oijwbCmcGhb5cEZcTLckB1fEcyAoqn2WQK4kDvYvcOhIA7+1Rod/udvHnU+CmrkvqgfstcQsjIxGgG1Tt/rm1PuQs1SMUoMbojLNj9nyNrV047V5vTnHYEiqYeWiMthGBHy8yauwjEXePrt/17pTSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS2PR02MB8913.eurprd02.prod.outlook.com (2603:10a6:20b:544::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Wed, 11 Oct
 2023 14:57:14 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 14:57:14 +0000
Message-ID: <f84ddb1b-58ea-7cc4-0cad-efaefeb98685@axentia.se>
Date:   Wed, 11 Oct 2023 16:57:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] gpiolib: provide gpio_device_to_device()
Content-Language: sv-SE
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20231011130204.52265-1-brgl@bgdev.pl>
 <20231011130204.52265-2-brgl@bgdev.pl>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20231011130204.52265-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::6) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS2PR02MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: e4410faa-d53e-4460-f7fb-08dbca6a5ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sEQuKHm1m1VlfeHZluN/lwupD49ZuubMNXBf8XhPp6FK+3/hrPdl7eX7cTRSd5X6kUuLLzwT9U1lWJBscsrupPbovnV/uDz/Npx4XJFwfHowNpbc1ZLmgMcxUoty9sCfGCQsEMVCl9BoQGHH9qjXchAzXJyrkwYMotqCN0nLCfh89PQWM53sHQsOe28MBJ1MnXrcDbMUnkNGhdE8yQ5Bt82gYp3wAGqkj7G5GUH1g0LFXKWHlog7JS8hEVxQLClhQVyEDU1QwszV6K3UrZ7yAhKp3F2FaKYTrHHlNbQ3EOLrV/AqJyxocdF55zezK4+nmjcl4eJlrfpQRjrMMBBWVkAxDkHNg/1QNjOh3mttBjka21gEc5azXfMdh+2cnE9C7UFnffpAv/+NuIMaZIUqUfYR70kwIeEuSKpdOF2OkK+EYTjj83ISeweUcgx7GEr/K7kO4W514wJ9nEmMT6qKWerawsq7fSz/l8lhPL7CGxVOPRjtCWq12fe+zsvo5R/757Fk8mNZ06w4QGBx1kTMISLiy3mQRiqjfX4oC9JEeZbDO2susqAVBJg0NxW/KLYyj5YIQZGE+sdsulcsV/T77BV52pCPp0aehfIAIipJB84OsP5TDJAUDNhzn3HkgQmh0QZb0siLM+qqTJrUCy1oIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(316002)(26005)(2616005)(66556008)(66476007)(110136005)(5660300002)(4326008)(41300700001)(4744005)(478600001)(6512007)(4001150100001)(6486002)(8936002)(8676002)(6506007)(36756003)(38100700002)(86362001)(31696002)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzMwZ1pLNlBEYnVkZ2lJMmUzcW92dEplNE85aUM3VmNkZnVSR1NmQk91M0lx?=
 =?utf-8?B?TWVqVVBLWUpTOFAwZmkvcmhGT1FKWmJqSDlPRDhnNjhseTFJNWZjWTlnaUtr?=
 =?utf-8?B?UlEyUmhjVVFKb2lhL2hPVFBMcnBOTkVhZERQQ3JpZ0FVTnN5NGw3aFFadWh2?=
 =?utf-8?B?SU9nMmpTVVpNTHRQRjVkcWd3bHBTMDlONExkbjR1WU5HVDdUL2EvOFFhN3JQ?=
 =?utf-8?B?YUF3SW1KVmFKSjZEUUFoT0wxeTF3MTRZbUlkVElBTURDWjYxems2TE00MW4r?=
 =?utf-8?B?WU5vNytKNCt6cUpRUFR6SEgveStmZkJicE43RWdsZkh2d3BtZTZNUzR3NHpD?=
 =?utf-8?B?MGpOVkVJc1RscnlKNlBLbE1vRVZiOWZ5NzZzbW9hL29YcXBIYTlpMFAzZ2Rp?=
 =?utf-8?B?aFR1NTJVWUQ2M2pyaFhmU3F0NjYyMTBGT2VrRytyVFlqODcySnVDVXV2b2Z3?=
 =?utf-8?B?ZG04Z3oxbk5zYXVDcVBhUTlpZ2EyMjlxaSthdTZRT2FxUjRhS0VaVFBxeE96?=
 =?utf-8?B?K1U2UWVNbVFRcEtjWWdDOXoxKzlMUzVhVDJKQi93TDJwVHFrZUs2UmgwVHp4?=
 =?utf-8?B?SHlPaC9ORzdVNjRDNGE0UG9JSTRwVjc1NEp2NDNPellPWlNJMnV0aTAwMEts?=
 =?utf-8?B?bk5YSXR6aHh2cGFGNURadk94emRGL2tCWk1VbkJNRWtPNW9uWExiUHNkaE9B?=
 =?utf-8?B?ZzdlWm9ySW1BbEkwRU5IaTNGRGprMkhYRlRYMTNYTUw2YndkTnNtZTBMNkdQ?=
 =?utf-8?B?b3c4azlDZ1JDclFTNXJVTEdxT3h5SWJtdUpnc1BtV1FsNGpZbEtCMlB4N1Nz?=
 =?utf-8?B?SUZtQkJWU1QyZlBlaGt2d2FDdWxIejFuQTIzV1g1UUJROE1HR1gvbWZWUHlW?=
 =?utf-8?B?ZEFFM0kxUEMwdHR5OWZXQTJDNDV5MWpvVGlObFF2elJPeTVZaXNMa25KUHpL?=
 =?utf-8?B?SG16VlZlMjUwTTYrY3VUN1plTXJpMzV0VlJNZmxmWjhUNEpzWHB4aEJIam04?=
 =?utf-8?B?SlgwekJCRFNxVExLdVlZZHBWRFlnN3h1eU8xTlRTTkZXTlk4eitQME9JVjdV?=
 =?utf-8?B?UG0vajFGWFRBbzJqYzlvc0tsTEpIV1dKUGRQTnhOQkdoQWhnd09KNUNoT1hM?=
 =?utf-8?B?bkZuYVZIeUxPWktmTXBmaEx6ODRwbDdlREQ1THpqbll2UzZVOGJJS0ZtRUFj?=
 =?utf-8?B?VitOV3c1R2w4RTZ3NEsxUzlTZUhrMVJDbG5JYm9Ocy9jUk5LbWJVUHhUbG4y?=
 =?utf-8?B?VXB4NkdpWFB6dGx0NHB2OTVMV1k1M3ZqUUd4YUxNUXdBczdEUWhDU085VnlE?=
 =?utf-8?B?TDNSZTJwd2JudGNaazFFaWptakJJeHA2V01GL1h4eUhzalFtY3prUDZiRDZQ?=
 =?utf-8?B?RVJyMndYM0JTWVZZK0pqWWlMYU1MRklpU2Z3NUZoMkJEMUhpRGpJdUJBbkFQ?=
 =?utf-8?B?eVROYkM4ZXhuTTNOSFZ3bHI5ODBadHcrSmhuTHhLKy9CL01zMzNwUkJzREEz?=
 =?utf-8?B?Y0NTL2RSNTNFbjhYcnFZVFNMWTZVZDBXcy9IZXdQRklYNlZFMjBTYXB3eDhT?=
 =?utf-8?B?dkhaelFNQTFRbmxCN1VVM0pkK3NCSEQ4V0tUeVZRM1pFL1RnYnhkNnRXQ0ZO?=
 =?utf-8?B?NG5kL2NCUUY5MUtzc1Q0UXVLZzVwdlc0V0lONHJ6LzlDWFU3cjl2OXlNM0w5?=
 =?utf-8?B?M3FRZWhSbzA5Qm11RFpueUxvdWhOdC9tYjR4d3BpQlNVc09FMU5TbHZUem9X?=
 =?utf-8?B?ZnFVdDN0eU1ORDZqQlVHaDlnKzlzd1VzWnJNOWZvaUxzVWFmVThsYTBUam05?=
 =?utf-8?B?ZjVhTjFmdm1SVHNubkFJemJDSUV0OGFodnBWRVJoNHBqbTBCRThMcVVuS0F1?=
 =?utf-8?B?aVkwRUFFRHF3TVFMUzBZc0JLUVFCcG9Pc2Z6MnhHZ0VsUjlhM2FYbzFYVVBy?=
 =?utf-8?B?QWNaUkliVXZaRUVZdGZMZ2k2QndyYkRMMEpsZm0zRFVhcDE0b1N4Q2Z4YkNz?=
 =?utf-8?B?TDZqUHhZc3FmL1ZKQStjamNnRmVROE9hc0ZlWWhPc0NXbkNMNWczK3FDeXhN?=
 =?utf-8?B?aWx5MUFKZURrSnhqVWhDVEVHWkJTZHR0Z1pSNjdWVStzUGRzM2hzTjl0Wi92?=
 =?utf-8?Q?yFlISO5mMsFANB4PQDfioCu1T?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e4410faa-d53e-4460-f7fb-08dbca6a5ade
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 14:57:14.4488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZ1zg7kBHlQmiDDNCmfZoh3ybqVYDGxBaev4Kkj8sadIJHfHyKFVEfHecmPRLrxT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB8913
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-10-11 at 15:02, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There are users in the kernel who need to retrieve the address of the
> struct device backing the GPIO device. Currently they needlessly poke in
> the internals of GPIOLIB. Add a dedicated getter function.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
