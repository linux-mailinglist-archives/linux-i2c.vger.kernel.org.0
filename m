Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9277495A0
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 08:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbjGFGbz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 02:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbjGFGby (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 02:31:54 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2137.outbound.protection.outlook.com [40.107.6.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB501B6;
        Wed,  5 Jul 2023 23:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qx/h4nbSFi2v9jgOnpbfVXFolUSr6aICEZB888ibp0MmqC6Q4IofMnWbELv34bSCIzIk7l3HX2O5xtbW1/lZsf0pJe4U8PECGIQak7zZ1YvayDSvreQ+X6b5g87L5W8I00KHNzr/5/aiYp8MKGCsbVbBHQJai2Rwo69crSh3UnsRSBwUh9QIl+mIkxSrwRF5Xw5JpDvCArgdGvuc3gbAEcI6hZid6yZYZIhoEcmFs8PHiywXy2bvpY73icV9MGduLOQPeAouxFTk3g/m0DH1xuD9YHY/cmn64DZ2xq0T9ihYX13GfNrrIIs1YkP179cv9X8Dbsu/nC0jHAcvh035UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1lvIf7v2f2IySDwPVjxPwhWDNETs46+xHb0VhaYsHo=;
 b=XmTeufaBhpJWeFdSdPhcf62XtzTfTRa9eyxnA8B+52zTzdMF/kjaELWj1PJKu5zJvtPs3kNfsvuZbOI5Y0t6CLQIJjjFcTMh/oV2kdWm/CCVc5MYyznDfSmC1OlTiZOE+kZHcnYVAgtJb9UY6wRaX3CGJDRHwjAC0MsFYr6Vl/JMxiQ7OS/n6P6uj+TndCdIWtCvzEKacTrM6M5zXPODB3UvlemtvyMiJo8SMtyk/+8iagT5h8XEXZj/K/EI671uRyr/VIA2Ui/wK0nG2LEOofpjmeFNpY3q48DWoO5nilbw2QvikcQXBTIEPShA+Q8NYZJR/M7TPgm+N9qDWRIzvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1lvIf7v2f2IySDwPVjxPwhWDNETs46+xHb0VhaYsHo=;
 b=EzWA7f97Xlh5JeeZkUm3mZAKctV7t9U4V3etEjHsP/NQy8JZAB/X7K8G9Nrxbo9xu+/d20ejtsckziiIy/HjDfUj2aHmn56PiAGQoCPUzE8ajAA+CEiTcqRgxx8OPmuEkw1qJPqUfYt18b/coETud+RqIlC+zNl/fX9bTwwxXP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB9694.eurprd02.prod.outlook.com (2603:10a6:20b:5ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.12; Thu, 6 Jul
 2023 06:31:49 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::d901:89d0:6513:cd02]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::d901:89d0:6513:cd02%6]) with mapi id 15.20.6588.010; Thu, 6 Jul 2023
 06:31:49 +0000
Message-ID: <0bf72ad2-c992-2d78-4fac-6d301cdc9b13@axentia.se>
Date:   Thu, 6 Jul 2023 08:31:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 23/23] i2c: mux: pca954x: Remove #ifdef guards for PM
 related functions
To:     Paul Cercueil <paul@crapouillou.net>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230705204314.89800-1-paul@crapouillou.net>
 <20230705204521.90050-1-paul@crapouillou.net>
 <20230705204521.90050-5-paul@crapouillou.net>
Content-Language: sv-SE
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230705204521.90050-5-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF000013D7.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::16) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: 1990c27a-f027-4922-537c-08db7deaad63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mx9cQLIiUzpe+vfUPGC6cEgt88cd0DRjbXlyoMDuaJtuCF/D7nr+/u/bY0KuT472PyTUhSBXFnZeeM4+XkKn8UOgOodEdXPMGT/O8COCMmPIh2S0ToQDWE3X95g+EcRTBY7+rbDz/gVxCUll8zUCqOX2tsaEUteecTAgcrk8I2CqvmIyCA69cB/hn3HLAdB/TcIiC4fz4pOdF8OdCgOYay1rVbgE9toz7/XSle4gpa8UMTrHbyIpoF7s9RxrpiaoJYV3YWE+yi2v1QyzhPV7oHQLjd6j1SOMBXg+nFLz6Buz5U5t3JI9+vH3JUZvXXdDRJqRxapZXAMpABO+UmJ7S3ZbDxhc9ElmU2dNXa4VC9VneigDdqM0/r5vNjezrbVE/SW4/K4y7tt+y+XW8X1RJtGPjNwLC4cjz+xcgQVo9SewBEBaci/XkWmz8vupzUs21uhwWNUiKjBLro8HhTxdQRVBexO1+XtJczYEjNqASr9VCihuZ4CMAYfnaMekFsuBHFLfYow1la1Ywk7z5LiOqHpwvTmGpveOLO2zOUsl97ZbySYihe60iZGbLsl05FwxYTkNKqPE5M54i70PTfr9qvtU9rCj9booLamu2yno6v//fJuhepwbmyiYmN5b4kfp5X0lIw2hhAAbKPVUwgQ3dg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(39840400004)(396003)(136003)(451199021)(478600001)(6666004)(6486002)(110136005)(6506007)(26005)(186003)(6512007)(66946007)(4744005)(2906002)(41300700001)(4326008)(316002)(66556008)(66476007)(8936002)(8676002)(5660300002)(38100700002)(31696002)(86362001)(36756003)(83380400001)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUJadXlYcUlRUFFNVzFaUWlpT3l4UmZITnlpdjBNaHNDWGV5QmFsSFEvN3lo?=
 =?utf-8?B?dEVlR1lqTERUVjJqbGV3SWtSYWw0bTdrL2d5eHRISDNhb3lMeXVBNmZaUUdu?=
 =?utf-8?B?U2FoQlJ6VFBab2pBTWM4WVZTN0tPLzBiQmpGNko4eWMrbEwvTmZQWlZFUXlR?=
 =?utf-8?B?ajkvNGpNSS9JZ1MrRXZDMDR3Nm94MEozNnppYVVQOGJyN0MxL0t2TkJ6NFc1?=
 =?utf-8?B?UDdhYmpvc040WDFjMWZvNElkSjcyQXFoazROV3BZYzhEdUluTnZ2Z1dXUlRR?=
 =?utf-8?B?TFJkM2dlbUN5MWNLQ3RtQ3pSSC96MFlzOGVWWmIreFNUUDRRTkdVNms5VWpj?=
 =?utf-8?B?cmhUcjI4V3dLVGp2eEwyWE03SnRZdUdzYk1CSk1FUGFxRnVKK0gweVRRQlg3?=
 =?utf-8?B?QlJZbnl4MDc5QlV6U3BWT2hLOUUvd2xFMTIxdytKNmFFTUFkZUs2a2Nib1A2?=
 =?utf-8?B?Q0R1eUhkNEFqZnVKeUpXU0VFOWkrZVJpQjFTSW1vdDltMHk3R21CZ3Z1Zjlq?=
 =?utf-8?B?NzZEQnRQaUV5NFUxV1NhaEt1b0EyMkFlVGdaQlBsN3U0RTExWHdpUHhBT0Fs?=
 =?utf-8?B?UXpMQzFBbit0LzNmNm4vbk9EU2pRamtUeHBPVXJJM3k1TzVzcTFLSGNvS1o2?=
 =?utf-8?B?SDRGbmJpcWNMbWhYS3R1SlY4ZzM3aHNrVURwYWMwdm8wdDRnd3JRNUVicEhq?=
 =?utf-8?B?dVA3R2tqdmZjalFWbzA2alg3Yk11RnViNlZLY2wrdVc1eGxXTXpBTVNBNVJ2?=
 =?utf-8?B?cUQ3djd1SWhES2JjeE5ENmNLZlNEakhOc2cvMG5pVkx2dmVPcHp4Y3hOK3I2?=
 =?utf-8?B?bktSODRFdExTRm0yWjhoT3JKM1ZtMm9Kemd0T2Ztay9LY1lqSFdoUS9ZcW11?=
 =?utf-8?B?cE9BU0ZVb0l1UjdsbTBISnliTTBEYmk0dmdrNGs3cXYxREMvWDE3ZEZ0UGhN?=
 =?utf-8?B?SU9OQllOdmtFTVU0RmpWcDVaNkdtUW9yb1hVTFl2OVkrOHB0TXNISVBETmdD?=
 =?utf-8?B?VkhZUmVQb09zeHFoWCs3WkJCSCtpN09nVFlpNGVxVHZqaGN5Rnhvd1NSMmpk?=
 =?utf-8?B?ZGNpdkpXNTdBcmpUbUVXdjRJUWlad2dQZWFUQnRoM2FwTElYeVltMW9WVmc4?=
 =?utf-8?B?NFdnRjJoTmdsNVNjc0ZGYm1Zc3RrRnhiR0hCNm5Mam9hTk1QeVpJZEExcytp?=
 =?utf-8?B?VFBnc3RmbXJWRkdnbXVOV3MzcU9HbkszVTA0Z1RQSE4zcmNaYlZLRk5jMTMz?=
 =?utf-8?B?Tkh6cHYyM3B6ZHMyTGtuU1BkYlVNZmpPS3J5bzlRT0N4RnJzWFhJNitBMXJw?=
 =?utf-8?B?UTczMzlmckI5NGQwcXdkRGNUa2FsUkVONlB0RG1URVlqODRhSGdLRStoV2hw?=
 =?utf-8?B?a3JsWC9GdzczbnViNE83b0VLczg3SGtWYndvanBMUVZvU3g4bEFNME9UQmk4?=
 =?utf-8?B?dDVPSi84QWFpMzBDMmtCQzk0WGl4bXFUdzZSM21QNmFHU0dhU3V5T2lxRVc2?=
 =?utf-8?B?d29wMjdvQXJicm9uZFpZc1ZidHJmb2hRc2t0NDVpek9ENVlRUXhZNVlEbVpa?=
 =?utf-8?B?Y0JJL2d5eG1iY3VQMGEzMFlSVVNPSllRMkx3WXAxaVU5Q1hqVzFuVXhzeW92?=
 =?utf-8?B?VVZFb0NFR2FBMDBsRDQ0RWVMalBPSEZhQWFFUm14NGVIMmR1VzdrUlBHY1h1?=
 =?utf-8?B?Tkw2dDFWWFFuTHpBd21Dd0NPUDdoR05YVm1kRzd6ck1pSU5BMkY1bDBUK0JZ?=
 =?utf-8?B?R3pDNmhsRGd0UHJjTlB5N2NicU1TQmkzWWxScFNRU0N0b0lUTHhqNHRHcitZ?=
 =?utf-8?B?MFZkZHkrekZLTVFPdUxsTG0ydUpqK3AxYkVqd0JnM1JRS3hLekJEUmVKd3BG?=
 =?utf-8?B?NFhDWEh5emxIbE9TTEhQeXhGZ1JsUzZvSVR3MTZRK0RYYWI1cXVNQ2tubUhn?=
 =?utf-8?B?WFdNMlQ3S2xDb3c2UUNoU21IeU5DQ3ZtMDhpVERIRzRmbVY5M2ZvREFGZzdi?=
 =?utf-8?B?bUxUWnNJenVVREVheGJHaWprZjM3aUx6ZWlPTVFXN1FDK1lQRm9iSk9YVS9X?=
 =?utf-8?B?Q056dEpqUzNaNGh2NWhEWHRuTkF6SE55MGg3a3ZrMUpPUlF5Z2dtOEUxdGh0?=
 =?utf-8?Q?7qsyXiMSjJj7UbbelmoxhsyR5?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1990c27a-f027-4922-537c-08db7deaad63
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 06:31:48.9475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gzk+kvTpsztOtvvj0XCtmJXOWb2+n9HaNdiGqurgv4DhzUY9ffIqIHS0EkB1e7Sy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9694
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-07-05 at 22:45, Paul Cercueil wrote:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
