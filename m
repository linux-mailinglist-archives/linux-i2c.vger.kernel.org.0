Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD7295BFEE6
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 15:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbiIUNYI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 09:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiIUNYH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 09:24:07 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243059353A;
        Wed, 21 Sep 2022 06:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAEhFRUjA2RDl48TgXW0Y1JdCNH/uuH8SVleVC+PzfKnnYWBVJHTETVl5SLUsAak/DhDMHrWtAigFpM8pj/xnHflmeET5f/oSJDxAhRcld3p2YtXPUULbtni5S8jL8PJ/3J1uK5EI6toyu60N6Vo1EpYxTd4hf3hXn0/mMwXCA/kT2mcu6MhttOlYwUMHrNkJXK2llfJtqxqHCkNv+IljslyAW9xJ3CSiNdvpwEv749ORKPLIrz2wRdHuwO3CMTJ938L0rEIsfZwbB4ub79ZTFAzextqzCsXRgVapuyw5Aj1WQdnt6iL6oUaFSM+sGywrG+NFCebh0uNUR2hRuBnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZREIf7PqrhyD4QbRkrBicUw1IoR/QLyuVPso1ZnwYbQ=;
 b=hIrBdjjOqkWLA3Fo58rbAOZn9ESjAKk5LGfn+5hnVMAxU8tfTg0MhQOlEzA6ToNdcy2Y36pdAYw+TX5ZsXAuTYnd/n8MvKHnV3rkN7ObNBrvSBZN5KzwNaluPA5yov6/+0sJdnOPXJTMPY8E2qoHmGUtqwglXyO3tEmUZHpqqmW+g9mrDoEQ9xaWYn25q2U27uBXLutduA1nU0uucxXDJckBDDlom9nEwSgRrvUFmSC3yIi2d2FU8Ne4NnEieQbf0R4uK1wgZsL3VffmjhENbxOPXJQQFZFG36voiAz02PCCaw2+gFXwXDslG1PIBLnKmwLBqBWNnsGq2pUsFajISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZREIf7PqrhyD4QbRkrBicUw1IoR/QLyuVPso1ZnwYbQ=;
 b=VKKKaQlGYtcAtS7eSq7QMmafnDPBXEXEeXOZ+FLOPee9B9SWTFAT0hA+WrF2esrK7hVyB1Rraf3S/XJQUJD9MxcDN3RBeNApGBS1QKkZOumEe8WNW7aWuiBSt+r4YL5dUYmKta2Itrbq/cnijap+43wyX90gmnjXZjpoPdiNQjbWJCur61KpzJTPYbR8KPvYF1ut6WLi6XyvK4eFT/3Ns7UcSRGvBa+jPcChrAo2GFAg3VPTaJJsA531h62d3uUBQhzV6EK+USfgPvqIOYqgGT2E4F27BMQ022yy8AMH1gstos11PkZ3cauG4r/S9JSrOITuXZ0KELoa3nOoXhIpew==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by SJ0PR12MB5610.namprd12.prod.outlook.com (2603:10b6:a03:423::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Wed, 21 Sep
 2022 13:24:04 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109%5]) with mapi id 15.20.5654.017; Wed, 21 Sep 2022
 13:24:04 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v5 0/8] i2c: i2c-mlxbf.c: bug fixes and new feature
 support
Thread-Topic: [PATCH v5 0/8] i2c: i2c-mlxbf.c: bug fixes and new feature
 support
Thread-Index: AQHYzRkmhNx/4tIlJ0at8rY3SZEbQa3p39YQ
Date:   Wed, 21 Sep 2022 13:24:04 +0000
Message-ID: <CH2PR12MB38957C25C9DA618D7E101DDBD74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220920174736.9766-1-asmaa@nvidia.com>
In-Reply-To: <20220920174736.9766-1-asmaa@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|SJ0PR12MB5610:EE_
x-ms-office365-filtering-correlation-id: 5f97c6a9-12b1-42af-defa-08da9bd48df1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3pq9Ak7sTm0zZGXcxMb264GUiGSygxIxwhXLI2IWwxgKNWcq0q+1eRA46EBuo8Yb06hWpNpTSrM+rA60hFTqwCp5EXgLFCgoODu/8Ol4GTMcnchFnXuU2XuzhfsvjS7Sah6xnlOKK/vfW7ekEJkYjmiDXr4M7N/y//qoyaoVftPMVIhW0lq4XfHoi9L33CQ++PLenNM+aj9b9+M5c/VedUDL23vdhh/JbeOBGBK5pireSA9Ayk4kfrWlh0DLt1mxCr4ueNOQLTRpz6AX803kEXa2cuT2bXnKfGVCIDiB4KuBsok8+42yhCp/njJ5X+IY0pNsdAdkDZbsdL5b7H0/i+mYowAhTdr8m7OkolR8zqPYz4coKik86lq044qBSaFqgurW5igLqFXv3heuJ6pvjN1PDJeWSz77bot8c7ofXXwNuyg2GF4mxxaXlaXdwbLqBHtD5YzqYYShJD88olx+pYheOZao06XviS/6LrRmOBJKHjJrcM5M57X3bZl0EVscBm5XZzxDgCdlNNlv5mF5IroxHUzRrvi7/tB5oi/TqbCIhs9fbICgDFYDzG6JAvEyTEJCFfPGCAOr2GokQot/jyi7bQphZaCUyQRyiVwvpudgu4SEvL7YJP5nxl3eBKxbcl44rZAUcMwIHdzajIjfsYR6OVBJY3MEXr2dmS05juNB8jEYeohjkAXLLZ9Ebl8iRBeCIR3dUYNCOPHnzK1m3pXaaYe9cAHPbJ+dj33rmXi30wVm8owIKG0g93F8j97TwV4GoUKoPyoJyfgLnMWgeQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199015)(9686003)(6506007)(7696005)(53546011)(26005)(110136005)(38070700005)(478600001)(2906002)(5660300002)(38100700002)(64756008)(66446008)(66476007)(86362001)(33656002)(122000001)(55016003)(186003)(66556008)(41300700001)(71200400001)(83380400001)(76116006)(66946007)(8936002)(52536014)(316002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tzL1/gp1sHUi1BXEp4MtJTzunMOkCtk+dbhfHyZ7Y+XqNySRR4EhExM1wqf1?=
 =?us-ascii?Q?MbQ6XgR8nRI6YUxqaZVc5/rOOn4koztJyfuDLcK5K4apTXNIW+umvinzO96U?=
 =?us-ascii?Q?HqS98hTaVkY2HQOgRiTELQcBqXKRnUNvkKe/huOj2Dv9g5N4u2iuCU2tIvCP?=
 =?us-ascii?Q?g7hbv95+8SB0bT5tgHHJX+RHk7n1nylMXoUh6Ww2MHj6Td4quWOm7qBZ1/bw?=
 =?us-ascii?Q?ADE0mUFctJ91LMqWkGIsxUtGh0zKXwtVEoPmE06X5x6pq/JwwPzoM2LM6omQ?=
 =?us-ascii?Q?8yRsMZSifNr35XCWlW3+kg0zHZO65qCHX82tX/PEcUWF/vDjhA+S3N6KrJ3z?=
 =?us-ascii?Q?W6FePKuxncxKulbru7XJxBx7hkUbRH8n8FKUERFw/atWLa1mmWfziOFpBYXj?=
 =?us-ascii?Q?Wb/rbqFjmAVkWILCUcP4qElkyVDOtSXpni+VfYqjSx8vKQGPsEMAL55Zmxze?=
 =?us-ascii?Q?rMrmkTIuhud1B9usgSrj4jr8agbxF3SBNEnEln3f3Sjj5BMk8e3R755sL+gP?=
 =?us-ascii?Q?0i0h80eNxmQWosPzZHe5p6ji+7MZ0enGrgEzQTPgwda0xt4bCyTBBDRfB/w2?=
 =?us-ascii?Q?ymnzripV2OHoG1Ksm/D5lHCmbdDtoo5TzwfZB26SvzlavCQXXYPIae+kXR0O?=
 =?us-ascii?Q?bUtSAqG5laIIczBFMgNDX+/oDtpqfmRUdiE0kiRu9tuVeIjHZFQybWYYmuB3?=
 =?us-ascii?Q?yAF0BBbOZ7IcZkwHqo/5wb7cwd2e4deG/HpLnEbIq7JeolLN2doy4Tdvcf7Z?=
 =?us-ascii?Q?lHbUjVEPCZukhmKgn7sp8twf5HrGGxpf/y3h5DkNoRuiuY2jILFHhdU7QtD3?=
 =?us-ascii?Q?BjtGeZMfQ5XafBVg8OeopNGi/d+F2PjtR2pMDeUkw72iCZHVfF+LGwuZvnIp?=
 =?us-ascii?Q?pYxlQRNExmXbPCynKmtuDhHOG8s4p+wG2lNT/ty+qZAtTbgwkhanHxWbBwI3?=
 =?us-ascii?Q?Nc/uLz0ISS+iULpa/NClIabuNS66OxeKoTEqeWZ4oVS4Mwf8oqBgNAdKzg+f?=
 =?us-ascii?Q?UdaVk5uyaH7Jn6fbTRuwrEaXBAcwJaV2NJk3q7hwYAthR6c0pQAV9wWFtR43?=
 =?us-ascii?Q?nTJaA4Awx2nm1ZHylbZ+0MwThK+aUg+L6SPRFG+t85srBKRRlywiRvqSc5WI?=
 =?us-ascii?Q?EfPycOCn+XDIJJeT51Oe/ZeNn153MeqJC01VzF6yQtqQjwMpc2w+VWwQT8WR?=
 =?us-ascii?Q?vQSOsNiylKvD8SE9+3giMm1ycjr0x36YcfSQqa7AX8dpqZ1rrOCProV49p1L?=
 =?us-ascii?Q?ujeR1V6axJ3LJPjFvqqBffMH43pQWkz6eIxqgpJp13ZcQg57RjdXIdpNB5Mp?=
 =?us-ascii?Q?oxQwuk8pix/4NxpuwhFOGlP+8FnGHJtQANVXenALkE+LmkjBsF+2IR0o0fQs?=
 =?us-ascii?Q?up4a44SA48ldNilf8ukihI7Kly5KGM1UP1uOtYKDzDaem5mPgcLi0NujMLwh?=
 =?us-ascii?Q?fUvL8/j4lms/Ra2TrjpWUkk7eaUuJidwgMWMc5rirTFkHT69cky2XcNqFMMK?=
 =?us-ascii?Q?JTOpD+9mTrcgjDy49uPyv0yb7jYG7vNidr16XHmDv73U7EfKRA65tHuH6zg3?=
 =?us-ascii?Q?lrYqNREBKL6xZj7Zm3A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f97c6a9-12b1-42af-defa-08da9bd48df1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 13:24:04.2844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IyQoLFXtH+LHb1CjPH0utZCu0pYtDP4iYmaHIRI4/lcm2wpV+obsVkIDQHwM9iloC2jubj1eadMQO4D72lr6pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5610
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Is there any requirement to support DTs in i2c drivers?
I would like to remove it in the v6 series because we don't support device =
tree, only ACPI.

Thank you,
Asmaa

-----Original Message-----
From: Asmaa Mnebhi <asmaa@nvidia.com>=20
Sent: Tuesday, September 20, 2022 1:47 PM
To: Wolfram Sang <wsa+renesas@sang-engineering.com>; robh@kernel.org; linux=
-i2c@vger.kernel.org; linux-kernel@vger.kernel.org; devicetree@vger.kernel.=
org
Cc: Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v5 0/8] i2c: i2c-mlxbf.c: bug fixes and new feature support

This is a series of patches fixing several bugs and implementing new featur=
es.

Bug fixes:
1) Fix the frequency calculation
2) Fix incorrect base address passed during io write
3) prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
4) Support lock mechanism to avoid race condition between entities
   using the i2c bus

Cleanup:
5) remove IRQF_ONESHOT flag as it is no longer needed.

Features:
6) Support multi slave functionality
7) Support BlueField-3 SoC
8) Update binding devicetree

What has changed from v4->v5:
Fix build error in the mellanox i2c device tree documentation

Asmaa Mnebhi (8):
  i2c: i2c-mlxbf.c: Fix frequency calculation
  i2c: i2c-mlxbf.c: remove IRQF_ONESHOT
  i2c: i2c-mlxbf.c: incorrect base address passed during io write
  i2c: i2c-mlxbf: prevent stack overflow in
    mlxbf_i2c_smbus_start_transaction()
  i2c: i2c-mlxbf.c: support lock mechanism
  i2c: i2c-mlxbf: add multi slave functionality
  i2c: i2c-mlxbf.c: support BlueField-3 SoC
  i2c: i2c-mlxbf.c: Update binding devicetree

 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      |  48 +-
 MAINTAINERS                                   |   1 +
 drivers/i2c/busses/i2c-mlxbf.c                | 862 ++++++++++--------
 3 files changed, 521 insertions(+), 390 deletions(-)

--
2.30.1

