Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7CB6FBF09
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 08:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbjEIGJy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 02:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjEIGJx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 02:09:53 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2109.outbound.protection.outlook.com [40.107.15.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A7E83E5
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 23:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oG0cNcMNrAYsaUrTRY3UlpF7vAMnyRhc4mqIKJUwMyLxOusHomlW1X05bjqr9BdgwJHCwI9CQkNtPsoTarwHxjPoR5HAkq8kQ6wsADTVFLuU8dlOQa4neGVv/2Tu72j7nDHksu4E0YU81AX83yvGUR/aoP80WLp9PIV1tXpH0sg7rF6jTJl9Ica25HiidNXlv4YV8XNBpB2e4QpYQmy+6L/UPdUdp7hfwNYfffJiF/omCT641p1fYUNyDkotB4sb3zgi9cuu3iJf7K3IXxG2lg1fuQ/OFNxDkBechU/08QU8h8aTPRDnVcbJUHLWWAL+CObRgNHcY0reemgF+0u1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=mHRVANAMFBaMzdt9XlgWzCrWRFCgNJwbDE2Xbovg67foxshE6FaMwx8Cox9p+VqqABF4vKVK7cnwg8K40iEfouLfHN4ps5Aj+AjX3gSWghyy2bWJumErA4WFsU9lNUvCqJthrYomeApz2SQierLaAAtwKmAJmFkn3LIhg4hohzNF+0SkyShPHfqXYmaNLJRJ0K6SeSIZVUk3xNsP56LTr0x0Poy4Q+rGBZL7QRWDXHt/aoGspjt8kkpN4IA7wDajUGSqHYcBNbsl74t4VYTTaDvlOnfRWe9uEwFETghtcLy8HG+BY9utxlojPixSapf/naMvfJE/1lSd1DM+GF778Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=jxcBAGDfZkH2E+CAiAoV3n+kk2vmkLwSu517y32p3Ip4DYIt0GmMOkGdzyUTXZk5PW/A0YSXzBqrp3MkjGkRYp4Z4S/yfjoPpJ1Pwlcw6sYJSf4QCSOS9ur98qAc9E6p/kdbI18409JyPZXSYXb2X1oRPKxe4eWbFlZxhAjm5t4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB6936.eurprd02.prod.outlook.com (2603:10a6:20b:2e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:09:48 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa%5]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 06:09:48 +0000
Message-ID: <17001257-7f8b-330c-69de-046d23530de2@axentia.se>
Date:   Tue, 9 May 2023 08:09:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 83/89] i2c: mux: arb-gpio-challenge: Convert to platform
 remove callback returning void
Content-Language: sv-SE
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-84-u.kleine-koenig@pengutronix.de>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230508205306.1474415-84-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVYP280CA0025.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::20) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e123ba2-8dc7-4e87-843d-08db5053fdf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VveSqwO7YP45qCuGP/QpfjTPNFrcN6Mfe7wRatXyTJJjBB8L6+D/AT9hb5uftTTSrcca/4NaNnajqzD/xC9N6vuNQhaccJ+bI9BfVi4l9nq/nPkGEilZV+Zs70v9vo3idxLaRnepaU2of+LXzODRZjQ1hYWClNHGbb8/crc/UwVStw2IKBDgb0T8Kc3oHXr5jPZqZZBMFR6SHpwnROpXVotthSl5O7jQzD8ohNFgrwX8hroZFUSxYsgFvEd7hHVZl9AmnmK3LSRCFM3N8/FMM/iYLclEJ7318Ty8qFJ7p6ua/XAYIVG2RQUvyZm4sEyl5mZfOAjd5fNvKshp7yyNnXH1nN2/2nyu38nKRmHfPgkke/rWoAHiaxQciSJQpSE8pQnEueq+aDc252CysTpFsBuj2YPMViDn39dD7/xdPqBjhn6Qz0zMECffa12BgP335k35CNGAZE9ji5pYeAjJbG79i0SpjJ2+YnG8m3cxNVQYksnw5P/sKClGK5dHlRInwSk/u9w8/YrEw3CxhRow5RAtwKPTe0FrHvw+wgn3UHdBFl+d/Q67oWAvRDQ2pskeNDNC1su3NNpvfy77PSvc9HzNjwlPWmPk8xh0xOnnRtvghd/3BJg9H7MG5In2Ku6F5mdzNo/3ir0nKL1OEwKMdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39840400004)(376002)(366004)(346002)(396003)(136003)(451199021)(6506007)(26005)(6512007)(186003)(4744005)(2906002)(38100700002)(2616005)(36756003)(31686004)(31696002)(6486002)(8936002)(8676002)(4326008)(478600001)(66476007)(41300700001)(66556008)(6666004)(66946007)(316002)(5660300002)(86362001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWJ2cHBvclRBNGc4YVE5SVlXZHJDeVFlbC9QMm50OG1oTkRtUXUyT2FwdldX?=
 =?utf-8?B?ZkdCbTFyVDZIc3VtOVpVcFN4b1BkRDBmN3FjamxCZThqOVIvQmQ2b3dnbGtT?=
 =?utf-8?B?aGV2VFcyWGN6UUpIMXBnZk1WTmFrbFBsSG5lZm1lNkd5OVRxT3JuSkozaDd2?=
 =?utf-8?B?dHY1a3NabjRieFU3aHBMNGFOUkNOOE1yMWVCYTJyTnpWcUNRNjZKY094Q0gx?=
 =?utf-8?B?bTRFUHg0UUNmb2kvSG90MGNndy9MREozY1dkOFNQandHWmx0WlY2bjFrSk5D?=
 =?utf-8?B?VU0yTlJVeVF5ZUFrVUdIdUJvVEdqbGRLRVhURk01MHpnTGZEc2xKZXJaSWN0?=
 =?utf-8?B?dzBRM2VFRjhhaGZ5S2lQMXQ4L2U4VXQ0a1pDZ2VrZjRRK1djcnhUVlpMYzlx?=
 =?utf-8?B?WEdnZzZnMW5SZDJTaUtaYXV1UHdpTkNGQ0hiREJwK1V6UXRGYk5GNExxVUI2?=
 =?utf-8?B?TXZmbUdMTkc5ZzM3MDN3MUNHS0tEVUMrR09kYlhreC9pNWN3dkpyeUUxamJo?=
 =?utf-8?B?ejBmZDJxTmU3WFNlVURJSWZ3dEFBM3JLMGRmMHFZQlVqZVRpRytUMXlDUWlq?=
 =?utf-8?B?SHhyMzcwKzJBMUJ1ZW5CQ2dtNEVvYkhLcDUzMUcrSGk2SXduVUhKRFVGWmtX?=
 =?utf-8?B?QU9YOHVGaGVhd0RaNmJlNVJVcDhrZ2hRbHZMMnNTQ2UzNHkxbTJMN01icVJ4?=
 =?utf-8?B?MjdBb0RSb3FKNjZOUlEyK0wrejc3U01LRHJKcWNWWW9hRVFwMUVJQlNlcncy?=
 =?utf-8?B?M1BnMFVUclFzZElqaFRPTStBcXkyMGo5UTRzMUhMNkhKamxXL3p1OVFkWVRR?=
 =?utf-8?B?V1htWVNwcWdINHpJYU9jUHpQdlhsdWpEdk0zKzA1bWpDSmlhQUJyTGhQS0dr?=
 =?utf-8?B?dmFTb2FMVllENzBIYTN4K2xaOWtJZTROVCt0cVVuTlhhZ3NYYlFzZENNVVNZ?=
 =?utf-8?B?c0JNN0VwTWZHRndYQUJXR0xRQWJqN2FERGhOdEJ4TTY5aW4ybDNnYkZBbUpS?=
 =?utf-8?B?V1JvU2xOZEVNZXhJaWxlMDdxcktYSmR2SjI2YkdpZ2JrUUkzVGt4SUV0ZjlF?=
 =?utf-8?B?bnhkK3FuNVZPZW01SGsrUGtBZUtodWhiQkgvZkhGQjU5SjJGY2NZVkdYTStQ?=
 =?utf-8?B?bXRaMzNKUzUwVGFaZFVoSXZGVG5WeHlmRG0rTmZKN2dGR2wzak5ab2J3NEVp?=
 =?utf-8?B?MDhIS0RRV2g4aEoydnJDcmR3VmVJQ011eERtdFFwMEtMODExanBjOG5peWhy?=
 =?utf-8?B?UzZFUmdkeVU4UFZzNEh6ZnduNEZaVE1UL2RzUlh5ekhtdExMTmhlRnZaN1lo?=
 =?utf-8?B?TkY4aGpRaHZlcEVLVTl0SjNiYzR3eXQ3Rks0czlxbEduSHBzMGdoZCt2NG9Z?=
 =?utf-8?B?dHNYdk52Tm9obEhad0kzQU5IZHFVUExPUGFlYUZXUHlpaHlUbnZrcXhpTC9i?=
 =?utf-8?B?Y3FCUStHVXRMOWtrV3E4anNXUjFRSWhXdWsvRlpxZjFzZDZWNnp3ek93Vko5?=
 =?utf-8?B?T1hvS1pkSmNmc1BzbVlnU2hxQVRqQ0FyNzdGRnRsY1pZTTJKcXdpSnpiQXdm?=
 =?utf-8?B?bmxOdkdKYm42bXpHT2I1OVpaUUtmWUQrTm82ck1Zd1FBYVdEODZ0UWhqUWdK?=
 =?utf-8?B?ZlU2T0sxZ1h5QitJU1llQ2QwcjI3dHNjZThYRVdWMi9ITU1vQUwxbTVsdnIx?=
 =?utf-8?B?elYydFZwbWxrL1J6akFBd2drN2VZOGJmcGd2MVNoYjYxUW8wZWdZWGtJemI2?=
 =?utf-8?B?UE1TUkI0N04zK08xSVJFNjhrTnVUajNaZGtpaFZiU3dXV2o0Zmw2UWxxSFRX?=
 =?utf-8?B?SFN6S1ZnSWFWS1RZQjlWT2tVUnJrd1RzMkgrbHVQVTAyYTdRUk1QUjcvRUpr?=
 =?utf-8?B?NkJPb3FIRFpVRVhKckF4RUF1N0tpdWQvL2xGVGFPeGNxRlBHcVJJQy94bzZW?=
 =?utf-8?B?YXRqRm9COTN5ZHc5NjIzRndlM1BiWjcyZkU0cXJibGRyMWo3MkRacFJUMGlu?=
 =?utf-8?B?Q0dvTVRZYXI5SmJyWHN6cTBVWXhrYW9iZEg2dVpHNjY5RkxsYms3NVloZDAw?=
 =?utf-8?B?S2VDNFFjVVdIRlhzUFp1aUNkZGFJem9EdC9iWCtIc3FScEQ4cW5ZZHkwbTRz?=
 =?utf-8?Q?zgQWxTnQRCxmKAbSUc5C7vPmD?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e123ba2-8dc7-4e87-843d-08db5053fdf5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:09:47.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dq2jECwWjExXf23wk1vHucuTTXYk8Akq2KS+Be76Rx85MCEY54odsrv9xagDkkpJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6936
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2023-05-08 at 22:53, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
