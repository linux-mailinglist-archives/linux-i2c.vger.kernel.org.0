Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB416FBF0B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 08:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbjEIGKm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 02:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjEIGKl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 02:10:41 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2135.outbound.protection.outlook.com [40.107.7.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A1183E5
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 23:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6CN5ZaAID6ouBvepb4eAV9opK8qp9cIac5w91eR7UhsBCv8/ihR2sPUXFZ9Cl1QNePBxflgB0G5s4BiINyArNOPX+iQNIUcBhK5mDGHPjbMUwjHphVWEurmJEn7VocPO10qBtnOy6jtFzLe9rCf/xTPlaxJMVWfA0wzIFzkAHCU071lXPn9dSwOQN86U2xhdjzdkNnB/q6u2NnhNKcv1F2Xl1NYINMYuFgqFkdt3a6ysA85AFAQBl9wlWgNDKyzvvb/qwUCNIAYk+81wtUlvJhevaDDLioSnxTSo/O3dBxZviazMxSneIoSA6AbmUmEQyC6IzwfYwF0zkTghcOwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=X+aVpAw7rgko707QGDLdRT/1SqFuJtrlc3udIWyEVmbPINNcgHzSsJP2D6TMPPZIJq4M/691WfdBFqZ87vGyIXg3++Qu0O/ANGYYPwXdwN1y8XGFFuYVau1AO7+UYa1XrbszM8/mxPjlor6F2WrEFomkhCBUEYMmOCmxLulfgEnO2BOeEvrCbvhI3IEcLGbpGGPWafrhcIKvk5asUra26BZPAqs6skMP0P+GS9s9+oWWGb8vlL4rnEZzwErXdvqLrVsHNh7pnbHYE0/yRY34T6EmS8tOOxlkE1GtEJmhvOrbrkojk0NO2X9KG1KPwgV2nr/WmucDVOSf0BCUdWUx2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=cTUW+jb2VRNb8FIunHD4qC3IgLYabyG6jUK87UORT+MZYWMywXw8cZ3wgNTQPbBYhluJd/kABIvK0w8m1IG7XGt6wQKz0cjmhO4NFZ1ocwmbnevZL4ys6if13XFpyk+VkzLej6esIV/cuz0Bsy+Dk20HmIzVs4Ap3V/86u5Nj0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VI1PR02MB6031.eurprd02.prod.outlook.com (2603:10a6:800:179::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:10:36 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa%5]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 06:10:36 +0000
Message-ID: <1200ffad-d529-eaee-7782-5cd5d4457521@axentia.se>
Date:   Tue, 9 May 2023 08:10:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 85/89] i2c: mux: gpio: Convert to platform remove callback
 returning void
Content-Language: sv-SE
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-86-u.kleine-koenig@pengutronix.de>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230508205306.1474415-86-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3P280CA0112.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::23) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|VI1PR02MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: e94c31f3-41b6-42af-8b17-08db50541ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d1osykZ1GHnH9HPNinUMYOPaxX6rOU5VW5DQBngzjcx6Eq/movprOtsFjL+m8m5gufuyUup72kdsRhgT0LRonwTvB1LxhNZ6BdmZVvKYtbhZ2CSqoIyi6OxiR2hpAuMXZ+nW3CWmRyHtbQd/En1HMuEgzBNXNO4Rg/4aWpWv0R9coWQYERxoufKykL40oDATmIHe+AwGuEblMmq9Nkz36QR3CLbCU4E/YVGJ6BnpsvgqsdDk2Nzpdi1rvT87z7vMQzQV6PF0xmRXI2x/YyDQ2pVZVuc54+NJe14NjRxQjqsaIma89O6KmAsw5CJ6vneidyRbg5cnT96+xG3BScBBEuaAHjBwgeBML52MiXOa//XeGoNNRP1+OYKD7yfLlvuIXIMwZLN9p96UOohs+/8GW0pbyUJH5j597JWj5TdShU5PAtBz83DXXhKJ2ZNoPZUqMoCU2DljnU7sf172/vrlFp7oNiWjrAzCTQ6A9DmWbiqXC4WMw+zzoB7TezvkfOovYiPWl5xIpBgZWJ+34sQ+LjVnzXVyILW/QS8nicy0jiNuaVqlXWkbP56DZeOhPzXYR52XXuW4OmBh9nxFcLQg1b8bqF5uhyybNsl8pExRBwuw1+/8OeJlJpl4GeX+Mx7Z6CvrbHdUpJar9+7/bWfgvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39830400003)(346002)(396003)(136003)(376002)(451199021)(31686004)(36756003)(41300700001)(4744005)(2906002)(31696002)(86362001)(38100700002)(8676002)(8936002)(6486002)(5660300002)(66476007)(66556008)(4326008)(66946007)(478600001)(316002)(110136005)(186003)(26005)(6506007)(6512007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1VWRmRDN000T1BQS3h0VnZTNGVqTytyRzU5T2dyZlYvMWFQTTF1Sjd4T2Fv?=
 =?utf-8?B?aFVoWDM1RUQ1K1JSYTRINXA5cWFJRXVuQ3lvd09RbkRkVjh1dWR2clZQOENW?=
 =?utf-8?B?Wi9oWHA2eGwvQUIxbEFmdzhQbDExVzBuNUdCNVVSTE5RNGViSE5jT0lXNEow?=
 =?utf-8?B?T1JlR3JKU3ZsQldIaXJnakpTb3hJTWltdVFGRVkxMXVrZWZsQkR6UVFkdHFi?=
 =?utf-8?B?ZEtISVdJUy9JRDFGZXVseThIeVBuM1JMUEZSSzk5N3NFTmhLRyt4dktWcFhW?=
 =?utf-8?B?QlRFNVhDYWE1WmR1UU5tTGtQRmFHZFE5eDNicEU1U0RBVGU5dU9CZ2ZiL1NJ?=
 =?utf-8?B?V0tkd1ZWL2wxK0Q1SkVxRmlrUUZ5M3N1TVN2Z2FtZHJ5dXJSMlR1Q2Rpcmll?=
 =?utf-8?B?WEx6ZlRlbE5KNGo3cnEzV2xKS1dDQXNPRW40MDljT2JpNndPRDZPcGR1cUIx?=
 =?utf-8?B?a3JuQU54UnJzVHg3d202V2dBREQ5b3g5Slp3VFIvQkJBVFkrRTNHdi85R0VO?=
 =?utf-8?B?azN1QzlXclUwdUtXOXhxbUZxc3RVQmh2THo4aXhUaThSVUdNWlpicG9yMDk1?=
 =?utf-8?B?ejI3SWF2cEY3SVM3Ukp4ZjRJbTNaNElsdGdjMDZPaDlwMEZJd2kwcjhQVzQy?=
 =?utf-8?B?eExaY2M4dVhEb1kyNVpWM1YrY0ZtSVk5T2JKVzBuZ00zTlQ5bVRzWms2Vmlh?=
 =?utf-8?B?bERsT2RKYVJOdjk2RER4VkI4Z1Y4cDVFU0VTeEtyTXNjSGJMTmtvNlhic1cr?=
 =?utf-8?B?RW5TYXIzWktBQmsrMldUU1M3Z3VmcmhSZjNjVXYwdjU0VlliVkxrYmxINmh0?=
 =?utf-8?B?cUNSS1JLK1dPT1M2TkdFd044ckR3QmgvbUJFbUpxSWZiQmlhWVR6R3FFRTFZ?=
 =?utf-8?B?YWkza1kwa0xORWV1S1Btb0k3bGR2YURUTGJrTmVid2FjUitUMDhwbXhHSFNB?=
 =?utf-8?B?RmxQUkkvaHRXMVhNU0FSRk1OcmZxYXhDUnFvcG8vU0ZiZWRTQklpTDhJZW1t?=
 =?utf-8?B?R3I4NnFla3gyVEMzYVZQdWp0bUVMMENLZUhLYzVhK2krMXNPS0NUN2tQYm15?=
 =?utf-8?B?TnE5NGpUL1FNSjQ1WXlWb1NMQ0JNZ01rcEhLUkZENEJxbnViTUdSQ0hwZVVn?=
 =?utf-8?B?eEpmbjlhN2ZNRE9DazFpbzFJMUdxd2NVL0JIa1VocHVhODFIMVZBOUZVNEFx?=
 =?utf-8?B?bTl6bnZmWGoxZHR6R3I0c2MzQnBKeHVnNm9EbGhSaVJ2TzBFcWxSVDhuNmR0?=
 =?utf-8?B?ZG12cmRyZ3hNRzNDVCs0VUl0Rzg0OWU5VGpxdVJKSUFKcklVeTdvVGpxVmhK?=
 =?utf-8?B?Y3NkYTViemRsLzRURXphU1pxRVk0VUdpUkpVakJMNHFWMVA0d2hZRngvbnJL?=
 =?utf-8?B?Zm9QV2FFdEthb29EMzRnMEkrSEYzSHVscWZ6bDcrSTdNbmFxSURjbDl6NGpO?=
 =?utf-8?B?a05xQWtBSWM1M2VpYWhwd25tMkpqaEVlTk1DbTR1RDhseU1iZjNmK04xYVZ5?=
 =?utf-8?B?U3VhSkg4NkRCSldNZCtpckwrTEh2WUdVY3ZmZWU5UTVZOE1xUGF6cGdzV2hG?=
 =?utf-8?B?SDJxenRBanZXRUJjNzF4NWpjWXBqVHpxNE5wRVVLajUwTEhtTGJJbXJFbHUv?=
 =?utf-8?B?U3RyQ2pYc1lLMlhJdDhnTXF4K1ZIaHEvcDB0TUV3ZHRHbmwyQ0swYnVFSHZI?=
 =?utf-8?B?b0QrNGxIcm5sdlVPNG9hNkZJSGRsajdQS0ZqTkJPRENVcXBWVzlUNHRRREZy?=
 =?utf-8?B?cjhGeDdKTzJqS253MUlJb3ZaK3E0VDUvMHBkVC9RV2lsQzBmTlhueGU2N2V1?=
 =?utf-8?B?VkREVWNoUElKWmVlK3hNbnlYRFE2YmJwTXJLWjE2Q2E1Qi9WSFowTm96NWsz?=
 =?utf-8?B?ejhxbG5UWHFjWXBxR0pQRG9ZZ1VIMXNKYy81QldzdTg4ZS9GSG5WNGVhbTZI?=
 =?utf-8?B?TlYzVGI5ajFoWjdjdXdzZWhlcDdGRjY5MjFDU1JjdFZlRHpEckFjTTVaNldj?=
 =?utf-8?B?S0R2czd6WjJrYlRYb2ozZ3VFMlc1eGtvdlZ5TTh5ZU1FU2RlN3hEQWJGTHBC?=
 =?utf-8?B?dThLZXhabFN3Q3NlcThlYVREc0JRRC9COFdTL1UxVTRncFoyYTFCRmRubFlQ?=
 =?utf-8?Q?scGo6GUOgYVOzegO0mm+MpoE/?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e94c31f3-41b6-42af-8b17-08db50541ae9
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:10:36.3692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv2xxrI0FBIwVp3PO0oclIDBArr92rmSV0n6FfLdi2ZXNY/OMBT91sLqtyElVfUm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6031
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
