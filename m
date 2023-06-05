Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 341A1722213
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 11:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbjFEJY3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 05:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbjFEJY2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 05:24:28 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7B3DC;
        Mon,  5 Jun 2023 02:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+Gc7gB+gjKvuEAfAjScVsopVhGdnkO1tsv1st/EleRRR4nO3d5kbhvUTZqtIw2xxw4wVXFpE9airKRDgPqUvCIndtxxsnefpfNh+CGEAC3kTWWW6sXU/yBodY/U9mNeYlBZhYOFA4Sum93aaL8+ON4u5m4h8F7wLsu4uI2zYZyDMTH5mS0sIsJCbFSB8VutVyeaJvvrxit/PLYS/wZd6uRi0G/mX0eTZnqGF6bNW1Tm2G1tPvqukpnEVer4M3B/p5aXQg9x/37KL15gpy2akSfabd8T+5FxfU5exh4JutXNXz9+yDlY+sYE/QYmHvzfu5lChPR35YdswNLypqFOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOayD5u5PxvJ5a0rnyRCpGfkomynk4PtKOPZHe9847I=;
 b=GPpPBEczx4fC1PRwgWcJm78o7RQyEjDEvxyOg+DUOGNJs5V/PhWDqUwGX0dODOPPV22Sdctv0lPJrituY4YB9Ca4VRCIU7uqu4wZfsVWQnbTlZvKhXGEQQe2ug70Th3/AcdqL5r9zsKUusiahelCC56vlNfWrYTxf9WTn6vqhTrIJH8/wPxtxN8u+QipVG3/Cnk2j3rmAo5t8+EWcGs9qd/8ph/TIHKuD7ZhF6krnLL7p9q7wgukywezlrIFsbQK/3I/A9HXw2npKyRLV8oFpGWo5n6L4KFgInRcUEFcOjudO6bbJhqwJLSN+jL9MhjZGgWwDbeZd8q5cSKmU0c2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOayD5u5PxvJ5a0rnyRCpGfkomynk4PtKOPZHe9847I=;
 b=VZteNgnDUsa4kOq/uO03F2a2+Qt4lMau4f9cvJyb7ZeW8VRKF5UiuEH7s4nDvOeCSJKnZ4Tee+6jJ9VvGvh5E051QjnGaXS5vJLZS+ZjDwAhLIOt+nE3etw7qwpX92zfZ/TfyD6UlHw5VbfbDCisxomAahhAyIzXb2AJxs7pZLg0AlS2TILA1ae2FBQXcEq8qkPfpOmWUZ1BMS5/Lzq1zVomV/+zwFJLsLQO2h29OLQbUgM2CaPB0b8E4arDMOdUu5SazqqGWDeo95c7XOXeEkdh+pMovKeDSOGkv/HmSj2JG+DVRv/5GYSRwQnEU0osQbLmhaUYQBXJlJl7e7kBpg==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 09:24:24 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::b003:6a7d:b1a0:43e8]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::b003:6a7d:b1a0:43e8%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 09:24:24 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Subject: RE: [PATCH v6 RESEND 2/2] i2c: tegra: Share same DMA channel for RX
 and TX
Thread-Topic: [PATCH v6 RESEND 2/2] i2c: tegra: Share same DMA channel for RX
 and TX
Thread-Index: AQHZeQVjukkoZDQlT0ytqbLKguU57a98G1aAgAARiDA=
Date:   Mon, 5 Jun 2023 09:24:24 +0000
Message-ID: <SJ1PR12MB6339D6C3D3C489068C40FE94C04DA@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20230427123915.38199-1-akhilrajeev@nvidia.com>
 <20230427123915.38199-3-akhilrajeev@nvidia.com> <ZH2a+S/1yeV5gN07@shikoro>
In-Reply-To: <ZH2a+S/1yeV5gN07@shikoro>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|LV2PR12MB6013:EE_
x-ms-office365-filtering-correlation-id: ef0f1f29-ea47-4746-b0cc-08db65a6a6eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Vur7c1JWKn6m4KmAiw0l+dA9YhrFlwN2G0f2/7AhjykdroDqAsVSv6rcY2A/y9cGcmonCkEB2v99qT1Ln+SB/J4XzFOcm7N/mmccpu7y4KZ9aB/PhfHnDb7thov4NfU4R4NIyWHZqVXrDHEYMoZzZ9R964qItf9JKp3/oGD1uHnxLDurchb4AlWlq5mwdL/VTdpDDKlVhOOQo2cdRQ7m/xAT+l4HQ5vVKDpkKxfwoOtWL6Qpt6ekqHEvI7m3I1J5PAE3FEAdTgTb7UzOgwF/AbAQWbSBnEribhABEOaqqT+dSPoSvvV9LcjsDKWVysMWBr3EIQvskeC76yMxsIV9EpErxzW+2MdRAPgMROrr59xKzhMJcDpj15/yU2132DNIQvQSICFwDte/y20ndHsINGira2vWKtme5SxIFx1Vm1S3fhXA64q87ffh6s8GG8arWae41cPi3+NYxed5+gC6yFLRv1WosbjfX1JBfWzQ7P2V2vP7G6ZZi1+zsHsuq6r9LR/4Br8782NiuO1obnsQ5tb9xNdAzkJzgGGMn2h/76PyQMAHKl3Vpo0WrEiMdvCupeYoXBQeerS9LenyIouckGoSFHd34PvyFbfTuJXUR3tIdDfom7L6Z2HPnuVVJeU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(9686003)(6506007)(33656002)(86362001)(38070700005)(122000001)(38100700002)(186003)(55016003)(41300700001)(54906003)(2906002)(4744005)(478600001)(64756008)(76116006)(66946007)(66476007)(66446008)(6916009)(4326008)(8936002)(8676002)(316002)(66556008)(52536014)(5660300002)(7696005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/S9Xinqt4xCKkozrC1r1FiiBmDsIigFsGadsqLoewG2NKxdMHviBiUWiuabn?=
 =?us-ascii?Q?xusdDEttzINk1kUwrVjBkizGglSuMJWD2+EItmixxDAc+9eYdqPKXBPEyqzV?=
 =?us-ascii?Q?4a9V87czf2RLi8N6dFe9CwBImDc2wqQvckpyFk6BL7XHydEZcz8zmUUD5D91?=
 =?us-ascii?Q?87vbZnQ5NNIVfqXm7bPgV2TPcw9FK63PJ1oQGFs54C25itz5sz2uoQsFxyf4?=
 =?us-ascii?Q?5CljEcamBsE0DBFwpCufst8cI3itp9Hyu25R7OOgix82ify1p/+dP2yNq2w/?=
 =?us-ascii?Q?zrYsgmV+LLsggjmwJeBEDjM/08Hzti3E4Ct/ng3Zw7QCX4g6C9+UVvYHBKUc?=
 =?us-ascii?Q?EKfoXIBPhyfzI4Sx3idmQia8XvIFIqWqDZ3hr6CfbRjTIvE0b2ERtckj1j3K?=
 =?us-ascii?Q?Sk+k83XQj1I+sir57NVTpE4Letn+TtSBd5UkRhbi7BTMBCD1GoyQ6XHK4oMH?=
 =?us-ascii?Q?lncXa+8UVgTyXTZxb9XWNnzhKv+avzYDglC/9IM4pK5Oezr4h6bHB0SXRmNt?=
 =?us-ascii?Q?av+K71G9S5hEj0t/PtTxZQGKLoPKnct4JEihPOElaKeCxGUHvLFtoiuBreHp?=
 =?us-ascii?Q?ibrKxpZlhUsHYYw+KMEiPt4GokjBWo/GZldIv2n36SHnxOT08tQoYPKEGTGa?=
 =?us-ascii?Q?VO8thKBT8U6HLv8oHzjUhM8+xDzT25Hcg3TCbA38vQtzgKyoSVpFOP+Z4sHq?=
 =?us-ascii?Q?hjK+NOeErnug4Q2ir29XABzwa/MJPhc/7iBUwz0hEHC9QRuAaW5M93wdNMGo?=
 =?us-ascii?Q?GROzCgasrMANOpRHdSkp+6IIHllGK8EJCfz9Hfq/m9nMTtsgdxBdpRzn7pys?=
 =?us-ascii?Q?bbKNjCQoxUeg8oZHKhQarRE95ygyem/Al+2vkNjqsTUO4Aba6v3NpTKaFWm4?=
 =?us-ascii?Q?73XymJrNZH4Xpb6Rb+8/1emdBrDThgM6d/6lxO8qCOYInk5ceHxdX51eBz8a?=
 =?us-ascii?Q?50agNzFoXVotkblCEr+xSU9rNomfl/Cz2PRNSzkad9jHPJSpjGwxntR5Qsih?=
 =?us-ascii?Q?R7CvKkO3f9WBJBRqOsexjOSS0xROwZ/uIb39Q31iXh1q5y/uZxW372wipqiF?=
 =?us-ascii?Q?4U8yK5uyBSK4gdIVLaYrGct1dnmuUZHEUM+joaNRfhWHZS04sBihpv7wpx9B?=
 =?us-ascii?Q?msu3gs3q4x0EPj424wL6sezR7UR05mtQHclRasg1lRnXgVxCS2Y0yeTdcc7O?=
 =?us-ascii?Q?GEWZoF3J1Lu0ESobb7yHy+fQXI8dM4A+jXXJRqkz3OB/FGdHm3OxljkbiDm2?=
 =?us-ascii?Q?YO/fuLz+ImE+N5aqQJ4vXlhjjf2DQkHc7Igdz8Tp7KXnuzHOMvnAKIxuFLq9?=
 =?us-ascii?Q?fkFNqkd5//oupH+ltEbqArbrUb2bsWq9wL0Facv357XYdHzBXGioVlBcGOVn?=
 =?us-ascii?Q?FohTsXi54ws4XstSwJKsTbare+bHQyS6E+5ZQZDIefVv4Vn3VFiFjLRcJGiW?=
 =?us-ascii?Q?is1KESMaBidJ1vTMmygTnRl9XhtAz7UHYrtpoduTLI229Gqrrxi+J8Zt5ghK?=
 =?us-ascii?Q?NFE8nOAiQHh3DSlYV0QDc8aO9NW45iwj9YuQ8UhoRxNnEqhOxEmgupWPLVV1?=
 =?us-ascii?Q?hFDLL5h56Mso/fd+NA+H+q+3XSJDEMopnFepqrnjKzT5SreiAYzu65YneUVT?=
 =?us-ascii?Q?YjVajJdQHjwG/ZJmgCzqRC3ZfBv9UXXfX5G83wVneqbU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0f1f29-ea47-4746-b0cc-08db65a6a6eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 09:24:24.1912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LsiyJWPPc8QriQYmcJ1kzOGQJ//qgVVXjo5VCjt7jlmVlGtmtfRDkypsATzO65gmM1jkAnlzen98zpu+QxShow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Thu, Apr 27, 2023 at 06:09:15PM +0530, Akhil R wrote:
> > Allocate only one DMA channel for I2C and share it for both TX and RX
> > instead of using two different DMA hardware channels with the same
> > slave ID. Since I2C supports only half duplex, there is no impact on
> > perf with this.
> >
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > Acked-by: Thierry Reding <treding@nvidia.com>
>=20
> Applied to for-next, thanks!
>=20
> No, there wasn't an issue with this patch. I just needed to make sure
> patch 1 (which was for-current material) landed upstream to avoid merge
> conflicts.

Thank you :)

