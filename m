Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6591ADB139
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2019 17:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390452AbfJQPiT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Oct 2019 11:38:19 -0400
Received: from mail-eopbgr130128.outbound.protection.outlook.com ([40.107.13.128]:6788
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390135AbfJQPiT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Oct 2019 11:38:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACTadiizNqnWwDO8QwROUivlz5rVzofEt8OSamsmS5So27tsv8fjdtRJGAYqdfLs8kc8ECylmWW51lg5YZf9QHZ4KzXqTUEkGOgQy4er951eU3eHr929LEq5NtwAPxRBlruRl32RQuv6UUBVDmljrpJomzUN1PJgTF5AVHSgoScEWJCttiGZ+LcdG9d2Y2m8pHM4Sza8J7PLHeAq6ZFmy4Mcd1kNFcAfb+bzcEGL/5x4FPIdj7NGjT3UJPxksN41JxBH6vIdMbgRil6P4yebBAd27Xuxnc5OfyOQ0V7d1lde4no0R4n+u0pbfRrmnEVQ2J1kuidJFCcJJdZ/BLXGjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ldXbmzEKfb46bE02aYN0oKLI/yJ6PHJSG7g8Td1pMw=;
 b=Y2radKlqalejVidKVBKawqXRCdaHKCKVCYA2bPNpyVgZasuNUogBAtfZ+s6ibjsjMxQ42CCMHlZz3MWDdQYw0B7NzpJPG3bCc9OB4FLV1IsaXfsdnApLaKVYNe2neiqTmkMllGIjuzjF8cNDNZqcEGwlNL7poHFoC+S37CL26jLtJ2/GM5lSAMcD497kWL90htOB3w04pNtmRK7R0dkPY/EhycdccBjl6z8bKpw8PJcnGwGb7D/WClHc6LMLQRVt43qNLVNJGuFClWUZW7jo2PBCNLp2mhuSxEpRSSsPkvYTYzNX4R2d6OGvaWssblQdyxlg7FLzdYdoU9D6GfWWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ldXbmzEKfb46bE02aYN0oKLI/yJ6PHJSG7g8Td1pMw=;
 b=DgqNO9HJEQ0/q0KfwGvusYDMB02MXZd58QNbvsyp0sIlV/CVcU+dJ0gqZeRRn2pTZqIC8b5T+UQOXOqSYpghnIXS0mmCyi1chZCZDq0DrzSaX9n9BwmgmKTS+4ihgDkFUqcOgUMf+WylEflv95VUjV5zX723TkMv+M0dc2GsZXw=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3484.eurprd02.prod.outlook.com (52.134.65.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Thu, 17 Oct 2019 15:38:14 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 15:38:14 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [v3,1/2] dt-bindings: i2c: support property idle-state
Thread-Topic: [v3,1/2] dt-bindings: i2c: support property idle-state
Thread-Index: AQHVg9kFF97N04ed3UyYkEcS9W8q/qde+hAA
Date:   Thu, 17 Oct 2019 15:38:14 +0000
Message-ID: <bfdb97c1-76f4-52d9-7f02-c62bed8192ce@axentia.se>
References: <20191016040920.8511-1-biwen.li@nxp.com>
In-Reply-To: <20191016040920.8511-1-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR08CA0070.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::41) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27a13130-ca05-425d-075c-08d7531805c7
x-ms-traffictypediagnostic: DB3PR0202MB3484:
x-microsoft-antispam-prvs: <DB3PR0202MB348475E562C1EC8966CE578FBC6D0@DB3PR0202MB3484.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(366004)(136003)(39830400003)(346002)(189003)(199004)(476003)(229853002)(66066001)(71190400001)(2906002)(4001150100001)(6512007)(65806001)(65956001)(99286004)(386003)(7736002)(8936002)(76176011)(53546011)(486006)(6506007)(31686004)(446003)(305945005)(71200400001)(25786009)(2616005)(102836004)(26005)(11346002)(186003)(86362001)(508600001)(31696002)(8676002)(81166006)(66476007)(3846002)(14444005)(2501003)(52116002)(6486002)(54906003)(6116002)(110136005)(81156014)(36756003)(6246003)(256004)(5660300002)(6436002)(58126008)(66946007)(66556008)(66446008)(4326008)(316002)(14454004)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3484;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yFrnbk1fwHgZXOAt4kprTsvkNYzwCK2tdGH51i3iVJpEZ6yqBwtV42wurmiCLUuRE2bRo+XN5x0S6msyA/j9Mx96iEefo8fZX3FRRQNl49BLAj3gRbJyrzk3nensBm2I3UpPqu3IJ6BTDjZWZhBOJzyi22YKKKs1UX7FiYnN8CNqVrK2V3250CmvcxGXDhPkfcK/Zl9bGLKKya872arTGR8eDMBiIUd8MQYwF0LEtKrOLglEqu14p4EKkEpehfkpK9fcrSJLnwcQj7cCGPr6kQ10fQ6DBWqrYVTbhm8J5d1VgnTmQsMRye6S53dEg2U9eHznOMwjVCDpw6HvG+Dn65bKgTtcSMAUvKHcA5hQWfm6tQaYorOwi7ae8Oh7b0StzVgXA9zpeAULlYYTxkm2DR5TJ0XMTUYy0ZvClrhz+fQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <153486A3B7F4E840A2989986FE309003@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a13130-ca05-425d-075c-08d7531805c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 15:38:14.1272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jUHbtPctLJH3HK402Yr9vgTsGzUnQmDPuiPrSaaFPSHRrcuLHdn20+W55HCUTDvB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3484
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMC0xNiAwNjowOSwgQml3ZW4gTGkgd3JvdGU6DQo+IFRoaXMgc3VwcG9ydHMgcHJv
cGVydHkgaWRsZS1zdGF0ZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQml3ZW4gTGkgPGJpd2VuLmxp
QG54cC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2UgaW4gdjM6DQo+IAktIHVwZGF0ZSBzdWJqZWN0IGFu
ZCBkZXNjcmlwdGlvbg0KPiAJLSBhZGQgc29tZSBpbmZvcm1hdGlvbiBmb3IgcHJvcGVydHkgaWRs
ZS1zdGF0ZQ0KPiANCj4gQ2hhbmdlIGluIHYyOg0KPiAJLSB1cGRhdGUgc3ViamVjdCBhbmQgZGVz
Y3JpcHRpb24NCj4gCS0gYWRkIHByb3BlcnR5IGlkbGUtc3RhdGUNCj4gDQo+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdXgtcGNhOTU0eC50eHQgfCAyICsrDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0
DQo+IGluZGV4IDMwYWM2YTYwZjA0MS4uN2FiZGE1MDZiODI4IDEwMDY0NA0KPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdXgtcGNhOTU0eC50eHQNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1
NHgudHh0DQo+IEBAIC0yNSw2ICsyNSw4IEBAIFJlcXVpcmVkIFByb3BlcnRpZXM6DQo+ICBPcHRp
b25hbCBQcm9wZXJ0aWVzOg0KPiAgDQo+ICAgIC0gcmVzZXQtZ3Bpb3M6IFJlZmVyZW5jZSB0byB0
aGUgR1BJTyBjb25uZWN0ZWQgdG8gdGhlIHJlc2V0IGlucHV0Lg0KPiArICAtIGlkbGUtc3RhdGU6
IGlmIHByZXNlbnQsIG92ZXJyaWRlcyBpMmMtbXV4LWlkbGUtZGlzY29ubmVjdCwNCj4gKyAgICBQ
bGVhc2UgcmVmZXIgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL211eC9tdXgt
Y29udHJvbGxlci50eHQNCj4gICAgLSBpMmMtbXV4LWlkbGUtZGlzY29ubmVjdDogQm9vbGVhbjsg
aWYgZGVmaW5lZCwgZm9yY2VzIG11eCB0byBkaXNjb25uZWN0IGFsbA0KPiAgICAgIGNoaWxkcmVu
IGluIGlkbGUgc3RhdGUuIFRoaXMgaXMgbmVjZXNzYXJ5IGZvciBleGFtcGxlLCBpZiB0aGVyZSBh
cmUgc2V2ZXJhbA0KPiAgICAgIG11bHRpcGxleGVycyBvbiB0aGUgYnVzIGFuZCB0aGUgZGV2aWNl
cyBiZWhpbmQgdGhlbSB1c2Ugc2FtZSBJMkMgYWRkcmVzc2VzLg0KPiANCg0KUm9iLCBzaG91bGQg
aTJjLW11eC1pZGxlLWRpc2Nvbm5lY3QgcGVyaGFwcyBiZSBkZXByZWNhdGVkIGhlcmU/IElzIHRo
YXQNCmFwcHJvcHJpYXRlPw0KDQppZGxlLXN0YXRlIHByb3ZpZGVzIGEgc3VwZXItc2V0IG9mIHdo
YXQgaTJjLW11eC1pZGxlLWRpc2Nvbm5lY3QgcHJvdmlkZXMuDQoNCkNoZWVycywNClBldGVyDQo=
