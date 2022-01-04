Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C46483F94
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jan 2022 11:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbiADKGt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jan 2022 05:06:49 -0500
Received: from mail-bn7nam10on2049.outbound.protection.outlook.com ([40.107.92.49]:37665
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229731AbiADKGt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jan 2022 05:06:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzgU1I7t/3JV+3GOX5kPvDDYpcpn8DKEG/F47/XuRbYiZkCZ34/G/ZZ4syXbycqQMNBmxeH+rGWk1xQSKbLXypO9V8pKtWXQ9cKc7WOsHjAl1AL3wxVAeqvMT/TfH/3e60tNWSf8WsHLl/5iCtTpklNlbf4rQyPqdz3kRwspdVkXf1x1Ip9ZvLVqxeKAyz46KW1sF/soq6OHE0IzLhg7+9MFcwmUH6qxVUZGPgtjegbB04OWmYjXIEg0Md84pZdxF+Wxo6p+SjZOjdJp+wlGpEhXgZPzEiSX26CVCDZJsEXnrzTct0GLo+Ok88eoaItYnnNHpCP/+uPEcLVhNVBxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTDdHrt0tpfDd/JktQiDGe5pFCDTc/zVV0snoHutoko=;
 b=MQE70vk7DVmu1gUb1NGlueGVJ+yqCE0pXzlTg925FXQ4o5MP4O93kjWFtsbVb3z3eOUTcaCt8VG+TMX/aLvA3nV1KIYNf872+dpn/udZMcQPBZbJXYTLG/+H/0XvSLqd+VJ0kVml1NSK2aw3AQ/6l1vpXX52N2dc0ySBk5MEP4iQ2099QuvKD5FtS6JivDzIZgKwIRnVvOHntDv8X1UC3mprh/vqrMApCvHU5Jl6xyjaXMprvy7ZKNTQDkl4LM0IeLpf3iFIWb6ct90hUFsiB7RGGqysxI+L1hoohpMLfRzyJoM5TudJWMQv7k7UwK8kglkuZYjo8Dk8cQmvv/8ucQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTDdHrt0tpfDd/JktQiDGe5pFCDTc/zVV0snoHutoko=;
 b=pdFjdIODrlvkXnO73waiPM56ObO7Pbj8RwNOD6HYKmB5wYZoBpLMVGwwzsvS7M3iRGJF5amB08k/pMl7y3gFs9+BzUyB/DO4oN0ity+Z9cAdspUoP5SRBO6r8inEqz6U8iDv9F5rFyNPe7toNZA/en0xVUOFguspRf/HCJu/p9uItGbcjVmK3FADbzCi0Xitxht+NnsdpRbDpfwiNHVyJlPUvs6OGHh5rsmwo0Heyd/kwOLaVoO4QEScjqHb2lnPAtmqET3800lgVjgxHq8CRIbLUmDTud+XCnB/KtnVgccd2gbrPfbwFZGrZcYgwC+ucpl3kz7Zd7xgBR8nlYFR1w==
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN9PR12MB5383.namprd12.prod.outlook.com (2603:10b6:408:104::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 10:06:47 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::1476:9fcc:8d54:394f]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::1476:9fcc:8d54:394f%3]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 10:06:47 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: RE: [PATCH 1/2] device property: Add device_irq_get_byname
Thread-Topic: [PATCH 1/2] device property: Add device_irq_get_byname
Thread-Index: AQHX8n7ghAR0sKU4N0uGdTUi4cpNNqw1MEwAgB1x03A=
Date:   Tue, 4 Jan 2022 10:06:47 +0000
Message-ID: <BN9PR12MB5273EDC94146B82B00763055C04A9@BN9PR12MB5273.namprd12.prod.outlook.com>
References: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com>
 <1639660402-31207-2-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VdXw_XvDN=T3fOmNOWsdfQ_xm2090z9uAq77oADPRcMzw@mail.gmail.com>
In-Reply-To: <CAHp75VdXw_XvDN=T3fOmNOWsdfQ_xm2090z9uAq77oADPRcMzw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 618d656c-246f-49d3-815f-08d9cf69eb0b
x-ms-traffictypediagnostic: BN9PR12MB5383:EE_
x-microsoft-antispam-prvs: <BN9PR12MB5383FAF9FB67C6571E0ECF62C04A9@BN9PR12MB5383.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7zMoV/0dVVoHSBLlOw/f1vL8TDffeqrQnyXu3lbM5iLrcXVDS4ciFp8MxvJM0JnnIiJjAB7u1FrOSwNdWAe39XW8KzwjF/iGhM1gvG/0nQ+oDoUW46ra6nF60xKfEBA5j3FhA7U2T5CBNrcMRVChpGdHwL++yP7UQOkacMxgyTDEEPYusLVt2YbbeqfZAM2Hd+yFFpRTvYH14SL8jy3t2pu5rO90CadTY+a5N3sL2ykH+zfok8o/7ZG6geFdZLo4iTL0CTTe0ezyeaAr885rW7GhDUtgO9BoGZQrakJ2IdqP++MCv1NAYwmHDovqpN3E93h4os0yTU/+UxEhetbMdpHcmE2T3iAtES2ovkwIBUItQJ/Yc4MofiuraRIEa7nEyAsAPtuhz+3k5KVu69A+dMLBDtOeiDvJ/HL5PDq4xD0ulpvyegzgKrt127u6EmwiiQ/OBinWnzNzi8vV1Gj+5DFzmpEVHnvaXkqsbyIUZV7Y0E/b4NdgjuMyxoy34spgmx3RC19sz3ts3a5uJNT62e7t8pR6fS7MfOAS2/mDIN7nLfaLyLzsG9WqJn6fVbbdcjAkzwUk5ChDR1JkOAPPfpvsc41qepSsccRTAUEKIsqPP7aHSPINoQRbwKOkSz7OJADs6+S1caQTzgIPYF5irFp7JymputT1mxuTQ2f+dsfaa8bbZR9iyePX6u2DG9C3QQEDKXiRUhdclR3aXph8YN+2GUatzXDz1pvjcO84Qo9KLTXGh5d33Pd/+hBLMwH61rYy8lseru/jDkGcyRP5k3kQN4WLOYp4W9qO11pzFpY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(7416002)(76116006)(54906003)(38070700005)(508600001)(8936002)(66476007)(7696005)(8676002)(966005)(5660300002)(6916009)(9686003)(2906002)(55016003)(6506007)(316002)(53546011)(38100700002)(64756008)(66556008)(66946007)(66446008)(55236004)(4326008)(26005)(71200400001)(52536014)(122000001)(33656002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TR4wdk0xCqoW6teG48HVWsCp87xN3UBletp01aWyDt7lMenfjKRZ+Pi4OJ+O?=
 =?us-ascii?Q?aAsoGuWAZI9Hpbs6yNOKy9GVq1OdCfaOlol58uJq/WUs9mmPGE7G5dxcFNWx?=
 =?us-ascii?Q?BjljeX/VGyipw2rmdA9kruM6kMIcX4xwwLoaPbI8XyRIyUyLnOC0sf+xRDxI?=
 =?us-ascii?Q?7Y9aXWnEvdu+O2PwfJrC1wL18qeaUKoKYRVTGPkc90fZFRan47oIFE1kribj?=
 =?us-ascii?Q?tnPgV3dW0o4y0I0hjw1PNtV70HblpPcyscEptN1VrgbL1C7HzoDx6yTta057?=
 =?us-ascii?Q?9+1VMGjiTA1w6Tsg3hlUnsRtY+uYlrEws992v4v+xS0p4saXjMgM5qlUYOlU?=
 =?us-ascii?Q?m5gU/FKAr5AiMHnrkim8DxhFowUqwXJhwqLGGoLKBN2L/8qvHtel/LCAQZez?=
 =?us-ascii?Q?GBQu0DKwGqcrrFrOYbi/kw3u3jaQVfXvs+Nnptsp+T6pT5LIIHk9ZHohroC8?=
 =?us-ascii?Q?lIb2NvhH1eSMWgB0VewQjOygnv96JGwbxa4rPvwLikb2RglZq5O9x4qHxFS6?=
 =?us-ascii?Q?89KyXtTvCnkKQzaAm4DhtQWggWsGGg8WtJAwMUhHTRbmhnZ70iuC0XQei9m+?=
 =?us-ascii?Q?A4NrL+wqH9VlWcMjClYnII6wxnS0P9dHr1t43xsJzMYhFToRv20rq8du976e?=
 =?us-ascii?Q?gx0kgT80VSB82VihywkOqDuLfFS86iNKDtivBm+dQIJn7JpJRhGvcorwXPyv?=
 =?us-ascii?Q?KHLbSlzlkfm4CTXdUr0rkhkk4OQqte/Uee4qTpauLdVhhseF/rnnsnDYI+6S?=
 =?us-ascii?Q?SG9VzrE1DYpDT+Cfsz02e/JduYucxcK4N4T6PXrriBPnRt9lqlT3B44r0Lg3?=
 =?us-ascii?Q?wEo+ZMBK/6d0OJvgkSIR4UhOrH22E1yRChsHrm2bQHk7n919F2k8rWTlkNIF?=
 =?us-ascii?Q?KpM5YxNpdJtS9/WzG5F1bYI+HIa+2zT9TtDjzZH2/+2Q7iD6S+hr1qdrA6qz?=
 =?us-ascii?Q?ZjkkcmfPMHmezu5HphhbVXMa1+3T0mmS8LJJE7OjZAn/KrBLiiBZG9TsJdQm?=
 =?us-ascii?Q?2/ND6hCkvO+eh3JmxZS0gelWlicWEtNCnYvPTeZ9o4c9K3XM65RQxxb8gdVk?=
 =?us-ascii?Q?vYYv6axAhdIsAqOFbBwTH4gUiMvblKxU+DpA0P0eh2a2dkOVlwbaXCcFnoog?=
 =?us-ascii?Q?FQt/yUhy9QfNa9I1vP4p53Uwd5kh5W8KEqdF7PT3jR3SiK44BM4C11T0L0qQ?=
 =?us-ascii?Q?9qhSFQxb61nzc4/w9nb2fgeYDB5qd4L2Ha53CggOCkQKXi0KEko4BUrnkF6f?=
 =?us-ascii?Q?1UfHXG4oCURqne/AsqRWsQcU+HWtbWO+A7VYKU9ftgErqcl0vDHnAg74gH8p?=
 =?us-ascii?Q?3HphM0KcKhaWLI6uWF76XIM8qnXocfE1eOulGgXqLbNmRfFJCr3pDLQxoVOE?=
 =?us-ascii?Q?pVG8Vdlt5bO+Cxm9qRQH1B2HBVug4P7JEkrvT55wqCtAYIdDVXNNmcWh3EFM?=
 =?us-ascii?Q?euk/2laHtpPkkqE298hczMyJ3vb1DzLrj3rTY8QO77hZMkPpEQc+JKVrZP+J?=
 =?us-ascii?Q?eVs6YZAXyw/I/9JGr+XO8WIWkg7qXIhOiwxiLm0msaRXWQ+jl8SiyVayF6zo?=
 =?us-ascii?Q?6E0LmjMbxABTY6ImFXNxGx7wTGliw3/Rr+9Qrv84De8crEVcvRMRaEzjUjGP?=
 =?us-ascii?Q?b66ZvJNksn483KEIXIdXqSU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618d656c-246f-49d3-815f-08d9cf69eb0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 10:06:47.0925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +gu2lsJUQ0ujIX/b+Qu8vjHcFQ4YnJNcP7VkArgYV/clK0ij2NEAMBHUsDPat4sWwcJASyo/FMsOZEuW2DKYVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5383
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Thu, Dec 16, 2021 at 3:14 PM Akhil R <akhilrajeev@nvidia.com> wrote:
> >
> > Get interrupt by name from ACPI table as well.
>=20
> the interrupt resource
>=20
> > Add option to use 'interrupt-names' in _DSD which can map to interrupt
> > by index. The implementation is similar to 'interrupt-names' in devicet=
ree.
> > Also add a common routine to get irq by name from devicetree and ACPI
> > table.
> >
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> >  drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
> >  include/linux/property.h |  3 +++
> >  2 files changed, 38 insertions(+)
> >
> > diff --git a/drivers/base/property.c b/drivers/base/property.c index
> > cbe4fa2..7acf4fc 100644
> > --- a/drivers/base/property.c
> > +++ b/drivers/base/property.c
> > @@ -920,6 +920,41 @@ int fwnode_irq_get(const struct fwnode_handle
> > *fwnode, unsigned int index)  EXPORT_SYMBOL(fwnode_irq_get);
> >
> >  /**
> > + * fwnode_irq_get_byname - Get IRQ from a fwnode using its name
> > + * @fwnode:    Pointer to the firmware node
> > + * @index:     IRQ name
> > + *
>=20
> Needs a description to explain how the name is described.
>=20
> > + * Returns Linux IRQ number on success, errno otherwise.
> > + */
> > +int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const
> > +char *name) {
> > +       int index;
> > +
> > +       if (unlikely(!name))
> > +               return -EINVAL;
> > +
> > +       index =3D fwnode_property_match_string(fwnode, "interrupt-names=
",
> name);
> > +       if (index < 0)
> > +               return index;
>=20
> This property ise needs to be described in the ACPI documentation:
> https://www.kernel.org/doc/html/latest/firmware-
> guide/acpi/enumeration.html
>=20
> Perhaps after the DMA section.
Do you mean to document the complete interrupt usage in ACPI
including getting interrupt by index or only the named interrupt part?

Also please share if anything on the discussion we had previously.

Thanks,
Akhil

