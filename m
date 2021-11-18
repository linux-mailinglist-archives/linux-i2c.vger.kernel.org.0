Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5D2455A22
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 12:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343716AbhKRL2x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 06:28:53 -0500
Received: from mail-eopbgr20136.outbound.protection.outlook.com ([40.107.2.136]:41806
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343780AbhKRL2B (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Nov 2021 06:28:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsgBi5WBiXH28T1Js4BwY5lCK3Od7KxzHyf/7wuiyBiVwjwe7irFjJu2IKglIE1R7+RdWxIM8/e0meX+Sy5KyCQfytNsx32a37QvrI0ePnkIuTjnV01VITjyO+dp906K1WHKdystmHbXNaDZOhwKsUPlKzGNhmJKGuTczhFoligMDZ417/ODL/3nT3ujPCPzb/frKXtpyEPIs2iFCDep7/qrNN1/4ft5c2ks2baCn7KXJygdQKSIyOfI+qd4pZYoSTw66RByj1pzpNdKIv90kGR8NsUydV296T9xZKoKMcN7bhuONwK+CzY7kF8i4tUldgqrfDfxajXeAj8YnybnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwtwMyieCg03h+CshxoYKNYY8asGouXpEDu7Wid7NVc=;
 b=YU5V8XYUt0p8Ys4rYzPL3/cynWcyjR6wTd5NWxf9mhqjbA9ywCJ7aWcARoSNrERS799ySc1zpp5u+v6SAhADraV4Hm0D1LYuKmzCJg5Usx3MxzwxYNoVraB2bBmGL1fSZ6zt3lk11F0+KYsw87+xCzX/cvEOyH1GPyU37xoSqoZ2Cu7zaYielU/aYFPZg32ab1wiZMNuJ3EIUClocwNboja1ay2Qdobq2XeW7QgVPsdAcDVrEXsDJc5+RdF8CnaoVXq+/8jRM8I55lAlCudlHJcjrCJXHhsys+E4eacXhQHwvHvRwuBDMwzG1TY7yR/UCir6lXwl8xaDDhzILg2qGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwtwMyieCg03h+CshxoYKNYY8asGouXpEDu7Wid7NVc=;
 b=TXE98Rt9PsARG98waV9/4t7NqN+vWpDD8z92WyuJUpb26MRG3EVhb9W0JJeaQPabxPGd39YrXrHPboPqtqD5JZA7pUBhjyccoO+qIwhCyEAJUab0B6xEFkvWWTUMYKVEAOyT5OQTO4PdYpMUjcNp5TmG7yIPKqmmrXGBqBsBFIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5483.eurprd02.prod.outlook.com (2603:10a6:10:ea::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 11:24:58 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 11:24:58 +0000
Message-ID: <fecc80b0-e24b-409d-5f60-82b899f0bdba@axentia.se>
Date:   Thu, 18 Nov 2021 12:24:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 1/3] i2c: mux: gpio: Replace custom
 acpi_get_local_address()
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
 <304efdfe-db6e-051e-b61d-e73a8dfa1c53@axentia.se>
 <CAHp75VcF1TZ5hH42-D+0sRkYkN-A1r797LdHGMT93UO4Sp3wLQ@mail.gmail.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <CAHp75VcF1TZ5hH42-D+0sRkYkN-A1r797LdHGMT93UO4Sp3wLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3P280CA0040.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::14) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by GV3P280CA0040.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 11:24:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbcb7cd9-803e-4c14-37ae-08d9aa860d93
X-MS-TrafficTypeDiagnostic: DB8PR02MB5483:
X-Microsoft-Antispam-PRVS: <DB8PR02MB54838585CB48E1062E938840BC9B9@DB8PR02MB5483.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NrRvhTEP7jFtHPeDkqWBoz3LolWS6ch47C1PVp0Dnvp3G41EdAvZQOWnRqjfUfwlu455l5DxznK6OGC+mpCf69JaWjFpohJsA0WMtAwqdgazZEkheAk1SMg8EEX55B4+Lqf1zA3H+QP9EynNZWpMqdrgSo+U9llD6gVrfR+bEQ7akGCexzhQtOrrp8tHU1Opjyddf6D8ilJPzxPSoRDH/k4Ky2Qc+QWNCsJqzRpAByoC3R4YNOeyjMxkyaV3Ks3HKwwjNO+8Q9ZCzIBE0zEC5PWOIpTXRZBRY6LjX9GiIpnvVxHAqyL2/QVifLEhbEGMneSKI5JnfsPxn07BrTIAn4L+wgZJg6cpzkOtEV6m2bsXM+HWgpOG5X7+a1JsrfVe509TPQCvyrw7s8g2m6xfQiHNtq3Ew8OlSPnK8kJxwSYOEI/BP55iLf1nLDizom9H+UX9tPpKspnG6NsNaPrGAzuCzMLQOBLVQe81o0qB0a7mfFXZR3/QtrDwdX4kp/bul5ih94CRoE4IHuZR7KStYIwQDToA97o68H+GXa6sG643UTwZHxeVSXOVyBJQTOBarQnSQ0OhNonW4f9IFRVt3uyQXKzJW3bG8pPyZF/aAHTEEAZSwq2u2qoldgj+Ae6sexgLdlxv7R7n+/H+3VYQvhH22I2oF/3Jr6dHPabASKj6phaPOjBr5mBYj/YNTp1vhtve6xi3XBFm5jnNxOe38EHzGHayouScFnGGjCDnZio=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(366004)(346002)(39840400004)(4326008)(5660300002)(6486002)(86362001)(31686004)(4001150100001)(66946007)(54906003)(36916002)(53546011)(16576012)(36756003)(83380400001)(26005)(110136005)(316002)(508600001)(2906002)(186003)(38100700002)(2616005)(66556008)(8676002)(956004)(66476007)(31696002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3dUL1hUa1lNanMzcjJwZFZPZlhyMjA3dEhHaXM0ZmdnN2JLMSttNitSRnBC?=
 =?utf-8?B?RXFVTEpKM056K1Y2M0o2d3YvT3dCdSswMy9SUVRzM0N0MW1qZVdEdnZKWlZm?=
 =?utf-8?B?NGIveDZsdlpRaUxCQ3BKakFUQksvSGtjNHZib3N0WDcxM0FpT1lWRm1aZ2JE?=
 =?utf-8?B?d3gvd3pjd1dVUlUySWE1VUtxV0wxWU5KREFGTGs0aExwK0hYOW00VEJ1NHZ4?=
 =?utf-8?B?QzQvdHUyaWxCS1V4bGhuSXo5MzlLbklLUmkxKzh0OWNSR0VyY0dZc05hVnNY?=
 =?utf-8?B?SjdWcFpCNXdITEhhci9UdWl6bERhNFlrL0tQUUZlTUwvamxjWDBuTXc1UXRj?=
 =?utf-8?B?UiswSHhVSnpDbmZCZEFGYU52bEtLdkkzS0k2d1ZzS0s3Mk0zek9yNXRSeE5h?=
 =?utf-8?B?enBEQVQwd01tb3dqNTJ6ODRTd1JqUkxWY0hJbitjejBiNTBkQzMzRnZ6bndr?=
 =?utf-8?B?M3Y5MGt5NHNXeUtuclpNaVFqWjZBYmhrc3FqYzZ6OVd6WFpJbnBtbVZTK2Jo?=
 =?utf-8?B?SHRvaUgxQkdMdkoyQmVGc015MU5pbCtieW4rMjhVUy9JYlFRSGNZaW1wYWlj?=
 =?utf-8?B?Y1VEUHp2eTcrWnErZ3BVY3RleTRwcTJVdEFSdkRTTDJ0dFhxUFVyTDBZMU1Q?=
 =?utf-8?B?SUdFazNUdlJwL1YzR2twb0c0YmpRTGJaNVcwTVljL0dsT1YyL1pJM3M5QXJ3?=
 =?utf-8?B?b0Q0dmdJVjE4NVF0VEVXR0wzMjlzZ3lFVWo4QVByRTBvd1NiRWNBdmtrbDZt?=
 =?utf-8?B?U3g3T2ZpNlBaTkVGbFJoYXRpOTloSklLSm9USHZ5cE5vQ0VYdDZ1WW5hMFFF?=
 =?utf-8?B?aWlaZ2NqY1NtTTV3eTNMWTlPME1aYkpJVEFNb21COFZYQ2Jkc0VidndWT2xt?=
 =?utf-8?B?WU9IUUhSS3NNajhqaFZMdjZqY3dzOXdTb2Z2cVd3WmdXWnFEOEZiNGZsbGg2?=
 =?utf-8?B?R1NvTUdnR2U2V2VqbTNjU1hhdHh3emRubTZrRk9MdzZOSXdUTlo4NFZxaEdr?=
 =?utf-8?B?dlVIVnYzVUF4eUR6dlVKMk1IWnpsb0xrcFF0RUFFY2NLdWdNS1dUaUdYMEFi?=
 =?utf-8?B?RGIwYnUvcjZ2Q29OK3I3eWpVcFo0NVBGR1VmWHRPRXBHekZNdEhZZ0wrczRn?=
 =?utf-8?B?SFdXNnNSK252dUU1RFdEdS9ySHk5NEhuZEoyaE9tS3pxYjdCR2t0ODVVbU4x?=
 =?utf-8?B?OGNSQUNjaGZTTDZyLzY1Y0hTT25HQkw1OG9scGdncyt4bUpoaHNPRFNWTDZz?=
 =?utf-8?B?ajJnZytlWDVKdjMyWk5vVjNWMm5reERMYVREV1RMdjFPS3pCNS9YVUczVXFj?=
 =?utf-8?B?bG1vbHpMemdDN25oeHRlaWVyVDJDMzdyY2Vjcm1JSzRMVk5JSXl6Q0ZaS2Zk?=
 =?utf-8?B?N2RkRUVrRnFKV3o1SHJ4V2xsWmJGaEpQR1FnMEZ0cEN6alRhb3RKRWI3M3cy?=
 =?utf-8?B?WVhOU0pYb25NdmdSZEpWL0pWZXBmcWh3bkU0Ylp3bS9rMDF4SktYWGk2ZThY?=
 =?utf-8?B?dXNQL2NKN25Hbllzajd2Sm00SE9US3ZNbXN0Zmo1Qm1ZQkdVSTFGcDVrZmMx?=
 =?utf-8?B?b090aHFYUUkyYytpVVZleXNoTUplbjVuZmgyRWp5QlR1ZzhHR1NtVGpCZ3FX?=
 =?utf-8?B?VmxwU243NENSV2Q0TUx0eldXbW5DRVFrOERvbDhkY25LQnp5Z3EzankvdjQy?=
 =?utf-8?B?VWhhUlRxQVAzak5WWm90MWFzaHJld0xReHVUMGNzbUk4d01sM3JmQUJVT1Nn?=
 =?utf-8?B?SVlaYzAwSVZkb1lUSXpNSlBnZTR4R0oydHh1RHRBcUFiNTg5bnk2V2VrZ09W?=
 =?utf-8?B?MXJSK2VnSmdjVzUyK1pxT2R1Z0MyRk5vaUhCZjh5UG4zNmYvVDRPVExITmRF?=
 =?utf-8?B?emJPOXFaOVZ1bWtoY1NtZzgrblpaYXZHa2kvN2RHd1d0aWVOWXVPd3ZxRDd5?=
 =?utf-8?B?bWZGMzFDZXNvRENkWCtqYzZqZGl4QXhoSnpoNXcyOVN6SVRxc0UrWm9xWG1l?=
 =?utf-8?B?ZjJCeFpOY0lmb3hvbG1NeW5uVk4zM3FqS1JheFc1VW9MR1hPc3dTSjROSTdH?=
 =?utf-8?B?enZuK3k1SXRxcUFvcGYrYXVkdVpYL2RmVjZDMWVXd0h5K2NDKzNTQTJnSE5w?=
 =?utf-8?Q?eoCs=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcb7cd9-803e-4c14-37ae-08d9aa860d93
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 11:24:58.1586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDXZECfkxCKXncxQYOot/yu1EL/FfRRLJJ9Vf8y4Q5sgoPdAL/lGlo3WrSVpgQr4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5483
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-11-18 11:33, Andy Shevchenko wrote:
> +Cc: Rafael
> 
> On Thu, Nov 18, 2021 at 12:24 PM Peter Rosin <peda@axentia.se> wrote:
>> On 2021-11-15 16:41, Andy Shevchenko wrote:
> 
> ...
> 
>>> -     *adr = adr64;
>>> -     if (*adr != adr64) {
>>> -             dev_err(dev, "Address out of range\n");
>>> -             return -ERANGE;
>>> -     }
>>
>> In the conversion, I read it as if we lose this overflow check.
> 
> It depends from which angle you look at this. We relaxed requirements.
> 
>> Why is that
>> not a problem?
> 
> The idea behind the acpi_get_local_address() is to provide a unified
> way between DT and ACPI for the same value. In either case we take
> only a 32-bit value. We might nevertheless add that check to the API.
> Rafael, what do you think?
> 
> P.S. Just realized that in ACPI the higher part of the address may be
> used as flags by some interfaces (SoundWire is one of them), this is
> not applicable to I²C muxes right now, but who knows... So I prefer a
> relaxed version and, if necessary, documentation should be
> amended/updated.

Splendid, just checking that you're on top of things. I don't think any
doc update is needed on the i2c-mux end, until flags in the upper bits
are introduced? So, looks good to me, thanks!

Acked-by: Peter Rosin <peda@axentia.se>

@Wolfram: You're finding this series in patchwork and will be picking it
up as usual, right? Thanks!

Cheers,
Peter
