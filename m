Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D6A526D1E
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 00:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384941AbiEMWtZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 18:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384907AbiEMWtU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 18:49:20 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2114.outbound.protection.outlook.com [40.107.21.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E528354BF6;
        Fri, 13 May 2022 15:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nb4oon70OpVJTUooKX4FJ1tD59YvVw9V4Hxm4aDyyKag0uNiOuGk0Ocz0SC3hALjw1fxuTRxdx0VdHwJQP93xkQ8ggtrwg2Uf2N0twL0Kfp2dCjD12b5SNAXh3MInjpAdta0C5NZ/BvLl6QgEandq83AnYxM8HgLeLCf4IMLOsEIbuT/otT5qNqOHs9ndyBn7GDr68wXFhgj2LR9zF3QMnZO9OWIqizLE4vKOX9vplPI1x4NQJdi0t30lWlLUl7Tl65UPMngtFRearWSs4VTWp0IrhOVk24SO/iRm06AV+PbW6crfPxcTgDAcuGdZDnYgwtnm3wcBp6F3xqUPWZ3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQ7aJKDd6SaEyYbj46CLz43P4zhB6yZhoHmJ96pA1fI=;
 b=kkNTaeUedcY7wP1DOxCZkGKrIbCMSUWbU0w53/I8JUVgoC0Vz5Cm78d+DMa+x9VNxoew+3vwyLah3lC3r4B77YLnIU8aq1A0AGdV98pW47tJSMP3bx7GFaOZ9SiYA1uFhMDcseVobQnpawIFHwBCejN+uqysdEMtm27UT3wXJ/yStUVDyMbDV15kwCBiDEnemNcqU1zYN2c2qJvSwQoJCTIuaTVer6TGDlqT5xOdLyBoNu0xa3NUOCdCmiiAGDnAi8AJoAzf3ntJYgo8nbBzCyeEOhFHWU+5QCLfXpFLx7UnkNKsmGtuI9KxwVpvzhX3H4+5Il6vzhXbtu6igjZs3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ7aJKDd6SaEyYbj46CLz43P4zhB6yZhoHmJ96pA1fI=;
 b=OqXMq9Ql4Y1QDJTpmzkvzC6iMk7+UWRaqO5A+Nu/xIW/xyxexFcilNK2WlKY31iaiA0tsVbmk8AFh82N0pG5G4Tc0IZJHYQfazurGQ/yz2NCJNXwz5FdWY3R7aNRXU9UaK4Hw9mGrrm8cNsEPtpWoS2QBCsylmqq8vx0Af/PMZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM0PR02MB5762.eurprd02.prod.outlook.com (2603:10a6:208:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 22:48:54 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a%4]) with mapi id 15.20.5250.015; Fri, 13 May 2022
 22:48:54 +0000
Message-ID: <b2761479-50fe-0dce-62a2-3beff5cdef9d@axentia.se>
Date:   Sat, 14 May 2022 00:48:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/2] iio: humidity: si7020: Check device property for
 skipping reset in probe
Content-Language: en-US
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Eddie James <eajames@linux.ibm.com>
Cc:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, lars@metafoo.de, jic23@kernel.org,
        miltonm@us.ibm.com, linux-i2c@vger.kernel.org
References: <20220512162020.33450-1-eajames@linux.ibm.com>
 <20220512174859.000042b6@Huawei.com>
 <4fd44316-689e-1b72-d483-2c617d2a455d@linux.ibm.com>
 <20220513174531.00007b9b@Huawei.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220513174531.00007b9b@Huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0060.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::30) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30d99009-2909-43b5-f75d-08da3532c1a4
X-MS-TrafficTypeDiagnostic: AM0PR02MB5762:EE_
X-Microsoft-Antispam-PRVS: <AM0PR02MB5762FBA1071546F02A0BB9D3BCCA9@AM0PR02MB5762.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bUP8mJPDvmj+LtBD2BiscMKjUAdohb6S1vRIaR8aSpxLtRyz9nXNebRbWFSZs8WCpuZFCjDe6D7Vu8C7Y7OM0c4YK23gy6jvYUAlfA/Xs3/02XKs4yDM+Zl3Q3/KMFL2u3YcoXNfvb1BTYw5P19SwcoUKrEk0btC2ww+RfW3hDfCZB0q1lIZY5JwGspVO7ms9wQNibEsge77Ki/8CShL5xS2/ROgjh2iU0aG7/GS7z5cQBkZAvTSgRPCFFEjO8mRvB80aD6aEMa+LYl0qDiDWme3XdSu33jHw0R5fGnvGVGzLvqwnE9gnb7i86JMhjCbN84YtyvgPNIweY/W4onCb3MSGkhY0rbFkcm+CsZwmsxJ3vgo2VDivl9s9TbYb1XCEbIPJUc5WZDbVzaMTwRjMCH1pXudSnWMDs8cOzCtECco1EtVtZfpH4EQQcl1g/AuVlUCQGJLwOZgvhbPFb9uCqX1HG96ZgVZggCZwCIMEE3a0l4Cbmy5/zFQIRFLaN3cW+Wgm80LYOZKs3V9Not0tNXLg97y/1HCcc1rZRR7hi5t+vP0aP8RuzIUSnzZsCzzKQgejapnHxqxszHkiDAcQNeiweAvpdR96kbEUBrVmQw53K/x+VIZJdQyYSD0o6PWzmgMbdoUx8EWpCCraGTRGiNuFaZeacobtQ183cMat+R8Su44arRd2TNMIr2qjSVsgLwZW/4T+xEvljLuVD7/gPVUvWOj9YOTkWMOnabpfdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(39840400004)(136003)(376002)(346002)(396003)(2616005)(53546011)(6506007)(26005)(6512007)(6666004)(36756003)(8936002)(7416002)(2906002)(31686004)(5660300002)(110136005)(66476007)(66556008)(508600001)(6486002)(31696002)(316002)(8676002)(4326008)(86362001)(83380400001)(186003)(38100700002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amJpblN4bENiN0tFdnVrT2tQaVErMlFkcmVIYjkzQWVQVWpqSXQ2SkwzRWZG?=
 =?utf-8?B?cmwwZVJ2dmlNSk80TkM5Z1cyTE1zRDFFaHZLbGZSQXg3MWhxbEsyU0Voa3ZO?=
 =?utf-8?B?cnJxVWluMkpHdFdBME9oQlJjOG1ENlNpTndIbjdoZThOMUhubW1pbnhiaTFt?=
 =?utf-8?B?ZHhjeWRMaXlRV2l1cmt5dGx1Y1FGQUFWK1drK0ZGL1lRMVVUNDRteU93V0E0?=
 =?utf-8?B?SEUzMFhaRjNYeGJGVHo0UDBpaTdqcTdSOEMrNEtBUm5iSEhqZTgvTU1IVHJo?=
 =?utf-8?B?b1dlc3NhMFkwTitqdWZSZ0I0NWk5bDRjSmI0Y0RkbTFNaDlEUXZCSmF1RGpq?=
 =?utf-8?B?ZkdvRUh6OCszSDE5RTZ5cWMxdWdqMEZhRGVFUENHcEE1eU1xTkZSNW1TQ3lp?=
 =?utf-8?B?ak5MVTFtOFRnRU85eno4STVKV3lYdy9SVWNFSlZxMmRwR1IzZ1VJamkzTUNi?=
 =?utf-8?B?QlV3QjFPZSt2ck84WnV4TWRYK1d1Y1NFRlhUUHVtbUQvRVZNQWdrNk1sVk5O?=
 =?utf-8?B?WUJMbDF3TUJRUSs5SlZaR1Y2c3dpOVl0UTkyRU91SUF0dk9mc29rL0Z1bGZv?=
 =?utf-8?B?NHhjcjk2cWhGa3VHckFOWW93SnltbFhZWHllbFgrNGJsS2o4TWR5eE8yVjNQ?=
 =?utf-8?B?WkdWZ2dzc2p1Sm1uMVJzVmRybWhEWi9nZm9pZXFIUGhFTWwwbXdDdTZiMU1s?=
 =?utf-8?B?dnNFWU5OdTVabi9HR2JlYkF2VS9LK3NKVzNFakswN1ZTdWFvNThHRFJMTWh4?=
 =?utf-8?B?WUg3bS9GU3A0RFJhVzRObjdqcXRSbGttVkRiZU11WmxSZTViWUhSdEpkRk8r?=
 =?utf-8?B?cUpMZ1VUWFNpb3kzcFl1SDJQOFk0ZFd0QjN3cVhvelV5Zk1LMFY0emZnMDQv?=
 =?utf-8?B?SUNCU0EyWGpLQkdxN1k0Vk1JQjh5d3h2a0hyWndNLzNaRlJYck9wZ3BhaCs5?=
 =?utf-8?B?QmJZd0NMUm1lNjU1T295UnhLNWYwK3ZENzV2UTRJSTY0eWxLdnl0K2psSjZu?=
 =?utf-8?B?MTVNSHhLS2tVNEtKbjdnMWh2UkxZbUd6Uk9QbVBrWmptRDJJMEh1cFJLR2Nk?=
 =?utf-8?B?QXJGdjZHKzluY2RZb00wWm1hLzR2Rkc1UXBkRWFWSjl4YnhkVlJiU2dQVnpB?=
 =?utf-8?B?WkZwNmN4RXI2ZzF1TVp0MUtjZzgrMTVUMU9zVjNNb0ZuSVFVSnlNOEtCdndG?=
 =?utf-8?B?TFJlaHVjcG9yMXE0YVh0b1JPRHk1WERJT2F0ODFtc25iMnY1dzNYaXlXZ282?=
 =?utf-8?B?ZmNuaU91cGJ6V29TVFl5bWVSem5oc0NGUzBLOHIzUC84THVHS01sZnRXaHp1?=
 =?utf-8?B?WjhKempOY09STG55VUxIWEZxaitxYWlRMmxxWjZjMEtvTkRGYjBMbnhmYUl3?=
 =?utf-8?B?ZDIrSDlvSlN6TUJsaTBqcE1RSjFuRDZDa3ZxOXZnYlhUMGd6Ym9KRWpjZ1pS?=
 =?utf-8?B?bnhjL051UzJIY29DKzNkWTJjaUJ4RExoRWZ1alp3b1VWM0lWNE5xNWdkUm1G?=
 =?utf-8?B?cVZDNHZwTEczdVFYTXVCdjRYL3p6WWNMY2hUSklCc3lNU1JNV3R4WnJDeDJk?=
 =?utf-8?B?YnlIN2VvcERqR1NzN21acEs2L0tzM3Q3T1VMenIrZ1pGbmtzeEtmSWduYWJH?=
 =?utf-8?B?cWdnTGpwTlFBSE9VOERTQkVmSDQrbXAvQTJWeSt2LzBlZkJNYk8ybHNubW8r?=
 =?utf-8?B?aTZVUVcwUzNjNVJvamp4azU4cGZ2RWVWOUQyb2NkQ1dsSDdWcTVmZjBJc3hB?=
 =?utf-8?B?dGdNRHI1TEV5cEJLSkNDOWNHck1GRzYxNG1GeEc3QzdTQytwWi8xMnR4ZTVj?=
 =?utf-8?B?RWRoMmJYMGRJOXNnNlB5VkFoU3N2M2dtcXJnNG13R0laUHV1TDg5UjNUTVhV?=
 =?utf-8?B?QVhOTmR5Ly9iK3k5SlV3b0FKM3F3cExYM0pNQ01nMEVsdUFzbm1lYjA2RzRS?=
 =?utf-8?B?NkhXdW92c0RsYk1ZL0hEOHdFSzdqK1JMUXUrSnVwWFRGQjM4V0FqdEk2K0Vz?=
 =?utf-8?B?US9RdXpURXMycHQrejA0UGk1V0NYRktmYm1IVXlXeUdaTVF2NDBCOUtpQW5j?=
 =?utf-8?B?bjAvbUtXdklUd2VZN0RsMnpwMURuTUd5TlB3OFQvV0VjRzdyOFdoemtuZUxj?=
 =?utf-8?B?RHdacjkxZTNGUWU0Zy9HMkdpZFpTemN3am9HWXFPbUZ0ZXFZa1lxdnpkc1dp?=
 =?utf-8?B?eFN6aWx2QlIvcFdXU0FzZCtnR1d2VDNRTGlGUk9ueEhPZFRBUWF6NVkwa3JG?=
 =?utf-8?B?WjdHY3hWaEh3VFNTMTltL3N2QmQ2K3VPNWZxYjJhQW4vaytYWXdTTFhDTjRR?=
 =?utf-8?B?eDAzUmg5Vlo1QzZKV1lWdDhqUFBEQVRCSXJhWlRSYkpCU21TZmhxZz09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d99009-2909-43b5-f75d-08da3532c1a4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 22:48:54.1828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Md+cb4xNP1p54bNFZnMchhl5H8hV9YCos/ryTWcRjTFoVDKTszIG2A8lqhnTvmb5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5762
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-05-13 at 18:45, Jonathan Cameron wrote:
> On Thu, 12 May 2022 12:08:07 -0500
> Eddie James <eajames@linux.ibm.com> wrote:
> 
>> On 5/12/22 11:48, Jonathan Cameron wrote:
>>> On Thu, 12 May 2022 11:20:18 -0500
>>> Eddie James <eajames@linux.ibm.com> wrote:
>>>  
>>>> I2C commands issued after the SI7020 is starting up or after reset
>>>> can potentially upset the startup sequence. Therefore, the host
>>>> needs to wait for the startup sequence to finish before issuing
>>>> further i2c commands. This is impractical in cases where the SI7020
>>>> is on a shared bus or behind a mux, which may switch channels at
>>>> any time (generating I2C traffic). Therefore, check for a device
>>>> property that indicates that the driver should skip resetting the
>>>> device when probing.  
>>> Why not lock the bus?  It's not ideal, but then not resetting and hence
>>> potentially ending up in an unknown state isn't great either.  
>>
>>
>> Agreed, but locking the bus doesn't work in the case where the chip is 
>> behind a mux. The mux core driver deselects the mux immediately after 
>> the transfer to reset the si7020, causing some i2c traffic, breaking the 
>> si7020. So it would also be a requirement to configure the mux to idle 
>> as-is... That's why I went with the optional skipping of the reset. 
>> Maybe I should add the bus lock too?
>>
> 
> +Cc Peter and linux-i2c for advice as we should resolve any potential
> issue with the mux side of things rather than hiding it in the driver
> (if possible!)

IIUC, the chip in question cannot handle *any* action on the I2C bus
for 15ms (or so) after a "soft reset", or something bad<tm> happens
(or at least may happen).

If that's the case, then providing a means of skipping the reset is
insufficient. If you don't lock the bus, you would need to *always*
skip the reset, because you don't know for certain if something else
does I2C xfers.

So, in order to make the soft reset not be totally dangerous even in
a normal non-muxed environment, the bus must be locked for the 15ms.

However, Eddie is correct in that the I2C mux code may indeed do its
muxing xfer right after the soft reset command. There is currently
no way to avoid that muxing xfer. However, it should be noted that
there are ways to mux an I2C bus without using xfers on the bus
itself, so it's not problematic for *all* mux variants.

It can be debated if the problem should be worked around with extra
dt properties like this, or if a capability should be added to delay
a trailing muxing xfer.

I bet there are other broken chips that have drivers that do in fact
lock the bus to give the chip a break, but then it all stumbles
because of the unexpected noise if there's a (wrong kind of) mux in
the mix.

Cheers,
Peter

> 
> Jonathan
> 
> 
> 
> 
>>
>> Thanks,
>>
>> Eddie
>>
>>
>>>
>>> Jonathan
>>>  
>>>> Changes since v1:
>>>>   - Fix dt binding document
>>>>
>>>> Eddie James (2):
>>>>    dt-bindings: iio: humidity: Add si7020 bindings
>>>>    iio: humidity: si7020: Check device property for skipping reset in probe
>>>>
>>>>   .../bindings/iio/humidity/silabs,si7020.yaml  | 47 +++++++++++++++++++
>>>>   .../devicetree/bindings/trivial-devices.yaml  |  2 -
>>>>   drivers/iio/humidity/si7020.c                 | 14 +++---
>>>>   3 files changed, 55 insertions(+), 8 deletions(-)
>>>>   create mode 100644 Documentation/devicetree/bindings/iio/humidity/silabs,si7020.yaml
>>>>  
> 
