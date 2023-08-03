Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B21776EB39
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 15:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbjHCNwS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 09:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234353AbjHCNwQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 09:52:16 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8254128;
        Thu,  3 Aug 2023 06:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rl+SmoesPmFvSgYPg2dmZdQdR41ELobxuM4c9IMoCunnDHRd94Gr8iC8GX/OeoLMLF22aIqUXgMlrLEyRWwPeD4RDRdycsBakfSVqk0//Lbd8hQz77fmIAv5defggtMd0HqcPiYeL2S3mDDPtEww/Mi+W5Y3w9Feg2vLOx+6Lfdj9NR9ggT9bVqwswzs2qx5bi8wCwe9gCvBswnLOV21cms/xNc28ybqUFgCbYwgMTb8nkCfeC2t9yXf+Fw8iTUD03kWN0ZnnMdtan1ttZznTYgd1BJIjPf2gVRjzoCOp37Z2zD1xURSm5HMzfCQInckHAEfV7VjqLsFarEraCDeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iAcSUwh8xsOoKvl5g5IkVkxHG/bvhZs7TsCQntALtU=;
 b=MLrxy9Y3ovb4OVnhddDr/hUH5fExT1PNSyVzrlfpAqcKDgIzh02lUfEON3GpOuTzQt6PnUWFXq8jsqw1brNLx0xsmsRDidtauHd8vtG7StyQQ3Ym7SGRpTqrg6xVQLAm6jO2+wcefIcbBjpwGMjSzmnrV/4ED5yx2wbHfQZvmGRXf+pPUlXciSB3sSoFBEzBgg6Rpg3xO8XRRtUay19jlh+iIDUOZ3IeqIh65ahXa1Rk9fPrhjVcis+Xmqf4sAAongedWI8kSR4ekuFVrTBeAXqMZ3R92szTcCfoDqgvho3W9gjUcrivbTdIJ/x0J9M0Sq35iwgjZhPzQJpJsRTzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iAcSUwh8xsOoKvl5g5IkVkxHG/bvhZs7TsCQntALtU=;
 b=I85WoGCXgQFFI0kiuXbShWhZ2amLk1o1gtXTAi0TLiHAGiOyjqK4aN2hBdS7fURgCCORmubDhUiWVBKv4rfyTf1uEzKmezwDlw3xJOMF5zwbxOStNsIgIavGdU1lrTLl6d3t7Gi1YyVWc/OlttbwnGVcdBDi1NzOHH3+h3A90nA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10177.jpnprd01.prod.outlook.com (2603:1096:400:1e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 13:52:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::865f:1bdf:c364:1184]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::865f:1bdf:c364:1184%6]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 13:52:06 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 RESEND 2/4] i2c: Add i2c_device_get_match_data()
 callback
Thread-Topic: [PATCH v5 RESEND 2/4] i2c: Add i2c_device_get_match_data()
 callback
Thread-Index: AQHZxfWj7SO8qe9KmUymDQpiwRUqDq/YefeAgAAUccA=
Date:   Thu, 3 Aug 2023 13:52:05 +0000
Message-ID: <OS0PR01MB5922933E8AE4B9D17C0158E48608A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230803103102.323987-1-biju.das.jz@bp.renesas.com>
 <20230803103102.323987-3-biju.das.jz@bp.renesas.com>
 <ZMuYSdVfiCiUXU8L@smile.fi.intel.com>
In-Reply-To: <ZMuYSdVfiCiUXU8L@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10177:EE_
x-ms-office365-filtering-correlation-id: a676ba3a-ae31-47ae-e44b-08db9428d2cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gxUpIIgFJUDf/X2DiPo5HkCmu6BKsNGssyWN6TLLwJbd32xrxD3EhKUqlNrLlCbXnGiRfbdaqiFQuaiSIHk8lsRpmgrlDcTuOlXsRYr+TiQlwUTVOz+wACTDwB1z36/aObbY/31U6seU5cJhXgv/d1zzpN2ghooRHeffnpzAAyquU1yGdwNDyQyjSZQps31zl9GSZTq8y7HbVnzjeqCsB00urcjvOV0Fe1ubMCy9Qw4Qrj1zImKK6G1IgHgQpCu5E2tEGBno4F5gez1yMN3XEUvbyrctp61RJaQcBSOWWIMURmTQJ9tFMA6CC262mLPLFWYJ12qJhoFSPcuJNjKCX/Im6WUET34wIkiy0+tCNYJkwgXhqpQKuAaq5hAJlZm7/KDuWUa6ydE6XxIEary2FmTLvfT0EOe5PcQI+LPckOC9p/yGDn7USDjYdcvV/z08scmF3GvCCY/TVZVMf38RvBzQz7t16Nkv5jnliw+ke+6yCjqBLWMbLDEuhUbl3WuAESVxAbFKixjbcRZAshWpoTxp57pHKjUkASI50qNsoSfJKXDq9COkqk2wBkF7Y28g3Sy7wmUdDllM3nA1yCCje5NwZhRzdfDjkaSdTRCOCKJpU51WN5mPjVvMV5Q5BUmZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(6506007)(83380400001)(26005)(186003)(316002)(76116006)(2906002)(66946007)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(41300700001)(8676002)(8936002)(7696005)(71200400001)(52536014)(9686003)(54906003)(110136005)(478600001)(55016003)(38100700002)(122000001)(86362001)(33656002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EqXoTkmZBS0n3lwiVACqyePjAbhUgpTviIyHqxcXYkzMUQ8Qi7ALvOVf1ZLE?=
 =?us-ascii?Q?lk84I6JioA6gImpMfSOUN+wvd9ugbCJhpi/dz2tmffk24ZAjMRBvD9CdCjO8?=
 =?us-ascii?Q?qen8Jus5Wh1IIYiY4xSem5KZJIzgGcvsc70l+8rj5l1yKvpux2Yl1sjFDxEi?=
 =?us-ascii?Q?9VAYy2hSlp75iGewSszYzcEXObH2xVs1vgzNEI3XQgopfG/9T9qUD4mTIbsC?=
 =?us-ascii?Q?noO0TtYStc4KlTNNWmFo1k80bjN+awG+TfV+Ls3Py1WEHCruMBUQBl1Bque5?=
 =?us-ascii?Q?PduzlBb/fjYn0hOnMWGPbYQHL7oWW7uev0WhlcAh7v2saqoLDLMHQhGZSz8n?=
 =?us-ascii?Q?57fnIjdq9uH8wY0NWZLVB5oSCpi+Qg/PricBAlFIlGXjKBX+9Je0usdUUzqN?=
 =?us-ascii?Q?vd1PCHxecLLqLSSvcXvNXuUKdjLPw3dQxHAemSmHzeIltdTgdxK1dQJkc84h?=
 =?us-ascii?Q?ER6WT61FQsWB7dP5D1xqRMKz/g4zCfPj0RWY8f1AxvPciPJOjFQ9RTMacK6K?=
 =?us-ascii?Q?XFn2iC30Fvm5nD3D7wv//OYwig/c76q6T9eIZmWU9VPvulDaBA+2RO/CF/cr?=
 =?us-ascii?Q?pmuc3RtWQhvy+PTOgs2pHGc3AChaYAjuw3y9XHkYDGJXb6w6J//agTsauhqk?=
 =?us-ascii?Q?BaiSXJRU6MhR95XP/JXAmFl8GzLCLVUtpiZE4N8JxmKxm5aS97kK2TbthHrQ?=
 =?us-ascii?Q?uisp7Ay1/wQk1A7bgCAPpAg2nhR14V5x5a5GyUiksiUVfR0DfpLfa/J4Mikm?=
 =?us-ascii?Q?Hia/okyi/qRBBPF00QDCmGIW2BrETIsLUsZOl4U2S1F9clzDDED9+fBxqjqt?=
 =?us-ascii?Q?bBJMiGi266Zv/cgLbyaqTnPAvLtCANgNVqj+hObtKZ3tl9Ofe+jj+vXa/6SJ?=
 =?us-ascii?Q?a//uA/I8RAewPqR0PGQ+gRyrfYbv4zZSrJpyNnbwBvcDswz+NlyksDLTtaRi?=
 =?us-ascii?Q?CVJhKMFeQgeKpBuX60d/8DznwisSSv9ATUZjcuNIhlxRmcL453xmuxgdJvov?=
 =?us-ascii?Q?O3PpFfRGJoQFXND2tzIO8ne2pua1ADNPUU03qic43NtK7dEbPREje45qwenA?=
 =?us-ascii?Q?zvLMQHMqdPEeOB8+6mSpdRu6+abzEEyUy/povoVQZvpSuqfzLqwUER4ih8X6?=
 =?us-ascii?Q?fnyGMKhrkDVgxQAqd/fTTpVSi6XBHxZV+vLKYca91VpidZOmky5YCQ34cUq9?=
 =?us-ascii?Q?KRYLP/SvQOoQl/R7SykrNKktGIRXOuJm87Qzif/d9gqKRo3z30xQ4ZBi+RNI?=
 =?us-ascii?Q?kdeJosycOfOI73/RSzjqy4jtX1FbtPjYnEIK1lXdC1etXJPOAgzR2LkC0Axl?=
 =?us-ascii?Q?MvthnlItGnArBxxoChzA/NYCiHuMmzpUdEZw3I0po0t0KyTJYSxooDY7uSf1?=
 =?us-ascii?Q?syC112huLioCGGxRhAVo4yWmZp9t+IbRGS76lHz8EpdoFK1QWeCqiwf/5viC?=
 =?us-ascii?Q?Hi+ut+l/5To4SfiAvVdnAAG6TuPzXP0OaIe2lmsN1NCe8AlWYzl3XvaZH8fa?=
 =?us-ascii?Q?0Bd/Qnsv1cf7Vklxx85SO0wc3e6WtGj05vgxII8lDg/LE1zd4u9/k8nQo02M?=
 =?us-ascii?Q?bYAQ6DqQJWr+GBDbnKh2gpq8BJXWNDCVUNG83HmKeBJud5WXFEwcpb5fglrI?=
 =?us-ascii?Q?/w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a676ba3a-ae31-47ae-e44b-08db9428d2cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 13:52:05.8943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgb4wPs1szWUhYlTPIWmGrzZErYZqJCc3Pxu9fhdzZos9sXfJx+NzpAoLaf920M0c0TtcLh7hYOffxEN89cVo94P9cn+oN/SNwfb6rnwPFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10177
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v5 RESEND 2/4] i2c: Add i2c_device_get_match_data()
> callback
>=20
> On Thu, Aug 03, 2023 at 11:31:00AM +0100, Biju Das wrote:
> > Add i2c_device_get_match_data() callback to struct bus_type().
> >
> > While at it, introduced i2c_get_match_data_helper() to avoid code
> > duplication with i2c_get_match_data().
>=20
> It seems you are missing to Cc Andi for all these... (not your fault,
> rather unfortunately).
>=20
> Yes, while he is not directly involved into core changes the drivers are
> pretty much should consider this change.

Sure.

>=20
> ...
>=20
> >  	data =3D device_get_match_data(&client->dev);
> > -	if (!data) {
> > -		match =3D i2c_match_id(driver->id_table, client);
> > -		if (!match)
> > -			return NULL;
> > +	if (data)
> > +		return data;
> >
> > -		data =3D (const void *)match->driver_data;
> > -	}
> > -
> > -	return data;
>=20
> Looking at this, it _might_ make sense to split another patch to prepare
> for better difference here.

OK.

>=20
>  -	if (!data) {
>  -		match =3D i2c_match_id(driver->id_table, client);
>  -		if (!match)
>  -			return NULL;
>  +	if (data)
>  +		return data;
>  +
>  +	match =3D i2c_match_id(driver->id_table, client);
>  +	if (!match)
>  +		return NULL;
>  +
>  +	return (const void *)match->driver_data;
>=20
>  Just play with this idea.

Does these below 2 patches ok?

PATCH x:
-------
Subject: [PATCH 1/2] i2c: Enhance i2c_get_match_data()

Enhance i2c_get_match_data() for a faster path for device_get_
match_data().

While at it, add const to struct i2c_driver to prevent overriding
the driver pointer.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/i2c/i2c-core-base.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..7005dfe64066 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -116,20 +116,19 @@ EXPORT_SYMBOL_GPL(i2c_match_id);
=20
 const void *i2c_get_match_data(const struct i2c_client *client)
 {
-	struct i2c_driver *driver =3D to_i2c_driver(client->dev.driver);
+	const struct i2c_driver *driver =3D to_i2c_driver(client->dev.driver);
 	const struct i2c_device_id *match;
 	const void *data;
=20
 	data =3D device_get_match_data(&client->dev);
-	if (!data) {
-		match =3D i2c_match_id(driver->id_table, client);
-		if (!match)
-			return NULL;
+	if (data)
+		return data;
=20
-		data =3D (const void *)match->driver_data;
-	}
+	match =3D i2c_match_id(driver->id_table, client);
+	if (!match)
+		return NULL;
=20
-	return data;
+	return (const void *)match->driver_data;
 }
 EXPORT_SYMBOL(i2c_get_match_data);

Patch x+1:
---------

Subject: [PATCH 2/2] i2c: Add i2c_device_get_match_data() callback

Add i2c_device_get_match_data() callback to struct bus_type().

While at it, introduced i2c_get_match_data_helper() to avoid code
duplication with i2c_get_match_data().

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/i2c/i2c-core-base.c | 53 ++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7005dfe64066..d543460e47c2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -114,15 +114,10 @@ const struct i2c_device_id *i2c_match_id(const struct=
 i2c_device_id *id,
 }
 EXPORT_SYMBOL_GPL(i2c_match_id);
=20
-const void *i2c_get_match_data(const struct i2c_client *client)
+static const void *i2c_get_match_data_helper(const struct i2c_client *clie=
nt)
 {
 	const struct i2c_driver *driver =3D to_i2c_driver(client->dev.driver);
 	const struct i2c_device_id *match;
-	const void *data;
-
-	data =3D device_get_match_data(&client->dev);
-	if (data)
-		return data;
=20
 	match =3D i2c_match_id(driver->id_table, client);
 	if (!match)
@@ -130,6 +125,51 @@ const void *i2c_get_match_data(const struct i2c_client=
 *client)
=20
 	return (const void *)match->driver_data;
 }
+
+static const void *i2c_device_get_match_data(const struct device *dev)
+{
+	const struct device_driver *drv =3D dev->driver;
+	const struct i2c_client *client;
+	const void *data;
+
+	/*
+	 * It is not guaranteed that the function is always called on a device
+	 * bound to a driver (even though we normally expect this to be the
+	 * case).
+	 */
+	if (!drv)
+		return NULL;
+
+	/* TODO: use i2c_verify_client() when it accepts const pointer */
+	client =3D (dev->type =3D=3D &i2c_client_type) ? to_i2c_client(dev) : NUL=
L;
+	if (!client)
+		return NULL;
+
+	data =3D i2c_get_match_data_helper(client);
+	if (data)
+		return data;
+
+	if (drv->of_match_table) {
+		const struct of_device_id *match;
+
+		match =3D i2c_of_match_device_sysfs(drv->of_match_table, client);
+		if (match)
+			return match->data;
+	}
+
+	return NULL;
+}
+
+const void *i2c_get_match_data(const struct i2c_client *client)
+{
+	const void *data;
+
+	data =3D device_get_match_data(&client->dev);
+	if (data)
+		return data;
+
+	return i2c_get_match_data_helper(client);
+}
 EXPORT_SYMBOL(i2c_get_match_data);
=20
 static int i2c_device_match(struct device *dev, struct device_driver *drv)
@@ -694,6 +734,7 @@ struct bus_type i2c_bus_type =3D {
 	.probe		=3D i2c_device_probe,
 	.remove		=3D i2c_device_remove,
 	.shutdown	=3D i2c_device_shutdown,
+	.get_match_data	=3D i2c_device_get_match_data,
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);

Cheers,
Biju

