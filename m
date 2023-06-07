Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 268E9725550
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 09:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238913AbjFGHVi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 03:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233896AbjFGHVh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 03:21:37 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43906E6B;
        Wed,  7 Jun 2023 00:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PY5ncNTRbEEMN3wn/QRnYBURES3QqIsClVIAKl5NBLNwkct5JKIvoyLT54zBF5InQbAJvTlEV9mi3chbT6bUYajmnVgPWx6rTZtmHGbtJiIhFPw6xe5o5hHCizY4XobBeWIcjvJPC3nodXR5n1oqP91HdAC5qLDiK95gyBhUSwOB/c/0gA3L4KwAtWsksrN9AouguVc8i5Jw69X5NbsaEBAfdGXd9yrIFZDt+oUJ3aiMPTF/xKreYb8Ah3wMEZolvClBEla+gdLi5JAMiTAZd0L4vIhON6Hd4/02s3pOAj//ODKFkzkuXKQq1XSGC6TaUBy0fZ4H2FaXYrijDMqZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2+Sg3b1yimeCLZ3YeXqcsOcbSp1rwiZ61HXMv3aRtg=;
 b=NEdGQ/N687lbFUez17I52jEbYCoosNdGW3+5VN5Hc/vEtush4msIKwtDBF+Cix96n1P6TtMZTYlDFC4I6xWBnOXQJvuGTxEkqlILaAnrIFuoRn5eoe2bnIW57x+Vg+8DQ8YYbX9jUbttHYc+PPpQNeOjMNutLQCQ2ykU0AJsmqXZohiv8yN+WLeWWi0q/kJ/Pmp5pdR+HllxrKH9bhWjz2ol6yUtUn8lEVuLask6Vy/pAH5pqJkPKKTUhLjszRtowlSfyEklGTfpime9bKZOcOrefTzZEvhjXsIzOSahHqp3nAKPsS/z22cWCWPsxKtzFypROqOMXGmvMdx+2CeEtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2+Sg3b1yimeCLZ3YeXqcsOcbSp1rwiZ61HXMv3aRtg=;
 b=gWfro7g+Axjra9+qmsGvQ4E627f8vk1eqIODpMf1pn/z0ZFkywWOJPTiii9rCMBhFL3GcrqGzSdxtaMdjP71xQqUIbaqAZgJYtnO+zEaduN3UA+SkZe3LKbxnVlCAONhWh+UshKx0Sl66UFB2Xz/vv9VdXV92tnWnDaGKNKlAO8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB12006.jpnprd01.prod.outlook.com (2603:1096:400:3fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 07:21:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 07:21:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v3] i2c: Add i2c_get_match_data()
Thread-Topic: [PATCH v3] i2c: Add i2c_get_match_data()
Thread-Index: AQHZmHeP0tU6ipLwP0StWgcCj8giXq9+63Mg
Date:   Wed, 7 Jun 2023 07:21:32 +0000
Message-ID: <OS0PR01MB592282658E36A14D0A762BBB8653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230606130519.382304-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230606130519.382304-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB12006:EE_
x-ms-office365-filtering-correlation-id: 732ebbd1-7f2f-453d-81b9-08db6727d19e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MDGfD2+F+gQzs001eYgoBKRcH2RveBiqYa+aNLlHoLm50E6MhwSChV8D/dywrU/DtT2arqxHC8jzU/02kwsGg+/ER/tncvtCtyE9IYwH/WbUxpLDJNnuieLgjPt0p8Sd/qZ56XTGj3z75wuDMUVb6oZVG+1vFJ5OYRQTmkl3vKxz09K8sLo47ZfFG20pSBLhIWk35iBu3QymhUQYrP1eD4wuuFKiO/Gq9bhyTwW4jBfweMyO+yJBUhMKRU5LjaxvdJyHXeQpZnC+edmN9g8eYxhxoJnnJEYQj8pKF2/t4QLD2gpcDK9Cfgg1Ae/E1kxwxxhSJQT1PnFGDkft0ywd0TG+3inQYFI7FL6nIJz/tr24Ou0r1KQXZCz40s6DiSiy86qw45VV4NTKYosi5wpru7ifrxDpNXp15q+SSxc5NWr69nlh26w9TiLTPit3311X5yyHfoXFdzJ/231pduHjrsAEpGC5QsT0xyGYNkoqWi+4dEUed5HTKMOsCsKoWOgMsItE2SiEY420fba/c7n34Eo/tfu9aOyrVk3FNTKngm6gvfWinBWerBUERRxGKPlWPIF2JSdtExq8nHQMTm/fzmb+ziLUhBC1hkYZZ6tjZsY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(53546011)(9686003)(6506007)(26005)(38100700002)(83380400001)(41300700001)(7696005)(966005)(186003)(71200400001)(478600001)(54906003)(110136005)(64756008)(66556008)(66446008)(66476007)(76116006)(55016003)(316002)(66946007)(4326008)(8936002)(122000001)(8676002)(52536014)(5660300002)(33656002)(38070700005)(86362001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TOIrxCjii/t6v6Dshuwn1hGRWOBER2PH1DiCS8KZvlwBf7jGmK2YfU0h8rbk?=
 =?us-ascii?Q?rBljtsinXtCyrJrSPkJmnGqJ9pbQtCXc51S+ML40EsX5raR8fH209e5SyGKF?=
 =?us-ascii?Q?dxqk0oGlqjLUQaPDVTZ4XVhbXwL94gyDXbKKQ0gEvQljkM6GqYjgOsW3bmsy?=
 =?us-ascii?Q?di36b05am88I8y0wPuJxMpQ/nAY583jAiwYsTZL6ugn9E3annWbaBsLNntD0?=
 =?us-ascii?Q?CYwY91EgAES5ONXDrHKrKicuurp7f4LAteGWLj5OoEFco+yc6UM4hHXMVndQ?=
 =?us-ascii?Q?fBpOTO3kNRdk6oWxvrXr8361rc7frRw0BbkbtcW0GBM83bEiU9coZ4q+G41X?=
 =?us-ascii?Q?66hI+L2FxQaiCRBsFzvhum5hNeY5ihKJXTOETbAOh6Ly5ouE8ky83tqqF9we?=
 =?us-ascii?Q?9PdS3KqV8HUxMo5iyPOKje4cCvstVi6baiimHCVEEjDOgCat3BH1Lyg+gvqI?=
 =?us-ascii?Q?IyrM5xNOKMmCDqo2iQvRWBnGtSE38jnFh5S2AX1cTIM+bdh6acerEYPNDj8V?=
 =?us-ascii?Q?G1skTqvw13BB6RSILKFxiGVfrYftWxsmlhD7OLUq/VSeD7YVhn2q/jAvpV4Y?=
 =?us-ascii?Q?nas0W0VW3INH+X4I4dAEJDNvCMgzWt5jCtkltydIyJMJrY3n0x47hQaBJOE7?=
 =?us-ascii?Q?Gn7dy+/eKbaBJAQrIC//23mP5pfKknWtenfiWBhTFnDC0pkmXtumSYmlahH7?=
 =?us-ascii?Q?LhZzOGEGuh7gpWylVHIPrudInn7jCBUQTXdvkfRel8ehZrGu7WadC1aMbMkG?=
 =?us-ascii?Q?XY0IMxF0M/YF7D000JsEjffbe7X08xQjON8OEGqrnrpCxg8APoMnkuy28U7N?=
 =?us-ascii?Q?qf/Hp4JdycPRZb2/ZLLpCYsJAqYZped1Hb6+uzIWslsc3vpciqt7S3GOKjqw?=
 =?us-ascii?Q?ZiRLROXo2ROyWDl8yVmHlZxXWuOuCglt/ZYxnMhIowFRByN+aJJJpHbWUpFd?=
 =?us-ascii?Q?KpYNsqzKwzG7SUhy58zJgmdDblurrii0us8+3bzJJsJZJhcR5eIw8jnd94cV?=
 =?us-ascii?Q?ZTF1YMJtQ2De8ea+1WzaQlyZHNcxVjFWWvO95Goo+K0jCc94Sil9Zpe7/t1H?=
 =?us-ascii?Q?ryURYQ/JDwlvIiYT2ZOpo24/D3n7b52SbNay5i/nSRx/leqcW5rKqKnWoa8F?=
 =?us-ascii?Q?RWtWnvPyyuiCwISYIaWK5iLDIkVdPhAZQhucRJzlmFNLy5bP2Ucl2HyozX8f?=
 =?us-ascii?Q?zgLyicjpPGQjczXsECMuHz3gZpj9jmXUh+Ot/UCj8IRKskvcWKnDMHd9Nuns?=
 =?us-ascii?Q?gdJyXWFkXafOTv+oQg4EkSPFfiwrn5g2neGYwray9uaRVN+XMS53Cu/8sjSd?=
 =?us-ascii?Q?uyLjIRUsOXxXEmLJdP72hsUASQ2td9jWsNCv9Gll34feQFyYHnkDAk8Ic+Mo?=
 =?us-ascii?Q?KDVgW+KDTcG6EovB43lqAjQSYfshs1p7PGs35tYtANq/cjROSqmUFYrp4hfs?=
 =?us-ascii?Q?sl89NFNvJwmJQWUmywkFGI8SfU149MyqR8ZAJENe3KRMs/RpPirMioTta5vA?=
 =?us-ascii?Q?/Fh7nGlSZaGoM5rT9LTbt9cHaRphXL4pL7vMvB7svMC2D8bLtT3MUa9i1ebc?=
 =?us-ascii?Q?DTOlKYCSVHFndCZ0Mwr7byxjZ7QBYRvhvhvtnGE1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732ebbd1-7f2f-453d-81b9-08db6727d19e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 07:21:32.1201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fy3ts7vy6OA5Quy0/6lnv6rTrWsaNlxLG54h8+oXg5mdEKq9NwVEjdz639BFVzQwV18govK3x5x+TBysZ//CXzPkJsZ5o50YrTsR8AtXlI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12006
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram/Geert,

Do we need to enhance the logic to use device_get_match_data
to support OF/ACPI/I2C match like below [1].

Or

Are we happy with the current one?

+ Mark, Linux-clk

If I am correct, the new enhancement[1] will add I2C match support [2]
drivers. Currently this driver support only OF/ACPI match-data even though
driver has I2C matching table.

[2] https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-renesas-=
pcie.c#L282

The current patch will be useful for these drivers as well for I2C match su=
pport
as these drivers have I2C matching table.

[3] https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-versaclo=
ck5.c#L956=20
[4] https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-versaclo=
ck7.c#L1111

[1]
+const void *i2c_get_match_data(const struct i2c_client *client) {
+	struct device_driver *drv =3D client->dev.driver;
+	struct i2c_driver *driver =3D to_i2c_driver(drv);
+	const struct i2c_device_id *match;
+	const void *data;
+
+	data =3D device_get_match_data(&client->dev);
+	if (!data) {
+		match =3D i2c_match_id(driver->id_table, client);
+		if (!match)
+			return NULL;
+
+		data =3D (const void *)match->driver_data;
+	}
+
> +	return data;
> +}
> +EXPORT_SYMBOL(i2c_get_match_data);

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, June 6, 2023 2:05 PM
> To: Wolfram Sang <wsa@kernel.org>; Alessandro Zummo
> <a.zummo@towertech.it>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; linux-i2c@vger.kernel.org;
> linux-rtc@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-
> renesas-soc@vger.kernel.org
> Subject: [PATCH v3] i2c: Add i2c_get_match_data()
>=20
> Add i2c_get_match_data() to get match data for both I2C and DT-based
> matching, so that we can optimize the driver code that uses both.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
>  * Added support for getting match data for both I2C and DT-based
>    matching.
>  * Added Rb tag from Geert and retained the Rb tag as change is trivial.
> v1->v2:
>  * Dropped parameter const struct i2c_device_id *id and the helper
> function.
>=20
> eg: The RTC pcf85063/isl1208 driver code can be optimized with this
> patch.
> -       if (client->dev.of_node) {
> -                config =3D of_device_get_match_data(&client->dev);
> -               if (!config)
> -                       return -ENODEV;
> -       } else {
> -               enum pcf85063_type type =3D
> -                       i2c_match_id(pcf85063_ids, client)->driver_data;
> -               if (type >=3D PCF85063_LAST_ID)
> -                       return -ENODEV;
> -               config =3D &pcf85063_cfg[type];
> -       }
> +       config =3D i2c_get_match_data(client);
> +       if (!config)
> +               return -ENODEV;
> ---
>  drivers/i2c/i2c-core-base.c | 21 +++++++++++++++++++++
>  include/linux/i2c.h         |  2 ++
>  2 files changed, 23 insertions(+)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index ae3af738b03f..15a49f4ba668 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -114,6 +114,27 @@ const struct i2c_device_id *i2c_match_id(const
> struct i2c_device_id *id,  }  EXPORT_SYMBOL_GPL(i2c_match_id);
>=20
> +const void *i2c_get_match_data(const struct i2c_client *client) {
> +	struct device_driver *drv =3D client->dev.driver;
> +	struct i2c_driver *driver =3D to_i2c_driver(drv);
> +	const struct i2c_device_id *match;
> +	const void *data;
> +
> +	if (client->dev.of_node) {
> +		data =3D of_device_get_match_data(&client->dev);
> +	} else {
> +		match =3D i2c_match_id(driver->id_table, client);
> +		if (!match)
> +			return NULL;
> +
> +		data =3D (const void *)match->driver_data;
> +	}
> +
> +	return data;
> +}
> +EXPORT_SYMBOL(i2c_get_match_data);
> +
>  static int i2c_device_match(struct device *dev, struct device_driver
> *drv)  {
>  	struct i2c_client	*client =3D i2c_verify_client(dev);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h index
> 13a1ce38cb0c..3430cc2b05a6 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -367,6 +367,8 @@ struct i2c_adapter *i2c_verify_adapter(struct device
> *dev);  const struct i2c_device_id *i2c_match_id(const struct
> i2c_device_id *id,
>  					 const struct i2c_client *client);
>=20
> +const void *i2c_get_match_data(const struct i2c_client *client);
> +
>  static inline struct i2c_client *kobj_to_i2c_client(struct kobject
> *kobj)  {
>  	struct device * const dev =3D kobj_to_dev(kobj);
> --
> 2.25.1

