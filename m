Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA44DD798A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 17:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732872AbfJOPPO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Oct 2019 11:15:14 -0400
Received: from mail-eopbgr140095.outbound.protection.outlook.com ([40.107.14.95]:42563
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725991AbfJOPPO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 15 Oct 2019 11:15:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqCDlfbRJz5G+fdHsSzgTOUJXC767VXVHbucVQIAXl5ExupOr8Dw0tUivMi9LhKnfja1udunKDl8seQnxgxKJnZrHs8OZLhWafIAzt7U0v2wXN6AApg7lnYPgc3fcrw7BAt2lcBf6ck9Opn0A2vFNsrvUQ79zO1C7//rJ2gZrZ7utPMU6H7b7yDQpyH9WIngbvk2OfGRVgX8ssRkBKIyjGWQlwaomrmLULUmcP5z91MxuTgIe6ogq8UBHIDK+N+KwI1W4fwKWPyMRC8Imw3nMJilpcg/yiFjCKoVXW+ZRWhsDfSs2GNY9AMCCmn0tekE9KRdugmbTiW13br9pNHW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YptdA8tON/ni7QNB0imlRUTP7z7lsyrx/9hKaZgFX+g=;
 b=UNe+Vbm9W2HvvcT2Ui2wgbN/SVvU2frA2s0OIBjknJqfjUFlXTqADTV+gY5xlrYzgZGML1fjIRtqpeREiXz90WyUNXRmsPsCUjzUAOpMVOmQPsm74BNVN7gkwEtapgfEYOj6Horeg081LMXM/ZXidHYDKR4YOy0JoOscYvQyYHnlww5tu8QkJ+382V/FiyGCzZriTqoCxkPLslfzVeVKqqNS4V8s/FWT6Esgi0vH8zg6porXEvAFCSWePoMZDiTLULNhCN+9NXDk3xu/tuUHv7xZLMavwwIpTMRvB4jfqApPn7VTOEEW1bF5FOGISiL7/jslwAEUqvRp6kfS5j2RAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YptdA8tON/ni7QNB0imlRUTP7z7lsyrx/9hKaZgFX+g=;
 b=jSR7MU4KjGCfRfPRHJjUH1/5wP8Jqu8NQAShu9+SmDuQncuCDmz+zrvzFYQVXLbuozYpNkf1N1ef8p0oYdoNiqTd6pOGLh7KQ0MG6OUe+M5dHCD2vXIitdLUCMLiriK0xB1fBMgoqsXl5NrTZAc3h+mHMH8YRYlczDa8zaeobbA=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3433.eurprd02.prod.outlook.com (52.134.70.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 15 Oct 2019 15:15:07 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 15:15:06 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [v2,1/2] dt-bindings: i2c: add property idle-state
Thread-Topic: [v2,1/2] dt-bindings: i2c: add property idle-state
Thread-Index: AQHVgxVY3ClkKjJCH0u1LxNx3XxuOKdb0HQA
Date:   Tue, 15 Oct 2019 15:15:06 +0000
Message-ID: <996277d6-1c0b-6080-4565-ce3aad77e09e@axentia.se>
References: <20191015044839.23746-1-biwen.li@nxp.com>
In-Reply-To: <20191015044839.23746-1-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::33)
 To DB3PR0202MB3434.eurprd02.prod.outlook.com (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1b478a5-4e39-41ca-4520-08d75182761b
x-ms-traffictypediagnostic: DB3PR0202MB3433:
x-microsoft-antispam-prvs: <DB3PR0202MB343336B3E629C9C10198CA11BC930@DB3PR0202MB3433.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39830400003)(346002)(396003)(136003)(366004)(37524003)(199004)(189003)(66066001)(65956001)(54906003)(36756003)(26005)(31686004)(8676002)(7736002)(4326008)(66946007)(71190400001)(71200400001)(229853002)(6512007)(256004)(14444005)(64756008)(66446008)(386003)(66476007)(66556008)(65806001)(2906002)(5660300002)(6506007)(86362001)(508600001)(53546011)(102836004)(110136005)(11346002)(186003)(76176011)(446003)(486006)(25786009)(14454004)(316002)(99286004)(6486002)(4001150100001)(3846002)(8936002)(31696002)(6246003)(2616005)(305945005)(52116002)(6436002)(476003)(6116002)(58126008)(81166006)(2501003)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3433;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gyf4CcFjnj8NhBPn34/gvTutnsPnhGYsVXJrpUDi/Dr6+gx6bVBbE9vAm1Au8j22UHF9gBelPh4hruYRUCTIMeosMekhEHmQJeA1MSooTVGMrOmMQMcqYTGBGyLcf7EC2WiASb3R7jHjmMJRRha+gj85+kvyrL6aoNhKN8x5ymsxCYGlx2Xf+clM/AtQUbcnRlM3/WbLUIcYOpXzOrBjMY1qGzES1XVdWtJF6VBSeNUBKqzfnEoJE+DAZDHXTkYEEZwFfLm5k5pYsJXwWadK5Dp/dBkXOClM5c4IKeGoWTuQU25WDKXsZ7idurCRpM+u5+to2owElsYMnt56KrmP3U8N4/Q3YzAcwtyNbW1YCH06vxgOUYNF/h5sv/ec2O7pnVgC8WtkpD1iq/qAffFcx92uDzywc3D6TvojcVfLgTY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A11C3CE2F3F944E8498AB63151EFCF6@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b478a5-4e39-41ca-4520-08d75182761b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 15:15:06.8239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GinMkKyR6LgaUwOt493Q7gFEB+SJ+MWAEa3GCDXWVAF0p2LSxB4RZ+1PmFyinZJH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3433
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMC0xNSAwNjo0OCwgQml3ZW4gTGkgd3JvdGU6DQo+IFRoaXMgYWRkcyBwcm9wZXJ0
eSBpZGxlLXN0YXRlDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhw
LmNvbT4NCj4gLS0tDQo+IENoYW5nZSBpbiB2MjoNCj4gCS0gdXBkYXRlIHN1YmplY3QgYW5kIGRl
c2NyaXB0aW9uDQo+IAktIGFkZCBwcm9wZXJ0eSBpZGxlLXN0YXRlDQo+IA0KPiAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0IHwgMSArDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdXgtcGNhOTU0eC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdXgtcGNhOTU0eC50eHQN
Cj4gaW5kZXggMzBhYzZhNjBmMDQxLi4yYzc4NzVkMzM4ZmIgMTAwNjQ0DQo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW11eC1wY2E5NTR4LnR4dA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdXgtcGNhOTU0
eC50eHQNCj4gQEAgLTM0LDYgKzM0LDcgQEAgT3B0aW9uYWwgUHJvcGVydGllczoNCj4gICAgICAt
IGZpcnN0IGNlbGwgaXMgdGhlIHBpbiBudW1iZXINCj4gICAgICAtIHNlY29uZCBjZWxsIGlzIHVz
ZWQgdG8gc3BlY2lmeSBmbGFncy4NCj4gICAgICBTZWUgYWxzbyBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaW50ZXJydXB0cy50eHQNCj4gKyAg
LSBpZGxlLXN0YXRlOiBQbGVhc2UgcmVmZXIgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL211eC9tdXgtY29udHJvbGxlci50eHQNCj4gIA0KPiAgRXhhbXBsZToNCj4gIA0KPiAN
Cg0KQXMgcGVyIG15IGNvbW1lbnRzIG9uIHRoZSBjb2RlLCB5b3Ugc2hvdWxkIG1lbnRpb24gdGhh
dCBpZGxlLXN0YXRlLCBpZiBwcmVzZW50LA0Kb3ZlcnJpZGVzIGkyYy1tdXgtaWRsZS1kaXNjb25u
ZWN0LiBJIGFsc28gdGhpbmsgeW91IHNob3VsZCBrZWVwIGlkbGUtc3RhdGUNCmFuZCBpMmMtbXV4
LWlkbGUtZGlzY29ubmVjdCByaWdodCBuZXh0IHRvIGVhY2ggb3RoZXIuDQoNCkNoZWVycywNClBl
dGVyDQo=
