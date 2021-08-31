Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028CD3FC5E0
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Aug 2021 13:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240967AbhHaKaf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Aug 2021 06:30:35 -0400
Received: from mail-am6eur05on2134.outbound.protection.outlook.com ([40.107.22.134]:37729
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240926AbhHaKad (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 31 Aug 2021 06:30:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrQ5hhOoqGWSmY5vR0fyTCPUUbnAhjwzXkwgXP5TDeVBsyjmv3AmCmMAs9Uf+Mo4tP8sfIMLihKPGHzlEOgOUl09uGMajI/Xy86l/XVVjkPiaJKWLAp7jjsmhGtuy7Ps2xSrEwA1NmjU/Qa0kIEpOvWgB508ZOZ3SaVnkFc9W6liTFZTWR6kq6kUL6GJZ4zAJq6xZdrQeoHAoQQr8CaElgIfx4sNYlIvlerTXhbmxRdmhi59ENU4CQH3ORdgsa5jm1BRwfLJVxrG1qqYgcC6MBUuLndE8QWJyOw1Qo5VljcGiGhf7cw3lYAjIqdR1RXKNfg7ucLMrU0EEU8tsVlOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYl4jqXEihz8y78y9NSKaYNhbupYOaKdfw4920zIS3Y=;
 b=Nk+dKKV/RMHGECrnHOKDQDrD1peq7aA0PxImkVUqpQYn/lLXDRD653dfAwbzUuxuMiwVRdQAW31Xmcj0YMNvxz/BeqZPoSkwbb5R2shGXYXpSPwZY9BKoMzjvWHTVnLNQCV6efHbrxiCKj1RgRCK/4bAiSj7QXfokRp6NWppKnDrqESYWK6Dux/4nx9wAtSP5JgA1xnW4jktJVSIt26sMFf8TmQFBE7aIEtAW/YeIUUKLIv7AjDO06CyzUfdEUdhhE53TuuNI2OuvC3m5dMjp9yq+p0Dr2rOcOhfe4sHJlUk77625jqxBGpxq+LEHEmQTuxPVvkmFRuFTk0wPLcjyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYl4jqXEihz8y78y9NSKaYNhbupYOaKdfw4920zIS3Y=;
 b=KuioptXNjZUooSS+hO+W8A6CfnmHprNcrHuXoX+TfEiRsLhH4VKN3yTUoZNhbC0gKgBEoKxwVWaLkpw2GCQI58rTtHvmGXe8m4L1UkTR1VdDn6j3lPJX+oUO+UxiguqGnuXY10GzAqPf8nZxb20lWAltnz9GHJyvaRfZALKsdjE=
Received: from AM7PR10MB3764.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14d::15)
 by AM5PR1001MB0961.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:10::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 10:29:36 +0000
Received: from AM7PR10MB3764.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::85c8:246:48a1:5eb1]) by AM7PR10MB3764.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::85c8:246:48a1:5eb1%4]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 10:29:36 +0000
From:   Michael Brunner <Michael.Brunner@kontron.com>
To:     "wsa@kernel.org" <wsa@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "sameo@linux.intel.com" <sameo@linux.intel.com>,
        "mibru@gmx.de" <mibru@gmx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ingmar Klein <Ingmar.Klein@kontron.com>
Subject: [PATCH] i2c: i2c-kempld: deprecate class based instantiation
Thread-Topic: [PATCH] i2c: i2c-kempld: deprecate class based instantiation
Thread-Index: AQHXnlMYhhdxATqY2U+tvwplY1GLWg==
Date:   Tue, 31 Aug 2021 10:29:36 +0000
Message-ID: <823bd555e13a3c62be199d4e23c352a5535aad85.camel@kontron.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=kontron.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c5f32ea-e6a3-49d4-7acb-08d96c6a3b36
x-ms-traffictypediagnostic: AM5PR1001MB0961:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB09614636E5D0C24C975EB2A8E3CC9@AM5PR1001MB0961.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cUF6+sk/rhcn2SoyjntyALz9gXVn5kaRHNM3vVS+PoPeJWW4GlLxSohGy6P12v7qmmUKz2sgb1G9gym19RZA5sixF+bwaAdl0zKgxsaA7jf4ziN8dEyB6OIz0wO3yA/3Y+ZBsLuGk3ce8Refwzwyrpx1huzKBJ7Tjust8Aa3wz7GIgP1j1jaalnDyt8j1Kp6RwZZyKpvYlWA6pdmN/OBbICjfxlShLCcr+VUauM6x8vMco+N52GndP36XS8a2DFlpdVR559uW99Kjehaj2qJugJ5vcNi7xai0kNTbFo2ju+WpB36SzPObb46gK+rk9fW/LUQyZX7+y6DfyDMMYoDYiqjHdVR7dudyfyfXK0EkoMhIJCeHOnPrqKCOhHQO/S5EXuAP5OH+kj6ayNhfdR3RLV88M6MM5FDwgGVJ+OtDf6/Hby7r41QDVSocBnLOt/KKND989nqwbHbHVKcOXOm8YjlObGQlCN3n507Rpx+iU9nuSDCh7eDX6U57PFedQE2hYEZhgl5+iT6eHSVvQ/+Vmt6pSsiNop9e6hyVfw5cBvwLv/TMGr+VilYot85H0dzgkHkUg2DAbkPhVkLze0uucYI19vjRJDal5NW4UZJ2u+LiRdU5Al1pqxGPGaB7fGihrZL+0JNOF1kgcw6RE7XHAXFy7fE3apkylTk2m4ycqTFDAqOgpPCKU9N3iiDrtpkd/NjcumcUzHXB47o+JDvwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3764.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(38100700002)(6506007)(478600001)(8676002)(54906003)(71200400001)(122000001)(8936002)(6486002)(66476007)(6916009)(6512007)(26005)(38070700005)(186003)(316002)(4326008)(66556008)(66446008)(2616005)(76116006)(5660300002)(36756003)(2906002)(86362001)(4744005)(83380400001)(66946007)(64756008)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?ZW+F/iG1L/DCH7D9MPU5ihRfjScntP2fkD94DKobEGOlCsdDby4cnzPDE?=
 =?iso-8859-15?Q?U2KncSVDhvKB3v/hcwN4tVCm6HhQIb7nAOTM6Y0Cn2QfObQjjSvQ0NAjC?=
 =?iso-8859-15?Q?OU4HwyJWWVFeHU51Yb6AmZJstkyhgMkJn4z4y6VxZRNaTN29kEvaCEJ3i?=
 =?iso-8859-15?Q?qfVrpr4A0dmAy70TB0N8rheHC6C1WVRD4cPJCDpPoRL4KVXHqRXfJbWWd?=
 =?iso-8859-15?Q?Men+wAW25FFJ4oR4Ed3HGPNvvqeaqpNFq5Wn2fQxSY0RcrJsGBFmg7Aew?=
 =?iso-8859-15?Q?jr+mpHcd949TD1UstM4Fi3jJzdFz9/0e5V9x9FDYeNQdqaJIKL77o6Jg4?=
 =?iso-8859-15?Q?dWTjZxdIE7I/TgijBSCOhNHnXV+/HZdPULFBWeyyb/g3THMOyZp2VNaiJ?=
 =?iso-8859-15?Q?iCRYc9T+ehz2XdNZI3Jll8+lIvCWcKRf6V6frfqyoVeLFpPia4hAKasrg?=
 =?iso-8859-15?Q?kCLKqQo8JSKoHI8bdf4jw+uk5b2wBb0IpbXm62JX1ywXJtJxAvApEF0KV?=
 =?iso-8859-15?Q?TVkz5T5QRbA2QNwx28u5vAfju6E++NNSj1ZJSgT6qZK6yPbt8MbjZ7Ekn?=
 =?iso-8859-15?Q?YI+FH9yL0oka12Z1oiI+Gxjvu4RkLHw6lx2cL1HeGNqrUZWGSDbagnspf?=
 =?iso-8859-15?Q?JmM12AkKxPWHvSoHuyrZWsHBFetFElnega2jcUcPD1sTJl/RZYB5IxVR2?=
 =?iso-8859-15?Q?qCQYUJtHJ+MwQ8zQdLbFbnGAaZbt+pV9ROghHB/O8KCuBSgRjPfu7pNsR?=
 =?iso-8859-15?Q?BASlOFLtSTV6r48kavbbOA6hp1Fgy6e6ripjb3dR85rBrN3/S1PAFNEbm?=
 =?iso-8859-15?Q?DssspxzxBUhxSXh09/2iaNAKq+DPIVsf3PJA886z3SknmXB3KlhUpy2BE?=
 =?iso-8859-15?Q?QLzJuhoESQc7HsPHwoh557pMvcpcHxCo29e7cRAyoDSuhsq468fm0JMxM?=
 =?iso-8859-15?Q?c8Ci8NlRzJeLGq8Ml01fulHfZk0QWDeemLs+flxQvFT4CKi0GCqaub9Ca?=
 =?iso-8859-15?Q?OxeW3FAkcgQcWiQqEYWC2b4Vt3tU9SojRLgPT1jZkBNsfaznZbGN1tWs4?=
 =?iso-8859-15?Q?2aBOQnjxuS+0tgnZaaXbZEhdBlt/2ktVpbnsYE4S63/nsDkytkz3vqxUe?=
 =?iso-8859-15?Q?NfdFHS9BZKp/5URFwcuOe5lhoPQ4+eCgSqZoxgL8FZRtGFLk01mAhnGzM?=
 =?iso-8859-15?Q?G1zWemxbwopfyoOHiKv3SX99gilrMxYDqnKjs08HXCSt7t+d9nOYY7mo7?=
 =?iso-8859-15?Q?jusMignDBDK+o19fkMD2/MKPz3Ao/aw0DATItsHeZmf6a+oGOAMqUy94Y?=
 =?iso-8859-15?Q?2L5gwYQzHyilRhzvygnMD/3F0bmW5IaA0nSLc7VEF7CzZ0TuHD7SsN4hQ?=
 =?iso-8859-15?Q?qnWeTsyXTnFb0EaBAofxfvkCHRIOwY7w4cs6QtVe10c69Q+KDD9uvmw?=
 =?iso-8859-15?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <01D311189F2E1343B7644831DAA678C1@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3764.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5f32ea-e6a3-49d4-7acb-08d96c6a3b36
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 10:29:36.4548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U9WCtK9g+v6ng0WSRzjqJwutbhIAPgqfhb9UP0eSBQuYUTWOi7Hlr9ZXYKDAKWAQatwY2rtqtg0wYCIsjAq43d1FCKQg+n+A9t3aEXKPKUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB0961
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Warn users that class based instantiation is going away soon in favour
of more robust probing and faster bootup times.

Class based instantiation has already been removed for other controllers
and it makes absolutely sense to do it for this one too.

Signed-off-by: Michael Brunner <michael.brunner@kontron.com>
Acked-by: Ingmar Klein <ingmar.klein@kontron.com>
---
 drivers/i2c/busses/i2c-kempld.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempl=
d.c
index 2d60be086b1a..5bbb7f0d7852 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -283,7 +283,8 @@ static const struct i2c_algorithm kempld_i2c_algorithm =
=3D {
 static const struct i2c_adapter kempld_i2c_adapter =3D {
 	.owner		=3D THIS_MODULE,
 	.name		=3D "i2c-kempld",
-	.class		=3D I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class		=3D I2C_CLASS_HWMON | I2C_CLASS_SPD |
+			  I2C_CLASS_DEPRECATED,
 	.algo		=3D &kempld_i2c_algorithm,
 };
=20
--=20
2.25.1

