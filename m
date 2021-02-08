Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71FE43141C2
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 22:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236468AbhBHV2b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 16:28:31 -0500
Received: from mail-eopbgr130128.outbound.protection.outlook.com ([40.107.13.128]:10025
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236055AbhBHV2W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Feb 2021 16:28:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDJ+0OG2Af1vzj58TRXD2EFF9rIbkIOu9whQlEcaD1XBVsYJyD++AX4f5+3P63u8ietylTnuDcdwHe6Q3XAsyqxL7X0MSTmdxR9ToWqOEQJ7C5nQuc5FUZ3BE3uGKGr0P3gVJ6D05cHZ/xUIX2aL4C+15bsUFz+m1vZwKh2yq5agz3afkenTu/KlQnsqN7gi1vSF/HzYUTHe72Xnc65zzJgo210Cx0kG5zM59IhHAOMfUpG4j5nT+56TJ2St4pqb14f8mujzi7UPPzYz71fKLr5PGrLhSvFErgaax+t02ZnxHQAjNWs+Gpp5YvYNm1alcAxfgPZRxkXoUKxVekwvwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKID6n0Jks07ZkmFIFo6nhntMtrTm7V/P8Xg91UfGAE=;
 b=VObYDCgvn5aMiQfMByx2YZ3SFKkZGnkYPcevT2upM2cyRPIKE+eyRnebfGV9aN/woVkRC03IPi1XTOmdb7r065eIAeFpKBhioOdRrfF+CqT8A01wHLhMXHx53X9qjFqOiV2Rp4RMELiDlNmiOQV9Dd9hGIp3LYgL2d0j/UoFykE7SypnYt5LrBsclMbvlHwR9GQw6QQlu9OAz9qOK/ile3TmhpYf5+j9aRjjlcu3R6VHHE3pKT44capg4cp50YnXTCZ0OBIPKTgJDS2DQS7TdasqQQYoBe7k4arjDeLeufqhbA7WCD7+9tadIf5CGCoanbk2OjS4+Re7o5onfM/Dfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKID6n0Jks07ZkmFIFo6nhntMtrTm7V/P8Xg91UfGAE=;
 b=ZU5xcMvvVGbBsW/RSs7vazoedpSnd66NOGnsrAJEMwDMg4tEXYY+opyOP1dqT7PdVim2gDfBlBvOuV4v0VGvWXOypeC1njPW1ouHyYW5QGXVxECI4cNYgBauMusp/r8/004oh9S8Kte6t+WM0Xd5pPxlMALADp95tSv6gQCtnxY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6245.eurprd02.prod.outlook.com (2603:10a6:10:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 21:27:03 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 21:27:03 +0000
Subject: Re: [PATCH i2c-next v5 4/6] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210208201606.10620-1-vadimp@nvidia.com>
 <20210208201606.10620-5-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <32c78bbe-7a82-e5bf-7297-b88141aab282@axentia.se>
Date:   Mon, 8 Feb 2021 22:27:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210208201606.10620-5-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0259.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::11) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR05CA0259.eurprd05.prod.outlook.com (2603:10a6:3:fc::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Mon, 8 Feb 2021 21:27:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bd6e7e6-178f-4c71-7982-08d8cc7846d6
X-MS-TrafficTypeDiagnostic: DBAPR02MB6245:
X-Microsoft-Antispam-PRVS: <DBAPR02MB62454E0B916F711536B0CAB4BC8F9@DBAPR02MB6245.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PIWVTJyjUf9XvAIHeZkkLAcCAAqxEWtBjf0HcL7dy2TPQ9oQ5CUymvs8PrPpadOTNUiPa9rGo4Hi7sSpKBLyhPRJuj+r9CBztADnWw5OE3Mn2qaEaR3AwqzfJvPexq8VtucUFRnSMfRliRVdTWO73RJpUmX5J7Twa16nF3udyonFSvBXOlcHqrBszjRfwho/EEA2MgGYqKUuSp02UkWuerc9RI46zwqPufm9hXW9C0yAeakSyof4kz4sWwMYg1cytugsaGD0xkVz0/1/vL67MIgqLhFnhV5nif8gUskicb79OS6k8KHACW8YAoCs2khnKsZYQf+HMmIGowGkLQbh366Evtkd3QUNkokaFLAyUX6UK0YSPuJcCfyGbS4TmYewBk3R8QIhgbRwQ1j9JHYRwE5L3Fy6LaFPQGSIvpwOhpnb9qj/MelKBu9GmJ3ldzvivKHJZ6p/rA3+oEarekz2PJo/yMZB5wSiCJhpfdUG+h//GB2yzAvrOlIDp3Jv4hntgZOhZj4tobfbWAACsEClRZo+cGZX05QHKUoA0/idRqk+yPdRQMxvUiOLiNSSOAnHVBVS03Rrk5XFLSlYAIl0E50PMfhwzELxGVDOGsuC8DoFzvb6IdEpKiEE44P0iT+8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39830400003)(36756003)(5660300002)(8936002)(16526019)(31696002)(6486002)(2906002)(31686004)(86362001)(316002)(16576012)(26005)(4326008)(4744005)(2616005)(956004)(478600001)(186003)(53546011)(66946007)(66476007)(66556008)(8676002)(36916002)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YW5qRE9IMUZGdjV3YjFVL2ZaSEJSeU55L2NCVGxWTGcvSGp6TUZCbWh5QWZ3?=
 =?utf-8?B?cmlEaFh1OWNXVTlwcHM3TjVLbWhSamtsNDNUYXNjckl5Q0lSNDZHMEtNT2N3?=
 =?utf-8?B?L1UzWjhML2t5MkEzNVN3T3JiSVpsK2h6UjF6WkcwUTdVbFBOMDJOa0xxclhB?=
 =?utf-8?B?NnVkaUhOUStWQkFWeG5vaHhMaElqTVp6ellwTjMyWVFPUjZoRW1kN2ZtM2Q2?=
 =?utf-8?B?QUVJdmFYOGlteTVRZUV0d0Q3Rzd2Um9CdEt5ZnU1Wm5PeUlZRHdaMVBZK3hl?=
 =?utf-8?B?QjFYK1llZ2pTSHNlUXlsbCt4QnVLTEZrRTltYyt4WXMvY1lzM3lWVVlDVnM1?=
 =?utf-8?B?MTIzTW9MTHdmMDJsMjBWcFhCRWgxdXdRZVd1eS9LZFY0blpWUmxsZFBnVFc4?=
 =?utf-8?B?MW9Md3NEUWVmU3JYQURGSWNqejRNenhGMmUyY2pYaTdZeXI3ZU94K09KMGh5?=
 =?utf-8?B?dzRpMmJoRExpSFJ4SnZTSjExM0NxSnE1VHZLSzlKL0tDZ1ZzUVVKcjZZYUd1?=
 =?utf-8?B?UnFuQ3hId1FPZHhaUFNIRm81TVZ5Y1pKZ3VKY1dnSHFvcW0vR3ZuUFpIemF2?=
 =?utf-8?B?aGY1cEZHS0g2MXVUKy8rTWpzNVBPMHBtb1hDTGkyVWtqK2Z5NTZaL0tYdGlZ?=
 =?utf-8?B?VzRzQUM4Z1hXY2xrbGpFOFNMaWlzcHJXcGhJY0lVZ3FoS2hVcnVLME90QTBE?=
 =?utf-8?B?VjM1dHBadEdHVlpUK2htZ1MrRU00WFgyUnFKMmlpUmJwUEZ4eEpDZE50R2Zk?=
 =?utf-8?B?anBRME44WVlseWFHcVRxVWNaTzFrQUpWNWlZa1RoNlpIVTJKS3l1cDZTSE43?=
 =?utf-8?B?VnA4a1RLTXdEYTBMaDR1RHhsMGhGU3dCNDVickhPa0szU1JnVzUzaEhHZ1Rl?=
 =?utf-8?B?ZkFuZUFsdHVRVHlmdkhHRVpscVZiNFpmOThNRDBFdU5Ec2ZZMXp1TWFKdEg4?=
 =?utf-8?B?RUJLaVo1a05EZkxXb1c2V1RIZkhRbWd5YmVwTmZBeDlzeU1JTEYzdGFPZ2hC?=
 =?utf-8?B?L3dyaVFuaktJTHlQMWkyWFAzb1RtMDBRRUsrSE9rTUkxVXF6RTB5aU0reFBo?=
 =?utf-8?B?aHF0OGg1WmdJS0JySzM5U0t5cnEvYXBoSlNPcGVmUHVNUThFR2lwWEVNazBw?=
 =?utf-8?B?NVdlZlpsSDZTZ3NSNXlDVEFvcXRWK0Jya2hUUWZtdEhVUC9TK2VDS213Nlhq?=
 =?utf-8?B?b2hYcFNHRHllZGFmOUw4UWFpMlZQa1RWV2hjSVE4akJZWnZyRHpGVEtER1Nl?=
 =?utf-8?B?UWE2eWdkc3l6SXZHVFgxSkRzcFE1SWN0Y0hzbElseWZwVUJOU0FVeEtBZXYz?=
 =?utf-8?B?Vi82TVE4OXJHQWpUcm9GYVZMUzdMRjMvZnMrT0FPREJjQVhWbVM4VVhGcSt0?=
 =?utf-8?B?bVQ5ZHppSGhaK2ZSQTFIUnpnV3VrS2FDcHJpNlVVL2MyOHRzZW5kZGdBa2hP?=
 =?utf-8?B?d0owVCtYNHcwdmxQQzZ3QXlVRlJpZHEwZVVmblRaRnVWd3hEWEtBOXJOcW90?=
 =?utf-8?B?SXc2bFo0bW1qbGhvY1U5OWtvTEpVKzFHcHlTckkvd3dxWUtFeGZSSGZnNElI?=
 =?utf-8?B?RFVtbzY1a1pEQkxYUW5IY3ZGVDA3NU1waDNzREpsbWprZFJoS2xQeEFuRTQ0?=
 =?utf-8?B?c01KeDdzOEdURTJwb1h4VlgxR2JFckRhYSsrZnQxODFYdkJtM1Y1SFBENnEr?=
 =?utf-8?B?aU03OGJmSWZhV3QwSlJxbVB5U01xU3dkUm9KS3pxTTYyM20vWWFsaVdndFBx?=
 =?utf-8?Q?mWMtxLa0Djg+7wddCjRej/wIvUeu1hv3qc394Ro?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd6e7e6-178f-4c71-7982-08d8cc7846d6
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 21:27:03.0627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPKm2fPvuRmtca2gImwgCFnneGNkHmg08l3/WDfYAQFyFGg+TO4Hk9EwXEJu/Ob0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6245
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-02-08 21:16, Vadim Pasternak wrote:
> Extend driver to allow I2C routing control through CPLD devices with
> word address space. Till now only CPLD devices with byte address space
> have been supported.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>

Acked-by: Peter Rosin <peda@axentia.se>

