Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725132515AD
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 11:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgHYJoa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 05:44:30 -0400
Received: from mail-bn8nam12on2045.outbound.protection.outlook.com ([40.107.237.45]:9185
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729560AbgHYJo2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 05:44:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeKhUjlcN7XAOZRyUchfzbKpUt4ApHzYt5Xb4KPIjQMc3rx7wxZ2Bf2357TUWN52jWLyLY5ZBPKIlGOkQt/cxpPFGXrh+lid07XrwXthZH5kKp0MF61IH4Nb0NBmxc1ZO/fqwomckTwTJlFzwOE1BPpkfAy6+ITbG/RcA6PVd4A89ZVCxEtNZQokpLgXXSiJTtkemkaB29MArHn3PuCsMR4S2vQUixxvGAqPn0+Oz+VgGEXgv/wGK/YAlQNV8DJePamqaErhKIxgulnm9ZHA+E77S88Sp12O2CUIlSYDnJd2e7SwBTxPwALfY32YF0hRU4NCOo2VUyJwZatIL8RUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AClEywPlIiha/GOt1fnEvgsg85Di7LSIgXeSW+ApLDY=;
 b=h3QqwrODbt0VznoaMPgLnfXkynN5fMvO4BOWCP4ktSp4MTBxoS1UCrRJDixgnGl00NtsOi+6870P04jUItRFY9x7JG37mEiKIVAmsoVO7RINCr/xfeLPSOEToliMkLCdMmM8XgT1uuPYZDKLMXHNvHivcjR6DUCqiQZJNgHP666lAamhf47tUk4ujRXOC0hc4jbWQQigKoa1Sv81oZVyPCNSAWxEf+SmE0sdk3rKzDXDlhDAk4WAsld0DMJoueZhy2xo+JDEIIT+cFc6yNBgQ34W6MpPOQqdX8l/8ww0843rFhOP93yNnvYo6h7jlW6k/TnEyTeNUkody5qqBduzfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AClEywPlIiha/GOt1fnEvgsg85Di7LSIgXeSW+ApLDY=;
 b=RjuzoZ8UI7bzgnTrgjEJrlotjFFxcckpqBqVZ8nXLco+8CivDxIO8xquC+4M/u0j550MjSAJdwalpYAbghY0lCfbzvhPJ5b8BZVODIxv/Kl/ypA+ydi0EoNCSI+LAXx8p3oEPQIQQNmaODw0MK3D+rAsGSsqaJFtC5npP0ca1SI=
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 (2603:10b6:803:51::12) by SN6PR02MB4558.namprd02.prod.outlook.com
 (2603:10b6:805:b2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 09:44:23 +0000
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::75c4:4714:723b:28ce]) by SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::75c4:4714:723b:28ce%3]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 09:44:23 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>, Srinivas Goud <sgoud@xilinx.com>
Subject: RE: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Thread-Topic: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Thread-Index: AQHWQZR25/MIEeDZnk+rxvX2lvEMMajqhKAAgARDa4CAAMwAgIAAp0iAgA052KCAQqfDAIAHNrfQgABE7wCAAS474A==
Date:   Tue, 25 Aug 2020 09:44:23 +0000
Message-ID: <SN4PR0201MB3486689C38889DB9360D524ECA570@SN4PR0201MB3486.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-2-marex@denx.de>
 <MWHPR0201MB3484A9A018788EA755645D2DCA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
 <9897de5e-0539-8125-7b3f-41a1c98468ae@denx.de>
 <SN4PR0201MB348615BCD7E2C82DF7919303CA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <7cc8420d-c3a4-079b-42fc-90ac6e875d37@denx.de>
 <SN4PR0201MB3486E5229B0E870E6336A969CA670@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <a15a3e60-4738-3d38-fefb-c550dd0b0364@denx.de>
 <SN4PR0201MB3486CDCD30F78416D3325D2BCA560@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <1913c876-d7ec-6f66-e9eb-20b45a4afec4@denx.de>
In-Reply-To: <1913c876-d7ec-6f66-e9eb-20b45a4afec4@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [103.106.181.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f804a5ed-dab4-425f-3332-08d848db72f3
x-ms-traffictypediagnostic: SN6PR02MB4558:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB45585283BB07583C237FC56BCA570@SN6PR02MB4558.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HDOg1ra1z84Nd96SnoeIuVMlFgMymMGsmiyCgTfGluA/LM5yyTPeD9g/fCarP4jnWSZV+rtNbVLPmbuwnSqe0CPnY+M/OnYnxZ0SucRk4KFXiLWjLwhkz28wEpYxctvsZYi7zkzbIQCEXvLOrz9EAJ3mvT/eEYMEODcCuh1DqxFxPp7EF/K7orBkypHsXnsHm8hLUkCijlCHOvijnEivh0lQ4dRyww/5nS6O97n8C5Lwa30Hsg/fMV10vJ0o1q799W7TfnyYj0p1lAslTAmQCVdOKcJ7aihby+juGnqy0JBkZRIaVVR0+UkRaEZ8XJH1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB3486.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(136003)(396003)(346002)(54906003)(2906002)(33656002)(8676002)(26005)(53546011)(86362001)(186003)(6506007)(7696005)(83380400001)(52536014)(110136005)(107886003)(76116006)(66446008)(64756008)(66556008)(66476007)(478600001)(66946007)(4326008)(316002)(5660300002)(55016002)(8936002)(9686003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: q0GdbNPZHSWUPf7RGcrVfWlYPvnsyPkg+SzltRioQv5jAXXF1cCBBLLMqluzn1sShIdslY6fFy2HkZEng5Yq5w9wFs466dtfH13ujcujlJ4XIGB42EI++N/tKh0eT7nIU4nN3iXn8M3lWBdngXs8WBcWJitZP9ETKrUfxxrcmWECvTITW4mBTcjWDTI5PABoNM3oW2//WjOE9Q4fpZvJzT7mYceT/wT7IMApF/sNR+gGGssztjvSsQ2e9fw8jrPP/daYwNBKhRj1OUNTo+fefpthMUuDUq660nCbJ9wp8ahNU/+n05uaeCRnJAOmbAj4TZuHHT9Edlwc56u/IqiOLaVw6SYhimA1+BD+UrqIHBC/MABgXflwTnNbvrw/oPE8pe2C01F1VcPMUsS+o93ZTak+zxpgwB6rCte7se93wGovoBMqFNSk0GmKiIBh52DSiMY8pM4ZYvEr4b0azE2sth15XuQm9YuuNqVcfI1nKKhD6YGPF6GwLkO/s2BtvDYTTvh5s+ll+y1WfIebMTbtAUEg5IBv5oG1GwPImVQ9R5QurWjV7V76xi+KE+tauGIDcmsieTFmGDwI4ZB6wbRVNkPsNgJ2kn7oXQ+EAXiLRWNsq5GYSQ3vJejkWtN+kGdHq6rvpR97dHd/OvMqvuK/pA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB3486.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f804a5ed-dab4-425f-3332-08d848db72f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 09:44:23.4984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gTBkU29UXNYW5qgOAl+LZLdoF/BIAX7yB7PUJ1UNUDEjHpUewTsdUmfNr75X4Bc2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4558
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDI0LCAyMDIwIDU6MjggUE0NCj4g
VG86IFJhdml0ZWphIE5hcmF5YW5hbSA8cm5hQHhpbGlueC5jb20+OyBsaW51eC1pMmNAdmdlci5r
ZXJuZWwub3JnDQo+IENjOiBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT47IFNodWJo
cmFqeW90aSBEYXR0YQ0KPiA8c2h1YmhyYWpAeGlsaW54LmNvbT47IFdvbGZyYW0gU2FuZyA8d3Nh
QGtlcm5lbC5vcmc+OyBTcmluaXZhcyBHb3VkDQo+IDxzZ291ZEB4aWxpbnguY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDIvNV0gaTJjOiB4aWljOiBEcm9wIGJyb2tlbiBpbnRlcnJ1cHQgaGFu
ZGxlcg0KPiANCj4gT24gOC8yNC8yMCAxMDoyNyBBTSwgUmF2aXRlamEgTmFyYXlhbmFtIHdyb3Rl
Og0KPiANCj4gWy4uLl0NCj4gDQo+ID4+Pj4+IFNvLCB0aGlzIGxvY2FsX2lycV9zYXZlKCkvbG9j
YWxfaXJxX3Jlc3RvcmUoKSBpcyBub3QgcmVsYXRlZCB0bw0KPiA+Pj4+PiBleGNsdXNpdmUgYWNj
ZXNzIGluIHRoZSBkcml2ZXIgKHhpaWNfcHJvY2VzcyB2cyB4aWljX3N0YXJ0KSwgYnV0DQo+ID4+
Pj4+IHRvIHN1cHBseSB0aGUNCj4gPj4+PiBieXRlIGNvdW50IHRvIGNvbnRyb2xsZXIgYmVmb3Jl
IGl0IGNvbXBsZXRlcyB0cmFuc21pdHRpbmcgU1RBUlQgYW5kDQo+ID4+Pj4gc2xhdmUgYWRkcmVz
cy4NCj4gPj4+Pg0KPiA+Pj4+IEJ1dCB0aGVuIHNob3VsZG4ndCB0aGUgWElJQyBJUCBiZSBmaXhl
ZCAvIGV4dGVuZGVkIHdpdGggc3VwcG9ydCBmb3INCj4gPj4+PiBzdWNoIGFuIGF0b21pYyB1cGRh
dGUgaW5zdGVhZCA/DQo+ID4+Pg0KPiA+Pj4gSSBoYXZlIHN0YXJ0ZWQgY29tbXVuaWNhdGluZyB3
aXRoIHRoZSBoYXJkd2FyZSB0ZWFtIG9uIHdoeSB0aGUgSVANCj4gPj4gYmVoYXZpb3IgaXMgbGlr
ZSB0aGlzLg0KPiA+Pg0KPiA+PiBBbnkgbmV3cyBmcm9tIHRoZSBoYXJkd2FyZSB0ZWFtID8NCj4g
Pg0KPiA+ICIgVGhlIGV4cGVjdGF0aW9uIGZyb20gdGhlIElQIGlzIHVuIGludGVycnVwdGVkIHJl
YWQgaS5lIHRoZSByZWFkIGNvbW1hbmQNCj4gc2hvdWxkIGJlIHVuIGludGVycnVwdGVkIGFuZCBt
YXggZGVsYXkgZXhwZWN0ZWQgaXMgbm90IG1vcmUgdGhhbiAzNS00MCB1cw0KPiBwcm92aWRlZCBJ
SUMgZnJlcXVlbmN5IGlzIDEwMCBLaHouIFBsZWFzZSBjaGVjayBpZiB3ZSBjYW4gbWFuYWdlIHRo
aXMgaW4NCj4gU29mdHdhcmUuIElmIGRlbGF5IGlzIG5vdCBtYW5hZ2VkIGVuYWJsZSBpaWMgY29u
dHJvbCBvbmx5IGFmdGVyIHN0b3AgcmVsYXRlZA0KPiBkYXRhIGlzIHJlY2VpdmVkIg0KPiA+IFRo
YXQgd2FzIHRoZSByZXNwb25zZSBhcyBpcy4NCj4gPiBUaGUgd29ya2Fyb3VuZCBzdWdnZXN0ZWQg
YWJvdmUgaXMgdG8gZW5hYmxlIHRoZSBBWEkgSTJDIG9ubHkgYWZ0ZXINCj4gc2Vjb25kIHJlZ2lz
dGVyIHdyaXRlKFNUT1AgYml0IGluZm8gd2l0aCByZWFkIGNvdW50KSBpcyBjb21wbGV0ZWQuIFRo
aXMgaXMgbm90DQo+IGdlbmVyaWMsIHNvIHdlIGNvdWxkbid0IG1vdmUgZm9yd2FyZC4NCj4gPiBP
dXIgdHlwaWNhbCBhcHBsaWNhdGlvbiBzY2VuYXJpbyBpcyBsaWtlIHRoaXMgIlNUQVJUIFdSSVRF
LCBSRVBFQVRFRCBTVEFSVA0KPiBSRUFELCBTVE9QIi4gU28sIHdlIG11c3QgZW5hYmxlIEFYSSBJ
MkMgYmVmb3JlIHJlYWQgY291bnQgaXMgc2VudC4NCj4gDQo+IFNvLCBpZiBJIHVuZGVyc3RhbmQg
aXQgY29ycmVjdGx5LCB0aGUgWElJQyBJUCBpcyBicm9rZW4gYW5kIGNhbm5vdCBiZSBmaXhlZCBp
bg0KPiBzb2Z0d2FyZSByZWxpYWJseSA/IEhvdyBzaGFsbCB3ZSBwcm9jZWVkIHRoZW4gPw0KDQpX
ZSBhcmUgdGhpbmtpbmcgb2YgdHdvIG9wdGlvbnMuDQoxLiBUcnlpbmcgZm9yIGEgU1cgZml4IHRv
IHdvcmthcm91bmQgdGhpcyBwcm9ibGVtLiBXYWl0aW5nIG9uIHRoZSBIVyBJUCB0ZWFtIGZvciBh
bnkgb3RoZXIgc3VnZ2VzdGlvbnMuDQoyLiBYSUlDIElQIGhhcyB0d28gbW9kZXMgb2Ygb3BlcmF0
aW9uIGFzIHN0YXRlZCBpbiB0aGUgdXNlciBndWlkZSAtIER5bmFtaWMgYW5kIFN0YW5kYXJkIG1v
ZGVzLg0KQ3VycmVudGx5LCB0aGUgbGludXggZHJpdmVyIGlzIHVzaW5nIG9ubHkgZHluYW1pYyBt
b2RlIGFuZCB0aGlzIGJ1ZyBhcHBlYXJzIGhlcmUuDQpUaGUgU1cgcHJvZ3JhbW1pbmcgZm9yIHN0
YW5kYXJkIG1vZGUgaXMgZGlmZmVyZW50IGFuZCB3ZSBhcmUgdGVzdGluZyBpdCBmb3IgYWxsIHBv
c3NpYmxlIHVzZSBjYXNlcy4gT25jZQ0KVGhhdCBjb21lcyBvdXQgc3VjY2Vzc2Z1bCwgd2Ugd2ls
bCBzZW5kIG91dCB0aGUgcGF0Y2hlcy4NCg==
