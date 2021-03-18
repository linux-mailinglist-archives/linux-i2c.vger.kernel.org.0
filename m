Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB13B33FDE3
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 04:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhCRDrK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 23:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhCRDrD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Mar 2021 23:47:03 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D799C06174A
        for <linux-i2c@vger.kernel.org>; Wed, 17 Mar 2021 20:47:03 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2DFAB891AE;
        Thu, 18 Mar 2021 16:46:59 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616039219;
        bh=YhRnUFVrl7/8nydokzr/5/OXltn4aUhYU1Fr4pawvfs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=Wxm/LTQu9rRmMleCZxX+Ed3aTU/MrYR953tJJ3AjUCRaHDfmOyiz16R/OdsjSXSLU
         +Zg9JLw8VUflvEdzqQWdjr6Q61COrRVacgwceND/GKLES3eygfopp/cXQ6HuDAaAJ7
         Ui+J3gmmt/12WDWPXwswkczpmXeF9oG4CV3T3BIGWiqlbjUv2ZXZH1ExG/vMNvE9uI
         LzB7QwhQyZzbVwi4BWpvQzihgzw2dC1veQ+GM8PYIIx/Ry2nwVRrwVp5n0QmW5Ufz1
         etnHMCubJlFKDq6VQHE+RgweuEJMf9kZiuGIUHwnz0+2VxbSc94plTpTF3/TTOG+pI
         zF7c1rXLztH+A==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6052cd330001>; Thu, 18 Mar 2021 16:46:59 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 16:46:58 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Thu, 18 Mar 2021 16:46:58 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEDagCAAfS7gIAALq8AgAEX54CAAKWsgIAACmIAgADZp4CAAATLAIAJ1fMA
Date:   Thu, 18 Mar 2021 03:46:58 +0000
Message-ID: <9c912424-2cc9-8753-1352-1a5c27722cd2@alliedtelesis.co.nz>
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
Content-ID: <0D62E11FAE39D940A8C764469E59E569@atlnz.lc>
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
I've made some reasonable progress on making i2c-mpc more interrupt=20
driven. Assuming it works out for my use-case is there an opinion on=20
making interrupt support mandatory? Looking at all the in-tree dts files=20
that use one of the compatible strings from i2c-mpc.c they all have=20
interrupt properties so in theory nothing is using the polling mode. But=20
there may be some out-of-tree boards or boards using an old dtb that=20
would be affected?=
