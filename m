Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E25146F43A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 20:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhLITvP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 14:51:15 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55674 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhLITvP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 14:51:15 -0500
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CEB71806B7;
        Fri, 10 Dec 2021 08:47:37 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1639079257;
        bh=ccdqNOj5J5nVKrh1rkY07iE6vW2enmlH7mBkut3FsvQ=;
        h=From:To:Subject:Date:References:In-Reply-To;
        b=BkuV9k1mFzROFHQbDeYCPRJVt8/AOFJlaM6kWHBtPubCHiuLIrCNnLFN39zu/OGH8
         rCr6v0UlKSWFHJ/u0saPtGPaKsq6dc/0fDb5mx3V0mlGAm6yXkpCJYzDe3jhFys8SM
         3p81WWaeT3l4oiyLr/MYlhfe7fz0a9OyCjgeB4J9VLmhZqW5eYnukEnceLZ6YtS5IH
         /ypNxQLkNlwTDAto+SO6ydMis5flUOWiRW54RBAXlUkgztsTkzq6XQQ9CHhQtaiLOm
         GNapsDgbTWZSQhB6KDMwQEMgfCpH5PaLw+uZkQo7gbQ447WSA1QvQslegBAWvdnZdf
         V/RBm6EM8OljQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61b25d590001>; Fri, 10 Dec 2021 08:47:37 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 10 Dec 2021 08:47:37 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.026; Fri, 10 Dec 2021 08:47:37 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "wsa@kernel.org" <wsa@kernel.org>,
        "mbizon@freebox.fr" <mbizon@freebox.fr>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: mpc: Use atomic read and fix break condition
Thread-Topic: [PATCH] i2c: mpc: Use atomic read and fix break condition
Thread-Index: AQHX6yH59UeBzAfeJEWOl6N8FMj7Fawl9dyAgADMRYCAAkoTAIAArtQA
Date:   Thu, 9 Dec 2021 19:47:36 +0000
Message-ID: <d9a9d4db-9e21-288d-40d5-0eef198146fb@alliedtelesis.co.nz>
References: <20211207042144.358867-1-chris.packham@alliedtelesis.co.nz>
 <ea12555e66d4dc16c5b093ac528442ed6dddf644.camel@freebox.fr>
 <bce48dba-c163-4fe7-50c4-984de41488c2@alliedtelesis.co.nz>
 <YbHKsI35uHz9PjwO@ninjato>
In-Reply-To: <YbHKsI35uHz9PjwO@ninjato>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <6A3602B25FA9E74186D8FE423CA853C8@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=XOZOtjpE c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=N659UExz7-8A:10 a=IOMw9HtfNCkA:10 a=VwQbUJbxAAAA:8 a=Vzfgeu6Zy-1uzFYh-k4A:9 a=pILNOxqGKmIA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/12/21 10:21 pm, wsa@kernel.org wrote:
>> we'd hit the 100us timeout in the poll). But I see no evidence of that
>> actually happening (and no idea what arbitration lost means w.r.t i2c).
> On a bus with multiple masters, it means the other master has won the
> arbitration because the address it wants to talk to contains more 0 bits.
>
>> I don't know that there is a maximum clock stretch time (we certainly
>> know there are misbehaving devices that hold SCL low forever). The SMBUS
>> protocol adds some timeouts but as far as I know i2c says nothing about
>> how long a remote device can hold SCL.
> The above is all correct.
>
> Even with the unclear situation about the 100us, I think this should go
> to for-current soon, right?
Please and thank you.=
