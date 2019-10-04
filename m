Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2EE5CB76C
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2019 11:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388035AbfJDJf0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Oct 2019 05:35:26 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:11908 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387406AbfJDJf0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Oct 2019 05:35:26 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Claudiu.Beznea@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="Claudiu.Beznea@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Claudiu.Beznea@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: XujeguZpQ9O+NFnXuWK01CkQERaDBBA7PA8l8WAbj2iJdOgQfsymKZZBtIT1ekXmgyGOwL2e5l
 9hS6fnS4iSARvNd9d0UIFmBQee26BlvP6u+Oz8vLOUekhknMPagjSWmLKpMsS7txgBpffQMM4i
 X6MfH/zSLQgVr7Hqp5s0M9F28kpuu9dXJzOKSOZvCY3tSJAhacKIbzeqvFQrD8Q+PvT7Etp3dg
 /zK8Z62KWqXCtrMZPRHpcaq6jv3TXJnPq9PG8jh0vrfaundcIenx9i0rp2zHz6Elv3ZnTmhyk/
 o2w=
X-IronPort-AV: E=Sophos;i="5.67,255,1566889200"; 
   d="scan'208";a="50422574"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2019 02:35:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 4 Oct 2019 02:35:25 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 4 Oct 2019 02:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1Ye+tWIFraYGxv6F00f50TLGYhMrHUrq7F24LsICcULqGeaST8o3fh+fK0hp/iUMuHhVxjk4AU2mjQypyZsSzjHaSmHZ++rQWJRZy5bGF7n6UEGLhHn9c7QMn4aYq9B9VBd+kJbkyzFRDFVJcRYZUoIMxv7NGMzlv4yAIJfCTBhW8hbgEi04kbD9dQb7OBGlUtkS5vAAcath5QZGxeUbUAqN2iBarmGlK8OtmLmrPFyn6FDyz1sNJxRIeYVppcBsqs+R1RRhDbeQhgTBDDGopEfwTVHrgvS3OnpFFFuXYXLAKR+v4WX/2iCpO8hiFQO4BONOcRMlrPSSX2GKxa0GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPkzr26ZpInh9j1jFrMZOePRQr13QBZZg3LZ+KsrGDM=;
 b=LECowKkGb+bBx1lGAUgWpGLRoBHT9cDvrlS63TVwHpjX7A5lXyrabT9vgZyC8qrlkJerQLoEMKBTTHxGopvQEqAx8pmYfKZjwHDrd8fawMCqyTfisYEiYagGk/aCS3ry9Zs3FortvjTVqPgqvNdMppmcYTLihb0f22ca4NH5vesai/GblEOWRujADun4WkFdP14uRtnOnsYjwnpp74Yg49sFh8GgIvyfnm3SiQA4DqLw3VkznXD1zutCyMnIjAWFQ73vOWDa3QJuaiqW/PXWpBXkvut30LkzKPirTvNiHb6Pf5xcaRrolPqGyvrxFTe+FlUZ/WRNqe8R2Z0hQdfHSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPkzr26ZpInh9j1jFrMZOePRQr13QBZZg3LZ+KsrGDM=;
 b=ubRs3W/+fAUdm0uTERZVRIAxU/Ce7dRNxwz/yasSdzGpLvUzaCdaVdQ+qOpte8LbJ43fSYWIkNUR6SSIIBEU3hCSkyeWFs2A2hML0H+AlbdsSxUKBX7fBkZTSAxZDfG7g2q6bpf1MeJ0Tb+byVDgE9m/l2VvsT66pVt9dkKLOUg=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.85) by
 DM6PR11MB2620.namprd11.prod.outlook.com (20.176.100.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 09:35:23 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::3874:9f3c:5325:d22%6]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 09:35:23 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <devicetree@vger.kernel.org>, <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Thread-Topic: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Thread-Index: AQHVepcLzh2wL57HtEiaALvY7CXMrw==
Date:   Fri, 4 Oct 2019 09:35:23 +0000
Message-ID: <08e99a4b-851e-0bee-4c5a-8578b42c283e@microchip.com>
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
 <20191002144658.7718-3-kamel.bouhara@bootlin.com>
In-Reply-To: <20191002144658.7718-3-kamel.bouhara@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0501CA0013.eurprd05.prod.outlook.com
 (2603:10a6:800:92::23) To DM6PR11MB3225.namprd11.prod.outlook.com
 (2603:10b6:5:59::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191004123512807
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4553a4f-7225-4614-75ef-08d748ae2df2
x-ms-traffictypediagnostic: DM6PR11MB2620:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB2620647DE719C966D61F84D8879E0@DM6PR11MB2620.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:207;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(366004)(376002)(396003)(136003)(199004)(189003)(6512007)(14454004)(2906002)(66066001)(229853002)(6486002)(5660300002)(6436002)(86362001)(486006)(478600001)(256004)(4326008)(476003)(71190400001)(31696002)(11346002)(6246003)(71200400001)(25786009)(54906003)(2501003)(66476007)(64756008)(3846002)(316002)(66946007)(66556008)(66446008)(386003)(53546011)(26005)(36756003)(6506007)(2616005)(110136005)(4744005)(102836004)(7736002)(8676002)(186003)(305945005)(81166006)(81156014)(2201001)(8936002)(6116002)(52116002)(31686004)(76176011)(99286004)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB2620;H:DM6PR11MB3225.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0zvrYJPwi/oRQ8yB6iaChZelpb9WUaWfXJep+5RuVHM4cFfe6Dg50MPW/fVnBnvsf/h3u3AE4T9ZIOV2sP7fTgeMQYZhAoRlHmV3sRdoKlk0Tt1GR0vWla3seZE5VCKNlHL7lSymodafhoe1TbUAVxZ6LJ8C0FJtKfnbTRkfzC+SfiAn2t1xh+TYQrvYZ3HKJoSHM+V02FNEPrWhK80n+1/dT8THs+Xum4ry5ZTJjgwo4ZjlQtIO7jc23pmVdfpg3ecf3pW8+Z8nswu9+gUqBEYNU6jIHnxiJblN5Sb3xbU/6QLTrf8c62ByO0sFusREHwcFIW/RTaXLcWl/EPkSX/7egDdDTDJuZ4Ci8MsnzKy4oldGzTXsdQN8tRvGICFnFphQxze1ox74IOVjISmDL6wKjKVTrl6hka4jyuxcGAs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA77BC9EC8C40C4A8D647BCD8BE57710@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b4553a4f-7225-4614-75ef-08d748ae2df2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 09:35:23.1716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTutNyaGA7xUGid9FgbRgG2eMyoz9b13/cAzGzTtCmZfMNvUZawEfD6vYBEk75BcxSnE0UnN7ZwxWhJntfEaWg8ncLCx+QnOZsivOKl/s6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2620
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgS2FtZWwsDQoNCk9uIDAyLjEwLjIwMTkgMTc6NDYsIEthbWVsIEJvdWhhcmEgd3JvdGU6DQo+
ICtzdGF0aWMgaW50IGF0OTFfaW5pdF90d2lfcmVjb3ZlcnlfaW5mbyhzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2LA0KPiArCQkJCSAgICAgICBzdHJ1Y3QgYXQ5MV90d2lfZGV2ICpkZXYpDQo+
ICt7DQo+ICsJc3RydWN0IGkyY19idXNfcmVjb3ZlcnlfaW5mbyAqcmluZm8gPSAmZGV2LT5yaW5m
bzsNCj4gKw0KPiArCWRldi0+cGluY3RybCA9IGRldm1fcGluY3RybF9nZXQoJnBkZXYtPmRldik7
DQo+ICsJaWYgKCFkZXYtPnBpbmN0cmwgfHwgSVNfRVJSKGRldi0+cGluY3RybCkpIHsNCg0KWW91
IG1heSB1c2UgSVNfRVJSX09SX05VTEwoKSBoZXJlLg0KDQo+ICsJCWRldl9pbmZvKGRldi0+ZGV2
LCAiY2FuJ3QgZ2V0IHBpbmN0cmwsIGJ1cyByZWNvdmVyeSBub3Qgc3VwcG9ydGVkXG4iKTsNCj4g
KwkJcmV0dXJuIFBUUl9FUlIoZGV2LT5waW5jdHJsKTsNCj4gKwl9DQo+ICsNCg==
