Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36512EF782
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2019 09:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730528AbfKEIrb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Nov 2019 03:47:31 -0500
Received: from m12-11.163.com ([220.181.12.11]:43786 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbfKEIrb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Nov 2019 03:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Mime-Version:Message-ID; bh=lH+jz
        Gdxy7IvVSVSVo6MZm80v9GuSQGvFMsJ7zCs8xY=; b=bNt5s5YFkuTwaVPmD28Fw
        7lGTaBaO4Za6cBv/Gx9NoI9F00ZERiI7AnsWSlZh+QSZPrvUoxErv+8clsrsqL2F
        oynBb0KJ+IxxU1ZoTx4y4xggViiAVaGbeHiZiyJeMsLICcfKwyTYB1e+9jfYF+HU
        y6DJLgjdlUrWQV9vW+b+vY=
Received: from SKY-20180422ZRB (unknown [202.100.50.59])
        by smtp7 (Coremail) with SMTP id C8CowABnh8MIN8FdEx3ABw--.37827S2;
        Tue, 05 Nov 2019 16:47:09 +0800 (CST)
Date:   Tue, 5 Nov 2019 16:47:53 +0800
From:   "sxauwsk@163.com" <sxauwsk@163.com>
To:     "Shubhrajyoti Datta" <shubhrajyoti.datta@gmail.com>
Cc:     "Michal Simek" <michal.simek@xilinx.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>,
        "Wolfram Sang" <wsa@the-dreams.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH v2] i2c: cadence: try reset when master receive arbitration lost
References: <20190219012447.5900-1-sxauwsk@163.com>, 
        <CAKfKVtEwHcydp=+hNhG91h3qbMoYOPq7jEYjbuAVrWXT53DC3Q@mail.gmail.com>
X-Priority: 3
X-GUID: 186E92E8-E129-42B5-B97D-0BAC69171ADB
X-Has-Attach: no
X-Mailer: Foxmail 7.2.14.406[cn]
Mime-Version: 1.0
Message-ID: <2019110516474778997625@163.com>
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID: C8CowABnh8MIN8FdEx3ABw--.37827S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyxtFyUGF4Dtr18Cw15Jwb_yoW8Gr1Dpa
        y8G3s3CF4DJrn2vrsrZ3WDuF90grWxGF98KF15Xw1kuas8G34qyFy2kan8tFyxGrWDAwn0
        qFsYv34j9a4DZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b1dgAUUUUU=
X-Originating-IP: [202.100.50.59]
X-CM-SenderInfo: 5v0d34lvn6il2tof0z/1tbiDg5kJlXluZcLIAAAs3
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PkhpIFNoaWthaSwKPgo+T24gVHVlLCBGZWIgMTksIDIwMTkgYXQgODoxOSBBTSBTaGlrYWkgV2Fu
ZyA8c3hhdXdza0AxNjMuY29tPiB3cm90ZToKPj4KPj4gV2hlbiB0aGUgYWRhcHRlciByZWNlaXZl
IGFyYml0cmF0aW9uIGxvc3QgZXJyb3IgaW50ZXJydXB0cywKPj4gY2Ruc19pMmNfbWFzdGVyX3hm
ZXIgcmV0dXJuIHRvIHRoZSBjYWxsZXIgZGlyZWN0bHkgaW5zdGVhZCBvZiByZXNldHRpbmcKPj4g
dGhlIGFkYXB0ZXIgd2hpY2ggcmVzdWx0ZWQgaW4gdGhlIGFkYXB0ZXIgYmVpbmcgb3V0IG9mIGNv
bnRyb2wuCj4+Cj4+IFNvIHdoZW4gZHJpdmVyIGRldGVjdCBlcnJfc3RhdHVzIHN1Y2ggYXMgYXJi
aXRyYXRpb24gbG9zdCwKPj4gdGhlbiB0cnkgdG8gcmVwYWlyIGFuZCBmaXggaXQuCj4+Cj5JIGFt
IG1pc3NpbmcgdGhlIGlzc3VlIHRoYXQgeW91IGFyZSBmYWNpbmcuCj5Zb3UgYXJlIGhhdmluZyBh
IG11bHRpbWFzdGVyIHNjZW5hcmlvIGFuZCBnZXR0aW5nIGFyYml0cmF0aW9uIGxvc3QuCj4KPnRo
ZSBjdXJyZW50IGNvZGUgd291bGQgYXR0ZW1wdCBhIHJldHJ5IGRpZCB0aGF0IGxlYWQgdG8gYW55
IGlzc3Vlcz8KPgo+Q2FuIHlvdSBleHBsYWluIHRoZSBpc3N1ZSB0aGF0IHlvdSBhcmUgZmFjaW5n
PyAKCk9mIGNvdXJjZSwgwqBUaGUgZm9sbG93aW5nIGRlc2NyaWJlIG15IHNpdHVhdGlvbi4KCklu
IG15IHByb2R1Y3QsIMKgVG91Y2hzY3JlZW4gY29ubmVjdCB0byB6eW5xLTcwMDAgWEM3WjAxMCBi
eSBpMmMgYnVzKCBKdXN0IGNvbm5lY3Qgb25seSBvbmUgaTJjLWRldmljZSBvZiB0b3VjaHNjcmVl
biksIMKgCndoZW4gdXNlciB0YXAgVG91Y2hzY3JlZW4sIFRvdWNoc2NyZWVuIGludGVycnVwdCBz
ZW5kIHRvIENQVSBhbmQgbm90aWZ5ZWQgaTJjLWRyaXZlciB0byBvYnRhaW4gbG9jYXRpb24gZGF0
YSBieSBpMmMtYnVzLCDCoAoKd2hlbiBUYXAgdGhlIHNjcmVlbiBmcmVxdWVudGx5LCDCoHNvbWV0
aW1lcyBDUFUgZ2V0IGludGVycnVwdCBmcm9tIHRvdWNoc2NyZWVuIGFuZCB0cnkgdG8gb2J0YWlu
IGRhdGEsIMKgdGhlbiBkZXRlY3QgYXJiaXRyYXRpb24gbG9zdCwKQWx0aG91Z2ggaTJjLWRyaXZl
ciB0cnkgdGhyZWUgdGltZXMsIMKgaXQncyB1c2VsZXNzLgrCoMKgCkFjdHVhbGx5IGkyYyBjbG9j
ay1saW5lIGFuZCBkYXRhLWxpbmUga2VlcCBoaWdoLCB0aGF0IG1lYW4gaTJjIGJ1cyBmcmVlLgpP
bmNlIHRoaXMgc2l0dWF0aW9uIG9jY3VyLCBpMmMtY29udHJvbCBkaWQndCB3b3JrIGFueW5heSBi
dXQgY3B1IHJlY2VpdmUgaW50ZXJycHV0cyBzdGlsbC4KCkkgYW0gc29ycnkgdGhhdCBJIGhhdmUn
dCBmb3VuZCBhIGdvb2Qgc29sdXRpb24gZm9yIHRoaXMgaXNzdXNlOwo=


