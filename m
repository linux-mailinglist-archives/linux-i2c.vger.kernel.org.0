Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A547259D0
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 11:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239878AbjFGJON (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 05:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239865AbjFGJNs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 05:13:48 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABEE1FCD;
        Wed,  7 Jun 2023 02:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVI7LA2BKEGoyGgQEmbFWj+x0FWI7evPH9+Qj/jla6y9iE8FViUIgxTQaro6C8GIlKje3UJunDiHGSkCo3ecRN3YdVW65NDTkVhtOH9Xf+2xfM+wl97kAU0sEvWhVZ+sE+DFv7ACKw50dZaJ1O95I2I3reM4iR6vrTbp1nVtDsEPqGW9GAMQdHr65EMkcXkulAvUdp7gU49YsO2nxoffbJQ3+J7SsXJCM0xl0zz9p5Pn0B+W+7C7EAdnhNzlvM+TwFkTpN+O2x5big/OahiQYMffI5Gt0MOkwRtr3LEeWzLm+MZ/R9P7Rl66Bmjc7rawsBae2/c9Xs9EJM/ND4lUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XLOrqEU8pie4nunGrUlMEDWAJOht6bk00ptlPgmhu4=;
 b=i4iQ6vVUQIRnOKMvcPr3qLpIV6EA71gy9FR+gXS+tEMDAaOIlrepkbfwCsfoZW2LcJjtSOJqjUvD3QPjMuVoHAX7kl7FddAXxNSHMpX5eosU+Jy6nm/dBbpfiJb/SUYdAC/M2ur+8/cqfPAhRtCTNb9Wj5q8ivZYiOINiBK46RfyLfkuDyMYT8hZvBMW9eKz2arYRi/zapJP24N7VI1kAGIUR7Y9j151sRCHkkXqOWSHfwkZDljhDEPPmYQiB6BGjSqSA/lETjwuM9IxDE1+1SOkLM4ITQkbNByNp3/oFrIzvXJf/b/FNe7OBnmo7dCR4UVS+ePyz+Vv1z4UmLjmWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XLOrqEU8pie4nunGrUlMEDWAJOht6bk00ptlPgmhu4=;
 b=jwQDkAbSmFS/h5rv/MiifFoZ+hL1EP9v+ZDhgZyHDJ0SVuOeftmVNgWeRmiUj0KTIsI6Js7PUj1nu9g+CIgMOdjm8JReqWfxJ82f3jckQPjGlniKXauLAet73A8T+el8h+ndMrYTcLtMTj/2I0j1iCGUaC+BP8eyIiGe+Hk9kIQ=
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com (2603:1096:400:169::11)
 by OS0PR01MB5779.jpnprd01.prod.outlook.com (2603:1096:604:bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:12:41 +0000
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::f687:2c30:bf97:7ca2]) by TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::f687:2c30:bf97:7ca2%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:12:41 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa@kernel.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] MAINTAINERS: Add entries for Renesas RZ/V2M I2C driver
Thread-Topic: [PATCH] MAINTAINERS: Add entries for Renesas RZ/V2M I2C driver
Thread-Index: AQHZmH/Rodf9++EdlEWiHDhPvgt7k69/DwSQ
Date:   Wed, 7 Jun 2023 09:12:41 +0000
Message-ID: <TYWPR01MB87758082509F69FCCAAA0636C253A@TYWPR01MB8775.jpnprd01.prod.outlook.com>
References: <20230606140426.383462-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230606140426.383462-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB8775:EE_|OS0PR01MB5779:EE_
x-ms-office365-filtering-correlation-id: a62c3dde-8d6d-4b59-867f-08db673758ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TtZkMgxj3PLAvKSbq5zab9sQPFhJpXBmzaDLM6mC5eWqGNz/WGrEKnhUgtgoVRoX067W9j154hQ4XXyXbzYpHQHQjwN4mG/clCFQiFogUYNZihtBb745JVdH31KLfLFYvBA0eZd3p5kAjfivnw/vH90U3MuKCA78H2NN97n4Q8MWrPqc1Tp0yE1WwKJq5sZvJKf3IZK7rsrlFNzH9kL1eTS6g1I2XxKVylmHdCD+Zw+6pFX24knhxI9pCZU3fk+YTopWF8F0oo4p2LsVUR0BFOip2IonhsHWSY+/s+Muyw223T3Y3O3mZWpvToNxVdKayK2c2mEVnET+ivhWgq+ivf449XuAf24Tro+pVUm/jdvdgX9W9LwkFgQJGPMrE9cZGADxB7kReku8F0pwO1A3B1+07v+CWkZztdSdFSEUid3slryXCkgZNm2/DwTcT+LXa2rTT57ydZo82S+nwol7if/LFnpPqW5c250O+hydMIL6hUad/S/x3u8zRhTSWoe3WWrxMQM/6cQdx/I6BbWeQWXatKZ27DqH7VsH+C/h02uxFE+nEGn7AaTDJl9m443p8/OlFrZfy5kRKU/sy6Gq1C3txZBUPuxWlJGFtHfoyM3pUem+sZ3YLCeLbK17ooZz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB8775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(478600001)(2906002)(4744005)(7696005)(71200400001)(33656002)(38070700005)(6506007)(86362001)(9686003)(53546011)(186003)(26005)(122000001)(38100700002)(5660300002)(110136005)(316002)(8676002)(8936002)(66946007)(76116006)(66556008)(66446008)(4326008)(66476007)(64756008)(52536014)(55016003)(54906003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OGjlWYThDNAx/15t/MI0E/9dItHvIYBggb9V1VBeTgn0rR/SIrU8eA9T4wet?=
 =?us-ascii?Q?ayb58j2qovSm+5bg7nJ9+3dzOvf8ZYLkONbHPVIonBSf//YEgr6831eVjzNU?=
 =?us-ascii?Q?HC6SBtRSCxIQOtIyQXnlKgAhfWchKuQeP6GUBJJcsM+K7pFPO9liQmetcGk2?=
 =?us-ascii?Q?uElbd7fQ54x5QWqRGFKK2MYIzvVjgHPMZP3RByZRa+2qB9+RkYmnOITXtaKW?=
 =?us-ascii?Q?KKB5wg6wj821LVkdEKTFfmUWSdOIY017G8dLD/wXr8NpoouwiwB0ONi9Ptcx?=
 =?us-ascii?Q?5qSZ84rz8+vks9NtVx5tJL4ci6ka4dmn48SqjYWjxxxAgCCfXhWe4kl1+bar?=
 =?us-ascii?Q?+lGdgX+tzKFkWo1IPmQ2NIcw1dLZKhmIszkl1QRaih/1hICoEtPXX+BMq2/Y?=
 =?us-ascii?Q?JkFMT4hgUv/srvjIc9sBPptEIPzeE48IiR5LWpM6NEqQfNLplhFSwGO5J8/L?=
 =?us-ascii?Q?High1MrQVEMwmzR3rDi3UXlt04j7VM7mqleSUhDO0/7hm6A5NY7Kix3J60ZW?=
 =?us-ascii?Q?aTx+aFR8iH8KoQawJbzJHGV2hz8TYxdy5hdJ53u3GPJ0UE1ZPk9Wd9WPUZrN?=
 =?us-ascii?Q?WMM/UPjMkyrSrgPMygN7PP0LKKQcMtUUW94sSPBPX8xGeT+U4jinn9ESgWfS?=
 =?us-ascii?Q?1mwoEffx/Cpw9sFyIk4YpQPn3KrWGif2fzRDc7mSkMAPCiPhQCgBxH0tx6Fe?=
 =?us-ascii?Q?qXszu8UIXXVn10W4jlKZrhtb1lF4wpxOJQedi6TOoeX4ZY/+CQj2Fpt0ds7z?=
 =?us-ascii?Q?wgIzPHNZt2HOcIcX5pTERbK2uOAPtE9JF2YcLqsFOsZeGBDwS2YG+cHVX8Av?=
 =?us-ascii?Q?70gvLN/VrJL/IhQNCevZ8WlwyxM96sSggJoBTUI4khgfUHKfzyffDLj4ciaT?=
 =?us-ascii?Q?3iwr0Okw6UeUhw/961Q8gRUnBE9RFc8h4xO6wFqTFTzwECmQlRpaVM80IwiF?=
 =?us-ascii?Q?8pu1QRZT/qsH57ozS6LUBFpaLkMyge0/kdjh8IvtD03qraazP+fcjsFbUn9t?=
 =?us-ascii?Q?0UE15GXX3Rr+srsrH0CvqCP5/Xa2Lz/WFVZVdv2Rh1iivc/t+Q31j9u0xh6a?=
 =?us-ascii?Q?HpHTQGfvJUD6mwZFhN82T12ZEX1cTB5woY2ebMXBO/6jtCxNwUKdCXxTA/HU?=
 =?us-ascii?Q?mUFrVghY796bgVcP4opCmOetr06n8eXFcwD62WOb1oCoh2rsebOivA7xNS/B?=
 =?us-ascii?Q?RZYsGXHm/MqYYPFlMJaUEv2rmShAns4IuSjdM/feVBmVuZa4lfw7eq9Spbqg?=
 =?us-ascii?Q?qXp5zHmQAIt0cXH1ZlsX+eUCHPssQU0Uno/K9h9gOh34btpbdGVUYUBAK8nv?=
 =?us-ascii?Q?ZhdqfXgahVF45UU6icuR+Ovs4dYE2X0s736izxfvUGFDU0l8zl3zJ9rkY3SK?=
 =?us-ascii?Q?KWFLwOqVch+Eg2hR31drnmygI1sIwCqXRvPBQU8SG++q5+S4m7lKjS8aVEEl?=
 =?us-ascii?Q?bHQ2oxJmisiqROAfJ43RgVDg4vKhH60J90FS5r88cPvsJI3nNKF9UgHCKyuk?=
 =?us-ascii?Q?IayviQP4V/YRwVjUsxZ/Mruf4l2Yz13kh6QvcGMR7QqoKorLPW6P9cXJpN5u?=
 =?us-ascii?Q?ru5INo/GnTlE7pwJjcbITq7q9pLlrYjOofpcgIvRO1Hr4FldlZtEVFABFRYg?=
 =?us-ascii?Q?iA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB8775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62c3dde-8d6d-4b59-867f-08db673758ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 09:12:41.1343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KEJye7BNcWjstPz3vXlmanKFntPXu1n+u/yWz8sXa4nucU52eCFQe4lrXwlyrgy2GVyo6ZqN7/e8n+ekP4e7dPRjyIuzraJLuCvMWrOKeoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5779
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, June 6, 2023 3:04 PM
> Subject: [PATCH] MAINTAINERS: Add entries for Renesas RZ/V2M I2C
> driver
>=20
> Add the MAINTAINERS entries for the Renesas RZ/V2M I2C driver.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2a1ae22c0eab..c64919fc3b8d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18147,6 +18147,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
>  F:	drivers/usb/gadget/udc/renesas_usbf.c
>=20
> +RENESAS RZ/V2M I2C DRIVER
> +M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> +F:	drivers/i2c/busses/i2c-rzv2m.c
> +
>  RENESAS USB PHY DRIVER
>  M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:	linux-renesas-soc@vger.kernel.org
> --
> 2.25.1

