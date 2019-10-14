Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D366D59DB
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 05:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729745AbfJNDVT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Oct 2019 23:21:19 -0400
Received: from mail-eopbgr80081.outbound.protection.outlook.com ([40.107.8.81]:41837
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729550AbfJNDVT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 13 Oct 2019 23:21:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agw2GWcuK8557c5jopFZ6Qp5QpDlLCRx9Sww1vpufW18TvNnZmsZS8iSn1p65QZGG8nb+b+rlpGMqP58pccniznSauQ4DDLeDnDgE6A89p5RL53gT93EB5KLkFf7ypwDUu5O9SRZa6mOt+UK8V9f+83nPFBgiM1TpJUNKzfRTM3mLYg97TJbOGzIAAfWljGfC8Qh0j56vN1xQx/foHdyXWoguCb2hmZo8BsNqW7hH1XYEo4g7OlzmiUwyh1AS1Ebvo+RtzcYvtkSFnFx2GXBtMFFElU/6kCe0rdGcE31okcA/ylD1z9TYM8MXOi6GrbUSXMMpZkZeIQdTcluhCvvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF+75ghiZE33cIQX1S7v7A1yRk6ExrQhY9+0eF9vCh0=;
 b=P2ux+QTXPuPrmguuJ1JNp+ll2d69He8oPeyRw/EUDcP3KbitwWi2J8hSXhlSbJV41q8gNDfM34KMdhdR6RQkzHCD/GUJ805h8WxZoqHIOgL0YXH5WW7mzN2nlunh/EGxEqKUKqrBwps3tt6Exw5GykQmE+mZZuWg3x2dcki+YTJ7mnS3FKA93zc9lw1ZRvqvUeJuZUt3VLp2sdAnEySfs8Qr86q/hD8RmOoWVENtoRSCzjNzdzDP0JAKtbGVdpnAnnkmL+tMax1c+ppzzY3eOyz1R2RYwjunuiTWy41XCb2oYxkSGnJdtOU4yd45lZsWH18YJJaoeIGYtybhb95aIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF+75ghiZE33cIQX1S7v7A1yRk6ExrQhY9+0eF9vCh0=;
 b=N+oITyUByLN4SJOSKJWXKqxBGoK2Nn6KWiParJQjAF2AuDRB32lNspRhKMN1GfSwNhP6uHE/KLdk1/RnFECE2W3l1rOdI3URJA6kQV0cMABUcVy4Oq7ZQ+Oao131nAAanbgaFPsx8t38WtwoJisa1I0fECurw71MZfOtj/embaA=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4108.eurprd04.prod.outlook.com (52.135.128.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Mon, 14 Oct 2019 03:21:15 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11%7]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 03:21:15 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "peda@axentia.se" <peda@axentia.se>, Leo Li <leoyang.li@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [v2,2/2] dt-bindings: i2c-mux-pca954x: Add optional
 property i2c-mux-never-disable
Thread-Topic: [EXT] Re: [v2,2/2] dt-bindings: i2c-mux-pca954x: Add optional
 property i2c-mux-never-disable
Thread-Index: AQHVd0AjWQ46ExUKLEmir/xZNG/rOadVlliAgAP3v4A=
Date:   Mon, 14 Oct 2019 03:21:14 +0000
Message-ID: <DB7PR04MB44908DE0F57E985ED40C401A8F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190930032503.44425-1-biwen.li@nxp.com>
 <20190930032503.44425-2-biwen.li@nxp.com> <20191011144445.GA2340@bogus>
In-Reply-To: <20191011144445.GA2340@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b2439f9-7e31-4862-d480-08d75055921e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7PR04MB4108:|DB7PR04MB4108:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB41080FBF3DFC691C34FD64698F900@DB7PR04MB4108.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(199004)(37524003)(189003)(66946007)(76116006)(25786009)(186003)(102836004)(66476007)(99286004)(446003)(11346002)(66446008)(66556008)(26005)(6506007)(7696005)(14444005)(64756008)(71200400001)(71190400001)(14454004)(476003)(478600001)(44832011)(486006)(256004)(6116002)(3846002)(76176011)(74316002)(7736002)(305945005)(6916009)(86362001)(316002)(54906003)(8676002)(229853002)(4326008)(2906002)(55016002)(8936002)(81156014)(81166006)(9686003)(6246003)(6436002)(52536014)(66066001)(33656002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4108;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZaAH11DW50GlDgS7olgEr80XOeP3WpKHEEUqWUmpiBfi6BlIIMDLdaScS7mmuqTeSEe31+mNDySL8Qa6b2B3OUZtjwD1Fxv8Kvv6/A2ySaD7gEoJPaN/g/4gIxvKAiN9jnn09ZNXDmKQKgfBGE1HE0jjme4/pKyb9fg25B1qVCbOylEtX0pjzG59qeM3esB2TaHcNJq5wr1x9PV2N1/9a10X2GkcnLA/rEY3S5aIJv+mtMKsVgoSf7iglRvGFw8RL2L9WOx9ufeHtuFnlpjlwtdGIfLduybj1O2tVGjuvmz3V3tghMLJXTubjjmY82x2YoSnao6RiUIOGsFl8HGO8kSLh7e7HSAAlk4o1AAGMfCmYm9wbqsrU7wEWL2OdTzcklR8Q1s38bR0Y5aW5Jddc6ezEa7x4ENiyTPOnfJiTrM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2439f9-7e31-4862-d480-08d75055921e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 03:21:14.9411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1wEH8eFzJr2cKwYOcEzUQ7RxtJ09bLwf+7/ImemFEJq8JjCSu7B1tM8Bi8ksqeUD53iI7mvwecUvnDfAR/OrDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4108
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>=20
> On Mon, Sep 30, 2019 at 11:25:03AM +0800, Biwen Li wrote:
> > The patch adds an optional property i2c-mux-never-disable
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> > Change in v2:
> >       - update documentation
> >
> >  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > index 30ac6a60f041..71b73d0fdb62 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > @@ -34,6 +34,7 @@ Optional Properties:
> >      - first cell is the pin number
> >      - second cell is used to specify flags.
> >      See also
> > Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> > +  - i2c-mux-never-disable: always forces mux to be enabled.
>=20
> Either needs to have a vendor prefix or be documented as a common
> property.
>=20
> IIRC, we already have a property for mux default state which seems like t=
hat
> would cover this unless you need to leave it in different states.
Okay, you are right, thank you so much. I will try it in v3.
>=20
> Rob
