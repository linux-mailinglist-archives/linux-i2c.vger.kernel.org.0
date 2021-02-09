Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A181315002
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 14:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbhBINTb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 08:19:31 -0500
Received: from mail-vi1eur05on2057.outbound.protection.outlook.com ([40.107.21.57]:8672
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231372AbhBINTO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Feb 2021 08:19:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVM4Wau5Yc9o7vjeaSSKHazr/GJ/fGnYpi+eaaTIzueSgp1ZkgaXI6xbFHslwkjIHzNuztJKRAGpvccLYXRNjrrUKax0IiQW8rjp8W6Tgb3no2tJgL1iLNbExvELkE7GxC+w1N/SAMkWOK0aT5SeYHLxJKSjgFkf/u4gSD8FQuDZMAy0t1Zf1f8PJY2Fh4s9jtm5WcD0gwS0ZPmXNzaYl08zEmGhCxbRdQPVDqRkRJDqJIv9iFyBqv0/OGKtPf8Em9MaYpOM3kMViWaRwYIvmQQCDhaoGi6tI2F+N1PPDvDlsLmFV3XYTVUN+CpDf/vMe2JHrDIP+vmImL4+3gmMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQMrHSdXm4bZFcDm/yp/3cmwtIFsOwilHIqyK6zdHYM=;
 b=Ycd6KFlDpQ44gqeBZEUuUID4hqcJOLJNP8RBNfPVmg9AA8QbNrUBJiOb+lPaz7ZaxAQ9hQCM22xTEbw4c6GE/4J7wZYF8uLp46vZRg6TI6JFDzE8pjjeqQCxZbVAKOk+u7wZRz2ZwAEebWFeedE6P0sPShtNp/llaBw8qPuInjgG2v7PfoTv8nWQHkWcG2A+4pCnw8WYzHR7ud+rttm337JGtvK8kTVTIN62KSiNl7nKxV+q49ts8xMF5klx89O9kkjrF7GBKtYfGb+MjJXW34J5EsjZr8srfU5977oclUr5E0DG+JWpU2AXyfx1Iq8kTeTmu/ChlvtVnPN5X7/IUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQMrHSdXm4bZFcDm/yp/3cmwtIFsOwilHIqyK6zdHYM=;
 b=lTmRSJtFL2CVTdwjzyrWsR4NtM+VzYw3z/fiRNW90f28Ml5wObRHnVFzWKOjzAuQpZxLT7HMWpHRLAtkai3aishi4rDfLeVcAqpBH/NCrmZXuDaNlreG1wDrII54zhraMuvT5H8ZLMjPI64orzkC4reC5wIP/u8JfRVrQmQcbew=
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5)
 by PAXPR10MB4670.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Tue, 9 Feb
 2021 13:18:22 +0000
Received: from PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d4e:b196:aa2b:8890]) by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d4e:b196:aa2b:8890%7]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 13:18:21 +0000
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
Subject: RE: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Thread-Topic: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Thread-Index: AQHW/i8Ewc5FHProsE227gGqlaHq06pPzvYw
Date:   Tue, 9 Feb 2021 13:18:21 +0000
Message-ID: <PR3PR10MB41422B90076115ACCE07D2A5808E9@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
References: <20210208152758.13093-1-mark.jonas@de.bosch.com>
In-Reply-To: <20210208152758.13093-1-mark.jonas@de.bosch.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: de.bosch.com; dkim=none (message not signed)
 header.d=none;de.bosch.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [147.161.166.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cd281a1-1203-4b45-7421-08d8ccfd2c97
x-ms-traffictypediagnostic: PAXPR10MB4670:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PAXPR10MB46701B15FE457515EC326650A78E9@PAXPR10MB4670.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z/Zr2STHoDv/na40IUDp2MPAjp79A45CMfA2xycv0TZoitm2iNamM8vfOsLeH7YXZ02cKMq60EhVqF45isEEY3tMYz7FfCcUU3SSxnY5EpLFBrUoLmPJ1ilhGWKCWvYQbUDIUb0SKor1KPmtBbeCt5/l/zLa8wvpTZorE56A88CGF/DiZOZwww2bWmg/b5Fc05ofkWSSFwLK8lTnYyBfGM5GawULMbxOvNKqY/75wlp/pdEe43GbDpEeQmG0z2GCUVRnA3BejaEGsZtS+8TSjwUlf/nWCPYlphzeNst5EtBs18u8zkF+SfI5GgeAMcZuqhW0x7U1Knr1J2BKI6pmzGOhsgA0gWD/tfB7ihRClWbFPdZ7P+PeoTbU745J4yQ37YTxqW6eLqEsmIA3mFFQplXutYDJR9x44WVYzizAjyrAizwsZVOJQwrlPGpJ5GKCWHAaJDCREfdTf39YfaXFOrr6ullreCPH1Oi+mDsooL+x7CLcx9fDP2hL8+EP+oMvmH5ByaoFTEPLkr0gXFc7Bg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(396003)(136003)(366004)(55016002)(9686003)(66946007)(6506007)(64756008)(76116006)(53546011)(478600001)(66556008)(66446008)(83380400001)(5660300002)(8676002)(4326008)(186003)(2906002)(86362001)(33656002)(66476007)(316002)(110136005)(52536014)(54906003)(71200400001)(8936002)(26005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rM6KcRx34Cx2uNi5cWeXm87NGs4iWmb9RbqV2A0DdV7QS/Srsv3l+7zYbNM6?=
 =?us-ascii?Q?uRaj+5zJfSaMYb+H7u7kJZ381r5tG+9jvB5VNP40129pSn4cpRB5yNKCT3kk?=
 =?us-ascii?Q?4/Yafxh7K9hlkpTSDSeG5OAGUl74h2KlsMgOM/0qVWU/YLkyPI6Jxau1Q9jY?=
 =?us-ascii?Q?Vkxt0n7WHw5eITI5jDHauJs3zxzMA5hUyB/nSY9YSX2vh02gDLUOoLYdLI1p?=
 =?us-ascii?Q?bYN2ATY+BXQjx4CXHsbxnQy20gHK5Q8Tn7WcujclLHYpMRCslmb1Laybw7zq?=
 =?us-ascii?Q?PDxLhunitKRl9qNJGO6ITi/KLdiz952uzpKuxCkNFIyCqvIK03qtqa3985zl?=
 =?us-ascii?Q?Mm7IBtOJqBvdElM+Ar2EUSxfgdgz+QUSLhTd5C8SdJLsgNjfLGyaKLxiZ8FU?=
 =?us-ascii?Q?0hUw9nCIX+uR0ggFI1aCKsc53/6OaUt1nD/n1L7w8bX5Z9Jumq31gl3EEK0u?=
 =?us-ascii?Q?pSudwHh4iqNbg7zt7UnDOmbGZyIeCWLTHRJCrqbtX2GOHNOR4RsRvdcOox6M?=
 =?us-ascii?Q?VJ358hohEcIfsviyqQasfs9m+MtRQwrTwEcyQs2y/kgzrVkCP55zgx8H8pNT?=
 =?us-ascii?Q?qZAVYLMNazhJ94iAYCVKNi0fXg3XZFU6FEE8LjgQpwk6mEF/QPR/fD70F4yk?=
 =?us-ascii?Q?l6w06nvO7JcDOZPeoGfWBrG0mxQ3JOVQdopIiPAJLFd69bRW5OBSKisS3gEC?=
 =?us-ascii?Q?kHSzbxo2Rz0yFyoEq7MDVV1XrHITvWtTWa0T7/t0LA7UAUDnYFcvrwjwuj7f?=
 =?us-ascii?Q?uCFkyjVRGKtC8VCItidTZg9i3oOsgke1MvNaTLI9O/YYAuIUrCWTJTpWKbQK?=
 =?us-ascii?Q?QbyXv1fo0MJjQJm/Sh1bnCZ4IbWch6RXz9GDXYIWS5mRDKi0KH551Dd7gDX2?=
 =?us-ascii?Q?7skm2HY+w6QjGpe1+EGhK6W3kPlUgoxquWv6CeRkM26X7s/RH9osSIyeveem?=
 =?us-ascii?Q?SJkUnu1lqf3URlfoTx4/IKcwCGRreC2VUBszvvQ02evtdmlBBiMweAd7XBdA?=
 =?us-ascii?Q?3xkqsZD8BxC347WkfgRYS2xn+2INIIKI/rUBgfyvcGEgxJmcyA9gryQnVJWo?=
 =?us-ascii?Q?JIWzg4yhN2VjJdCE2ppIo89joqGvXQVP1NoJCIN2Ko1RgCszA1izSFakhVg5?=
 =?us-ascii?Q?u1saktlo4hTNkGh4aHFaNHYgqPb4S0ygZLCujMDew4blY/huRaKdx38cvZh+?=
 =?us-ascii?Q?WXyBJoAfGc8OCUvJWNR3hNtblr9ty7efOG2vuRA7skh4W2dhDniddJbJNGwA?=
 =?us-ascii?Q?yMQgsADlnRWWdtaly3hPuo1rU54oR/874681GiRcuj/AibMp+rBFt17DodxU?=
 =?us-ascii?Q?u3J04NkBTXfm7XNc6qzhH9/K?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd281a1-1203-4b45-7421-08d8ccfd2c97
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 13:18:21.9073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2A/6ruvqj4S7vormmjLhX0TLQ+JxeVloCy1FlCeJnDzvUuIZ5jBq18J2bu0ng9PFQH4/7tIahI3eCE9gtL8LHF0uWSA8Rwu/82ayapGiZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB4670
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08 February 2021 15:28, Mark Jonas wrote:

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
> otherwise enables the SMBus mode for a native SMBus controller
> which doesn't have I2C_FUNC_I2C set.
>=20
> Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>

Thanks for your efforts. Looks sensible to me, so:

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
