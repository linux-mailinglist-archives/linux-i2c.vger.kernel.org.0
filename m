Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7603AAA970
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 18:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731492AbfIEQzr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 12:55:47 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:39883 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbfIEQzq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 12:55:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id 6B17B184DD;
        Thu,  5 Sep 2019 18:55:44 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id UShOhYtQohO6; Thu,  5 Sep 2019 18:55:43 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
        by bastet.se.axis.com (Postfix) with ESMTPS id 8B500184C5;
        Thu,  5 Sep 2019 18:55:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 768D81A066;
        Thu,  5 Sep 2019 18:55:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6AB251A064;
        Thu,  5 Sep 2019 18:55:43 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
        by boulder02.se.axis.com (Postfix) with ESMTP;
        Thu,  5 Sep 2019 18:55:43 +0200 (CEST)
Received: from XBOX08.axis.com (xbox08.axis.com [10.0.15.178])
        by seth.se.axis.com (Postfix) with ESMTP id 5E54D25CC;
        Thu,  5 Sep 2019 18:55:43 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX08.axis.com (10.0.15.178)
 with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 5 Sep 2019 18:55:43
 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
 ([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1365.000; Thu, 5 Sep 2019
 18:55:43 +0200
From:   =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c-eeprom_slave: Add read only mode
Thread-Topic: [PATCH] i2c-eeprom_slave: Add read only mode
Thread-Index: AQHVY/mVwIUeYgIvn0Kx5XZGOQIDP6cdIMCAgAAsz68=
Date:   Thu, 5 Sep 2019 16:55:43 +0000
Message-ID: <1D4EAF68-973E-4E25-AFD8-48815E0BFBC6@axis.com>
References: <1567695164-20464-1-git-send-email-bjorn.ardo@axis.com>,<20190905161521.GA3695@kunai>
In-Reply-To: <20190905161521.GA3695@kunai>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQo+IE9uIDUgU2VwIDIwMTksIGF0IDE4OjE1LCBXb2xmcmFtIFNhbmcgPHdzYUB0aGUtZHJlYW1z
LmRlPiB3cm90ZToNCj4gDQo+IA0KPj4gKyAgICAgICAgICAgIGlmIChlZXByb20tPnJlYWRfb25s
eSkNCj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiBXaGF0IGFib3V0Og0KPiAN
Cj4gICAgaWYgKCFlZXByb20tPnJlYWRfb25seSkgew0KPiAgICAgICAgc3Bpbl9sb2NrKCZlZXBy
b20tPmJ1ZmZlcl9sb2NrKTsNCj4gICAgICAgIGVlcHJvbS0+YnVmZmVyW2VlcHJvbS0+YnVmZmVy
X2lkeCsrICYgZWVwcm9tLT5hZGRyZXNzX21hc2tdID0gKnZhbDsNCj4gICAgICAgIHNwaW5fdW5s
b2NrKCZlZXByb20tPmJ1ZmZlcl9sb2NrKTsNCj4gICAgfQ0KPiANCj4gV2UgY2FuIHN0aWxsIGtl
ZXAgb25seSBvbmUgZXhpdCBwb2ludCBmcm9tIHRoZSBmdW5jdGlvbiB0aGlzIHdheS4NCg0KDQpZ
ZXMsIHRoYXQgaXMgYmV0dGVyLCBJIHdpbGwgZml4IHRvbW9ycm93Lg0KDQo+IA0KPj4gICAgeyAi
c2xhdmUtMjRjMDIiLCBJMkNfU0xBVkVfREVWSUNFX01BR0lDKDIwNDggLyA4LCAgMCkgfSwNCj4+
ICsgICAgeyAic2xhdmUtMjRjMDIiLCBJMkNfU0xBVkVfREVWSUNFX01BR0lDKDIwNDggLyA4LCAg
STJDX1NMQVZFX0ZMQUdfUk8pIH0sDQo+IA0KPiAicm8iIG1pc3NpbmcuIFlvdSBoYXZlbid0IHRl
c3RlZCB0aGlzIGVudHJ5IDspDQo+IA0KDQpHdWlsdHkhIEkgZGlzY292ZXJlZCB3aGVuIEkgd2Fz
IGFib3V0IHRvIHNlbmQgdGhlIHBhdGNoIHRoYXQgSeKAmXZlIG1pc3NlZCB0aGF0IGVlcHJvbSwg
c28gSSBhZGRlZCBpdCB0aGVyZS4gQnV0IEkgZGlzY292ZXJlZCBteSBlcnJvciB3aGVuIEkgYmFj
a3BvcnRlZCBpdCB0byBvdXIgc3lzdGVtOi0pDQoNCkJhIA==
