Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52317346DF6
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 00:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhCWX4Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 19:56:16 -0400
Received: from mail-dm6nam10on2045.outbound.protection.outlook.com ([40.107.93.45]:36545
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230439AbhCWX4G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Mar 2021 19:56:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9FL35oA+UMi012herBCE9+gXALbCoXlfKevXbCd4zuqQdIkwyxlIQ+GVbIatFByRQxR2PRPBDJkAXuEIooAa9eyPqG34shOAhLWMeAFRjVCBFzXhigbLe4E5//JWlGa2nUKGidqXWO0/p2w/i/tgGTxrI/qshGm6AlxLERr34EqqwikrGwKuKO3xyXD5is+cOY9XDCNfqNqpLHppGZlHgnOzttfAP3qaVeI+f/G2v88faWbGK0i+4mAu6dVqe9LriHcPYTktRojv0aSXI3NRMdyHjyXloCLlNydTNMXo4YzefxxFYyqvO8a9wz9VLgvNg067n90QyNRqZ8Yn8byxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxoQ2QUiTMvTkJNh9EFN6/AeaRtgB5EXsOMaCmvats8=;
 b=QZNmIARiNNrbu3+kSLHhh7bYNqsxiW4yXyD5GP/yOZt4fY+7BjWoh+hG6pdD2CCk2Cvdx1oTedEOD7C4TD98lCJcnfcXNw/rbpt4d2a9De2aOwAJzO4Pata4TAGuWSfONFujpZbo+r7aUCSvzCTAhe9nFp6CJPCuameC/vIcX13GKeJMp/X63Ecv7odify49R+/k4wmQVmmQkcbDm3r5N3Bl2cBLv/OO+L+lGt7RLitHEYjYHnkXN2oR78HPFCuQeBT+8OHcL1YDHCaNgR37NZQ4uDN5ZkCP0lOqbc/vjKliEpnLUWY7CwhsKMKUm64f5Z/azx+anND8VBo0aFz6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxoQ2QUiTMvTkJNh9EFN6/AeaRtgB5EXsOMaCmvats8=;
 b=A62+R5z4mmNqbJcq+j0Wzt896e5fH+h5nMNc3+m9uWGIHYw0sPwQw/P9swv8u+DmyQ48Rf+7SN1U9rjib94lS0XD/2mQ//A7RzIc1jA8H+VmnUg4kvHB7deONC6K92FWkXQCdqfsP74X9GM6C/rIQFaF8IgdtFMk0MSmDb0N5ixuvjvFhlCRMMIvuCpSTaKwB4vvFma811J4aDZR7NTBO5Y/AphoW5jL6PDwMRpiaf/tfm9zeo+jQIvmd0m8eAks2xL2PzkgGV2R72Tp5rMJVu7GqRwv5Ddj0syHg1eWSu5WLTDsFof5mLV5J99Eru4As1Yx0teeN+vzNvEDVMSiuA==
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3373.namprd12.prod.outlook.com (2603:10b6:208:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 23:56:04 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::75d0:71c6:68b7:d971]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::75d0:71c6:68b7:d971%6]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 23:56:04 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Tian Tao <tiantao6@hisilicon.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH] i2c: mlxbf: Remove the unneeded devm_free_irq
Thread-Topic: [PATCH] i2c: mlxbf: Remove the unneeded devm_free_irq
Thread-Index: AQHXHJ2hrHfCbetUW06XN1uBWIz2UaqSNztw
Date:   Tue, 23 Mar 2021 23:56:04 +0000
Message-ID: <MN2PR12MB36162F0B6AE7A7773F005B99AB649@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <1616144165-54498-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1616144165-54498-1-git-send-email-tiantao6@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [108.20.133.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bca419cb-34a1-4291-7fd2-08d8ee57380e
x-ms-traffictypediagnostic: MN2PR12MB3373:
x-microsoft-antispam-prvs: <MN2PR12MB3373474152F04A08B2953D80AB649@MN2PR12MB3373.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kXE9RAms3EJlCWN9nUgk9g5GmiahD0PGg1WDUy/Da+V2f6BAKnstl0EtmkIebAUBK0yCAO9rEKWImwteJrnXu5iL3T4PL7VgUuDpyH/Sl4u3QYmnbY2iNi27RJUqB4ozwMoB+OAWMGKPUWsZ35aBupxQ2SVAPvX9E/b/Nw8xhXIFmGGX9LZt9HNCtrvlenesA0EUL4/joUP4DIWvVKHY5eDf4//3rQxhM08OYWDuQwRSZ257ZVb+bn5CK6j5V1zu4nmfDfslKR46OXrzbZrXPo8FjZjbqj2FU155pQ8QOogpZRZ1bjRKu9d5Qi78VhZkSjLgf7+96oDCJfEqlB0TKB1xAh5INZeHTXHD0uTgKrGga+RlCxtjGOGZ4BcFKIPItnq6WqMxZBCpgKKt8bF6JVFNwLlg19hSAH1bdU8djgQOfpb3R24O2yNSuL2XwbGOqI7V3tp+pA+jG5kNrKGGLU6Ttg0XiV2ztvUCb/8RR/Q15EKcDsXE7arBVzozZe2u+r1/94yFVn0cscvH8Rn8j+rcrRTCW1p6OpYbjX1eJNZ+wkI5dVySGGboHbuwCHWjuVdSyy3o9RHNoXXEQvyNT+mVKPvcEbB1qWvt02mrtKb7XWT/oYavLBDogPc96PHBrDno90BTNRPxZ6An9cfwqYzajT/FKlZIC1ShXxZ//A4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(52536014)(64756008)(186003)(9686003)(2906002)(5660300002)(76116006)(66556008)(6506007)(26005)(66446008)(86362001)(33656002)(53546011)(66946007)(8676002)(6916009)(8936002)(7696005)(55016002)(4326008)(38100700001)(66476007)(71200400001)(4744005)(316002)(478600001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?J1fWg6bAycPfMfYj/wxfVupYGFlxJF6kSRFUwb2Ey5sUx3yXzQpiOJklvlya?=
 =?us-ascii?Q?pZv0FnDsLeqUml5wuVtn5k/Zhk0aWhrZGN/sHKeEHUGgrM02z5oHEfkcYVZz?=
 =?us-ascii?Q?LTuKv3WjncgFoF/+507okMYyTlY+7M4yh5AN6zXUF/58VK9P0Ya3Ps28/hNC?=
 =?us-ascii?Q?5hkRnX/uc5FM36RFDnMHqy2NcNe8otfI5ETULTvU6M5jkzBPhrMEMUS6MPE+?=
 =?us-ascii?Q?vJ/8NyH2OsNb0UvKrg5z+yuD3ThyWoyJEUe7iROOCc44jjv6tAUZVyKitasC?=
 =?us-ascii?Q?aS40WPru9C+HdDe+qPGTYZy3vbA+sS34047mfIEC0oCq+LK9aDZfX55f1Alb?=
 =?us-ascii?Q?6VBGpZDzDkEZBOi6SUAKwaJYV9ac2XipSzggM/IfNi6jnJjbCE2hNO7az1O7?=
 =?us-ascii?Q?iZ/UqVFn+RSaQHD1le5DZQrTr/vP8hvHItImGW9C8+di7H/DOqkD2y1uzJdx?=
 =?us-ascii?Q?ThBj92t/DQUeQKE7dV54iGBkDeCYiKGtHPQiwd7s02lbYmrGPiV9ceeqJ9yb?=
 =?us-ascii?Q?vd+IPaBpYnxHJgl16mEUv+2Js3lnwtcTUlhl3bbCMngcoVn3KPE/fKfnIgaw?=
 =?us-ascii?Q?lkytA3T+OQrsIAsFqcAuL+XdPf4uTwNf/3g2eSaq+80IAjPNZkjGJsu9dde9?=
 =?us-ascii?Q?CAb/vRzLgde7jrtQ6ae3FzrnP4I0sNvSCVSZgNAHOCLoFSKtC+C5F3xODjUE?=
 =?us-ascii?Q?C0Nsu325BmpBLBmuVNWxMC9gs38DeapOov8rB+3UbvHqrr7zqiUvZoL17q31?=
 =?us-ascii?Q?XjAATyo4hLiPcORdpiZF3jrh6Odb9+1NSOwS029tF1w6VErDPg9ZTukFdX8b?=
 =?us-ascii?Q?oQVJmV6X0htyK0Kxd5FBz7H7Vg9lmOXpJBHpqgB/be3iTsYnLzaEQDbFL9Wy?=
 =?us-ascii?Q?m92YbuQgG/VIzrF6YcgMdcGQnNfjP+ghEdFLLEq/s54I1XjxpVzj9OqAt2hV?=
 =?us-ascii?Q?0owpr1kDa0aKmd8hEcbR4X2VZwmXLgufofZJJmQaUUEPpyFHJJiTxNGR57zh?=
 =?us-ascii?Q?aTuqA7p4cLO91Mcj4PtHprq/gtE1v9HtogP8sxWT1Gv5FbsPUcmdwjKD1/nd?=
 =?us-ascii?Q?NSWX29KEBBd+z42sYOWtsobBywIMskSOffRg/IM/PiON91XFFEHsSEUe3h4V?=
 =?us-ascii?Q?JrfVnZouqzx7CZW+SECpWnnX0RMYpHwk2jO/QIQQCsZwwJR5uMTnMdZvsmxZ?=
 =?us-ascii?Q?vBeaIwRG74Lx9KTHtrGzVBKZ8iPxvN0WuuTaSiV77th4Hed35KuOiZXmr1S0?=
 =?us-ascii?Q?Lw/8uvqlon06ri2uf2LbYOA8MRC8N8lBajKHCA2b8KlmpwkJN0CtssMD80M4?=
 =?us-ascii?Q?9voJjElfg2uPhARsMi9UUu6J?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca419cb-34a1-4291-7fd2-08d8ee57380e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 23:56:04.2595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkPsqtlHJxi4/6k08qwfIyeIoDsjsdVT3x9AOjJ+N3V3/y1ljviicV5FdLphhf8mXYJQsNcd2DZQi7CK5flDIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3373
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Tian Tao <tiantao6@hisilicon.com>
> Sent: Friday, March 19, 2021 4:56 AM
> To: Khalil Blaiech <kblaiech@nvidia.com>
> Cc: linux-i2c@vger.kernel.org
> Subject: [PATCH] i2c: mlxbf: Remove the unneeded devm_free_irq
>=20
> Use devm_request_irq to request interrupts,devm_free_irq is
> not needed to release interrupts. so just remove it.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/i2c/busses/i2c-mlxbf.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxb=
f.c
> index 2fb0532..ea839de 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -2426,8 +2426,6 @@ static int mlxbf_i2c_remove(struct platform_device
> *pdev)
>  	}
>  	mutex_unlock(&mlxbf_i2c_bus_lock);
>=20
> -	devm_free_irq(dev, priv->irq, priv);
> -

Thanks.
Acked-by: Khalil Blaiech <kblaiech@nvidia.com>

>  	i2c_del_adapter(&priv->adap);
>=20
>  	return 0;
> --
> 2.7.4

