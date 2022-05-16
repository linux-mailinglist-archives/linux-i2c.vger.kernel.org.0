Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3E93527F39
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 10:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241500AbiEPIH3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 04:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241375AbiEPIH0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 04:07:26 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2137.outbound.protection.outlook.com [40.107.20.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6F73207E;
        Mon, 16 May 2022 01:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUj47ZzfmHUcBfMxqhWjEt43CCMbUab43+s7CLyMEGyegf1APVqyOcvaYhqZkIlpljsJbr2BG76DLhVx1CanhXVx/f7qLt9dJxrLPFkkL88pczCPydPZCvG+mUfwjZmCZkBp5ktmGdFE9+hHNTJSI9VzDKdwBVpL8IZSB+lQoTPsI4IbHXFFajqiV4AVj8hFOT3QuufGuBSvyCJwLEIRvSHgQ+vwck9SBQo1r3nxkeH9GK+p7f/TN73XLhDb90RFZdyu/621NOx30tEhLXXNhjqrnWdwVKMihM0I8DtcnLYoab4JrxVh11ly9nc2maXEfJRh72vh2fZFWPRl2xUkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5tPuQDIlZz83cnU1x1KMJlkpc/d2yE08UVy9YNT1UY=;
 b=d75VMS4ayceATxBzQzvcC/he9J+Two6nlYqQBDcnhAh0Xizrn8YNYSd2JbAXrf7HBolcEGkGvEy5x5kbFMUdW8aA0tVaEBPxObGFBlQmUXZ230JG2cF1se3LiVKsQYDtoucXiYMjHuakwWTLh9ZYv9qjIo3BwcxRCCwhJoBHMneUFTUPP8c6NHxouLfU1DHsSudqqdwvtedIiDPycS/DJEuY88gV3TY8T0HdQl27hBFtYIH9VHJ54LhmSp97WYTqS83spO/g1elVoqrIs2KKrs4PZftbWw35z3OWAlPpzKS76JULCgVpvVDBcJt8hu6LQF9YQ+pT/4EGDcvN5I7mGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5tPuQDIlZz83cnU1x1KMJlkpc/d2yE08UVy9YNT1UY=;
 b=QT+NTZRB2e5yIWR9JI38oYzxt7ru34Fj2WL+vFKy8VPSc2i0NERkz0dqeBx88i0FoPuoOw1/9NzG4W/rXZPKeE3e+eWy8Qp4/2PIOlNLbWG/qGT6LwpwwztOBaQFvV9Npn8Ffnn4qPdPLCdEVvtJaAcHKjyTMPcZ0+GiYc530Sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by GVXPR02MB8256.eurprd02.prod.outlook.com (2603:10a6:150:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 08:07:22 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a%4]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 08:07:21 +0000
Message-ID: <758ebcab-b0a2-29bd-d79c-1fbdc95212ae@axentia.se>
Date:   Mon, 16 May 2022 10:07:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: add property to avoid device
 detection
Content-Language: sv
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        kernel@axis.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, luca@lucaceresoli.net
References: <20220412085046.1110127-1-vincent.whitchurch@axis.com>
 <20220412085046.1110127-2-vincent.whitchurch@axis.com>
 <Yn+8CJ3j2SY2+Mq+@shikoro> <7ab1f387-3670-4b49-211d-3ff9a7c3d40b@axentia.se>
In-Reply-To: <7ab1f387-3670-4b49-211d-3ff9a7c3d40b@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0058.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::32) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b26e5a36-eac6-4334-1091-08da37131aa3
X-MS-TrafficTypeDiagnostic: GVXPR02MB8256:EE_
X-Microsoft-Antispam-PRVS: <GVXPR02MB8256B57245ED1F527DF9B308BCCF9@GVXPR02MB8256.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQy4Dqpk529XMCZD4eTaChAYQvmBwz0+fDfh0atlV8X9CyTKXOu9cp09K1mpRlZniO5psEZX2XryuTAgYmdITY4CJkuiG52sKlDPlh92CWk+gkTpVEuvnqyMg1a9lBG5Ys8UxvxewCt5Aca56oqS82p/GnEkwjNUe+vBrHGNoo0tUerBitfOizY2iMGNGkxSBeoUjJZ6HkJiPROAwWlIFR2nnc1sizSTsMdyy0FfjqnzCX/s4dKY4Qx1kF+50tm6NUpoRjs6/YzkTQOr0YJzB7blQCnTWKu3oXWXlgZxjA8KSF26oNB0S34HyhiSD+Je7IaW/1QmmpijMVhN5msdVJ2c4AF2sIrLXswTUwGedN4mYOu/JRvYXYpZO77FLs/gzKxqGgVqGI+BQ8uTyG0JS1TJRheaoOALhqg1oEKchJMA2hy/gUqtHD+lho6BQz5m2xrnY4p3UKU/snR77AIHZfxlJJgM4Df9JQXooXrMFmd8dEXGXAMaCBqA6pQpU6RhiAbMYGOWAQWd9zV+JTIYSpnLRGQPUzWQ/VtKk9z42spaWXFwLtKt5/n425KnGb3YOtoo7kZAsLgh8e0idiT+hornrsDut9OMYMO4SGcyIhICeQZaNbJ0ye1blygAY2L2czf8mVt//FroAim6ENTa3smUn3DG5zFluFuuqQJU7XgPkiRxNFQJOuGdz4iEcbD9MJ7vH3skucJ3lGN0Shm6mlqJZDHZBgEyxniq2Wg0ZYI8Fw6lwPazoJFWEf+WuHKA3UHPI1rrcx0g7Yi3CuMIqwRnHs8W3LJfRIxBZZDNTSnuGf9D3sulJN+yOGMxVdWygEm0cBvnfCv0HCbEuJ+RjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(376002)(396003)(39830400003)(346002)(136003)(31686004)(316002)(41300700001)(36756003)(66946007)(66556008)(31696002)(8676002)(38100700002)(86362001)(5660300002)(2616005)(66476007)(6486002)(186003)(6506007)(2906002)(110136005)(6512007)(8936002)(508600001)(26005)(83380400001)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnVnSmh0WXpOdGxHb1cwcHhzUFdQY01YLzY3L3ZTbmxueHhhSWhYWWlZcGlv?=
 =?utf-8?B?YjdLTWJxajVzdU9YeFNWcVNGbzFyZ2J3ZCtvRHlFTkZPM25VdGhCQmgyNTRZ?=
 =?utf-8?B?eEpZeGJFT05ObjUxRWV6dUhPd2VnNFhjelFmMmFYM3pYQzBFMTU5NE16Zmly?=
 =?utf-8?B?ZXV1cDVDK3NKVHJUekk0TXFpcko1N1NmSjJxdjlXZzVHcktrRFJhUFg0bTVz?=
 =?utf-8?B?WXQ4blZCQzA1b0U3MDdOTmIwaEV3Y3VORVJMc3BqQTcxS3U5ZzlOKzV3VStT?=
 =?utf-8?B?V3hTT1R0cU1mbnMvbDRmQ29LMnBRcFdHbWpTTHdvejkwUnZMV0Z3ZGlGajd6?=
 =?utf-8?B?QTZLVjlQVmR2SDlZR0p0ZW53SlAzeWgva2Y5VHdObStEeURGZ25ycW5GaXNh?=
 =?utf-8?B?aWhZcTMxSkloaitmUTlpODV4NDRlaXFtaGVZOEp2bXAycTk0QmpWNnJjbGR0?=
 =?utf-8?B?Y0lIaTJvSGllbW9oK1RJNmp5eXRrdDZIcWttTWhMUFkrZzJZeUJlaVdwMGs4?=
 =?utf-8?B?UmJmU0VoWWJGd1kyVkkwWDNOOXJ5TDBkcENtS1ZXS3piMnBqRmlVTFl0NWpC?=
 =?utf-8?B?cHp5SE5zYUVUdGIwVXVnbVYrN1pENlpVNGFadk5LYXVhajZTQmQzNTJxY2Jp?=
 =?utf-8?B?alAwOEF1RDR2SGZGMDZIdE4xazZOdjAxenhzaVZ3MUVHVVBKRU96SU9uMVlr?=
 =?utf-8?B?aXYwOHFTdXZYNXREQjh4cmJ4RVpHSUZHamQ4NTJkaFp2REJERXlUSVZhSjhK?=
 =?utf-8?B?Q2MwcUtKcVNqTTdXNzZZY1p3WTdZSU1hdUIxaFByQzNVS1hUWTJLc0RSTTZ1?=
 =?utf-8?B?VGVTcTV2T1lPTFdCd2FoZUpyNnFIbkF2MkFUTWZGT3k2NmZrU1lwMGtUUVQ4?=
 =?utf-8?B?aUlEYkN5WmNUWno5b25KdTFnWXV0QXBSM1BqUXAyNVJiazV6MEhlWGJVTnI0?=
 =?utf-8?B?Y2swc0hWK0NzenNhYzVJMTVVVWVtNlNvNEUzVW93U21QQ1hqcWJMUVZZMk5C?=
 =?utf-8?B?ODZ1M3hISzl1NG13OStZeE5rd2U5ODVzZ0l2SGRiRmlUN0pnbmZ2S2g4MUJv?=
 =?utf-8?B?OVdlSnl2czhiTGdYc2dDZXF1emMybjVpTElWemFsSlRzUjNPcTl0S3J5UmRC?=
 =?utf-8?B?M2lFYjJJaUg4Q0toRmw0c1Nma004UDFzRnoxWU9wT2VGMzZTLzZNVktONkgr?=
 =?utf-8?B?d0sxd01kenhoalFkbDE1V1hLSTVjR29RK01uVnFYcWVtZHlBVnVnK2FmdWtt?=
 =?utf-8?B?di9LdDd5djVZOU5GTEJXbUsvdHltMi9ocmVRSWFleHMyOW10ZGhTV2pYMEl0?=
 =?utf-8?B?K3VFdnJyQUJUUGlveDcrNWQ5L2RncEl5WUkrN1lZa1ArWThwcHRUZVpES0cy?=
 =?utf-8?B?Vis5alMzZ29ieGlDME9vTmRZbjVkbkszWDlTVVByN1NqcXB4bXNjRGhleXpq?=
 =?utf-8?B?ekdRWXZHc2x1aWc3OXFnVitFRGVWSDhtZjdnU29wYXNmSDhKZlpXOU9nVUJC?=
 =?utf-8?B?eXdEYVpxY2llSzhoTE5XTlRtdDB3ekRGNStsa0lMTnZUb3YxUXF3RjIycmV5?=
 =?utf-8?B?Ykg5TlZXdmpTYUdRd0JlaW1HaFN4Z1NEYllQcGFJSkFBYTVDR2JUT21uQThJ?=
 =?utf-8?B?WHVIekFKcGZLakdNR0JKa2RJeUlJaS8vbEN0RHZFMkxmY3NLZlIxcVNnUjhR?=
 =?utf-8?B?dFFnc2o3VXZFRVkvb3NDQVhMaXpYOVBYRFVucWJicTdlempZa083WmZBSmo0?=
 =?utf-8?B?OEF2bnlWN2p6RzJLZG1TT2dpZE5zcmR5aktmUUFUMXpkekU0SDdNUnNSeUVn?=
 =?utf-8?B?Y25BQWlUNitXYVBXVHBEWWFCK3JnUnJJbTBOc1A2QmdPOFBpTnlnajN1cDNq?=
 =?utf-8?B?Z21VSGg0aFRoQ0lJKzZkc3orSElpMytqeVhYTEJXTGFONkhiU243UmdONlFz?=
 =?utf-8?B?OVJaYkVzOEh4d3d6OG5sQ1NyQ0tWWk1mdFMrdnNGZVZzYmQ1RFYrdnhFdlJ4?=
 =?utf-8?B?WkpFRTBHSjVUQ1dDU29pUHI3ZWVXZXhrZHpoNHRjQXRBUVBydTYrQnZoR0JX?=
 =?utf-8?B?WHlzQ0s4VStWWVQ4eEdlK2N2Q1EzR292N1hlVURmaWNCbTZYTU5ZS2dpZWZP?=
 =?utf-8?B?SEMzZExvYVUrdzNiV0xMWHhWRzY2c1BMYXZCdHdqRHYzeEpBNUY5N29ldHFn?=
 =?utf-8?B?YWpvWWJaN3lhRnoxVmE0YVpTc1VJTEZZQWtTOFRaeWhhMm1JcDlkcnQ4NitT?=
 =?utf-8?B?ZmpEeXE4Vk9BVnNjWFZvekxhV0YxQ1AzbUtvcXh0YzVTVTY3dHM4SGpsQ25S?=
 =?utf-8?B?R1FWN2ZFTVFzMDNOWnNwdjkwWmNCancyWkdpbkkvanRKNXVValE4UT09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b26e5a36-eac6-4334-1091-08da37131aa3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 08:07:21.9490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeQn6MxEoVpW4ENQK75ijQYoJJJ8p/+lFbxJWDN01ihXAIn6fapY3p/efy27B6zp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB8256
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[Now with the proper email to Luca, sorry about that...]

2022-05-16 at 09:57, Peter Rosin wrote:
> 2022-05-14 at 16:26, Wolfram Sang wrote:
>> On Tue, Apr 12, 2022 at 10:50:45AM +0200, Vincent Whitchurch wrote:
>>> When drivers with ->detect callbacks are loaded, the I2C core does a
>>> bunch of transactions to try to probe for these devices, regardless of
>>> whether they are specified in the devicetree or not.  (This only happens
>>> on I2C controllers whose drivers enable the I2C_CLASS* flags, but this
>>> is the case for generic drivers like i2c-gpio.)
>>>
>>> These kinds of transactions are unnecessary on systems where the
>>> devicetree specifies all the devices on the I2C bus, so add a property
>>> to indicate that the devicetree description of the hardware is complete
>>> and thus allow this discovery to be disabled.
>> Hmm, I don't think the name is fitting. "no-detect" is the desired
>> behaviour but a proper description is more like "bus-complete" or
>> something?
>>
>> That aside, I am not sure we should handle this at DT level. Maybe we
>> should better change the GPIO driver to not populate a class if we have
>> a firmware node?
> We also have the somewhat related address translation case (which I
> still need to look at). [Adding Luca to Cc]
>
> https://lore.kernel.org/lkml/20220206115939.3091265-1-luca@lucaceresoli.net/
>
> If a bus is "bus-complete", then address translation could use
> any unused address instead of from an explicit list of addresses.
> I.e. the "i2c-alias-pool" in the binding in patch 4/6 of that
> series could be made optional if the bus is "bus-complete".
>
> Not sure how much value there is in that?
>
> Cheers,
> Peter
