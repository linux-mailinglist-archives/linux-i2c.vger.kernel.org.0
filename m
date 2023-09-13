Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92BEC79F567
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 01:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbjIMXWR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 19:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbjIMXWQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 19:22:16 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2133.outbound.protection.outlook.com [40.107.244.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3E41BCB;
        Wed, 13 Sep 2023 16:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyZTaQcUcg9wNXda5WSEYETb92XrARV9ZPCDdEUB10/ZF15felW/mprnKOkH2QbKPwrgekVzgheSurHyUcyXQs430oP8cu0yXVsU7ssVyfnEDF+M+YftZeAk7Xt8ZF1xk+KlIncosUnKMpKrY7TcgV3kbdVY5OwdK6fRBjU7I/Vu9z2oQwy41Utj2kJ17TwUghH3cYr3kZZGfpq3b+XGP2auNtJILgCKqgAx4OWkLw3Y+K3PLA4esA8/JXkBn1OLjOfJQG7NBxfWVBVZE2ytnPGP2a/fRi+pd92qG0QnLb/dU2pGn+ATvo6vhPRlWhLWWxnuyprMBTsvRQ3U1d2W0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qi0gqrSJ0pyAC4NzKr+EzJvSrRo2RezDe4X6c6QZBC8=;
 b=TcykekaLYlIX/7rr80hZBavdRIrg+jwtlmgUrJrQteqv/Ml5HNS3aOzRVxQc6AZn2btDeK4+tJ/7tcH82RhHCRB0fa6hfEdrKk3qWf6dtXlGxj4ntxJswrdPQwNW079Y47e42u4aUwNwRRwhGf7UeNG/KUSnwoY5enQ6FU9cfZXzxj5IBEFuGCb1wzzGty9C8krbc0XVXf6Qa++v7OY5CrsMMBe6J3SE02riMfKKNkWH4MMf663RBfLi0JzMYFZ2830YLfcmYsN2LxDJMpWVizhj02no540XwLogfC0HBA6RIpR8+b/WyCTcrA2Q+m467tQSI8FqFTSCLF4S6YA1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi0gqrSJ0pyAC4NzKr+EzJvSrRo2RezDe4X6c6QZBC8=;
 b=kmc0ROccBxWQBkr9BlhJRUotTEulQYrWR+BNOwirr8CL4nJe0NpvMSABbcoztLP3bSq6wD5k+FCvBZY/033atKirg8V5DUOeHErM1VOQmwCrfYUAmxeQZm/J4Bn8OaSkFFUoqG7X9g8aBlSd7EPFpQ5h5BzyeUYEvsI1E12uD5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 SA3PR01MB7985.prod.exchangelabs.com (2603:10b6:806:311::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.35; Wed, 13 Sep 2023 23:22:09 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 23:22:08 +0000
Message-ID: <5e277c43-07de-4606-a947-01708a896c74@os.amperecomputing.com>
Date:   Wed, 13 Sep 2023 16:22:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230913224602.420279-1-janb@os.amperecomputing.com>
From:   Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <20230913224602.420279-1-janb@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:610:4e::16) To DM6PR01MB4044.prod.exchangelabs.com
 (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|SA3PR01MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: cc55d82f-480f-450a-3032-08dbb4b03fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vKyWeQHmqFT5b1UoYXCUud0xY34wBQc778URXh9bCUXUQHOTlMJ5rioeiPtvUtIjAGAFGQJ4CofyWFY3NrLW7cNelTPkU0OT2MuX/PI2fYmY4LOal3PK9WU3KHd+UxHrn1o5KtTHhq2k8UJd7G8N9mMgbVq+LOslmVaqMgXWyNOTbiroypg9+xvPIa6yV4WUPv4j5jIUHyBpLKj8rlIv5+f2QeBSfalOuOljbl3q8MRa4OuwDDcCUlFQtqHyUWjF6qpQfs5eFPoRZ5qoqwUljJEHFpihDUm220UuvOY7lTDxeZFiIzNsrPEkMt+XnIYBOtuPU/uiud+HuYBZbj3yHZa0bt67RZbI1S0548mWyvJq951Phhd2iEmJ8apUeGwOxpzDbMR0K3ToQBq4U801rLtbFTmnO8h9Fc4ifDDrYqC8zD3vmqeMW/9gOoF8SaarP5aIp1WP+wloPx17WKHWggL+CbpmGIsRcLqyoAtCaakEH8ieNcQNhdVKkIfhhFipV/6V8lQnLXs5Uozzg/9yN11Q16IDc1xnD3oyDw0vNXD1coq473JuFntDy/8EGeZ+YTEgDDedOGjwkqeZV/2LxLPwF3UFHknuJo56m8ApzEgsJtntM2Y847WoyfvSm4im
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39850400004)(186009)(1800799009)(451199024)(31686004)(8676002)(66556008)(4326008)(5660300002)(2906002)(38100700002)(31696002)(558084003)(86362001)(6666004)(478600001)(8936002)(66476007)(83380400001)(316002)(66946007)(41300700001)(2616005)(6512007)(6506007)(26005)(6486002)(110136005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDRCa1BUenNOMGFrNGxNV3Ntd0hTczZ6amxMRGUybGVYRWxydXNUYnkyWGh5?=
 =?utf-8?B?NjFyRWNLWHVhQjNOWHB6K09QcC8wcHlKVkUxMjI1YVhONjlTU0djQ1FVVWlG?=
 =?utf-8?B?bWRqV210ZHBmNFdNQTVaMk1sQVUveEk5NmhjRlk2VWxucmJhN1hQdFlMZklH?=
 =?utf-8?B?N0lpLzVrNUU1Kyt4US84Q3k0ZStKelR4ZE9yYVNUQXJaeDJJODJVWlcwOHBS?=
 =?utf-8?B?QzFIYnljbUcyY2R1R2ZBQlErU055SHdqZzFMRk56b2dKb0pKZFI3UWpWQnNz?=
 =?utf-8?B?anRZdk8yMTk2UUFGYm5KRElJT0lFL1pqdXZza0x6cFFiZ2poVkdtNnVkQkhh?=
 =?utf-8?B?YjgvSXdDRi9mZXU4RWlXRmlkR1dDREg5Z0FrOFJ5VE9wNzY5UmQ3dXJ5aVV4?=
 =?utf-8?B?eVcwQmQzODk2b0FobzdLZWU0QTZHNU5wZ3dkRHVaTEpSU29naURwaUtlQkhL?=
 =?utf-8?B?RXkyQWpNSWhCS0orSXR4aGdZWmtoelRaZGtwV2dobXFrTW1PTVFiZEl4ajEy?=
 =?utf-8?B?K0VOR0ZESHJqcURRKzdzblk5NHprVUR0UHlGdU1vU0R2bWhMdVVYQkNtWlQr?=
 =?utf-8?B?VDBGaDJEdk5xQ3ZjaTBoRCtBWHh2UzZVUlBKTExCRlMzWUl1SkZLU2QrcFZE?=
 =?utf-8?B?M09KWnJuOEZra2I5bXVvU3ZMNkUyUHowSmRzNWRPSnRUczFtendtK0pmanJo?=
 =?utf-8?B?R1AzZEpWQU5Xd1F1L2pueXlsY3Rmelk4d0Q5eWwwRHpNMXQxMWRldWJQUmxS?=
 =?utf-8?B?VDV4MElITXNhSGZRNWZUQXFZTjh5REoxMyt0NnJQN09IOVV4YXdjS1JPQkJl?=
 =?utf-8?B?ZEFCK1krWk1UTWhuRlJkbEhKczliNTFUaWhYc1BZczVuUS9kRDF3RWlzbUNj?=
 =?utf-8?B?QjNhNXNSdk1CWFYyUGErZEJmN0FkeVp3VHBkM21IODFNT2dxRWNVZzhJb0Zw?=
 =?utf-8?B?N0dLbW9NRjBBVUxVTnpDV2c5OCs4L3pMQURXaG96OUZlUkN0L1h6QTNwSWVK?=
 =?utf-8?B?VHRiU3pLWVdsQ0lUSjFWTmo4RWZyS2pCaXRYS3FOVlNvS29pUWJKRHgxVjh2?=
 =?utf-8?B?OXUzSzlPWmdlZlNQc1BoQWlRbVYwMHpBanhqTXhqU0YwaTJlUnNERGlnanYv?=
 =?utf-8?B?VDY3QU00TzgvUmVxeEQzc3VYa2x6dGJCZ2Vqa1p1Rm84SCt0SDVrR2VYc3hZ?=
 =?utf-8?B?MmpCY2ZmT290ZUxITXMyRGplTGczSUlXbjQvMWhLYkJWaGY5eFAzMFNPbFcz?=
 =?utf-8?B?MkkvcVlXd2F4WExPV08rMm1MU1ZLZGpYL0IyWW9nMFQ2VHFqOFJuNkxSNG9Q?=
 =?utf-8?B?UFBxeExyUUYzNDBVNEpHRnVXQlU5UHU3SEw4M1ovcW4ybklqMEFTcEJ3S1dm?=
 =?utf-8?B?VGN3dGg2UmFPaXdlQUpGaitMSnVYaGd4aTVuTVpKeGVlNUl3L0ErSVFvV3FJ?=
 =?utf-8?B?ZlFrbEpQdGE3TjJFTlRTZFBsZFR5YW9jT1lsNFdGOUpRZmF2OXFqSFhzZDll?=
 =?utf-8?B?TUcyV3Bud1NUMU5jT2NpTVcxYko5Ry9NV3NZOGdrREhuY2NhOVBOVEFvQXRC?=
 =?utf-8?B?MFVDU25vb0pOTzVhWCtWNEZnYUtmaFJ3SVdrZGpRdEQxSUtaV0lhb2hBaGNJ?=
 =?utf-8?B?djh2R1NwdFNhY2tvTG51ZmZaNGNYSEpIRkhYZHpPUDZHeFFZbGNYYlN6azcr?=
 =?utf-8?B?b0tBMnQ1eGdQaUpkbnFQVmJRRmNad1lXVG1EYVAzVFgrSWIwWDRENGM4M0pv?=
 =?utf-8?B?SnU4Z2c2emFHNVo4QmNmK0k2U1pKV0FiZy94UTJBSzNMUTlXTm9zUURuRmd5?=
 =?utf-8?B?U0FlaUlYOGxqY29NQmszN1FVWW00YURaSW83YU9GeHZRV3dQL1hTWjJyZTBn?=
 =?utf-8?B?ZHlCbU1XNFMyNWFFY3NqcUNRMGFTSXFYMERyUlpCaHJTMkVSamVRUitIUlRh?=
 =?utf-8?B?OEdLWVhwYVpOa09PQ210ZjhLZUNzNkk1TWdNelgwK0tpNmNiTENFWU5Zd20r?=
 =?utf-8?B?V1kwcjBKQ1czdjJ2VVNXSUNVZlZzYzd5enEwbFZ6WHNmWXJlM0hnT0s1Ymtx?=
 =?utf-8?B?MGZWWFJ2RG9rQ2g3aWl6YnFmV2kvMEdwZStLQnZXYmY4cEZOVEpVa3lZMlc1?=
 =?utf-8?B?QjFNRlZ3VU96UFYzTGFrTWtqeW03dEo1N2pnTUFjNXo3THdZTGJMdnYwdU80?=
 =?utf-8?Q?EnDDgpDaFLbzRjymwB99688=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc55d82f-480f-450a-3032-08dbb4b03fc6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 23:22:08.3061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQrs0QpneA6cbGLlrpGnRhWTaZTaf0F9XpIFe1Ab8gyNSSAWavHPLWHbo4YiqppcSfjsEuNkpva72L1bIcNIbMv9+aSx1f7SXuUshkBranU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB7985
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Sorry, I slightly fumbled the updated message. It should have been v2 
not 2/2 and included the review/tested info. I'll send a corrected one.

My Apologies
Jan

