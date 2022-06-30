Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7BC561970
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 13:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbiF3Lng (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 07:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233845AbiF3Lnf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 07:43:35 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2113.outbound.protection.outlook.com [40.107.114.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4BA2A71E;
        Thu, 30 Jun 2022 04:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIwV+20eWykQ0l3SSPThY/OMFduOJ9qPXyawuOY8ood/nFyAb5aYUeGIkny2QoyyevL9HmadimgwRPAAd7bwLOQeXNYwKyyb+Hlj6kcwoRf+S17NIj6fSaXOitvhgy2EBW+X8iNBkEuOoUkUq6OJB9U4zMSK95+i7Lkp41d4nTTUTwd5tGp9Qky213b9jcxd1grAvHtiyv18ANJO/dUaSGq0YFA5bc1e/3H+I5iqH0BCHuXFHkepc7I0Uuvw6SBS9PFo0envWjc0LOusRAxXLeeF5K6Rq643GenZ5zcKDAzv1QIlob0CYEvNk5GqA3OVy1lD+VNjkIko8o0kukphQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wsgc+PqHQs7GhgjwYOoyDdrRh3DsQpkQ5vDNgUj/5Oc=;
 b=RFk9OMCNDY3L1IPtR8zCBwqiIfPb1BhhIvciEMrPNxNvvmdqjPZy/4qyMaLwnvIiF68/XEWZQHDiO1tb9P5qLxwmMbPcWthEfp390xdi2r+kq9vwwlsSCITnOVhu7rOKcFI2b4mYqBzTOMHMXw5bGZmC6dcAfBHAqRp7EKK2ZGcdHJSsQOzBvVgmW9yur2bKPF04NMEWfM+Adgnud/+tYqHqwjpjMEKJDiKRfdx9Kov+ny1ZLq13K6HIq2V5ZZtQb2i6gx2ENoy/AwPUv8b/YgHL+LxvdjVIs4ARb+RNYSC1Aogpa6f4AR+f6FWiz7+/lwlJZxZ1kbVFu+RBRYblPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wsgc+PqHQs7GhgjwYOoyDdrRh3DsQpkQ5vDNgUj/5Oc=;
 b=EmgsMtr0pTTLDV4hArZ+L1M9/1AvV9nE8T1BAKDeIS3zF/Hq4qhEVrd7ROgA/P+Tr9n6RPHyJHXnT72nnWU/+wtafXSVquzVOnvTqV6bCdYXIUoglWVFqC236Y1KM4/oQbM8k3AFP3p/Dl6JdFYXJpTW3UoGlbcvyEUFlvtjwpk=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYYPR01MB7928.jpnprd01.prod.outlook.com (2603:1096:400:fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 11:43:30 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 11:43:30 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Thread-Topic: [PATCH v2 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Thread-Index: AQHYiye0D1tgmXIF4U+csHtCBQPEpq1mDI8AgAHKF1A=
Date:   Thu, 30 Jun 2022 11:43:30 +0000
Message-ID: <TYYPR01MB708630B88DBA0A18B28B023FF5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-2-phil.edworthy@renesas.com>
 <caba6daf-768b-d10a-7b1b-667f793a9f5c@linaro.org>
In-Reply-To: <caba6daf-768b-d10a-7b1b-667f793a9f5c@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afa1bd4d-0fb3-4ce6-a6d0-08da5a8dc179
x-ms-traffictypediagnostic: TYYPR01MB7928:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ecVJ3Uli+8a1QUDtpaOrrAR2F+wKIjzo6VCu/LTUb3R9gtdtmMMKZwkRquRBRub796lbKCKKG7V067KeB5us6XOUwb67xuZaHrUbLk7ac37TVHamVCO3Kkmm+jJhces/w8oboXCBze3truJlRNFuVS0kXOY8/nD5BjsIvJ9mcS0HwKnQhhst+Vd5sx3GsXCgNlEVTJwiREjyo+BNazkYCYy2PIFFE2hanXVuSDA6mSopjI6L3xLST6VgB9p/yvKOfT1+4glg6PYdUFZgwpfASZyxgXe1tmLLfAzWMLW1hfVh/JNh92kTEAwNBUxd8BN8PUjBFUu+ZSZRCIhAEFCmOUXpVI6UR/vwVyIHZgcQvcadQXlKugT8OEFbLjunpxYn2mcRZiHGsy6x2cOmcXk6X8nRbN6MDVBt1qx6C7eMC5EXeD0ADuWCS9ZjG2CwEv/p7rg6Ko6s+AiNWTbOfFXN8yuGDmHAYipH5rnshBrlGTEf7ESAG8A5fw3EVR/mw+jdnMmFI3y5td2FcPCW1CIB21EgOIfLS6WX13KKgSPRQwDrEgW6G/hocYWDYfDf4OvjjkxgkJyA+CeZ4lLNeHHwlkJgBsvxrwKkG1gaO5eQ2imljrDsFQQWrrgjCIcG4OyhrI2UfZC5FqNQ2OxAl4ew+kWaqgrB+Q5CFAaUScpzD9XSbq5RtWZvgNp75ERLzvKn7TqpkYbojCUVcHRh0xZLuwRCQMEPIQ1jq1nWc93QaS6l5sLaY9zEbLs3mQjk7Cu/OvIqTq3q/PjWeoJcnAW/74xLcnWylEKoK+MOrQAEZGtj9oSSUYDRoVTzdzno+TPu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(33656002)(86362001)(38100700002)(110136005)(316002)(38070700005)(122000001)(52536014)(8936002)(5660300002)(44832011)(4744005)(41300700001)(2906002)(64756008)(478600001)(66946007)(4326008)(54906003)(76116006)(66446008)(66556008)(66476007)(8676002)(55016003)(186003)(53546011)(6506007)(83380400001)(71200400001)(7696005)(26005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EsGfOLUS1QWsXegGs5PAyLbRKWHxypwmPyt2sooa0RPwGT2GRUK17G3JlTfk?=
 =?us-ascii?Q?UkN74rgiNrxfMkY79uLxe6wiTZSioir+/+4GDBS1eVu0xABuajDftz96AJBT?=
 =?us-ascii?Q?8kw32XefDb70ObFY/Ai1KEtlunBkclqwRmY4UIJasKNxphcey7UhwySyV9lz?=
 =?us-ascii?Q?jduh4eCCzbrY58dQ1p79WCpa5WEaA0y93VsJZKnu6HzSW/JK12T41zB/u1w+?=
 =?us-ascii?Q?OkaWgw7qMWwh0JgVTBMqHVtB0/ewLgYDT2E/0vcHkPRBZO/X8A0Obe85vyrr?=
 =?us-ascii?Q?OLhx2sDSmfFviy6ys9fQkMNhgUDvDtR04RTZJSg40Enp9yKFDelL2IxOlGSX?=
 =?us-ascii?Q?NGMGnKpeqjzwT9kqBq4lM1BJJqBO3Lo4FRYo2qIk0dfLL7pq5ahJbG54eiKB?=
 =?us-ascii?Q?Lz888Bjdo2kRyV6ZgCHuO2KXZ5cGiFNRO7zPlGYWJcq1LXwCe/vXvM8cj/rb?=
 =?us-ascii?Q?iwcjlNLk215I2DngWl5l2vvFujSHuXgyxW5bIzBlAGRCfL2UKsy1R1R3AS2p?=
 =?us-ascii?Q?7OwP7ybkbuob2qLxYHveKrx+7/ohJkE6z68BMORpZOFY31wkzdS2vjqB+FCr?=
 =?us-ascii?Q?h1j4ELAlPllWyTsGgg9hFUYpReRabwtSVdmlarSU6HlgnAyP+e6q4hiuFuv9?=
 =?us-ascii?Q?Y5VFH6i+xPQSmNhXt2Kd2Q8125p+mAnK4r1eShn8r6g4xMTL/H4rjtBKBN2h?=
 =?us-ascii?Q?83fToQZLHdGIghxW9lMK0X6Tdgs5UPu+glmaLQW1RTqfH/2knIjJRm6fuJWl?=
 =?us-ascii?Q?mrAvCtIO3E0ngXZUx9/XZ97GgTWIx/EhH5T4CBHaacr7CPwQ2Cul9IIk2+pp?=
 =?us-ascii?Q?huZomw0JjtEhXYPIIZvE05jhZLT3mp6sp2uLN9qOCiUOLG3aMyhUe3Gxj1pj?=
 =?us-ascii?Q?WsUGBrG9Kz1lgNgMAoZkoN3gxgQV8xGlwaAVzQYFhftO8uD7kzkVOgboK24Z?=
 =?us-ascii?Q?LesG3W+PBz00vWNl/+tMmHf8feCHJ0HHjJgPl/cUnhwJf6sluysyTtmBFJnX?=
 =?us-ascii?Q?zPPWhwe3tP+uV9O6EG6b7FiNIKewW/eCEOcCGyhZazEfTqbeyMMb8cMi1B5I?=
 =?us-ascii?Q?8cwmIkih/4HXnRIbcKpoxWFIGxdDaf+IGCglhQZFfJLWmkjT/UpseSwRuNRQ?=
 =?us-ascii?Q?rBXK0IQJ2LhpgqpoMWCRXgeFLPhddsJH5suCjz3Xn+6nZQuk4H0LUt+LkA1H?=
 =?us-ascii?Q?2prce16oSy3nGOkOEAAYG2YaJDsZ01Z3z0Kg3rNsW3F5sJzhsKp+QjSmQjJZ?=
 =?us-ascii?Q?18KLqvb3tJWB46mIVrQ4vwZqi4xLe96mSGrEGweLaBTwj6xfLImbHxFwS5Sy?=
 =?us-ascii?Q?mtaYPAXlGZrg51MiJvH9LM+UbLMmM+9u/P3+cigu89q0uJOnlKkUpHLwbQY1?=
 =?us-ascii?Q?7pffvaIMxN790yMzcLdvtsLF4kPwLUKoe1gjK7oj+oMMbtBPM/PmAwcobxKi?=
 =?us-ascii?Q?zsFHgTbTyW4rPz1nYDqfHcuW1ti0hTqgBurCQ6S4hiSf+3m+9hyGLMsGg4YE?=
 =?us-ascii?Q?29AeSYGy8Bu26RS/LHpO9pJL4rL+B/y+cmgAD2wKLjXlNkd/r19DzVc9GDwN?=
 =?us-ascii?Q?KkjZTxuFKkElbYEGM3oy+7nbKaEh21MMThdYa1QP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa1bd4d-0fb3-4ce6-a6d0-08da5a8dc179
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 11:43:30.8585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zl5dX7FCwpaOPxNwjJSCNHfSimJYnZcw57s3ByPc8dmO4K8zbiDzLzF2E1Tl/XI6yx4tp5reiGz5BSiySeRYfuMYavid/knYCeEeLPOAIpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7928
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Krzysztof,

On 29 June 2022 09:23, Krzysztof Kozlowski wrote:
> On 28/06/2022 21:45, Phil Edworthy wrote:
> > Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2:
> >  - Use an enum and set the default for clock-frequency
> >  - Add resets property
> > ---
> >  .../bindings/i2c/renesas,rzv2m.yaml           | 80 +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
...

> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r9a09g011-cpg.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    i2c0: i2c@a4030000 {
> > +            compatible =3D "renesas,i2c-r9a09g011",
> > + "renesas,rzv2m-i2c";
>=20
> I missed that part in last version - you have some weird indentation here=
.
> Use 4 spaces for DTS example.
Will do!

Thanks
Phil
