Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8446D3452C0
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 00:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhCVXF4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 19:05:56 -0400
Received: from mail-bn7nam10on2079.outbound.protection.outlook.com ([40.107.92.79]:28032
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229871AbhCVXFs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Mar 2021 19:05:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfyxMNgh4VuGd4Nim2GgRASwHtHtiXvdA+0Su+z6ua9Azfv9eagY4dXe0JrP5aCF4vlfFGlEWJCJVBWJmJnMQ9Jm34fa483sonuwRVz7u7U7EBknL7xGaRxSa5v4UDtUEQ9aa5Ol/sfURjB1hu4SgPVv1QETRgWM1lripXS8YX7wfbCfPCGsqKrr+3IvUWJqn9dzZqjklZ8170Hpdo71MIpCOXWtm1hapEE1eXY6OSyopXDf3oELbHc5eIjXMaS+NvQxp/xpo0O17AO9pi7BDxhrrlzuXmGA50a2hELw1DkT4Nto2a9xDlAeyqDK2NZp81Ns4/2BOw05bGNHSQIArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nm3HaCRZlr+MfOJbJ56T+KtdcGJjtCj+80AJUa7WsIw=;
 b=Osv2Y8i514aVZNRbCwxIcbw/JvZKZ4tYxP0ckScv3voCO7bZe6CobTp53Ui2o7WtMZjmQI8OzORXduVojFLXKsn87X5gY1oFu/xpNRRiJK9ifOUtHPjAyGFPtL2fRXFr4TAElhm0+SPuqhH6rII+17IVbyXdkVctsjREdyaWfWOhuFQcRi3JiTaOeamFMNZPebXXl69odLVRxNV1q0SVw4/AQ/nFvW2I1oM4SPqCvgdr3luMpIFbFdz4VxPwLITSCLDwQMo+bRQTZUkDX2JBPVnbGD+9Abl0D2EEVBCjm02zPGtLGA10u1Y0D1D6Nma/tCbSzMGuRXtWsrWNP4AQXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nm3HaCRZlr+MfOJbJ56T+KtdcGJjtCj+80AJUa7WsIw=;
 b=mA3g2+UDFzdiC9kM+uEtzjnBipIzdkNJn8kxLfAkK8FD41k0Y4O2SzSzxksmlslqFXHxrhVf0Dg4El0lMX5RqdFqGVoUC5zi16MlipMpy8vxBg8GhGyLWG+wpwfaitCnHmRkwTesmKSbUSmXKvig5RWFOaJI+9oX2Nr8Os1QIk4ETYxUjN1XdSTvzQGH5qEAW+1WdwK/p/hgwuzzmiCo9mblpgJD31h2DglmTiWtYVKUrg2n+1JKbZdzL0v7YonkAtLHK9iPI3amYN5aYorsUBuWUa8mRmaSSK2J8hEqgWaGc8FbXmY2BDsONMd8N8BI/jpi7y55rSN6gz5gCON4sw==
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB2973.namprd12.prod.outlook.com (2603:10b6:208:cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 23:05:47 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::75d0:71c6:68b7:d971]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::75d0:71c6:68b7:d971%6]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 23:05:47 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
CC:     Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: RE: [PATCH v1 1/1] i2c: drivers: Use generic definitions for bus
 frequencies (part 2)
Thread-Topic: [PATCH v1 1/1] i2c: drivers: Use generic definitions for bus
 frequencies (part 2)
Thread-Index: AQHXHzv5BmB2lqJv0Eas3SF/QSU/B6qQoNyA
Date:   Mon, 22 Mar 2021 23:05:46 +0000
Message-ID: <MN2PR12MB3616832982345406F6289CB4AB659@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <20210322165405.44980-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210322165405.44980-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [108.20.133.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77283a95-7f96-44ed-06d5-08d8ed870734
x-ms-traffictypediagnostic: MN2PR12MB2973:
x-microsoft-antispam-prvs: <MN2PR12MB297316D879A61FFC36F8B5CDAB659@MN2PR12MB2973.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qjf8qrvqRjjZY5xAdoDjaak5DkcSvuA2LB2gswr9wokJO1N2AGcj/enLYUZbt5Op1ixhFWYDxUy+kWAia7Ws6TrV/Xa3/hnrwarboJwP7N0UNOlemJ/PRwov+9y6BqZ8u5gI5hd1hC4FB70g17V+aLwZlfBzix0STDNyuloiDj7ODNFV1LzNHZAdF62uxg9Kj+CbuPqwjCUZwgBXMavoy+avjWz/qf/B0/uZpjT0U8uMhySjxmp+SBUmlNrOQWjNwm/Qftrh2ce7ZeNodT1XRCTPk1szXdhNKDlK7QWIE3NTBgR0CULzFQ65K8eTi96ylr+Wq4SnpXoD8VEmrwjSXfq3zQ92P/8TSSJhoyvS0qEOZbJy8/aARq7x77M7PyYR7rCjl3zKMePObC3juWdkKeZ3ydk67k3QVxV2g5/g8Ib47ZU6L9wnprlbS3KfmzO1PCs4DNoFI77ZpQD6E3k/rS5CiHwu+XKKpWWMJLK63hA/giLSZwmBoZMYLnjQLJ8VwvvR6/weBS6W4xihGNJJaP1j4qs6WB1bvD4d0KRu5jJk/csg07plNF7iJlLYm5cwkHUzw85Z4mMcB9LzhXn18iWBqsr8eN6dwYf/aNTMODACT8LeZ30i4Op+5qBjHUxP+YjzgJtoGR5ValYmIVCgKLdrSXSA85CG4rhdkkJheAn5WVg8tZC/fSl5q8OnLgut
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(33656002)(4326008)(110136005)(8676002)(52536014)(316002)(9686003)(5660300002)(54906003)(83380400001)(55016002)(71200400001)(8936002)(2906002)(478600001)(26005)(66476007)(6506007)(38100700001)(53546011)(66946007)(86362001)(64756008)(186003)(76116006)(7696005)(66446008)(66556008)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ow56ndLdAtiNyldPe9qiy39GnQu5Q/s7F2q5JnAipJRLMiJ1kPTM52hrEjha?=
 =?us-ascii?Q?BxUX66UhLPJQf2BZeBKJSVAtX02pcr9xYxJMNYWSXRUL4nvWLAetSBVerBC+?=
 =?us-ascii?Q?7vJ5la+QWJ/9pr7jcJKUNHkY4CB+EWm/0JjV9NvJCA5w/UePL32/pSK9Gzss?=
 =?us-ascii?Q?yUpvpNZ81X7nSwA9GOjxFfi3yYG5dUUw87+k+eRGzr9JVDz8pj6+53M8jvyG?=
 =?us-ascii?Q?hSwpLGaNk46WN78yFMRWWAkaLLv3B4vG2gWkJwPecbV1wNuYYqDPTNZe+HU3?=
 =?us-ascii?Q?i3i8ZaIOJomt4n7p8t60+xnip3aZoNhRnIxV1GBBdqTJQIWOF2tJKbkXZRPO?=
 =?us-ascii?Q?8JUmhUeyvyrtCt06+U2SgZZ43YDp67Sy+naLV3MuzZY6unse/ZAsxI9J3Mh0?=
 =?us-ascii?Q?NdtAolwqfBJQxDuZYEGpE7wkPkXGZ2h+koLVM5yIJmAnlQj2wqHKcE9LWLQG?=
 =?us-ascii?Q?rXG35ZEpEDemrSWMWV8YY6IhoavOvzB2r0CczaPZebP2bMj7btIMfsZICn9y?=
 =?us-ascii?Q?LxuVKwHtY44LsjoMCAtACGnuif2gh1Mt7NBV56oGIZkYPtGGNN5JAZ/TRblc?=
 =?us-ascii?Q?gkCo6o1LydKmUlYzls3itz+0DcNgOydnZbAEvXOCRAiX1METrYO/ruMXzPi2?=
 =?us-ascii?Q?xv2xNuOjI4F4/z2GpbuP5gAOBKIhPfhxz4CRC3ZgBdaUYL2UsoNU2Ua1G3G/?=
 =?us-ascii?Q?dGOXdaAJpqY64TYVOQb4uyYVx2GHUrqjWxNtGIY0Ua3sKfZdG/DZHPzknhPq?=
 =?us-ascii?Q?74fs05ChV9V/WYXZyn/MnESEgtc9X9+Uy2QoOv5Qknp7opYDtU9exwUNXIwf?=
 =?us-ascii?Q?NWtQjZYz/7fNj5LsVSM8c5fBduBYAhwzUMhJwVSg1inwc6pj8ir3Nlf4W/sl?=
 =?us-ascii?Q?q0LmGcfmojNBIkhzJsFeHH6wius2RNVZyyRaWMeB+wAGmXAI6tbrRvIkZAp9?=
 =?us-ascii?Q?LFdonQixOHFseBkFpsTX06WKztDzKdsg7X43j0vak1dpnA4R7D1vFZcGhLTj?=
 =?us-ascii?Q?cmRg3PpU/i6KjZClewWTX1Rqp6x1JibmIjTENMcgBxWxxHxXDDH8EgIjbakV?=
 =?us-ascii?Q?SJgT6qPcs4fzE5EH2Scn4EV6wz4DBQsTrw0x3zn3hJV9cqdJpIVeFhlY66zh?=
 =?us-ascii?Q?f6ceoOLtTMG5PBraDUNFvYrH0KUhEUgOHv6eb6JCb3ASFBz/z9XDtvPMjH7I?=
 =?us-ascii?Q?O8v+snjQkQ4VeM9NF9ZGP3uRUtbsNxzdTTWMHg34Oc09H5ss/jDUO0ADG5rZ?=
 =?us-ascii?Q?WCzHUNb1UdV1zWud/s0oO0uQ8BU8vvs5uZNtJTenEx7ft1BCEk7k1yKNXg7e?=
 =?us-ascii?Q?pp9EVgiU0WtsnhhLmJURWt8s?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77283a95-7f96-44ed-06d5-08d8ed870734
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 23:05:46.9073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xfv+NRYnxTxGEbQ6L03nDP/HxuLJqyWUPt5KR9SMKHvT5aeoLn+LjQ7nhD3mxH3/nctg4BZDra6RN95xjk97rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2973
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks.
Acked-by: Khalil Blaiech <kblaiech@nvidia.com>

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Monday, March 22, 2021 12:54 PM
> To: Wolfram Sang <wsa@kernel.org>; Khalil Blaiech <kblaiech@nvidia.com>;
> Loic Poulain <loic.poulain@linaro.org>; linux-i2c@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
> Cc: Robert Foss <robert.foss@linaro.org>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; Wolfram Sang <wsa@the-
> dreams.de>
> Subject: [PATCH v1 1/1] i2c: drivers: Use generic definitions for bus
> frequencies (part 2)
>=20
> Since we have generic definitions for bus frequencies, let's use them.
>=20
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-mlxbf.c    | 14 ++++----------
>  drivers/i2c/busses/i2c-qcom-cci.c |  4 ++--
>  2 files changed, 6 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxb=
f.c
> index 2fb0532d8a16..80ab831df349 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -172,12 +172,6 @@
>  #define MLXBF_I2C_SMBUS_THIGH_MAX_TBUF            0x14
>  #define MLXBF_I2C_SMBUS_SCL_LOW_TIMEOUT           0x18
>=20
> -enum {
> -	MLXBF_I2C_TIMING_100KHZ =3D 100000,
> -	MLXBF_I2C_TIMING_400KHZ =3D 400000,
> -	MLXBF_I2C_TIMING_1000KHZ =3D 1000000,
> -};
> -
>  /*
>   * Defines SMBus operating frequency and core clock frequency.
>   * According to ADB files, default values are compliant to 100KHz SMBus
> @@ -1202,7 +1196,7 @@ static int mlxbf_i2c_init_timings(struct
> platform_device *pdev,
>=20
>  	ret =3D device_property_read_u32(dev, "clock-frequency",
> &config_khz);
>  	if (ret < 0)
> -		config_khz =3D MLXBF_I2C_TIMING_100KHZ;
> +		config_khz =3D I2C_MAX_STANDARD_MODE_FREQ;
>=20
>  	switch (config_khz) {
>  	default:
> @@ -1210,15 +1204,15 @@ static int mlxbf_i2c_init_timings(struct
> platform_device *pdev,
>  		pr_warn("Illegal value %d: defaulting to 100 KHz\n",
>  			config_khz);
>  		fallthrough;
> -	case MLXBF_I2C_TIMING_100KHZ:
> +	case I2C_MAX_STANDARD_MODE_FREQ:
>  		config_idx =3D MLXBF_I2C_TIMING_CONFIG_100KHZ;
>  		break;
>=20
> -	case MLXBF_I2C_TIMING_400KHZ:
> +	case I2C_MAX_FAST_MODE_FREQ:
>  		config_idx =3D MLXBF_I2C_TIMING_CONFIG_400KHZ;
>  		break;
>=20
> -	case MLXBF_I2C_TIMING_1000KHZ:
> +	case I2C_MAX_FAST_MODE_PLUS_FREQ:
>  		config_idx =3D MLXBF_I2C_TIMING_CONFIG_1000KHZ;
>  		break;
>  	}
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-
> cci.c
> index 1c259b5188de..c63d5545fc2a 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -569,9 +569,9 @@ static int cci_probe(struct platform_device *pdev)
>  		cci->master[idx].mode =3D I2C_MODE_STANDARD;
>  		ret =3D of_property_read_u32(child, "clock-frequency", &val);
>  		if (!ret) {
> -			if (val =3D=3D 400000)
> +			if (val =3D=3D I2C_MAX_FAST_MODE_FREQ)
>  				cci->master[idx].mode =3D I2C_MODE_FAST;
> -			else if (val =3D=3D 1000000)
> +			else if (val =3D=3D I2C_MAX_FAST_MODE_PLUS_FREQ)
>  				cci->master[idx].mode =3D
> I2C_MODE_FAST_PLUS;
>  		}
>=20
> --
> 2.30.2

