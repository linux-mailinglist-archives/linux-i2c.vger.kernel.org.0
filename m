Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641DD3141BC
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 22:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbhBHV2J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 16:28:09 -0500
Received: from mail-eopbgr60107.outbound.protection.outlook.com ([40.107.6.107]:28875
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236589AbhBHV1z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Feb 2021 16:27:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bic31viX9gRs9MtlSlFrx7cikLvZjy0Zvgfj8I7BOORgMfiC/pSu9v3W/sSQ4sgSmR/THEVwSupvqZXUmTaMGovTjwBhVmPqpHNoONRpZB9xMEqr2cHd3FZxax5anDIRZ3+4ng+yjuJsIAQPje+Qc2CgHhylyvA0VCQK0FA9uv9a/K9RRqR/KQ+AO22wCzU6+NPa2jvvhF0k15UrBVKSnlt9j0LuuQHRLFURvMPxUJxO+nEOR/hvgi5yaR/A4pT7Gh0bcOL1Wo9dofodByMsuIYU63+9f8vupPU8Xf7X6edol/Jb0IcBuVEzoVuyefBsrqD2gwg5gNZO98/5rr09Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp9K2o1YIJCxr5VORhrM5Fxd5AZlvd2L8CaFaZexCq4=;
 b=by2nXgu3AEOLBcLuzS91V0iQky21+oY5nUbivwwbe1hlTm6VC0rgl9WCLEmWqOh6gDYuBcyAXVQbRV3bl9kkrgK1CQQsXo6TYHoFSJiPFpLlz8l7oZhv+f5vNY9AzUuQ3TofAKCtdlgkeer6x7cHFfi+7YiY3Y2Mtx6jgEBG96xr17HdRiy1KPY2xjaTRWFEGJFcV7/Vj4qoYcQ5wKk3TkKJiZLmIm0axgJfeXokUCvYyvGNjv5UFEiV6ul8CagnwWj9LiZnuet17iPQoZxgNKCyXN4VSDetaqX2EQXP4pdI7W0Gl5DSgS7vTPvCMPT/5hBRO8yUsA1WftWQdd7Wjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp9K2o1YIJCxr5VORhrM5Fxd5AZlvd2L8CaFaZexCq4=;
 b=T5zgLngQiKnrLaSChLFxSQ5wvlaAucuttZR2fp/tPhvuHcu/cYAp+YtgdEjmZt1xBrBAbLoO5lSa9kbeje/LE4kydeBV9/GBjfR91DwXadC6HGtUIS0siL9H8WvP6CtZezWKX6ts0Mn/sqiC30EV4UT8bXGkWZW8KyrqQU8ta24=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6245.eurprd02.prod.outlook.com (2603:10a6:10:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 21:26:44 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 21:26:44 +0000
Subject: Re: [PATCH i2c-next v5 2/6] i2c: mux: mlxcpld: Prepare mux selection
 infrastructure for two-byte support
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210208201606.10620-1-vadimp@nvidia.com>
 <20210208201606.10620-3-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <65f72afd-cc40-7d47-6cda-06860e06249b@axentia.se>
Date:   Mon, 8 Feb 2021 22:26:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210208201606.10620-3-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0260.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::12) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR05CA0260.eurprd05.prod.outlook.com (2603:10a6:3:fc::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Mon, 8 Feb 2021 21:26:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a71a68a-a996-46c5-7e83-08d8cc783bf9
X-MS-TrafficTypeDiagnostic: DBAPR02MB6245:
X-Microsoft-Antispam-PRVS: <DBAPR02MB624515AB33E133F87AE760B1BC8F9@DBAPR02MB6245.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7LsmIFbtu+SyPqZ0xq/pyWFmNAkXXZIvU6fMt7KMjg4edMX2mxwAi+glGjlupwkOD46n7sRADmZXhux5Powc8J/+HgdoaXDLYIz92vlt+ouPp/2yYBGminPH0S5xOB5xfGOPeCxNYYi5m8Rw3pFFz+HWvwupZovJiUGb2YRmKic4oQqOSI3PmKYUDqdqrscQ7NFwo3R7B2Xo4h7qnXFMsXHTb63Nf4LHV6RGqpNCTGZA+Ni8qbrYitPKsjLb8DrqTz4GgnFqIrYKKmSv41apmuffNIWGKxGuDQfhFWRNYGGAME4ehsj/zYkE/0zz4Gr/Sdq6q4j8wzpEaTyw/hVJ9l2VYcd+s35gkA66Nto1DDBTylsus4m9nml8nFOIzxPVzGaSvS4xhF/sUXkXjobnk/+SPVo/geyiz+z9V9yhG3lw3jIn52G7h8vbjVcXnnVztQAbDDzghSiZ6ilUowcddL52rlGZfZWeld8lsTWrp8d9/OjrSy8cQWwovqQ8LxI97f+z3eSDmQ27QOJBynt2kwktNeBXdD4WnB12BAly3EeYqbxS5GUPTpbe7XxT8ms3RzTzuwJm6RDDumY8h8jxwOf0GPccT+TvmD9uBdt5+K/DXHcdPVbQkIKuf8EXPY31J2k5V7Y2kxYyyw99+oHm2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39830400003)(36756003)(5660300002)(8936002)(16526019)(31696002)(83380400001)(6486002)(2906002)(31686004)(86362001)(316002)(16576012)(26005)(4326008)(4744005)(2616005)(956004)(478600001)(186003)(53546011)(66946007)(66476007)(66556008)(8676002)(36916002)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXRWbkE2dDdCZDF4M2VibVFkOVIxM2VOWHU5aURDbDI2NGN6Y3I2ajNFR3BL?=
 =?utf-8?B?alBOWUhnWFZDN2dpU0gzNDYrVk5lNk9mUDVScWNkcW4ySlR5aWlEYkFySGt1?=
 =?utf-8?B?clhNZ2dEaHg3c1kyMk5nRDBRMzcxa3MyTVZ0V3pIL2RFcVVmNVlZajRHNFlr?=
 =?utf-8?B?RjlVVEZ2Z3dmdTZ3NmtWQ2JpeGFmT05tdUdLTlhYZHBCaThGVVVHV1Zwbzg4?=
 =?utf-8?B?RVUvdG5heHJXdWVpT2NJc0t2ci9idW8vRjhDMUpGU216QlA3Qk5mdXV3a0V5?=
 =?utf-8?B?cW9DQ0N0aGxaZ0laMXNJWGxEVjZESHpMTGdWQjhiNW9xd2JaUE1QMVVNU0FI?=
 =?utf-8?B?QjRQVDI3LzROZytEaUlhRDdZZjJBRm5mSWlWZThKa0tLVUttdXVyRml1NStV?=
 =?utf-8?B?Y0J6S09KQjdGcXJuaVROT1N3WXRwVUMzY1AyVm1FWkFIVFdqdWI2L2hFUlpJ?=
 =?utf-8?B?aTJYM3NaUW8zbXdDSi94RmptNXJpbm1SSEE0REM2VkJnbUFQMjYrLzY4cGs5?=
 =?utf-8?B?MGpJeWlyM1NMQVdZZVkrRlg4a3E3aUFZdGlDWGR2TW1iTTVxU2tlQmtqMWg0?=
 =?utf-8?B?U1FUayt0QVFZSkJOaHZtbXZIekJINUVSVExJaFNwcDhEbEpsLzd1c2YyTFZm?=
 =?utf-8?B?WHo5MHpOOFY3Vzgxdk15ajBVUnlsYWNBQWJnWis0S0hHUjhpSzgza3dzdWZX?=
 =?utf-8?B?d1RITWVONVhLemFxOWV5UlZHSElXcVJKenAvT2U5WDRoSVpJelVyZmtGd2Jy?=
 =?utf-8?B?V1Zxelk2NFRwV2p4MENvZWZxdUZEYmJZNDVEQ2xBcGRtUjhEZWNLZytiRVpX?=
 =?utf-8?B?Z3NvSDM2MUdTRklGZnpWOTF1SUpSNFBMT09NekVqQzBRVW9uVzB3dktjWHJy?=
 =?utf-8?B?ald2TnRQMG5qVG82UFlqKzA1MmtCMW8rN1VjNUhMVks3MXdiN3NDVUkyV09B?=
 =?utf-8?B?MXZiQ3pnT3o2S0tzQkJMdE5QSGs3TmYxaVpDUFkxRWI3UDAvN094RnphbmRD?=
 =?utf-8?B?dlV1UzZlck5RdVk4aEVEc2ZoS1BUa2pLdTZqU1JwbzZhNFJ1UjlWWSt5NHdI?=
 =?utf-8?B?enUvMEtFd0w0NXdldTMzSUVEU2RCTlRta2I1NUFMUmxhd0h6bGh6TkszZml4?=
 =?utf-8?B?SW4rTEE1OTYwdHRrM0NvVnYzb1RmYVlPalc3NXV6VXgwWVovNmVwTzZFWnJT?=
 =?utf-8?B?eGRhRnMzYmJkYjQrZFFXbG4yenRGb25GZjByZU1ydU5YalE3bCtLREdxVlhR?=
 =?utf-8?B?N3JUL1FHRkM0SDM2R3dCRXNaNVE2YUFpZ2cvMUdHUUc3SlNKaTVmS2JJRVM4?=
 =?utf-8?B?cDFBaXJ6S3RyeWpvejE4bmVKcWhFeXcvY2hUYnIxUGF6c0taWjMvRUExTTRP?=
 =?utf-8?B?bDJNR1lTSWJTcTQwbWVrU21GN3V5bU9TRG05LzhaenVYR3czeWFTUnF1Z1JC?=
 =?utf-8?B?UmJUSlZxeDlManhPR0pMa2dVUHRwTTNsZVAxam9VWUIyNExSSFB6cklXQWx4?=
 =?utf-8?B?NHZ1aFNCMXRMY1c0ZUhpallUWGRmeDlBc1FoSDEwSlpybUZqNG1UNEtFdDcw?=
 =?utf-8?B?Y3FhMFE2aUpuOGpJWEF0bWJtTnhobWZ1Sk1JYlQrRXVXOVNtVXc3Uis1Nlhh?=
 =?utf-8?B?blNabkxub2RNL1ovRDdvMGZTNi9tVEw0R3l5cTZiRHRadm5vY082ZEp6ZHY2?=
 =?utf-8?B?UDJ3alNNcDVNcm4rWGxDaEE5TFBCWUJ1bzJqSWYzNTVsZXpLdDc0c3E0MjBv?=
 =?utf-8?Q?qEspl7Z3SxWwWxHN2zxNjaCkcce4nXYnKc1KxZZ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a71a68a-a996-46c5-7e83-08d8cc783bf9
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 21:26:44.8223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3amyutsy+9E++zP6AkLCaKpHVDbd9EBr8XV31JauDxnY2SWgPbRc9scEWSTCPwGr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6245
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-02-08 21:16, Vadim Pasternak wrote:
> Allow to program register value zero to the mux register, which is
> required for word address mux register space support.
> Change key selector type from 'unsigned short' to 'integer' in order to
> allow to set it to -1 on deselection.
> Rename key selector field from 'last_chan' to 'last_val', since this
> fields keeps actually selector value and not channel number.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Acked-by: Peter Rosin <peda@axentia.se>

