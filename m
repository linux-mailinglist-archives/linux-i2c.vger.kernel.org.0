Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3607B28430F
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 01:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbgJEXy0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 19:54:26 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:1679 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbgJEXyZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Oct 2020 19:54:25 -0400
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f7bb22f0000>; Tue, 06 Oct 2020 07:54:23 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 5 Oct
 2020 23:54:22 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.56) by
 HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 5 Oct 2020 23:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oauuRF/GwiPQV1Kc1nFIxCjJ1+uzlzhQAArVpwdsY8DJSImj06rVmOnoLzyCSPpKQO1UeWM/yR4VnCX1HSyY1/FNpHpoiaITeyQHGzN7DEzcKs0e6g2mbTbqoBWJR1N9qTzg8Yqwi8TvokdnTuFHuIvy+NPUGg3cNseQNpb8ax+VjL0zN5rEtuBALQMiKIZMF+yCkvwkAdeZ1wyeNuS3i/CJvEmZ3gMBHXtWmbnyXur3725jrSxzzbNeblPjtfh5+4vLllHNL6stSQbrcZfvSAsDIlL1yGakQ8b5z8hmOrAzYbojlNPpeZaDypNSocvydJIBDV7V4R7+YUkgrQTrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLTBeUax8WYh9Op4ALT1HU1xRiLonXsP8OiWiXMX9Bo=;
 b=kqR891ozBwAhfxFmwlbs1BFAOirxrxG42RmtoR9bvB8R2G7ae0vQLLPR03GHptAWBk4ahR1OxTRIVLTLlUolfhhTirSRAco5g+hbdqgGLPLIW4+O4VC/n/aQpFdvHzd8R5MQeHVtGR+SzPplqs94aqg0ZSK3Z9K2g1gH0fRN81lfWWgRjCXw45qmEjL/dNQwXBbqrUnh12xyPTp3Mm5Duv6lKLP0Kx9cM68dr9NLMG8+yWYil42OPRo3wyJqd6ui4mqFkyGrmg1Ef8zW0bGoH4fagkygZtU3MopQK3Z118w27bNwvuZtn9uUDr7bQnWcIpd26NpvaXto4TGhL6LrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3293.namprd12.prod.outlook.com (2603:10b6:208:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Mon, 5 Oct
 2020 23:54:19 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 23:54:19 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v11 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Thread-Topic: [PATCH v11 1/2] i2c: i2c-mlxbf: I2C SMBus driver for Mellanox
 BlueField SoC
Thread-Index: AQHWkTLCvB89D0q+REKLlisH88Nxu6l8iR2AgAO3SgCAAHX/AIAJC4aw
Date:   Mon, 5 Oct 2020 23:54:18 +0000
Message-ID: <MN2PR12MB36167849F16529392C0337D1AB0C0@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1600804577.git.kblaiech@mellanox.com>
 <69651f24de181c7ea766a41bf7ac7a2539368ee5.1600804577.git.kblaiech@mellanox.com>
 <20200927135445.GC7298@kunai>
 <MN2PR12MB36160C5BC782D9AF3A017D17AB320@MN2PR12MB3616.namprd12.prod.outlook.com>
 <20200930054152.GA1305@ninjato>
In-Reply-To: <20200930054152.GA1305@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2e131fa-d674-4fe6-51c5-08d86989f987
x-ms-traffictypediagnostic: MN2PR12MB3293:
x-microsoft-antispam-prvs: <MN2PR12MB3293E8574886F630C918ED7AAB0C0@MN2PR12MB3293.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rlIFp2pSysx2azqXHdt3SzhhwKUHJ58WKTHuWCPpXedK0qzVtt+K9u4SUZgiflsaPdMQ5MSEE67vgwJrjUvXykNCdV2Njxcby21roCFLoV7ZIUfzcg1le6VkJMlVUQLIXdeKWw/eKAnVJm+Ar8ukbBCzpLj9HOauGeuUwP2n5Od6CtsN4PrOERTKa4H3mhLzD9hNvxXlK5b0FyVF6DhJYaKmJN5p+uqogGvMOLwf5KL213ZC+31l43AkXe5oCz8DD8wYLQ2bk2Amjg/yoqFbEZpgTjmkxSKVjMQ+jL+55ZBdFoS63AfuOjylbqinlNXdj5n9joIis2aJpO8JhMIYKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(316002)(9686003)(83380400001)(4326008)(26005)(76116006)(52536014)(54906003)(6506007)(66556008)(66446008)(64756008)(66946007)(478600001)(4744005)(33656002)(66476007)(107886003)(7696005)(5660300002)(2906002)(186003)(8936002)(71200400001)(86362001)(55016002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: jodiGxtvhWpm75VdsZDdT+12Ci9fnBRocNG5gPwbDwOxzl6qzTRXdeJDAJHWIZz2dxLoH+tU+HfUR5RdrInWZIvkLYkbd76/xEqX3kJu3rIWxprlexxnAXOYcQPXGwv5g7QgQOPL4yRRuDU6q+Fm+vW23XnD0jJM4bKunP20B/O3j7aGybLZH50Qn1DEr/lneX7isolE/2CkfVD44I53enjd4MU2r+k0bCCY2fBS7D5tEAFjZPlH0YwvfSSoE1HeE7PquGgj6yiv3ihmRm8JHdwxqqa8uzZ2wXc3ICaC/Wo67wSi/QrApvQAizQq6/mkAN2OC0Mg8DwPJFiqutdmw4H6mqjNaYbgzy+YkGEBqRCyzbeEWgwsPTxCDYYYtEGAMSuTf6EuLAdDTHbnKLvxnM7eOCsoL41s3rrCBJqlYw3jLEDA3rnso5XVGOKV7RBH+VldtojpBviqgzDFJHz0cFq+euLqreR3qyDpS+b3x6n7G/y8qD9RURIC2LMB7WNwHho6EgZbU/nVcl4je98VhynhZ2OCetBELEqPTc3Arpmw33W6fZVHTf2NPHrDoER5j+G7tnfZjuklb8BbMYqLUcVvvyDOyjcbBSLo9Qeq1T2JDAJ0l5OT1d7hNsfMWCKvjMnrhOQkpWOHufuYqHFhzQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e131fa-d674-4fe6-51c5-08d86989f987
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 23:54:18.8997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oghNV9kcI3eM+z4CycbYxB7ICKOwOiVZHBhGcdTPGSqnsvyXHonra5xY7/amZ7x3DoAIdmCh8Dl8ceK+C7b+Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3293
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601942063; bh=MLTBeUax8WYh9Op4ALT1HU1xRiLonXsP8OiWiXMX9Bo=;
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
        b=F5bz7e7PPvLbh/QOsoQUWw9oZiy7AmjOPE2oWk5z2YuaaqjSpCpfjMEn/VMaqrNo1
         yF1lVGYGmbrxM41ssJy+rh4UGN+vc5DE6BHU2cu1ZmxJWcpf1ZvuahOh81dvfdnxcu
         s+KvKX24AgvMTPlq244aFClY6r35tQMvn/6gu3VgChE0kw1IdKGy4CJRy69UZXMDI7
         EzUJe4VJQrtzuXzF6N1k+R8uVr/nw0jI6pe18l7TIQlEp2gTU1tfvh2EDGLjad+SG2
         KWbhFnUgLDIaIIfKrD3xXBFhJ9fTdAVM8Ijya1pHAUehydDMle+UbdoDhGDzY+/Fcu
         0LgLSsCAhnb1w==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> > Wolfram, thank you very much.
> > I have seen that you applied it to "for-next" branch.
> > I 'll address the build issue as soon as possible and post a v12
> > with the appropriate tags.
>=20
> You are welcome. But please don't send new versions anymore now but only
> incremental patches which go on top of v11. That is the normal
> procedure. Thank you as well!

Thank you.

Please note that I addressed the build issue and converted the DT file
into YAML schema.
Please allow some time for the internal review,  I will post the patches
to the Linux kernel afterwards.=20
