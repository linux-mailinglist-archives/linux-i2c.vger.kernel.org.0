Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1755933F149
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 14:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhCQNh1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 09:37:27 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:51688 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbhCQNhX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Mar 2021 09:37:23 -0400
Received: from fe0vm1650.rbesz01.com (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
        by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 4F0rms1f2xz4f3lwM;
        Wed, 17 Mar 2021 14:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1615988237;
        bh=Fxsn4ql4yXCo0u8sqNLaQxGB281D4q05wUZdcb/7mvo=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=RPRBj3oSJ9XHCiulkAckZRQ4nv4THKL5SEYisDHPPOu5DFoFLue8ToPDzH6OgMEkV
         9shYkvVV5oHBGepJFIvjX8Iqdg4OXtLVtPAQV5d3q908tWnQmyYdL+Gc/CMgIZ6UiF
         xU0JxaH629h59rEozynQs08fg9PnI8YnlYXNYqhs=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 4F0rms1Ht5z1Qq;
        Wed, 17 Mar 2021 14:37:17 +0100 (CET)
X-AuditID: 0a3aad10-ea3ff7000000444e-4b-6052060d2ce3
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 01.16.17486.D0602506; Wed, 17 Mar 2021 14:37:17 +0100 (CET)
Received: from FE-MBX2050.de.bosch.com (fe-mbx2050.de.bosch.com [10.3.231.60])
        by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 4F0rmr72JPz11ZS;
        Wed, 17 Mar 2021 14:37:16 +0100 (CET)
Received: from FE-MBX2051.de.bosch.com (10.3.231.61) by
 FE-MBX2050.de.bosch.com (10.3.231.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Wed, 17 Mar 2021 14:37:16 +0100
Received: from FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f]) by
 FE-MBX2051.de.bosch.com ([fe80::9402:faf1:5852:4e2f%6]) with mapi id
 15.01.2176.009; Wed, 17 Mar 2021 14:37:16 +0100
From:   "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
To:     Lee Jones <lee.jones@linaro.org>,
        "Adam.Thomson.Opensource@diasemi.com" 
        <Adam.Thomson.Opensource@diasemi.com>,
        Wolfram Sang <wsa@kernel.org>
CC:     Support Opensource <support.opensource@diasemi.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "stwiss.opensource@diasemi.com" <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <Hubert.Streidl@de.bosch.com>,
        "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Subject: AW: [PATCH v6 1/1] mfd: da9063: Support SMBus and I2C mode
Thread-Topic: [PATCH v6 1/1] mfd: da9063: Support SMBus and I2C mode
Thread-Index: AQHXGoQ713jP8OAVJ02nOOOCT9bDXKqGx9wAgAFm7UA=
Date:   Wed, 17 Mar 2021 13:37:16 +0000
Message-ID: <9d64829d35474258a53b6785c0265e1c@de.bosch.com>
References: <20210316162237.877436-1-mark.jonas@de.bosch.com>
 <20210316170722.GF701493@dell>
In-Reply-To: <20210316170722.GF701493@dell>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.142.168.71]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsXCZbVWVpeXLSjBYMV2Zoul75cyW9z/epTR
        ouPvF0aLy7vmsFlc/b2exWJv60Vmi7v75zI6sHus+KTvsWlVJ5vHnWt72Dw+b5ILYInisklJ
        zcksSy3St0vgyli48jdbwRWBikUz5rE3MM4R6GLk5JAQMJF4+mMtUxcjF4eQwHQmiUv7ZrGB
        JIQEdjNK3NtqB5F4yyixbG4rI4RzgFHiR8MHVpAqNgE7if2v3zCB2CICkxglVtwxAyliFnjN
        LLFuxioWkISwgLNEw+2ljBBFLhL7l7UwQ9hWErPfHmbvYuTgYBFQlfjTLA0S5hWwluiYOAfq
        ijiJv88+gdmcAtoSKyfvB9vFKCArsWHDebAxzALiEpuefWeFeEdAYskeiLiEgKjEy8f/oOKK
        EgfP/GMCWcUsoCmxfpc+RKuixJTuh+wQawUlTs58wjKBUXwWkqmzEDpmIemYhaRjASPLKkbR
        tFSDslxzS0MLvaKk1OIqA0O95PzcTYyQyBTYwXi7+4PeIUYmDsZDjBIczEoivKZ5AQlCvCmJ
        lVWpRfnxRaU5qcWHGKU5WJTEeVV4NsYJCaQnlqRmp6YWpBbBZJk4OKUamGxfFmfN3B1b07fR
        9eUTvlMRbcbLsvcUBJ+O03Kd7NJn5H1/rZ9AdvnyxAMxbOy2vAnPlqX9FqvIMn93c2LF22+/
        vXfpyTQ1z5izdJpODK+pxtSPosHZcu5zH8kfaxRVcuFk+TthgbBy3LV88/17ivf9ZDl/M8xG
        7Kri+2PxSc8al55Y8YWnc27Mt/vLLLZIXNRaUOPB8L8hcm7oBKHCZyIBWhMu/b8ele+cf9U2
        faeQU5KY0TNvPuevVwJivVdbcfG0Pu7+PXmZXbvTZfktPTPLT6j7hwTOlXjPKxZmX9or+f6N
        r+eFOEXJq9wa/98evvb/fdzbzWyzHhVX/W2L1BU4adXofnOB9FKl9CQ5JZbijERDLeai4kQA
        4gKQLDsDAAA=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGksDQoNCj4gPiBGcm9tOiBIdWJlcnQgU3RyZWlkbCA8aHViZXJ0LnN0cmVpZGxAZGUuYm9zY2gu
Y29tPg0KPiA+DQo+ID4gQnkgZGVmYXVsdCB0aGUgUE1JQyBEQTkwNjMgMi13aXJlIGludGVyZmFj
ZSBpcyBTTUJ1cyBjb21wbGlhbnQuIFRoaXMNCj4gPiBtZWFucyB0aGUgUE1JQyB3aWxsIGF1dG9t
YXRpY2FsbHkgcmVzZXQgdGhlIGludGVyZmFjZSB3aGVuIHRoZSBjbG9jaw0KPiA+IHNpZ25hbCBj
ZWFzZXMgZm9yIG1vcmUgdGhhbiB0aGUgU01CdXMgdGltZW91dCBvZiAzNSBtcy4NCj4gPg0KPiA+
IElmIHRoZSBJMkMgZHJpdmVyIC8gZGV2aWNlIGlzIG5vdCBjYXBhYmxlIG9mIGNyZWF0aW5nIGF0
b21pYyBJMkMNCj4gPiB0cmFuc2FjdGlvbnMsIGEgY29udGV4dCBjaGFuZ2UgY2FuIGNhdXNlIGEg
Y2Vhc2luZyBvZiB0aGUgY2xvY2sgc2lnbmFsLg0KPiA+IFRoaXMgY2FuIGhhcHBlbiBpZiBmb3Ig
ZXhhbXBsZSBhIHJlYWwtdGltZSB0aHJlYWQgaXMgc2NoZWR1bGVkLiBUaGVuDQo+ID4gdGhlIERB
OTA2MyBpbiBTTUJ1cyBtb2RlIHdpbGwgcmVzZXQgdGhlIDItd2lyZSBpbnRlcmZhY2UuIFN1YnNl
cXVlbnRseQ0KPiA+IGEgd3JpdGUgbWVzc2FnZSBjb3VsZCBlbmQgdXAgaW4gdGhlIHdyb25nIHJl
Z2lzdGVyLiBUaGlzIGNvdWxkIGNhdXNlDQo+ID4gdW5wcmVkaWN0YWJsZSBzeXN0ZW0gYmVoYXZp
b3IuDQo+ID4NCj4gPiBUaGUgREE5MDYzIFBNSUMgYWxzbyBzdXBwb3J0cyBhbiBJMkMgY29tcGxp
YW50IG1vZGUgZm9yIHRoZSAyLXdpcmUNCj4gPiBpbnRlcmZhY2UuIFRoaXMgbW9kZSBkb2VzIG5v
dCByZXNldCB0aGUgaW50ZXJmYWNlIHdoZW4gdGhlIGNsb2NrDQo+ID4gc2lnbmFsIGNlYXNlcy4g
VGh1cyB0aGUgcHJvYmxlbSBkZXBpY3RlZCBhYm92ZSBkb2VzIG5vdCBvY2N1ci4NCj4gPg0KPiA+
IFRoaXMgcGF0Y2ggdGVzdHMgZm9yIHRoZSBidXMgZnVuY3Rpb25hbGl0eSAiSTJDX0ZVTkNfSTJD
Ii4gSXQgY2FuDQo+ID4gcmVhc29uYWJseSBiZSBhc3N1bWVkIHRoYXQgdGhlIGJ1cyBjYW5ub3Qg
b2JleSBTTUJ1cyB0aW1pbmdzIGlmIHRoaXMNCj4gPiBmdW5jdGlvbmFsaXR5IGlzIHNldC4gU01C
dXMgY29tbWFuZHMgbW9zdCBwcm9iYWJseSBhcmUgZW11bGF0ZWQgaW4NCj4gPiB0aGlzIGNhc2Ug
d2hpY2ggaXMgcHJvbmUgdG8gdGhlIGxhdGVuY3kgaXNzdWUgZGVzY3JpYmVkIGFib3ZlLg0KPiA+
DQo+ID4gVGhpcyBwYXRjaCBlbmFibGVzIHRoZSBJMkMgYnVzIG1vZGUgaWYgSTJDX0ZVTkNfSTJD
IGlzIHNldCBvcg0KPiA+IG90aGVyd2lzZSBrZWVwcyB0aGUgZGVmYXVsdCBTTUJ1cyBtb2RlLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSHViZXJ0IFN0cmVpZGwgPGh1YmVydC5zdHJlaWRsQGRl
LmJvc2NoLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIEpvbmFzIDxtYXJrLmpvbmFzQGRl
LmJvc2NoLmNvbT4NCj4gDQo+IEFwcGxpZWQgd2l0aCBXb2xmcmFtJ3MgUkIsIHRoYW5rcy4NCg0K
VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBzdXBwb3J0IHRvIGFsbCByZXZpZXdlcnMuDQoN
CkNoZWVycywNCk1hcmsNCg==
