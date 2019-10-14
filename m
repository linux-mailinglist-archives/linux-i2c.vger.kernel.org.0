Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C64DBD5A1D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 06:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbfJNEQz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 00:16:55 -0400
Received: from mail-eopbgr10069.outbound.protection.outlook.com ([40.107.1.69]:63815
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725536AbfJNEQz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 00:16:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKBMbE9RAJxvXUO2A+kxg4bk0m+uZSjs2DYFqgbXiV5EReD7Pb7a0JCRDwKMxFT2k7byqBBiHRk73GUqLN8d95x6IK+3tXHSFLf9wIeAqe623uzV/bbJUgLT4BO8ewDyQQdiTIDlJdlYqjzaYLmQ+Bqf7x4wBRS3JC2n8Jjd11Wrp55ul+A8kH7qwJbV9xqaagbE5q2rX78TEKW63DEvZNAXNnV9NB/AYF10eS76bwFnrjyk/kNL9HkCmUpoziyuzUSz7bSkL1ck8ml0jiEV47LCQD9D9b3uKyzkPHoeo5sQ+DoDAB/dxWZVtbmgBL7FLzLDyTJl0GCi/6+A+7TkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9VJXxhcfIdbDSMupyNpNDJS+AbINbIGiPHsRHIrK2Q=;
 b=ImkS5tx6Qw3wrQjVT6I6N7CupJOs4meOkWuBnsv2gaQ1VPzgMycss82wPwxdEkwyoH/MuG5dCIzMsqb/TTrgFLk0I/v857DmztJlIlJrXBx73ilh/m8/qxoF4y/6GQ0JjhDpLVhF2C9wtp8DXHSb8GCCasAkDzJ9wS242RPy0whjX4x2bIEHedM8MNs3qczm0baa81fCBoZe28LPVWElbU+CIH6L1L+UI6mGTdv+aX61d1y08mjTaKIYsSnGdtT/Hl8Hh0JEcnpOt2fw8t51wBeTZTIihCfUKx7NdScU5l9gGE+gk5d6dh6UKpTVqGcDpzFBHAgXx5ctzdYtBFMVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9VJXxhcfIdbDSMupyNpNDJS+AbINbIGiPHsRHIrK2Q=;
 b=kQpMb89cfUfUyDAgGKFI9yPWhPYhqaSzYequ8GXCtxUwfg+Njq+NYMZaX8MNxntqQst9a9vAOAmh3C42Iv5upmTcZ2tUQAhlYnNhot59TH65dltYJ9uvuaAeRFwE9MuTRxcMQScUUirnjgP2d09NT1UYLqMLCuS26hyg1usA8Uk=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7SPR01MB0012.eurprd04.prod.outlook.com (52.135.141.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 04:16:51 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::7804:558a:eef9:cc11%7]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 04:16:51 +0000
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
Thread-Index: AQHVd0AjWQ46ExUKLEmir/xZNG/rOadVlliAgAP3v4CAAA1qYA==
Date:   Mon, 14 Oct 2019 04:16:51 +0000
Message-ID: <DB7PR04MB4490094F26EA412D4D9F5CF98F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190930032503.44425-1-biwen.li@nxp.com>
 <20190930032503.44425-2-biwen.li@nxp.com> <20191011144445.GA2340@bogus>
 <DB7PR04MB44908DE0F57E985ED40C401A8F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB44908DE0F57E985ED40C401A8F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36b37741-eb99-4a8c-06ec-08d7505d56b2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7SPR01MB0012:|DB7SPR01MB0012:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7SPR01MB00129A42497AD88126E648228F900@DB7SPR01MB0012.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(199004)(189003)(37524003)(76116006)(44832011)(486006)(81156014)(81166006)(8676002)(9686003)(186003)(7736002)(6436002)(8936002)(66476007)(66556008)(76176011)(64756008)(74316002)(6506007)(66446008)(66946007)(7696005)(66066001)(99286004)(476003)(11346002)(446003)(6246003)(6916009)(86362001)(229853002)(478600001)(25786009)(52536014)(4326008)(256004)(6116002)(14444005)(3846002)(71190400001)(71200400001)(33656002)(316002)(14454004)(102836004)(305945005)(55016002)(26005)(54906003)(2940100002)(5660300002)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7SPR01MB0012;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I6QDwnWVkfiRS0IWeVRtFSCSKIejGQr90wZc9X50XkiWCe3bMgF0uqKo1m+n84fb1qQSibvMDWptvThS58E6pEU9udcRWbHCH0ger2jgpwv6oxPQuxiIm8Eo3S+MfcR/FqtYS431IsmfFbIDx5xF2o7qBlYDhJXFH7L6Fv75A1aqClP0tZrsBYobaTGA535h2Xfn3DXY/2nZimTGJA6X5I8GhCCPhq2Heo92QSFUWdTnK+kGtRi5z5dT3V8j4Gx6gyaSvW9pGSrzVKwEFKqLUvY8vkF3AB5UdzJV+3Cbq7uIyys8B1NHDJCN7yt43M49cqODHe2ODHnTn0uvJqlOffGxxMoTDsmezZaOKqpLbpUpi01R0MHrN7dKBZhMtqwgPV+otnJ6y/KFDuyzKRtx9CNtVA6nxRFZ4GZ74y6Jn60=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b37741-eb99-4a8c-06ec-08d7505d56b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 04:16:51.2303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3c8L5uvR9STkzi6tFmDCktQEfbzobXBLrEWN3T8lHEUEaWj+35oVnGlGamfOf6kySHusStutDKP/80eP/snhjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7SPR01MB0012
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>=20
> >
> > On Mon, Sep 30, 2019 at 11:25:03AM +0800, Biwen Li wrote:
> > > The patch adds an optional property i2c-mux-never-disable
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > ---
> > > Change in v2:
> > >       - update documentation
> > >
> > >  Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > > b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > > index 30ac6a60f041..71b73d0fdb62 100644
> > > --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> > > @@ -34,6 +34,7 @@ Optional Properties:
> > >      - first cell is the pin number
> > >      - second cell is used to specify flags.
> > >      See also
> > > Documentation/devicetree/bindings/interrupt-controller/interrupts.tx
> > > t
> > > +  - i2c-mux-never-disable: always forces mux to be enabled.
> >
> > Either needs to have a vendor prefix or be documented as a common
> > property.
I choose to be documented as a common property.
> >
> > IIRC, we already have a property for mux default state which seems
> > like that would cover this unless you need to leave it in different sta=
tes.
> Okay, you are right, thank you so much. I will try it in v3.
Do you mean that the property is i2c-mux-idle-disconnect in Documentation/d=
evicetree/bindings/i2c/i2c-mux-pca954x.txt?
If so, the property i2c-mux-idle-disconnect is not good for me.
Because condition of the property i2c-mux-idle-disconnect is in idle state(=
sometimes).
But I need always enable i2c multiplexer in whatever state(anytime), so I a=
dd a common property i2c-mux-never-disable.
> >
> > Rob
