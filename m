Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FE22B28C6
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Nov 2020 23:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgKMWt2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Nov 2020 17:49:28 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10003 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgKMWtZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Nov 2020 17:49:25 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5faf0d6e0000>; Fri, 13 Nov 2020 14:49:18 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 13 Nov
 2020 22:49:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 13 Nov 2020 22:49:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWE1t4JNIWuoO7+i8qN9J8ns6IBoXp/ZU4Z2gqzjfQE+of4AjDRBSFPWrDipcQ8SgbM/KkAxtbptFAQdiQuYUt4nQGOg7LpbyeJ7YpAgoUY7WGjKgepP/4uW9NcDO2AB+C3SiW9yYd//p5nfAQ+Gfgm1wtTNBwymtd/AvJDiaCF6UtS2RloXAYKx3xgeFTB2OoVewExpyt1A8Hn+j7M2nSo7UyML6wyGrrShfScQjZRqPxBcLKlucAtyruea5ArOxl9dnUs4Ght0nPDwfiTI8H/SY0hOVfzmbD3pTg9juALn5CDAXHe0Bg0XEaZspgn+G8u4pyQv2xhoER71lFdv9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcBxMrEs5GeBnbhNW3/pDpTZsCGVPh65mxmBlJr8mHo=;
 b=Un4eMoh+C1AWePPT2lv20XDmgCijLNQNhBHMKmhHlAlL8ethSFPkVU1xFT3HwF7xm5OlbRLz8TR9NJrzK+17Yu2/EHnKvvAEsmc6I6pvq8eGbqj3cA4S51c4wD3LvoPpe+RgPhqy/a1HfqsciPaokzxAO0ZJDoFOHugeKDxpVhyL/DsSrJeBmosewkl6CPOQE7K6ztXWs6InQxYge9tJILQGXv1kDSKkzABZ5gQF22Bk8B14hF2lu6ypXQG+N+NNRqeeSoRdOGOOvOreD/zqsiTPsDUoy8+wX3CxisV7chcCQFag0Jpn52fIZYAUWMvNVlVnw51iWIT/xOqOOiPwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3229.namprd12.prod.outlook.com (2603:10b6:208:102::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 13 Nov
 2020 22:49:20 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3499.034; Fri, 13 Nov 2020
 22:49:20 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Wang Xiaojun <wangxiaojun11@huawei.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH] i2c: mlxbf: Fix the return check of devm_ioremapm and
 ioremap
Thread-Topic: [PATCH] i2c: mlxbf: Fix the return check of devm_ioremapm and
 ioremap
Thread-Index: AQHWt9nwVK4oFo5icEuZSoh7JlW07anGrMHw
Date:   Fri, 13 Nov 2020 22:49:20 +0000
Message-ID: <MN2PR12MB3616EF76F47DDBE1EEF37A3EABE60@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <20201111032726.3675159-1-wangxiaojun11@huawei.com>
In-Reply-To: <20201111032726.3675159-1-wangxiaojun11@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [108.20.133.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 309c044f-dbf7-42bd-182a-08d888265bb1
x-ms-traffictypediagnostic: MN2PR12MB3229:
x-microsoft-antispam-prvs: <MN2PR12MB32294AD40D5D867B2347B9D9ABE60@MN2PR12MB3229.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:200;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F4WVPtR7obIdMGTOoPalpVVLSux/xdcXEKGqLdvi1rBrJKLhsJWyL5B3NucShsTWQ+NkMdJpcL3UGAbAX3Vt4JC9uDoAHkGe0ymHwY+aGXjNXxT7IFF9qFD/ozTA8w/O7h6DcdjHeePJTBfoNHLhJVwlfH4E6+/xXSshNlrx4co5SP+Y8tEjIdTR4DhBR6T4v4dpNhzP5glHbXIegfPpsAnl97u3OX/8YV8A9KUfa2PHlK/BGAXieWkvrFkj8V/C9EKr+Om8p9rT01zjtJVB8csk/C6qvhKZd97omp9A5fm/eERdgiopQxdRS37XOxiqR1V6UhtDZJIUhxu+0HkaXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(9686003)(52536014)(186003)(8676002)(6506007)(8936002)(55016002)(26005)(76116006)(2906002)(64756008)(66476007)(66446008)(66556008)(7696005)(66946007)(71200400001)(5660300002)(6916009)(4326008)(478600001)(86362001)(83380400001)(316002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 4f0zT86aNfcOJIZMt8VxSp/YAOX2+LIAzV3kJF8hNMysnMt0Z7oM4YRubji1DAiyD/NRrOnZEEF2xPZN0reV1Bt2mTaHPe9VIpEFmf95TLyC3ymFsp4H+CGdUaHOcBXl1wmniA0+z+ly9dOMeoxCRPBH5/HfGnz5wil3kDdDJqDrVA6+Qb+r2foQYvdxef9apVDZ+WgyuiyjUBZqy2S6+gbEU8djLbjvoKwEOg++eEQooiwsyo5gedVyWqj8nnggegSLRD46XBdz2rai2Io78EA9cPf1L2yxsNaqBTJN/eOGv9v4mD3UheFPTmrM83Bo7lkMggH9lmBIG+M3x2sdBRWfgp5Zmx3dnG6XtosBrgfwnnRHIkX9QDmdCEwwicIb6lQWPhN8iM1zpXGmi9Lwj5wx21FcR1Osw3zdFTbO5gkcvUxrjHwaECHrK45hvCrGfNrg/NB2YAVNsyyElPibHRKUCd/03MzPlvX3NVlE9c7hFvHdf+nLzQ2zX8v761u/SBq98XsxEY/1kHYmwcTMkYwCj+LJcYFvplxGCTnaZ1+henJIAdl1TPGSnOjPwQd6dtYU8T4WF9TvGSdzAoLjQ/KyR/QSd2hP14j3JyPzHKoi/LG5wvad9Y8jhkj6oqInAjtnRuEvbdnQymzSZYXwFQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309c044f-dbf7-42bd-182a-08d888265bb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 22:49:20.0872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vnfiy4Q7QCKMHrM8z7D00LkkMXEBOgdnEvEekvd/zNBf6X8CwubfNtpb8JlChF9HsxTps4daIk/n7S2+zIonfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3229
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605307758; bh=qcBxMrEs5GeBnbhNW3/pDpTZsCGVPh65mxmBlJr8mHo=;
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
        b=dKp/Je6EwO7ftebYUcEKNBtZi983nvAZCWsYf7XwnWtuMjoyGp0daYJ2yq/8FuFg7
         sFIbxhNKg91x2bIKk6kkwSiiaS82mAyjlEZ3m5UEhb+w5448y2+H+el0700oino8sK
         3nuWhjMqYOpWs36GmkIWx9r9UvtLESZVaNEIrnY8vWZTgzRqyl4pF2tfifOvbFVs8H
         oAE/FxsEkd2ZyR+M2h1N1KyB5VYSYWmO1AdAUB4pHbs3/TP4eu/EvvE3ani4EXUIv5
         bciqczpUNHSBNbeuLbYP32dmt3jd+UJPNRypqybAnDC2XXJdD9D54Zqa0Y7auJI3nH
         eyY50ThyyY6Vw==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> devm_ioremapm and ioremap may return NULL which cannot be checked
> by IS_ERR.

devm_ioremap

>=20
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> ---
>  drivers/i2c/busses/i2c-mlxbf.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxb=
f.c
> index 33574d40ea9c..2fb0532d8a16 100644
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
> @@ -1717,9 +1717,9 @@ static int mlxbf_i2c_init_coalesce(struct
> platform_device *pdev,
>  			return -EFAULT;
>=20
>  		coalesce_res->io =3D ioremap(params->start, size);
> -		if (IS_ERR(coalesce_res->io)) {
> +		if (!coalesce_res->io) {
>  			release_mem_region(params->start, size);
> -			return PTR_ERR(coalesce_res->io);
> +			return -ENOMEM;
>  		}
>=20
>  		priv->coalesce =3D coalesce_res;
> --
> 2.25.1

Acked-by: Khalil Blaiech <kblaiech@nvidia.com>

Thanks.
