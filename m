Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89815F8C5C
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Oct 2022 18:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiJIQhA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Oct 2022 12:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbiJIQg7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Oct 2022 12:36:59 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2113.outbound.protection.outlook.com [40.107.20.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DFF8248F3;
        Sun,  9 Oct 2022 09:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4+liMf/yTtHVhqlEf0XtUxk+gy816cAHc71mAZaHuxlhAZA7nIAr1HCDIYppIU+0AEPL6QPCORs5zAkx+1Hfz8F45Fr+ntVnr4MQU1uAdtw3vdpcKvYnN99JZmtCrwx+2WaoWaYtDExQfNKn5K3JDgiZ+4PpxH1QTRwXtt/GUUTTU1lOom3puhYycttV5T0s1ZWhdpF6sEu1YImzz9uKLWseBLvnn2ghUJSC9s31M8h+To0+5WKe9eVbSGaVLT7seyiY2++uebjQ5E2zypVFJAV1a/xiwqySrQHQdL94asp2FoEYpydGkuCQwQvtWsFi4GQVQKAjgpvVso+t5hbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGyqdhohxIU5ZAEeFtb0baIy/igo59NpNsfnfLCK8HI=;
 b=hi2VeDzc7qhA5q24BnLLZ2kGufBlZVo2dOJNifpDIufn4KIRLlhXN3op/W2A9aH000Mjsy1A2lzfUvYwHNQnAPFxPjdqaQj+PsEcRWW5+QQwUxjrFL8gjYwllJg+nQXnjR0etOPe0Av7S+d6mzMEfyktZYjE5+6iVqpuxKWvE3CdmjzOYksckvAWMjKsDcbMNTw1CbKhDL3pPoCvJFUHLGhe89+Cc7WIEVOwTLYzKQiE2WzungfAKHrhEvU137NBIAN77mBUJ0KC8ZsuYM7DcQyymNHGTlw9+HtJ1T4LFCOUvKFn+NWpX4HCiEoXP7xJpiOZ23C/2Nfu9AV36RGtYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGyqdhohxIU5ZAEeFtb0baIy/igo59NpNsfnfLCK8HI=;
 b=CZ8lSFNxm6VYGRVZ7gvQ/8H7Q/j/MnIAbnYVib3fv5ifxQfcOg5AswejNnsNDTT01NJdwJwDncQ24YH55FLd1xlWrg0YXuXi7NXsm8YBJRdq863ypL6c5uyFGz1W3x7IVBTxvZYy+hsjs+8qdD5XTIFFGcuDja39haIOsOGQCJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB9017.eurprd02.prod.outlook.com (2603:10a6:20b:5bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sun, 9 Oct
 2022 16:36:54 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::52a0:6606:db2a:51b0]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::52a0:6606:db2a:51b0%3]) with mapi id 15.20.5709.015; Sun, 9 Oct 2022
 16:36:54 +0000
Message-ID: <386fe4ae-0fae-0822-f86d-f5903369b424@axentia.se>
Date:   Sun, 9 Oct 2022 18:36:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [v9 3/4] i2c: muxes: pca954x: Configure MAX7357 in enhanced mode
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     robh@kernel.org, laurent.pinchart@ideasonboard.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221007075354.568752-1-patrick.rudolph@9elements.com>
 <20221007075354.568752-4-patrick.rudolph@9elements.com>
 <20221008125436.ndj2nwesx5lgppsf@mobilestation>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20221008125436.ndj2nwesx5lgppsf@mobilestation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0038.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::22) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: e7290a36-f232-483d-9b70-08daaa14798a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9gIQEFLaBD7MV+cLZelxqmU3ub0j06pi7YQ0oGs7MQSHVZN0ajuE5KE98/sbXiSN/qOlTn237TWLHn8nIRcL3ffynqA7IX4bIigCVmHpdhLz+ZyhuevVhLllTV0K4n1iYQS5HhyMl9BaX1pPDV3EVH44vRstzuWAGVXBvBQevM0JbjvigqYb9dypoUYvKCGgE44GNy9OSTVlwqqQ+Pc6s4rbHUey3aeV27TtyhAzbEdy33nE2qAvm5vlBoPGFFy7t3zLzEVxOQ3QyjBcelc8vJvi2fnnuNouCyucq73a/NBBABp8Nd3NwH4roO14ZSGm+FdUiDFXL3uXQFS0b+I8e5qxY/krtKpkbAN4Gg2rfZXHoyLpxCZx5NtT3XeMPfn2GaJOyheRXnw7TdPKVeN/jgX2p3dl/DHqgKqRuxPyuTMBmDVOh2toEU4QzSf6vlwIR2RrQkIEV11iMe1i1np7+JE9kSCKCU85edSs28fNKcQ5O+3SMW97f4uXJQ17ndAhcrAYctthOqZc7J3Y15Ehj648MCUSNCS7HOoH7ej2PRXEqnRH6st5tcQFQtWkxyCUdzt81uZpb8djDJwg3a9DsQGsPV52lS8YMnoOaWlC2hYbQA53bugTSIMgNNUt7OaPf2eThu1ildtFI8GswIqjwkDmkMsEqpy32yC4MsKCHTijQyScYSYDUbHAgGuJvlRK5kGmBqszOmqir+2Wo7AEwjXHNtkd69Cbz0pFpLNDjrs2fIamB5bW+ZwGLsXmwWi0YWyKtuItUjtvHpevZDYniHhm13LIE9MRewt392ltEdg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39830400003)(366004)(346002)(136003)(451199015)(2906002)(186003)(2616005)(31696002)(86362001)(36756003)(38100700002)(478600001)(316002)(110136005)(31686004)(8936002)(6512007)(5660300002)(4744005)(6486002)(66946007)(26005)(66556008)(66476007)(4326008)(8676002)(41300700001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zmw5ditoZ1ZTQkF3bWFOT2N2ekphNWhheXZLajBCQkpjTjlrVTZyWjl0SWRZ?=
 =?utf-8?B?WkxMbUdySWsvbCtmSnc0YmY2RTdCZndzWncwbmFWdWFKanY3aHJGU2x5Vlln?=
 =?utf-8?B?ZUJ4WTlXODloZVpKVU9ZbXdvUHJjKzdwZUhuVzFpbHZFb1FSSmVTcVdzK05D?=
 =?utf-8?B?R0crOWpNSitIWmxWLys2eU9zc0p1TFlQTitjWmptSEF5eHg0NHFZc2tPcTA3?=
 =?utf-8?B?QVJ3YjNuZVd6eE9WQTY3d0hxY2FKOWFIVjJPeVprYXRWMTRZbG16MmxrWS9I?=
 =?utf-8?B?bk9FY0RzWHVaR081eENzeHljRkV5UWtDSTJUSVhVVUhCMUFBc3BwaTd3b1U2?=
 =?utf-8?B?QXZLVFpld3lYb1VCcy8xdkNEYm5XSWhPTEhnOXhVZk9GOEV1cG4vTXFGM3RO?=
 =?utf-8?B?UDdQQ1lCU0lWYWtEdzV3aU5OZ3h1bEUvL0MvdmJ3cXRkVVFuZFY2VkNoODVK?=
 =?utf-8?B?VWdGYk1xR1dGdExvbDM4c243NUtzUjR0TmlyU0dZeDdDUnQxamtIbS9rVmUw?=
 =?utf-8?B?WllITHpTWERtVnByZlRwQ24zNWFGd1h3VnRJY3pIVFdqU0RCUkxuWkFrYmVS?=
 =?utf-8?B?bFUvaEd1NUF0d3Mvc29laDNvekJxUTlReEpiUHpvSHZrTVJDcG51MTR1b0Er?=
 =?utf-8?B?eUpqQ1BIeWh5VFo3K2ljZ2xwbWs2anhaYVhtbGx3aUtsdTVKbG56OGZZbW9C?=
 =?utf-8?B?bXlFeEN4eFk5NFlnSVdRa1BBaldTRGtZOGFtM0tXUTFoR0t2V0x1YUJzZGIx?=
 =?utf-8?B?clNpd0ZhMEJNWGRNZi9NekhiNUJFcWtBUkQrZmxFR1owL0ZhWFJUbzJjSDl2?=
 =?utf-8?B?Q0lrMlc0WGwxL1NQTjJKWHVLU3ZRTUxWNXFENmEvbStiZmNBYlE3Y3VWN2Mx?=
 =?utf-8?B?T0MvNkRkM0dGMGk5Smx6aE81SDRleWlZZzJrVFZZNWRyRjlOeDArcFlCUnhy?=
 =?utf-8?B?ZWtESW4rZ1dFU1RUNFZHUlE0SVk3bXFTN05oZFJCenFTemJLcWxDOW5scEd0?=
 =?utf-8?B?VkEwKzVuK2djU0Y4WFovR28wYW8zWjBYTmV5TGR2dlpLTlZVM0hsTU9yNjE3?=
 =?utf-8?B?WWdIb1lZejVPVmlxTkpZNWpLSnA3YWtNQlEvd0lyam5WZFd1TUJTQ2FtSjJr?=
 =?utf-8?B?ZkhSTENXY2VGUGhUekNNbjAvTm5tTzRlS1o4aVpralRSc3BzYXFpQWtrS3Vx?=
 =?utf-8?B?RnQ2eWhrRmJKVzYvQlh4UHpObnlOM2VxNGVLWmdGQlozd1RsMUh6MFl3TW5p?=
 =?utf-8?B?em1vM3lWellQUjU1ZWowbkVkTW1FbjZPSGUvWUE2ZlVEYkN5aXhWeDJGMHBO?=
 =?utf-8?B?aHErRTF5T3lJU0MvajR2YnlCNFZEemtiTEV1a2RSd25JQVhyN05RTHczUjZk?=
 =?utf-8?B?NXFaNTJJcXBJNFJtUlFhZUh4YWs5aW9ua0Y1WGFjWGR4dFcwMmk3UjJrb2l6?=
 =?utf-8?B?Q1lKdUtSZ1FKZ3BWd29ZMW1BOHdnNHRNeEx0VVJyVHl5Y1YwMFFhMkIzdkFH?=
 =?utf-8?B?RWNJRVRGNFFzM05Ld3dCenlVQXhuVWFaeXBmVCtkdEJZNzh0Uk0rYUJ0bWw5?=
 =?utf-8?B?cUF2YlVWQzhBTllRWlZYYUo1N1R1WFRjMzFpVWlmaUJuMVJDZ3lmYTlBK1FQ?=
 =?utf-8?B?dzZLSUd5VzBUcEh1UGRWWmVpM3h5aTl2amhIdmYvbnpldE83RmJ2TUJrTWxp?=
 =?utf-8?B?ZVBZY3FzTWdsUVE5M2oxa24xajBoZDJRZ1Rna3NzL3VqT2dVUithMUtzcGlO?=
 =?utf-8?B?Q09UT0xrd0RxaGVDODg2RkFnb0N5N1N4cmZESjZOTysxQVpzbmVncHpENWZE?=
 =?utf-8?B?ZVBYbUlxbVFmVU1HNTdXMUlXWkRYd2JsTVhSRDQrZHMwQ3ZySXkzOHRlNGxq?=
 =?utf-8?B?MEtDT25EUi9GZE4reFlYTm94OUlzTG5XZzhwNU10dTBUQ3d1b1FxTnRhY1Rw?=
 =?utf-8?B?aWlkRHRMRCtyd1Boa09SYlR1VmpWaFRHN1ZjcTF2czk3NGhQUHQ3Wm9Qc2Vq?=
 =?utf-8?B?NVQrUGNOaFdnWGkxVkFlNzcyVkp6c29MVmxtN0cwcCtOcGVNYUpJbDhmUDQ2?=
 =?utf-8?B?ZFo3azB5MlBKaTEwTHBiOXhVUVZtMjNSa3lGMEhHNmIzcitZanlxcHU0L2hN?=
 =?utf-8?Q?UadtUn3MS4s6sxl9YQzBrfeqR?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e7290a36-f232-483d-9b70-08daaa14798a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 16:36:54.3259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpJcTKLwXeFJFW/y9f9Odv7tSwhc5YJFA7dWAbbIrEYacvpdZrHrZULUrj/GuPs5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9017
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2022-10-08 at 14:54, Serge Semin wrote:
> On Fri, Oct 07, 2022 at 09:53:52AM +0200, Patrick Rudolph wrote:
>> +	u8 maxim_enhanced_mode;
> 
> So long name.( What about a shorter version, i.e. max(im)?_enh ?

No thank you, please keep the long name as is. This is a corner
case and the name is not repeated that many times. Spelling it
out makes the code more readable.

Cheers,
Peter
