Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BE83141C7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 22:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235601AbhBHV3R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 16:29:17 -0500
Received: from mail-eopbgr130128.outbound.protection.outlook.com ([40.107.13.128]:10025
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236559AbhBHV2w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Feb 2021 16:28:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOb706TxYV/pjKWpYViF0lP/iqCN0dea/ZUHGJ4jJTtiw3Twea4w6ECPPee4KbXM1GsPkbc0cFT+lqsKuGqbKRDszX2iD5+LxaGFTRpI+iPsnhyn7f2DZ89U9o306m8DhhO7g/RlEoAowKf7VLcxxq8nnoSWVHAUWcerFoqy1Y7TudJmSMFN3qFZpSb/ypk6hKzpjuQW7Cz3p82f+q1FrnKCMMSxKX0d6NEL6ESbvAghEoQ4XvCDRES5+lhBju2si3Q3LQKVpc7KmgtC5Kj1PSaEZHd6Xw/RW4euJVqkCczHufvE7Ll1JE/z/H6nzdphD6e4lY6x+apvByP1T2L5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0m3TR6vSzRd6OuHp50T4gLCNhFhxr9YX+CErkayObw=;
 b=OBYW0vUL1BtXQL+ZvO9MfeD6Z0skox6baDsWVMmnGJtNewAHfYfIf5VunBv3qfLc8RG2Dz8ago7VY4A+q6HLq8QWJjYMF+DTm+nNvN3iO1mh87MEFZxAmV1q/vdtP6k1iIcsBbP4JxDI4FmW2wnBpNFYlzmQjDjXVYkilhNhL2i6wlrMdFgoRFAZZBLRiiO4FJITI3MFJ5GsaY/vRj5ehC2tqmPVMMzJ68Me4+IKksdtCB2qV93jHt9gX4weWX03dMSQP0BGNC2AQnzaxKGaIFOrotyFscozlRoLchPyquMhwJUWnOZ9TdDbeZTBS857hGRGiOLlhCYreRcw5kWWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0m3TR6vSzRd6OuHp50T4gLCNhFhxr9YX+CErkayObw=;
 b=EzOQMmAPTpSkWzAh4qsvZnEvXwzMgpTwTnNLCdWEQ74URW5Qgv5K9mpNr5ifmRBDXsNc8yV+8WZlmgfjTnQckPXMHd7eUrpxm3xFdWVbHUonpN5c+2ZnDjlFEdf4SbDpbY0JUaqyLvAb2SlfLuG8Njjawn+mgEfuI3jsRQRI2/M=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6245.eurprd02.prod.outlook.com (2603:10a6:10:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 21:27:17 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 21:27:17 +0000
Subject: Re: [PATCH i2c-next v5 5/6] i2c: mux: mlxcpld: Extend supported mux
 number
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210208201606.10620-1-vadimp@nvidia.com>
 <20210208201606.10620-6-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <1bf7cf31-200a-ea2e-3eee-5a681f4af3b7@axentia.se>
Date:   Mon, 8 Feb 2021 22:27:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210208201606.10620-6-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR0402CA0009.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::19) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR0402CA0009.eurprd04.prod.outlook.com (2603:10a6:3:d0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 21:27:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e53541f8-b6f3-49dd-4c2a-08d8cc784f2f
X-MS-TrafficTypeDiagnostic: DBAPR02MB6245:
X-Microsoft-Antispam-PRVS: <DBAPR02MB6245EF6C83E9EA7E8566AFFEBC8F9@DBAPR02MB6245.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AvZd5m1fSOnPNlA4S6A4xfhk16Y2TcdXGF+5La9BvIXE5me+XiD1iEVaYSLJPCgu3tqJnaLB8S0jhn5he1GjjfcYgJr1G2/5kz03aIRQLxVy3y5ClmAvZzxZ77k99aXgVGj60Ncwrs6So+l4bUWrNzKm2xQuScQVLsCIzjamV9Y/mZMKC4QwfV3zIfQCRh9KVmCtIxMybjO0JV3Qw/MGMR9Uu0f+aafiEj9CBXkPHWEysoh2nwTMscddrwZy+pyi4gMhfPWxhZGmcVrarg+5KpnP7lspvNFsd2QhCX/5wBxkVB4IfmiFEX+IU/Ml2hCpLvoikr/qjjf+Akchm9MJ1JD4BqOlCrwsgoU1/bvuzwF19EBuItz8+1HkHRnEPqg9v4sq/JfsxjgQ1eIYfRkVMHY0sASTJj3X+V9vw3D2nWUog3oerfS9WkUvR5V9MMupCiQr41owwgDO+01vjL1wjomyK5nHdGbJdgi8BokJvDeimxMIaproBdGv1Z69a3gvF0byRBnGWxGYFg+BphLL/Ac4C98ig8gs2rOGQQ9vGoKKI6eIAP8BekoJ3boiyLqDxq4QJXofv8yqul0UZeGwZaYIOu3ztNJZES0sMgGwI7t/ir3JONgmYXYMz8JUDJBqVfQhmWUTozQG2dGkzdDCeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39830400003)(36756003)(5660300002)(8936002)(16526019)(31696002)(83380400001)(6486002)(2906002)(31686004)(86362001)(316002)(16576012)(26005)(6666004)(4326008)(4744005)(2616005)(956004)(478600001)(186003)(53546011)(66946007)(66476007)(66556008)(8676002)(36916002)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SEZGY2FySFd5OTltbFdqazM3SGRib3EvTCt3V1Z4S2RQT1p4TGJQcUtOWmRU?=
 =?utf-8?B?V0FYQUlFUzRLSWRRTkFhNm1BcnlrRVpUUUFhMy95eXpZVUpVdVViYUtyZHQ4?=
 =?utf-8?B?Tmlnak9QY0tpV0JFekR1NUF0enlNTnBUaGJ6TTV2R0FRaEtWcTlkcHBXOGo5?=
 =?utf-8?B?cUxSaTdmVmNFclpUd1RMRmxaV1p5c3RFT2ZPbHdWSlJVa3dQQWVsRGMyT3Q1?=
 =?utf-8?B?ZzFvMklLS2NacVN2TkQwRHVFYVQwZGI4YXhCa3FuME1wWHloMlhtN2crbTFK?=
 =?utf-8?B?ZjJ1U3hJV2NVek44TXpObUFCZkdOZXJvR254ZTQrb2tueDV4VGY0OW1lL1Nz?=
 =?utf-8?B?cHYzak1yYXZSWHc2Vi9ISlVzandIWGxJQTdTMUtZek91Yy93Q3gwZnpYVkkz?=
 =?utf-8?B?aS9iOWFrWEFJL2V3eHQ5QmNNa1N2MEQvZ3lkY3drUnZwUGVOSzNSR2dhV3F5?=
 =?utf-8?B?NzQyQVpHd3YwQlMzZlcxdWg5MlRhWmlQQVFvekhkL0kvOW0wREhxQWVMQ1J3?=
 =?utf-8?B?SzdZekhNZzNZWEQ1Y0hlRnc5U1BSS0pTNWUwSHRHQitUQytpaTk3VWxRV1Fl?=
 =?utf-8?B?MmtMMzlkMVJxOE05SERyWDJ0WUpxYjAzL3pMYmZWM3Ayb3VRZmFaT1VpcUtL?=
 =?utf-8?B?ZzR6SElmQUNUbGxVWWtDT0J1d1pjRnlZbTdqM0VaTVNaM0s4S2gvalVSRUgx?=
 =?utf-8?B?bUlFN0ZrbXl1SkUwTlRuZU5CNjI1djdTN3NsRzVUQWI3dEU0V01BdXJ2VVdR?=
 =?utf-8?B?QlRuRzl6eW9Lc3pXMllPZzUwV3pOeHRnUHJKaXFFYkt2UTNyNHdRYk5mRkMx?=
 =?utf-8?B?SXZxZ08xTEdpeVZ6aGpCM3JqM043TlNCMkpUSnpXVDB1RjcydDU1dzhtQTBh?=
 =?utf-8?B?eGJxb1R5SWMyd3FyMmNxNVZQZTVNN1IvdE1yMUFubkRNNUpmdHVyUkVoSzha?=
 =?utf-8?B?MEdSTmVjbkRXYjRPUUFiL3dBRTFhZlJ1WTBSUExSblRvQkZoaC9COEhPUDFp?=
 =?utf-8?B?RkoybVZoNTkzN3MzQXNqTCtMY1lYQzZ6ZGFpL3k2NmxjVTZHQ0xXeDlzZWRE?=
 =?utf-8?B?aWJUak9UMmdZRzFmQ0VibHVuVzVUZ1NOalhKSytWNmwxbUNXOVE1S0ZkSXk1?=
 =?utf-8?B?VmJhN2lSZDJGdkFNRXRYNHJkSGtyL2J3MEp2Yk9wckxjL1VGTWtwckZINnM0?=
 =?utf-8?B?WEFRS2sxSVJGN1g0NUZxejAxU0tXZUR1Q25FUkFzU3pBTERINWpwWHJvMFY3?=
 =?utf-8?B?emFYRFhGbzFaN0lvck1kN2J4SDc2QzByWkhHUnRqcnNGNmxqWHlybFkyNzZI?=
 =?utf-8?B?Z0lhdnhuWjQ3cTVZMks2RVRpRzJxV1l1L2NVN2cyY0RMVFByZnVCWFV0VU5u?=
 =?utf-8?B?TCs5a0kvb0NhcFloYjAxdjVVdHhIaExmMHNOTnNyNm9TUHpWM25oS0RaZjZh?=
 =?utf-8?B?SU1KVDYybk1rWEJoaDVpaEhSUTRQSnFuaDNKeGVlMVg1bDBQTGMzaWJKQm5E?=
 =?utf-8?B?VWJldU4rUUcrL2JCVTJlM0QyYWhienhxbWUxQlVscTY1ZlQrSHJ3TG5GODcx?=
 =?utf-8?B?QzdPcUZXN0hKZ2Vodi9xNTRkeFBQRkhKY1BLYTJhcE9GRHl0QVphdXVjdC9H?=
 =?utf-8?B?VWNURWs3MFJ2WmlXQndaeXBvQUFETlkyUzJtU3JqZUY0aEhxQW9oUTZOZmtE?=
 =?utf-8?B?ZGFENEwyeGp2YzFYQWh0LzBGVXZxVjRXOEpPb2l1WHFiMDg3NnNNamJaYW9P?=
 =?utf-8?Q?acMeGCJl4tPSLcFFUXjadIeKdhut5d1nZmZYoge?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e53541f8-b6f3-49dd-4c2a-08d8cc784f2f
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 21:27:17.1445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40A+yuoYa4vWFyERt8dJw6CzYi3ypxNM6BNut8BS2kN8wYHGPT8oI1/1AOyd8E7I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6245
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-02-08 21:16, Vadim Pasternak wrote:
> Allow to extend mux number supported by driver.
> Currently it is limited by eight, which is not enough for new coming
> Mellanox modular system with line cards, which require up to 64 mux
> support.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>

Acked-by: Peter Rosin <peda@axentia.se>

