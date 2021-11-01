Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADFA441CAD
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 15:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhKAOfN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 10:35:13 -0400
Received: from mail-eopbgr10131.outbound.protection.outlook.com ([40.107.1.131]:36769
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231889AbhKAOfI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Nov 2021 10:35:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDqnJ41mxTrGBEGf2W2GpHYw4FYqPuuSw0Ewl8qCGFq3lVfhvHwkGSKgktmTX2iLdtk9/EMQUUQg9n0JvTXVUJAlFROS9nGUq6iOIy/eTtKXP9hYTySrXG6ZeKf4u11jlctH0HI1OzsZstefR1Xu0yOZLSxqD0Gnivc6X3q7pPRmSFlfsUGxqMYBOa79qhoFWODhx6YMxsPFfwzeKWHjevaRTJL8R3Wgu/PGGSWqqBf0Ntw1S8YuBzGWQ9Do4gi2umkpIz5xsIAhbUPXTKLBYe5pNiw2FhtxECAXC8AStpD3Q0fu8PIACwQoCyvT3UzwwUUBzWZmH2q7f5po4mfVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvUq8KZddBE//Ye4uc/TjJlFFod/Lg8FuK+SdgOz0E8=;
 b=Mj6AQUbxZQOSuDw+JUYWd1TVtgXegCN8ShdZoqkNRzVdhYYlV/kWilJ/U43jAh80EiWRq33wOr4K5OzzsztoKH5L1FVwEIQ4OeJ3u/a3BbE2Mp4jJIkkhny5hV2kglcozrpGgdUu+2jVshurCuiH+Kt6F6oekZjOUlJOWqUiU7hfTFIUev6Xdk77lG83M3IpBosJJBLQGuNze06jKXvBcaKU0kst0t8DR2u5Xv1TQgjPcIf8JCLP2e+RWM7IDBNhHc4H4qR7IHiHdZSQI2U5eAtG0GF0xXp+LdH5NgpMLj47aBM2gqiVNAjQS5E8Abuh2kPxa4PwYrkT7fb3R2LWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvUq8KZddBE//Ye4uc/TjJlFFod/Lg8FuK+SdgOz0E8=;
 b=WbLRoxZ+1hXkyky5jKtmVEF8+nc24cEynmgUtPM7lw1bCxm7763F6i9pVGIxkVZ1AIEUBmSqmMf+GWPfsGj0RaVLmNevkdvxQDUJyfX7Oepz7f/RmEDjmEzVPnqnmrd/Hr3QbPyPqFr1yLPCx6bKSIyRf5Wx49PwUqrpcGGeEkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0201MB2294.eurprd02.prod.outlook.com (2603:10a6:4:33::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Mon, 1 Nov
 2021 14:32:32 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 14:32:32 +0000
Message-ID: <fb0ca91d-f5fa-5977-7574-8926d8d0e3bb@axentia.se>
Date:   Mon, 1 Nov 2021 15:32:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c-mux: Add property for settle time
Content-Language: en-US
To:     Horatiu Vultur <horatiu.vultur@microchip.com>, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211101122545.3417624-1-horatiu.vultur@microchip.com>
 <20211101122545.3417624-2-horatiu.vultur@microchip.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20211101122545.3417624-2-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OL1P279CA0004.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:12::9) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by OL1P279CA0004.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:12::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Mon, 1 Nov 2021 14:32:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a25c54ad-ef9d-4d2f-8c63-08d99d44706a
X-MS-TrafficTypeDiagnostic: DB6PR0201MB2294:
X-Microsoft-Antispam-PRVS: <DB6PR0201MB2294FF84F738D0FCDD064F2FBC8A9@DB6PR0201MB2294.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LWBnEXQk2zs0mxX4xEbzNaghUkqwYTyxZVnqiXnVjz+6L/KEeqFifPabSl1KO33XPWFf0OFUN01mUpr5MRc3Pw2McOGW0UKZMG+hz4FJAdbgn2sVw6DYIqlumxNaHXXgH+4902jNyk40r8aiKcP2evW1KQiAiVtZPckVIY0M25WgC7D7GZYgL+VraqngnuTlV5s037j68EtCrQhfZUw/DoMafqDuC/TuBUJ/q4HJAQVr43w8aa5W/y3jL38cAHMvn6dqK90nTRbzzPS8A74hCVU5JWVbkFVMyxtuA/Eb8dGReVTQFtDtiqzfStGG9f9RJ7K1RoQSc6v8z8T7SGJBPVz2ajGIOSGs2XuNSoCfpNzQOqpnSU5SXh/aZZZOZcv9mI7N8aT3sx0fsVN1QWnlj59+ZyGnsodqOeCsbwQhDD+ldWnhgDih2ynG2hDkB1zW9wxf28Ojv6Ez3nwht5wLrOxXRIhth7pU/7wu95an2Z7Dmhho10vdu/aRNLz7icSL4GpujtF8zZBoYtZDRtT/xzMslEAl2Q9K0g5E+PLGYCbwiwmp5A3iXvcKb/ax95F/chwo2dIhEoxWxSoFCPt0qgP/R0G+BDCKOVVwj65ZpS15DhgHX3KOE29VYSH6rd0E7cbnfGQ77JOwHXxMwdW2WeCdfazifQp7jf/7sVQYqzpJV4EbWhj/KkVPkJvrM37pn5UC+J8VhpCF+2cBjHyiOfhOHsVuOn0UGd83hNDSF9o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(376002)(39840400004)(346002)(31696002)(26005)(53546011)(86362001)(186003)(31686004)(36756003)(36916002)(38100700002)(16576012)(83380400001)(316002)(2616005)(956004)(8936002)(8676002)(66476007)(66556008)(66946007)(5660300002)(2906002)(6486002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUFzWGl3MW9udDdSWjJ4MHZ5cTBvYVpYajJ3WGwzYlNBUjRHVXJYbE56Wlow?=
 =?utf-8?B?Y3lOT21QbHlOeUlEcHpiQWViRHNSOVFQYVVUQktyalllZXVNOE9vRVNVblFi?=
 =?utf-8?B?czI4dzFPeUxDODFaZldiVDJYbWFmTWJPbWZnd3lhUWJiN0h4clZuSWtxYnVk?=
 =?utf-8?B?NmdWZTh0SzY0ZlRTdFJ6VThLZkk3RGRzUTFGQURpdGdqc2RMZndKeW03NzVJ?=
 =?utf-8?B?aFRaNDVNTU90TlNORzNYQlVwbXk1VlVDS2hvM2ZWM296REkzYlo1ZkJ1TTZE?=
 =?utf-8?B?VjkxU3d3a1ZZbU1Yd01HWlhXM2hKV0NpaWx0L0JYWnZ0b2VnZU0yT2c1SVJq?=
 =?utf-8?B?Z0V6U2NxcWxudXd1ak9STTJTV0VlNFRXMWZ5a1cxYkhaZ1Fib0NkWUQxa2Zp?=
 =?utf-8?B?SWREYXdiejZhWjkwaDRtTlY1dy9QT1Fjd2R3TDBodlVYaWdGTllhQU9iVTg5?=
 =?utf-8?B?S1NHWTREOWRFNlZsRmFNZm9HYTBqRlJHV0lxakhCenY1UzM3U2NnMlVrcllU?=
 =?utf-8?B?MlJPQlUxbHBOSGl4eG83TGxWSzUwNlIwMjVQaTgySlhENGxzcEQvdU5SU3BN?=
 =?utf-8?B?MnRDN2M5T0d6UkF3cllQbTVCUzVnM2VTLzVBenhtOUZZcEJvbmVUUE13R1lv?=
 =?utf-8?B?aVZzVWlZYlQ4elVwdWZDNm9xUGdTMVhWTGplaU1ZakxHWEE2elBxU3NBejJQ?=
 =?utf-8?B?bklIR3ZKMzFKOVlvSkZaZzdreDA2a01jdFgreXJiRXNiazJ0cUZ2VEJKVmlt?=
 =?utf-8?B?TnRpTnA1YVI1enRCdUFyaTlrRnR3THoyNnp6U0tLcmhveHBjc21CdDYwMnJs?=
 =?utf-8?B?Y1lCWTNwQWZsOWhlQTUwZnVVTTM2Q084Yk1oZ0N4cGRXQTRkQnlBSWttWDdR?=
 =?utf-8?B?RkFSbFZoaXN2ai8yTkhrNVlxd0RkZUNYeHU2cUNFRjBJYmU1MmREa0hNNDNJ?=
 =?utf-8?B?NTJNaHpZMWh4OEw2OVd5NkpBamV6dmxDeW5iZk96TnJQQkpqZTBTY091d0tt?=
 =?utf-8?B?Snk5aGNUZ2Y2M2VWZjJwYnlzdHNidkpyMllISzdWYkNHdE05SGFuTGZFS3FW?=
 =?utf-8?B?Z0lSd3BpYXNzandDNnhVVDBodnVmNTZWT21HQkFURXJnUUcySkFyb2RyaVI2?=
 =?utf-8?B?VjUzMGoycHNuTDZpK3VhM2ZGN3J2ZVlWV0crNE5odkFYbzUvVW5mbU1lbVE0?=
 =?utf-8?B?a003cENncFR0S0M5bStNYnM5TVVKMndYSTVFYm8yS3hIak9OOW43R2NSeWRm?=
 =?utf-8?B?OHczRTRQTlVoSlVZV2pUSDJZV0JOWEJ5VjFnS1U4U1g4eGltcHRZeHNEdEs4?=
 =?utf-8?B?Wk8zcEp6dm9lbU1hQW9PYkxtRG1VOGF3czkzM0dQd0NUejJHaWNwcVJaSEoy?=
 =?utf-8?B?ZzdqcVduN2tNQTkxc21hS3hEMHVRekVtaHgvb1hEbklEMVljVll6YVBZeklj?=
 =?utf-8?B?RTByZHpOaWJXdGdCMDd6MG9KMGdtYkRiaEZnbDFJOTVrc0pLbXlxM092dFlM?=
 =?utf-8?B?eFNJUHkwRUdmVUgwSmdiSE0yVkZ5RUp4aGFua1RMS210SmhyaC9nNVBBQ1pT?=
 =?utf-8?B?KzhybzFmNVJZSHE1RDB2MDNoNjFUOER0YjBqbDkrdW1XdGlUTGlXQUp1YWl1?=
 =?utf-8?B?OTJ3cFp3T0tEK0Fhb2pJcGJEa3dHa3ZiWEgxRFJjRmFlT2kzWTJHS1E4WmMr?=
 =?utf-8?B?K01sREF0UW45cTFUT2piTGZwVkREVWpVWWZ5TnRBaXFGelNZNnA5eU9qVGcv?=
 =?utf-8?B?clE1QXhKc0dxVkJDSi8rNEV6MnNzL2VOS3FLSTFPcGo4eVFpN0QwZDBDaWNx?=
 =?utf-8?B?RVdSODhJV01HSndqVVdQZC9FSWxEWTNZaElYSU5tamZWZmpxbkI3eHp1bmdV?=
 =?utf-8?B?RVZrODBIRHJmMWFWNlBHU2c5OXdjdFhvUzFTT296eXlySWIxUis3MXdEcDlO?=
 =?utf-8?B?TXlybnNlbXVhSS9YTW5ja1IwN0FaVFR1SzUwb0VUNzdjTXpEMEtHRTA4ck50?=
 =?utf-8?B?TmJKaFovYmhwU1k2V3JtQVhpaFFyK3d5Q1orbFRwbTAvaTVrSHU0K1RTUExp?=
 =?utf-8?B?bnpCWHRYTDVNSmZHUWRranlzN3F0YTVMbnNubktkcnUvTmVJUmw5YTl6MmlT?=
 =?utf-8?Q?X+bM=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a25c54ad-ef9d-4d2f-8c63-08d99d44706a
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 14:32:32.1272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiXIcaXOJK6VMWSBzNFREkw2Vsc+UEnAVPhML6btZOB7rE1l8RvwBNQaXeXYUcEH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2294
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-11-01 13:25, Horatiu Vultur wrote:
> Some HW requires some time for the signals to settle after the muxing is
> changed. Allow this time to be specified in device tree.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mux.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> index 24cac36037f5..4628ff6340c1 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
> @@ -29,6 +29,12 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  settle-time-us:
> +    default: 0
> +    description:
> +      The time required for the signals to settle. Currently only the
> +      i2c-mux-gpmux driver supports this optional binding.

The information about how i2c-mux-gpmux is special is bound to go stale,
and I don't think we should mention such specific details in the binding.
What I meant was a generic warnings about optional bindings perhaps not
being supported by all drivers, along the lines of this from i2c.txt:

"These properties may not be supported by all drivers. However, if a driver
 wants to support one of the below features, it should adapt these bindings."

However, I now notice that this sentence makes no sense. It looks like it
should be s/adapt/adopt/.

And, in the i2c-mux.yaml case it can simply say "Optional properties"
instead of "These properites" (which refers to a subset of properties
immediately below the text) since with a yaml binding it is always
clear which properties are optional and which are required. Lastly, I
guess this warning belongs in the description.

> +
>  patternProperties:
>    '^i2c@[0-9a-f]+$':
>      $ref: /schemas/i2c/i2c-controller.yaml
> 

Since this is the first optional property, you now need to specify what
properties are required, which is everything but settle-time-us. If you
don't, all properties are required. Which is not what we want...

Something like this should do it, I think:

required:
  - compatible
  - '#address-cells'
  - '#size-cells'

Cheers,
Peter
