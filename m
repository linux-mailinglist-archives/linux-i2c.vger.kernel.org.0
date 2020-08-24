Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1E724F3FF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Aug 2020 10:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgHXI17 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Aug 2020 04:27:59 -0400
Received: from mail-bn8nam08on2048.outbound.protection.outlook.com ([40.107.100.48]:16613
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725926AbgHXI15 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Aug 2020 04:27:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgANXnpKZb9YwlpbClhhQ5JruL6X5Znl+O4pBYZ2rZyed8a7l9HUkkAcr+OhCV+uwTkzxN2Ae6/0Acol3UpdSTatz+8ko+BpywDkNwfz2VQ8GdC2x5Dhde9TqaFsDILnJRIgNygdMbNATLXYH4aeNNqTVIs22BSXcpxwqoL6zHODkK7YyLLOt8oqByDhV0j8LGV3uUJlt5f4CsltPCEb4Y4yiVgJrql/mb1/8TWU2pD2MpdFUMjID3zhShYna2JeM4Tp/doHv1ty7Fi3Y27rgBRJNl/5GkTqksosPp+4QC+3pRy2l7ryZcP8Est3PmdeuRJyZHjsB9MfuAZiR/9P4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTCQoSlebS3ih9Nqrhz8RxNfdBTIktSzQD4WV0i9Rlg=;
 b=PSxVJ5PqY9Bq69VcHE9Sl0+3j9NTfEV56p6ul6N7CFKP4hOtswTa6w9WKyIdosGqwK/EkkcwgFHxWDu660rTlUNONr6osKIwlzTY8c4T6hcANTT7c2ZVhORNC06DzcONdXWH2MxoFY88oaqiic+S8PxyAtyo4kFrLTM/MGEsHliQ9w4+iKUbmQuyI/TIzfwWzfFqmj6ErxyON/miuiGbq11BVcBHoL9+WqRJJfU5Vd+zB3gFNcatkxznsnKlEX36mI/8RNi+Zc2fW1Z/eeb5zWCf76YtM5c/n+KM+dRBzLvzQxIowYVIFAfSEidOPXF62AGldqW4DcFasXU4lFXemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTCQoSlebS3ih9Nqrhz8RxNfdBTIktSzQD4WV0i9Rlg=;
 b=Yt8/zc45XW/ZJq7jWTtCo0nIBneeoYwgIJP0d65H/hyi3uIokyAOG8eUTdYb322ZIBmQxKcWsbb4OZ/Wau6Jwfn79/w46VneThh09KmJFWGDSPSORc+T1mfLHLzwS3uOJUkKDPzedAqFeayXmdrax7eruojlSgCyzUdt4hTrRz4=
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 (2603:10b6:803:51::12) by SN6PR02MB5293.namprd02.prod.outlook.com
 (2603:10b6:805:6a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 08:27:54 +0000
Received: from SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::75c4:4714:723b:28ce]) by SN4PR0201MB3486.namprd02.prod.outlook.com
 ([fe80::75c4:4714:723b:28ce%3]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 08:27:54 +0000
From:   Raviteja Narayanam <rna@xilinx.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>, Srinivas Goud <sgoud@xilinx.com>
Subject: RE: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Thread-Topic: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Thread-Index: AQHWQZR25/MIEeDZnk+rxvX2lvEMMajqhKAAgARDa4CAAMwAgIAAp0iAgA052KCAQqfDAIAHNrfQ
Date:   Mon, 24 Aug 2020 08:27:54 +0000
Message-ID: <SN4PR0201MB3486CDCD30F78416D3325D2BCA560@SN4PR0201MB3486.namprd02.prod.outlook.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-2-marex@denx.de>
 <MWHPR0201MB3484A9A018788EA755645D2DCA930@MWHPR0201MB3484.namprd02.prod.outlook.com>
 <9897de5e-0539-8125-7b3f-41a1c98468ae@denx.de>
 <SN4PR0201MB348615BCD7E2C82DF7919303CA6E0@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <7cc8420d-c3a4-079b-42fc-90ac6e875d37@denx.de>
 <SN4PR0201MB3486E5229B0E870E6336A969CA670@SN4PR0201MB3486.namprd02.prod.outlook.com>
 <a15a3e60-4738-3d38-fefb-c550dd0b0364@denx.de>
In-Reply-To: <a15a3e60-4738-3d38-fefb-c550dd0b0364@denx.de>
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
x-ms-office365-filtering-correlation-id: c6ff0183-4ce7-474a-dcbf-08d848079947
x-ms-traffictypediagnostic: SN6PR02MB5293:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB5293C8436791A97FCD6903D8CA560@SN6PR02MB5293.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OLMq2Id/Cjww3gPR8D9syEAStMSvvhlHG/ecwbzU9SPC1GCKLinv9upMNy2IJDxQ8ZdhTcRe+GX9Y7oakyqf/b52KrbNzisSpuq/fxztxNrJpbKYNRwfut8kuhtxC6aIPryhw9QeRGcGYAoIo3jMVXQOsBdSW87lOEmjM3SNEhLaGWx6HXN81npnuhPTV3o7EJAFhHucILs1JBJzjcyC+i5+c9paRYR18h5Ona4uM0+no1uQQ3y8NKLYFDK6wYFqH/0YgwzwTrFnbgxrojIg6OTJrYEB6zhoyllPYhI7GQ7xW9qIHCHSmTim/0icWfKr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0201MB3486.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(39860400002)(346002)(376002)(6506007)(53546011)(86362001)(66446008)(66556008)(66946007)(4326008)(26005)(76116006)(66476007)(64756008)(5660300002)(2906002)(54906003)(55016002)(107886003)(186003)(71200400001)(9686003)(8936002)(8676002)(33656002)(316002)(7696005)(478600001)(110136005)(52536014)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: k7sR1iPI/L+YRuCCuxtpHsa8PXBwLUIbYLH9Fql4hIAASbnvJj6Pwsw//iGD+zk4qtScvsICOsqaDA5YOdW0E+XKqoHl+zSNS4a0vhKl7E8Y7gZezI22BdyJkwvkgNVnEz3sbOTEtKMoYIynLVckz+86RlohFdxSNFzgsA5PndubECHG5CUZx58fiiDyZuMa9URX3UHkKcyV0hKuQqPatnToIXBOikTZ5WleKAaMjOdkIjpjPSiGHlL22rXywvb3Mb66ppP28woimCbIzyKP5HJWST9l4FR1XSvJSKGVZdmbDqVSuCJ/j7NU6lc/cwmst/4OalmeSFwKHIBDAxmbKC5E9EcFzWIw792b9a0ElEkxrU/edvVJM/JFH7rwK8U1Au3IdQOrJ1ic5iX/+qL0eIqliptynqiR3NJ90CLEca7zekmi/RttxVZMmiHDQ5ZHQtgjSfiMBLaXzEkryfcFlCog7aDt76b7W/03iCbiXHz2gjVVqmc05zH8igxFCYMuS6IyUj8T+1RKFF8SLAgKeDmh2WiBjPMn75V1rtSODQw/X62AF5NRHG0XEsE20oFRn5xwsbNDA9TWfrz8TlL/v+Dyvt9KOIeXDaw7ThKCLbBpfIavrrAlj0fnpbaD2TE0aqs/Vqr687rRdXQC/+JpKw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB3486.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ff0183-4ce7-474a-dcbf-08d848079947
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 08:27:54.5200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MoDcXSX6UCqo6+KBBbPTLTNPx9fji1yjaXwmkh74nFwDIhcDXzOq3fzja3AiTmHI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5293
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDE5LCAyMDIwIDExOjEyIFBN
DQo+IFRvOiBSYXZpdGVqYSBOYXJheWFuYW0gPHJuYUB4aWxpbnguY29tPjsgbGludXgtaTJjQHZn
ZXIua2VybmVsLm9yZw0KPiBDYzogTWljaGFsIFNpbWVrIDxtaWNoYWxzQHhpbGlueC5jb20+OyBT
aHViaHJhanlvdGkgRGF0dGENCj4gPHNodWJocmFqQHhpbGlueC5jb20+OyBXb2xmcmFtIFNhbmcg
PHdzYUBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNV0gaTJjOiB4aWljOiBE
cm9wIGJyb2tlbiBpbnRlcnJ1cHQgaGFuZGxlcg0KPiANCj4gT24gNy84LzIwIDU6MjMgUE0sIFJh
dml0ZWphIE5hcmF5YW5hbSB3cm90ZToNCj4gPiBIaSBNYXJlaywNCj4gDQo+IEhpLA0KPiANCj4g
Wy4uLl0NCj4gDQo+ID4+PiBTbywgdGhpcyBsb2NhbF9pcnFfc2F2ZSgpL2xvY2FsX2lycV9yZXN0
b3JlKCkgaXMgbm90IHJlbGF0ZWQgdG8NCj4gPj4+IGV4Y2x1c2l2ZSBhY2Nlc3MgaW4gdGhlIGRy
aXZlciAoeGlpY19wcm9jZXNzIHZzIHhpaWNfc3RhcnQpLCBidXQgdG8NCj4gPj4+IHN1cHBseSB0
aGUNCj4gPj4gYnl0ZSBjb3VudCB0byBjb250cm9sbGVyIGJlZm9yZSBpdCBjb21wbGV0ZXMgdHJh
bnNtaXR0aW5nIFNUQVJUIGFuZA0KPiA+PiBzbGF2ZSBhZGRyZXNzLg0KPiA+Pg0KPiA+PiBCdXQg
dGhlbiBzaG91bGRuJ3QgdGhlIFhJSUMgSVAgYmUgZml4ZWQgLyBleHRlbmRlZCB3aXRoIHN1cHBv
cnQgZm9yDQo+ID4+IHN1Y2ggYW4gYXRvbWljIHVwZGF0ZSBpbnN0ZWFkID8NCj4gPg0KPiA+IEkg
aGF2ZSBzdGFydGVkIGNvbW11bmljYXRpbmcgd2l0aCB0aGUgaGFyZHdhcmUgdGVhbSBvbiB3aHkg
dGhlIElQDQo+IGJlaGF2aW9yIGlzIGxpa2UgdGhpcy4NCj4gDQo+IEFueSBuZXdzIGZyb20gdGhl
IGhhcmR3YXJlIHRlYW0gPw0KDQoiIFRoZSBleHBlY3RhdGlvbiBmcm9tIHRoZSBJUCBpcyB1biBp
bnRlcnJ1cHRlZCByZWFkIGkuZSB0aGUgcmVhZCBjb21tYW5kIHNob3VsZCBiZSB1biBpbnRlcnJ1
cHRlZCBhbmQgbWF4IGRlbGF5IGV4cGVjdGVkIGlzIG5vdCBtb3JlIHRoYW4gMzUtNDAgdXMgcHJv
dmlkZWQgSUlDIGZyZXF1ZW5jeSBpcyAxMDAgS2h6LiBQbGVhc2UgY2hlY2sgaWYgd2UgY2FuIG1h
bmFnZSB0aGlzIGluIFNvZnR3YXJlLiBJZiBkZWxheSBpcyBub3QgbWFuYWdlZCBlbmFibGUgaWlj
IGNvbnRyb2wgb25seSBhZnRlciBzdG9wIHJlbGF0ZWQgZGF0YSBpcyByZWNlaXZlZCINClRoYXQg
d2FzIHRoZSByZXNwb25zZSBhcyBpcy4gDQpUaGUgd29ya2Fyb3VuZCBzdWdnZXN0ZWQgYWJvdmUg
aXMgdG8gZW5hYmxlIHRoZSBBWEkgSTJDIG9ubHkgYWZ0ZXIgc2Vjb25kIHJlZ2lzdGVyIHdyaXRl
KFNUT1AgYml0IGluZm8gd2l0aCByZWFkIGNvdW50KSBpcyBjb21wbGV0ZWQuIFRoaXMgaXMgbm90
IGdlbmVyaWMsIHNvIHdlIGNvdWxkbid0IG1vdmUgZm9yd2FyZC4NCk91ciB0eXBpY2FsIGFwcGxp
Y2F0aW9uIHNjZW5hcmlvIGlzIGxpa2UgdGhpcyAiU1RBUlQgV1JJVEUsIFJFUEVBVEVEIFNUQVJU
IFJFQUQsIFNUT1AiLiBTbywgd2UgbXVzdCBlbmFibGUgQVhJIEkyQyBiZWZvcmUgcmVhZCBjb3Vu
dCBpcyBzZW50Lg0KDQo+IA0KPiBbLi4uXQ0K
