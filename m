Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D06A0A58E9
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 16:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731191AbfIBOMU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 10:12:20 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:53765 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730937AbfIBOMT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 10:12:19 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: I8dXsyX4UjIhlgbfdmB0DVqBgp0F+cpsCgI5fi5EBHh8ofTLgm/3b8L2fFrQzNOH5KSc5wI6Zm
 Sg8fx2mgsANyaBn1wvtKlQNeIhY4GJwT4FME8w+ctoo3Evjun+CruP3iT7QKKziLxTaZ74AfJA
 oG9SYscsAK6lJoNFNSAUc3f3wgAEpfA7UGWAKNlIC6AV4c2r5j7ZmbJHs1FnIPCldwDpoLd3sK
 Gr5KjOWt6Nl06lj8N3TwnPyj9D2ZzGtLpmsLLid/7E0tpAkZUwC78di+9lnuQImCoM079mKpzD
 CTk=
X-IronPort-AV: E=Sophos;i="5.64,459,1559545200"; 
   d="scan'208";a="44583635"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2019 07:12:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Sep 2019 07:12:18 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Sep 2019 07:12:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvHuUn+/+l2K1r5KgUIQXNQ7ZTPUtKQROWbukBHpmdlhPbwr+mvRGsFDJGaiDvd9dFjnIOwGmagHNGCiEF+OXPQm6ZbFldvfGH5aOZ5noBYmva6lg8CzIirgOLuaP2476FF7HXSFVmg0WOTKtJPp6oKqZsKkiuL7TZjiPxWzKi5WJaPgfqIeeIkSoc+nbKgRbl9Y55YusmxFrbamO6txcVbYoAbu3Ch3bAQ7C6BUW9K8ZaEfhRGGoRuyKlST8tx1N1K3t5wY3ErSIpYUHeoQMTY6XcbgskZmWvekBI3obkzir7tv/41RNEGnUKhGWOYuXblTHqkKNqejW0a6TMj+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbbQ2/jrbaXjEZNlFN38KRiys6aWqYuhF5vVGyl8rTM=;
 b=EVhjLJJtBdS8TsTxFak19pnQDr5z7BmTY8OOjACigKMwU6AjogBPpt640TqNNF4kAL4zU0fquvo7C/mLZ9OKuD+QxETpZfV3C6D81PprntQe+zS7YdcuFgpb4msFH6XpQUc2BDFpaZcdghIVu4/AF5OLRUiaYiN7thohQpMhyZbvsHyZTB2JKxHiF//DTucNTQBeyGbGXOJbVX2Vs8Oc4d2i2uF+1WK41sr5d/hu2YBNsgtgYGLL+2TfPctM/A/d7yBu00N3f+VWJ7M8mIT4K6bRV7S6+f7C4cKBRMflr4SyLdQt+70ZEoOeOwcqUUrJwYUML0GCdmH2By6AZ7Zr/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbbQ2/jrbaXjEZNlFN38KRiys6aWqYuhF5vVGyl8rTM=;
 b=gyhEHSwitdna3NZCxPj/062jX6t8IM1Jq0CFrZKef/vbf7mPGOGrevH6SWVNtGnomwzxImelqbEpJttV6F7zTSUl4Boh4RFEZOshzfJHfrBFWFbsmtI6UDqYthSddBckJ4og4S+/kgPkjBVocYIFvPSxUZUBBP6R1MhcA/q0FWg=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1628.namprd11.prod.outlook.com (10.172.38.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Mon, 2 Sep 2019 14:12:12 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 14:12:12 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <peda@axentia.se>, <wsa@the-dreams.de>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: i2c: at91: add new compatible
Thread-Topic: [PATCH v4 1/9] dt-bindings: i2c: at91: add new compatible
Thread-Index: AQHVYXba4163qYuRcEGO+lSoVX2w/acYM9aAgAA4ggA=
Date:   Mon, 2 Sep 2019 14:12:12 +0000
Message-ID: <fc80aaff-fbb2-4a85-88e5-6a204cb9088f@microchip.com>
References: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
 <1567418773-2427-2-git-send-email-eugen.hristev@microchip.com>
 <47d618da-263f-199c-3cc6-35e8f8c6015d@axentia.se>
In-Reply-To: <47d618da-263f-199c-3cc6-35e8f8c6015d@axentia.se>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0701CA0066.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::28) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190902170638564
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 201de8ad-8cc1-4f14-628f-08d72faf8c68
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1628;
x-ms-traffictypediagnostic: DM5PR11MB1628:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1628C2977993D76CA1B73EFEE8BE0@DM5PR11MB1628.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(366004)(396003)(39860400002)(346002)(189003)(199004)(7416002)(14454004)(966005)(476003)(229853002)(6246003)(53546011)(6506007)(386003)(52116002)(102836004)(25786009)(2201001)(99286004)(186003)(2616005)(53936002)(446003)(110136005)(86362001)(76176011)(6512007)(6306002)(6116002)(2501003)(6486002)(2906002)(6436002)(3846002)(316002)(486006)(81166006)(66066001)(8676002)(66946007)(36756003)(11346002)(31696002)(8936002)(26005)(256004)(14444005)(478600001)(5660300002)(71190400001)(66446008)(64756008)(71200400001)(81156014)(66476007)(66556008)(7736002)(31686004)(305945005)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1628;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3XUrJY9kZ08KSpOaCcKPi5K0UkEgHO7Fj3WTWrbXUhrWA6zBW0j4c7UoC/0lzZzXL+oAYzbTIbxN1E05ucYRjVNojG09nyP4yHHHstrNaJeqbCZ0DeSuauVVo3oO1aRAco+eTE3W0QTlxv1mkDCCe/CDAqQysXEjQCkx6CgySNOjpk9GuTrDLhXWjbYdzJVS9oeQxvteLEU71hchis2RG030VjXI/gV9h5QQAi4Zx6WjMbjkdjZAXz8ulDOdWoQgWuRhQcq2pZmIwamyNjNuiaP2AvRm0dKqw4nPFZwtG6S0/FqXuKrD2GsaK9m5p0BJ7uT7lUPneDwR1MQjXQADdO42Qa0qylmVot+XAEtHIN+0Qr2l2sgeZaDkuBKUg0eI+pyEb1dlTuLLVhj9kVbhvGl7x98UL49hyl0Vq+SscVA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E633220A2F413847A9A13589734114FB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 201de8ad-8cc1-4f14-628f-08d72faf8c68
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 14:12:12.1016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eHRpT88lfHmUUXmgm2PqXviIWvifDcvqrl7n65BLsOCsBedEL1/BkuJXxzi7iy0F2nWklZ2/kBSbwFHBR+HnBdUtOcujwA68Fo9eEHg/boA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1628
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDAyLjA5LjIwMTkgMTM6NDQsIFBldGVyIFJvc2luIHdyb3RlOg0KDQo+IA0KPiBPbiAy
MDE5LTA5LTAyIDEyOjExLCBFdWdlbi5IcmlzdGV2QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBG
cm9tOiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4g
QWRkIGNvbXBhdGlibGUgZm9yIG5ldyBNaWNyb2NoaXAgU29DLCBzYW05eDYwDQo+Pg0KPj4gUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQgfCAz
ICsrLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvaTJjLWF0OTEudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9p
MmMtYXQ5MS50eHQNCj4+IGluZGV4IGI3Y2VjMTcuLjIyMTBmNDMgMTAwNjQ0DQo+PiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1hdDkxLnR4dA0KPj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtYXQ5MS50eHQNCj4+
IEBAIC0zLDcgKzMsOCBAQCBJMkMgZm9yIEF0bWVsIHBsYXRmb3Jtcw0KPj4gICBSZXF1aXJlZCBw
cm9wZXJ0aWVzIDoNCj4+ICAgLSBjb21wYXRpYmxlIDogTXVzdCBiZSAiYXRtZWwsYXQ5MXJtOTIw
MC1pMmMiLCAiYXRtZWwsYXQ5MXNhbTkyNjEtaTJjIiwNCj4+ICAgICAgICAiYXRtZWwsYXQ5MXNh
bTkyNjAtaTJjIiwgImF0bWVsLGF0OTFzYW05ZzIwLWkyYyIsICJhdG1lbCxhdDkxc2FtOWcxMC1p
MmMiLA0KPj4gLSAgICAgImF0bWVsLGF0OTFzYW05eDUtaTJjIiwgImF0bWVsLHNhbWE1ZDQtaTJj
IiBvciAiYXRtZWwsc2FtYTVkMi1pMmMiDQo+PiArICAgICAiYXRtZWwsYXQ5MXNhbTl4NS1pMmMi
LCAiYXRtZWwsc2FtYTVkNC1pMmMiLCAiYXRtZWwsc2FtYTVkMi1pMmMiIG9yDQo+PiArICAgICAi
bWljcm9jaGlwLHNhbTl4NjAtaTJjIg0KPiANCj4gSUlVQywgdGhpcyBsaXN0IHNob3VsZCBpZGVh
bGx5IGJlIHJlZm9ybWF0dGVkIHdpdGggb25lIGNvbXBhdGlibGUgcGVyIGxpbmUuDQo+IA0KPiBT
aWRlIG5vdGU7IHVuZm9ydHVuYXRlIG5hbWluZyB3aXRoIFNBTTl4NjAsIHdoZW4gdGhlcmUgaXMg
YSBwcmVleGlzdGluZyA5MjYwDQo+IGZpdHRpbmcgdGhlICJ3aWxkY2FyZCIgKEFGQUlDVCwgaXQn
cyBub3QgYSB3aWxkY2FyZCBpbiB0aGlzIGNhc2UsIGJ1dCBpdCBzdXJlDQo+IGxvb2tzIGxpa2Ug
b25lKS4NCj4gDQoNClllcywgdGhpcyBpcyBhIHNlcGFyYXRlIFNvQy4gSXQgaXMgbmFtZWQgU0FN
OVg2MCBhbmQgbm90IHJlbGF0ZWQgdG8gb2xkIA0KOTI2MA0KDQpSZWZvcm1hdHRpbmcgdGhlIGxp
c3Qgd291bGQgYmUgdXNlZnVsIHBlcmhhcHMgaW4gYSBkaWZmZXJlbnQgY29zbWV0aWMgDQpwYXRj
aCA/DQoNCj4gQ2hlZXJzLA0KPiBQZXRlcg0KPiANCj4+ICAgLSByZWc6IHBoeXNpY2FsIGJhc2Ug
YWRkcmVzcyBvZiB0aGUgY29udHJvbGxlciBhbmQgbGVuZ3RoIG9mIG1lbW9yeSBtYXBwZWQNCj4+
ICAgICAgICByZWdpb24uDQo+PiAgIC0gaW50ZXJydXB0czogaW50ZXJydXB0IG51bWJlciB0byB0
aGUgY3B1Lg0KPj4NCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0DQo+IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwNCj4gDQo+IA0K
