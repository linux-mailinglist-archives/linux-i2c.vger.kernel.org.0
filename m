Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF744C8D8
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 10:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfFTICg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 04:02:36 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:15796 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfFTICg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 04:02:36 -0400
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id x5K7qIBL017644;
        Thu, 20 Jun 2019 15:52:18 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 20 Jun
 2019 16:01:59 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Thu, 20 Jun 2019 16:01:59 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Tao Ren <taoren@fb.com>,
        Brendan Higgins <brendanhiggins@google.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Thread-Topic: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Thread-Index: AQHVJuImmMOIiyHRlUqwfYHYZy+Y4aai9yiAgAASyACAARtXMP//gnIAgACG17A=
Date:   Thu, 20 Jun 2019 08:01:58 +0000
Message-ID: <195bb56028d04001bbaf835cc17e032e@TWMBX02.aspeed.com>
References: <20190619205009.4176588-1-taoren@fb.com>
 <CAFd5g45TMtXcuqONdkpN_K+c0O+wUw8wkGzcQfV+sO8p5Krc9w@mail.gmail.com>
 <18565fcf-3dc1-b671-f826-e4417e4ad284@fb.com>
 <c610ecede7494c189a92a9a3f6d0fd16@TWMBX02.aspeed.com>
 <bdd53adb-6987-1b91-adde-298839b2c066@fb.com>
In-Reply-To: <bdd53adb-6987-1b91-adde-298839b2c066@fb.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x5K7qIBL017644
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gVGFvLA0KCUxldCBtZSBtb3JlIGNsZWFyLiBXaGVuIHlvdSBzZXQgKDMsIDE1LCAxNCkg
dGhlIGRldmljZSBzb21ldGltZXMgcmVzcG9uc2UgbmFjay4gDQoJYnV0IHdoZW4geW91IHNldCAo
NCwgNywgNyksIHRoZSBkZXZpY2UgYWx3YXlzIGFjay4gQW0gSSByaWdodD8gDQpSeWFuDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUYW8gUmVuIFttYWlsdG86dGFvcmVuQGZi
LmNvbV0gDQpTZW50OiBUaHVyc2RheSwgSnVuZSAyMCwgMjAxOSAzOjU3IFBNDQpUbzogUnlhbiBD
aGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+OyBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5o
aWdnaW5zQGdvb2dsZS5jb20+DQpDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNv
bT47IGRldmljZXRyZWUgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgbGludXgtYXNwZWVk
QGxpc3RzLm96bGFicy5vcmc7IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTGludXggQVJNIDxsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBsaW51eC1pMmNAdmdlci5rZXJuZWwu
b3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gaTJjOiBhc3BlZWQ6IGFsbG93IHRvIGN1c3Rv
bWl6ZSBiYXNlIGNsb2NrIGRpdmlzb3INCg0KT24gNi8yMC8xOSAxMjoyOSBBTSwgUnlhbiBDaGVu
IHdyb3RlOg0KPiBIZWxsbyBUYW8sDQo+IAlPdXIgcmVjb21tZW5kIGFib3V0IGNsayBkaXZpZGVy
IHNldHRpbmcgaXMgZm9sbG93IHRoZSBkYXRhc2hlZXQgY2xvY2sgc2V0dGluZyB0YWJsZSBmb3Ig
Y2xvY2sgZGl2aXNvci4gDQo+IA0KPiBSeWFuICANCg0KVGhhbmtzIFJ5YW4gZm9yIHRoZSByZXNw
b25zZS4gQ291bGQgeW91IGFsc28gc2hhcmUgc29tZSByZWNvbW1lbmRhdGlvbnMvaGludHMgb24g
aG93IHRvIHNvbHZlIHRoZSBpbnRlcm1pdHRlbnQgaTJjIHRyYW5zYWN0aW9uIGZhaWx1cmVzIG9u
IEZhY2Vib29rIEFTVDI1MDAgQk1DIHBsYXRmb3Jtcz8NCg0KQlRXLCB0aGUgcGF0Y2ggaXMgbm90
IGFpbWVkIGF0IG1vZGlmeWluZyB0aGUgZXhpc3RpbmcgZm9ybXVsYSBvZiBjYWxjdWxhdGluZyBj
bG9jayBzZXR0aW5ncyBpbiBpMmMtYXNwZWVkIGRyaXZlcjogcGVvcGxlIHN0aWxsIGdldCB0aGUg
cmVjb21tZW5kZWQgc2V0dGluZ3MgYnkgZGVmYXVsdC4gVGhlIGdvYWwgb2YgdGhlIHBhdGNoIGlz
IHRvIGFsbG93IHBlb3BsZSB0byBjdXN0b21pemUgY2xvY2sgc2V0dGluZ3MgaW4gY2FzZSB0aGUg
ZGVmYXVsdC9yZWNvbW1lbmRlZCBvbmUgZG9lc24ndCB3b3JrLg0KDQoNCkNoZWVycywgDQoNClRh
bw0K
