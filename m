Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0286755F9EE
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 10:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbiF2ICm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 04:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232745AbiF2ICb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 04:02:31 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2101.outbound.protection.outlook.com [40.107.95.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B43D3A180;
        Wed, 29 Jun 2022 01:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzAJi52nO69fyYXCTQS3Kdz5lvDggxedmSRtu4i+zThlWspv97gNL8xD3TjA1aLMihCVF1WyyLYaK4Wn+RG9Zyov9AYB6sI/cbQtxT3lls9zV8QAOBrDtUkFlXifDJWIia5RSWyg55AQyL/pNHLB9cYC9zsTqYQrsHYQRZ6iMlKh/SDXQqO6ilYacmJWHV975DwP0lgvvxipe7jw2mKRA9sOhMYqeAiUksET7R1j7kvfQ3pS2/ZGlrjziefy9tMLanBfDQZJ6HVXLpa62N0erbxNRN/zytbdf/NlKBiHHNy46gin5tIpcpDTzXuq2gIkvgYWsimBAT0mmhaEAWcdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEG6XAE/P80uy3BdoQnhPBAB1QMkx9PHrQjndOevARE=;
 b=PODNl7pQ/bXUZebNrqbdwsnFLHsDCxKK3CvolcQBcZ/RVsWJjeEyeGr3Hdle5HgMbaKi6BwE9JO+yIxHMK6aoEFYyXWXqTfHU2daR+rrVdZXrv5r7vFpmZy7SS0yz7r+xiC1jRoupFq6rddD8qsmOC1x/GIQ8Cnfn2Azf0y5bceXuewEdsGHvYoWDGa+F3kAFE218gtxWRtn2XhN2RZrd4H0cJL38cV2VLSOPKCggXjHFf6/ipJD/oSribFbTiLm3bbtO30/MmqKccYcAUMgh68S7WA8zMEauwv9t4W9RFmz48T39jnA5baWme8dTJgfX0BLdW+tsa0/Ife8W5E/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEG6XAE/P80uy3BdoQnhPBAB1QMkx9PHrQjndOevARE=;
 b=Tk8HZfy5AfjEGVbqNGC20kpB1S7LeF1lUFZMClY62NhIoqWE15Lhb0KGwx5A16W/Dq9Su3LW0UvtROrsDE5VdBpYv3DyBk45vviOZknMYItiJKkY5PayLJot/+SeGKLzxXAbiYimrutyQk/sBF5iTiay5Kqh2Ti6LDgVr2zMGP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BY5PR01MB5651.prod.exchangelabs.com (2603:10b6:a03:1aa::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14; Wed, 29 Jun 2022 08:02:25 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%8]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 08:02:25 +0000
Message-ID: <deff0c4c-a158-84cb-c366-3f030b5e6f33@os.amperecomputing.com>
Date:   Wed, 29 Jun 2022 15:02:06 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0
Subject: Re: [PATCH v8 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Content-Language: en-CA
To:     Rob Herring <robh@kernel.org>
Cc:     Corey Minyard <minyard@acm.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220615090259.1121405-1-quan@os.amperecomputing.com>
 <20220615090259.1121405-3-quan@os.amperecomputing.com>
 <20220627220058.GA3036977-robh@kernel.org>
From:   Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20220627220058.GA3036977-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beb44664-0d2e-4f3e-3898-08da59a5b3e4
X-MS-TrafficTypeDiagnostic: BY5PR01MB5651:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zzg/cb+BesIxfAAPl2gAN+TMl2ql4Lj++Z/t4cLNM5HgMAQ1CLcNFGPsUgq0lFHgps0RJvnvptKIUrbQF0RwjQfZ+HX3NmVN2WZkxIr7CLAtrQZeLhj6Oh7mkdRWkl+eF8ObKV2QW0lnaOoVyUa6PO55Fj5Lefkqco/Ps+Lmxa3iHJ9ucT7iLlKZ5ODIRDJsKLREBbKZyJGHpihcoHAFUhU0ZcxRMfNH5CWke5yaaQxfNTsOY8TZNqKT6TNCIp8kPNu6K9JHAdoCLZuf3IpV9RWcqAVLPFla9CTn3JxAunaGfLD9U9R4iz/1/AX6dDwNZoalfpc8jQDqQki39uvI9WFlkLYBwW43pWAIGqsiOfz/4HNxpaWGlnNG9f0ArfGPLtxLJIS20a9XWWSMbbbde9OkA1zZTgFcswMkan5qo++dNceaatP3ETAFmwcb/tY5X9XBeJK+MOqqZv9mA0qsrp61tuoivaxTLQlos8UlkKlT0p9iv7+cjXrpdXSGTemqkqMaMd7bU9OQaPRn/8IMHJfznz2NL96VvL2d7uRC5j0VvrJ2/IvVfn1uoEW51KMPIZS2NLdoXyAXsvz0uyaxqqSrdcd4P40Xkvg1xp9f8Ryaa2K1CW2Ci/Gm8YIArjaGwf5/PisapZaQH6NvPS9AuxM9K2iGB77q30WRmE/npEqqOy6N1jWw6J22FPQ+cdgVCLm5IkyjietVUurlllr7TmW+v3s0b8taQ6QyDXh5797AYiTiR8UGvEKBTxfEA1vLVgimG5QoJVoV6vy1/FVljL8lTpKLoBNChFL8jxZKl5nnfU6t0i6PNIkTu9er3CEi3RhOT8r7NmhIljJi3ykGtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39850400004)(346002)(396003)(366004)(136003)(66946007)(66476007)(66556008)(8676002)(4326008)(83380400001)(86362001)(31696002)(6916009)(54906003)(316002)(2906002)(7416002)(6512007)(26005)(38350700002)(31686004)(5660300002)(41300700001)(478600001)(6666004)(8936002)(52116002)(6486002)(53546011)(6506007)(107886003)(186003)(2616005)(38100700002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d04zNmRkR21MR0FIOVZPbThOQUYrc2M3RGQ1WUVZNk41d1RrN3dRdXh2UU1v?=
 =?utf-8?B?eUxYNUdrSWJLMGZldHJJSmlrYTBIcFhiRTh4QURvN2hkNFhUNzI1enBGWERD?=
 =?utf-8?B?ZFdiSkNUeDlLZWViNnQybGJnNmdjUjhhUTlZQ0RhSW1YODFSVzRzcHd0Sity?=
 =?utf-8?B?QXY1YkVIY0tnOHlTVkJ4cHUzVURYb0V2Q3pXKzAwWjllc2tBaWRzSzhZdmEv?=
 =?utf-8?B?S0d0RjJBTWdPakV6Vzd2c2x4K1RDczVsYkR5MXRiZ0FiUnRyelNYU0w4aytY?=
 =?utf-8?B?eXlVNlh5VWNGTXJwMFAramNiQk1VdjI1NzVnL3daQUpnMWFKRHFFdndKVFQ2?=
 =?utf-8?B?L1RieXFwMFBmd0xTRHdpTDR6UU9NeXlEL2lrTzBXVkpUQVBZOXhnZkRreHNu?=
 =?utf-8?B?aXUrUVA2UFFpb0tqY09UN3lmYkJ1N1JxY2J3aG91NHVqa1FmdFhGdzVmQlhu?=
 =?utf-8?B?WTgxTk9GT3VUNVhIemNKakhlM003eE4rZi9tTVZBaURvQTFONWF1N0NMS3hu?=
 =?utf-8?B?blpjT3RITW95TTdTSVJ2UGRCZ0xEYTh5YmJwTEpoaktRL1AzMjd6V0I4QUZ6?=
 =?utf-8?B?TVc2NVdNM2RNaFU1cE43NDB5WFp1ckVuUXpZRTFLa3pxaFBCdnRiL3RkV2F3?=
 =?utf-8?B?RHpzVTArR3Nvdk5aQVZCbHNFU3o1SjNrUEM3L1BtR0FSSW96SjB1OHhWR2RW?=
 =?utf-8?B?UU1lcG15bm8wc2U2ZWR4UmFEcUlvWm1qWTJ6UlNPU0t2YkZ6Q242QS9GVVpG?=
 =?utf-8?B?bzVxUUV0YWpLbUpKMllyNHRHb0lmdnlCUHBSdS9zUnpoek1DQXFZMGhTTHJT?=
 =?utf-8?B?L2d1eGxteWFjWnVSQ1VIYXkybkNBaXY4cnl3ZnlwMW85Ujg1UVpiMzVOZlgr?=
 =?utf-8?B?WjFlMk1PZjU0M2hYTnhZcy9aSEs1eXhIeGNFUG5lbXc2aTE3NTVZYjJxUDhL?=
 =?utf-8?B?bXBUYTBiWjhmR3dhdkhQRzUySDdRZG9YellBdDg1OVFjR095SVRkeXNXMkRW?=
 =?utf-8?B?VHJVTldNL1NkMGZacHVKVFdtQlIzTndtYXUrc2QzazBublFKd3Bndnl4YjBM?=
 =?utf-8?B?RTZsakIyOHptMk1CNGxaRGVpRDBDSUM1aUY0bm9MK3VMbEpvUzBYZ0hxbjRn?=
 =?utf-8?B?Ri91MncxRnNTT1NCVVQvVm9WYXpVRDF1OVVrZ1AySElvOTh4Nkh4S05leWh5?=
 =?utf-8?B?WDR1QWs2S1dlTzNYb0lFODY3Wk02aWhLWXdGMWN5a0VEWkdBRFNicnpoeWVL?=
 =?utf-8?B?VUxrcVhRV3lxRGZ6Z0dmMzV2VncrM3RoMGVJMGFsb1ZFSWNrRXM4eXBaNzRX?=
 =?utf-8?B?ZmlWZ3RxbnVrd3FLU3ZsZ0VWWmRGa00zaEVDRytBdTNHQnJoUHpPbzVLU0xp?=
 =?utf-8?B?dytFNE9oYUVRQXBFbWVEdjdMTkFrL3NNMHJsNitjditpZjB1TXVJSytkVWlE?=
 =?utf-8?B?MDI5S2ZVUEcxUTcyaXRYbEZ5YjR5TWVNcFIzbU0rbjBpQk9XQ1R2SVpSbzk5?=
 =?utf-8?B?Z2pVdWVqdFNPcFJYNER2b1FKZUl6ZFRYcUF1NmsxZkFXWWZ0a2ttSjVSRCtO?=
 =?utf-8?B?Y01TN1FsY3Rlbk9qdXBHSzQyNmdRcnVSZVNOSnpPcFFmU0NHUU92V1Jwdm9S?=
 =?utf-8?B?cFBIdjUrR0FNVXZ3UDZJbkpVbXl5cmxQOXR3YkZqblhjTU4vbkQvRVAvRVM0?=
 =?utf-8?B?M01mamZLMDUzejZ6OUNkclpibmlxL0xUSkhrQk5saHpZbFEwNEx2REo5TEpt?=
 =?utf-8?B?dWZHaWNFOUJNTmU3c0xvODkvc25YSkcwdTZIWjg1QXNGeUxQQ2R5eEI4MlZY?=
 =?utf-8?B?Z0ZsUUxrVjk1Szk5aU9lT0RYanVwdktDU05UbGw5bHZhSXVZNTdueWhPZ2l2?=
 =?utf-8?B?a0tzdDRVMW9NMGJPQVFJcEFDVTRDZWJ5TDJ5ZDVNQWJlOUdHUUJwQ0JwbUU5?=
 =?utf-8?B?Q3k0czJhSDlmQWVvYlc4UVhRZTNsRTNPenc5UVc4bFJCQmZiUjlkQVJSTktQ?=
 =?utf-8?B?cUxaeFUwVWdmTGhTSHJHTlROOU1xS21VOUxyTjNaMTI4Yi9WVDZRV0xzVUp4?=
 =?utf-8?B?UTMvYXJ0Zlkvd0hmT1FkYS9JQ1FSeGg4dVJlZ3NlWU1sVktpdVBFVk5sVVRB?=
 =?utf-8?B?QXdNVlZwN0NDbDRYdThSR0JkSlJuWm9jdGxVWTJCQlNBbEUxRG9FWGNhcFpL?=
 =?utf-8?Q?U04ibhWr67uuLJHdww0CVvU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb44664-0d2e-4f3e-3898-08da59a5b3e4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 08:02:25.4055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMv34AID+RF6c/9JUGClGYtMJbthVP9XOs2doWzOShdZT8iNmOwIOWiiekQ4nHT8jw1WYGYTiVjH/SyCSqtS93ZCOXKXbncBqggGDd+Ur9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR01MB5651
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 28/06/2022 05:00, Rob Herring wrote:
> On Wed, Jun 15, 2022 at 04:02:58PM +0700, Quan Nguyen wrote:
>> Add device tree binding document for the SSIF BMC driver.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v8:
>>    + None
>>
>> v7:
>>    + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
>>
>> v6:
>>    + None
>>
>> v5:
>>    + None
>>
>> v4:
>>    + Fix warning with dt_binding_check [Rob]
>>    + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml [Quan]
>>
>> v3:
>>    + Switched to use DT schema format [Rob]
>>
>> v2:
>>    + None
>>
>>   .../devicetree/bindings/ipmi/ssif-bmc.yaml    | 38 +++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

Dear Rob,

It was my fault and I apologize for forget adding your Reviewed-by tag 
in this v8.
There is no change in this patch and the tag was not removed on purpose. 
It's simply a mistake and I should have been more careful.

Will add the tag if there's new version and will be more careful next time.

Thank you and best regards,
- Quan
