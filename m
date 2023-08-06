Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADE977159A
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Aug 2023 16:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjHFO0i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Aug 2023 10:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHFO0h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Aug 2023 10:26:37 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCFB1B3;
        Sun,  6 Aug 2023 07:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI42vvakfqU8lV/a7XV/oOBPeM66V36gBb4WJL86qYDe5U6K4SUE9JPIA8Bj24voQUgIoYI5iD6z1RiIHzIpB+1d3u6f0RMoxP3Mbj2ksPDkJRLs6lblLdgWg4BDL+bLwTiqPZgJWK34vfaudNJSo5CBspNFYafOzSHmNSgGSvOpy8r/QCmlQqZsnF66xhTMLM/WUsidMcZkbsqkDyNzL+4EcSEtIfDyst5Q5FV82dwW3pFEDSklxw47J0r42W3Y3IEd3BHyM4YyF1UgK2mnx1U/fyhpn0VcdnxnIlRMRNdq7BBadRF4esgN8Ky0H52u6JvBjNJiDYigOhgcecvcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtX91GeRYsEjtQd5tXkPoBNr3P6cST/hSgdk9x8mqoA=;
 b=e70y20opHDK/wZl7wmZ9FY6bNBQVrf7NFUHjgQgpjSbznhTiH/uFHvelTsXopB7l1cQ8sPB1WA5XjAnMEvvP/JsbHBFpZG2qs6QVgnMKcD1MDp0G5fTSI+r+VsgjrEsvXTZl0Mq4KoWKHXzB/MLIU/aPg9+mR2VdawvhddC59NpG5lsbPtSo8RQgncggYy58oZabMFEuhKuuceRnWkghU+QG0Ke4Oxx8j6bZIBL3sr0pfZuED+qFTCGF9UnHO3MKcNdyNumartDKuD2ZrdKEqsQWyj4On4y9OMAGmm7GOgfmfIdG7QdAelXnuIWpZzw8XKFy4KAOkGPe9jVyB+2uCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtX91GeRYsEjtQd5tXkPoBNr3P6cST/hSgdk9x8mqoA=;
 b=g8I1s+qcXuN/T9oVeb4PFAJx6Y60FLeFxzlzpLg44OY3r/3+8wLQmFAypiPbFRroIhl9WB+ADaxEC8ezB3eivn5ulf1AT/1Qb8Ew33iYO2HgeLM4HElbBR6s2ChV7IuAeBPvDmIXBbMi6Fsbvx59pE8x6qtit8DkYVy7CSZ/FHXKAlLo7Xbh8DiunQmdrQkZKlWEEe2JnigaNHoXipUHXW3tFpsTH4c20Y3a0wokheepNVm7HOvW8lgLC95kY1OKKKaunjyvq18TM/o0r3bZBEsfxSGpnv5W6tEnfKqPAHHgqMXeboqvSBujAvNAgn77ez7H+OgIcC+a75AlL0hnzQ==
Received: from DS7PR12MB6335.namprd12.prod.outlook.com (2603:10b6:8:94::11) by
 DM4PR12MB7551.namprd12.prod.outlook.com (2603:10b6:8:10d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.25; Sun, 6 Aug 2023 14:26:33 +0000
Received: from DS7PR12MB6335.namprd12.prod.outlook.com
 ([fe80::b545:e43e:779e:84f]) by DS7PR12MB6335.namprd12.prod.outlook.com
 ([fe80::b545:e43e:779e:84f%4]) with mapi id 15.20.6652.025; Sun, 6 Aug 2023
 14:26:33 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH] i2c: tegra: Fix the check during DMA channel release
Thread-Topic: [PATCH] i2c: tegra: Fix the check during DMA channel release
Thread-Index: AQHZuME/tr0ShuZ0qUGsBKbHCTYYla++E/uAgB20fYCAAai1AA==
Date:   Sun, 6 Aug 2023 14:26:33 +0000
Message-ID: <DS7PR12MB633567393B1A709323983DADC00FA@DS7PR12MB6335.namprd12.prod.outlook.com>
References: <20230717151240.68899-1-akhilrajeev@nvidia.com>
 <ZLVdHzFm8yngLDj2@orome> <20230805130147.eabmdfbyttx2mjpl@intel.intel>
In-Reply-To: <20230805130147.eabmdfbyttx2mjpl@intel.intel>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6335:EE_|DM4PR12MB7551:EE_
x-ms-office365-filtering-correlation-id: 0ce2b863-78b8-489a-ef7c-08db9689222d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y7GumJqPlUXXIILNfJ+nWYsnBCpVgvFCI7/z/ZgDBCEsaTkleditADBD+pXRmllGQhRh3H7E9IZ8trHz73QhAD0Dw93JcuXuVQSAeb7qpBHWSY0rRlxgrbh8vGX2p/bKcquTVUluagXPCuLF0kQBMr+nkuAhAD8o3a4b1v0i6a9x7l1TUb8nWiDnhbN6Ztt24XMIirGCEdn271MgrVh8Vpm4+3sjkVe8YhxLab6objYpvHJMsd7BzD2mDw1jiKD1CrBJOcxLBx7hMJuCtOac8317Ihcl0DV2kG+32ZgIxRJDd1x8SIG2aYifyI7HuaoSX81ssKIGQ5+tRPBC6X+k282nj7CklX5r2qtJFPbLynvILlpstqtTTAKhk3gqmEezdKsJ5wTlaZTOIp44TxjNpyXEi+WUHxdGGjUa29dwJJ1a6Ijx555GBr0TfICUqNqDYCy89sqCz4JuQEvAcurc0/2WscR8hjjnhm0t8M4BVkhQw2+Wn7JlUnOWF1Yyw1AXzZG+FhzGRS4Z4JuW6rO7ZsXgAW3OLGPkhxEtfYNmuWxGwWa/Lef6HxPMCk6+OknB1sQ4HvNCHOyqy3/TemSMQGKMnbI4IUM8QcO50fRdWcCyLlx7HyxydbiiJ+PNYA7wzBFwcNv2uUXSGBfTOBbvMbUrWPWEU/uTBo3ON3VzYx8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6335.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(186006)(1800799003)(451199021)(52536014)(38070700005)(41300700001)(2906002)(5660300002)(83380400001)(4744005)(8936002)(8676002)(55016003)(122000001)(478600001)(86362001)(316002)(33656002)(6506007)(7696005)(38100700002)(110136005)(54906003)(76116006)(64756008)(66446008)(66476007)(66556008)(71200400001)(66946007)(4326008)(9686003)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yUSbxbhfX8hhd5d3LMw2F9b+pkGy97MTTmP1Jl6LJm62LifTZ5kKlzooVO3b?=
 =?us-ascii?Q?oZ+OilOkjhCRh5ECU726djXYZb7W27dq535Q28cmWtxgiW/3cfzuI5xFJ/sw?=
 =?us-ascii?Q?hI573PYHSUJeIdjOws02xRqE5apOrUCUecBWeuiBYfWHUoYm8u3AFfcmBZ/w?=
 =?us-ascii?Q?0xq9D+xIeT19IB2s2Dht6ozox1g9G2rC7ntfi5tICtjCLUuAQuq0xWkA6C2w?=
 =?us-ascii?Q?gXagS79bR1bs56kAu+iN0E7lqH+lDAtvOVwdN0OYS4MojwNVgQT+p7FLO1B6?=
 =?us-ascii?Q?x4kBASTLTwflpyiBKPw9JRAkpFxY2+X5pbHAWUnJjVINoXkHz1l7fYhUxfkw?=
 =?us-ascii?Q?WObECqyVgLni9JpjzybPAa5L24dxDOalVO5gpxyPCdv/dJQu/Z7U9RifiENC?=
 =?us-ascii?Q?XpE9/iqRvPRzRmUo+wsE/uAwMOeZHeArTV0PLS0L2CMj8c2CnqkZzo86rlbM?=
 =?us-ascii?Q?7mV2xIeIR4fFjAvdJrAYip/Ek3SDNGVQtZlWnN/URhgSE4dHQfrstSik2682?=
 =?us-ascii?Q?p6uwKStHAK21qu0eaq4/p0+cRW4O/tG1nUfEwh4fnSwwdB3vYreRe0crAkOy?=
 =?us-ascii?Q?iewHk63J6hUjr2Qvc0FPnfLSEzl0yggBc22oLSlT/GV2Mt4kl5IxX6yAwLop?=
 =?us-ascii?Q?Ane3q4fPP+X4VKswAaK3OeBpAkZUOb4AVfXx/QpfY4eaz2gKDEuD9HlzHHY6?=
 =?us-ascii?Q?Vc5jzxbRYMCQ41NqgiMLzvrkiksWfKrrYscNz6Y94Pk0lCyG6RArC08Fuusq?=
 =?us-ascii?Q?tR+gMjIoAFpkGL9C/SYAt+GU80sIno9yhgAZjvGo20IIJA4MObBT9h3wQHtW?=
 =?us-ascii?Q?GxJPl0T05Y4OLHLasi2PFilRQquv/FXjz9r1p8ErWRItHIZWRD1h/iYo3IhB?=
 =?us-ascii?Q?h2SvgwTN045AdHlDXhAYaCQAhqDh4ZX73oVI2Vj4/qocCf8Fzn5OVfK0+Mnr?=
 =?us-ascii?Q?AJRF9aQA+GIHMS5tIvFBMqApjHPI217t9U7hV8t95bPowcgMdUCutvZbuND4?=
 =?us-ascii?Q?jf1u6XCIhm0TelpXpUYGY2V1ujAK806UXKIjoBbRbcSAib2pBSH3bl6zudrF?=
 =?us-ascii?Q?018jQObnNp2R50XkRBgut+Rc3WNMXu4yagzoZnCJt5witJiwyi3hYyPlVNI0?=
 =?us-ascii?Q?yVXmP6KxwzS9N3MZMzRWA8QFSsk5COF2mFn/3quaTWO31P8+/e8QeZO9uf43?=
 =?us-ascii?Q?+0mdFGpm/fIiIp/CxBWyFh35Pc+dfOa4jRig6PJMZEZLNkvusn8Bj3kYDNly?=
 =?us-ascii?Q?t1VnmbZLdrZkVLt8p8wfuI3DutYwFl6eFFigoKcrn9zAxUF4mXovxW4gCB+5?=
 =?us-ascii?Q?uhOQZ/ItbC4qjRlVrbcwyV1pCG+5j5Tva3lW1evfmrztJM15GjOSmzsNwHiO?=
 =?us-ascii?Q?cOPmr9fsizORVUJvVzqCsaR1FjTPJdunqHY5Q0HrBVzWC9QeAWzNpcCQoriK?=
 =?us-ascii?Q?VDrZblN3ZwY4a6PlkuN8VDUZ6dvGdLHAsNCnJPmQQ+MGUPt8JGOupUmda6OE?=
 =?us-ascii?Q?Ro4U6jbKOiKiLW1MpBk8U1HSbVxRfU7IYEh5m8XZD9bsD1Hja+xHMZoAIUcJ?=
 =?us-ascii?Q?ZprVMjY/ET3ujX+XkSSX1BN7f/+OPl54SdmS3RfFfEF/Wu5FsPSeO9+lhaJU?=
 =?us-ascii?Q?PBFJeNbVv3YSHtcZMUVzVeC97wdz64hJfdHtB/e5rzV/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6335.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce2b863-78b8-489a-ef7c-08db9689222d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2023 14:26:33.0733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BVy68C2e+V248E1KEhgLrME12QUxA13PJRrasGWLkTb1crtmMBxX75ZgndI33Ndkzba3W2v3/BxXZTGvFMVjXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7551
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Hi Thierry and Akhil,
>=20
> On Mon, Jul 17, 2023 at 05:24:15PM +0200, Thierry Reding wrote:
> > On Mon, Jul 17, 2023 at 08:42:40PM +0530, Akhil R wrote:
> > > Check for error and NULL before attempting to release DMA channel.
> > >
> > > This, otherwise, was causing panic and crash in kernel when the
> > > dma_chan has an invalid value. The condition occurs during
> > > init_dma() when the dma_request_chan() function returns an error.
> > >
> > > Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and
> > > TX")
> > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > > ---
> > >  drivers/i2c/busses/i2c-tegra.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> I guess this patch is not needed anymore.
Correct. This can be discarded.

The below patch from Thierry is for the same fix.=20
https://lore.kernel.org/linux-i2c/20230707132619.2998382-1-thierry.reding@g=
mail.com/

Regards,
Akhil
