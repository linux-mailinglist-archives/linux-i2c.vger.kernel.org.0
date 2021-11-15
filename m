Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFA14502E1
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 11:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhKOK7V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 05:59:21 -0500
Received: from cnshjsmin03.app.nokia-sbell.com ([116.246.26.71]:37131 "EHLO
        CNSHJSMIN03.NOKIA-SBELL.COM" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230456AbhKOK7L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 05:59:11 -0500
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Nov 2021 05:59:09 EST
X-AuditID: ac189297-7e7ff7000000e1d5-6f-619239423c96
Received: from CNSHPPEXCH1609.nsn-intra.net (Unknown_Domain [135.251.51.109])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by CNSHJSMIN03.NOKIA-SBELL.COM (Symantec Messaging Gateway) with SMTP id 58.63.57813.24932916; Mon, 15 Nov 2021 18:41:06 +0800 (HKT)
Received: from CNSHPPEXCH1604.nsn-intra.net (135.251.51.104) by
 CNSHPPEXCH1609.nsn-intra.net (135.251.51.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 18:41:06 +0800
Received: from CNSHPPEXCH1604.nsn-intra.net ([135.251.51.104]) by
 CNSHPPEXCH1604.nsn-intra.net ([135.251.51.104]) with mapi id 15.01.2242.012;
 Mon, 15 Nov 2021 18:41:06 +0800
From:   "Wang, Lawrence (NSB - CN/Hangzhou)" <lawrence.wang@nokia-sbell.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Wang@wrlinb193.emea.nsn-net.net" <Wang@wrlinb193.emea.nsn-net.net>
Subject: RE: [PATCH] i2c: designware: Get HCNT/LCNT values from dts
Thread-Topic: [PATCH] i2c: designware: Get HCNT/LCNT values from dts
Thread-Index: AQHX2gQzxQOOCXSt8UerjvWLFXHhaawD2mMAgAACfwCAAIZzsA==
Date:   Mon, 15 Nov 2021 10:41:06 +0000
Message-ID: <587c61a76c8547d0a36dd11071bfcb2d@nokia-sbell.com>
References: <20211115093556.7154-1-lawrence.wang@nokia-sbell.com>
 <YZI0LuDK63+Wb7wi@smile.fi.intel.com> <YZI2RnFgO0Y75KlF@smile.fi.intel.com>
In-Reply-To: <YZI2RnFgO0Y75KlF@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsXS/ts4V9fJclKiwZzFVha9TdOZLOa8Wc5i
        0fH3C6PF5V1z2CymbD/CbnGhp5XJgc1j3slAj8+b5Dw+XP/OFMAcxWWTkpqTWZZapG+XwJWx
        ZHYPS8Ez+YqGz8tZGxj/yHUxcnBICJhIzOnQ72Lk4hASOMQkse3+U2YI5x+jxJu3rxi7GDmB
        nE2MEsseB4A0sAl4SVydnA0SFhEwl1g3aREbSD2zwFkmiV2PHzODJIQFnCV2tGxngyhykTi9
        cBeU7SSxb/cxdhCbRUBVYnLzDLA4r4CdREvDGhaIxf2MEpfePwMbxClgJHGkfRLYEYwCYhLf
        T61hArGZBcQlbj2ZD2ZLCAhILNlznhnCFpV4+fgfK8RnShJ9G6DKtSTmNfyGshUlpnQ/ZIfY
        KyhxcuYTlgmMYrOQTJ2FpGUWkpZZSFoWMLKsYpR29gv28Ar29fQzMNbz8/f2dNQNdnL18dFz
        9vfdxAiMvDUSk6bvYDw395veIUYmDsZDjBIczEoivAnTJiYK8aYkVlalFuXHF5XmpBYfYpTm
        YFES5y3635AoJJCeWJKanZpakFoEk2Xi4JRqYGIKYyk/xHTN1vhT72FB3TX9bgvnigm7dU9i
        uHie/b206qYl9xaqzRLqbRNZHLbs+xml9QXpdtordPSf3JZ2XnxF4FYe37vGb/O39NUuM9Sq
        sz91JEPOP25l9w8Nttz1s3urTt8SZFw8/731snWTfpekTj3Mqdb6tcCeK4j1ary9l+7zVads
        /ZMrd5cJ6guUikmZHizd9ZC5S9JGNaosd+t86VKeGd6y6q+49dpV4jq0PTf93s5teMKR98r8
        nf/0Of0m2S1yttuwfX08q8Dnkpe7FxWx5B+8toF334dnhX03BEL5S3yZ/Od2tF0wObks78zB
        y2UyPM/VfrC07BBn71g954Cr+CnpqPZVx5V+KLEUZyQaajEXFScCAHmhWQ0rAwAA
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gU2hldmNoZW5rbw0KDQpUaGFua3MgZm9yIHlvdXIgcXVpY2sgcmVwbHkuDQoNCkJlc2lk
ZXMgdGhlIGZhY3QgaXQgbWlzc2VzIERUIHNjaGVtYSB1cGRhdGUsIHdoeSB0aGlzIGlzIG5lZWRl
ZCBhdCBhbGw/IA0KLS0tLS0tPiB3ZSBuZWVkIGEgaW50ZXJmYWNlIHRvIGNvbmZpZ3VyZSB0aGUg
SENOVC9MQ05UIHZpYSBkdHMgKGN1cnJlbnQgd2UganVzdCBoYXZlIEFDUEkgdG8gY29uZmlnIGl0
KS4NCldoYXQncyB3cm9uZyB3aXRoIHRoZSBleGlzdGluZyBEVCB0aW1pbmdzPyANCi0tLS0tLS0t
PiB0aGUgSENOVC9MQ05UIHZhbHVlIGNhbGN1bGF0ZWQgYnkgY29kZSBpcyBub3QgYWNjdXJhY3ku
IFRoaXMgaXMgc2ltaWxhciBjaGFuZ2VzIGFzIHRoZSBBQ1BJIGludGVyZmFjZS4NCglpMmNfZHdf
YWNwaV9wYXJhbXMoZGV2aWNlLCAiU1NDTiIsICZkZXYtPnNzX2hjbnQsICZkZXYtPnNzX2xjbnQs
ICZzc19odCk7DQoJaTJjX2R3X2FjcGlfcGFyYW1zKGRldmljZSwgIkZQQ04iLCAmZGV2LT5mcF9o
Y250LCAmZGV2LT5mcF9sY250LCAmZnBfaHQpOw0KCWkyY19kd19hY3BpX3BhcmFtcyhkZXZpY2Us
ICJIU0NOIiwgJmRldi0+aHNfaGNudCwgJmRldi0+aHNfbGNudCwgJmhzX2h0KTsNCglpMmNfZHdf
YWNwaV9wYXJhbXMoZGV2aWNlLCAiRk1DTiIsICZkZXYtPmZzX2hjbnQsICZkZXYtPmZzX2xjbnQs
ICZmc19odCk7DQoJCQkJCQkJCQkJICAgDQotIGkyYy1zY2wtZmFsbGluZy10aW1lLW5zDQotIGky
Yy1zY2wtaW50ZXJuYWwtZGVsYXktbnMNCi0gaTJjLXNjbC1yaXNpbmctdGltZS1ucw0KLSBpMmMt
c2RhLWZhbGxpbmctdGltZS1ucw0KWWVhaCwgSSBrbm93IHRob3NlIHByb3BlcnRpZXMuIEJ1dCB0
aG9zZSBhcmUgY29tbW9uIGZvciBpMmMuDQpNeSBjaGFuZ2VzIGlzIGZvciB0aGUgc3BlY2lmaWMg
SFcgY29udHJvbGxlcihkZXNpZ253YXJlKSBmb3IgY29uZmlndXJpbmcgaXRzIHR3byByZWdpc3Rl
ciBIQ05UL0xDTlQuDQpJbiB0aGlzIGNhc2UsIHN0aWxsIHdlIG5lZWQgb25lIHByb3BlcnR5IHBl
ciBlYWNoIHZhbHVlPw0KDQoNCi0tDQpXaXRoIEJlc3QgUmVnYXJkcywNCkxhd3JlbmNlLCBXYW5n
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFu
ZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiAyMDIxxOoxMdTCMTXI1SAx
ODoyOA0KVG86IFdhbmcsIExhd3JlbmNlIChOU0IgLSBDTi9IYW5nemhvdSkgPGxhd3JlbmNlLndh
bmdAbm9raWEtc2JlbGwuY29tPg0KQ2M6IGphcmtrby5uaWt1bGFAbGludXguaW50ZWwuY29tOyBt
aWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBXYW5nQHdybGluYjE5My5lbWVhLm5zbi1u
ZXQubmV0DQpTdWJqZWN0OiBSZTogW1BBVENIXSBpMmM6IGRlc2lnbndhcmU6IEdldCBIQ05UL0xD
TlQgdmFsdWVzIGZyb20gZHRzDQoNCk9uIE1vbiwgTm92IDE1LCAyMDIxIGF0IDEyOjE5OjI2UE0g
KzAyMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gTW9uLCBOb3YgMTUsIDIwMjEgYXQg
MTA6MzU6NTVBTSArMDEwMCwgTGF3cmVuY2UsV2FuZyB3cm90ZToNCj4gPiBGcm9tOiAiV2FuZywg
TGF3cmVuY2UiIDxsYXdyZW5jZS53YW5nQG5va2lhLXNiZWxsLmNvbT4NCj4gPiANCj4gPiBDdXJy
ZW50IGNvZGUgc3VwcG9ydCBjb25maWcgdGhlIEhDTlQvTENOVCBvbmx5IHZpYSBBQ1BJIG1ldGhv
ZC4gZm9yIA0KPiA+IHRob3NlIHBsYXRmb3JtIHRoYXQgbm90IHN1cHBvcnQgQUNQSSwgd2lsbCBn
ZXQgdGhlIEhDTlQvTENOVCB2YWx1ZSANCj4gPiBiYXNlZCBvbiBpbnB1dCBjbG9jay4gQnV0IGl0
IGlzIG5vdCBhbHdheXMgYWNjdXJhY3kuIGZvciBleGFtcGxlIGluIA0KPiA+IHNvbWUgcGxhdGZv
cm0gd2lsbCBnZXQgbG93ZXIgc3BlZWQoMzIwa2h6KSBpbiBmYXN0IG1vZGUsIGFuZCBnZXQgDQo+
ID4gZmFzdGVyIHNwZWVkKDEwNWtoei9ldmVuIG1vcmUpIGluIHN0YW5kYXJkIG1vZGUuDQo+ID4g
DQo+ID4gVGhpcyBwYXRjaCBtYWtlcyBpdCBwb3NzaWJsZSBmb3IgdGhlIG5vbi1BQ1BJIHBsYXRm
b3JtIHRvIHBhc3MgbW9yZSANCj4gPiBvcHRpbWFsIEhDTlQvTENOVCB2YWx1ZXMgdG8gdGhlIGNv
cmUgZHJpdmVyIHZpYSBkdHMgaWYgdGhleSBhcmUga25vd24gYmVmb3JlaGFuZC4NCj4gPiBJZiB0
aGVzZSBhcmUgbm90IHNldCB3ZSB1c2UgdGhlIGNhbGN1bGF0ZWQgdmFsdWVzLg0KPiANCj4gQmVz
aWRlcyB0aGUgZmFjdCBpdCBtaXNzZXMgRFQgc2NoZW1hIHVwZGF0ZSwgd2h5IHRoaXMgaXMgbmVl
ZGVkIGF0IGFsbD8NCj4gV2hhdCdzIHdyb25nIHdpdGggdGhlIGV4aXN0aW5nIERUIHRpbWluZ3M/
DQoNCkp1c3QgZm9yIHlvdXIgY29udmVuaWVuY2UgYW4gZXhjZXJwdCBmcm9tIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLnR4dA0KDQotIGkyYy1zY2wtZmFsbGluZy10
aW1lLW5zDQpOdW1iZXIgb2YgbmFub3NlY29uZHMgdGhlIFNDTCBzaWduYWwgdGFrZXMgdG8gZmFs
bDsgdChmKSBpbiB0aGUgSTJDIHNwZWNpZmljYXRpb24uDQoNCi0gaTJjLXNjbC1pbnRlcm5hbC1k
ZWxheS1ucw0KTnVtYmVyIG9mIG5hbm9zZWNvbmRzIHRoZSBJUCBjb3JlIGFkZGl0aW9uYWxseSBu
ZWVkcyB0byBzZXR1cCBTQ0wuDQoNCi0gaTJjLXNjbC1yaXNpbmctdGltZS1ucw0KTnVtYmVyIG9m
IG5hbm9zZWNvbmRzIHRoZSBTQ0wgc2lnbmFsIHRha2VzIHRvIHJpc2U7IHQocikgaW4gdGhlIEky
QyBzcGVjaWZpY2F0aW9uLg0KDQotIGkyYy1zZGEtZmFsbGluZy10aW1lLW5zDQpOdW1iZXIgb2Yg
bmFub3NlY29uZHMgdGhlIFNEQSBzaWduYWwgdGFrZXMgdG8gZmFsbDsgdChmKSBpbiB0aGUgSTJD
IHNwZWNpZmljYXRpb24uDQoNCi0tDQpXaXRoIEJlc3QgUmVnYXJkcywNCkFuZHkgU2hldmNoZW5r
bw0KDQoNCg==
