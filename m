Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C791E1C4B9E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 03:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgEEBwF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 21:52:05 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:36395 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgEEBwF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 May 2020 21:52:05 -0400
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 0451fnFT030573;
        Tue, 5 May 2020 09:41:49 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 5 May
 2020 09:52:04 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 5 May
 2020 09:52:02 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Tue, 5 May 2020 09:52:02 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Brendan Higgins <brendanhiggins@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Thread-Topic: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Thread-Index: AQHWHdeQ1mqTBOPAdE+n+yVhmYVsFKiPNOCAgACLErD//4h6gIABsZgAgAfJrwA=
Date:   Tue, 5 May 2020 01:52:01 +0000
Message-ID: <fc8bc729af844e658fd1ac1f86480f00@TWMBX02.aspeed.com>
References: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
         <20200429075357.GA1957@kunai>
         <56add9c6e6b5410986325a1360466e4b@TWMBX02.aspeed.com>
         <20200429090355.GA2891@kunai>
 <232b9fac588beb4d024ab496b118c51af2b0ecba.camel@kernel.crashing.org>
In-Reply-To: <232b9fac588beb4d024ab496b118c51af2b0ecba.camel@kernel.crashing.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.2.87]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0451fnFT030573
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+IEFuZCBpcyB0aGVyZSBtYXliZSBhIEZpeGVzOiB0YWcgZm9yIGl0Pw0KPiA+IFtSeWFuIENo
ZW5dIFllcyBpdCBpcyBhIGZpeCBwYXRjaC4NCj4gDQo+IEkgbWVhbnQgdGhpcyAoZnJvbSBzdWJt
aXR0aW5nLXBhdGNoZXMucnN0KToNCg0KPkl0IGZpeGVzIHRoZSBvcmlnaW5hbCBpbXBsZW1lbnRh
dGlvbiBvZiB0aGUgZHJpdmVyIGJhc2ljYWxseS4gSXQncyBqdXN0IGEgY2xhc3NpYyBwb3N0ZWQt
d3JpdGUgZml4LiBUaGUgd3JpdGUgdG8gY2xlYXIgdGhlIHBlbmRpbmcgaW50ZXJydXB0IGlzIGFz
eW5jaHJvbm91cywgc28geW91IGNhbiBnZXQgc3B1cnJpb3VzIG9uZXMgaWYgeW91IHJldHVybiBm
cm9tIHRoZSBoYW5kbGVyIGJlZm9yZSBpdCBoYXMgcGVyY29sYXRlZCB0byB0aGUgSFcuDQoNCj5J
IGFzc3VtZSBpdCdzIGp1c3QgbW9yZSB2aXNpYmxlIG9uIHRoZSAyNjAwIGJlY2F1c2Ugb2YgdGhl
IGNvcmVzIGFyZSBzaWduaWZpY2FudGx5IGZhc3RlciBidXQgdGhlIElPIGJ1cyBpcyBzdGlsbCBh
cyBkdW1iLg0KDQo+UnlhbjogWW91IGNvdWxkIGFsd2F5cyBhZGQgYSBGaXhlZC1ieTogdGFnIHRo
YXQgc3BlY2lmaWVzIHRoZSBjb21taXQgdGhhdCBhZGRlZCB0aGUgaW5pdGlhbCBkcml2ZXIuLi4N
CltSeWFuIENoZW5dIFRoYW5rcyBCZW4uDQoNCg==
