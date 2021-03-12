Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A682E33822D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 01:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbhCLAUH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Mar 2021 19:20:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhCLATj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Mar 2021 19:19:39 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23B5C061574
        for <linux-i2c@vger.kernel.org>; Thu, 11 Mar 2021 16:19:38 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A3441891AE;
        Fri, 12 Mar 2021 13:19:36 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615508376;
        bh=3KhKg1XjrilMPY4If6YfwIgfEOkj+fuQUl8pIfNvNr4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=J8mEIWVImXWNeiGZgAf+9w1EemzibNB6rXUEpY9g4kb2no5eCryTti7vIAJTi5hyj
         TbK8bPSBZaNML1OgPXuLdI9vMjkkHtj11AM1Khppsxqul5Y7pk4Uss7p1smkKIfhlD
         QtJm72u2V2vwl1EEeFTztug7CJq/ggjGzaULXOzIduKHPBQUBAHxe+OeDPMOYlUitI
         WxmyeYEDmmgrOaHx72AR8G5FgcG75yOMNotLzcpmJyDkdPYtXRjEuJrWSz9x57+Jv3
         TaST4eyPIziNAf60lQJzV+Xt/6glhILS3YFh/rmzqAdJO2gOFmLQ9MwKgzWTzMXrHx
         6cATEhSXGrYyA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B604ab3980001>; Fri, 12 Mar 2021 13:19:36 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 13:19:36 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Fri, 12 Mar 2021 13:19:36 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEDagCAAfS7gIAALq8AgAEX54CAAKWsgIAACmIAgADZp4CAAATLAIAAJQaAgAAFtwCAAANJAA==
Date:   Fri, 12 Mar 2021 00:19:36 +0000
Message-ID: <e2a9ea84-58ec-2421-636b-0bfcd585ed6c@alliedtelesis.co.nz>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
 <309f94fa-40ec-c3be-7cdf-78a910a5b209@alliedtelesis.co.nz>
 <62ee2a1c-19ea-8287-a438-ef7bdf5472de@roeck-us.net>
In-Reply-To: <62ee2a1c-19ea-8287-a438-ef7bdf5472de@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <C26BECE8ED41EE4B80A4B1FB086EE167@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=N659UExz7-8A:10 a=dESyimp9J3IA:10 a=yYa7CNR1vv_N5OW0iWkA:9 a=pILNOxqGKmIA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 12/03/21 1:07 pm, Guenter Roeck wrote:
> On 3/11/21 3:47 PM, Chris Packham wrote:
>> On 12/03/21 10:34 am, Guenter Roeck wrote:
>>> On 3/11/21 1:17 PM, Chris Packham wrote:
>>>> On 11/03/21 9:18 pm, Wolfram Sang wrote:
>>>>>> Bummer. What is really weird is that you see clock stretching under
>>>>>> CPU load. Normally clock stretching is triggered by the device, not
>>>>>> by the host.
>>>>> One example: Some hosts need an interrupt per byte to know if they
>>>>> should send ACK or NACK. If that interrupt is delayed, they stretch t=
he
>>>>> clock.
>>>>>
>>>> It feels like something like that is happening. Looking at the T2080
>>>> Reference manual there is an interesting timing diagram (Figure 14-2 i=
f
>>>> someone feels like looking it up). It shows SCL low between the ACK fo=
r
>>>> the address and the data byte. I think if we're delayed in sending the
>>>> next byte we could violate Ttimeout or Tlow:mext from the SMBUS spec.
>>>>
>>> I think that really leaves you only two options that I can see:
>>> Rework the driver to handle critical actions (such as setting TXAK,
>>> and everything else that might result in clock stretching) in the
>>> interrupt handler, or rework the driver to handle everything in
>>> a high priority kernel thread.
>> One thing I've found that does seem to avoid the problem is to disable
>> preemption, use polling and replace the schedule() in i2c_wait() with
>> udelay(50). That's kind of like the kernel thread option.
> It is kind of hackish, though, especially since it makes the "loaded syst=
em"
> situation even worse by adding even more active wait loops.
No -ish about it :). But it might put out one fire for me while I'm=20
looking at doing some kind of interrupt driven state machine.=
