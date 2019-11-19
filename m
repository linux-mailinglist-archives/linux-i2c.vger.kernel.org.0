Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC1FA102EBD
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 23:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfKSWAP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Nov 2019 17:00:15 -0500
Received: from mail-eopbgr40108.outbound.protection.outlook.com ([40.107.4.108]:36195
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726911AbfKSWAP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Nov 2019 17:00:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwnfIZ0IClRAR9/LLyJTGV4tUZd/oqZtSmfVgkdJwRgG7w8BqWOtWYa8NfBe7GMfWNECj5mhNqU6oQW5kMHvvbm8DsKFOJFvqN7PKdh8vxdrZZfzKiUOXsAFh/TKoXFg+0bXKVqq6tPi9AVlquP1INIpcfrBdfMI1VulDHNPmsUbn3kQlnJlQqXxW5w05eotj4FmMJigaNqfFjIETky6CaCCDIG45b8Wecb8unohhcTdHvXbkCvRc6uqlWshJlEyfWqdiLhao6sFAQ07cUExCdbs0mK1W+i+zTl5XNfoboNhEKcXTw00qXhz0+AyOHqqco08m/D4qtmy0GNHpL3Wvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA6qV8a6x7T8V3xSCAiXKEwEPX+fjqKbkxvgIzXwMZU=;
 b=ULcggpiwNkaMyiqcjUbHde+ve184iKuUHxPjV0kn12TPDMGrLW2uORqDJyf2bBkRQHGLNXlx6ZQBLPzdphrijrNWXsxcmu6f99K2Ym9UaHK3snr1SSIFqdvXee+C9+pjRxnJy+CqlY/c/+NsQRcRnEe3AvUFFb9i0EtF58Mp32EYUGDzq5Yfh0Oh8UDSLca5p1MdUpPgGj5yOMf3lvim4ExGN2VjWbz49VTBgyC1AhsQpNUXWdrqQwfrEZfyOPpEy+93XxklPo4NxVbQCfT8E9DAktYu55gZZ6HOxpPZiq7eScFWERYw/mm9uVQjquwNmj9HVmZqoUaBE+tzQtHB8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA6qV8a6x7T8V3xSCAiXKEwEPX+fjqKbkxvgIzXwMZU=;
 b=Jfl/TeAt9i96iMKSRLHNkfiPk2dlK28FJ+OZXPTnrG1mv2ARPAwcbOMuvsoQviID7odLP4JpZ0Zz++IOKlXrzdk5iCJQF9blfQU7dHLEiIu1vbpd6f9HEi0nZuvvyOeLbDn+NtGMxmuxaxKpCzwPElsqR0ZXXOjpCBRt+t8Gb64=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3388.eurprd02.prod.outlook.com (52.134.67.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Tue, 19 Nov 2019 22:00:08 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca%7]) with mapi id 15.20.2474.015; Tue, 19 Nov 2019
 22:00:08 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [v5,3/3] arm64: dts: fsl-ls208xa-rdb: fix an errata E-00013
Thread-Topic: [v5,3/3] arm64: dts: fsl-ls208xa-rdb: fix an errata E-00013
Thread-Index: AQHViJBmXxYwmZCtrEmu2fIWeaCEraeTOEWA
Date:   Tue, 19 Nov 2019 22:00:08 +0000
Message-ID: <e006f622-08b1-3ae4-ee50-b0af7db93a02@axentia.se>
References: <20191022041152.3663-1-biwen.li@nxp.com>
 <20191022041152.3663-3-biwen.li@nxp.com>
In-Reply-To: <20191022041152.3663-3-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: AM0PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:208:122::27) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9e95f3f-f314-4075-cb1a-08d76d3bd767
x-ms-traffictypediagnostic: DB3PR0202MB3388:
x-microsoft-antispam-prvs: <DB3PR0202MB33888213D54A3BF1315261D7BC4C0@DB3PR0202MB3388.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(39830400003)(366004)(376002)(136003)(189003)(199004)(3846002)(6116002)(4001150100001)(305945005)(66946007)(256004)(14444005)(446003)(110136005)(81156014)(6506007)(386003)(53546011)(81166006)(6512007)(36756003)(2906002)(54906003)(58126008)(14454004)(71190400001)(71200400001)(11346002)(6246003)(2501003)(316002)(7736002)(64756008)(66476007)(66446008)(66556008)(486006)(31686004)(476003)(2616005)(31696002)(99286004)(52116002)(26005)(508600001)(186003)(5660300002)(6486002)(86362001)(8936002)(76176011)(25786009)(6436002)(229853002)(4326008)(65806001)(66066001)(65956001)(102836004)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3388;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3JYaYkNKZbm0Esnsi6LHD7IBBALCOLNAZv8Fnjf2ZHMhKg0S5i9BIWSqWC3Lb7ZQjnZvIiOUMPqzyAqh1mrx74Z57wKLqbvYhplu894oe9nv0AQeGzmoLE0S+tsrWDGYI4uQL4knHPaClxvBCQ0ZKpJUh6P3oXgxC/Vg6utdL2KeCkZw2QmDiLAPnUZzfio8rLqhO9PxM/kSzZ9qKwv9842elCK5hRZZXVUE/3b8pLgY/NlShs5QNchwC04XP156fM0G5JhloiRGpWqi8V3M1XDgIFhK65p5G4xN4GuIM13c1aaIRQKz4djcJfUBgxnJ5ulbWRvbQq8ThHtPrOPBedgr/XQKNlslQxl90qtolMGEkThhjLrvCAG+eadfY7MXLKL+K3iBQxIy+1KQTaWrKieXensPsjS5iQZMyqlDbDM9qwU0XCjg8MtmDObMhDAH
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE011C63B02E48478844162F976A82D6@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e95f3f-f314-4075-cb1a-08d76d3bd767
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 22:00:08.2495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PoBD8ZCdxz5vol2H/G1EuqDlxTZ7ciWNX+S6pAe8EFiB3ztaFdFpfp2DATr7Ov/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3388
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkhDQoNClRoaXMgcGF0Y2ggbmVlZHMgYW4gYWNrIGZyb20gdGhlIGFybTY0IGR0cyBtYWludGFp
bmVycy4gSSBjYW5ub3Qgc25lYWsgaXQNCmluICJiZWhpbmQgdGhlaXIgYmFja3MiLiBTbywgaXQg
d2lsbCBoYXZlIHRvIHdhaXQuIFNvcnJ5IGZvciBub3Qgbm90aWNpbmcNCmVhcmxpZXIuDQoNCkNo
ZWVycywNClBldGVyDQoNCk9uIDIwMTktMTAtMjIgMDY6MTEsIEJpd2VuIExpIHdyb3RlOg0KPiBT
cGVjaWZ5IGEgY2hhbm5lbCB6ZXJvIGluIGlkbGUgc3RhdGUgdG8NCj4gYXZvaWQgZW50ZXJyaW5n
IHRyaS1zdGF0ZWQgc3RhdGUgZm9yIFBDQTk1NDcuDQo+IEFib3V0IEUtMDAwMTM6DQo+IAktIERl
c2NyaXB0aW9uOiBJMkMxIGFuZCBJMkMzIGJ1c2VzDQo+IAkgIGFyZSBtaXNzaW5nIHB1bGwtdXAu
DQo+IAktIEltcGFjdDogV2hlbiB0aGUgUENBOTU0eCBkZXZpY2UgaXMgdHJpLXN0YXRlZCwgdGhl
IEkyQyBidXMNCj4gCSAgd2lsbCBmbG9hdC4gVGhpcyBtYWtlcyB0aGUgSTJDIGJ1cyBhbmQgaXRz
IGFzc29jaWF0ZWQNCj4gCSAgZG93bnN0cmVhbSBkZXZpY2VzIGluYWNjZXNzaWJsZS4NCj4gCS0g
SGFyZHdhcmUgZml4OiBQb3B1bGF0ZSByZXNpc3RvcnMgUjE4OSBhbmQgUjE5MCBmb3IgSTJDMQ0K
PiAJICBhbmQgcmVzaXN0b3JzIFIyMjggYW5kIFIyMjkgZm9yIEkyQzMuDQo+IAktIFNvZnR3YXJl
IGZpeDogUmVtb3ZlIHRoZSB0cmktc3RhdGUgb3B0aW9uIGZyb20gdGhlIFBDQTk1NHgNCj4gCSAg
ZHJpdmVyKFBDQTk1NHggYWx3YXlzIG9uIGVuYWJsZSBzdGF0dXMsIHNwZWNpZnkgYQ0KPiAJICBj
aGFubmVsIHplcm8gaW4gZHRzIHRvIGZpeCB0aGUgZXJyYXRhIEUtMDAwMTMpLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2Ug
aW4gdjU6DQo+IAktIHNwZWNpZnkgYSBjaGFubmVsIHplcm8gd2hlbiBwY2E5NTQ3IGluIGlkbGUg
c3RhdGUuDQo+IA0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMjA4eGEt
cmRiLmR0c2kgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczIwOHhhLXJk
Yi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMjA4eGEtcmRiLmR0
c2kNCj4gaW5kZXggNmZkN2Y2MzA4NWM5Li40MTJmMWJjMGRiNWYgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczIwOHhhLXJkYi5kdHNpDQo+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczIwOHhhLXJkYi5kdHNpDQo+IEBA
IC00OSw2ICs0OSw3IEBADQo+ICAJCXJlZyA9IDwweDc1PjsNCj4gIAkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQo+ICAJCSNzaXplLWNlbGxzID0gPDA+Ow0KPiArCQlpZGxlLXN0YXRlID0gPDA+Ow0K
PiAgCQlpMmNAMSB7DQo+ICAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gIAkJCSNzaXplLWNl
bGxzID0gPDA+Ow0KPiANCg0K
