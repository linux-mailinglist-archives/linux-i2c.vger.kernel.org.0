Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1863D698F
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 00:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233704AbhGZVuW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jul 2021 17:50:22 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:60467 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233348AbhGZVuW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jul 2021 17:50:22 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CC8F4806B6
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jul 2021 10:30:46 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1627338646;
        bh=jXascuXxOUXACq1t5wxrUs2OZR1jDAigJ4zQmpvAaxs=;
        h=From:To:Subject:Date:References:In-Reply-To;
        b=FyWxQn4sO/7lF7e/bELPLDo6zD7C82XjB1V3SHS76/KKc8ooYQ+A3znTleNBwnpbj
         KeNEnb2zv49SQlq5Y7sDo1gfaV56JRWQR7+Rz4JcxBchzbbxoon1IUzWEqPPZ6W6vr
         QEBn/a5B48630b1NR5nESPzWJELhuzzswum1xyBfq/+wkEgxMhLzlfmWYHoFPgHPNo
         xmERyQ7AD3UMOD3RZAkMoJgP8xhNwCdqQBZh7V4/pQagpkPcJ8bjnGHuYIsag9knkr
         ryg4wdtGOay5+XCBfAaJI2H6XH0zfz/gDLHMjHoJKFKZiWAuH1DMmaqdYtkrInp+d0
         qBhzlhauNEcaA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60ff37960001>; Tue, 27 Jul 2021 10:30:46 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.23; Tue, 27 Jul 2021 10:30:46 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.023; Tue, 27 Jul 2021 10:30:46 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Chris Clayton <chris2553@googlemail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: i2c-tools-4.3 - tarballs from kernel.org
Thread-Topic: i2c-tools-4.3 - tarballs from kernel.org
Thread-Index: AQHXgm3g6lCmotRLhUOh2ouPcWVXEg==
Date:   Mon, 26 Jul 2021 22:30:45 +0000
Message-ID: <1eac6bbb-b7f7-5665-b091-73d3f66adb25@alliedtelesis.co.nz>
References: <c6403e32-2e48-c556-d08e-2c4441e34565@googlemail.com>
In-Reply-To: <c6403e32-2e48-c556-d08e-2c4441e34565@googlemail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEAC8DB44415164591C540D7E830B400@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=dvql9Go4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=VwQbUJbxAAAA:8 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=e_q4qTt1xDgA:10 a=a28CaqLzsHWDZ6HAidcA:9 a=QEXdDO2ut3YA:10 a=pRQRx_yQ9a0A:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyMy8wNy8yMSA4OjI0IHBtLCBDaHJpcyBDbGF5dG9uIHdyb3RlOg0KPiBIaQ0KPg0KPiBU
aGUgdGFyYmFsbHMgYXQgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvc29mdHdhcmUvdXRpbHMv
aTJjLXRvb2xzLyBzZWVtIHRvIGNvbnRhaW4gc291cmNlIGZvciB2NC4wLg0KPiBUaGUgZmlsZSB2
ZXJzaW9uLmggY29udGFpbnMgIiNkZWZpbmUgVkVSU0lPTiAiNC4wIg0KPg0KPiBDaHJpcw0KPg0K
QW5kIGludGVybmFsbHkgdGhlIHBhdGggc2F5cyBpMmMtdG9vbHMtNC4wLiBMb29raW5nIGF0IHRo
ZSBDSEFOR0VTIGZpbGUgDQppdCBhbHNvIGFwcGVhcnMgdG8gbGluZSB1cCB3aXRoIHRoZSA0LjAg
dGFnLg0K
