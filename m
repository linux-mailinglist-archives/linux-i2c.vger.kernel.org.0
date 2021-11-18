Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E036145584A
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 10:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245289AbhKRJxe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 04:53:34 -0500
Received: from mail-eopbgr30093.outbound.protection.outlook.com ([40.107.3.93]:44942
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245293AbhKRJxG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Nov 2021 04:53:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqJj26F+N+6QdiDrtfUSGOSGbo+XhFczLV233HAwX6Kp7NR7+BZESfRtzY3H3x0ncfMtYmYx4hfexlXg/Wegl7gxS+r5UxuQI6JtaNt7cz2W5JM445L0y7kkhcKgig0iDIrGN1v4nh1maoDoX1Qp/mG1ee6a2ZaemqPIppBRY10R9ZS335APTgtAW73sPR7VDkzHw2OgcqKtq7tLZfdXDKBG4wx08sg8Uhcy0Lcg0b3dKGeky+88xnBhaGSISsP0ZhpCnQyHj+bHkY9y054gDIr1pcZXz/5ir3CwRAQMKTgFAhUvGGxMxu2Suyi8/l6Ia/5Mj/AS3YgRhkXt9mgl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRGiPdhTCbSfvD3JZkuu48TebwKTstnEiOr+Ie6sPok=;
 b=QHafre6UXA6wk37nItWCHWvZuWSkMJdyhau9PFb/QjfopGkWoatvKzGw+vqIkfAbXBJQiufM9ylNfKnuJioLGMj9wd8lH9BdutT8Du46ccaF8EGLize9kx/1UpM8IoAiySUs46NFtYMFCCgbwpEgYdiJBI6B/+oH9FxGRb+kJFCr33hyUF8EqwYoNe9xBUUgHyPELp97/znSF+CTiB07pFJg7cKIOsTkjIcc9xTev+OJI/qcIZAeM/Ejnfstt9OXm2Q6jSYhod77yiaB6pm6kl416VaczLQLoUS28LWHRctFgzQXcDcLbHjcV9obykVMOYIbWjYhNnr+CvK9RY93sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRGiPdhTCbSfvD3JZkuu48TebwKTstnEiOr+Ie6sPok=;
 b=XWuz16uhiJcGtuXcXq0c9GecEq0FflvNTmRjAhzL3yhjGwskcsPgnrgNDQHtNlZt7NsHBJ15UXBp05wmWHzV7YWAJDICZzdElDTqhc6n1q9iYR8GDFRT/AlG0BWDB+spZ0ynZXBN5re8fWHFM4pdg3OVCKrtCwcDKvDjNNwK6e8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR02MB3063.eurprd02.prod.outlook.com (2603:10a6:6:1d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 09:50:00 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 09:50:00 +0000
Message-ID: <c471b53e-2999-0b81-da93-d764f840ce4f@axentia.se>
Date:   Thu, 18 Nov 2021 10:49:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 3/3] i2c: mux: gpio: Use array_size() helper
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
 <20211115154201.46579-3-andriy.shevchenko@linux.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20211115154201.46579-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0059.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::12) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by GV3P280CA0059.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend Transport; Thu, 18 Nov 2021 09:49:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2dd064d-6f42-479e-9664-08d9aa78c984
X-MS-TrafficTypeDiagnostic: DB6PR02MB3063:
X-Microsoft-Antispam-PRVS: <DB6PR02MB30636C92E2661D619BCF4C50BC9B9@DB6PR02MB3063.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ndDJRuNjRn20gCnZmZ0mnN8ElfSRduI3y1Osc+AHd93i8YnE+8xCtMiWS1FAM1Bl2+zDkoxXJpBGUGt6N/3fqw/cr7EsWaILO7+Q0D6+/rwiNQFDwtYEd/UPiNNLBTBdMijr5wX5tTEzli5fokyZAxrXNsJP26CMheQxM67ER3dKlPBzA+j6PYJBIcZR7f+p+j71JzajNbOoWGZIGQDr0IQGb+emQ5gbzji6euxmfJaJZjDFFeapct1vDsLeq9nofT9wJMVyWy6vhX9vku3nh9o7gipjsN+/U61vZD5TUCg4AtWKIEqVl0nATM0QpXqJeysxEbLp0/CumLUYB32pArnbu1q9NCpA0yUBuKTlHszuPR0RkB8bijZxUlVPAk0At2lY7/CMdxy7FLd0t1r7mnKR/dr2ah4xqKP2ZUNyHynFxzR1iYQbWp819q/IjMg1U8h4cDZyUGdhROhErTTfzD826uFsTVoup73ZPatPFmD7Z9XdTg5yA2FJEkBXz95cfmOA9Pf/OhlJKKuipqRPt45+LONYdVgJyEvywojONyFCcNAfjGpX0FER2fSz9V+qVtdiTcAmQth9uzol44oxBWOnhvW73mctKFrsfrJrBli+Lkl0AvrgMjfE9Sw0f8uh69EmSZD/WNwi/OanMAMrxRm227eXbdw19e5/WRaGFOtLxMZ/jSnT+QhEGWmv55vt0Uu2p4aTA6nguxNy/CpOpw0UrmgUyvZHp4vf7EzDU28=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(346002)(39830400003)(66946007)(66556008)(4326008)(66476007)(31696002)(16576012)(26005)(110136005)(558084003)(53546011)(2906002)(36916002)(86362001)(956004)(508600001)(5660300002)(2616005)(31686004)(4001150100001)(8676002)(38100700002)(6486002)(186003)(36756003)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkpZSVJXQmNsK21qQzB1S1AyY21idDdXZW05KzFNMklRKzZRR2Q3V040MElJ?=
 =?utf-8?B?b1pkdlkzQ21SMlBpR2dLZ1dhSnB2QU9VUFMvWktEQVhjUmRPL3JQSTZtTzdY?=
 =?utf-8?B?dmZicWVRYktVRDFOaURua2o1d2poUXlDSXNrQTZWdXFrL1V4ZWZDVG9zeUVD?=
 =?utf-8?B?NENJZDlXQ2FQRGhFQWFTaDhjT1N3QUt1U2hnOHI1WXRGV09vK2M5YXA4V0Iz?=
 =?utf-8?B?OFpXSUYwVUlXUzNHcVBZK05BekV5dU1YSFZQWVB6OVZ5L1hrQnRBTHNPWFRH?=
 =?utf-8?B?dGpwSW9sN2k3S0hSZlJpUFk2a2ZSckJGZVQ2cG5HNlJUTmJHL3dZeGp6RExl?=
 =?utf-8?B?ZUJWcElOd09jMTZFdnRJOUJkeUFrS2tEV3FiSUw0SlRuSEhBOThOemIzdmgy?=
 =?utf-8?B?S0pNVWw4TGwreVZPSEh3b0p2Y2xzc3FxRnhkR0N6cnF6V2J0NWFDcmIvNlBV?=
 =?utf-8?B?NFF4OWF5VzZ6Rk5GVzRPbEtHdHBNdmpUWTQybFM5Uk95a3ZiQWw3dU55N1d2?=
 =?utf-8?B?SWVtTUZJVVNOQ3VUV2ptTDRqQkdvYnZJTGliMGpmMHpVdmRqOVhtQWduSThK?=
 =?utf-8?B?b2Z0REJzWXFXMjR3cjFrMnhIT1pMcWo0VTdCajlQRWpUT1V2bm1YanIrL1Q5?=
 =?utf-8?B?MjhldU1BYVgzTlJSTUpXa2lzcWdCUXE5aGFrN2R1SDM2SThOM0o5SkJpVVNU?=
 =?utf-8?B?Nm5kNGVnYTVyMGxwU0ZnZDErSVNveEsvVUlsV0trM092OXBqT2dsdWVURVd1?=
 =?utf-8?B?UHdBVVV3YlEwM0V5dTlzcXZ4ajNTVDk1c21hR0dJMzRuWDFjVzBZYTMyRnJE?=
 =?utf-8?B?bVF0dDFKWWlBQUxpNVFTSTZ2dGJ6aGdxdkVKQ0QxVlI1TGxneHlxRVhaUitN?=
 =?utf-8?B?NnpXbkpuSnZ2aThqTWltSEFkdjRNSmRBQ0FjQWlTcHFUcWl5NkZtYnV2eXdo?=
 =?utf-8?B?cWFEdjlnMlAvNmQxcG0rUTVjMHd3a3RRdE9FeU9NS1ExWDNlckg1dzBjT29M?=
 =?utf-8?B?cXBjcEo3UjBoZ2dqTWw5ZjlzaHhmVUdPbnlWRzZZcEx4clZJYUpnSW50MHJ6?=
 =?utf-8?B?M05HZzRwdFpvcy8xNmdKbVNQZEo1NzRPaUdBN2hES3ZYNGsxRkV1NkR0ZUU0?=
 =?utf-8?B?QzBXRFRWak54Y2dxWTlEdXlDVkdqSXZ5dm1XOHBLSHJoK2UxYnZidzcxZEFh?=
 =?utf-8?B?Tm9CYmtrcTdkZGI4ODVsUTd4bzhuZnNQSGR4WUJDQThkUHIxYWtCVHJHdUYy?=
 =?utf-8?B?T3ZiRnFOSXYybFNadmxyeFdaU2IvcUNjNlVLdFpsd0JaM1JqQy92R2RqcDl4?=
 =?utf-8?B?VUFKTUFuU3lKS0IrRzdBWGxzYnhlVjIvdlB1UXJ0U0s2aEpIOERzUzFtSXkx?=
 =?utf-8?B?RHhKSnJweHpSbzI2MXRlY0VpZk1rNlhGaVJnTnl0ZnBHbjB0QkwzZlRWZENQ?=
 =?utf-8?B?ZlJja0ZYZTBlemdDMkprUjREdk1ZK0hlbUVBRUJPS2hwWHBzWE5DQWEvZEsv?=
 =?utf-8?B?elk3Vnl0cEZPbVY5S2VzQkdHaHdLT2hxSWJQM3o3eXNxSFcvVzFPeGNmYUV0?=
 =?utf-8?B?alNROHN2NEh5RlJFdXdxcklDM0xic01wVnpNU0wyQXE2Q3hsdFdKTUIvMjVU?=
 =?utf-8?B?anVWbysvYXhTd2V3NWFka0ZPSkxTZTlBMFlSWHF6WnB6UDJhZWRLc0NKZTYz?=
 =?utf-8?B?WFRKU3MvL0dKRVZQK0ltVk5xRnRieWJQWHpuNW5lcG1oNHRJeUpxOExyVGpD?=
 =?utf-8?B?aFZqdXVtQ3lxNUViOW03bXRHMEVWNmRPOG00Vmhsc3dtVERLRStnSXJiT2Rl?=
 =?utf-8?B?aTRNTmtOc3dUUW9xSlNJNDlxWnkwTENDY2laYytHeVk5c3RxV0N2RkE3MjYy?=
 =?utf-8?B?U25YaW95NU9GVHQ2U3l5VHdjU1pZTkxCdk1DMjkwUVFKdGpXS1Vla0h2aFR1?=
 =?utf-8?B?VXdnTkg0ajl5TGd4MmtDemgxVVZtN2lTYUdTaHZqWWYxaXpvV0s4ZERiWExC?=
 =?utf-8?B?c005dFBGd1JsSCtRb3pHNWhYWC9FN29nZjR6VzlPVUthRzM1K3EwbEx1SG5U?=
 =?utf-8?B?cWxnbjhZbTdWNklJWjVmcFZKbFZZL25qTU15Slp6dG82WWRSTnkzajBxZGhw?=
 =?utf-8?Q?VyY4=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f2dd064d-6f42-479e-9664-08d9aa78c984
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:50:00.6191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5kVCNpHEamDcoO93SmgUO6iD0d/QHm1hkAM4oTGaQImjO8L/owUhDZZ25qjkAwP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3063
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-11-15 16:42, Andy Shevchenko wrote:
> Use array_size() helper to aid in 2-factor allocation instances.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

