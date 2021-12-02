Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FF2466AD4
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Dec 2021 21:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348750AbhLBUWL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 15:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348744AbhLBUWK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Dec 2021 15:22:10 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D74C06174A
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 12:18:47 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E892D806A8;
        Fri,  3 Dec 2021 09:18:42 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1638476323;
        bh=t9w9XFU2HzkdIXgBw1+w4e3pTYHFtUoYw7d6MqtA6QA=;
        h=From:To:CC:Subject:Date;
        b=dDweBuk8lYlS0b6185b23GjoURYmR6xMU+ARnZx2qsstzLQMzX6OMvt9CIgkM4Xx5
         EA+/DrSo+bNGGppTBWH0dhJBcrfU8DNdPsiWut8HmCakP14F+73Y0llfWN1gxCsWr6
         YXFRz3KzW4n62l/akYIbyZw0zVbfQbY2KeByNMJo1PFj/E29ShOZRJN72TDL1Z7Dgj
         ASr9LZWmSkPAXas/fuWnyqWsNiuIbFguJPA2T+Ij5DeFrmF06LU4nbvaT1c8eStDra
         NVAVSp0nY4hyXJaug+ynKHtBQIi3McGoeL+SUXPerfyMEV9xvq3Iji3Og5dgRDPkNd
         Dch8lXocJVY+w==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61a92a220000>; Fri, 03 Dec 2021 09:18:42 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 3 Dec 2021 09:18:42 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.026; Fri, 3 Dec 2021 09:18:42 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: pca954x devices sharing reset-gpios
Thread-Topic: pca954x devices sharing reset-gpios
Thread-Index: AQHX57nMktjeGOiQoEWm9JTLScC8+g==
Date:   Thu, 2 Dec 2021 20:18:42 +0000
Message-ID: <ff1f75bb-75aa-e22e-9e68-721e8d80a755@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7631ECDE38DEF4193444A1B9F127204@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=XOZOtjpE c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=IOMw9HtfNCkA:10 a=gI1U_EXz3-_qf3ap8AEA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQWxsLA0KDQpJJ3ZlIHJ1biBpbnRvIGEgcHJvYmxlbSB0cnlpbmcgdG8gYWNjdXJhdGVseSBt
b2RlbCBzb21lIGhhcmR3YXJlLg0KDQpJbiB0aGlzIHBhcnRpY3VsYXIgZGVzaWduIHRoZXJlIGFy
ZSBhIGJ1bmNoIG9mIHBjYTk1NDggaTJjIG11eGVzIGFuZCANCnNvbWUgb2YgdGhlbSBzaGFyZSB0
aGUgc2FtZSByZXNldCBwaW5zIGNvbWluZyBvdXQgb2YgYSBjdXN0b20gRlBHQSANCih3ZSd2ZSB3
cml0dGVuIGEgZ3BpbyBkcml2ZXIgdG8gcmVwcmVzZW50IHRoYXQgcGFydCBvZiB0aGUgRlBHQSku
IA0KSW5pdGlhbGx5IHdlIGhhZCB0aGlzIHdvcmtpbmcgYnkgdXNpbmcgYSBncGlvLWhvZyBmb3Ig
dGhlIHJlc2V0IGxpbmVzIA0KYW5kIHByZXR0eSBtdWNoIGZvcmdldHRpbmcgdGhleSB3ZXJlIHRo
ZXJlLg0KDQpJZiBJIHN0YXJ0IGJ1aWxkaW5nIHRoZSBmcGdhLWdwaW8gZHJpdmVyIGFzIGEgbW9k
dWxlIEkgcnVuIGludG8gYSANCnNpdHVhdGlvbiB3aGVyZSB0aGVyZSBpcyBhbiBpbXBsaWNpdCBk
ZXBlbmRlbmN5IGJldHdlZW4gdGhlIGZwZ2EtZ3BpbyANCmRyaXZlciBhbmQgdGhlIHBjYTk1NHgg
aTJjIG11eGVzLiBCZWNhdXNlIGl0J3MgaW1wbGljaXQgdGhlIA0KcGNhOTU0eF9wcm9iZSBydW5z
IGVhcmx5IGFuZCBmYWlscyBmb3IgdGhlc2UgZGV2aWNlcy4gSSBjYW4gbWFrZSB0aGF0IA0KZGVw
ZW5kZW5jeSBleHBsaWNpdCBieSB1c2luZyB0aGUgcmVzZXQtZ3Bpb3MgcHJvcGVydHkgd2hpY2gg
Y29ycmVjdGx5IA0KZGVmZXJzIHRoZSBwcm9iZSB1bnRpbCB0aGUgZnBnYS1ncGlvIGRyaXZlciBp
cyBsb2FkZWQuIEJ1dCBhcyBzb21lIG9mIA0KdGhlc2UgcGNhOTU0OCBzaGFyZSByZXNldCBsaW5l
cyB0aGV5IG9uZXMgdGhhdCBnZXQgcHJvYmVkIHNlY29uZCBnZXQgDQotRUJVU1kgd2hlbiB0aGV5
IHJlcXVlc3QgdGhlIEdQSU8uDQoNCklzIHRoZXJlIGFueSB3YXkgSSBjYW4gcmVwcmVzZW50IHRo
ZXNlIHBjYTk1NDggZGV2aWNlcyBhcyBhIGdyb3VwIHdpdGggYSANCnNpbmdsZSByZXNldC1ncGlv
IHByb3BlcnR5IGZvciB0aGUgZ3JvdXA/DQoNClRoYW5rcywNCkNocmlzDQo=
