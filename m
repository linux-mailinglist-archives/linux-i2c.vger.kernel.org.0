Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5BE22F7574
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jan 2021 10:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbhAOJak (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jan 2021 04:30:40 -0500
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com ([40.107.21.135]:60512
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725917AbhAOJaj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 Jan 2021 04:30:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6Bgna02DdhX8NGVSxsiO/RhHPKGKjfoLxcadPMG6cJejBau5g51d2d2EQI1CkmAalYodAIjzkhyWTnoLj9a7TQxojn5zE+XfG+h+qVDRAEVXkHNR8r0h2uyqWMptGnL5JJPfkuk//DnT+aZE3mv0ElDly7C6kFcULUAjGAsyw3aKBmNDOUNyfgBvHRRqOp70+/bz+XWpiBpbempD3+GLvRpSb+Ns0ne2Ihz/8JsulX+QPGGFiZTP/ffHV6eGdE5yGzTM2ADoK5f5OJLbYAd9UVEYG2Cfu03FDyQ//k6eQaW5YTIb8JZF/gSIQxlQJbfrtRMbmXHH5pUdyvTkVyvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fpC6RQOpnzJQVLctOpzcW5VIBtHGoamFOEp+usLZuM=;
 b=G+gc41JS+GlKqtLZcysE9G7HgeoAAyv4j1uljFE28oGFvD1DJ1f4NQbZLAi2NKEX2Pf6zyZ8f1rvFMynPbanUz5eQBHZW7Ijm1oPlazcNEw9V59UQOsgPahSFMMCfXdjgeOPe61P0aO7IMgw6AOsasCi0HwD/qnodGckvw1hjgRDsfWy3FJsP3DsSM08FLpW1YKBYLWG76aJgXao1EZXKg3wNbJ0ArBdh7tXW540E+EFx57iwOQXm7gWGFtaFRg4buTPhd2cZJwHOQcVGeIEeSy85nBDPVvZa7pvTI72fn/fTgxA//6u+irqqx+WqZVeRuATkTc2rj3zDrLZEfhqpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fpC6RQOpnzJQVLctOpzcW5VIBtHGoamFOEp+usLZuM=;
 b=LkYlXk1zSP240XmFgBwesSRd/2Nc61OrAj11ItGS+1Hrfqgx5tI103Kwfhk+s8RueYhjzZjVKYnccksbIw7x18vyvT4nItR6ThPy9dAlVk50+eZu1WikqIoOq54yIoYTVaqavkuM2PeT242iQDDdygxcD3LlU7iED45ezjZXd+4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5963.eurprd02.prod.outlook.com (2603:10a6:10:fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 09:29:50 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 09:29:50 +0000
Subject: Re: [RESEND PATCH v3 2/2] i2c: i2c-mux-gpio: Enable this driver in
 ACPI land
To:     Wolfram Sang <wsa@kernel.org>, Evan Green <evgreen@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201118234025.376412-1-evgreen@chromium.org>
 <20201118153951.RESEND.v3.2.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
 <CAHp75VdtwyCj7emc7Bk87q7kMQA0sSX81-aK-fMq4qTfTF-c_g@mail.gmail.com>
 <CAE=gft4OW7_pWfco4+kY65tbUGUDzXXDfsVMCP8MN93inVem4A@mail.gmail.com>
 <20210105102505.GG2000@ninjato>
 <CAE=gft42nQECU9Sn9yC-o8+VE9EDoRgLmqVR0Uwma+vBTiEh-Q@mail.gmail.com>
 <20210114195330.GA16693@kunai>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <6fd88320-740e-2fd6-8823-500032d0e541@axentia.se>
Date:   Fri, 15 Jan 2021 10:29:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210114195330.GA16693@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0360.eurprd05.prod.outlook.com
 (2603:10a6:7:94::19) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR05CA0360.eurprd05.prod.outlook.com (2603:10a6:7:94::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Fri, 15 Jan 2021 09:29:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b92a8f15-5063-4607-60bf-08d8b9381b4f
X-MS-TrafficTypeDiagnostic: DB8PR02MB5963:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5963F987AEAAF660DD2EA07CBCA70@DB8PR02MB5963.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u71hx2pSD+dYd4WYBFk/CKpecvxl3PCEwpOOmuX3GzkJ51e+ETTSPkmxhXtlCEJbbaGS0mGU4/Idi32fbYgQlv7KOgeu/nAxRh6ApA4JVFu2CEfjU6hPT1pnnUntsKN8X58iLcuJNjWIuUjRr9czhM59JAVOgXSjzOvUc5TTuCKyHcVbQcJd1VlepMc6eCAEJhsmGkl58AOq84l1g4g/CSr/pPQBsME8vH5DtoLyInXJ4W6Igyu6Aqa0XAuBJvt/idvavBBZHQ2Os3l8D34KyJ2Uq7mOYWqetykUA4qYnE8MY3PCEugLStkN+vFjhcD/i06o7+Hgt/7MVWeWDhFbGycF36wXKtbFnjooZlPt3++mGu/2n0R3BMNCncXSj610XXUDGlXyVELTV4uit69kGFJ3ldxNbUlZ31BZqfpwroJCdDkoF6n+FxxhX0Tu+gJHWsZDRTFwOSe4cGOTBY5MeJRHYQ4wMRYbznvOC3fMXdkURdlhPX+8hht+jEIdc9gSA+ikFJ9M15aLjKeVvCcfH32D8aWZNKsw0STCSGB9M3UPPk3suLIn6emAcE9jJ0LHmuyq+OP8F5QRJ/mstoLgXy+N7iaPu5dxWZkHzFOJzec=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(396003)(366004)(39830400003)(956004)(110136005)(86362001)(8936002)(16576012)(316002)(2616005)(6486002)(16526019)(6666004)(5660300002)(66946007)(31686004)(36756003)(66476007)(36916002)(2906002)(66556008)(8676002)(31696002)(186003)(53546011)(478600001)(83380400001)(26005)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?lTzDRdtwUcc/Ptus2JePSLPvrlnHvPmqW4mlhMDb91MtpYDkh41a0b7e?=
 =?Windows-1252?Q?7utMo0ik7nlr2AnAepRUhCd/xbXQidUgXETG0YqN4HjxqFgpzWD8BrFt?=
 =?Windows-1252?Q?cd1UeLaUO3y93k2A8iXYJPwk4rJZe3RddKpyLNdPlVLY56RUzk8ZRASN?=
 =?Windows-1252?Q?zq30OjpTPdamxxs/Sx0S7/DbCd2QF2l7PTuvtp8q2JyXwnEOdYMNFPYK?=
 =?Windows-1252?Q?yMTzx90Sp/KDF28JTrrnMr7szg7LLfJhswlxAg+oqAkoJCv1Sf8WpgTw?=
 =?Windows-1252?Q?xfY9tlxnTwsqSYyOIaLQuFYa/pdmi+fxDSHKKDrPHKDRqhqBNHHmpRO+?=
 =?Windows-1252?Q?nnl/mV+QmYj3SVUhn0Bq4saUb0b92mnTCMLUcIrQ1PuPvlutsNUTLZ+N?=
 =?Windows-1252?Q?gg06YJvlYZlT+qKAx+xrcxqMupt/ArwQFEoIadiAsCmTFnMLzHBOIzd/?=
 =?Windows-1252?Q?P5j7czmc/vvTDM/vX+k2T0+mJg6e9yDqWkcONH19u352ehtTlhu9L3Ke?=
 =?Windows-1252?Q?eu3BPNOlbw/r/DqgBOt2fNKLe/xIG82Mdl8KLa+oMLtQLj6fIp5sG23e?=
 =?Windows-1252?Q?F1zw/tWtNBiUgP6jBweC+EIc5IMIffV5wVIp/9lpklONqMTuQwgNADto?=
 =?Windows-1252?Q?ggP0ZhdorxZCgCePT4bqSJjgy/D6UJnQKNa9MI2gszRwePcj4yh+vGsV?=
 =?Windows-1252?Q?3aXMrYtcF+H1BWfezbWqZ6xyrzF0Ni+hoJzHU6CHG1tWzQ0nt7QZWFnX?=
 =?Windows-1252?Q?CSsyXAhArc9B9db2o3bsg/u5TiiReFdeRTWjcwTZ17EaCRjSqIoiSXjb?=
 =?Windows-1252?Q?QXRAi6yxZarEClFmpDEGcRMZpXJ+yZl6MCZDqg0b7rZzXz8MbSrX8Sqx?=
 =?Windows-1252?Q?JEgjzaepq+Ciy5iAWEv7l53MoxlDbfBmdceS6k1s9gQ83Ol2scCF8Mtv?=
 =?Windows-1252?Q?2XqTGjcN7cShbi+LJtnearxbJl3jWoLO6RmYPeB6vGux5Xg+bnqhhF2d?=
 =?Windows-1252?Q?MaQayVLTL2xzqBZH0+/E/EJZ041EFLOKGMEdEC8QNowkmWm4lSd1jJb6?=
 =?Windows-1252?Q?QlUU1azkC1L+vVey?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b92a8f15-5063-4607-60bf-08d8b9381b4f
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 09:29:50.3007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkcD3oUVqwx7FW656fgUfqC9yDzOvN2kCZrM2JaqzElgtVHeCTKEemoInVjav24+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5963
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-01-14 20:53, Wolfram Sang wrote:
>> Can this be accepted as-is, or should I resend?
> 
> Peter, can you have a look here as well?

I have no issues, but I was waiting for a response from Andy here. I have
little knowledge of ACPI, and have previously made ignorant mistakes in
that area. I would greatly appreciate Andy following through with his
line of thinking...

So, if we ignore Andys review comments, then:

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
