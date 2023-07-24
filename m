Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3D475F595
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 14:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjGXMCf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 08:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjGXMCe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 08:02:34 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF21FA;
        Mon, 24 Jul 2023 05:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDP6nZd5B6jKdmsE0asuPqv7xFQGUXB+lIx6JO2jlEBGszCjF1IpYUrW21+tdPni4KJWhE6nKGtVjZ97AtNVBilwe8HEi19cS8PoXDguk6Q4QbLdvCdvJbbyGV+elpRf6r2w98tBc0LJ+fqamMFUlBRRgCjMylPAV7ybHx+DD12i6I5x/ajRAiGUoURK6eC0GCwHxbAAwxyql2+TJ9g/qvsbB66onRccicg+B60hR03NGldnInytVsHiR1Bhw0s6DxkTJh1tzmMH0SmVXcUB9tpZOD2daXGWe3a0nlazkWNuKdcArhplK/O01tYtCfOmxzboZtkKPlS3AtBIGa3CWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaMd92pmHeHEHKE9MzwlXdlMr44CZvKBOxgssmK930w=;
 b=I74rm2RCXhCMHhix9engflxB7hNHdX+LgcFbGx6opMLG8jOgqTHwMvg4W3n8VT1f4MH1OJL1d3ukTBn37vSbmIQZcqAgg5AeRX+ynTjvusum2iYYkFPxGpKwQgYC6kOQXKSnoONya7I2noDtR42s9HRV5LunNw2iaYw8KDRNkMIG/nV2qSL00RRnazRdmHmILyCKnPhNzHXzvTleNsOaCv8pljQX2t2903ixxCzEl+X5LS4cuzGmzhlkC4/k5I+SaPyF6CkgV9q3tOzVvcxwBbXQp5XVTk9Cu4Byk2oFb55MY0H5PtY0gUMkK7kTr87yazZTr58R8ntdDqxDHJsYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaMd92pmHeHEHKE9MzwlXdlMr44CZvKBOxgssmK930w=;
 b=Axs30eJvUXNyGPjTzqQSpRdYvUQ9dDAMZsJCkOBrMKvfD+ZqfOKuLg5CLcAbclqWWCMZz8DTqgpiXnUetNuTKzkspC+3nMnnCBxB8cRytEjQfPeGwRzNKBiM+ym1Gjzl6JR+stcGhVmUlOIHVMUxwUJBrww5NUwsDTwap523nmM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10716.jpnprd01.prod.outlook.com (2603:1096:400:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 12:02:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 12:02:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 1/2] drivers: fwnode: Extend device_get_match_data()
 to struct bus_type
Thread-Topic: [PATCH RFC 1/2] drivers: fwnode: Extend device_get_match_data()
 to struct bus_type
Thread-Index: AQHZvUDtPDEdTtGE90+pXnIpqvMbOK/Iwy6AgAALZ0A=
Date:   Mon, 24 Jul 2023 12:02:27 +0000
Message-ID: <OS0PR01MB592287A0B91E353663FE12A68602A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230723083721.35384-1-biju.das.jz@bp.renesas.com>
 <20230723083721.35384-2-biju.das.jz@bp.renesas.com>
 <ZL5bH10uJWDe2SPY@smile.fi.intel.com>
In-Reply-To: <ZL5bH10uJWDe2SPY@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10716:EE_
x-ms-office365-filtering-correlation-id: 86cb13df-075d-48e7-6f86-08db8c3dd9dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H6SUYWejoSZMW9iPpxDEez2yzGMZSefVI7ILfmCTOlndVvINVtbyXTc3S3j5vsmrx7JGgzs7Z9w6+BCnJ5cXdCSXh96uTHUlJd2BDrWa4R1F2SxE3F9L8WbL+RR2bzwoZ7UedTzgwoEmCoNtlJobj4rxLr0UARuMQQjBjcgbSsFxpILWEXs6/Z0fSfYVgwolPqA9iEtkEyV/9LVqa0d8UJh20sQfYME8oaQ4zp0Ex8QxFJFy2i2Pe6/qn5zE5jmqHNhyqb9h3vS6AfxKS6VxdPcjFj71dkxDUUDWGC2vGG88Sth3BzSEzoBGmGxrohD6Zgs/K74V5lJCJAays7gFD3Zw4Ih8zcnWrYqlxwARFF62u3eez0VTeBBrMre/515VsvLUiWtwxI5xS3hcfI/rLZleq41nIAMYMkuEt7b1642oUHltrBd3v8yXIDfE+k7ZSiMaNpQx2HEehFNxo4hnQkE0xVNwHFTJ7A598xJwuHMWVqrMK1HsR09XxxcKgwGft6GwVcnAfMigR13k0b53MoeXtxBKNPBHjxqtliuedy9woGmr8dwcqjtqsneRvI/0wEKXCHjJBqryWF8YTVnJQINZdSXtfi30ZOREXcwBMAinSQOetj1SXxHDEWfm/B405vbqVUZrUpH297M0zSEqiw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(38100700002)(122000001)(55016003)(7416002)(8676002)(8936002)(5660300002)(52536014)(110136005)(478600001)(54906003)(4326008)(66556008)(66476007)(64756008)(316002)(76116006)(66946007)(41300700001)(26005)(186003)(6506007)(71200400001)(966005)(7696005)(9686003)(66446008)(2906002)(33656002)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qX2aGSAErwDDZSo44up3okKQQfmC5bT7PuzbVWJisjoHVRdRFwvVZORbhyTp?=
 =?us-ascii?Q?o4uNml0jzDrRN5XxgdFejhcA5JqV37Jvi5S9WZ+f8PULiivtqLfYdiMdER07?=
 =?us-ascii?Q?ln+sEmR60ZjnMKHUYrMeTMTztWwn6cDRBJkhU+sb5jTgq41HWmdk6weCSzvB?=
 =?us-ascii?Q?JXApjHrgh7tnGKc0htmINnr3cfIu9NaFmsA+GU9bRDpbTP6xMV8C0CMkBWRy?=
 =?us-ascii?Q?J/EGst5QNYErp/bdida3hz96UEA7bsQjEjH11glhKFbIYI6gku16qpU9ytt3?=
 =?us-ascii?Q?Q8RF9SxcaLhB2XwgdaPMEPsd8kT/sKJNNflKiC7rd39adMAxM/Tv8fjV9UKs?=
 =?us-ascii?Q?S2WCnA+h/+fqiZsbOPAJKyevoWC8yuoXcdYGbbOFgfaPrCBKRvm2BcuMHFlD?=
 =?us-ascii?Q?vQRXrZFXZkOpPf0o70WxWE7+zZtykQhNPPT6HMt9FDg8kgrKmuT8l5mM6BiU?=
 =?us-ascii?Q?KmSo2S84gtwW/SSHctod0k3zLPuKXMzJPo+FSS5Yxy55AXNwKh19czhcPfrO?=
 =?us-ascii?Q?zUvh00XLsUg3K1Xw2DmAWRMJYSdLb71U6cvCEL97bnkktdB3Jv8x3GanD8I1?=
 =?us-ascii?Q?fEuj2IOB7QQodfwazbXPECoij429SAXqonPbIWZJu46S0Fm5gc2tDdbG2c0p?=
 =?us-ascii?Q?V7A9WlC7ruuS/3dZqSpvGB8TMK9JLty+WLmQamJdwuMsJrTkzcE/KkCGdBti?=
 =?us-ascii?Q?As4NEC4ZOVIMkMaQvKvxhi8wnm4DsN0VHDMmudo9xxENvYWSJGoVfRe7N+TQ?=
 =?us-ascii?Q?3zkmFWXFDLlTsYXG2cVq7Xkp/j3kW6dLVjJwHbKpH3vO5a59UIjeQ5JI8fYJ?=
 =?us-ascii?Q?unZd+kMf3M4r8xFn8csd10Qf2XJrqD/aUqPXGk5NbtD7M6rUA1IzNMmCOeoQ?=
 =?us-ascii?Q?ioMKXwcOAoBOJfKfB/jEVkAWn8d39uoYhJViID2ojvWYc8pPPrpqFgGxHT3x?=
 =?us-ascii?Q?8ThpNSc22K8RBhJ0prK72uCIZrqUAjhIoImQUxhZooswwCu+y3U1exia4OmN?=
 =?us-ascii?Q?9xmAVkQaD1yYuthBtsUtW/Nkldz0Mk9y71fAeq6SLXqktzxvNBXhywpdjACx?=
 =?us-ascii?Q?GMw/AdvRIt7VnAm6GT+YEmf/k5f3P1ZQ0jf+3EdmVAccxtti+Qfx1dYOq8cf?=
 =?us-ascii?Q?hUGD74iKJ6KT/+68WX3d91t38IiYcqKc70ovdwxy5Poa+Om7txjoNX5Ka5bT?=
 =?us-ascii?Q?JNuqKAWaqZWBCiTbWsexpB3Y0QNqk8ZnWNQx6bLRYXcpPJ8bZT6Xp+MeQ85K?=
 =?us-ascii?Q?0OwF4phmHBGbO9UzWPJ5fv+d5nlWPKrtF6KlVomNuVN7M/6E8f+WrDkQ7O/c?=
 =?us-ascii?Q?ksIH6TR/7oLF42Mj59EWqIZv7MxCFZubWpWr56q9APjexW7A7ktfOq45AOcf?=
 =?us-ascii?Q?AnkDmIk2SywhMrH01DRkCS+T7fIRvPri98O1SzE89fl+Ob5HxwgLatlTwt3J?=
 =?us-ascii?Q?ZLr/YnIwMiY2mOcVCPSSsVUfVbex+g1pl4X+jU+zD4LUoN0Qjzix/Owt4Fas?=
 =?us-ascii?Q?qeTRu4AFGmeCzzXcjrxy3u29hWuAP9jeTRZRhzgdzYejjiCIDNQNI1hwjo2G?=
 =?us-ascii?Q?S0/gtLUmhQ6yr4q76PspBEbLN1NJAdibN0CJPu7o?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cb13df-075d-48e7-6f86-08db8c3dd9dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 12:02:27.8463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XFewXMak2pCkejC316rWJlPedR7yWvsIioeZwFVHmryxNNn3uga7Vi7WXl2m7XCC2qGqmA6qf8C0IkA56h2jhVVp44B8tI6GJY+CXt/RR9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10716
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

> Subject: Re: [PATCH RFC 1/2] drivers: fwnode: Extend
> device_get_match_data() to struct bus_type
>=20
> On Sun, Jul 23, 2023 at 09:37:20AM +0100, Biju Das wrote:
>=20
> Thank you for your contribution!
> My comments below.
>=20
> > Extend device_get_match_data() to buses (for eg: I2C) by adding a
> > callback device_get_match_data() to struct bus_type() and call this
> > method as a fallback for generic fwnode based device_get_match_data().
>=20
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>=20
> You can't just throw one's SoB tag without clear understanding what's
> going on here (either wrong authorship or missing Co-developed-by
> or...?).

Dmitry feels instead of having separate bus based match_data() like i2c_get=
_match_data[2] and spi_get_device_match_data[3], it is
better to have a generic approach like a single API device_get_match_data()
for getting match_data for OF/ACPI/I2C/SPI tables.

So, he came with a proposal and shared some code here[1].
Since,I have send this patch, I put my signed -off.

If this patch is accepted, then we can get rid of bus based match_data.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2023071713=
1756.240645-2-biju.das.jz@bp.renesas.com/#25436207

[2] https://elixir.bootlin.com/linux/v6.5-rc3/source/drivers/i2c/i2c-core-b=
ase.c#L117

[3] https://elixir.bootlin.com/linux/v6.5-rc3/source/drivers/spi/spi.c#L364

Cheers,
Biju


>=20
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> ...
>=20
> >  const void *device_get_match_data(const struct device *dev)  {
> > -	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data,
> dev);
> > +	const void *data;
> > +
> > +	data =3D fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data,
> dev);
> > +	if (!data && dev->bus && dev->bus->get_match_data)
> > +		data =3D dev->bus->get_match_data(dev);
> > +
> > +	return data;
>=20
> Much better looking is
>=20
> 	data =3D fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data,
> dev);
> 	if (data)
> 		return data;

OK.

Cheers,
Biju

>=20
> 	if (dev->bus && dev->bus->get_match_data)
> 		return dev->bus->get_match_data(dev);
>=20
> 	return NULL;
>=20
> >  }
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

