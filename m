Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B3F10FC3A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2019 12:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfLCLMC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Dec 2019 06:12:02 -0500
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:18205
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725838AbfLCLMC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Dec 2019 06:12:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CL9XRPnXdrBMietaZfDR/nAAg7Y8XKp5sMeDPmq60ryeDoH6nJHHEXMPbDXnO3xkh8NBoEaGVAQGUeCWHt7VczwihhudItJoW1Y+W2pYaJqTegAvJeRuoSnkNeZBrCgutWl+8vE7grfiU+E/s8Z5DzM5W8PY4/LIOPQkjY1CRPnntf0MBGMlUBA0aY/f78DCxV2sgvWU6pz2oXjzpDhC1YqGnRs5l9b/V0egr3zuSWMPSG7TWZwbXcjnbuSrSO/ZbuKBPD+dBKZ9Ez32orgBWMJvYGPY3pmUJbZchqEpxDnjO3XFLJXCiuOt8wZVDKFSgPL/uapVdIDn+aH1BpPlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJ7qwtDvIqSZv9u1Hhvcud5fBSfqRjp+An9nAV2Y3YQ=;
 b=O140DnWxiC9f3pip+IDGdAP4RxA8KRwpRDN51PSbFwmAM3Q9uFmvIKqP5mBJknUfdUdni8RAipzcH1B4VszBZgan+eja3SBH/fwky56aOYAm6zo4a4OGoI/uLUrmetGtC7XvJ+ABxbYMVi6yIGhWf4HgNjKeNxAbtqxVFJxTvWSISxNIu9mr/6zR7oxa/UjqoI1a+zJjEMJQPd7a8NtvmOzUjmXl1GwD7tfBRu7Rqx7Ps67tqZXEZTS8XiGAzQcr98xy0X6nZFtY4PGOZUm5Q5wpvljWXuYWsLP938vSuxAVsTfYdn+yZ/m+qCCP7/Y+4dyilKjD+Rx5mTTOiufpPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJ7qwtDvIqSZv9u1Hhvcud5fBSfqRjp+An9nAV2Y3YQ=;
 b=kKEnSUAmW6qrclsjmAoTjY5GFml8oEjBwFA5+OHIWmspv4QI6uZCjHOtbQFIUCpJgULfxhXG5n/cfKDtrRXt5E+KF4HU65YitbjPttwH2TLIHeS7a7fXt3iZG4M2gyZlS1oMSV6ui0pLnAGCcgsqSFa1DhfGUy16u24/ZY5RVWY=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB3979.eurprd04.prod.outlook.com (52.134.107.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Tue, 3 Dec 2019 11:11:58 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4182:4692:ffbd:43a0%6]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 11:11:57 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "peda@axentia.se" <peda@axentia.se>, Leo Li <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [v6,1/3] dt-bindings: i2c: support property idle-state
Thread-Topic: [EXT] Re: [v6,1/3] dt-bindings: i2c: support property idle-state
Thread-Index: AQHVppaRicWJy7UzukKbBemDeMZ+taenf6oAgADIACA=
Date:   Tue, 3 Dec 2019 11:11:57 +0000
Message-ID: <DB7PR04MB4490BD480231CD8EA46C01C08F420@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20191129092222.2706-1-biwen.li@nxp.com>
 <20191202231544.GA19159@bogus>
In-Reply-To: <20191202231544.GA19159@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7fad6be9-bfd0-49e5-835d-08d777e19ce3
x-ms-traffictypediagnostic: DB7PR04MB3979:|DB7PR04MB3979:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB3979744693FA89B3F7755B018F420@DB7PR04MB3979.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(199004)(189003)(14454004)(81156014)(81166006)(305945005)(7736002)(478600001)(71190400001)(71200400001)(64756008)(66556008)(66446008)(9686003)(52536014)(74316002)(66476007)(66946007)(99286004)(316002)(54906003)(8676002)(86362001)(6916009)(8936002)(229853002)(25786009)(6506007)(55016002)(44832011)(2906002)(256004)(14444005)(186003)(6116002)(3846002)(26005)(102836004)(11346002)(446003)(33656002)(76116006)(6436002)(76176011)(7696005)(4744005)(4326008)(6246003)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB3979;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3wEmjkjuxFCuF35i2M9b/DEEZYRlRzgQ0llSVyitwY1oyqW0+tbvq4/Kr5VEFmcNcfaF2doLFseI3yxvayXjgKhgLmwLZS8Nk6LLhIe0p+bfbPoWmNzqq4PxspLcSprzyJ8Eradf7+m98ntehcBLul8zzJ9kiwZ1tW0vzG/Wd2t7DFFra7sB6tJQPGMoVj6pn7xgXvoYsAaNMDp3fS0s5OJ//VPtCgc8Ue6oZiArdPzNf08bvEL0qvhpmuSsiTDQJPfHWOgJGDjqwWcquZvFpjs5fvN6fBpGeVvL/OppbKQgMwngWylOcCqg52YeB5LV72wnByLE/9bAO8KW9QK3Py3tuiqSCRmHD6aesN+wRFtb4UeWz1qRlk5GagaAUMXYdWx42vlYVgRJ8hxKYcqinmMfTbcLnp5at8eS1PAcNB94Xieb4iRg75i0t4y/DH73
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fad6be9-bfd0-49e5-835d-08d777e19ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 11:11:57.8298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+fyrdodse+a31LU+cFIA8N+l/cN+vn7CX2+Y9OvMDRdJwe1D7JEHJl/K1V96zDLxFrVABmIE+iR4riFg5BVVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB3979
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>=20
> Caution: EXT Email
>=20
> On Fri, 29 Nov 2019 17:22:20 +0800, Biwen Li wrote:
> > This supports property idle-state
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> > Change in v6:
> >       - none
> >
> > Change in v5:
> >       - none
> >
> > Change in v4:
> >       - none
> >
> > Change in v3:
> >       - update subject and description
> >       - add some information for property idle-state
> >
> > Change in v2:
> >       - update subject and description
> >       - add property idle-state
> >
> >  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>=20
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>=20
> If a tag was not added on purpose, please state why and what changed.
Okay, got it, thanks.
