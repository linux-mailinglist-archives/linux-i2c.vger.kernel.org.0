Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7B333ED07
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 10:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhCQJae (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 05:30:34 -0400
Received: from mail-vi1eur05on2084.outbound.protection.outlook.com ([40.107.21.84]:8865
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229632AbhCQJaN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 05:30:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PM1f7ww2qpw3i9dffPx7FN1HkNPmGeuE0Y3VqjA6i27oLqnNqKx3PJyS3mPgvfykeIGGYoHPqKC0I47FO/Si6J8eNm0hAiOv5bIXLwAztHQS78QUBKjtdbQCS6Z/mbEVZc5lxL2cSDsnyYEkBEJDvLoch42n6nuFpR5AuqXhE3hrMX9H1E135kPOeAMSgwj1SXQYMCl6IRh+uxWBRZahD4vrbkfkj/CoLlL8Yp3eqRN5qjJNp+s105IEf2g5n9hHwMMhYBjyYV0za8tVhYOvhJ9aGLSyd4ixKl6UdIChuNosY2JET7jCUheA39QZUOO57JSfl77OE7Azml+MuEUuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCn6xtmpM1e9GgYW39w+gLRL9YLl6q06z7HoqIBkErQ=;
 b=mv2suynce4Tuk4FygtBVYCokw+kzXUL83RvRHcv/zCJhySUnjXOHrI7dGK3CSMiP6cFi4sYb2yVRcHQCQVX/sUEeCbGenqGm8FeOkQ6PTexcoJ5BVCv38oa9UxU5s/kePVOPqEEMUPO8UI8Q6JxNo3ua+nz9ulCQZVHR2dw+WsVxGIkcpjAZAdcAGbOuu0/Gsrpgel0kBs3eE70GAFZ3sJahPKXkozV1Md1kV6r0E8I0jMOCezv4OwkLf0ZiObBv+pqcesP5udN+wP/OsgEmh9yg4qYVR8nmrz6OK4JhVjWnt6rBTUZN7LoUL4gl6ntEYweHoVxlanPyum6AkTeLyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCn6xtmpM1e9GgYW39w+gLRL9YLl6q06z7HoqIBkErQ=;
 b=YmbYdhjPnNDn5eIpGbkc9eJr0Up2dROfXH7VFpMDP+muNyXoOYgR/R6Q4eaIrfpahfCpiv/izEJ4Ly0wY7fyCs8P3CEZxXLWYN+rmKC6O2YN1c/SJ84HGrUoZyA83zVIzyyG4Bf0p4t8/WbMVCZeuywiZBFGBgWvUEimGMe3r24=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PR3PR10MB3914.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 09:30:10 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7040:2788:a951:5f6%6]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 09:30:10 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Mark Jonas <mark.jonas@de.bosch.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "tingquan.ruan@cn.bosch.com" <tingquan.ruan@cn.bosch.com>,
        "hubert.streidl@de.bosch.com" <hubert.streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH v6 1/1] mfd: da9063: Support SMBus and I2C mode
Thread-Topic: [PATCH v6 1/1] mfd: da9063: Support SMBus and I2C mode
Thread-Index: AQHXGoQ9q1Qbk9rEZUyKzkmMFfUVGKqH6xwQ
Date:   Wed, 17 Mar 2021 09:30:10 +0000
Message-ID: <PR3PR10MB41425F5C553DC7F5E67F6A77806A9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20210316162237.877436-1-mark.jonas@de.bosch.com>
In-Reply-To: <20210316162237.877436-1-mark.jonas@de.bosch.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: de.bosch.com; dkim=none (message not signed)
 header.d=none;de.bosch.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [147.161.166.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38c8ee81-4f38-4161-640a-08d8e92742d8
x-ms-traffictypediagnostic: PR3PR10MB3914:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PR3PR10MB3914C57FBCB58032A37633A2A76A9@PR3PR10MB3914.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xd84U3BMeXHuIxQ2a5bE3BWPhoO74ncnoHjO16vxts02eipnx33WgmSSsVbBgdqIXR7yoyrISsdx0FlyBFzj0K4iBTwGT9bfqM+af90nO+6Rg7w3O+3izHaeipeqx1LXBRY9OERtshVrNwaRhcvbOgdXRUPjw34yoFJmjlnFYhE8MSYv6qexsYOuGhovJhe5EscGbKpJ2e1tkmo9sNzvDqHogW99TCbpxrIva/twfv4lm3QSmbaVbQOd5aLhfe3vIdOO3+c+1Bib/lAOeVXbM4FKzomOMZpPR0O/VfPqHho2t/0qhQxxNgkOe1cZMaK8qWz0FUojXQb8YGPVTRPigb6XV/LbMBopD07OwRaMDyAYq1N1nT9Gr/285CbH8mqSkBPU0SdT4ayWs9CtnmBLmUKW5fV2WevhZKgMW8Dyr5vwCEtceRn3VY6aVkdFbvCgTtYoekfBiT2T5mUGIIMibVn4htAVcwnrBrY8sWX/ik8NYPeN7oiMfNkYW9G+OnK3adjoXkxnO5tEPwK2EHwuW3MBcr2ro5xsVzeBlMDQrIPJLIU1ARo0voWRL1dbiSh9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(396003)(376002)(66556008)(66476007)(5660300002)(55016002)(71200400001)(33656002)(26005)(316002)(66446008)(7696005)(8676002)(54906003)(8936002)(110136005)(478600001)(9686003)(53546011)(66946007)(52536014)(64756008)(2906002)(86362001)(76116006)(4326008)(186003)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pn0ikLIJf4JVzG5iD97fjTYGVDLv2HZF1J+tuVutVnLo1oa32AcylItcUag4?=
 =?us-ascii?Q?J1qeVKzZNIEmKABrvdBOBxqORx2Po/puDXFMLOhc8qU1jad0sYy9JnxxGOId?=
 =?us-ascii?Q?/CheDqJ8sTa9aLrNgAqSjaw9HUf8SfL5JBp/0IA1gQC7olToyw704rRW4rFN?=
 =?us-ascii?Q?Wc4r4ydA2VTE4+eGZ2AUtsZX89UjWiRVZw3IR5NYvm1tRPGGrHSZBdFPGz+o?=
 =?us-ascii?Q?nfcTPtE3qYvS4EcTzaWVI62MkNLBC+LB+VFz1jlAfzOSBruLwe04GsyAP6ks?=
 =?us-ascii?Q?4eSJ3EIWvcn2yBJsabE5+o3mIryDupM/iVVdlDtoknLZXwm50BrKP925RiLm?=
 =?us-ascii?Q?TOKW5tmXv+bn6sRZFQb9GaOd4A/GxfSUWcN7wZ7DOXHoMP34Z44uO+UAk9xY?=
 =?us-ascii?Q?i5A9keo6Yz9dFmazdzT33PPXCUJoyLh/tr6dX59DtT16dgyibj+rsBFdKSGj?=
 =?us-ascii?Q?KF0Ni9mf5531Pifv4IPG6pqqZdZ1RVyxMZEc9RCxpAd9elvIPxsP/noet0kR?=
 =?us-ascii?Q?3aDqYcUDCC7Dj3kGcslS38gwP8nijXQHqSQJUChbmLieojup5oya7PMsA4sv?=
 =?us-ascii?Q?XieNL5Lw40Fq0CmGnGhf11MnSih/2svlhqcOHEIEm7VPrR4xuaup+zm8dB5/?=
 =?us-ascii?Q?v/YGcpLwMmWChzjeShB2UTutSa7ZnECex1grrsEZHyi5md7kfHNZ03myhqx7?=
 =?us-ascii?Q?svKXQglA93qu4A3mjZK78YhWxiXoEQegMGtIp/0qRZiMkLOREnUs6PE6FcQo?=
 =?us-ascii?Q?VmDC2f9h51UvXy28oJmi6FKz2v/bZLjdExBBUH0prs9qe9UNnV+KD36UKd0q?=
 =?us-ascii?Q?D0a7GQSqIm54aRWv/JLCanIzwqTuc4AQVH7UfaBiVynfoxK4Hr6CnL6OQTKU?=
 =?us-ascii?Q?Oyz8Mn3yHdrufnXuhoTCnHKX7oz3mmOqFNaBVoTpm2yj0YvBh5IKuo8BW5Vp?=
 =?us-ascii?Q?roNkPZ8a4NI6LzElOXwJlPNVr2Lp0fA7c68ydhYaZrHKt97UD6v9ETkvUZ+7?=
 =?us-ascii?Q?mmiRRonbVO9EsZ9E2Yz8M2WMR3NUjUhq7tQR9vKIQqVMCXkaZpNJevtFPYmy?=
 =?us-ascii?Q?XCjCxiZl1YSUw4Pah8AVCMFx9d9Hn6CtTDcAl+OS8cv2IC9dUDZKj6bgVX0o?=
 =?us-ascii?Q?+mgMdU+tKwUA9Jx7hlMJHv2WzJAmD2sJcD7ZEU0TrZummIPrdM0f7oYJTmsc?=
 =?us-ascii?Q?lwX+ebUOVw0rd6q/k0tp1/IgXa5TWBbfZtOS/xJJymY6nJoFKJZyMElXKzxq?=
 =?us-ascii?Q?PHiHnpcAgZ6amuhaLLeDDG337xT34jprXycACd1lp2WUID++piIt+oqOObmp?=
 =?us-ascii?Q?/q1sHNIad/vIpJ2kY6VeB0as?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c8ee81-4f38-4161-640a-08d8e92742d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 09:30:10.6045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: inp9FRoEp8dlAuYNDaUw58qhSqIprvfJnkIhuyXWe4fU0UIauWBYDI3l260JhrKV/duwXtdIiv+wBLvOy77dAxRPU2Ckx6HwM0R9rJ8LJvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3914
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16 March 2021 16:23, Mark Jonas wrote:

> From: Hubert Streidl <hubert.streidl@de.bosch.com>
>=20
> By default the PMIC DA9063 2-wire interface is SMBus compliant. This
> means the PMIC will automatically reset the interface when the clock
> signal ceases for more than the SMBus timeout of 35 ms.
>=20
> If the I2C driver / device is not capable of creating atomic I2C
> transactions, a context change can cause a ceasing of the clock signal.
> This can happen if for example a real-time thread is scheduled. Then
> the DA9063 in SMBus mode will reset the 2-wire interface. Subsequently
> a write message could end up in the wrong register. This could cause
> unpredictable system behavior.
>=20
> The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
> interface. This mode does not reset the interface when the clock
> signal ceases. Thus the problem depicted above does not occur.
>=20
> This patch tests for the bus functionality "I2C_FUNC_I2C". It can
> reasonably be assumed that the bus cannot obey SMBus timings if
> this functionality is set. SMBus commands most probably are emulated
> in this case which is prone to the latency issue described above.
>=20
> This patch enables the I2C bus mode if I2C_FUNC_I2C is set or
> otherwise keeps the default SMBus mode.
>=20
> Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>

Thanks for your efforts on this Mark.
