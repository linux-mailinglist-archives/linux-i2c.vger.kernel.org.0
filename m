Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B3E77FC01
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 18:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238658AbjHQQX2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 12:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353711AbjHQQXN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 12:23:13 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2132.outbound.protection.outlook.com [40.107.249.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5503A2D4A;
        Thu, 17 Aug 2023 09:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5VMiZDYghqPGh7h3ULRJlzOLF/ur4pj8NW5kU2pQh7c7NNjQuHCD1IQDvXqQv0IREpzCJu47Rf9QUHTiwxH1vHjQfrAY7WZ4y1Cuwc7zPqDAi/p5LD63g5sJMixeO3pyjsVQajp8YITU6yyQ6xfxd1fWNEPKPqFznIdXNEEnXI3f54POwqtJ7Y9k0Bq19wsGvI2By7Z0eHz9zRXKIPxVU0UA6y6rKi4wZobMj67i95ZjFoaXfnW9T9dSvq82FZ5qyku1Ugb3Y2S6B82rR8VL6IZZmgFA5/5944ovLZiFu07faVQSSt4l8Jbn14no2xYQ4Jk0/hWX/WQfnpyBU/Wog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1a4+2o6hxBB1WCTOjtFMLmyiNemiCuFQ5jKCm2cus34=;
 b=fVe1v4SgGd5T++qKl7qH4rp8ArLz4iMm/+uU44rIVD3oJtM5MsIk+QgOyxVje82lPFzDvbYul0oayZMPSvcC5hY/V8FG4sdvZ2wFv74RifaxKfGQp7o6AHNmLUisqYyVs0P8pcE2mfBNxFGLRVQ5fiF/WSgfYWb1SueHzfYl8vPBvFdM+bCY9/Hj5yZm8846A827azGiDpwUkaoE7oXkTEEGClpYsrvCB0/KmSFsdgiSErxOEURlNm5RVW+HMBFkjFumOID1BYWgnWnJJeSJpWxXfUAy1ZVFTYcUXf5wUdbwjGEVrciLwJAqIOyA++LmeNpsnlgtGZy6d9i7piSBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1a4+2o6hxBB1WCTOjtFMLmyiNemiCuFQ5jKCm2cus34=;
 b=E0US1yNa5GIHfx3NlFxIdUWvH0WLovnZU4O23l15xjJIZmMbsVh91qkoErLlKfKndhNT1DjTBNaKOEM5f0txJKNdbCyGfYka7N9OwTd5KIXIFLNfjlsqFY54tDKN6NIr1cygT3SQlfv0TIwGan9Shz87I0n048L9L41sRVmF6Uc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB7318.eurprd02.prod.outlook.com (2603:10a6:20b:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14; Thu, 17 Aug
 2023 16:22:50 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6699.013; Thu, 17 Aug 2023
 16:22:50 +0000
Message-ID: <64a6cfc5-6d53-d5fd-388e-bf5b96300ae8@axentia.se>
Date:   Thu, 17 Aug 2023 18:22:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v15 4/4] i2c: muxes: pca954x: Add regulator support
Content-Language: sv-SE
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     naresh.solanki@9elements.com, Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-5-patrick.rudolph@9elements.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230817071056.2125679-5-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0108.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:9::9)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee4b91e-0351-4e84-4418-08db9f3e3391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qKa27Ut2PxUliUnZG6Vvthhbbderc1BIn/HM2QDdgL2Xu0dfkxwwDXG1W2U2sC62dNsW3u+LiP/9+at0dOtLZLr206T7Kx+01DkoC+Ai9MJAVl+/VMoTV+8krABw3kkT+3QrIQpPPnkn3TzPLoAWce38LXcVaToWMHGTkX+tFyk7Ll+2AXvc5Vvo/mv1e1K5Yq/Larex1JiNTxOiIiVB1QJvHc26fFEQc5LXrr4Fc8gzK5jS+GQT68XxN0rBBmQlgyEqrnrULm/7vymcwPIHADs7wd5LulNgJ5QZFJBk54rNeCBbW5AcYaoHuKaVar0F6Xo1vn0QYG32Vb1MExVngHPnlzxFWPY+YHyAE2ed1kf4R1Fi5g+lbzHthChm/2q+CvfZMhHYGVJGQce7qwIoiddRXsAWVraM4WDIxuxnfcI1sUNQdyHBLGmzBy/2aK0O+zAPbiO/bOu8c3xlX4uQTQvblFnxekL0tHeaqPVXSMK9cPrbZ1bXh77+oZpzMS9t0ipvGfxsvzE8SpRasC6VP0ntO3+brrh4WlqAksLPwcuCdlWTUOkzehTZdML48/0/lsocwJx87pLn9AchNBGu3vk/vCe/53pWUCrPJbb4+clJb6DHj3ShUan9UpomkS6F+i4Dg87CELsHWl9HEEt+qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39840400004)(366004)(346002)(451199024)(186009)(1800799009)(2906002)(66946007)(6916009)(66556008)(66476007)(5660300002)(8936002)(478600001)(6506007)(6486002)(4326008)(316002)(36756003)(4744005)(8676002)(2616005)(38100700002)(26005)(6512007)(31696002)(31686004)(86362001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE95VlBWZWRPdVhlVSswWGYzOVI0Vi9Vc0dtZDB1SjFkd2Jpb05YRTNSbXhP?=
 =?utf-8?B?ZkNBY2drMGJuZ1Z0NEljRUFDaVVkNU9XL2xhRmhEWUpicFpBbWNybnhJWGxp?=
 =?utf-8?B?UVlDUmVHTUVVekIyeDNMZCs0Und0NFhITUNRSWJrQWNJV20wendkN0hJNGRk?=
 =?utf-8?B?R1d3S0p2aldPVnZTc0cvM0EyaForRVNWZGNkV2VHaHducFAxWUlvZWVlQjIv?=
 =?utf-8?B?dXpnVTZOMU9mSXlQVm8zZnVFSUExUUlZWEZMc25HcGd5MEUrRXQ5d1NUK2Z1?=
 =?utf-8?B?TkEwUzRWOVdMcitzUjlFOUpGd3FZQ1BwL2l3TE9YU05UdWs3KzIzUmphMTJx?=
 =?utf-8?B?YTVJelhUYXRNeUlTRklCN1U0OFVtMGhkRk1oTk9oZUk1RUFnQUwyVk03dUln?=
 =?utf-8?B?bEp5d09INEZVczQxQjZFNUFZNU5tWk9DY0gyVmVVbUVDdFhiMk5Jb1FYRnZH?=
 =?utf-8?B?WjFobkxScG4zOTNsaUJWaUdzYmlxWkFhaHZ4di9VNHh5TVo5azhWRFRHZDll?=
 =?utf-8?B?ZDhyQmJ3bldFaHBJT1Voa01lUS93c1V1RjJxSUo0ekxVUFp0aEV3Qk5hbUM0?=
 =?utf-8?B?MGlKZWdQeGd2MFVqQzg0eG9QQmE4T0pQUFhNcGdOZXZzTm0xbzhYcDlUNzEz?=
 =?utf-8?B?aWxhbnRLOHEvQ3htZEp0N2JIZDlyVXkySDRnYmtieGtuNjNRSU1NVHpOZkly?=
 =?utf-8?B?SjFqOGxWUWhzalA2TTFBSDZHMHVmT0RNaityZzR2dHNJbzl1TU5MZWxHQWd1?=
 =?utf-8?B?UU13SUlha082WVA0elJqR2g1OFRGczJIZEhJb2VCSlhsN0k5a3dPR2htQXBN?=
 =?utf-8?B?bDRaTUxic3MzUytqcGJpMzM3bnMrYlRGODdaY3JuQ3lpV2MwWi9iVlB6ZkdH?=
 =?utf-8?B?WExybHE1RU9UOXhidnFSR1NwaWpyU0lrMEVneEFocTF2YjVoMGpHQUF4K0N1?=
 =?utf-8?B?NDFFMTR2Z2VPQ1NKbTYrVmF2YW1LNWZKbUx3VHhvTUVJWVVkbUpqRnZTUlhI?=
 =?utf-8?B?cmRCZlphZHZ2cCtFVlUzZDd4aTNWREJnbjFPTDhNanlwRlp4SVI2YnZubXJl?=
 =?utf-8?B?ZzJoT0F0SEJxZFdTbnNYcEJaTElVZHRRMWt0SDE0S3F0V0tOcEsvSUVJN1NQ?=
 =?utf-8?B?VFByZnJLWjBXNzRTRDVJYyt1eGZNczdzS1pMTmVGU3FDU05jNis0K2FnNTRz?=
 =?utf-8?B?VzNzYmhpN1EyOGVLaFRFQis5dGJyZktGd0U5YTJQSlZyUE8vOE5DQTRGMjhv?=
 =?utf-8?B?aHd2UGNwZTdrWEZZVXFkcVJhSzNxaSsvT0pBS0orcFMzaGk2WnE2WXp2U3Ir?=
 =?utf-8?B?TDhsa3pVMEkwMXN6SE1uZzJBRTBDT29MWlhjeHczcTk2eTdPZ3gzZm1IM2FX?=
 =?utf-8?B?MWVXTTA4QitubnNBdnk3RVlza2x3TWNBLzFQdDNQcytoMmdyMmpTTk0xVk9N?=
 =?utf-8?B?SjNHRmNhNGNoWk0yc0ZVTzFWUHQ5RGdOZFNaWERQVnRMUjM5WkY0dlEyOHFS?=
 =?utf-8?B?eGR0ek1QS0cyUVkxd3N6M3RsUnlDRVFWNGZrSWFUb0diUHB4Q1IrallLbStQ?=
 =?utf-8?B?VE93dGc2NUJNUHFHRU0vZ1dWcGFNelhvcVd1TnFNa1VPclBObDdzWHpSL3Iv?=
 =?utf-8?B?QnVsU3BHN1RYTU4wZEg4em0zUzdlRVRaZ1kramFFNUs4WTlQOVJWSGdxQjBC?=
 =?utf-8?B?U3UvVUVZNXZ4Y3ZORWUyUWRDTXJ1L203NXhhajlCYW9tVHRvTExGY1dibEg3?=
 =?utf-8?B?dFl2ZzRueC8rTnI0YUNRWllyV3N3MEN6OW80a1VJRk5XQmQyZjZDYVpmM3hD?=
 =?utf-8?B?Mm9aSVJZWnlDR0RjVUZtZUVSTng4aTlHNGhZOWpTekNEQWtCdDRVd2gvYzF3?=
 =?utf-8?B?eXBBWWVNaTZuOFRkc1o3eHVzQklVd1JhaDQyQ1d4ZDBkbElnNGZlWmZqdlA5?=
 =?utf-8?B?dGlOYm44ZVNWaW9weklIdFdRNXRIaUg4UE1qOU9JbU5hU0RjRXNId0ZGT2Zl?=
 =?utf-8?B?NExLL0VGU0hzd2ZhMHdWOWprZWVnK1AwTUIrVEd2NUxjZVdYcy9aQmNITHhJ?=
 =?utf-8?B?Ny9VMGN1TVdtbGtyUGRRcVJQMG43amFHMHZhUDc1WUN0SFdBSlkxL0NqS0da?=
 =?utf-8?Q?7E8Rb1kvS2D33z4EmcmGQtwTs?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee4b91e-0351-4e84-4418-08db9f3e3391
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:22:50.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbRhSJUG7ajLWNcj6ETXj4Q2RIo3E6/4xzsdcaPt+/XkcWjNo1Jp3i2YtZRejz3B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7318
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-08-17 at 09:10, Patrick Rudolph wrote:
> Add a vdd regulator and enable it for boards that have the
> mux powered off by default.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
