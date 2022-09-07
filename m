Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADD95B0F52
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 23:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiIGVm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 17:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiIGVm4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 17:42:56 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC19C32DA;
        Wed,  7 Sep 2022 14:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/IMA/HSZKGSYPLvwCrFhclloFVHisPgLkhrSKMpjZ0hbKOHxczTo9mipAqM9tFCbh4gwnfnsHGnX1tZrFbuJeTIGA47VtTtLBP1hMG+86t698jztn0rncv/UszhWIyGamRQaVdPFf2iIyltUB7WKZ8Uvt5nbmwU/3/BA9EwcN5zUo3Bj7AdO7K9PyzJDntXUKW4VD/TuJj1eMkRUa9YIpZFpw5RMJrMeUV7q9mpO5rBYZJeivLVaCJiIGPAbToveC0OaQsLXfJSjZRDZn6rLYn/25bfogytl0woLNfk3DQWaXvvEYoFzB7VFPY2qkWfT991sRzwAiYa9rGkimHcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlk3E9AtPzzZwEZD+1qdxPKt27IlZ3/KmgicD9LibZo=;
 b=CsrbkSqym5iN2Utw7hwEiD/AxIldK0PikCUXqj/hcu7ssv9yOAVHHBBCy6nBO6YDrCI85+3K4G5qH1HSQi+HROP1azUAIizCZ9TdsBPsSOSyepwR2e0UL+3MiYXz9JqIYnCbAd1RtljE+EBu+v04wCPN7NJITXUCAYi+ZXaudDyxinfwqSzlDBou0d8u5C4DZZrpsO3jxxy/I3/+wFQpZvLl4TMw3jI5vpg/tsdUigEafpU8AZBwuKrewfFpLZ7nQM/SOmzaHX1Ah701bI6eluapfEuuhWNqKWjjvqt3XGkBXXdSzI8oTlYyZ41YARbX+/KgL0liju1YBORsb61G9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlk3E9AtPzzZwEZD+1qdxPKt27IlZ3/KmgicD9LibZo=;
 b=VG9/Zi76Qj7allYoJInsJKOPRI8MamRG4O9WleTj2nip5NyMquHyR+oo7j1ER7mBU6JiL3aIxrSn5BoHnhw9PNhUCCoVRuhg7lc+7WIE4KpXkY0O7VWHP/4+61DE2bJbTFlzkO1lFmiJ1/u7mULV+2mpIA+dUIynGaBsy/dkzrYfoZQgaLcigaSrVe8MV8qjlI+TA9T+I9eAGatJzjbmIdkACBc4BYxtPPqq3kQMS/1z2o2HOT+liTPJ7r95lZ9pWG+5v3QThEkOin/tS9tDkqmZf8UrBQVSm6sBtzaUol3EHOEtUNIUiCyLWnwUrTrbRlBq/CNbZKOPBDkyl+w+dg==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Wed, 7 Sep
 2022 21:42:54 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11%7]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 21:42:53 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "robh@kernel.org" <robh@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/9] i2c-mlxbf.c: bug fixes and new feature support
Thread-Topic: [PATCH v2 0/9] i2c-mlxbf.c: bug fixes and new feature support
Thread-Index: AQHYtmFspLN7eEXzUE2AAJMrZ0F9+63GXGUAgAAEL0CADjbMAIAAAHDQ
Date:   Wed, 7 Sep 2022 21:42:53 +0000
Message-ID: <CH2PR12MB38951D3E64BCF82A2A0F3FFBD7419@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220822195725.12656-1-asmaa@nvidia.com>
 <Yw0fNuOWtJbe/OT1@shikoro>
 <CH2PR12MB38951B9B8F189E1B991A7950D7769@CH2PR12MB3895.namprd12.prod.outlook.com>
 <YxkPKpPNXg8wEIDf@shikoro>
In-Reply-To: <YxkPKpPNXg8wEIDf@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99e2431b-5616-4fbd-696f-08da9119eb9a
x-ms-traffictypediagnostic: MW3PR12MB4377:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D26fCORcV4fRvBBNTA4PmpGTyNQTIrszP4XzF9Yj6USowxMGxLRtgRcH3DQOLT3v9X/l9ihSa6TvXjnKb87ReOftkTPsLgEC/Q+fMLHFy35SQNOzGSPvJM5Z7+XUccSg2Ae+SKEd9NHJd9z63SOC0EQHahL2M722KiiIcXPXPGZBweOcHzSxlPbDza/yi1IEQqer1LhcN+zV8WnlAvaQV1L3ANT0MBn3tcyeLZ8I6bVmyfBT9i5BYDHOjJHNsWzbNgXXfcZB1Atqfo4S1utElHCeJQ8ufAxi+rDsObtN8p1w9xUy2KgUKnmd70H1TgJXuCSn84+fdhb2eICLXt6rVEm+6k9Y+W535d/dwSUSNgwBXeO7+DTFu+eePeRiCOHxRNMTq6gis7EEVJkKwrfPYXFeTJcoU6zQBXS2EI639dVVO8ASM7Tc/lS/Pv1g0dILvKVbjd1RBiPQdpm16jqd/rsDQFTW6F6cUkO/vhU4K3yZfS4Z33w4e94/WXANum/ddaQefaWBif3Q3csy3ogrDxlzQfPYji+d/OFwaZLT2zQsTJwxIUU4tOMRgTPsWvB+f/LJwyX256FFKQPUJy+EI9EbwySzQgs8MCkiu6rlUPpHD1xhJ/xbzpm9i4dG68yH2/jo7ZvmMTB+WJl5BMKqVxdC1Nq0zqi+m63lmrRO9TcMW56J//IwUTgFvpvMp+3gXQ8bTbmTyCt2aggXKlbNDBaEAkrTEooxuqVi5y0lksS/Q0BJw5mK5ulBbXoZZFxZR1l/0lylt4+oZFpIYDO5SA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(54906003)(76116006)(66556008)(478600001)(66446008)(316002)(2906002)(66476007)(33656002)(122000001)(38100700002)(86362001)(38070700005)(7696005)(6506007)(71200400001)(4326008)(26005)(55016003)(9686003)(64756008)(186003)(5660300002)(66946007)(41300700001)(52536014)(83380400001)(8676002)(4744005)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pGx2oJYegq3uc+N/zLqtC/UZG53d3zCuQks7LHThF3Bn/bm0KYLXr1ue3+iu?=
 =?us-ascii?Q?pFBYkfn9JM6qBRA26Fk/25YcmFl5nk3VFlSCfxPxYxCDYOIdUWiOZK8yMI6e?=
 =?us-ascii?Q?0dc3j4B2jicl868eMEunxoHFoHDL6erxjjkNEa6FQVmWGdp1apx44rj8q2Di?=
 =?us-ascii?Q?JqV0w1eFG5MPHqiTvkoi95dIrJzpCBVRm0hd5cy4G0Es7mNBg4E7k1HNxYk0?=
 =?us-ascii?Q?M1jP9j/xCHpDIVgeF/iTFAtrk2wR1CdpoSMSk0Spn+0YVSCrJ75v824f0V+7?=
 =?us-ascii?Q?hEBGatPvSH81CuqoO6VzlX0kbk8kwe094AUoChcUOcBlDzwo1DId4QDNH/Zb?=
 =?us-ascii?Q?xWHDveILV2/BxuIxuqI0hCjd/P/lDLNTfvNNG1sPDNwtYpiAySVql00ZxIf6?=
 =?us-ascii?Q?2/zi5PUTkIVJear+7CbioXF8+Qm5jGd/OumIFbrI8kSWeu9LLGs0RK0WcCil?=
 =?us-ascii?Q?+pVlRRB1+jY9MPjMLbtE9foiDZGqhK+nQzTSVETnFT0+V2yuS9EiZQF6ZFks?=
 =?us-ascii?Q?+nJ5HZAzoEwV5jYj4L8k6m4Hnz+cD2D8nLZvpUN8gbMDzPuWBFtcwpQJIPTp?=
 =?us-ascii?Q?LQvQJGq10mQEcp4JSeDbbfIqcoq2R6qxwaSGyuQikVWiDcSeV2M8akQV6msx?=
 =?us-ascii?Q?nvRYK0fMt525lLOQGtxi2CD8CQUgkPxahg1l7taq9Ey7qMM1HjT+Y2eEPLG4?=
 =?us-ascii?Q?B5UzPG3QCxnpJxeuy2I5LA4Inq22DHR4ed7DQmQ7/cNpyV3ZxGDfukKOLTFF?=
 =?us-ascii?Q?jXF8jNL48UH8P9BIM5bvK3VGc6COUEhBNe3Lv/d0HVz3z9NjZEFcggRW3T6Y?=
 =?us-ascii?Q?mEKqqatA/JB2MxMTVFmB0WY/XDhWe5kuXtkxc/HZFFffRvzqkn7ByvBvhlNj?=
 =?us-ascii?Q?+Ceo25iYAPhTeYV7yKsKCZWco7IlaS83yC/9PnluL13T9WUY6ojeoHiYoobw?=
 =?us-ascii?Q?vhGhLpLP/Dy8iJnY9IXiQZVhSryDJQccrMVfLUBL+I+2N1LvXX+FgSqtc88h?=
 =?us-ascii?Q?tCE9vRZudItKoFN9h9qAuy8RWgcgPeED276dTIYHGlH0qCfLBBpreCglzw+W?=
 =?us-ascii?Q?uFmR/63dHBcilypis7WYd2WJcIi1Q5CE/hE3r9AQMfQzlzdB7eqQOYS44NKy?=
 =?us-ascii?Q?sXZR4px0aQv//UXRAfMQBJ7yjZQYgNs7pJMgpSrIQraa8loJ9ODsYQc/v6Hj?=
 =?us-ascii?Q?x0DxsCvHAq9Nc4kEtHYUTpCAZOAaNpt+77ApAwib+D+qGJR/t2Eiu9npuGf1?=
 =?us-ascii?Q?LpOCPHD/DgMifETBw30g98qxsC566KDnOJ9dvs+QBXhNKhm035Q4BeRa9IPm?=
 =?us-ascii?Q?P6SGaIrNBgAWVoLYQX9+8bj4I2NOqCpB4mo6BmXGFitj0GE3SgAnGg1GlIoX?=
 =?us-ascii?Q?EO3raVK8seR8GITjZFno10hgK1W8zVl4BF/vmCZQpsxDYU1OXelukmAC9U7P?=
 =?us-ascii?Q?hvJDI31y0M+dPO4FCDmJONrPxGkWXM8eevU0RLaUy87r6RK5vG4ETUaQII5h?=
 =?us-ascii?Q?9i55UKYXLGyEOIv4bL1anDKLZoOVILUO31mDI2yK3n+F87DQJPTy4GMfq5zQ?=
 =?us-ascii?Q?lg8UmHxBQZf9NpX4fQ0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e2431b-5616-4fbd-696f-08da9119eb9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 21:42:53.8696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zp6oaYCcpl9Rr/fV96Z4A6ntrXgZgsWpCPh6iMlR5N7OJYamvSZHBtrurxBSVppYdCwQOOYCsoqVCnpGE2g7SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> What did change since v1 and where did Khalil's Rev-by tags go?
>=20
> Khalil told me to remove the rev-by : ) since it is supposed to be reserv=
ed for the reviewers.

But he reviewed the patches, or? Which makes him a reviewer? I mean he is t=
he maintainer of the driver, so I basically a Rev-by from him.

Yes he did review the patch internally so I will add the Rev-by in v3

> I will add it back and describe what has changed in my next set of patche=
s.

So, you are planning a v3 already?

I was going to send a v3 patch after I get some feedback on the other patch=
es unless you'd prefer I send it now?=20

> As a note , this is what changed from v1->v2:

Cool, thank you for doing that.

> I think this is a bug fix because we have an i2c driver also in UEFI=20
> so we need this lock mechanism to avoid race conditions over acquiring=20
> the i2c bus. Not using this lock resulted in unexpected behavior.

OK, thank you!

