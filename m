Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A99A2A03E7
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Oct 2020 12:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgJ3LQi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Oct 2020 07:16:38 -0400
Received: from mail-db8eur05on2075.outbound.protection.outlook.com ([40.107.20.75]:16097
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725948AbgJ3LQg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Oct 2020 07:16:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVwcbbaj6JS2NWBchfvBpN3rtBg3kViEynWPrsolB6MtwZ0ZpHKNS47F8u1VxJsmyBWQFjLpzrLuVqZKaKOhgAAiIL1yBY6e1ygnslFWjEjp5zpDtmGd/ZiVep6koiNVmIF4eSmgse86J0D6HK7S1K8KbYx8SRAUWpOR/BH9RDdBlPCHVRsB56M2lT5m9ZFaMD5KgS5RGnNZ3bQlUJonreOap//qSYJIFR9bYIQlX+6oPqAEATUa+P/zS1EQW6mNsCVV5UukTP5x/3YM1u9tml52AGVJHPvjjWXWlqEXKgUWqbrP/PMSV3Eca30wfnyef3gjVqFO6hktAIW5co1Lsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+23YOZzhDguwKRco2nWb6b3ItyykJ48IJYay6kBeD0=;
 b=Nl6hqplbfORbE8FtaOYQcQNMEnO9FUPh56SIIz1b2kNHiSSBw8y+kB7o94bUIN8crYba5UPeDQAwJu13SQ4MkH3xRug+LGt48W6JE7BmiuVvqRsUKVaDXT0Q0dVUKOyTEMuHDZVreWWvbkBofenOo7p7pHad38dOhmgFECQXuAcMbkXyi0evl4cgofVa1ToYKALr2n9+YsadCLp5BOWudPV0L5+GAXg5C0xUbOB9m7fhbtX9rzggnXtUrQchT51aDv9Wls6rTv+8Z7RhUyBC/6hlZ5t19O13YUWZaDKK8N5/NQIRjTU6FzlxhhDSwT9od5sN/rdlg7FWB+W9ui+VAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+23YOZzhDguwKRco2nWb6b3ItyykJ48IJYay6kBeD0=;
 b=dvpelP+6HE+EkszBmjwcse60BCq8nkkJVuaCGiaDysuB425LgW5fs1lA5zwm53EP4QqmyMKxRbkJlgGQ9aZpWqvmo3fh5jpPEXKX0JD8GkFAXTgiiit9Vg4dRB9FxtJQD+59ogW6uIHKMgPX5VEhNutczItLCw7jxB6dHwoFbVs=
Received: from VI1PR0401MB2446.eurprd04.prod.outlook.com
 (2603:10a6:800:4e::21) by VI1PR0401MB2333.eurprd04.prod.outlook.com
 (2603:10a6:800:28::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 11:16:31 +0000
Received: from VI1PR0401MB2446.eurprd04.prod.outlook.com
 ([fe80::c90a:a180:40a2:8996]) by VI1PR0401MB2446.eurprd04.prod.outlook.com
 ([fe80::c90a:a180:40a2:8996%12]) with mapi id 15.20.3499.028; Fri, 30 Oct
 2020 11:16:31 +0000
From:   "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
CC:     Leo Li <leoyang.li@nxp.com>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [v8] i2c: imx: support slave mode for imx I2C driver
Thread-Topic: [v8] i2c: imx: support slave mode for imx I2C driver
Thread-Index: AQHWrq4eYzLFkbsZ2kWeQk1FaIM5Tw==
Date:   Fri, 30 Oct 2020 11:16:30 +0000
Message-ID: <VI1PR0401MB2446CF6C89272BDC635397018F150@VI1PR0401MB2446.eurprd04.prod.outlook.com>
References: <20201026100514.6760-1-biwen.li@oss.nxp.com>
 <20201030061452.ledc3ayd5dvdhhzo@pengutronix.de>
In-Reply-To: <20201030061452.ledc3ayd5dvdhhzo@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca0564e7-2797-4ade-ad6d-08d87cc54119
x-ms-traffictypediagnostic: VI1PR0401MB2333:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0401MB23339337A91841D8EBBCC770CE150@VI1PR0401MB2333.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q2zgq6cLW8T2y/tqfWk7rTBQ0bQwUBRVuwPYmspaGwpNKu5LwwU8Kz2befP1drmWQMOcrW3rxYonnX7ze1MCsb4Fs5w9NU354vmuA09rrCh+bB7g6OScJ8ybC0l9na8JNAp1mWTjUGHYrFxrP+IxTuooh+Bd4CroJI0zunNMD9Pt0m2g24xETDse7lhI8AJdXVEaLn+XcVMIXStCFGrXEP44wBfuf10imx7/jH0BaewnZZ6FN8i9ZmbcImxOiemMICsg1C3zh6GulyvcB7jCens9opD1fVlJ8qkUpar8pOThyCRMcvwbDtGu49aywVjm7s82xUjjdIgSN+ktxK6b2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2446.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(6506007)(8936002)(55016002)(7416002)(26005)(2906002)(8676002)(7696005)(9686003)(478600001)(86362001)(186003)(4326008)(52536014)(33656002)(83380400001)(76116006)(64756008)(66476007)(66946007)(66446008)(71200400001)(54906003)(316002)(5660300002)(66556008)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9XqLvJhby20UGpUTcmRWJbUq5AYZH6ITwKmSVYnasu32Aro0f19/Zy8Y+kLr+KU2eGrmn5N69pbrzQcDMPYX8KJWcKM36aylAumKlCOoDG/GwEedw5gPzh0TBA6aM2PqrHymk2O5+VOn1u+jc+SEfPVsWhFjzOWkXQ2s3Zbzbp4oV+JRN94wpJoAuZgb/0jLtk+l4bfXyhsEjWG4+Og4asJ9aSWWUJIKg9BZyKo4ZcP/EHStQlM+QBfKgYUgVh/N11pX/P58k97fccY7rWrQsTA04Ijb6OFHZRi0WOfzxv8r4vlXMUp7Bx0Kd+A4btEssy+YlllD2mqrIRwGN65AZgIsfB5br/UbtHoFZMKoPU2gsB7fkXVNVOmVQsPK63Eg1VHO9aKGegPQQh3UzWBrEodQ0vsnhxaNd6pOLITPMGZ3u450r8eiN/zPEC1/As8C3ekL8hxeiGzzl10t76e4tWq0M2ePjcttKuM3m/fu21eJeaIe1VXl62D3+rahm78Mq41q2GCUvPq8dONQzi5Y+almuuIZLcy8ZHen4uM2zhF0BG0AV+b48zROanel8nsJlLqZ4VVDOvY5dPISZOTVN4zZrRTF30tM0QUN7DwcotVlfhkgf6cRuIVEU/Dc0PW6dGZUUaHMyB7E02pJuIhV1Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2446.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0564e7-2797-4ade-ad6d-08d87cc54119
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 11:16:31.0530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qgtPxkHwNq69bERMtJOSyW3fmPec8jCI2Of+19CiZ030EySWgLZ+U2XaJxAOZtJl3q4XxrjAwyidvODiCfWArQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gPiArLyoNCj4gPiArICogRW5hYmxlIGJ1cyBpZGxlIGludGVycnVwdHMNCj4gPiArICog
Tm90ZTogSUJJQyByZWdpc3RlciB3aWxsIGJlIGNsZWFyZWQgYWZ0ZXIgZGlzYWJsZWQgaTJjIG1v
ZHVsZS4NCj4gPiArICovDQo+ID4gK3N0YXRpYyB2b2lkIGkyY19pbXhfZW5hYmxlX2J1c19pZGxl
KHN0cnVjdCBpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCkgew0KPiA+ICsJdW5zaWduZWQgaW50IHRl
bXA7DQo+ID4gKw0KPiA+ICsJdGVtcCA9IGlteF9pMmNfcmVhZF9yZWcoaTJjX2lteCwgSU1YX0ky
Q19JQklDKTsNCj4gPiArCXRlbXAgfD0gSUJJQ19CSUlFOw0KPiA+ICsJaW14X2kyY193cml0ZV9y
ZWcodGVtcCwgaTJjX2lteCwgSU1YX0kyQ19JQklDKTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZv
aWQgaTJjX2lteF9jbHJfaWZfYml0KHVuc2lnbmVkIGludCBzdGF0dXMsIHN0cnVjdA0KPiA+ICtp
bXhfaTJjX3N0cnVjdCAqaTJjX2lteCkgew0KPiA+ICsJc3RhdHVzICY9IH5JMlNSX0lJRjsNCj4g
PiArCXN0YXR1cyB8PSAoaTJjX2lteC0+aHdkYXRhLT5pMnNyX2Nscl9vcGNvZGUgJiBJMlNSX0lJ
Rik7DQo+ID4gKwlpbXhfaTJjX3dyaXRlX3JlZyhzdGF0dXMsIGkyY19pbXgsIElNWF9JMkNfSTJT
Uik7IH0NCj4gPiArDQo+ID4gKy8qIENsZWFyIGFyYml0cmF0aW9uIGxvc3QgYml0ICovDQo+ID4g
K3N0YXRpYyB2b2lkIGkyY19pbXhfY2xyX2FsX2JpdCh1bnNpZ25lZCBpbnQgc3RhdHVzLCBzdHJ1
Y3QNCj4gPiAraW14X2kyY19zdHJ1Y3QgKmkyY19pbXgpIHsNCj4gPiArCXN0YXR1cyAmPSB+STJT
Ul9JQUw7DQo+ID4gKwlzdGF0dXMgfD0gKGkyY19pbXgtPmh3ZGF0YS0+aTJzcl9jbHJfb3Bjb2Rl
ICYgSTJTUl9JQUwpOw0KPiA+ICsJaW14X2kyY193cml0ZV9yZWcoc3RhdHVzLCBpMmNfaW14LCBJ
TVhfSTJDX0kyU1IpOyB9DQo+ID4gKw0KPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfSTJDX1NM
QVZFKQ0KPiANCj4gTGFzdCB5ZWFyICh0byBiZSBtb3JlIHByZWNpc2UgRGF0ZTogRnJpLCA2IERl
YyAyMDE5IDA4OjM4OjIwICswMTAwKSwgU2FzY2hhDQo+IGFza2VkIHlvdSB0byBtYWtlIEkyQ19T
TEFWRSBzdXBwb3J0IG5vdCBvcHRpb25hbC4NCj4gSW4gdGhlIFY3IG9mIHRoaXMgcGF0Y2ggeW91
IGV2ZW4gdHJpZWQgdG8gZG8gc28uLi4NCj4gUGxlYXNlLCBwYXRjaCBkcml2ZXJzL2kyYy9idXNz
ZXMvS2NvbmZpZyBhbmQgYWRkICJzZWxlY3QgSTJDX1NMQVZFIiB0byB0aGUNCj4gSTJDX0lNWCBu
b2RlLg0KU3VyZSwgbnAuIFdpbGwgYWRkIGl0IGluIHY0Lg0KPiANCj4gPiArc3RhdGljIGlycXJl
dHVybl90IGkyY19pbXhfc2xhdmVfaXNyKHN0cnVjdCBpbXhfaTJjX3N0cnVjdCAqaTJjX2lteCwN
Cj4gPiArCQkJCSAgICAgdW5zaWduZWQgaW50IHN0YXR1cywgdW5zaWduZWQgaW50IGN0bCkgew0K
PiA+ICsJdTggdmFsdWU7DQo+ID4gKw0KPiA+ICsJaWYgKHN0YXR1cyAmIEkyU1JfSUFMKSB7IC8q
IEFyYml0cmF0aW9uIGxvc3QgKi8NCj4gPiArCQlpMmNfaW14X2Nscl9hbF9iaXQoc3RhdHVzIHwg
STJTUl9JSUYsIGkyY19pbXgpOw0KPiA+ICsJfSBlbHNlIGlmIChzdGF0dXMgJiBJMlNSX0lBQVMp
IHsgLyogQWRkcmVzc2VkIGFzIGEgc2xhdmUgKi8NCj4gPiArCQlpZiAoc3RhdHVzICYgSTJTUl9T
UlcpIHsgLyogTWFzdGVyIHdhbnRzIHRvIHJlYWQgZnJvbSB1cyovDQo+ID4gKwkJCWRldl9kYmco
JmkyY19pbXgtPmFkYXB0ZXIuZGV2LCAicmVhZCByZXF1ZXN0ZWQiKTsNCj4gPiArCQkJaTJjX3Ns
YXZlX2V2ZW50KGkyY19pbXgtPnNsYXZlLCBJMkNfU0xBVkVfUkVBRF9SRVFVRVNURUQsDQo+ICZ2
YWx1ZSk7DQo+ID4gKw0KDQo=
