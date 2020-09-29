Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21C927DC41
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgI2WqD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:46:03 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:42828 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728115AbgI2WqC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Sep 2020 18:46:02 -0400
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f73b9260000>; Wed, 30 Sep 2020 06:45:58 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 22:45:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 29 Sep 2020 22:45:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDticbb3/6XW0S2VyZKCo6gxsfxNsuZe/KzR/yGpn29M+e/3iBrtyn+gQp17X48TsZy4I7dbC1FmeMIZcUIG+u1NCt961pxyDe3VkqD3fByxRvQleiUiA5/2jKLQ3yHzmJ9C/dNCkObiLaFY2wA3UW75A4PcTLMGrjhX4B7Py8xUbU6LbVwBikzIrtTHxfOBw1Pk9IeRwPmb4LPXpNxHid7NjMVY2id1DHstBavFi43x8k10jzRKOlAm/6I+D02A4BvjnEJbdhsgt6Uh5dL/8lAiC6+N7uZJAFowNMILRpjnvccCcHCu6Ng2GCGr2InUwiyEOtImjDQU0Fj9525RUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BUcCvvJH8rLhRIHqrQdWibSBoDI+BosCPUD7+We9Xk=;
 b=GmEzg/gfXn4k11mNAfa2yS5NkKRcH1pRErE/tbqoatj3trx0N2CFsj6ipLBh97e0ne2JBo6WXBIl3XEXtHd/M2SINPGCqBwdTQVNnaSlyus3FyFC51essHdR0eEJeG+BoOVerOju9PayDdq2Jr9OJTK5O0mwzTFLM2rEU+DEVSUQIMK8lUe1hBK0Yrqjg/hFbFTpdtjTouR2e2lSs3mUQ3Acg07zttqPKP4W5MMXMkzUg+a1AtQvMRaVb/OeI7Mmzwu66xGLf+U3KlBrUrS6fduM5CAhDsPFJ+76Bi8S539dp+cTn/GeHIguy7u9g8fjajA16q5LwGQnqQ3xRfka1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3055.namprd12.prod.outlook.com (2603:10b6:208:d2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Tue, 29 Sep
 2020 22:45:56 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 22:45:56 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v11 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Thread-Topic: [PATCH v11 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Thread-Index: AQHWkTLCvB89D0q+REKLlisH88Nxu6l8iR2AgAO3SgA=
Date:   Tue, 29 Sep 2020 22:45:56 +0000
Message-ID: <MN2PR12MB36160C5BC782D9AF3A017D17AB320@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1600804577.git.kblaiech@mellanox.com>
 <69651f24de181c7ea766a41bf7ac7a2539368ee5.1600804577.git.kblaiech@mellanox.com>
 <20200927135445.GC7298@kunai>
In-Reply-To: <20200927135445.GC7298@kunai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e2af79d-01dc-4254-3c10-08d864c96db2
x-ms-traffictypediagnostic: MN2PR12MB3055:
x-microsoft-antispam-prvs: <MN2PR12MB3055989C70BE1AE5CC92A8D8AB320@MN2PR12MB3055.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L4POV8ObiExM4IEJx0XWES4Li/hOQoqlZevc0QslF7+3dQaDpXHFrgqDQ6QSA+hqtb69PkRfAAUy7NtmzM/lETkaHTjk8SvI2+iBJdMiCVgKsDY7cAuyehhDtCglYxWPpPvF+2ZyaRV6srWOVao/xErbBFDgtbQyZabvKnQaJrKdMnL/PkThLiLkUQ7Q5Efj39NwkVJYYQ53yxR3Kkfz9op6hjXT0cjlkiG5EUxcWytPlppObEySNtm+8q3dSmJyI9xHgnDqeEGCaug907Zkg7ioZX6DMCd1hSRHguk77PRySc8WcstuykPOAlYLmex595A3RL7sDW85l+/VXKLVlU/2Na4eG7Ohwf/kBZxoYgvnOZ1CLIrjR5JoEpQXbTwj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(366004)(376002)(346002)(54906003)(4326008)(26005)(107886003)(53546011)(6506007)(33656002)(7696005)(186003)(8676002)(8936002)(2906002)(86362001)(9686003)(55016002)(316002)(76116006)(52536014)(66446008)(64756008)(66556008)(66946007)(66476007)(5660300002)(478600001)(83380400001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Uvx0hcVpVr+1BH+UKeQ7y8TmZPhcPKSkT8Xw6YpIvfUB3MJo3Rr+Ki3d2MPJAuKlB9E0g2b/rQwWfnqeB+q/LBRxV0rhwTsgCQEG71tIoTxb2xe1yc7em5DyNXu1tfARJmW474pIjJtJ0b8wCTkExZeA0f7tvsveACmDI4JEXyzrn2aq3s0TSIha3bNnZdnJWUYbfV/cmLw0d8eYmOy+A02Sm8QE7ny5EcxZ9iPcyP3NZDud3HJxVx6ujApbyXpJCQ+EEeIwYyigsLRiShLGG7h55oUxGF9/EelRps+nsOIV36sw5eVislRKE292DWnhPyjYjJ09J6wCqCcr7LwhNNx7FWA6quDx4EVQezXNCu920ala0E2m5kDbTZJ0lVAWK/nRA191/G5ydSmFsHFmU+452EbVBycBOXDqq3bvjqxlPmy+j9hhBGH0AA4vbs3rdl4ZxNjeFAqdRY0Q73BBdb1aqiLFQrJ+ocFyjCsvzKdwgqdQw7JTdO1VUpm4L8tt2UaoLKEw5BhlmhSnnbgO+H53vcRqeCotmIkS5yZ6Y/XbCu84MvRjrGCE6zqoOPYxCvluKKuh5YPo9g/Insd/Im4ZUJwx7uSo4SzgiN9ZkHbCKLTacOjcQibSqpMBreQLdWX8PKB4RY9dY5MMP/gM7A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2af79d-01dc-4254-3c10-08d864c96db2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 22:45:56.3797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GE6ZA9VGAJ0gv9doQXWe/yfTiXE1OEAEg7KW5TZGPi29Qls35q+Y27a5p9wJkKAELMo15bldbuZD57W6AWS4gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3055
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601419558; bh=1BUcCvvJH8rLhRIHqrQdWibSBoDI+BosCPUD7+We9Xk=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-exchange-transport-forked:x-ms-oob-tlc-oobclassifiers:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=WAb8xE0B4/q5C15VMUKku2/Dkg5SzgogSxkaolZvnqM8haWy7pDcmjXv9JHeg9g0c
         CyBaJxL/gKcSN1r+vkemb4VoYFnqiPTGCPO077iG6FM7goUVbjxs3TgTVl6qn/t2wt
         aY3TNEVJ269kiWRQTe2mfh0hDdhw6s4HzFUZ4yvB7hI8z7Wc2ag5mAP+5KfHNbW+A8
         u/vwYQxQ1gjKGlWlEUrLb9GN/ubnP+uHtWQik6JycuIehETb1vczbsCl6LaCTw+Zza
         0zmPpgqtqTo6SmN80RrLYRDUuLpeAyA2LWQvm1trgm3+UbVw/SzveXEQ52tPYEjln8
         Lft66wwiuoRCA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram, thank you very much.
I have seen that you applied it to "for-next" branch.
I 'll address the build issue as soon as possible and post a v12
with the appropriate tags.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: Sunday, September 27, 2020 9:55 AM
> To: Khalil Blaiech <kblaiech@nvidia.com>
> Cc: linux-i2c@vger.kernel.org; Khalil Blaiech <kblaiech@mellanox.com>;
> Vadim Pasternak <vadimp@mellanox.com>
> Subject: Re: [PATCH v11 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellano=
x
> BlueField SoC
>=20
> On Tue, Sep 22, 2020 at 06:49:37PM -0400, Khalil Blaiech wrote:
> > From: Khalil Blaiech <kblaiech@mellanox.com>
> >
> > Add BlueField I2C driver to offer master and slave support for
> > Mellanox BlueField SoCs. The driver implements an SMBus adapter
> > and interfaces to multiple busses that can be probed using both
> > ACPI and Device Tree infrastructures.
> >
> > The driver supports several SMBus operations to transfer data
> > back and forth from/to various I2C devices. It is mainly intended
> > to be consumed by userspace tools and utilities, such as i2c-tools
> > and decode-dimms to collect memory module information.
> >
> > On the other hand, the driver has a slave function to support,
> > among others, an IPMB interface that requires both master and
> > slave functions to handle transfers between the BlueField SoC
> > and a board management controllers (e.g., BMC).
> >
> > Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
> > Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
>=20
> Applied to for-next, thanks!

Thanks,
-Khalil
