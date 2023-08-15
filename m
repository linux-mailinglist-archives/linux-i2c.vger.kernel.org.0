Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208CE77C84E
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 09:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbjHOHHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 03:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbjHOHGp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 03:06:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4636110F2;
        Tue, 15 Aug 2023 00:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0iiCyqpimhwQxpc0CZbpxreNQIgJnxIblT3fW0sxJVrjSGNnQfqT30N0C8+zYWFmv141KU9iGCYlc7AKaSVx5Fpgmp+p4ZBf/KXu34gu8IIl88zkp0EJ+RccO1tdRijH49Yx52f/+hMzAaciv/9m/dVEttXv2ZTBm8NMbYw5X3dINM+0bceAPHSEgq98cWHSJb/y7BX/552SzB+68UPtdNs2ccytRT5g+OKaJgG9OALjW2CQ0FNACmnunuX1LMvuxcgYqPz53voPcJwNMwjhkX9KvdPitngQ6H2WHwoeLdbuoy8IpLrScrmlR+rXQyws1c23rd4FMtdOe+Io5ioyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ms3LRKr0gyON/nmV5nq5t4BmxzcKjviz8cILAoUVn4=;
 b=E53R1FD8mLfbDogW4KB/gax/BERkpC9ujLPjEHB18AQ63yyVdHXZi2hCS+hXejpFiql21g6vzmU8ftElsBwfQA7+VwmNfaCNstmaEKLsvVoe9Ykzrp/s9nUsQ7FO3jD162KxbsLnDArLgY/EbW56hDUb85qLEMAZG4GnxQD/Mf7+XTa59iwt62cVXEKG/igWBhm5F3O6zEmowP7bOJaXiNEp1BSvaYv87HLwX1+iDQr85Yvg5QmvtQyWG7a9/B+ANHKNHhI7ESeArROJ70HzLQikjlXoScuTeRD8Xd3iaTCJl9W1c5FIFO/AqoBcMm6ADuT3SPMGxcZ2G5RcL2VJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ms3LRKr0gyON/nmV5nq5t4BmxzcKjviz8cILAoUVn4=;
 b=YvxdCXAa/dcMtY9oZijFyEUVOJ+Q4aw93kDIw7eGgUPQTciWEqKVZQEt8xCz0ISxTZ7sjN3WDDeIkBLkZ3HZoqMj39TIPTH4Kolgn7liGkbXEit5o1So6w7z3LEXjGRAuiKz7TKrVjAgVL5uStbANfEQSJXp1TXrgcMnFAvbCTU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5844.jpnprd01.prod.outlook.com (2603:1096:604:bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 07:06:36 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 07:06:35 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Jonathan Cameron <jic23@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Topic: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Index: AQHZxu8xqdWpTKFxl0mrPmlP0GQCwa/b6UAAgAADvoCAAVlKAIABqeGAgABf2wCAAQcZAIAB6BqAgAED5pCAAGj8gIABdEDwgAASZ4CAAALG8IAFxH+AgAADBNCAAAKn8A==
Date:   Tue, 15 Aug 2023 07:06:35 +0000
Message-ID: <OS0PR01MB59225D35AB0AF2999D1F60388614A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230806142950.6c409600@jic23-huawei>
 <ZNEFjyAloqlkMWn7@smile.fi.intel.com> <ZNFV+C1HCIRJpbdC@google.com>
 <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com> <20230809182551.7eca502e@jic23-huawei>
 <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNT+NY99n7y3abwa@smile.fi.intel.com>
 <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNZF6cjx5N+ZsIJx@smile.fi.intel.com>
 <OS0PR01MB5922E09340CDCFF54A9A6CBA8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNsez3oWNcT72PGy@smile.fi.intel.com>
 <OS0PR01MB592231608697B4FB0D142CCD8614A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592231608697B4FB0D142CCD8614A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5844:EE_
x-ms-office365-filtering-correlation-id: 59474a1e-305a-41ff-2f04-08db9d5e29f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yg0xsLB5z0aziwLwrBAnh4eex0DxoHNyO7Zcwa67w1jmih47KthpKuCOEbLoLos9hJctDFVY25vATk5esGxMekfH2nDAIBvKJa4smyclV0sbMjog9/gBlLLB681iI1MiSiuo3RryokpPIZLN06MZYx8qvRdGA4iw1lOtTN5bq6+W0Z9uV1kg5kLQH/UsbRbV7p8c1sK3aKLbuSTnxCTrSet1Jf/iWu0Dbg49275OsVgkWlxT8Ch0H7i6KkyunvEf7Wt6y0wbsit9qVUoubGTFFCwOuxmfNG+VlohEXgzkCiQyMIwFuA7Xy1b939Qqpe2OulkDbkYOrFPyP5BcI79FL374NEJOimmWJtiaOTQM2u+wvhGn8tjxTrVSxnAKsVrTz4V3rrM7dh8+58Z87AKt2WG+VFil6ylMlMqX1/4uyuf/+UENrCcU5o3KdAmS/6+9TJeSlqvpXxcUkwtw9/fGqqP5Hgi6Qe7QFCzSm085gGwbQqiO39fKCx8qTT4iaA6yE4rIAu64mT8A4gsBS5q07ur3FAx7zy3HcTXPaUeAL+XWurM5LcG71SbjsMpYLg2Z645ohRnJLIbTgKtyqpAeuED9Ahj6/+i94ak5EYSM/nhymebihMrQqtWwWdE4W3p
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(39860400002)(396003)(376002)(186006)(1800799006)(451199021)(33656002)(55016003)(86362001)(2940100002)(26005)(52536014)(5660300002)(4326008)(6916009)(66446008)(64756008)(76116006)(66556008)(54906003)(316002)(8676002)(8936002)(66946007)(41300700001)(7696005)(6506007)(71200400001)(7416002)(478600001)(2906002)(66476007)(122000001)(9686003)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v4OkxTBho1sspVKTFLRrUXpCn9X+9iNUGheJfC2npj6QZuqeZ5FlrYwKaYRA?=
 =?us-ascii?Q?Qvcx5Gt7VVZMnWFxeBp6rL2CA63NcXo6dREylEGhPNfiqV0QENSRhq5/uCm7?=
 =?us-ascii?Q?P0xqvsWkzsoew6Ck9GLMcz90OaOJWwb970o+5zv9QQAfPAMAXcdM/pWTkMOZ?=
 =?us-ascii?Q?LHYjmQJX/9jtmPYnBWmmsKvebuVpE3lMhDZu9R8GBeg9A7Bt8k+RdmyEjRE/?=
 =?us-ascii?Q?ETR4AAnYpIeF6NBfTAnvsN/WLqcEP+JgwWTpTaUAOpm4dCwrZMQMlb841iS2?=
 =?us-ascii?Q?yF/fKDEDxX0BWpWBtf5CNq5t37v1pu8P6tvWCikNAhg1frphQxs0LVFd7JNF?=
 =?us-ascii?Q?iP5M24PN65cRVKY49qZj1bmnsLYilpNld/a6q0vj5nSxIVVLkSx6y9JyvEuI?=
 =?us-ascii?Q?jqPuyQzPVnwZDUUFyjl/L2jcfO9C0/BJYroyVeEy5TbxcPeHx3aaTHWFeLtR?=
 =?us-ascii?Q?nQmHzAUq8fPTK32goYmN+dS2SQ+6SS2qumLIZMq3pM5LKI1/q3cKjssyfbZm?=
 =?us-ascii?Q?i0mji+BaBQf2WT3GcilLDnIKZgt6zX8P7EcMmnFvis8oFv3g3GaGZJw+wX+R?=
 =?us-ascii?Q?VEJ2NvswgsbBLuN5DvnOLqMf0fBOqySS21a3p9SAbD5oE5DM99KIO5MrI5Rs?=
 =?us-ascii?Q?2uB80z1aF+0tRHadmfw3jHzg56fOf8DTQuEKI5rMgf/rqs384KAuSOafdQlP?=
 =?us-ascii?Q?NNsoubrhPDedfORinZ773Rc0kXTKxyuKFQ7rFUMzNh4kroa7K+WNmuNHzQkK?=
 =?us-ascii?Q?Qq80OunWlV6JRHjuH4qVGnJHWtEM9qJq7962UVlTSomhHPg/2OYwoAKRAOx+?=
 =?us-ascii?Q?5Zx23bI9ccHm+7uBWPlP2/dBClkJB67LFDEzQyIO+6OEWBHKLAUg/Hw/zHSu?=
 =?us-ascii?Q?yNpassjZb2A26uA3GMUKXQeOJkeKliay4iD4WRM4LA/gCl0uq9Gh7S+65ek6?=
 =?us-ascii?Q?eoM5/mgexkGcslNjMRN/GXMpjhSfwBD1FN+pEcjpg4Vppwgh/kyjMgmRAfC8?=
 =?us-ascii?Q?zh/B1TuZVCWOTmDqXJ5BFz/52Lk+l9OLq9cLzUj2JUEN+yd8AARzGvVpkHgD?=
 =?us-ascii?Q?ipWUGzPaZovWAMjKCyS/bLQmYToxAKMOMjtYVmnL3Z/ofMltfU/EW4NmzoR5?=
 =?us-ascii?Q?g1TtqQ3EQ7Al6T54cx2WxdYlAagt901dzPNgpL+vuFdPO7Rl4d8LWFZjRVKo?=
 =?us-ascii?Q?j010tNn9GPW2+Ul8C7ffB+5L/kak/Vklqk4342vfHuixGlh/NPgx1lTn6RZM?=
 =?us-ascii?Q?Ibgqb7SIc0p6I0GZ12dKKtsf7QDEDfGolUxPtFkemretnhBQ94HvkSrhUD0I?=
 =?us-ascii?Q?5uHGsj346DhjwvPCc1J+q1kjWdXOuJvXU4Bwu56oBt2cG7/t2qSFc5vc6r8i?=
 =?us-ascii?Q?cGCB97R6M9zb66OIEjsmnJDVGhpHFT1o394wf3DUyfyvB7feN3O+HBpxqg+L?=
 =?us-ascii?Q?0cpggH1rgay2YeKMMAn6LOsa6U02Pac3cxkHQDu+vPEfx5APSHQXL4Ogu+l9?=
 =?us-ascii?Q?qd5m+pBY8y/Uu+q15KFGV5X7n2vhsS1els0fqkvIuf9THpQ6N+yRn+8zCfIl?=
 =?us-ascii?Q?QP1Mc5u5+A0PlN2RoXiLPcs2C2APRYH2cXxtZ6gO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59474a1e-305a-41ff-2f04-08db9d5e29f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 07:06:35.8716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8KNM0fb+BavHcQMjyT65Y36b4cdwFY3Hhrr/ObYAEr5ohLCerUYe2DMZG4imb7HKAeHcBTEqLlc54hKAPUTmVMVgSieC0gku3d/8Jj0k7Ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5844
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Subject: RE: [PATCH v7 0/4] Extend device_get_match_data() to struct
> bus_type
>=20
>=20
> Hi Andy Shevchenko,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> > bus_type
> >
> > On Fri, Aug 11, 2023 at 02:46:10PM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to
> > > > struct bus_type On Fri, Aug 11, 2023 at 01:27:36PM +0000, Biju Das
> wrote:
> > > > > > On Thu, Aug 10, 2023 at 09:05:10AM +0000, Biju Das wrote:
> >
> > ...
> >
> > > > > > I'm good with this approach, but make sure you checked the
> > > > > > whole kernel source tree for a such.
> > > > >
> > > > > Checking against 16 is too short I guess??
> > > > >
> > > > > drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h has 18 enums.
> > > >
> > > > So, what does prevent us from moving that tables to use pointers?
> > >
> > > I think that will lead to ABI breakage(client->name vs id->name)
> > >
> > > 	match =3D device_get_match_data(&client->dev);
> > > 	if (match) {
> > > 		chip_type =3D (uintptr_t)match;
> > > 		name =3D client->name;
> > > 	} else if (id) {
> > > 		chip_type =3D (enum inv_devices)
> > > 			id->driver_data;
> > > 		name =3D id->name;
> > > 	} else {
> > > 		return -ENOSYS;
> > > 	}
> >
> >
> > It's easy to work around (may be better fix can be found, haven't
> > checked, just what first comes to my mind):
> >
> > 	match ...
> > 	name =3D match->name;
>=20
> The device_get_match_data()API returns matched data, so we cannot use tha=
t
> one here.
>=20
> Maybe??
>=20
> /* If enumerated via ID lookup, fix the ABI */ if (!dev_fwnode())
> 	name =3D id->name;

Looks this will work.

/* If enumerated via firmware node, fix the ABI */
	if (dev_fwnode())
		name =3D client->name
	else
		name =3D id->name

Cheers,
Biju
