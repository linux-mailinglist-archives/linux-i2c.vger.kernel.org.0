Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3C3631A7B
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 08:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiKUHm1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 02:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiKUHmT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 02:42:19 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4052F397;
        Sun, 20 Nov 2022 23:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqK9DPoNIbQ1KqH98uEKmATUsu1O4XDMGQ6qvZgg3Q8+qCvk9jJxh1DGkc6Uoe2bdTaeEjostkiEKuTlwlKYxWajCUZapO6NF6hUwABoK0KzN5huKiLOEzZUqIsq15FPjWfxcA05wga4c4HQraCPfBYiEuF1vv+g7bND9rn1FlG/mM7uaZj3ZMUHo1rAlH8xrt2lbHSsx0PB+DKE0hvDKWT0T3tbeZqVY5L0s+R7vjhBL9shl7XTcaw5uv+ZcP/jU/HE8Naznm02Ewq8OrAR7LzlcysbBTGXyWS9HPmBzJOMTEi1Z9ebWxVNe3/yVOTU6Vw0NWcukZMQjwkqxwQqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6gk0fy8DpImhS1Af8EuVFy+58YOfUyRACsIETT6g6s=;
 b=L3HMfgCJt64nCP9Twq+esIVXED990w4a39yhupHwWU/+/4cPOln14fOmzqbDTN1fNeRarRaVqAMA5+O5Ag8QI9GaIF+RHO2UloisnH44Yp2s73kzHIfGUbw/AoLZz9ep+yzpstFn0WdJz1Qcjrzbbnzua5da1sQAGI+OWhAngDKOA4LuzoiQPk6fob5rxwk5s9qcPCYXYRdJR06aZ4XrJ9Pmo94ytgYubvjNJPmeKAAvgfeoeCSAuPPRZ315wUAjT4GrbizB04lJRI/E5RdG0XLvMGM3LjiKuFkxaqDOZhi6Has/N855yowF3sYYg7v8voNafr/cEKnNfydwGj5Xow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6gk0fy8DpImhS1Af8EuVFy+58YOfUyRACsIETT6g6s=;
 b=DqdEymwX10zXnNmk3V47HgApEYmvEHp12SoI+3UFAbP5NRNUgDhhuaYeiEHnC3j9mQdeY5ghJaH/G2o8sJihvnEhGieg0n8EWNL25CmjCFLu+FUZEdDSgxvjlNt5RDAPOdsNluNtn+qonyblKdB+n34TZ9GZ47yDoC4KuQOJ+xY=
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com (2603:10a6:20b:281::9)
 by DU2PR09MB5373.eurprd09.prod.outlook.com (2603:10a6:10:276::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 07:42:15 +0000
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::707e:3312:93f6:f84f]) by AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::707e:3312:93f6:f84f%9]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:42:15 +0000
From:   Oliver Graute <oliver.graute@kococonnector.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <uwe@kleine-koenig.org>
CC:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 237/606] Input: edt-ft5x06 - Convert to i2c's .probe_new()
Thread-Topic: [PATCH 237/606] Input: edt-ft5x06 - Convert to i2c's
 .probe_new()
Thread-Index: AQHY+5+zYrTZRZozzkuq8a6718hVna5JAjYA
Date:   Mon, 21 Nov 2022 07:42:15 +0000
Message-ID: <DCD9AF01-5C45-46A0-A687-F894DC282CAB@kococonnector.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-238-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-238-uwe@kleine-koenig.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kococonnector.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR09MB4884:EE_|DU2PR09MB5373:EE_
x-ms-office365-filtering-correlation-id: 0c66ccfa-a615-489e-3ca0-08dacb93e8b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xVTr23qPfUPnZzy1U3Mn//VMM/OBRLTIv24LtF+UVrOzxTeze1Sa5rKEpW9ZYK6ENqkE8m3K3ZnVrrZOXo2ruTys4DIiME8THVq9P1C1Ue8WLrFwKYzgcNP2a1WWjoyCeBHudTnkRqsVM9yKHYJhPuAqpatry2AV+pyOUBRWwMan6yeaNLa3N3oEVHkLSC39FoOBs+TRclQigID6KeYH7EzW/o4KgoUdzUGqEacBQE/QLV/vwy5W3jQNiMK/9Ho1PHtL8nLXhvX2vdVRAF+cn6csCuhecySRAw3ruyZTNU2Xcv02BP/ZNLIh9MfehOyHhQ4NHqa+khi4VqEKabdt17tI3uH6l2l8WIMODoiyXzFgRr8NeJ94UTveo2G6U91Q8B/mKOYB57U5SOIFIwGzTS1uIEHo6BpnWI4Je3OmkscW5KU1jUZPqkhDbZNuwYZkeM4LAuWrmdddvOJr6MCDMPgK6MgHpcxeyBIdeG+g+bwn9wDA1Uw7x11/5jwFLKuiwpfXQou83xWJ7d6Ll7kWpOcw1i+KbhschALVOhxj2orNjL1XFC67IYwFuWRfd/cmoEKJ0GSo/rvlK2s3TgT+bazlnFY0wZVpJ/YkzaD7R2Whsr/EGOmaXIei6UcE+7BqwZB+c78mN+gu00n7BpSxefxD0XNK05zLxIGHJRmVsJb9nfEcEYN6b1RFBarL9SVCJkIb++A7VZhlGpYEqoqbw3DDxUu+svo7VENL9qfHrZMedPfIvgI58Q+lm/bwB9YE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR09MB4884.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(376002)(396003)(346002)(39830400003)(451199015)(86362001)(66946007)(33656002)(91956017)(66476007)(66556008)(76116006)(2616005)(36756003)(41300700001)(6506007)(186003)(4326008)(8676002)(7416002)(5660300002)(6512007)(478600001)(71200400001)(316002)(26005)(44832011)(6486002)(8936002)(54906003)(6916009)(38100700002)(66446008)(122000001)(38070700005)(64756008)(99936003)(83380400001)(2906002)(142923001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SG9jSlBiYzdWQXZOc3dxam54enBWcS9peFRmQTFmRDF0SUJRMDFnZ1lFeVZS?=
 =?utf-8?B?VXZWTm1TZjREejRkdk13bXFKZ2h3blpVajJyWkVZd3FicGRvV3VDZVpVejV6?=
 =?utf-8?B?b1ZxQmZQVHU4YnFIZWw0UGw4T21ZdXMybi9xQ1J0eURRcjVObUdRaTJFVnlM?=
 =?utf-8?B?V0xJT2tsbkxCRm03cFUybVEvSEZlemZxVGE2cDMwWVRPV3FKM3Q4aUdNTXl5?=
 =?utf-8?B?RHR3bSt0R0orRHVodU05U1QxdzdhSzQxV00zNG5KbFNldjlmL2poZm1zK3Yv?=
 =?utf-8?B?VkVQY1ZKd0lZdXFZNFM0M1hWeVVhSk5qSDRqVzA2SDhTN3E4MVJqR1gxNmxq?=
 =?utf-8?B?dHlnbjF5UmRYZUpkdUIwR1lhSEtCQVZMUGlUMFJkMUIrblZSZ0ljZVJ3YXZz?=
 =?utf-8?B?anlEemJFWEJVMTRDTmNlaS84ZVlETTNITTFITVZ4RHhFcE83a2hYUUxZdkkv?=
 =?utf-8?B?dVE4WERYNVlKSENjaHprMUgzSUIzeWRtN2g4TDdDY2JiZ2RXVWE0bXRlY1Rz?=
 =?utf-8?B?b09VYlVJalVhRVpSOXVaY3k4WEFCemxTa2F5aitLTU5BZXJ2Z1ZnTW9ncE5S?=
 =?utf-8?B?cCtPeFVONzdoQnR4YlBPNVZ3d09vQlBaMTVUbkJMakZpVEdjZW84M3dBckk2?=
 =?utf-8?B?ZTdhUEE1b1dPMFliTkUwdThpOURwS2lkYjluTzJwRko5aVZFRm9qYWhpUXNn?=
 =?utf-8?B?amQycy9GTzdnM09EWUxsbHYvU3FscFI5RkF0NDhXZXNoaTNvVERyUy9WcjI0?=
 =?utf-8?B?OVNMZWk3MXB2NHFwYSs1bFZ3b0M5K0pjaVlBVkdvUTJpRWtvbk5ES1JXeis0?=
 =?utf-8?B?bmU3R3VQeStDbWI1UFB1bTFYbUw4Qmx2aTBtOTBRQkVsWVRRWHQxN2Y1S1Iy?=
 =?utf-8?B?YWhJL09vbktjUnF0bklZd3ZsLzkzTzVFZDhSbGtSeS9jbW5XTGJaN3dtcW1X?=
 =?utf-8?B?STR2SlB5RjB3VUdiYXlVZDN5QUtmVU1aQjBORE5CRmlwbjZrS3VXakQ2bjkx?=
 =?utf-8?B?MDR1em45Uzc3TXJVenR5cFZ5bG9yRkFqT0RveVZ5OVlaWGtsOTVqM1JQMkRP?=
 =?utf-8?B?N3JYYW10Rm9ScHdwYUx0aG1SeVdCaXNCb21id0dDR01NWlNMNU9ocDROUmhh?=
 =?utf-8?B?RjhJeFE0b3RUcjh3KzJwZFE5eXIrVStDbUg2L2Zic3VDamgxcTVaTXpMaGhK?=
 =?utf-8?B?d1UxcEtMUStRZk50VWtkWG5wcUJqNTRaN1lmb2tHOWRHMGFQNS9wMG1DNlpU?=
 =?utf-8?B?anRqQWpKVVNkbVdWemQ5TXVBRjlMckdaMkVtRGp1RDBUR3pSNnhST2ZybVFk?=
 =?utf-8?B?TUFEVjBFUGo5N1pSWlV4NGlDL0syb05EMWZGb1o4MUp3QVFXdW9sazM3Mzk2?=
 =?utf-8?B?ZXZNMy9SL1REb214ZDZFUmhwc2FBemUyTFBZRzRsK0RGaEVremJBOCtZNlB3?=
 =?utf-8?B?MnpkUEdLV2UxTW9Nd0ZTV1lTT01NSmZhMHpuVzlqMG9iUitYRDlVSGNPc0ha?=
 =?utf-8?B?R3Z5b3VPOW5MZlNDY1loNStOU1cvSXY3QkFrTmd3Q002R0dJK3QvcVl0UCt3?=
 =?utf-8?B?M21wcGd6UWNYOTdraXUwZDFVNTV2cW04ZmRtM2VqNWdNSk5NeEQ0OXVqdWhl?=
 =?utf-8?B?aUJiSHQ3WHQ1UHpqbURrR3huSFh2alZtL2Ixc24zMnJOMEdQa3psdkFlZEVU?=
 =?utf-8?B?dklFaTQzWHltV1RlenhxaUkwV1UxaS9Yc3pkdXkvczVncXFCdHpVdWlYMDlY?=
 =?utf-8?B?bjlKMW9hWi9zclk4L1IyWXJ1K2F6TmZMZUdIcERCTVhXaGlkbGN6bWFxa1o1?=
 =?utf-8?B?WU4rWmdoVGVPMUVIRDZtVkNTeGQyUjhuQUZFbUlKd2ZNajNVSEhsTnJpM3Vi?=
 =?utf-8?B?ZHlYak8wcUpVcGxBZEdHVXhkMVFzamNtS0MvOVNqcUdPQWNES2x6TEprdDg0?=
 =?utf-8?B?ZENFc29kNHNHWlJEazBzMXBZK0t1YVJEN3lObnZEc0pIa3BqQ210YzU1N3hq?=
 =?utf-8?B?RGM2YVJQMTlSZHlmUDBEVlcwc0dsVWZYTlAwclFBVmc0VGRwQXY2RUFBWkpE?=
 =?utf-8?B?bnFYVlB0ZFgxWmJZV3J6RE1ML0ZVK1BoVGVQK3R3NkxMdFFqczFJZlJDMVla?=
 =?utf-8?B?S1h0Y01wS0xQZFpzL3dibVljTWtIK0tBMXZoM2xTMHVwNDlJWXBTK1dRUFRW?=
 =?utf-8?Q?LH4MzLwpb3T6sI6cSBvY0fI=3D?=
Content-Type: multipart/signed;
        boundary="Apple-Mail=_F1DC4C64-8A03-44CE-BD50-D5D3B2ECA483";
        protocol="application/pgp-signature";
        micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4884.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c66ccfa-a615-489e-3ca0-08dacb93e8b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 07:42:15.0725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QDg/6YyycZ91ZTc+al1EtAvqWJXooCugcW4TOrgg4rOGq14uUQNbSdVaCA63HB9dp6QKGEvMB3WLLBm+9TxVUTQ5CtxXnd1z/NhKG5l8neg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR09MB5373
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--Apple-Mail=_F1DC4C64-8A03-44CE-BD50-D5D3B2ECA483
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Am 18.11.2022 um 23:39 schrieb Uwe Kleine-K=C3=B6nig =
<uwe@kleine-koenig.org>:
>=20
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

> ---
> drivers/input/touchscreen/edt-ft5x06.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c =
b/drivers/input/touchscreen/edt-ft5x06.c
> index 9ac1378610bc..ddd0f1f62458 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -1131,9 +1131,9 @@ static void edt_ft5x06_disable_regulators(void =
*arg)
> regulator_disable(data->iovcc);
> }
>=20
> -static int edt_ft5x06_ts_probe(struct i2c_client *client,
> - const struct i2c_device_id *id)
> +static int edt_ft5x06_ts_probe(struct i2c_client *client)
> {
> + const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
> const struct edt_i2c_chip_data *chip_data;
> struct edt_ft5x06_ts_data *tsdata;
> u8 buf[2] =3D { 0xfc, 0x00 };
> @@ -1504,7 +1504,7 @@ static struct i2c_driver edt_ft5x06_ts_driver =3D =
{
> .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> },
> .id_table =3D edt_ft5x06_ts_id,
> - .probe    =3D edt_ft5x06_ts_probe,
> + .probe_new =3D edt_ft5x06_ts_probe,
> .remove   =3D edt_ft5x06_ts_remove,
> };
>=20
> --
> 2.38.1
>=20


--Apple-Mail=_F1DC4C64-8A03-44CE-BD50-D5D3B2ECA483
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQThJdQ+vZ33cLI00t00OmbS7pnyNQUCY3srxAAKCRA0OmbS7pny
NdezAP0Rh0xA23U5/EBoCCwZHWMECvg+BXubNjVfLUzGzomGZgEA02RiqFGqLZ2a
b4m50eP51hRxCINcGBy71E8o1HI7sA8=
=W7mG
-----END PGP SIGNATURE-----

--Apple-Mail=_F1DC4C64-8A03-44CE-BD50-D5D3B2ECA483--
