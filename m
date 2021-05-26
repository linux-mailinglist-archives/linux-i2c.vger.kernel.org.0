Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C093921EE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 23:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbhEZVYq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 17:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbhEZVYp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 17:24:45 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3038C061574
        for <linux-i2c@vger.kernel.org>; Wed, 26 May 2021 14:23:12 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 233F98364F;
        Thu, 27 May 2021 09:23:08 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1622064188;
        bh=TiROpMsOyyFPl7db7O1BRsv/wP/O+sYUo3PyzWBIq4E=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=UxuI2ihOeH1+0RUxEEUn7ItY5xaDgqcRPciPI2fbk7f8QjXY8dwbE9DZiDN8ADciu
         HZNJrAoc1MLx9CMI3cFwlW/qRJZ22RtosLgPKPwDFa34O1Fvj5B1SBzgg0trx+kCHm
         xk/huVrmyWOoh5qArOfbvQPRPIjvArGs5FllXNNcrWRXIWF4/Dml1efNXpwkyPXj1G
         KaK3fRoPPBAyeZZiQnws9SXUC6QnABiE0Ox4cFzRyYyFfMw8Tko7zwsKKH24emSMi4
         510Nvfa+ecI0HDKWyWb6JD4ozZLzpe+ajNdmQE4VWSzk82T1dGoxnRwDaYzOMrMVEo
         aGKajjszRrE4w==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60aebc3c0001>; Thu, 27 May 2021 09:23:08 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 27 May 2021 09:23:07 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.018; Thu, 27 May 2021 09:23:07 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Jean Delvare <jdelvare@suse.de>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [i2c-tools PATCH] tools: i2cbusses: Handle bus names like
 /dev/i2c-0
Thread-Topic: [i2c-tools PATCH] tools: i2cbusses: Handle bus names like
 /dev/i2c-0
Thread-Index: AQHXUUU4lShaIvwr4kGbbJtnuax88Kr0mMMAgADmLIA=
Date:   Wed, 26 May 2021 21:23:07 +0000
Message-ID: <a9bce37a-085b-f863-e1b0-5f5faa91f063@alliedtelesis.co.nz>
References: <20210525090612.26157-1-chris.packham@alliedtelesis.co.nz>
 <20210526093918.73c40482@endymion>
In-Reply-To: <20210526093918.73c40482@endymion>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <92BC9C108EA73D4085C205A49F34A554@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=WOcBoUkR c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=5FLXtPjwQuUA:10 a=MPFQmGLWxhUer3iWOLMA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyNi8wNS8yMSA3OjM5IHBtLCBKZWFuIERlbHZhcmUgd3JvdGU6DQo+IEhpIENocmlzLA0K
Pg0KPiBPbiBUdWUsIDI1IE1heSAyMDIxIDIxOjA2OjEyICsxMjAwLCBDaHJpcyBQYWNraGFtIHdy
b3RlOg0KPj4gRmlsZSBiYXNlZCB0YWIgY29tcGxldGlvbiBtZWFucyBpdCdzIGVhc3kgdG8gZG8g
c29tZXRoaW5nIGxpa2UNCj4+IGkyY2R1bXAgL2Rldi9pMmMtMCAweDUyLiBBY2NlcHQgdGhpcyBt
ZXRob2Qgb2Ygc3BlY2lmeWluZyB0aGUgaTJjIGJ1cw0KPj4gZGV2aWNlLg0KPiBJIGNhbid0IHJl
YWxseSBzZWUgdGhlIHZhbHVlIG9mIHRoaXMgY2hhbmdlLCBzb3JyeS4gWW91IHdhbnQgdG8gdXNl
IGENCj4gbG9uZ2VyIHBhcmFtZXRlciBzbyB5b3UgY2FuIHRhYi1jb21wbGV0ZSBpdC4gVGhlIG9y
aWdpbmFsIHBhcmFtZXRlciB3YXMNCj4gYSAxLSBvciAyLWRpZ2l0IG51bWJlciwgd2hpY2ggaXMg
ZmFzdGVyIHRvIHR5cGUgdGhhbiAvZDx0YWI+aTI8dGFiPi4NCj4gUGx1cyBpZiB5b3UgaGF2ZSBt
dWx0aXBsZSBpMmMgYnVzZXMsIHRhYiBjb21wbGV0aW9uIGNhbid0IGd1ZXNzIHdoaWNoDQo+IG9u
ZSB5b3Ugd2FudCBhbnl3YXksIHNvIHlvdSdsbCBoYXZlIHRvIHR5cGUgdGhlIGJ1cyBudW1iZXIg
ZXZlbnR1YWxseS4NCj4NCj4gU28sIHdoYXQgZG8gd2UgYWN0dWFsbHkgd2luIGhlcmU/DQoNCk15
IG1haW4gbW90aXZhdGlvbiB3YXMgdG8gcmVwbGFjZSBhbiBpbi1ob3VzZSB0b29sIHRoYXQgaXMg
cHJvdmlkZXMgDQpzaW1pbGFyIGZ1bmN0aW9uYWxpdHkgYnV0IGl0IGN1cnJlbnRseSB0YWtlcyB0
aGUgYnVzIGFzIGEgcGF0aC4gQXQgZmlyc3QgDQpJIGV2ZW4gdGhvdWdodCB0aGVyZSB3YXMgYSBi
dWcgYmVjYXVzZSBJIHRob3VnaHQgIm9yIGFuIEkyQyBidXMgbmFtZSIgDQptZWFudCB0aGUgcGF0
aCwgaXQgd2Fzbid0IHVudGlsIEkgbG9va2VkIGF0IHRoZSBjb2RlIHRoYXQgSSByZWFsaXNlZCAN
CnRoaXMgd2FzIHRoZSBuYW1lIHVzZWQgaW4gdGhlIGtlcm5lbC4NCg0KT25lIGFkdmFudGFnZSBJ
IGNhbiBzZWUgaXMgdGhhdCB0aGUgL2Q8dGFiPi9pMjx0YWI+IGltcGxpY2l0bHkgdmFsaWRhdGVz
IA0KdGhhdCB0aGUgYnVzIGFjdHVhbGx5IGV4aXN0cyAoYXNzdW1pbmcgL2RldiBpcyBtYW5hZ2Vk
IGJ5IGRldnRtcGZzIA0KYW5kL29yIHVkZXYpLg0K
