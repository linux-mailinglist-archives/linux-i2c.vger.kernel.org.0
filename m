Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D4F35B786
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 01:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235780AbhDKX5a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Apr 2021 19:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235797AbhDKX5a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Apr 2021 19:57:30 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A16C06138B
        for <linux-i2c@vger.kernel.org>; Sun, 11 Apr 2021 16:57:12 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3D749891AE;
        Mon, 12 Apr 2021 11:57:08 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618185428;
        bh=DGT6yaemPbpFp4jAS/bxgD8m2n2OI5Ecf//jo/QAI+8=;
        h=From:To:Subject:Date:References:In-Reply-To;
        b=GPkH+tQEETkQyskyBQcjFSkjYoJjQF2raKEOoVwi65+R+EbBWBvUI4eQzONKawKKL
         A3Yj7bBPxFGXxZ52KXYXpMcKBPjT5VsLff+Z7bC4CUOgk6Hi4nh0EXACMZVkRojeJK
         mTKmRxLy7jIIGH4vKgLUQCsZpDNUl45axpA5jKN8bRDxYLX62mLr4y1D4GhQ4C+dFF
         Pgxiew4cv3WWCh22XH3bUvBBVco+MTBealJLjwOFE9F+geJws1yL/xXT4H2ZAtvyqn
         e4QcOQENohW+6BOr5fpk67OHUGVEUTQAoQk261//W7Ob7K6AXbEvVRhPtLUty0jjXt
         +kfEuMQC4MvMA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60738cd40001>; Mon, 12 Apr 2021 11:57:08 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 12 Apr 2021 11:57:07 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Mon, 12 Apr 2021 11:57:07 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] i2c: mpc: make interrupt mandatory and remove
 polling code
Thread-Topic: [PATCH v2 4/6] i2c: mpc: make interrupt mandatory and remove
 polling code
Thread-Index: AQHXJD4gOr98as1W806YY3yNqjrO3qqtezUAgAHP5YA=
Date:   Sun, 11 Apr 2021 23:57:07 +0000
Message-ID: <2688f9c5-32ac-3df5-b0d1-063d443602b2@alliedtelesis.co.nz>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-5-chris.packham@alliedtelesis.co.nz>
 <20210410201646.GD2471@kunai>
In-Reply-To: <20210410201646.GD2471@kunai>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <DDB97B7765104C40BDDABCB81AD876FF@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=N659UExz7-8A:10 a=3YhXtTcJ-WEA:10 a=0hqDhlNy4JMbZyZfu-4A:9 a=pILNOxqGKmIA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 11/04/21 8:16 am, Wolfram Sang wrote:
> On Mon, Mar 29, 2021 at 02:52:04PM +1300, Chris Packham wrote:
>> All the in-tree dts files that use one of the compatible strings from
>> i2c-mpc.c provide an interrupt property. By making this mandatory we
>> can simplify the code.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> After I applied this patch, cppcheck reports:
>
>      CPPCHECK
> drivers/i2c/busses/i2c-mpc.c:401:47: warning: Either the condition 'div?(=
int)div->fdr:-EINVAL' is redundant or there is possible null pointer derefe=
rence: div. [nullPointerRedundantCheck]
>   *real_clk =3D fsl_get_sys_freq() / prescaler / div->divider;
>                                                ^
> drivers/i2c/busses/i2c-mpc.c:402:13: note: Assuming that condition 'div?(=
int)div->fdr:-EINVAL' is not redundant
>   return div ? (int)div->fdr : -EINVAL;
>              ^
> drivers/i2c/busses/i2c-mpc.c:401:47: note: Null pointer dereference
>   *real_clk =3D fsl_get_sys_freq() / prescaler / div->divider;
>                                                ^
> Can you check this? I'd think we can fix it incrementally...
>
What are the arguments passed to cppcheck? I've tried two versions I=20
have easy access to (1.82 and 1.86) neither report problems when invoked=20
as `cppcheck drivers/i2c/busses/i2c-mpc.c` nor do they complain about=20
this with `--enable=3Dall`.

Looking at the code I can see what it's complaining about, div should=20
have a value since mpc_i2c_dividers_8xxx does not have a sentinel value=20
so I think the div check is unnecessary.
