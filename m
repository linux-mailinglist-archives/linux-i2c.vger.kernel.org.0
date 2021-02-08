Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1277E3141C3
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 22:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236055AbhBHV2f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 16:28:35 -0500
Received: from mail-eopbgr60107.outbound.protection.outlook.com ([40.107.6.107]:28875
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235781AbhBHV2W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Feb 2021 16:28:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuK6G75uohgrWhQx/aZHHsSpnGHoDt8wwXkbUy1oHhSYL9TFzb+IBpKuF0JKa1KJ5T7ba5pG7eFlZx2VL+RsKIOm8Y9MNr22sDNtr85ofA1Q6JYgCnsqwbLfG0esUu0s29WILD26yzo0QY7qL4oFwbRWKb8sGIvDpeh3ofiABcpISylGMvcSuMHzOsxhBLQ+YdDxDGpizxYvKghk55BnVdPq0MgTDxc5x3IHxVvxrui+se3Q4wXEYVV9704aw3cQR/39o81Lp+qQIv+M4nxh+CbmcmVjlPToK717xoyZhmGrhbqn5gz5AQOZAilhsP3dGnzrYYEhA2cRizbNduxu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13WkNbwktc5ORA/Mkp3gMHLGUFp7f0UWA7bQu1ZUfrA=;
 b=Pwm+0fgorkNtJ7kofRK4dz/jNglWUnbO9ubXo0eqzNXZIMguThLDaj2mQBR08FAcxaDQwDDxfuIXC8g3n0O+Pl2YyXyLWrFWYxXmoOEuSvg9Z5VoNk1LbJNRzd9DPAwQCFKjOIrkOww5NkYNZDNsxQK73HDZ3tvaN4rbWggsJ3hcOFunHzRwIgsjEdFDwKbEKf5ZKUInUMxHX934AMxEpvBzKFhNYl/sPEeOT205uZLw5kLc4RRtzvWZRxp7WnmQxP7etBWWPH8U0suLQkw/AmARmzk5dhDbrTKsC/I5PC0i4HVOX7pDch9FK5Bb2B8Q/cM6TQ4heeLwLDZp37Glwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13WkNbwktc5ORA/Mkp3gMHLGUFp7f0UWA7bQu1ZUfrA=;
 b=OwecnKsIs9xqWyM2nrlhAC089aEvEOBO3JnXwIBA1OZ0dmJXpDLEkyiHKpuMX11IKShl4Kd4wl+y+g4czVPOa9jDrBM2c9xkN9g6G6u4OLLstu1dThYGShbhhLgcfqEyS16jAOy2H5l8GUl5NYLSztLRuIXq1jWDkYrC8fXpO+s=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6245.eurprd02.prod.outlook.com (2603:10a6:10:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 21:26:54 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 21:26:54 +0000
Subject: Re: [PATCH i2c-next v5 3/6] i2c: mux: mlxcpld: Get rid of adapter
 numbers enforcement
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210208201606.10620-1-vadimp@nvidia.com>
 <20210208201606.10620-4-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <51ced9c9-80cf-1293-90fc-2eba51cc5f8f@axentia.se>
Date:   Mon, 8 Feb 2021 22:26:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210208201606.10620-4-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0263.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::15) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR05CA0263.eurprd05.prod.outlook.com (2603:10a6:3:fc::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Mon, 8 Feb 2021 21:26:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c32a5f58-1e97-4477-b1c1-08d8cc78416e
X-MS-TrafficTypeDiagnostic: DBAPR02MB6245:
X-Microsoft-Antispam-PRVS: <DBAPR02MB62458A3EAC34183E297C8092BC8F9@DBAPR02MB6245.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q76aN5HjJTd1gs0b39Orz+Ru+frk0bFep4uwbnNyGzU25gHmu8dhMfS8SrXnOCqjr2S8v6Yg4QtmeSrgKxy5kFVKglyfe7GczYabUuZYlp5Gyx+ylhQE5uAsmJ9cCfGdm/3gG3AaP0jCrfvmjpiQ0CaCtena5U5tX9piCy/ESwROyvtOPhAGh4TTM14GSuguzgJZQeSXak+uLmFaJNDQJdHCmTt9cqtq3l21NYR2J7k4GNnWN+yWDezVmIsEB4IqAerF85iOrWoCPDJ85msp8TXt0zCfGQ4PAw3461WYvLtVtSVfh2GfS2rQ4Vs8EOV5BiLzhABFXK5JezDsMzt92i6fgcGoANw2y0/FALU9cFeIQXgJlMur4EvxBnp5u62smVclpkCcD45GWqbtgBB6YoW1J8aV6qQLKdzFIHmTQR3rQYy9lVw32n062/NOAp4VuEhduytlAJAktOygOptMBWPg9c1gew51W9bpD+q6ndMqR9s1RmaJ5vWYVV/MpiqI5iczTqXPO5MDtLfwj6lWw8U8/mPSyRa+kcQwr1yfCa0EsfFNKQOly2TAexTTNDIuYij2zPlz+HXO5DIMMT6RfcNlBUNHjWLQ4cT2AZ8zhflZQpnW2H8nuogeuhN9qO12K5iNLlyWrdfnVmwr/f+dQao/L7qWlGNcfimakyUGzVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39830400003)(36756003)(5660300002)(8936002)(16526019)(31696002)(6486002)(2906002)(31686004)(86362001)(316002)(16576012)(26005)(4326008)(4744005)(2616005)(956004)(478600001)(186003)(53546011)(66946007)(66476007)(66556008)(8676002)(36916002)(26583001)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TWl4WEdHUWRCa2VENTNzM0hMUjRaZ29FR0RSZlVndk1JQ1VJVXRZZU42K21Z?=
 =?utf-8?B?V2QyanZxc3pmRHpuRE0yVlhVeVpqZEZUWEY0RVQ4QkpPOUFuanRZOUJpZnkr?=
 =?utf-8?B?MU5LYXF6YThqR0ZJUWtRUWdJL1F2ZlZZQ2N2di9mOTlSQ3RvK1E0SEp0TFBo?=
 =?utf-8?B?Q1B6REFxc2dNUjltVkxNYkEraURjcHZVTjMwaDJLSC9jT3V4cForcHZGR3Fo?=
 =?utf-8?B?Q2ZYc3ZyWGN0bVg2OEEwNm5rM1BLRVJDYTRmczllWWlQTndQZUl3MEZRNGhN?=
 =?utf-8?B?dEVDanJHWXBRQ1dtTFpqMGduNk8reS93M3c0dzJRZ3EzVDVqa3p3T1BYZytN?=
 =?utf-8?B?ZHF2SEpoSm9GWG1Jb1dWRlo3QlpPSVFtNWpITzc1UFd2NGFuU0xDWUJLSHg3?=
 =?utf-8?B?OEdWZUp6SWoyU2QwYWgxL0pRdDJrOGt0bmx6Q0wvYVhReHhUbzZqRmJVOVVI?=
 =?utf-8?B?bVpMSWhRVHpBdFlDb1paNXZSU2dtQXhpUXZIQzNkTlN3b0k0SEZFeDB3SkJC?=
 =?utf-8?B?LzdtdVdzTUNpdWdqQ3piVi8vdVlkZTFNTXJNamk4ZDYzeWtwdW00eTltSU9i?=
 =?utf-8?B?Y0pneXVTa2xJUHRwNkxZbkdPejZoYUVCempibVZzbjZiSlZTblJBaUpuS1V4?=
 =?utf-8?B?TDRSK3UvRTJudjBWZm1vRlJPbExEWndhSk5XTEJOM0d5OFNzdWwwTHJ0N0Fj?=
 =?utf-8?B?a2p0NmRxY3BzU0F3RTdUMXUwWXE3YmRJYUx3cWNYRHBoa1hPWmJvempHcCtI?=
 =?utf-8?B?RXdyOC8wWWR2RVVlblhFOSs2MW9ydjhUUUZVK216RjBUUjVYM0ZhY3RMU3hB?=
 =?utf-8?B?bkFINVVYSlhrRGZWeFcwNFY4QzIrVVNOUzBCTlAvOFl1cWZUSWpzWTIzZi9J?=
 =?utf-8?B?TUlzS0V5SnJmWDArbE8vZ0JUUkVPTTh0TnBNVVY1RytoT1pkQjYzL2swRU9p?=
 =?utf-8?B?UnZ2RkNQRis4YXF6clA4alRtdG9yZTREZUR2bjVxSkRrYnpaNlBPZm5rTzUw?=
 =?utf-8?B?VSszWlJvMXZpWGNpZ0t0MUtLeldIYitHN25Ta3NBaStYdm5MUE1GeFJCeTli?=
 =?utf-8?B?NnN6WFRQMk1aUk5EdHh3K2RGSkpvNk1MakZmVGNaZnZJUy9kdEVGNWNjdFpu?=
 =?utf-8?B?L3hndVlPTW9lQW85YTBFUWlaQzZEWnBtQ0lQNytSbWpncllxSGhNV2FlazA4?=
 =?utf-8?B?VkJLZUE2ZlVNU3MwTFg3L25HN3RvNzZWNjM0emYxOEIvY1Rqdis5ODBqT0VU?=
 =?utf-8?B?VGxhRjlDL0kvWCszdi9YdEJlNHdXeHVGOHBwcnJWNW96bU5kejBsU1BvWGdh?=
 =?utf-8?B?VjJoM25iWU40bkpBMHQvbzBUbms2WVFaWTduRUNoanVZTGQwUzZRQmF3R2lS?=
 =?utf-8?B?UllNM296TS9lL1BTbVArT2JyMkdwMGd0SnVWR0RKVHlNT1g0ZkRRaU5YUS9X?=
 =?utf-8?B?cmZVWnhtYnhhWVcwS2tCVkJKKzFKb3VEL1AxRXdURVg3ZUQzM2JWR1VhWUky?=
 =?utf-8?B?ckpmRGNTVGNMQkhMdjdUTGYwNDV1YTRHNVdxZVVKdVJFNmJjTVBFZWl3ZCt4?=
 =?utf-8?B?a1d6eEg1Zy9ZWWZCSEFGZzFTM0c5clJ3ODYwb2kyRnNjbEZoNFlsblpYKy80?=
 =?utf-8?B?cDlpOEpDL2REbkhwbVBUbnF5TGhVNndYSVhSTStyOFRGeEZPRllhbTg5SXhY?=
 =?utf-8?B?T1RvaXUrNDQrMURLdDI2M2RIQ2ZEYjF2am1JakNsaDU5cGxZenk4YmtJNkhy?=
 =?utf-8?Q?XBAY6qidYO5fxYQTXXIPyWntC4SgShV+zxCvb4a?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c32a5f58-1e97-4477-b1c1-08d8cc78416e
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 21:26:53.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCnjtfJdEZB1ek5dGZdZADYoyulwEtIaQKM/Rf6YHFI787X96jm9316XMqEOCj8Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6245
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-02-08 21:16, Vadim Pasternak wrote:
> Do not set the argument 'force_nr' of i2c_mux_add_adapter() routine,
> instead provide argument 'chan_id'.
> Rename mux ids array from 'adap_ids' to 'chan_ids'.
> 
> The motivation is to prepare infrastructure to be able to:
> - Create only the child adapters which are actually needed - for which
>   channel ids are specified.
> - To assign 'nrs' to these child adapters dynamically, with no 'nr'
>   enforcement.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Acked-by: Peter Rosin <peda@axentia.se>

