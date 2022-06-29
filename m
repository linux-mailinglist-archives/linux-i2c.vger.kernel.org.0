Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A75560225
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 16:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbiF2OKF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 10:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbiF2OKF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 10:10:05 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2116.outbound.protection.outlook.com [40.107.20.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E36C2E9CC;
        Wed, 29 Jun 2022 07:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnAAl2BVOD1s6vPj7zMgcbi8WQyeSDyv0CpdYhMtF23u+GtPqXfEb3+cQsyVuKhVrowlhFxL46K7+c5iCTYEvqHWdpVKeSSv8hoE4j0rDfDtpCR1daeb1YwiyOuP7uWRCULbRLPZf1MK6wEJZ7V2GaD2BTONP9cvk6w8e2zOwVm+GFHJxmC4AQS4VjkR6KJkbVCJiBWz2MJSyadr136uzpePB5flvfOmd5BmGl0KfjlunPxERqBCbqQPxq56xDxU5aG6Bv9uryHgpKygHyn7KrKHTGYpmNS3JUT9tcKcgXYY73CIG0YyYjaG7WL/IY0z0hLEjXbwJDlvTfdoq94yfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHThc8eVEe0TpomFXLLQwZkZNXRCrg2OI+ZNzrsyLuc=;
 b=gc3CM53zahj9iR0k+4khs6suHBebwayT1tfdXGBkmJTP7C6GZxlDFpG2HztMhXFH6qRDhV8916srYyqzyK+J5JPtWMfJpxSHPifnVvmJfdcft4aoPzt9TbwQL0gr5D/YpIHU7XC0HbS74QTFXwWKlHLjBm4m/p15FZTI2hlYy443GlqIHppCZAG4qT17kaU34Wbq30bNqeUNQkslwnz5YeXfZjPFy9+QJL8rjN5zaiFIfSAvJm7cS1SFK49Gt1+DZTKTqh1cI+uDlD+g+o7qZs1iLXUGsuLB6Bf5RqSGotwRjNEAw70BX7YnKEZjps2tsXWITi2IUtJolJX2Y35VzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHThc8eVEe0TpomFXLLQwZkZNXRCrg2OI+ZNzrsyLuc=;
 b=yPXnWaXq+4JVqJktk58hFyYMM7y/Y4rg6X1ksFKGtkOrs2oCGwQEuoSeE3DnGIRbWaXk+zM6lx7Y6XU46FIMOTs1t2VaIemmdEx2LJLerjZsW4vGbKdrkt7lfTA6Lntj01smLIwj5KfYZnqEdPu+wY7PwhewpTFghTlBrt+EY2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by AM5PR0701MB2913.eurprd07.prod.outlook.com (2603:10a6:203:43::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 14:10:00 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293%9]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 14:10:00 +0000
Message-ID: <6cf9647e-10dd-8523-962d-a7c40b532fe2@nokia.com>
Date:   Wed, 29 Jun 2022 16:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/10] i2c: xiic: Switch to Xiic standard mode for
 i2c-read
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com, joe@perches.com
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <20210626102806.15402-4-raviteja.narayanam@xilinx.com>
 <ad7626bd-bcbb-48fc-5e32-bc95fafcb917@nokia.com>
 <80c524c3-8c31-346d-2691-48f93fa6001f@denx.de>
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
In-Reply-To: <80c524c3-8c31-346d-2691-48f93fa6001f@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0241.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::17) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab7fe03b-9a7a-4643-7e62-08da59d90d6e
X-MS-TrafficTypeDiagnostic: AM5PR0701MB2913:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JRs0bVDWUvKL68XaoocjfXAZ/xlCxQ6c79Xhdyn/TuRmSRiZhoelgrxGF/7vZMnbhTnJpz4R89ee1B72GeGid510/R3HyBzTL7eHZHjFL+D+6VRl2wXUHqn+pMeM0u2c4UBGJNwLXXqwyksB99KPDDgE5sq7TSrKPur97MEqlbmZ5kjkLAegY3LXKSnYO6vRIFouyAzwuvpBpBOmbUGT/4ZpYLE8DP5RpfjZE3A1YFJAfh5Jcg9mZsK04SNPHCVL4EE1yvX8PICjdSYsLq+qtcZ6rxDZ51OJBJSb4ZoTLSaw8aLTj6EEXCt8IgkBBkq3TyHe6lL/WYg5wvkiVft9ugsQN7rOpGx1haPlzzID80wJRdh3Es1JqUuile/igblYG9tpWvzeus6PyDIrjphuJ57EZk4vUnRv8DKjGaUX2urCd07qj3p/DTsuo+F+vyfi771sIxjwyelQ0IZ8eJZBKM+/7FhBOG3J9SpyjPf4ugXGyv44mGpSU0+UJ6O9kFrXYzAFHSyEgW0nbG5+g3mnskHgRjT0KToo35IkhcydMQvrKEvN8NKk1558vS1rALz+NRx8+sIQD1vmmE9SEGGoTKYBaeXW0HbQ1+wwF7RYJ9lNCbT2Syd5RwwgQivLflyUTrNYjOF7LezPL539wIAcWEKgX+4OYhI+SEQy1Dd0IfkKGcAchpei2FoZSj7/v1fmA+fmDOMZL29tMfxbIn2PhkbMmn+e9jeiHq0oFAlYvOCREPuudmEdF4/A3zqSPss3GN701wpkMhUx69/1TFJqm2QinMJblmzmQk9AWYypHQBssDi20C3f9S6NggsmzIq/X52sttoTnxfgQNw9sNn8Kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(186003)(36756003)(31696002)(83380400001)(82960400001)(6506007)(38100700002)(6666004)(41300700001)(2906002)(6512007)(26005)(110136005)(478600001)(66556008)(8676002)(316002)(6486002)(2616005)(66946007)(4326008)(44832011)(66476007)(5660300002)(8936002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STdWUFZyWVBqQmFZTzM4eXZyeVF3MUZtNWdGbjQ3T3ExTnNGOEdhd0pydFpP?=
 =?utf-8?B?dVdYclgwZ2hQeHBuMmprS1g5NzVsajFEc3BKMm1nUFpYaHZ2YkJzcWJtdEh6?=
 =?utf-8?B?M1pxT2gzMkxkZHl4Z0tTb0xsZUVEREZEVDZIMng1R3JORTVjdEFFS201TTRI?=
 =?utf-8?B?RDhJWW1rK2J3NW1kV3g3Vm1Jem9uYmRCeFN5MzhrZ2lTbmJtaGhxR0ZnUllF?=
 =?utf-8?B?MnkvYVRDY1ZveW1yQVJvR0I5TzhyWERLZEt2UVhWSWZCQXYxWHlOSXk2bXIy?=
 =?utf-8?B?YzhoMElNcnhxbGRMbk5NZngxTm1nSW9XNlpmU2JySmZydEU4aUU0NUNQeDlX?=
 =?utf-8?B?MnRqaUFwMGJ4eFN2T3BFMVdGczV2K1diWHBwUUJERnlnYjdzY0hlWFhwVXhG?=
 =?utf-8?B?anNoTWJsNkovSzJvUmJRTVRVbFNJeWFEZkFnTFlKZmE0R0JZTG03TFAzNXFr?=
 =?utf-8?B?blB0SmQrNFVUL3o3b1lPMWhOQTNjd0g5WEYyaE1xbEhmRE9Od1BBNU83TDlr?=
 =?utf-8?B?TXRZWmhNSzlYN3RhdWFDck9xU0FwT1FtdEdTalpjNHRIbldibTRFcVEvcEM3?=
 =?utf-8?B?Y1lEQ3NCbWlrVU55a0hwOHRQR2NpQ09KNlNMSWFvVGRXbndubG83OE1FQjNL?=
 =?utf-8?B?K1JNd3E0QklTbmd6WUdLRXFiTDJHSFBCNzgzTC9ONlZlNVdjRExjWTF0V01w?=
 =?utf-8?B?TW5ZMmNkS2wwVzdiUHNuZ0ZkNklYL3FkallrakxNZUR3d3AwNkJ1YmFsOHRo?=
 =?utf-8?B?ODdmN21XdXFQUG9TanFwdDhNczRhK0hKWElDby9CMnQrUjFzNmRWcDBOSEo2?=
 =?utf-8?B?QjBxTklGMXJwZFlVR0ZtVFlBS2NWVHFZemM2YmlYYk1wTjRHOU9EcldYNU1V?=
 =?utf-8?B?cmVsOUpNSG44RVJqWGN6K0sraDRmMlY0QnlxTkpvNDRhQ0NGZkQyMUNQMHZK?=
 =?utf-8?B?WWtpRjA5U2szU2tDSHRBYUJCWkNISlZseSsrRnZMTlU1YmE4bGlMM20zdXJz?=
 =?utf-8?B?aUx6QmdFK0VWd0pVMmRxaU9pU0xyWlQ2SThlR0NXTk0zclZYQlhibnJuWWcz?=
 =?utf-8?B?dytCYWJTdkZHdDFnYjFWdEJVdjN2WTJIQWV1K1RlZ1JiZzVGdlRJN2pCTFdY?=
 =?utf-8?B?cFpReFB4SUsvVWdIQnFuOXhFR2NpTFZkZllBVGg3Mmo1bnpLK0FkRDNrakV3?=
 =?utf-8?B?WDVaYnNkQkNmQVZIeVVlRTkzY1NaSzN6TGVHMTA3SWg1TkREYzFVOHFQeEs2?=
 =?utf-8?B?MVJPbVhLU3ZFRC9GZG9NNTV5WWtvdTFrRkt5QlJzL0E2d0RHdm1kRHpDOFRP?=
 =?utf-8?B?TmUydHhaajFOUVk4WjF4bE1jSW1QUFBRV3ZtSjBNV3hKVWlaV2VHYUVVQnlz?=
 =?utf-8?B?cEVFTGw0Vlk0amtDdjlkcVhQeENZOWV0MlZ1SzBuYll0V1JxZTc4RjdZVlBD?=
 =?utf-8?B?K3o1c2RqVms4bnE5L21RMDZ6cGc0OENqMUMrYXkzRGhOQVRna2hsNFN1YUEv?=
 =?utf-8?B?Vm82S3hqblJxOVdKMFhpNFFYbk5yYUV1YlNLYVVOQnJmTzJoOG85RXE2bUhw?=
 =?utf-8?B?OVRBNTgwaElrbTJEWENGVkdkK1pIa0tLdnl0NW81WEZIblN3ajhYb3RSM2lY?=
 =?utf-8?B?L2lGT21iTWh5U2pvZUpxNHlMVXVvZUFuNVFUMFh0cU5HdFpRb2wvWVNKMlFk?=
 =?utf-8?B?MmoyOER6YzJwWXk0dkNlaGd6TmdSVk5oRlNYV00yS2pZZGEzOStoMHRRdTUx?=
 =?utf-8?B?UFRKNG00MVkzSHJhQ0YzeWdMZ09PaHdiS2xsVHVVMndjcVJkTFRrTUZKY2tJ?=
 =?utf-8?B?YmIzZ0J2OEhtenJ0UnkzbnZ3R3U5NmxNYldGU1NQbXQyb2M1NGx3RDlwbkdW?=
 =?utf-8?B?YU01em1jbHBzU3RkK09MSE1aaW9TRStxWktjeG1pa2taMFlQQkJQcVV1czho?=
 =?utf-8?B?UTFwNW5rWkhzMTNjS0ZZOVFPS3RtbWpCVHZwTWZCeUU3b2MvOVJ2MkFudTZm?=
 =?utf-8?B?QXZpU1FnNDRUOVR3VGR4RnJ4dVROWDZ6UFBvMUo1WXY0TlVtN0FCc1BRN3Jj?=
 =?utf-8?B?RHlPSTJmZ0V5T052ZjlkdTYvQXhmQzNndlBUV09EOUcxM3pXZjNsYlNwdmFM?=
 =?utf-8?B?bk92S3JNekg5aEhXU1FiS1h2MjBORk9SZjNvY0VnMmkxazFxUWxCRDVDK3Jt?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7fe03b-9a7a-4643-7e62-08da59d90d6e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 14:10:00.7292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DbxuHqZkHPSpLVnWU+yAXgP+p3ygkia0bRjShIM3gg0ldWDxGp2TV0xLN7YbPpSRpX/MWTZs1efgzJ4Kfvbl7HRoeclO+QrfhNulsWcVsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0701MB2913
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

W dniu 29.06.2022 o 16:05, Marek Vasut pisze:
>> [...]
>>
>> If those two modes only differ in software complexity but we are not
>> able to support only the simpler one and we have support for the more
>> complicated (standard mode) anyways, we know that standard mode
>> can handle or the cases while dynamic mode cannot, we also know that
>> dynamic mode is broken on some versions of the core, why do we actually
>> keep support for dynamic mode?
>
> If I recall it right, the dynamic mode was supposed to handle 
> transfers longer than 255 Bytes, which the core cannot do in Standard 
> mode. It is needed e.g. by Atmel MXT touch controller. I spent a lot 
> of time debugging the race conditions in the XIIC, which I ultimately 
> fixed (the patches are upstream), but the long transfers I rather 
> fixed in the MXT driver instead.
>
> I also recall there was supposed to be some update for the XIIC core 
> coming with newer vivado, but I might be wrong about that.

It seems to be the other way around - dynamic mode is limited to 255 
bytes - when you trigger dynamic mode you first write the address of the 
slave to the FIFO, then you write the length as one byte so you can't 
request more than 255 bytes. So *standard* mode is used for those 
messages. In other words - dynamic mode is the one that is more limited 
- everything that you can do in dynamic mode you can also do in standard 
mode. So why don't we use standard mode always for everything?

Krzysztof

