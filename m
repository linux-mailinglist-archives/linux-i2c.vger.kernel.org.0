Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 782C0B4CD3
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 13:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfIQLZy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 07:25:54 -0400
Received: from mail-eopbgr10112.outbound.protection.outlook.com ([40.107.1.112]:32676
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726434AbfIQLZy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Sep 2019 07:25:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0+UXADVdmC/ceqJYvxDc1MBwu7bi64AOf6ERlm3h+oo9oRf0wZTE68LPmHwfRAjtEzEEoozhAK6Me0tXAFimJh146FPIDqW+hc9Xh7ANzDjWlsHKrTJO5PYA6q68/DrZRrLMyso8hLAr2F1Jf5zfi/a64KGBX6/k543FDbouUTsf+mTjnDq0+hAysK5KbSK+w0wylc1WkEqRfAWQmZzDxpSzRfadbzM2kmLbJByoEnleR8JEdmtWkBzV4p2fxk+c9RAaSXkRlsKNmqqlaRZrk3d8CfDebTzfH2pF+lLvvEciykfThdTf4TSZhovmC9mEJPQtKsB31U2uNAfPoFbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2IPLQne8bmR/aafFaU8QW/Cg7qrSn6YLUHgNOSE8rM=;
 b=amGZ2F6crvpv5H2lZoAuutcEOzjTfP7wkEa8x/D+YvIwuEKUHn4GYx20re1FVL4sS9gl8bylIK4c/sk7z2F8KYCux+FmJMQTCibJo0DbgU1FTvkrbMG2LQvNSyqOvhQAdMIaIiaeNhztLXDgsEvPborSID9e9mXFaVxQEneGgLe4KH3TO3IwVpNbGxgvXDCXzjxKIhqDaHBwVrqKQcqczsQqxAj/VBmi+V5BD4lrCKKwFadj0Bg99Shh/JDM9p2/D9zvCi1D+mZDlIrrFmHgCIaQMEUdMPnsLTKBw8ZKtcvxqvMN9iokn/nQkjtVwLnNe4YFSKhgpEBDlz/MPWJBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2IPLQne8bmR/aafFaU8QW/Cg7qrSn6YLUHgNOSE8rM=;
 b=hsBCoEmWiTzatbV4uo8h5rrcOC1+zJh73UK3ogbcXHor5kT8rs/dd4ZkMMLAoqqQQxhfTubxBLcFHRoLYgI0WXmQNxh1jL8TFa9Ghsw/hFWL43ozrOE9mQgc3fQVj/UWEK3CTleA4GQlGtiFD83ORhHevol1e+GxBsC8cpK9jdk=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3466.eurprd02.prod.outlook.com (52.134.72.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Tue, 17 Sep 2019 11:25:46 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 11:25:46 +0000
From:   Peter Rosin <peda@axentia.se>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] of: Let of_for_each_phandle fallback to
 non-negative cell_count
Thread-Topic: [PATCH v1 2/2] of: Let of_for_each_phandle fallback to
 non-negative cell_count
Thread-Index: AQHVbTv6D2D0Ss6S9EyzgrKOz3NJ36cvpoOAgAAUSgA=
Date:   Tue, 17 Sep 2019 11:25:46 +0000
Message-ID: <489c90fb-a135-4fd8-ecb9-46404bd3c234@axentia.se>
References: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
 <20190824132846.8589-2-u.kleine-koenig@pengutronix.de>
 <20190913215809.GA11833@bogus>
 <CAMuHMdV+pwoAA0zH_vQf2nKqzrgHP8rcMStyJbnuu2qviFC_qg@mail.gmail.com>
 <20190917101303.t5otztdus7y3ayau@pengutronix.de>
In-Reply-To: <20190917101303.t5otztdus7y3ayau@pengutronix.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1P18901CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::25) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ecdf244-b040-43ac-5fce-08d73b61c8c3
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);SRVR:DB3PR0202MB3466;
x-ms-traffictypediagnostic: DB3PR0202MB3466:
x-microsoft-antispam-prvs: <DB3PR0202MB3466477D6A5570D792DECE8EBC8F0@DB3PR0202MB3466.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(376002)(136003)(396003)(42606007)(346002)(366004)(199004)(189003)(3846002)(11346002)(58126008)(486006)(81166006)(64756008)(81156014)(71200400001)(476003)(26005)(71190400001)(508600001)(186003)(8936002)(66556008)(66946007)(8676002)(66446008)(66476007)(6246003)(25786009)(4326008)(31686004)(2616005)(446003)(6512007)(5024004)(6506007)(14444005)(36756003)(256004)(65806001)(86362001)(7416002)(102836004)(76176011)(386003)(6436002)(53546011)(229853002)(6486002)(31696002)(66574012)(5660300002)(305945005)(2906002)(110136005)(316002)(7736002)(52116002)(65956001)(99286004)(6116002)(66066001)(54906003)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3466;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: odmHXVNcJ4CfXD1KbKGzwBfqp1rYv8kjXF0K8HmL6ukgeqergyT7b82ZpXKLPhl3N8BjrmRjiaz9k0yRfqb2Zm8l8cfqjrHj3zclYt239G6q29fXQl9ld0N8a06d9285iLz3W+CgVJqcYnQl0E3mop2nwW8KQ9FFjRMl9GNEFfuI6hiPKCGtMr4MXj5nxsxiYjDwsgSeapGMuwNurvWv2gbUHXnmBv+ypK0ZIZBY3jWr0evsy+8LBEDPmD1t8S0Pfs34O+ULdxR3qQ7hZPmfWvvsNDkGzahJlZrQ6VwDhMBc/bXdJRGqkIbppIAjnzY6xOzim3VTAZorCYmkijVN42ZG58vaPKbRW7FXmLLnumXHlXqOPm0PXAeffnxqFoZqaamPAuie3UcjLhF3Jq2ZAm7g+Lo3+dPhUiy0bfIXxXQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF83662C14954B468E7F9C44C3506EE7@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecdf244-b040-43ac-5fce-08d73b61c8c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 11:25:46.5636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2auHdB9vSO00inc5zPu48N2mULyySe2yWOgX4oECmW4GzdLfiKQ42H+r/Qo2VErP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3466
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wOS0xNyAxMjoxMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEhlbGxvIEdl
ZXJ0LA0KPiANCj4gT24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMTE6NDA6MjVBTSArMDIwMCwgR2Vl
cnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPj4gSGkgUm9iLCBVd2UsDQo+Pg0KPj4gT24gRnJpLCBT
ZXAgMTMsIDIwMTkgYXQgMTE6NTggUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3Jv
dGU6DQo+Pj4gT24gU2F0LCAyNCBBdWcgMjAxOSAxNToyODo0NiArMDIwMCwgPT9VVEYtOD9xP1V3
ZT0yMEtsZWluZS1LPUMzPUI2bmlnPz0gICAgICAgICAgd3JvdGU6DQo+Pj4+IFJlZmVyZW5jaW5n
IGRldmljZSB0cmVlIG5vZGVzIGZyb20gYSBwcm9wZXJ0eSBhbGxvd3MgdG8gcGFzcyBhcmd1bWVu
dHMuDQo+Pj4+IFRoaXMgaXMgZm9yIGV4YW1wbGUgdXNlZCBmb3IgcmVmZXJlbmNpbmcgZ3Bpb3Mu
IFRoaXMgbG9va3MgYXMgZm9sbG93czoNCj4+Pj4NCj4+Pj4gICAgICAgZ3Bpb19jdHJsOiBncGlv
LWNvbnRyb2xsZXIgew0KPj4+PiAgICAgICAgICAgICAgICNncGlvLWNlbGxzID0gPDI+DQo+Pj4+
ICAgICAgICAgICAgICAgLi4uDQo+Pj4+ICAgICAgIH0NCj4+Pj4NCj4+Pj4gICAgICAgc29tZW90
aGVybm9kZSB7DQo+Pj4+ICAgICAgICAgICAgICAgZ3Bpb3MgPSA8JmdwaW9fY3RybCA1IDAgJmdw
aW9fY3RybCAzIDA+Ow0KPj4+PiAgICAgICAgICAgICAgIC4uLg0KPj4+PiAgICAgICB9DQo+Pj4+
DQo+Pj4+IFRvIGtub3cgdGhlIG51bWJlciBvZiBhcmd1bWVudHMgdGhpcyBtdXN0IGJlIGVpdGhl
ciBmaXhlZCwgb3IgdGhlDQo+Pj4+IHJlZmVyZW5jZWQgbm9kZSBpcyBjaGVja2VkIGZvciBhICRj
ZWxsc19uYW1lIChoZXJlOiAiI2dwaW8tY2VsbHMiKQ0KPj4+PiBwcm9wZXJ0eSBhbmQgd2l0aCB0
aGlzIGluZm9ybWF0aW9uIHRoZSBzdGFydCBvZiB0aGUgc2Vjb25kIHJlZmVyZW5jZSBjYW4NCj4+
Pj4gYmUgZGV0ZXJtaW5lZC4NCj4+Pj4NCj4+Pj4gQ3VycmVudGx5IHJlZ3VsYXRvcnMgYXJlIHJl
ZmVyZW5jZWQgd2l0aCBubyBhZGRpdGlvbmFsIGFyZ3VtZW50cy4gVG8NCj4+Pj4gYWxsb3cgc29t
ZSBvcHRpb25hbCBhcmd1bWVudHMgd2l0aG91dCBoYXZpbmcgdG8gY2hhbmdlIGFsbCByZWZlcmVu
Y2VkDQo+Pj4+IG5vZGVzIHRoaXMgY2hhbmdlIGludHJvZHVjZXMgYSB3YXkgdG8gc3BlY2lmeSBh
IGRlZmF1bHQgY2VsbF9jb3VudC4gU28NCj4+Pj4gd2hlbiBhIHBoYW5kbGUgaXMgcGFyc2VkIHdl
IGNoZWNrIGZvciB0aGUgJGNlbGxzX25hbWUgcHJvcGVydHkgYW5kIHVzZQ0KPj4+PiBpdCBhcyBi
ZWZvcmUgaWYgcHJlc2VudC4gSWYgaXQgaXMgbm90IHByZXNlbnQgd2UgZmFsbCBiYWNrIHRvDQo+
Pj4+IGNlbGxzX2NvdW50IGlmIG5vbi1uZWdhdGl2ZSBhbmQgb25seSBmYWlsIGlmIGNlbGxzX2Nv
dW50IGlzIHNtYWxsZXIgdGhhbg0KPj4+PiB6ZXJvLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KPj4N
Cj4+IFRoaXMgaXMgbm93IGNvbW1pdCBlNDJlZTYxMDE3ZjU4Y2Q5ICgib2Y6IExldCBvZl9mb3Jf
ZWFjaF9waGFuZGxlIGZhbGxiYWNrDQo+PiB0byBub24tbmVnYXRpdmUgY2VsbF9jb3VudCIpIGlu
IHJvYmgvZm9yLW5leHQsIHdoaWNoIGNhdXNlcyBhIGxvY2stdXAgd2hlbg0KPj4gYm9vdGluZyBh
IHNobW9iaWxlX2RlZmNvbmZpZyBrZXJuZWwgb24gcjhhNzc5MS9rb2Vsc2NoOg0KPj4NCj4+IHJj
dTogSU5GTzogcmN1X3NjaGVkIHNlbGYtZGV0ZWN0ZWQgc3RhbGwgb24gQ1BVDQo+PiByY3U6ICAg
ICAwLS4uLi46ICgyMDk5IHRpY2tzIHRoaXMgR1ApIGlkbGU9NmZlLzEvMHg0MDAwMDAwMg0KPj4g
c29mdGlycT0yOS8yOSBmcXM9MTA1MA0KPj4gICh0PTIxMDAgamlmZmllcyBnPS0xMTMxIHE9MCkN
Cj4+IE5NSSBiYWNrdHJhY2UgZm9yIGNwdSAwDQo+PiBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBw
ZXIvMCBOb3QgdGFpbnRlZA0KPj4gNS4zLjAtcmMyLXNobW9iaWxlLTAwMDUwLWdlNDJlZTYxMDE3
ZjU4Y2Q5ICMzNzYNCj4+IEhhcmR3YXJlIG5hbWU6IEdlbmVyaWMgUi1DYXIgR2VuMiAoRmxhdHRl
bmVkIERldmljZSBUcmVlKQ0KPj4gWzxjMDEwZjhhYz5dICh1bndpbmRfYmFja3RyYWNlKSBmcm9t
IFs8YzAxMGI2MjA+XSAoc2hvd19zdGFjaysweDEwLzB4MTQpDQo+PiBbPGMwMTBiNjIwPl0gKHNo
b3dfc3RhY2spIGZyb20gWzxjMDczZDAzOD5dIChkdW1wX3N0YWNrKzB4N2MvMHg5YykNCj4+IFs8
YzA3M2QwMzg+XSAoZHVtcF9zdGFjaykgZnJvbSBbPGMwNzQyZTgwPl0gKG5taV9jcHVfYmFja3Ry
YWNlKzB4YTAvMHhiOCkNCj4+IFs8YzA3NDJlODA+XSAobm1pX2NwdV9iYWNrdHJhY2UpIGZyb20g
WzxjMDc0MmYxYz5dIChubWlfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZSsweDg0LzB4MTE0KQ0K
Pj4gWzxjMDc0MmYxYz5dIChubWlfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZSkgZnJvbSBbPGMw
MTdkNjg0Pl0gKHJjdV9kdW1wX2NwdV9zdGFja3MrMHhhYy8weGM4KQ0KPj4gWzxjMDE3ZDY4ND5d
IChyY3VfZHVtcF9jcHVfc3RhY2tzKSBmcm9tIFs8YzAxN2E1OTg+XSAocmN1X3NjaGVkX2Nsb2Nr
X2lycSsweDJhYy8weDZiNCkNCj4+IFs8YzAxN2E1OTg+XSAocmN1X3NjaGVkX2Nsb2NrX2lycSkg
ZnJvbSBbPGMwMTgzOTgwPl0gKHVwZGF0ZV9wcm9jZXNzX3RpbWVzKzB4MzAvMHg1YykNCj4+IFs8
YzAxODM5ODA+XSAodXBkYXRlX3Byb2Nlc3NfdGltZXMpIGZyb20gWzxjMDE5NDFhOD5dICh0aWNr
X25vaHpfaGFuZGxlcisweGNjLzB4MTIwKQ0KPj4gWzxjMDE5NDFhOD5dICh0aWNrX25vaHpfaGFu
ZGxlcikgZnJvbSBbPGMwNWIxZDQwPl0gKGFyY2hfdGltZXJfaGFuZGxlcl92aXJ0KzB4MjgvMHgz
MCkNCj4+IFs8YzA1YjFkNDA+XSAoYXJjaF90aW1lcl9oYW5kbGVyX3ZpcnQpIGZyb20gWzxjMDE2
YzllMD5dIChoYW5kbGVfcGVyY3B1X2RldmlkX2lycSsweGU4LzB4MjFjKQ0KPj4gWzxjMDE2Yzll
MD5dIChoYW5kbGVfcGVyY3B1X2RldmlkX2lycSkgZnJvbSBbPGMwMTY3YThjPl0gKGdlbmVyaWNf
aGFuZGxlX2lycSsweDE4LzB4MjgpDQo+PiBbPGMwMTY3YThjPl0gKGdlbmVyaWNfaGFuZGxlX2ly
cSkgZnJvbSBbPGMwMTY3YjNjPl0gKF9faGFuZGxlX2RvbWFpbl9pcnErMHhhMC8weGI0KQ0KPj4g
WzxjMDE2N2IzYz5dIChfX2hhbmRsZV9kb21haW5faXJxKSBmcm9tIFs8YzAzNjczZWM+XSAoZ2lj
X2hhbmRsZV9pcnErMHg1OC8weDkwKQ0KPj4gWzxjMDM2NzNlYz5dIChnaWNfaGFuZGxlX2lycSkg
ZnJvbSBbPGMwMTAxYThjPl0gKF9faXJxX3N2YysweDZjLzB4OTApDQo+PiBFeGNlcHRpb24gc3Rh
Y2soMHhlYjA4ZGQzMCB0byAweGViMDhkZDc4KQ0KPj4gZGQyMDogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYzBjYzc1MTQgMjAwMDAwMTMgMDAwMDAwMDUgMDAwMDNiMjcNCj4+
IGRkNDA6IGViN2M0MDIwIGMwY2M3NTBjIDAwMDAwMDUxIDAwMDAwMDUxIDIwMDAwMDEzIGMwYzY2
YjA4IGViMWNkYzAwIDAwMDAwMDE4DQo+PiBkZDYwOiAwMDAwMDAwMCBlYjA4ZGQ4MCBjMDVjMWEz
OCBjMDc1NmMwMCAyMDAwMDAxMyBmZmZmZmZmZg0KPj4gWzxjMDEwMWE4Yz5dIChfX2lycV9zdmMp
IGZyb20gWzxjMDc1NmMwMD5dIChfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUrMHgxYy8weDIw
KQ0KPj4gWzxjMDc1NmMwMD5dIChfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUpIGZyb20gWzxj
MDVjMWEzOD5dIChvZl9maW5kX25vZGVfYnlfcGhhbmRsZSsweGNjLzB4ZjApDQo+PiBbPGMwNWMx
YTM4Pl0gKG9mX2ZpbmRfbm9kZV9ieV9waGFuZGxlKSBmcm9tIFs8YzA1YzFiYjg+XSAob2ZfcGhh
bmRsZV9pdGVyYXRvcl9uZXh0KzB4NjgvMHgxNzgpDQo+PiBbPGMwNWMxYmI4Pl0gKG9mX3BoYW5k
bGVfaXRlcmF0b3JfbmV4dCkgZnJvbSBbPGMwNWMyMmJjPl0gKG9mX2NvdW50X3BoYW5kbGVfd2l0
aF9hcmdzKzB4NWMvMHg3YykNCj4+IFs8YzA1YzIyYmM+XSAob2ZfY291bnRfcGhhbmRsZV93aXRo
X2FyZ3MpIGZyb20gWzxjMDUzZmMzOD5dIChpMmNfZGVtdXhfcGluY3RybF9wcm9iZSsweDI0LzB4
MWZjKQ0KPj4gWzxjMDUzZmMzOD5dIChpMmNfZGVtdXhfcGluY3RybF9wcm9iZSkgZnJvbSBbPGMw
NDQ2M2M0Pl0gKHBsYXRmb3JtX2Rydl9wcm9iZSsweDQ4LzB4OTQpDQo+PiBbPGMwNDQ2M2M0Pl0g
KHBsYXRmb3JtX2Rydl9wcm9iZSkgZnJvbSBbPGMwNDQ0YTIwPl0gKHJlYWxseV9wcm9iZSsweDFm
MC8weDJiOCkNCj4+IFs8YzA0NDRhMjA+XSAocmVhbGx5X3Byb2JlKSBmcm9tIFs8YzA0NDRlNjg+
XSAoZHJpdmVyX3Byb2JlX2RldmljZSsweDE0MC8weDE1OCkNCj4+IFs8YzA0NDRlNjg+XSAoZHJp
dmVyX3Byb2JlX2RldmljZSkgZnJvbSBbPGMwNDQ0ZmYwPl0gKGRldmljZV9kcml2ZXJfYXR0YWNo
KzB4NDQvMHg1YykNCj4+IFs8YzA0NDRmZjA+XSAoZGV2aWNlX2RyaXZlcl9hdHRhY2gpIGZyb20g
WzxjMDQ0NTBiND5dIChfX2RyaXZlcl9hdHRhY2grMHhhYy8weGI0KQ0KPj4gWzxjMDQ0NTBiND5d
IChfX2RyaXZlcl9hdHRhY2gpIGZyb20gWzxjMDQ0MzE3OD5dIChidXNfZm9yX2VhY2hfZGV2KzB4
NjQvMHhhMCkNCj4+IFs8YzA0NDMxNzg+XSAoYnVzX2Zvcl9lYWNoX2RldikgZnJvbSBbPGMwNDQz
OGE4Pl0gKGJ1c19hZGRfZHJpdmVyKzB4MTQ4LzB4MWE4KQ0KPj4gWzxjMDQ0MzhhOD5dIChidXNf
YWRkX2RyaXZlcikgZnJvbSBbPGMwNDQ1YWQwPl0gKGRyaXZlcl9yZWdpc3RlcisweGFjLzB4ZjAp
DQo+PiBbPGMwNDQ1YWQwPl0gKGRyaXZlcl9yZWdpc3RlcikgZnJvbSBbPGMwYjAxMGIwPl0gKGRv
X29uZV9pbml0Y2FsbCsweGE4LzB4MWQ0KQ0KPj4gWzxjMGIwMTBiMD5dIChkb19vbmVfaW5pdGNh
bGwpIGZyb20gWzxjMGIwMTQ0OD5dIChrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDI2Yy8weDJjOCkN
Cj4+IFs8YzBiMDE0NDg+XSAoa2VybmVsX2luaXRfZnJlZWFibGUpIGZyb20gWzxjMDc1MWM3MD5d
IChrZXJuZWxfaW5pdCsweDgvMHgxMGMpDQo+PiBbPGMwNzUxYzcwPl0gKGtlcm5lbF9pbml0KSBm
cm9tIFs8YzAxMDEwZTg+XSAocmV0X2Zyb21fZm9yaysweDE0LzB4MmMpDQo+PiBFeGNlcHRpb24g
c3RhY2soMHhlYjA4ZGZiMCB0byAweGViMDhkZmY4KQ0KPj4gZGZhMDogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAN
Cj4+IGRmYzA6IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAw
MDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwDQo+PiBkZmUwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAw
MDAwMCAwMDAwMDAwMCAwMDAwMDAxMyAwMDAwMDAwMA0KPj4NCj4+IFByZXN1bWFibHkgaXQgbG9v
cHMgZm9yZXZlciwgZHVlIHRvIGEgY29udmVyc2lvbiBvZiAtMSB0byB1bnNpZ25lZA0KPj4gc29t
ZXdoZXJlPw0KPiANCj4gSG1tLCBJIGZhaWwgdG8gc2VlIHRoZSBjdWxwcml0LiBpMmNfZGVtdXhf
cGluY3RybF9wcm9iZSBjYWxscw0KPiBvZl9jb3VudF9waGFuZGxlX3dpdGhfYXJncyB3aXRoIGNl
bGxzX25hbWU9TlVMTC4gV2l0aCB0aGF0IEkgZG9uJ3Qgc2VlDQo+IGhvdyBteSBwYXRjaCBjaGFu
Z2VzIGFueXRoaW5nIGFzIHRoZSBvbmx5IGNoYW5nZSBpcyBpbiBhbiBpZg0KPiAoaXQtPmNlbGxz
X25hbWUpIGJsb2NrIHRoYXQgc2hvdWxkbid0IGJlIHJlbGV2YW50IGluIHlvdXIgY2FzZS4NCj4g
DQo+IENhbiB5b3UgcGxlYXNlIHZlcmlmeSB0aGF0IHRoZSBsb29wIGluIG9mX2NvdW50X3BoYW5k
bGVfd2l0aF9hcmdzIGlzDQo+IGluZGVlZCBub3QgdGVybWluYXRpbmcsIGUuZy4gd2l0aA0KDQpU
aGUgYmVsb3cgaW5kaWNhdGVkIGVsc2UtYnJhbmNoIHdhcyBub3QgdG91Y2hlZCBieSBlNDJlZTYx
MDE3ZjU4Y2Q5LA0Kd2hpY2ggZW5kcyB1cCBzZXR0aW5nIHRoZSBjb3VudCB0byAtMSAoYWthIDB4
ZmYuLi5mZiBpbiB0aGlzIGNhc2UpLg0KTm8/DQoNCmludCBvZl9waGFuZGxlX2l0ZXJhdG9yX25l
eHQoc3RydWN0IG9mX3BoYW5kbGVfaXRlcmF0b3IgKml0KQ0Kew0KDQoJLi4uDQoNCgkJaWYgKGl0
LT5jZWxsc19uYW1lKSB7DQoNCgkJCS4uLg0KDQoJCX0gZWxzZSB7DQoJCQljb3VudCA9IGl0LT5j
ZWxsX2NvdW50OyAgICAvKiA8LS0tLSBTVVNQRUNUISEhICovDQoJCX0NCg0KCQkuLi4NCgl9DQoN
CgkuLi4NCn0NCg0KQ2hlZXJzLA0KUGV0ZXINCg==
