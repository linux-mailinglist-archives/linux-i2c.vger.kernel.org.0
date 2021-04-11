Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C8035B707
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Apr 2021 23:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbhDKVcM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Apr 2021 17:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235726AbhDKVcL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Apr 2021 17:32:11 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6702DC061574
        for <linux-i2c@vger.kernel.org>; Sun, 11 Apr 2021 14:31:54 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6343E891AE;
        Mon, 12 Apr 2021 09:31:50 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618176710;
        bh=PUZJgCpIeLjaxEA7D8FKzsJPq6g/TVqwZbbkPwYza44=;
        h=From:To:Subject:Date:References:In-Reply-To;
        b=q2YDUTD1uUF43dGwIeXjrYmeDXJ6ekfFmNZRhVHTHKImTGUI8KPDLcwVUQEb1DNbL
         OKudOn/2W7k8pTd3u7McVcbiv+Cin4m0jDkpNXXmu9FQqBUkwoYKwuRG032CQv8gcS
         ycgUEv1/7VgVf4NwI/O2RmUbpG1pOKdeBbV2q/1SO7u97FI6g7KdRkBtQXizZQluuG
         lYhEvk+awX4eRKeGYOLlyTng6V/QNMej8Y1VqbRxxvDDCmfXij9H6z84seYEZohu1D
         5LNvYw712nIe3cjozeAH4om7EYT5UrVWoCd6voIzFDNYlFVWMuVXDGDFjVlIxoQpb8
         Zq4vbJ0RppKsw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60736ac60001>; Mon, 12 Apr 2021 09:31:50 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Apr 2021 09:31:48 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Mon, 12 Apr 2021 09:31:48 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] i2c: mpc: Interrupt driven transfer
Thread-Topic: [PATCH v2 6/6] i2c: mpc: Interrupt driven transfer
Thread-Index: AQHXJD4hvLW0meFt6ESzTxJvvSZbG6qteioAgAGoVwA=
Date:   Sun, 11 Apr 2021 21:31:47 +0000
Message-ID: <723acaa7-ff57-40c2-a733-a520c5899800@alliedtelesis.co.nz>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-7-chris.packham@alliedtelesis.co.nz>
 <20210410201302.GC2471@kunai>
In-Reply-To: <20210410201302.GC2471@kunai>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <239DB9A834929549B0CEFF09DCFB9CB2@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=N659UExz7-8A:10 a=3YhXtTcJ-WEA:10 a=dD2wLIcgPC3ieJof06wA:9 a=pILNOxqGKmIA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 11/04/21 8:13 am, Wolfram Sang wrote:
> On Mon, Mar 29, 2021 at 02:52:06PM +1300, Chris Packham wrote:
>> The fsl-i2c controller will generate an interrupt after every byte
>> transferred. Make use of this interrupt to drive a state machine which
>> allows the next part of a transfer to happen as soon as the interrupt is
>> received. This is particularly helpful with SMBUS devices like the LM81
>> which will timeout if we take too long between bytes in a transfer.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Okay, this change is too large and HW specific for a detailed review.
> But I trust you and hope you will be around to fix regressions if I
> apply it for 5.13?
Yep I plan on being around. I've got access to a couple of designs with=20
P2040 and T2081 so hopefully that's sufficient to deal with any=20
regressions. One issue is a lack of different i2c devices (the systems=20
we have tend to use the same devices) but hopefully any reports of=20
regression will be from people with access to such devices.
> That kind of leads to the question if you want to
> step up as the maintainer for this driver?
Sure can do. It'd be nice if it was someone from NXP but I think they've=20
lost interest in the PowerPC based SoCs. Should I send a patch for=20
MAINTAINERS? If so does that go through the i2c tree?
> Only thing I noticed was a "BUG" and "BUG_ON" and wonder if we really
> need to halt the kernel in that case. Maybe WARN is enough?

Yeah I think they can both be WARN variants. The one in mpc_xfer() can=20
happily continue. It's a little less clear what I should do in=20
mpc_i2c_do_action() if the WARN is ever hit but in theory it should be=20
an unreachable case anyway so the only thing that could get there is=20
some kind of memory corruption which would likely cause a crash elsewhere.

Do you want me to send a V3 of just that patch?

> I'll apply the first five patches now, they look good to me.
>=
