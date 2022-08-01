Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFDB8586555
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Aug 2022 08:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbiHAGsB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Aug 2022 02:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234168AbiHAGro (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Aug 2022 02:47:44 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D2C2F0;
        Sun, 31 Jul 2022 23:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2tC/pcF89p1JXNqkEg9fcy4H/MKoP1OGMSpkLVdAPCNaODt39M/NDyMZKpfDsIzoWsij7Jbe8LvPEBtbglM91m5KZjlBVB0sxThLkAc90V6061x3EnY/Y7U+teJpJk6Eb21u3Ryiov49XManqlFhK1Y1AUDv9tro1n7VEWDxUUA+lOeKiXH9X6xjjSyHP7SrdnXQDiaUrwaCPqEFKYgeqnhrrBpB1J4lMirS8sP/jPK+KBxLgIAxA+iJ2GXCaR8YrA0rhJIvqPYIcOWtnc0MzXLDpLSQZs3hkbtOL7O3+TzzZHViGH3CV3lGeQ6d+uhXOgMSJIIWbdjJjvnq3/61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elIFEItIBmU2krBl++PDGS2GBlLgksq1oD99aNOKPjg=;
 b=cA0KUJnA9EwrVWY+dvMBmbANfyViX41pEdYpevIA1IRHaap+QI22XF6k4hME4s7T6Wgt8PGXxEDtnGlBrZhiDxuIJyeeBLoxGTeVInJSY8t6eLFUQS5UiE1zbfjPS0dTP+f1g9WN/TdwNeAa2rQYB15lJnb4axc0l+ETZnHPLlcTSf+/FJFPvF61JWKzB+5ubJTGDq01ARS7XkgZUhPOOOlsVRot5BcZhnMRMsYXbvApKGQKK66gBtW0Lphk3Tv9uuMoKoN70nl5YKnEYZe8R/1ywiFHhqcIWpHcHw+T148LYGpNGX89u4ogPfwci/7ajQ4cLNRfzCcQkpqPhrbTSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elIFEItIBmU2krBl++PDGS2GBlLgksq1oD99aNOKPjg=;
 b=jRapAlkQzmgq5Cik853/ENspuEEcuF5IDAvbYxib3oAByOcz00hT5bDzRpC17PceWvoaTG9+oVwVBjiRyaTggn+ZT96rDfTP20Pgy2POalUHj15bT7ZYiZW38TFrjc4aA4IJkRMcu/CaiyH7mO9tlcT/WX87pjVleQEp54x9gzU=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYWPR01MB10050.jpnprd01.prod.outlook.com (2603:1096:400:1e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Mon, 1 Aug
 2022 06:46:30 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 06:46:30 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Topic: [PATCH v4 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Index: AQHYkrIekRAyYe1iI0Gxw58L1NF9oq2KpNIAgA8Z4aA=
Date:   Mon, 1 Aug 2022 06:46:30 +0000
Message-ID: <TYYPR01MB708624E928ED88663EB847C8F59A9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220708100350.12523-1-phil.edworthy@renesas.com>
 <20220708100350.12523-3-phil.edworthy@renesas.com> <YtrLMr0UeSSKxTFP@shikoro>
In-Reply-To: <YtrLMr0UeSSKxTFP@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 713e6b7d-a73c-4b88-0609-08da7389910e
x-ms-traffictypediagnostic: TYWPR01MB10050:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mX8yUv+9t910Ilz3xBv5k/uLd3VnwzCm+ayjO6jSn94zDI7L1DmXIvF2J1XmdvX6l4i5aWQ09l431Z/7d/ocmzt5020Vebv1j6PL3iN/jWDzt25mzt4CEouYOthOiXU6ag6fcACYtJsBMIBa8ugffG0QaGNA8chMbfWgd2N62MkKp7IjkrveCZs9ftOFex1nYL15eBG7Y1r0FnR/zxAW+WTkpWjC082w/LEDoS1fYFJr3voJ5YjAoYw0RhRoGbIRnKIE1crVS9rwiFAJf2/f2UMmkQX6q1N0DRsJC1eBa/6TlB+4rn/kdvycqcXV7z/CJHP6iS+HF7ZbWuvAb9r/MkRC+sUZUHJ5oSB7wXxfm7L2I72k6Lm/SmTJX80UT/L69O++/7KtbbPqVlK6E1ZkIqBXVMLsTh4vkp6QTK4riqg9NIaTxXerwegdHbRyNH3O8JjNNhDAmpQMSTP9IqhzfT3H/GmjV0PfjFWqGYjEw4HHlsH48fcc5mHuxplgXHExGspWjNnvvCW/JUBtmlJneWTdl/ExajzYjA7iEZVzc7CV0vF1Yc0UqyK36zaaDZZztLivRHXhuiY18dC73cSmyCZ+5NpXzXPrP6+R2TAiA3wUg6ItVZqmyeLK5JuaVTLYgumZUV/+Hhdv/73ALcKURGWFgwraI5dyhGiQoRvLNwI/ml0J3F5Px837qIE0Z9i1H44Nu/0EAcwUTdCjxpqL+oVWOmVXJ8I5Rww8gJIR/wrkrKOUfYceoBSQEXbwg3VhPjLgA6bfsKqgXVrCNZYffnItNIODTALL6PfNgBYa/b+ZdJFlpw4FlGvWfl75GQ2F
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(9686003)(7696005)(26005)(6506007)(38070700005)(186003)(86362001)(122000001)(38100700002)(44832011)(8936002)(52536014)(4744005)(5660300002)(7416002)(8676002)(4326008)(55016003)(2906002)(71200400001)(66446008)(41300700001)(478600001)(76116006)(66946007)(66556008)(66476007)(64756008)(54906003)(6916009)(316002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dJpHDqLtDuEi/y52OW5hNkKZtU2l5TVSWBwawRhPJQfbRYlOiykpmg2Hf/t3?=
 =?us-ascii?Q?IuRRQWAy+Axhua+/bJisbWL89FDWYfETdoxY+joh6Elx57zCXNs+ThDW1/Sf?=
 =?us-ascii?Q?ab9vOVBSVI8/JIyPWbItI5wFk4b6+RUBw77/g21Q7UulHi5H/nJ5QSERnVAe?=
 =?us-ascii?Q?fFx0wXI/UzdOA/VJ7W59QstooNJz92uBriIXsoRONcDlkHAy6wAuxL/LpJ6P?=
 =?us-ascii?Q?PxwbYNE/aqGo3JuKmdfDA4Lnd8ZpV9Mwq6cTb+2N6jB+LUjZYycqefhclEGB?=
 =?us-ascii?Q?udW8R2RAZQZsVs74Io3O5vepTZwfyr1RqjXIA1+jKqK+h8BQKb7djO80XB0T?=
 =?us-ascii?Q?0yTFhHKnO6zLvEwA39u2KUttpDiDbvJHJt/wy8BSmPXLWQcwWpqHovLqcOOF?=
 =?us-ascii?Q?Si/7rY6ujAYON0CGP+lBN+lMlcK0nJVg8kl8FoZhh2l87feg421ArhkNKA46?=
 =?us-ascii?Q?vPCYJvRqWwOt6NNI62DEe26ue5bq8I+t5YEGhUzpo3A3hbiRg0dnLcviW6Ze?=
 =?us-ascii?Q?qzjx1CImela402ApKJqsyxCjdSRw5SdSEUXC99qurMz1ItWUzjDpNaZVnWCx?=
 =?us-ascii?Q?plzcSKd88iF5LEHul4bB/y9wP+bneCdLqUYwGLCEInMH/GftHUL2xhOTXMFu?=
 =?us-ascii?Q?f0R7OvgN4YTtO/TThNbcCo8QHxNtYmqdvkfiiGKhQKdolvKZiMi7XkujgSO3?=
 =?us-ascii?Q?lF655oY0IMQNIpJf4ztsv5QelVAU70rM3lkvxPFbNfWsGNT+sRjPaaV8Tmxi?=
 =?us-ascii?Q?9JT7Bdpt6/vMrckIOx5JSreDUtmqXJlPZBcOXS+PbDQvbXp4RHCm8+pBHGrw?=
 =?us-ascii?Q?JUsezimbTfgHTt8N2cfKxsrqMcellRNiNBzB6E3NY0W0go2N7BbgXSvPjHjZ?=
 =?us-ascii?Q?KgeO3RvaoFzjlz86hA83W3vjxf6Rw4SQjJsa6OhjpHdDgr4c4BbJQUydr073?=
 =?us-ascii?Q?SNgj+pqyBtsq23v+L5dKloMpKU/Zodf57yYCGiHGzldaS4GWGJwHkj8bFF5m?=
 =?us-ascii?Q?Pnr0ytP1QO9972Rg+Qpz6uXI0UCrTP2jIAETI+HjyT1Jk7Yz6FuKQ29fuR0u?=
 =?us-ascii?Q?DdnPYL65ftlrhb3kftTLv063rfvonT+GMoKDV95YksNl60QEEEi6+p2ctypB?=
 =?us-ascii?Q?wVkHbAjBanCg7GJRYIl1NqGP5jVgrxQMDts6ywJqg0h6fRBrsAjexXq0mpwa?=
 =?us-ascii?Q?LtTCAJoaapLaXh6mUouKn1M31LZQvidLahJDdtbB3W1wXjGlaOggAqjSRxmE?=
 =?us-ascii?Q?X94dtmgObDJFdlK2Qf/BOLRHJLafdLQqCiUO1lbb0qkDsN3Yu/LGJZ2nPZmk?=
 =?us-ascii?Q?ik4RbUnlbClGVQ/bAPqIo8E+sbOrDn/V0qdFFVYanjaSXygz5yaCuG230P+I?=
 =?us-ascii?Q?dSgJi5mB4Boi2nA3rrcnYhBcguBYcyvNXY/UWbU6DW4V5pFEqb4Cexqii3zV?=
 =?us-ascii?Q?ajsFBqP8OU7xwb9UVtnnNS7IUUDvz/DSRrBvM2qoCzsx0u1o5aRNVTreqePD?=
 =?us-ascii?Q?oNK1NNjREA/1ZIXRGlsp2MnzUaMQEm6RN0xPISt0SBcCMI3etPko0GsSeY6d?=
 =?us-ascii?Q?MIrSWM8HW/ZuOvPCiIkjaJJpWLuuBNPGMq1wnNpVGgiOtJVPFZgOFdaKleTJ?=
 =?us-ascii?Q?qA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713e6b7d-a73c-4b88-0609-08da7389910e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 06:46:30.6589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 62URer3a3y0s1IvwQSs+qEIG/ipfG7fMdIshRn8ET9AS/T76JW+G/mCB+sY63CFHXuBo80l7udXcDeTsvP2BAOTA0O1mm7RgbXO02Rv7g8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10050
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 22 July 2022 17:07 Wolfram Sang wrote
> > Yet another i2c controller from Renesas that is found on the RZ/V2M
> > (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.
>=20
> Geez, you are right with "yet another". One wonders why the 5 others are
> not enough?
Quite...

> > +static int rzv2m_i2c_master_xfer1(struct rzv2m_i2c_priv *priv,
> > +				  struct i2c_msg *msg, int stop)
>=20
> I'd prefer "rzv2m_i2c_master_xfer_msg" for this function.s
>=20
> > +	adap->class =3D I2C_CLASS_DEPRECATED;
>=20
> You don't need to set the class to deprecated because there can't be a
> previous version which now loses this functionality and needs to inform
> userspace about it. .class can be 0 here.
Ok
=20
> Reset looks looks, good thanks!
>=20
> I can fix up these minor things when applying if you don't mind.
Thanks!

Phil
