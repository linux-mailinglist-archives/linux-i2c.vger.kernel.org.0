Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926FF75E9A3
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 04:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjGXCXG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jul 2023 22:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbjGXCW5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jul 2023 22:22:57 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2078.outbound.protection.outlook.com [40.107.215.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECBB102;
        Sun, 23 Jul 2023 19:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISPZDgeW4an6YrPlKgLr3ttxCu+lkoY2KbWW4Br6zLOPiToYyPUvniPY4XNJXGqdGnfKmC1CHjvPArtZBp2kE6cSf8fXHUYBKm9ArUsXGgSrZjz988/eY3mfeL8HX/MtWkciG+yUQR7QVVImrUNxM2uh6zwMBD1ziHGB9hXdjMIPF7onEg/qmHJOJnBFQxVBOwOcIQokxAz35UyBIspdRvpB4POe/BdkPc83HTT/2MgH8m8TPoq/CqykeItXgpE7sQtRLtbn/c2am1EOcFcwTRbQxbjoOpM9jAl79S5HU+G6jgyEw1fydG1Xz4Q/7DKv6ZJFGIhGe/U/yKG7Ejj2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AirAbUYV92fqby4h60i43InkRjkc6FDDwO8RxvxG/U=;
 b=MU3XGfV+1+wHrnWuXI7lNYkFbFENmSlIkXltpcPP83inhIpu33iSR7QYU6eEmsID2oL3dbLn0JwsG4wgSFI+tzlXnXnygeYZ0sCT3D22c1OHpbAFXNd4FybvOmAGAG/WnnpdDcA3lyrd5LMB7tPLFvt9pFH3/f4QNYYZX2M/L/ZayTKqwoPwScFgWRIKChDY6ewstzIYTIGyu+ZNGo02J9bonLNmtINw4vb1ffXj0NXBIPWYWSvtsbjQdzq83VZwmbUHFd8CzKK8S/zeexAXfDRrxsHzJxP3yiaC2WSktUDLWcorgVWBHx/63y+kTUD9QxzzQllk0q8a3LReEP4HGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AirAbUYV92fqby4h60i43InkRjkc6FDDwO8RxvxG/U=;
 b=YdZXY2Wa3ZTF/jqlauzJ/B1/hgNPhJdmaVC31GWgahJyDA93k8Bb9AosR1jo6M7/JW5pX/23Y9TicEAaPMtXZgNX21IQwQL8Hm4cks5+7bJVj5mer69E9rfBGCSB8ePHFkG/OJ7BLfmgQsKx85T7GWjANG9udBz9dNwL+O4QkuXa802JlwUgPW1g7li6i7Dv1mU6EtYJl4kgpAdXgc94HUvEoQKrVdYWTRJ/gFHEkZWa/o6tPWpfkbx6RmLQlv47/zTkCtrzdzToEaLVEvyoif9N2ixzAuQDlH6mYWcWfkY6AtIdR4ONLdD4bLTXCZ2PCssNGMmz0+hnkmdXJK09AQ==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by PUZPR04MB6650.apcprd04.prod.outlook.com (2603:1096:301:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 02:22:42 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 02:22:42 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Topic: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Index: AQHZdpWEijeHFPfanEysOeJB2LsOS688C0OAgIyxOOA=
Date:   Mon, 24 Jul 2023 02:22:41 +0000
Message-ID: <SG2PR04MB55438F6783F4E91D24938271A102A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
 <20230425134537.pzsplcpkrog2552r@intel.intel>
In-Reply-To: <20230425134537.pzsplcpkrog2552r@intel.intel>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|PUZPR04MB6650:EE_
x-ms-office365-filtering-correlation-id: e5321182-2bc4-427c-73f9-08db8becdba1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6iovrV3OjyGjR8mhOSDA0MCKyVVbvYbMSg9l6B1SAhpAv6obugX11/FM4Eh3qmNgJBAtBA8+4Aqtd/Zw4w9l2use9QHTcTF1N3yw6Dt5iiQlUZYchSplw+dpJqpck+j3Ea7ciT+3khDnZquw7xXiegety/iccnHHpWHMPu2WRtTdGa7dHv6kvaa839eNLyUwJaYkTAUKoCip01wJmYjQbFyLZYU631cAQnvSd63xjeuz+NqgRu4ymN3+pddiXUfaaWlJf36Lrh18UNvP5hXKlJXXiiTSOXC3Gm/0UJJ7of4lCVvvdRV72RhJswHaRwumY5gpgX64KF9mZxJObYQgyZ1S/+NgivBEkOT4InLlgpjMRCjGET3XW9BTifFXPpZMcSFOCPqADAtnUd3xqX/DDIiP87jj4MweA4xSQQOGvBjX6tU75hnjeE6C25hwg0ZbbHbldSb/WIPQ8J0J+Zc73Gbg3y+pplCERki3xwdMT1SYTGKOOi6ErCSQ0COYEF/eWYtKV6aOBrCkZuHdMgr82VG8UnUCsUnaTnuwT80wrVBs7+KYJW6oxRVAQgWJv+QCLkCHKxihtssRm7pRZz+n9a+fE8eji/uZSRsyT/cgG+uVzK0AexBx79KW0W/mSd2T
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(39850400004)(136003)(376002)(451199021)(55016003)(2906002)(71200400001)(7696005)(7416002)(33656002)(6916009)(4326008)(316002)(66446008)(76116006)(66946007)(66476007)(64756008)(66556008)(38070700005)(41300700001)(54906003)(83380400001)(66574015)(122000001)(9686003)(38100700002)(478600001)(8676002)(5660300002)(53546011)(8936002)(86362001)(52536014)(186003)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4KassxW0kRqLXM038hVnTFseTf4tj4WTzKEWCyvET+nzSUnVrS/bR5vVOJAk?=
 =?us-ascii?Q?CPPM7EEVl1wvvP3wZTX93jHzcd/HUU/HThv5PG3Fbubgkt5VBMHXQ7h1Tm5k?=
 =?us-ascii?Q?sb2PAf49ooqJPUWNtJ1wpvmR7g3GOsHn/mSONyX6LF+jQHdqZ6scl/xiRL/l?=
 =?us-ascii?Q?awxEQ7C9dmBKa9iGGKvYNEUVlx+bQbsmKI/jYHh9to9UEHiOy5sFfQqEUCeC?=
 =?us-ascii?Q?OHz/sujPQs0CQWE1LEIW1J7lw7dmRFUe1yVyTq3fHG0wFH65/Mpf2+eEs4Ka?=
 =?us-ascii?Q?kN94LBDbvwntzoVrL4MsP8HkmQ4dC2XKD37BPMof6YayTqy5JXI2478qL++l?=
 =?us-ascii?Q?bViYQmzsXDNH8hOqU1zfTQiDkf8fpAmExwzzEKC46ahzpVU8NrGimDYGC6YF?=
 =?us-ascii?Q?UXVfrxvHSVvQhmudurMNKh8qeElxOlheiw1JE+8Z66/xIJPPhvx+GyxfDsTQ?=
 =?us-ascii?Q?0gQopg2PKTc3mxIlhVyw/H3jvgB+9q6ocxaCT3R57LWqIhj3wbg7MLsPgyUD?=
 =?us-ascii?Q?iy3b+5vy+d5EO6RmwQkfA0JdjG6c4iQaUbBLeYgBmODDVYUB2+0nVw6g1if6?=
 =?us-ascii?Q?jPD4b3w8ay9zV0vPUKHlH7vm90vv9+ehQMiy6zcZg6+qpmtVEomW5RrBfjma?=
 =?us-ascii?Q?HbtVExsWEI8QJEtwsA2ZoFKuZm3nEy//6GFYHE4KCT+unNrZlmUSwUlgIT0U?=
 =?us-ascii?Q?aw1A28IpQjRc3+33vT/LwmrhfqVYOcFeZn17bNxK0BXRgTFpF7Ny0/9VdsPS?=
 =?us-ascii?Q?TgG3aq98dZWCsBRyX6roFmEn4GR6fyhQL72gf1ZLcW7Q44Q1mcvOnxGncADo?=
 =?us-ascii?Q?3w3WOofNOp8kRZ5JE6h5bjDxezB9XluvfIQFAlpzHlKLBpc8m6himJmTmJo5?=
 =?us-ascii?Q?h4c/zSAxaAuEne+Dek/mZKJQeQpEWrf4Kjf71YZ/+Sq02HC3b0t1PnBiWsio?=
 =?us-ascii?Q?49SYAUgFgByHiik5tfomqKbH4fkGrYKGwoN+lXXCjxizXhnoHHUy51mTpsOO?=
 =?us-ascii?Q?kK7+jdsTuSGut0Grd1xXO2CPVqXuURN40/RTzOCb34TrcFnc7+qa1ZqQ1KFp?=
 =?us-ascii?Q?+pCjwWNhze8QORv0PbVJimTBUF0NqiTk7r/A0knAYTmrAh+INpebvsG3E8fC?=
 =?us-ascii?Q?eOio9CTCAHdc7fg33NFdtniYp9Kro50q4lg4/AIdvaHck2JBebITccC345pf?=
 =?us-ascii?Q?T9YzCdy7RB/weTK1fpxdwD6AvLys4MsuSyKNQuheXqzjQxp9FUZ9SYRsNeHP?=
 =?us-ascii?Q?AdLV6RNLW/CEOdDftoLAQREqVesZyGN0UtJ+wARTbjF45TrySqkubuq3ui7F?=
 =?us-ascii?Q?W1HSD8e+JlVe1J3N7KObiXkW+gnkoJLgp8OLH17mkWKV8fI9I4j2L76xS6Jz?=
 =?us-ascii?Q?TT0JmBEQFNb76zvAB4UYlWK6Zimid9nI/LmFz9MEFUfcGxhx4bLzDHoIAoFT?=
 =?us-ascii?Q?8JxCcMAUGwuVLmjEv+EzaWHRkVr3GjfHItAbqfpzISL2WotdfF2qqMAo8cEe?=
 =?us-ascii?Q?RaW+JIvdI5oMjjd/dJWu0PAh4IuIFO5xCTTvEBqloH7MPLKc/TF0binQxC4R?=
 =?us-ascii?Q?SgtGqw03P9CgeY5ey8grZ2h1B0gr7xbhhqeeyz1M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5321182-2bc4-427c-73f9-08db8becdba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 02:22:41.6283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilCu31z5KU9vAHvQ4WkSG6GfYQ8n8zlfZ4hzK0pGf9/iIMAjmgn5uP7owSFCOl8ZigTbsmp7c4LHAB/M5w07BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6650
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Tuesday, April 25, 2023 9:46 PM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
> Cc: patrick@stwcx.xyz; Guenter Roeck <linux@roeck-us.net>; Jean Delvare
> <jdelvare@suse.com>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowsk=
i
> <krzysztof.kozlowski+dt@linaro.org>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
>=20
>   Security Reminder: Please be aware that this email is sent by an extern=
al
> sender.
>=20
> Hi Delphine,
>=20
> On top of Guenter's comments,
>=20
> [...]
>=20
> > +config SENSORS_LTC4286
> > +     bool "Linear Technologies LTC4286"
> > +     help
> > +       If you say yes here you get hardware monitoring support for Lin=
ear
> > +       Technology LTC4286.
>=20
> could you add a couple of words more here?
We will revise as below
       config SENSORS_LTC4286
	        bool "Analog Devices LTC4286"
            help
			  LTC4286 is an integrated solution for hot swap applications that allow=
s=20
			  a board to be safely inserted and removed from a live backplane.
			  This chip could be used to monitor voltage, current, ...etc.
              If you say yes here you get hardware monitoring support for A=
nalog
              Devices LTC4286.

>=20
> [...]
>=20
> > +static int ltc4286_probe(struct i2c_client *client,
> > +                      const struct i2c_device_id *id) {
> > +     int ret;
> > +     u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
> > +     struct device *dev =3D &client->dev;
> > +     struct pmbus_driver_info *info;
> > +     u32 rsense;
> > +
> > +     ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
> block_buffer);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to read manufacturer
> > + id\n");
>=20
> you can use dev_err_probe() here:
We will revise as below
dev_err_probe(&client->dev, err, "failed to read manufacturer id\n");

>=20
>         return dev_err_probe(&client->dev, err, "failed to read manufactu=
rer
> id\n");
>=20
> > +             return ret;
> > +     }
> > +
> > +     /* Refer to ltc4286 datasheet page 20
> > +      * the default manufacturer id is LTC
> > +      */
> > +     if (ret !=3D LTC4286_MFR_ID_SIZE ||
> > +         strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
> > +             dev_err(&client->dev, "unsupported manufacturer id\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
> block_buffer);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "failed to read manufacturer
> model\n");
> > +             return ret;
> > +     }
>=20
> Is this read really needed?
We use this to check manufacturer model.
And we will add comparison here.
for (mid =3D ltc4286_id; mid->name[0]; mid++) {
if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
	break;
}=20

>=20
> Andi
>=20
> [...]
