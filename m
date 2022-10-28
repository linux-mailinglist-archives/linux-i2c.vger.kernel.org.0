Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C957A6111C1
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 14:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiJ1Mmu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 08:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiJ1Mmt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 08:42:49 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD8F8B2CC;
        Fri, 28 Oct 2022 05:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bw3qFvODzP8tXlLBdhfocUOPWKafgmB8j+LOCBRkA86ZMl+brg+1em/FbH3lBef6j5c0buuCwN+oXje4OY3jaL4XVq2nLQO0SrgEs1uHIE0X+S/RQWycwyXYxqkLsIR2Iyp5/M3HEh57UqpaUT9OXiJtAGbK5hoBQtdWxoiWhYv1lZeOoyj8P8r3AwckOgGGHPS5UOn+ijK/10YDNkApUtDDv+V0xiW5k148ql2SgVOMGuckIyEEyOYqpVFZqsb24arTOHF2BzKFJAhdt3OKkMEybHAegpfjR+mq+lIVuM9kMKYzQ70qQsq3JkZOvh2h7OZ6uBQ7iFY8MtBjhfK20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8l/AT5JEa63qiAoVmkQjIXzUJw5yLVku+PgSWRl8Xik=;
 b=bBg+Ww5U6A2fQ9pvqD3DSpNrUgo+zisnM096glAtG4QL/kLgjGlP/dswPZf+puyRdA1YNX+zs94IK29llaUrv/6B9sBEwTFw8pMUTjoTmWrDz+5XrfMUaR8Fj2LZlSKy8+XD9DDHlFNVuQcIkdpeBvmPrXsOwyW8lhhKDXIcpqULwRPqSzs/fpY2JCckUK2XucOBI0dFeTJZ1bKiyZaiBwcDTyB1VfV6GWc628rgJKF5GSSKjFDErNhQDK8kmHYRSkgqNYyjd307RUhIyUGiX1Cowey9lncZXiKLEOsvop8u1tLCZqjo+GtNvBlcqRgpjjHLjO9/1/s803KGWviUng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l/AT5JEa63qiAoVmkQjIXzUJw5yLVku+PgSWRl8Xik=;
 b=MpD8DINPy9tbFBBsRiiBarvyrkuLCTkqLQwgN30NcY9UlVErFaF8PqHYna5iqYj1fAE9947ZAEhth2sF/OSUG3xDm9yjb3gPHhFiBC4J7lT2sRjxHGINXq3nwLhjEpoVotGtz8mK0JLt/LOh1CmhJwE0IWXNoomU7SKA0+JUAWhgiy8SK3kVdyH7pbkBemcvWvwBUHxYnnNuQxBFuAXeCIcf9rvqeF0dsASYc0kxl88g8DVtqmKQ0jR/u9xNfXd9QHq8RB9k+yU5TWEnZc4xg+IuTK6+zF6QJWEJsYiKG4PdPxZGo5KxSNt9CA663fiVlx+dzMvmczWlpks2mZU3SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB4314.namprd12.prod.outlook.com (2603:10b6:5:211::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.15; Fri, 28 Oct 2022 12:42:45 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 12:42:45 +0000
Message-ID: <7a1c4943-4ae2-cde4-221b-fa972c2baab2@nvidia.com>
Date:   Fri, 28 Oct 2022 13:42:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 03/11] dt-bindings: usb: Add binding for Cypress cypd4226
 I2C driver
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        treding@nvidia.com, heikki.krogerus@linux.intel.com,
        ajayg@nvidia.com, kishon@ti.com, vkoul@kernel.org,
        p.zabel@pengutronix.de, balbi@kernel.org, mathias.nyman@intel.com,
        jckuo@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        singhanc@nvidia.com, linux-i2c@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-4-waynec@nvidia.com>
 <f8eeeebc-e635-9c97-b97b-46df38f06002@nvidia.com> <Y1vLoT+/dgOgrxjD@orome>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Y1vLoT+/dgOgrxjD@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0618.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::20) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM6PR12MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: 8362aff8-f9c9-4bb2-b673-08dab8e1e958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ds1o1nIKkJcPz7eXGFkPv5rWyqGkp3c9IkmE+ahQBTxOBNnTRC5dltz55f5/8yr24dk6VD4PNbNtXW1f5LCBXTyr/ooRTO7GQy2EbddV/jcaMhpvFTTWRRsv2v6qNjs11eMpp+WWLWEIo7sHjImwPOKIymGqplK5SnYTCl0WPWx31TjiGSFTlqrW4cxqTVj0SzV7VULWhPOQTeb34l7josNiV17tOHvRRDg+KTGvexLF9xRblD7wOJPJVI7MbwvKxg4NSoKGFbKzAf29jsZa3AIGNlREhyOBdm7LWaPtkKn8bnXkj4u6vOUWDjcl+ipa1+hKFLQU5agJI5gtl0boPee4YhoPCBwMF5AKQrLgQdVdrT2oL3KqtPg4Ez+VV35krEQrNbtJzQ4M6cGSeQTM22x0uO2kseLxCc/QunoMD3VGTGYMlU9xLE0Cmwxo8cHqVhN0f9t7Cdsm69Lf8vw/m0dBHFOMavA+lvX8Ud02V8Vu84aPT+wB3zpo4JFqXD5QlGeIO9A+U9P9exMnjeaIqgQCgewGLURtsF4xCgzWecc0i17itepwnWQGcgEBDsD6OPFbuUGiDG9HVPdnuuM+226AHs0cADaX3aTLr/44+03N+jrnRHF34DQOew5qkWu+VdWsDVdMgWbU3O5AW864zSGxlWyxnrpUPwjQ+D2HwcpOmLaS0QLdHxFJMHceWksHB4sQzBVCYIFny2FaFidC8kdD9BI1OwFrpRwOrR+X2+VV42K6mDWoXngDyL9+5YJMKeBLAYagtAshxXBpXHa9Nh4a8GPtiwNRCTO6SnUveIJp8KLb24KPzhb7OvT4RbVol5t1vvFsrdZjfWW+7vu1fpF3AZkAYF+FHYb7QpcEmsPGQaYN/UAgiA/4e0psCDR/dQ20f2Qav/frBq/eqofeB+dutDprzD79WgEmfIFWwFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199015)(6666004)(316002)(110136005)(8936002)(5660300002)(4326008)(2616005)(186003)(7416002)(8676002)(53546011)(36756003)(6506007)(66476007)(66946007)(66556008)(6512007)(41300700001)(83380400001)(86362001)(31696002)(38100700002)(2906002)(6486002)(966005)(478600001)(66899015)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3hSVlQ5dGFVZjltVWZOOWQySkZmeVM3L2xUS2hDdFNPMWJJdkY5cWZVY242?=
 =?utf-8?B?RDE4Tnl2d2FhVGoxMFQ2WGlRZ25NdWswL0VoTVljTTFtdHpJTFRiVE9GNTBj?=
 =?utf-8?B?Qm1pc2dGaVIzR0RLK1RIalZuZVprT0svMTBLdDBZaU44R01ESFp6elJpcnha?=
 =?utf-8?B?dWh5QWpyQXF1bXY2MlI0ZXI2VndiQVpQS3dwMGUwRHZ4WW5JL2Y3VVlEWWU2?=
 =?utf-8?B?ZUdaS2lBMFVjZzVKaGs5YnU3RHp0QVVMRzcwazlKWG5pOHJ2UWx6NWhzSFli?=
 =?utf-8?B?b2VjZWJIb2VFK0xaZHQxcHp5Qm1KZVRncEhiTmJxbGRsemUrNVptU0xONkZu?=
 =?utf-8?B?NHZjNUE4MVZPcjFJYnZpbmRsUzNyZVJuWVBBTm1HNWJ0c0g2TUh1bHRqQng3?=
 =?utf-8?B?MWJyMkptazlqdTVHWHhSSVhUajVjV1ZFWHRFVktoLzlEOTFsMnQ0Vi84N1FX?=
 =?utf-8?B?KzJrYmJodEtMdXl2VjJCdk9TQ2lxODhOTmxvS084U2E1dVZycHdLQWE2eFRi?=
 =?utf-8?B?cUJuejFyM2NKVVNmUHlCdWdJbDdFRU1OcWNyUGQxOFdBQ0ZCaVBBaGRFck9u?=
 =?utf-8?B?blk4R1E1bkZ5dmhmMWFHZDB6Nlg2ZGJXVkUwbkc3RjlJOEwzTUtmY2xCYjAz?=
 =?utf-8?B?RzgzNVJFeXo5MEhFWU41Vjc5eUZxMHhpZWVMZ1NwdGtDd2llTE0wSU1kWDVF?=
 =?utf-8?B?a0hhWFlIUGUrZE5hN0xwZWQ4WmpEUFpzMHpmTFB3OThDZmN1aVlQenh1Y3B1?=
 =?utf-8?B?N081cW81cmUyM1ZUYWxtcmxOMEMxNjNBekdQRXk3LzVETmRLVVFJeTJuYmJO?=
 =?utf-8?B?SEhCMXhVaWYvVmFKeVBHWmovL3hVT1IwVTIyeEdJMEphbXd5QjJnVE1QMjZN?=
 =?utf-8?B?dmFNSGd6eDd3akpGN1FjUmhWdVlwYUdIcmNYN1llaWxDNHo2NGMvVno4ais4?=
 =?utf-8?B?bDlPQkQvZGk5WU5MYUcyV0YzR0VKM3hsWGZTdTlNby9rT01lbHRQYmlxRTR5?=
 =?utf-8?B?cjVpeVZmdWxGSDdPME83MnBSYlV1Z3gwMldML3hvWEljN1pLQUcyYSt5ZEJl?=
 =?utf-8?B?Z01FVHJQTUswWCt6WjFOaVR4WEc0VHlFaHhiWWNjajA3aUJRMEpuY0FVT2F4?=
 =?utf-8?B?bWdNS3FiTEdHeDdNRjYzT0FoaGQzdUcrS1VaWk5ZYzR0OXlub3hJY29Qempr?=
 =?utf-8?B?RHh2Q25mUW5IMEpLcTBvN3RZc0dJOGYyOGcrUzRxblNaeVprYzVLaTRNQVJX?=
 =?utf-8?B?WXRCUkkyQ3JNRVdWMThjcEVvMW9aN3FURnBuOVhJMkNCK1FYVmJ0S3FnYmdx?=
 =?utf-8?B?VVJLSWxCNlA5SXNWV2ZocnhyNlM2MWxmQVZSa1lJOXY5ZVFsMTVhMm8wSGpw?=
 =?utf-8?B?TjFmWHJScGR3K1JrOUZpeWp6QnpqNTFZbHRxTlFlQk8zUG0zckcvSHZBbm1j?=
 =?utf-8?B?UXNkZHBTMTlBZzBFVkJPQ05mT0NjbE5FZFhBNEVCUXhCZnR2MUpaREJTSkF5?=
 =?utf-8?B?K1FQOGMxNkZ0b3lWdVFaSUZRQWgvTEdiZmpuRzhPM2tQNWtiZEl1azFMRHVw?=
 =?utf-8?B?YWZmZk5KWkZKeitnUjdTS0NQYmovQ3pzZS9yRlQ5RXBsZUVzVHkxUDhtalk3?=
 =?utf-8?B?YUhsVXJ5enN0V1A4WEN1T2hDNmhSK0xUZTdjYXU2NUdKdCtoUVhiYlN0dE1K?=
 =?utf-8?B?ZjNCTE40bEozVlRVdy9JTzEvR0h4aVFrdXI1NUdhd3FvUXYxR3lWdFVyelVY?=
 =?utf-8?B?THgvb3JqaTl4K2pnWTBBY094ZEhJWm5oT2VJRXhycUpuRjk3bHo0RWJOMTBv?=
 =?utf-8?B?dlF0eVR6SkVGWFlraHlNRVA5ZXl4cGlzMS84eDhCMXJwTWFCMndzbm9ScjYv?=
 =?utf-8?B?K3A5M29EMG50eGFpcm1Xck9KS0dLTWlqc0R6WSt2blU0Mm9HUitCcEVHSzdv?=
 =?utf-8?B?R1BTbE1mRHZMUEdxZElaYVVUSkZ6Mzl6dUNkaVEvWG00WW9JVllRWXhzRjh0?=
 =?utf-8?B?STVwaDd4N1BsWEFBV1RISEtVS0k2NC9wQmhQNTN6SFVvRlJVTHFHc1IzcGNs?=
 =?utf-8?B?ZGwwblZJNG5XUjVORlA3MFZqUFd3YjdhUll1dWswQkVrM3BoZmVhNEZmMko2?=
 =?utf-8?B?ekNxWW80SWppS0VKeFJlZ3UvWTFsTTFoWlFkMC9zcDJrQ20rdlRGbG01Z1Jw?=
 =?utf-8?B?Q1RQSWt0cVZNOXNyQkUwVmJmcVE0cW5HeGpNUHBFNEhxdkRvM0JaMWVNMXNV?=
 =?utf-8?B?M01RU0RLRW9veEJRUjdCbFlhTXBnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8362aff8-f9c9-4bb2-b673-08dab8e1e958
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 12:42:45.2622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5bMhC/MgPUF2zwa5GNnoFhk07G2FuJT+cy33Z9xtP05fgMvrwZl11iQON1QznGl7SHE+S+rLLYDhYy0lxF8UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4314
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 28/10/2022 13:31, Thierry Reding wrote:
> On Wed, Oct 26, 2022 at 08:13:57AM +0100, Jon Hunter wrote:
>>
>> On 24/10/2022 08:41, Wayne Chang wrote:
>>> add device-tree binding documentation for Cypress cypd4226 type-C
>>> controller's I2C interface. It is a standard i2c slave with GPIO
>>> input as IRQ interface.
>>>
>>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>>> ---
>>>    .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
>>>    1 file changed, 86 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
>>> new file mode 100644
>>> index 000000000000..5ac28ab4e7a1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
>>> @@ -0,0 +1,86 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Cypress cypd4226 UCSI I2C Type-C Controller
>>> +
>>> +maintainers:
>>> +  - Wayne Chang <waynec@nvidia.com>
>>> +
>>> +description: |
>>> +  The Cypress cypd4226 UCSI I2C type-C controller is a I2C interface type-C
>>> +  controller.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: cypress,cypd4226
>>> +
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +  reg:
>>> +    const: 0x08
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  cypress,firmware-build:
>>> +    enum:
>>> +      - nv
>>> +      - gn
>>> +    description: |
>>> +      the name of the CCGx firmware built for product series.
>>> +      should be set one of following:
>>> +      - "nv" for the RTX product series
>>
>> Please add 'NVIDIA' so that it is 'for the NVIDIA RTX product series'
>>
>>> +      - "gn" for the Jetson product series
>>
>> Same here please add 'NVIDIA' so that it is 'for the NVIDIA Jetson product
>> series'.
>>
>> Rob, any concerns about this property in general? Unfortunately, ACPI choose
>> a 16-bit type for this and used 'nv' for the RTX product. I don't find 'gn'
>> for Jetson very descriptive but we need a way to differentiate from RTX.
>>
>> This is needed in the Cypress CCGX driver for the following ...
>>
>> https://lore.kernel.org/lkml/20220928150840.3804313-1-waynec@nvidia.com/
>>
>> Ideally, this should have been included in this series but was sent before.
>> We can always re-work/update the above patch even though it has been queued
>> up now.
> 
> The driver seems to use this 16-bit value only to compare with a
> corresponding field in the firmware headers. How exactly we obtain this
> value is therefore not important. However, since this 16-bit value is
> embedded in firmware images, we also cannot substitute them with
> something more sensible.

I am actually wondering if this is actually embedded in any images 
because I see it populated by the i2c-nvidia-gpu.c driver [0]. So I am 
wondering if we can use PROPERTY_ENTRY_STRING() for this driver instead 
and have a more descriptive name such as 'nvidia,rtx'?

Jon

[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-nvidia-gpu.c#n261
-- 
nvpublic
