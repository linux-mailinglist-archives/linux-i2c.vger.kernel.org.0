Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF4B79BEDD
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Sep 2023 02:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243557AbjIKVSe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Sep 2023 17:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239034AbjIKOKF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Sep 2023 10:10:05 -0400
Received: from smtpout30.security-mail.net (smtpout30.security-mail.net [85.31.212.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41046E40
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 07:10:00 -0700 (PDT)
Received: from localhost (fx306.security-mail.net [127.0.0.1])
        by fx306.security-mail.net (Postfix) with ESMTP id 9B58135D018
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 16:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1694441398;
        bh=cgxEx/N/BEziqW2iImMhgOEqaeHxrs5Y3+cFJxMVl/c=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=gb7d/7sPMHTSuFZmRrDi/QZIROxt1hcD7xcU57W82ra9peo9rO5pIc15wSfhI2BuX
         OR82Xo9S5dTcQg9bpFJBw0HdUuwFSDYfWZfzJ5ZUWwoCmo3xS1J5E0xN7iH0r9bq8o
         M1Yz2Xubf1HSXu8t3EdDNoSfCzo4xhD0GKp6FoMs=
Received: from fx306 (fx306.security-mail.net [127.0.0.1]) by
 fx306.security-mail.net (Postfix) with ESMTP id 7C13E35D03D; Mon, 11 Sep
 2023 16:09:58 +0200 (CEST)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0104.outbound.protection.outlook.com [104.47.24.104]) by
 fx306.security-mail.net (Postfix) with ESMTPS id 08AAB35D039; Mon, 11 Sep
 2023 16:09:58 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by MR1P264MB2452.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:35::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 14:09:57 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca%4]) with mapi id 15.20.6768.029; Mon, 11 Sep
 2023 14:09:57 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <9c0e.64ff1fb6.7618.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JseX3Rm8zbHTa6NCRwAi2Do2uYuDMs0GBnJwl6n3+YAO9MuQfsTfUyGhS0oWZgS2Gh2Dq/kMQ3FvRgNZUmNuYA2T8qH4RNIm6tsEOKvR+jgk1pSHnc7REDFH+2cP8+rZu0zVs1zFXhNydzpWwp28Jyl3VGr9xMPwatl+Z02sdndh4IbQaS3rlFh1Gnos/v/qPOQcFtkw5v6zbk6wukZYdZRNRdH9r/UzneL23h73QNSjUwsCm8OntCyOepdaKKIqI8mo0xoumLcrmbHMRYUwq/Rytb96W7qCKrMMxiv9qscQVoSw0XWDYKroJZJHmrZnkiT7Hi7X2SwjtIG1P8Ptmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQt1jW+i8wShrbw3mrakV38xbRwi/ykgMUVXF4S88ZE=;
 b=LTVsrYL+B0K0w4GVfOE5Hg/y5nDDUn82eypfF0zSMtZwCDngAAuIjZmwl/JcqIGpOwljQVgoHDr/MqpZevbCW9+asmY4Ir/oo+q635RptoNW7muAcdQLDVJlX0pIdlDsOqbL0N6Uysf+ohBax66ID4zNTtjGXn0P2EABIH+mQxrmlIiFXU4OH1seDzXTiK7ZxEokF2jZ4jhiEtCDa6NIesdzRrrHaIN2zMW4r/V/XA+tUp9RFo7ns/p/FuwixKSXyhsKkUdwHFfk08CTEnuFPJgKxLHJlwLE0oEWQpi5alq2gVusBccw3TylLcLc10d+aUlSH//Q9GGeEUnk/4ishQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQt1jW+i8wShrbw3mrakV38xbRwi/ykgMUVXF4S88ZE=;
 b=aHTA/gNriGBwtrlhHO07KH5fs0MDIbelU3h14aUhrERs34zfXtPnwYf0e3m9KI/IwSjSg07IMjynPfY8WyMPKvUwXDQh1cXJGfhuZZMXiLl290ln00S/XzUiVXgfOT2ZMTmZisUQeYlTZK+w8JoF4ZMzVXb5N+00pEV4+rw57lsZ7ovTfVptV8Cz+yeZY+w+S/CycWUCGBgTDb7g8M8qtYr7p54f3bV3R1SQgmcRQGJ0AuxtuxQCiT4WZ/4HJEKiq3KXLtAZs2BCjIfT48hFA6MiPxJ0vnG15rmMW7xCZR8+zWDX254+NrAyAQVxzLKM7GpuL4MxVDRtnnvYD3hCMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <324c7e30-1b52-1cd9-461a-e231f8bf5f24@kalrayinc.com>
Date:   Mon, 11 Sep 2023 16:09:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] i2c: designware: fix __i2c_dw_disable() in case
 master is holding SCL low
Content-Language: en-us
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Borne <jborne@kalray.eu>
References: <20230822090233.14885-1-ysionneau@kalray.eu>
 <483369c5-2042-486f-ad95-10bfb1adb444@linux.intel.com>
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <483369c5-2042-486f-ad95-10bfb1adb444@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0366.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::18) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|MR1P264MB2452:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4b87fa-eb40-421e-10e1-08dbb2d0c747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dK/qJNDUkf0Abw2ZbVIPKxAhG8F8AatodY6KgwpuBq0eiaO+5n6yc4r6iLBlkm8DrSEV0DRxWOLfC+PnWnixlHWpMjmZFo0tEyNR2k6U7u2ovzksf8b7jg4QbtkP6GeValIoE9G9eGdP4ZFnwWnzQ92rjXF1j7Ll6BxdPDPd9ChQ+f3vWmWXtPdov9drYf7QKpBKMMPHeGpXlFjSb5kWpvAP25obtM9Ms8jPueJMzNWsWuIo2WVyOKPpnruCS3vMmgsBWSpRSRoyrsWjC2OIx3NrFySUHlwUTpo0vbOHSuo32AI3DMONGUOQP1imWmxxDAQ/x+F5/Cfh46sYJUTmSFCgxsNHjv9bu9sBpdLor5u0BXwysWW6z9mseRZqZ4DOfpepQw8X5DmH8Zm5DkgmwC+hfcOtJVGNNVrxRRbrCjSVUK54yKkM50X2hFNqmE48nxzvW5TPdHeYubF+Rvpt1b2IV409+jwZOEkosjumCBcLEzDlHAeh3jq92yiTl1TB30af+ch2uGnAgesHgpaNbpzSef2xQSEIqM+9ceE6zlh6VQHUzgZIGZdJXT6cucwBcnji1372CCa3dHUQmaP6KVzcaiRtYStxYsvvpm/PIgh+P5FHgHZ+lJU5B1Fdi26h0i1XtZ9c+wa31ZJFQ008wcQoHwfTeoAjwPJT3zNPavwmw1HpHlXsRCHWorE/kmfX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(1800799009)(186009)(451199024)(110136005)(26005)(31696002)(2906002)(86362001)(107886003)(83380400001)(6486002)(2616005)(53546011)(6506007)(6666004)(6512007)(478600001)(36756003)(38100700002)(5660300002)(8676002)(8936002)(31686004)(66476007)(66556008)(4326008)(66946007)(6636002)(316002)(41300700001)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QeuRE5KYynrRsdjAsRTsXFDKqIx5n57Mhh8amdsiKWw+VsIFVB80csAIW0Axoilk610HhxGTW+UDW2sEfvzRxjjy1syiv5ijT6feWqpH0v4ZJ2ub/L1umNPn7NXVnPvlFGT5GsQzBjM60TGpbwdmEgDVUm/1Md4PtrIS7yeYkbFvvO0L2dzjWO9YrltYzfl20FhZw4LzuwCBXtL08xQB7JFyijW/ywMxM0x8udz2NTXvBbPZBMrazHJae2Vnooe/Riv1d7hZy+5yqqCnpwfeT4F7Ea692gUK4Ko36oukZVfPo3z2xzy7A2QGarNBVI+qDQEJAU5AInuH6tBblvcKlvy0FtoLLY5HEX/cLk1nc5ekc79CeytOAld7lFrB+l8CpVRKFqJbpj2NTA/JYzt0w6rzx1FJ3RNajGpFMPMiq26yiEe41rpr2YGZDzA90WZjh1JGzWMkOuz8PrHDfEqhvlHVoqyWzcXi9hAJ/DLFezG5d6UIF6+RcI6YB2fjxnaBUPauAYLuVAlqxtuilJSRm5IjPtxfi84ptn0vCmHHBfVbozafzh8uxc49kfRkUZ02EQXDEIJE86yArGTqXaScwwWIQBYMjOinDz1PzYChNjMU0z8zpMMqf3Zs3qE1c8T3QGTHjAXBiJ3Uz21NcfVumddHDIpGH793cH2B7cQ854TwfTjG1fuEwjC69Xg0zSgL4NoRYrhsv8XaLnIj93Rz8f+qZ7KAoLhjW08As70yh2Eiif2bnkVmC3Dh0xXGSPSdz0zi3LuRC0umwDsS+VufcBNq18CgXd/qmsnRDbFLdKh2IoHLpsjth4ZXtv4dVY6+KK3NyGWGr6UgfUDpHg6bCt2QKdyD3szTuV4LDchlTmNkliuQsDt2Sw2sWUqQetUdz5+mqPzEP2SiP+4AP0y2b+vfF4wzyCuiLMMAYyx3JHdoI+ZrIARsumApgWH9V5/U
 dPV+xMMT52bUedvxOJQy8o6T6x05vEzKAqND9r0UZFRQYunSwY2LKlIXSA7DfGmGO7/lHUTbPj5XYss/9CEGC9V2YctpN2SCrhT6eNsZuUMRY55V5e2H0Rq5AH+ha2HSyVCwdGfTBL7hxRM4SMlKNERgoTzcOQpCqZgntfhHj8pu5PvKrQNp0cvF7u23SNGlaHUYs3ASiHOxeTWJlSQGNDAIqtJbNJ93QAmCx9CkhtlNp5fAmf2vxC5EKKxrF8jQ8FuKgaXWNAbRVQBCQhHyfU3xXbmSTITGfJiyYkB8KYp1u5XAxdGFe/zsQEKPjy6mJZoAVDxyyJ6SPzoDAoP+atnUYrT2fvlncmPBC8pX0kUi7+1aBvFqzWLiak/M3SJEsQQPjhVOsWhp1HNQCM3LFdtVYpitUF1mfz3lHMvvrTdXZkuk6mY8vJWRhM0DAIm/L4LbRVppwc+5Ad+OvfPwfm+J2ftti4lu/iEXGXRKRLs6Kmb9O/ABGbUunCLT4vWlBARdUizQ/GdTn4jUzMSGXd3xfUmgxH7yMprsXDPalqIxvEWxfmZZ0DqL+0jW1Xj2wrKrAr/0YfVNI0Brjt6ToaYh7IEiAji4ru9FB/+SuAlV0rda9cyBDRaFqNtNt3Jx8XjOXwEjUGbEjsGO1Ghg0Q==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4b87fa-eb40-421e-10e1-08dbb2d0c747
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:09:57.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baRQDaxe7hVzg7fY4TZSub8lw+YfZtOn3ShNLv9NQcjUIG/NY7NBrvxt1/OReh75W/3jteQbO+T9gvwSeBrviA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2452
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 8/30/23 12:42, Jarkko Nikula wrote:
> Hi
>
> On 8/22/23 12:02, Yann Sionneau wrote:
>> The DesignWare IP can be synthesized with the 
>> IC_EMPTYFIFO_HOLD_MASTER_EN
>> parameter.
>> In this case, when the TX FIFO gets empty and the last command didn't 
>> have
>> the STOP bit (IC_DATA_CMD[9]), the controller will hold SCL low until
>> a new command is pushed into the TX FIFO or the transfer is aborted.
>>
>> When the controller is holding SCL low, it cannot be disabled.
>> The transfer must first be aborted.
>> Also, the bus recovery won't work because SCL is held low by the master.
>>
>> Check if the master is holding SCL low in __i2c_dw_disable() before 
>> trying
>> to disable the controller. If SCL is held low, an abort is initiated.
>> When the abort is done, then proceed with disabling the controller.
>>
>> This whole situation can happen for instance during SMBus read data 
>> block
>> if the slave just responds with "byte count == 0".
>> This puts the driver in an unrecoverable state, because the 
>> controller is
>> holding SCL low and the current __i2c_dw_disable() procedure is not
>> working. In this situation only a SoC reset can fix the i2c bus.
>>
>> Co-developed-by: Jonathan Borne <jborne@kalray.eu>
>> Signed-off-by: Jonathan Borne <jborne@kalray.eu>
>> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
>> ---
>> V2 -> V3:
>> * do not rename timeout variable for disabling loop
>> in order to ease backports
>> * replace abort loop with regmap_read_poll_timeout()
>> * remove extra empty line.
>>
>> V1 -> V2:
>> * use reverse christmas tree order for variable declarations
>> * use unsigned int type instead of u32 for regmap_read
>> * give its own loop to the abort procedure with its own timeout
>> * print an error message if the abort never finishes during the timeout
>> * rename the timeout variable for the controller disabling loop
>> * with the usleep_range(10, 20) it takes only 1 loop iteration.
>> Without it takes 75 iterations and with udelay(1) it takes 16
>> loop iterations.
>>
>>   drivers/i2c/busses/i2c-designware-common.c | 17 +++++++++++++++++
>>   drivers/i2c/busses/i2c-designware-core.h   |  3 +++
>>   2 files changed, 20 insertions(+)
>>
> This doesn't apply against current code. Looks like your base is older 
> than v6.2? I.e. before commit 966b7d3c738a ("i2c: designware: Align 
> defines in i2c-designware-core.h").


Oops, I've rebased it on v6.6-rc1 and re-sent it as V4.

Thanks.

Regards,

-- 

Yann





