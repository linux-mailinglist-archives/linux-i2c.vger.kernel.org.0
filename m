Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B762CF8AB
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Dec 2020 02:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgLEBkP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Dec 2020 20:40:15 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5554 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgLEBkP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Dec 2020 20:40:15 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fcae4d70000>; Fri, 04 Dec 2020 17:39:35 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 5 Dec
 2020 01:39:34 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Sat, 5 Dec 2020 01:39:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=li9A9YcH2vSUdESibIDsO1HNr/GTobLHDwqLN7MspIasTfjKqsRSJhky9QShOllDLy8Z2npJiNyVYPYFiGLc53MytpaVV73XJ2P2Ea4ZPMi11ToYUdX+iXfWrNYEZlHlvxKuIeCCUEXDiwx4DywkWDfle18h5q7+3PSGdudcFZ6TZ5g5PjBXjmfRepD7OvTXTqHI7c/4iV7pbQU5SfEBMDNAoW/tvpncn3tYqGtNLrSxX96ID36eOZTQt65sPdAzZWWiBQyAp8LJMyk0h5vI9BF3KhLzeopxtqtMYmNxEpdeQeq+bObGPSdKH6GpoQ7WqN17mneXOaOg6iUsowLBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHfriSMyGW5dJnTsGlLgqkETO+igvkQ2qXFVRyHDE/M=;
 b=kHySNNX+Lf+O3AQTkfytNFOND6mNzejFZYfQ3PLEVCdYjT43YpOa6ugoK17Xy1JHq4JoKq18viQarcEvWsOOCimdn0+sQdV9atOx2gaqK+H/BBRug1zOrb3Kv8IgMzONqE3Aak05GrU7GSQOoJ9Ep1N7SNoBduWz5heVapZIFVX37dV7s2SHkLsb5SQFQWlbZ6ouKWDSlSdatGnmuOjVsZ//6UzFyrwMnCsvSwKIIXiIxjhz64wrL5+aI5A+HeF8m8Kj7HT1qFwJ39KCdr00/Khm3aZhDvZwzAcubxBmLb5wiXLJQ7uHUdURbp9P38cwEqN6grHnZbRj1GfGnoVfEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3519.namprd12.prod.outlook.com (2603:10b6:208:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Sat, 5 Dec
 2020 01:39:32 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::9d:422b:e41e:7c47]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::9d:422b:e41e:7c47%5]) with mapi id 15.20.3632.021; Sat, 5 Dec 2020
 01:39:32 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Xu Wang <vulab@iscas.ac.cn>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: mlxbf: Fix an error pointer vs NULL check
Thread-Topic: [PATCH] i2c: mlxbf: Fix an error pointer vs NULL check
Thread-Index: AQHWyhDoj0ka6v+8ck2WlhCtrpC+eannubJw
Date:   Sat, 5 Dec 2020 01:39:32 +0000
Message-ID: <MN2PR12MB361677235F0526AC99E0B3C2ABF00@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <20201204074111.1359-1-vulab@iscas.ac.cn>
In-Reply-To: <20201204074111.1359-1-vulab@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: iscas.ac.cn; dkim=none (message not signed)
 header.d=none;iscas.ac.cn; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [108.20.133.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21743907-df07-4d2d-282f-08d898be9d40
x-ms-traffictypediagnostic: MN2PR12MB3519:
x-microsoft-antispam-prvs: <MN2PR12MB3519179CDABAC58279543244ABF00@MN2PR12MB3519.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EiUP+t6l+wpR0oDnaNRNuh4RWlZ2N5wygebb9c+3kVyZWY+5fwhXqqH9Svx500hz/gbKPFwXoyq4ZVT4IDW0KHLDDo6AQANt/kyMBY5wk7ymK+DQjtSyg1IQDvU5ftyfKukaP+ylUvnQlbv6vII2wJ/XGAMcDfhJchcLvn8hE6O3AU8CCe5p4fQB+NXkJFcPTHDCUxLqVI8ZC9Q6f2E3PSjFAZ4BNzTqVo9OJL2ze7DNmFrTB/QlxK68/z8luKctK6RybgCiOet8JmutN9hrupFJRpUCOMJr/pEIGXqbitQnBBixkyT32AOoAD4ImU6zIY5Nt8jTrLaYyA9BjAwT3Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(54906003)(76116006)(52536014)(66476007)(66946007)(83380400001)(478600001)(66446008)(4326008)(66556008)(9686003)(6506007)(186003)(64756008)(6916009)(7696005)(26005)(8936002)(2906002)(33656002)(8676002)(55016002)(86362001)(316002)(71200400001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cmbxm/4O+ICNa7sIV+1qiIqGsVJZboSIaIrqvL9arE3qBPppphwdBqVo+qRZ?=
 =?us-ascii?Q?FJeNcR7VtVEm/RkOkXo8pGabPLM85PXBya+q1Dd5BBnI/9FcsTqWF0I6C+i9?=
 =?us-ascii?Q?ZndVQe+eLW/GaHjnA43Njk2PB+aMdNX2h5CXYAhTnjMUjPcrVXsDb53f04O4?=
 =?us-ascii?Q?AT6dDb8QWZ1p+NiF/N0BfZ7F6njYL5y1itKAz0Myz5YRRO55YxtohDsqJgpa?=
 =?us-ascii?Q?KV42aqARvFS9kYcw0SwSqR6XC0tJbZuUojIBubqjUG6s8t9bVBAjOQvU/puP?=
 =?us-ascii?Q?z4LvPYyrLVWwY8he1tHkvp6OehZTYa6IfXeuaZ+W43AVA9viSvB6TGuTw73Q?=
 =?us-ascii?Q?+EoEcqO/XPWmSyAJOIuUoR2FpA571CL0dhva3fjSUUaPYFoDx81dsdBvNiMa?=
 =?us-ascii?Q?JmHaP5VkpqGpB0kH4xbYtIlx9MkAzH4ekPEvaVTvZiIcNQ+zieI4kI1YgxRx?=
 =?us-ascii?Q?h/24IWDfA2wM1KR5M6ARa7HMS93M1qQG5Dw/NXr/epEb9hkGJpp27uP/xxBm?=
 =?us-ascii?Q?bAkV0EC9IW3soiREWr6sdUZs2IUjYI79SCuTaHNuwKsSVugDBtAYgkozZTEF?=
 =?us-ascii?Q?C1yRA0+bcPekeRyGUhPNuwz5M0zJqsGmBExdtDh+O1TEq90RNyNhK6CsNmE9?=
 =?us-ascii?Q?cvno8G2oiZZUSKI7OA/XVmuHSO71vY8UXRmNmf2oFkclzxwX4poZ5s7GwTgS?=
 =?us-ascii?Q?OuwkqiNroeV1DHXG5tAfXTJAJWqWd4s+DP5qI4jrhnZFmnrkPKrpIT4WabdN?=
 =?us-ascii?Q?+FC6zX43FEDLPfO85o0WBGjxln+zDnIzc5FequC9fvZX0EgbjeJskMNkpnor?=
 =?us-ascii?Q?xDt5BQSa34Pycr772z/NU8uQMZNtGhS4xcXkRXcszxneJMR/skSbMyFRKmxG?=
 =?us-ascii?Q?LcIolWmOvKs9w+IfdIu3PT7PEI3JkywXOQo7BX0LDBVYi0Po+33x08i8Pncc?=
 =?us-ascii?Q?XH5IbUrsunDFb4iziVW1geoSRCMFH5e/PmtmQMVnfmM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21743907-df07-4d2d-282f-08d898be9d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2020 01:39:32.1321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 836CczZhdVzEPF6Y3KnMbvrlpqemEVGeTtBRawSQYm6m/8BagKa/am85ow5UdHQqDdCNGK/8eAGhMh4YUlENvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3519
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607132375; bh=gHfriSMyGW5dJnTsGlLgqkETO+igvkQ2qXFVRyHDE/M=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
         x-microsoft-antispam:x-microsoft-antispam-message-info:
         x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
         x-ms-exchange-transport-forked:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=Cnl/OnjxkLVSp7brxzcczMRmpCLb+J9aDqy2EYr3vMm1wj9K++SQKoNPQoH3PJZ0+
         dYg++1jnrtgDnWF+qcJ3Y/yuMdmtDP5av1ROPOHcYt66CcW4RYK4Z6iH3ZhmkifbVk
         u39uT8GJewruf2UnqjKkOprg/DZ5ThRVKZMO419Cal6DGeD7HDjKHBWKagsKM93W4+
         5G3YY5UWtYDFby7f1t+ToiFGBxZO1vmYE4mR25BQQreKFGVZ9be6Lk8HhEmFb2gBVW
         lzdKcV3QQO0SJ6kiE3ZfwTyQI5LPI6DpmcSFBRI6u37K6fDL1zl6JMV8LqNRem3uxV
         OFW9RZuYngHIw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>=20
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Thank you very much for your patch. Please note that previous patch
has been posted to address this issue.

> ---
>  drivers/i2c/busses/i2c-mlxbf.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxb=
f.c
> index 33574d40ea9c..73a58beb7b82 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -1258,9 +1258,9 @@ static int mlxbf_i2c_get_gpio(struct
> platform_device *pdev,
>  		return -EFAULT;
>=20
>  	gpio_res->io =3D devm_ioremap(dev, params->start, size);
> -	if (IS_ERR(gpio_res->io)) {
> +	if (!gpio_res->io) {
>  		devm_release_mem_region(dev, params->start, size);
> -		return PTR_ERR(gpio_res->io);
> +		return -ENOMEM;
>  	}
>=20
>  	return 0;
> @@ -1323,9 +1323,9 @@ static int mlxbf_i2c_get_corepll(struct
> platform_device *pdev,
>  		return -EFAULT;
>=20
>  	corepll_res->io =3D devm_ioremap(dev, params->start, size);
> -	if (IS_ERR(corepll_res->io)) {
> +	if (!corepll_res->io) {
>  		devm_release_mem_region(dev, params->start, size);
> -		return PTR_ERR(corepll_res->io);
> +		return -ENOMEM;
>  	}
>=20
>  	return 0;
> --
> 2.17.1

