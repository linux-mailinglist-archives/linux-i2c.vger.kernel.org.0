Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E8A2CF8B9
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Dec 2020 02:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgLEBn1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Dec 2020 20:43:27 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:62074 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgLEBn0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Dec 2020 20:43:26 -0500
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.9]) by nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fcae5930000>; Sat, 05 Dec 2020 09:42:43 +0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 5 Dec
 2020 01:42:43 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Sat, 5 Dec 2020 01:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wmh5EPn3xy6wQec6/PgC5KNMNc123PR53RP2Ypbib46ZD72aJ5OC9ncynizd5Q8gu/wW/6HQ9SCtzFybW9lilbQN1L6ew6amAzK78zBZM1Vi53aFA0pxBhvsw6F9s5QqLgjRcAkOaHT9b7VT12bO1ZWdduzzmK//rdj8FhqoCeG6x3iI+jHbocs6m9SmxHsJyJHFthQYi3UKR/dqjM/s3HcxF04vlNDDDkzrzIITpfgt5seozAPPv4noVbV1VtXjqnojoxc6OVf4N4+dM5mQMVAeb+LqauGv5raVM2DluYOCtvzvB+1psoV2qYiKFYDkpSh23StddCFEjPjiFwaRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjkgYF4AB4Q3Lt7aNlLmxGD4bTSjMKipQ6XbJGA9xYg=;
 b=g8Yi521pW/Esw4O5ZL3QsI50IBCq5VnWrWPPKK/cSS5tFks1UN1XDgIuhGwlUVpnmHj7aOdXycn+dXe8PkIGucfxQNccB/y/kp+lgerxNxcrGUvgJqqQIjnIygmibyZhvg5TdhhB/NsWbdTKsrdbQkAgNqukwRKp9fkxzzh/EaXAML+Juk1Cn2G7mDQQ3F+0yOWSRaoAzqnzqp6W16XN9yZ/LIeG/gAqi3Jp7WSPQKD36vv7+hhXZLcw5CAaYV+bjLp0iYS4z14AwKJmDUBDBg69Y+Ie71OG3mYniEqzm11hZFiGjfC0mGjweAODtC8UVERe63HeUyJfUB4Gb9946w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3519.namprd12.prod.outlook.com (2603:10b6:208:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Sat, 5 Dec
 2020 01:42:41 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::9d:422b:e41e:7c47]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::9d:422b:e41e:7c47%5]) with mapi id 15.20.3632.021; Sat, 5 Dec 2020
 01:42:40 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Wolfram Sang <wsa@kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: mlxbf: select CONFIG_I2C_SLAVE
Thread-Topic: [PATCH] i2c: mlxbf: select CONFIG_I2C_SLAVE
Thread-Index: AQHWycRXiFgmgJ7R50+Iaau72KsCVKnnu5tw
Date:   Sat, 5 Dec 2020 01:42:40 +0000
Message-ID: <MN2PR12MB361604627D25FAC38CFBC883ABF00@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <20201203223311.1251788-1-arnd@kernel.org>
In-Reply-To: <20201203223311.1251788-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [108.20.133.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 528689e0-c596-4170-7513-08d898bf0db5
x-ms-traffictypediagnostic: MN2PR12MB3519:
x-microsoft-antispam-prvs: <MN2PR12MB351918D4AC662B366962BCFBABF00@MN2PR12MB3519.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I3dvyINmVk/adb0OpWE/WtxJJXmYxf7Q+yu1yTgPj5gbigJAuqAZVxLDPHR1lhTtkxjXK1g6FcB6hp/xxraW9oW0RMFuHACIhIcu8hg3ZvwSlxEy/fQYZvX6FzVExK06Kju63bwgaJj6kSCYQuTqSp1aNBDjc4UFL44k9Geh1yqegtQvKiw8v/XqL0nn7teO2S41u1cq4ROs4pC8uFTGS6VSMI+Wt7PpaGaZg8nXbbFdNGJxbKE1meJTi64plHjQSITD+gPjwCP+ODFkgAST2xFyxAd1GTTUaH5E/LiG7V9UPlN6FhSKFk1o+lXJPaUY/4nXIio+FyJJu1mKA5+J+tTIIJruFUYlMPEBteOvN408h/uVrpiOr74beh25EocG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(54906003)(76116006)(52536014)(66476007)(66946007)(83380400001)(478600001)(66446008)(4326008)(66556008)(9686003)(6506007)(186003)(64756008)(7696005)(26005)(8936002)(2906002)(33656002)(8676002)(55016002)(86362001)(316002)(71200400001)(5660300002)(110136005)(70780200001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZpFREHatp+TGhs0jXo+gZs2KEcEo9vU4W4Q4NN4lmBcKCjic8q/duOTLmogY?=
 =?us-ascii?Q?4dnF/9t0A6kWQP+SIN/A3tRwtDcK56snQ5o0pEvgTOyq+4Zn4H/k4nTRi7Wn?=
 =?us-ascii?Q?t5s/ags3SsvMzITTvztzeQ3Skc2YxwInCfPBGz6ocamW6It2z4JJL6/OcSze?=
 =?us-ascii?Q?6/KCTPohTsYTebeySdg17OjmOoX13OHoK4wY3axUumI+MJdJ250j1eHqfN+1?=
 =?us-ascii?Q?xhRZKdSX561ffdaHC87coW1arIGy6toRAFJQ4Feo3AnWEh4CG5nmCic+VJKY?=
 =?us-ascii?Q?5D0xMxL0NpIuKg/OMdtHT4exJhppQhI8OSFq3YfIuTKkVSf+90vlQvPEZm+S?=
 =?us-ascii?Q?UHuASR3PD+uKe6Aly6fbVxazuSN1TfZ4rVR65DywwTrePWEO/Q695C7rsbcC?=
 =?us-ascii?Q?Fk8gY4lhjpDv1yMNhyy7FfwZ9YN8ehxj7kiC7spaXLkaRdBkbSSdoPHtm2li?=
 =?us-ascii?Q?VJ6yr5pHFfwpnSBcRZQAFxReV8Ztvc2moPzDr4o9wgC8RjN7Xh/NzmpzNWst?=
 =?us-ascii?Q?YGiZK8dm28gVTF55p3aBwJl77XTsSMY6iV3mAj9lqrwdtFiJXv5U+GzBje7R?=
 =?us-ascii?Q?mhAiLp9Lu0fIkgR8Sc5ErFucmKDzyYYe4MFhNDECvvMHrLDEawgHjbMhZR0H?=
 =?us-ascii?Q?7yqC36CRyXCauBokih9b5vb7dEg4JUwFj6WsYYQT8E45vejWeG8EiqxKSNTT?=
 =?us-ascii?Q?1Obe91IgLcwKNaPvIerzE4oZFgngRXZHoN4eqI0k6ApK5EH/5J6qa2G9oL6H?=
 =?us-ascii?Q?wOHSLkpWw8YhqCr+ufidQ0N1E98CGDomf05Fl4hYgCoVNf9plCY2hEesrBCS?=
 =?us-ascii?Q?zzKxuy41PxMJEl+judkJYinw4lj4MWhFccLK6KRN1ENaV0FwnR8LMXw2I9lG?=
 =?us-ascii?Q?szAJkqPTyg0N5NCMZQx1QD1p7f/RKJbF0SIdLCmMOeHyZFUlUer9b3k/Y0sg?=
 =?us-ascii?Q?nDBL47DhyX6bCeV6TAsKIFDExyhIVZ0RpP2PMFZh9+8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528689e0-c596-4170-7513-08d898bf0db5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2020 01:42:40.7697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1luPGZOLb3SjJZkQV/wOC+67TVSUe8+oXBF7fh3fEQtWKTosCjLz+quzHiVfp2hvyKBRVnpp9vZNH4BVbUZ+Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3519
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607132563; bh=PjkgYF4AB4Q3Lt7aNlLmxGD4bTSjMKipQ6XbJGA9xYg=;
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
        b=IzCKj+7SWdYbK+YTmt0NZdAAIO4fXz52ZkcnIBDwgLQPKWuKghzDJ6zfRcqmwuU24
         ryMO6S316uXdAhVFC5X/L7xMt2AZ8rTE0VLv4YG00XcfrpABflModJFzsl+tk8qs5R
         aIoheQdXb+UYwiFgT10Oom27kieQbbxLIYqaLgLNPmVu57vK8D7T+SR4NIlzXuGTJP
         Q4lGhkS8tSq1rknb/EUZYoeiABGEk8oQp88cfGuSzLDfucmzsfuEfng8df/c2NmxQA
         jjiDtI2NSVmZuQ+nGJjjd596xPrScVK9mIjAt3fdXultEoC9eWc6IZHy3HnsryCF6W
         ohe5lonBEZBjA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> Subject: [PATCH] i2c: mlxbf: select CONFIG_I2C_SLAVE
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> If this is not enabled, the interfaces used in this driver do not work:
>=20
> drivers/i2c/busses/i2c-mlxbf.c:1888:3: error: implicit declaration of fun=
ction
> 'i2c_slave_event' [-Werror,-Wimplicit-function-declaration]
>                 i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value)=
;
>                 ^
> drivers/i2c/busses/i2c-mlxbf.c:1888:26: error: use of undeclared identifi=
er
> 'I2C_SLAVE_WRITE_REQUESTED'
>                 i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value)=
;
>                                        ^
> drivers/i2c/busses/i2c-mlxbf.c:1890:32: error: use of undeclared identifi=
er
> 'I2C_SLAVE_WRITE_RECEIVED'
>                 ret =3D i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED,
>                                              ^
> drivers/i2c/busses/i2c-mlxbf.c:1892:26: error: use of undeclared identifi=
er
> 'I2C_SLAVE_STOP'
>                 i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
>                                        ^
>=20
> Fixes: b5b5b32081cd ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueField
> SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/i2c/busses/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a97a9d058198..a49e0ed4a599 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -734,6 +734,7 @@ config I2C_LPC2K
>  config I2C_MLXBF
>          tristate "Mellanox BlueField I2C controller"
>          depends on MELLANOX_PLATFORM && ARM64
> +	select I2C_SLAVE
>          help
>            Enabling this option will add I2C SMBus support for Mellanox B=
lueField
>            system.
> --
> 2.27.0

Thank you!

Acked-by: Khalil Blaiech <kblaiech@nvidia.com>

