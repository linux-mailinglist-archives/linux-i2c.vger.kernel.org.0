Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9372B3381AE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 00:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhCKXrs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Mar 2021 18:47:48 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:52363 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhCKXr0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Mar 2021 18:47:26 -0500
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7B22B891AE;
        Fri, 12 Mar 2021 12:47:24 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615506444;
        bh=O8ioeN6FxLFU4Mogyahmc7b0yA08Z9plxKutTZFsmEQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=XXnBIkRidgiL1fd6HsRTgQpMqXJ//UrMtf/oG1I1ibs/y83u0+2Ih2LGJZTxW1Svq
         5oUe5ZDmK7aFJiqwAFKO8uzL0kw6qsi5e3GBvH2ZHM6dGkVpLyVTnQsETamzcQFnhD
         z0FizICLdGUeoxSEy8gjNwb83+6lvguoXp64HWzlj/zzHLe4dWjGXqkCX/UMrLxcA0
         aZb5bd6EfZ+t+3khPUVK57pX19bmUlnSSv0u3pik1U8ROkla6YHZaRUiUGpVenfWcZ
         BMSYiUmjjYFmf+Csyt39VLtQx3ka0EoThBJ0qofYgxHANGrsJHiwlFdhHjHc4Wdjlr
         /pqNS+9qhcZOQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B604aac0c0001>; Fri, 12 Mar 2021 12:47:24 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 12:47:24 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Fri, 12 Mar 2021 12:47:24 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEDagCAAfS7gIAALq8AgAEX54CAAKWsgIAACmIAgADZp4CAAATLAIAAJQaA
Date:   Thu, 11 Mar 2021 23:47:23 +0000
Message-ID: <309f94fa-40ec-c3be-7cdf-78a910a5b209@alliedtelesis.co.nz>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
In-Reply-To: <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <4B9F5B15F7E349419129FD28B885D387@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=N659UExz7-8A:10 a=dESyimp9J3IA:10 a=VNwDg8RZYkgfWyEnbsYA:9 a=pILNOxqGKmIA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 12/03/21 10:34 am, Guenter Roeck wrote:
> On 3/11/21 1:17 PM, Chris Packham wrote:
>> On 11/03/21 9:18 pm, Wolfram Sang wrote:
>>>> Bummer. What is really weird is that you see clock stretching under
>>>> CPU load. Normally clock stretching is triggered by the device, not
>>>> by the host.
>>> One example: Some hosts need an interrupt per byte to know if they
>>> should send ACK or NACK. If that interrupt is delayed, they stretch the
>>> clock.
>>>
>> It feels like something like that is happening. Looking at the T2080
>> Reference manual there is an interesting timing diagram (Figure 14-2 if
>> someone feels like looking it up). It shows SCL low between the ACK for
>> the address and the data byte. I think if we're delayed in sending the
>> next byte we could violate Ttimeout or Tlow:mext from the SMBUS spec.
>>
> I think that really leaves you only two options that I can see:
> Rework the driver to handle critical actions (such as setting TXAK,
> and everything else that might result in clock stretching) in the
> interrupt handler, or rework the driver to handle everything in
> a high priority kernel thread.
One thing I've found that does seem to avoid the problem is to disable=20
preemption, use polling and replace the schedule() in i2c_wait() with=20
udelay(50). That's kind of like the kernel thread option.
> Guenter=
