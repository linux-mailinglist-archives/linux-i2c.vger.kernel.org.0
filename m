Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7606A1EF5
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 16:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjBXPvx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 10:51:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjBXPvw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 10:51:52 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2127.outbound.protection.outlook.com [40.107.22.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF81366970;
        Fri, 24 Feb 2023 07:51:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqGkKglZkiDUYk/e/IuGckIDJxQSV/JbydGW1n6EwtTxeZ6cc9BJfriYK3F9gJ35KPaWyjENvwRM5FygAliyTFxK/g2Ii7KigyUpIPfP8Pk3qiEmAkC/q+NlkcwwLePTpd6jS7b9m/zCsLsCvNEIc2nb9/gV4WQ/fV1n4K5DdEFj49EhRzbAo8Kinn/LOS+SBVav6gMYxvdpf8nERzrHVMcnESPeFbvshkTVXRTyPl2o/1S1+xDhYrHVtfHi8hyCH1KRBPHmvXqehLbeuSQFqLzS2a7/tB+0y+UQ7lQhMFKfAEwWCaJbxC0VKqiodFIhAekPk76nu4If1sioIk1UVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzRxXhw7qKryF3pldVJ8o4ORIjUXr9BARNxjMu6sN9o=;
 b=oIYlQlrL6RqC/79ZHopb2BrXWukUjj4c+vnYV5MCYnYuR3+6kvbPls7oxxvkQqD4PZT9uEsP4yegW7ugKay3bEdbCsGm+uuIMUYYiApWyueBTKJFXmhwg3IkTkwqsvYQiKpKYAQmGmhfhZF0AwouZSJ5Sy9CE6E4bjTP/onl66sF8/CLsmYcji8+lBTv02gaEvBidqw9U52GSZjQDxoir8uoBnfS1ZVBsOt7RIFWrY8NfPZN+GCK00y5OV6+1Dr8WNSVKZKyIb0T3IL57+mwNKfEqoPoqGdCUiyOwx5Kb7nu4SDPcSwmLYPdFftbpA8R3R9/+ge90qJ7m5gf+T+CFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzRxXhw7qKryF3pldVJ8o4ORIjUXr9BARNxjMu6sN9o=;
 b=jKo4GjrNq2jlkOKP3oe7DJRdGIlEzxmh14OJk90hwOHUt2x52xlM730jp26IBT/8+QXstiJyHYLUH7T0nHxlHd69JeBcL5XaX2L4fR5xA1ekUqhnhknz8hUdLl9DyWaF/pOlRTWfrXOKa3SVd4CcRwQt0Ar0fXDgogWLlSKwuPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by GV1PR02MB8329.eurprd02.prod.outlook.com (2603:10a6:150:54::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 15:51:46 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6729:6fa3:a04a:5afd]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6729:6fa3:a04a:5afd%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 15:51:46 +0000
Message-ID: <2ca7a6b2-8cfc-d808-fa1a-4fccc041b497@axentia.se>
Date:   Fri, 24 Feb 2023 16:51:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 8/9] i2c: mux: Convert all drivers to new .probe()
 callback
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     kernel@pengutronix.de,
        Michael Hennerich <michael.hennerich@analog.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
 <20230224120600.1681685-9-u.kleine-koenig@pengutronix.de>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230224120600.1681685-9-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0501CA0061.eurprd05.prod.outlook.com
 (2603:10a6:200:68::29) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|GV1PR02MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 0691b034-44db-47bc-ec20-08db167f0826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sqeo5ft2M1Blc64+dea6RMxv2lZuWR04NAoiV9i0XrBf81nznMVFXtzdDwM6BODeUBT38+8ai303/csvC7otEkXnwH1v/lnfWIACqxweO/A6QjFdqXkyYEmDvWI7D+QnYiUuYr985uPyYj4AYFyFVe7Yv9FNpalskqZgbc7ZZa66UYAeS7PJT84aSuIvgGmrd5RWmaANR6TeZ7C5H/eIUDGljYLzF7uO59YpDftgi/VbVCPVe9BkaH8h/8tajpofiOVOj62Fq5r0nbrf7gPa9cqnD3HooO/FLqnBjWUbH6t+UEQrmt0yeJYXGX/NTgccHrhUTFZNyp6iRHRz+r0jUvsz0lpood+FfZbcm3VhsYtF7pEKrLeUdwvkJnlY3MuAPcqecuQMICiPa7nqtAlDGMc8jsR5l3DOi8tEefJJRf3t/HJMq2yKlFcw8Du/gILzHrTDgze3ULXZz4ra34ZqcvXCP3/2+u40yKGLEfd6ZWtyEhBtCtiv+Ls8aVXEBAq93+qJOTLIIYJYy7gRGYHwNQkM7XQD5aUe5GaRh/elvcG7lLWa+9DiIFdsAYnVJDP9WX1OIuRDTFE76pbMBLTqrZXYl15mOy57Cq76J6VwFQteq9lafK6H+Q1qpCOdWSMnnxKZVfL7745snd4duix5E39QXoDwSzaKfokYp5W7QBgMU3jgLeh07z1bf9nBjSF8z619l1w4vpAMnPhZMrGjObenTNENawlkFfkxHO0t9NZQJIv2BmDzTlBKI8VFYm3UZbdvLbeID0+rmLLlqgxDYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(39840400004)(376002)(366004)(396003)(451199018)(6486002)(31686004)(110136005)(478600001)(4744005)(2906002)(36756003)(5660300002)(6512007)(31696002)(41300700001)(8936002)(26005)(38100700002)(186003)(6506007)(2616005)(316002)(54906003)(86362001)(66946007)(66476007)(4326008)(8676002)(66556008)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3BOM1FzNStiME0rRHA0bTRUWXJUd2hBU3RtQ0Q5VkNJUFRkdjFVUjF3dHVz?=
 =?utf-8?B?ei81NEgxZW9VWGExMDcvbUJ1VVByQzVGbTRXcEtvb0lvOFAvSmVaS3k5VHp5?=
 =?utf-8?B?VlVzMFNZTFBtWjF2NExwMDVuZk5QZWlrdWxGanJBaVNuZHdONFF0KzNmVWtM?=
 =?utf-8?B?UmYwN2p4NHNxSXA2akNEM0NhS3pDVUMxWTJCL2hsczNGZVNJZ3hQZ2ZGekRl?=
 =?utf-8?B?ZUV2SlZnWHRwNUZNdmFHUDY2QzVMbmJTZGdmeXRvVEd3T3A4eERyZEx6L0c4?=
 =?utf-8?B?SWlvOU8relA4d0J2cW84NnVZeTYremtKRjFCSndRcHBEcCs1dHBPamd5SzhN?=
 =?utf-8?B?NDRCZDdqM01HM1BzYURBMWE0Vy91MHRiemEvS1VIMWFReXplWDJ6cGlwcTlj?=
 =?utf-8?B?QVRvM0RObW9zQkVkeUo4ZFZkdk1Od3hBUlNiVTBJNWN4bGd4REUrMjVybU5r?=
 =?utf-8?B?WWdVWnkrWnFBMDFPN2VzRGRoZ3QvMTlqNll0Y2dycy9sZzhHZkVNc3JCK29x?=
 =?utf-8?B?ekU0QnNDckhJT1JKZjhrUld6c2VBL1p2anUwZ01YVWwvcytReWo2WWlJS0xr?=
 =?utf-8?B?aForUHdnZkIwTXFJNUJYM3lZL1FTaHlSY2dhMEt0ZUJGOHFzQ1lEUUp4dHFi?=
 =?utf-8?B?RWRaZmpnM1FneWNwajcwQnlYMDYyN2V4OE12RTZwVkZyUzJSa3ZCUmVMQTZu?=
 =?utf-8?B?dkd3bFpQNUhtOTBRbVBlRllyOHVaNXorWjl3QXlIVExlWUZ6bXR2UXZ4TTha?=
 =?utf-8?B?TjU3dFpQVllZWDRiSlZaazhQNTBsYW9Hd2FOaTc5NWl2bDI4T2RSM2NwY0wr?=
 =?utf-8?B?OXpzYXc4WWhoTGdGL0U3SDExMHJyY1dhQXoyTkxvT0N4WExFbjkwRzZZRkdG?=
 =?utf-8?B?dmZjSExma05FWU1vejdnV1BpcGYrODZqNExvZ3BSbDZmMzlOV3RSSXBPU09G?=
 =?utf-8?B?YTB1R2NSUUFwdG9HRGpGTHhudWEyeklXUWVPMnBNQXBTZEdqdXNFekpZbkJt?=
 =?utf-8?B?RkY4bXQ4bkl5eDlUK0R0WCtYN2FuTExCRCtza3VBZ25xSjdQUGU3Y3dnVzQv?=
 =?utf-8?B?SXpQNjFHNlZudzN6N3pRU3FNbHdTUitpOFJLT21scVZFcUlJUG1sdVh1eXM3?=
 =?utf-8?B?ZUZsWG5yQ0NmcjFqT0RzWm92SmtsNjdXUGVBNkl1VlhTZ2o1LzQwYWRqV2Zs?=
 =?utf-8?B?MnRIV20yWG1IenEzL2o5VU80VGd3V1J0cTlWQ2YvZ1U0K0tzUmlCdXFZUmN0?=
 =?utf-8?B?TVNwcFAwNjR6VGFCMmp3azBPcmkwQnR6YlRaOWJWZGxnWDRibm14L0tjOSs2?=
 =?utf-8?B?aGhENWY2OXNqTWJUNk9DYVExblNaUC92L1gwa28yenluWURnQVFyRzd6ZDJH?=
 =?utf-8?B?bWdLVmV2RHYxTVZha1N5T2JOTWc0K0lRQ0tDdEY4VnRaY1BaU3NrdW9LQVJQ?=
 =?utf-8?B?Q0pLWkR2ZWZ3OXBUeGhKZmpPZmdQdXRPbkxrUm84TG82cUdTaVdvelU5L1hn?=
 =?utf-8?B?UHJWV0g1Y1U5bUQzN1VXLzhhcGZkeHhyT3NWK2R3TU9VOS9nYW44ZVhXaE5M?=
 =?utf-8?B?UE8yWndRcEJBcXA2Wm9kbFpQdUJIS1B1eW9pQ3psbXJVZFl3NFlkc1V5TWdU?=
 =?utf-8?B?K1RnWUh5Zk8vQTJzblNyYk9ENkN0TXFna1ZCTHdlcHYvRzNoK3F5WWUvbDJl?=
 =?utf-8?B?b1RodldsZzQrWThpRVROancvQTlVVGxISks5QzRkNWYvMEZjUkVKcVlvbEdk?=
 =?utf-8?B?VlBPOE9YTUh0ZFBCS1V0OVVnRjBiRWl3Mld1VGdFUmZBejN2ZGFISlRwRDhq?=
 =?utf-8?B?OXFPTWs1QjdJSVdZeU5xM0RtZEc0SGQzN3lEUXE0d0x6MGowOWVtZjhxSHdD?=
 =?utf-8?B?aGVDN003QjB3ZWVwUlIrZ2J1SlV3cWNWajEyUnIwMm1ZdTlnbmNrUWpxTldl?=
 =?utf-8?B?V0ZQU09NQmNIY3h5aXgrVEpqYlZGbU8wMWkzejFuMlVRYnV1TTNqbWpNeGxw?=
 =?utf-8?B?WHVkUHdCOGJhZVVOMjRxOTJGdGlhUUg2dFc0dFJCVE5BU3d4RjlyNEl3ekxv?=
 =?utf-8?B?bktXVVhodEtaU0s5VEpNWWFSalF3akgrKzJwWEVDcmVYdXYzMisvbGN1ZU5x?=
 =?utf-8?Q?Lr8or03T8KbCuyNtTNU1PUckn?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0691b034-44db-47bc-ec20-08db167f0826
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:51:46.1014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZhOWvr1w+6q5rbq6aQZbsLBrscHxZoMSA1lCATJvmCMlkM+5Pmpxt8qyR8+y1c5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8329
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-02-24 at 13:05, Uwe Kleine-König wrote:
> Now that .probe() was changed not to get the id parameter, drivers can
> be converted back to that with the eventual goal to drop .probe_new().
> 
> Implement that for the i2c mux drivers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

*snip*

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
