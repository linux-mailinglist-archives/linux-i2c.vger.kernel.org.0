Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4886A598A66
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 19:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344668AbiHRRWd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 13:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344405AbiHRRVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 13:21:54 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D79C2A951;
        Thu, 18 Aug 2022 10:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2ISwP2zQybr5LLtOinwrxvR63y9lzZERBD19JW2zkX/2esUsBEainkQO44aIVMA/vUQ84MsjaAOtdEL5mZqjL0upzsHEuaI3vq8NCdgYBkAPaDue66hYPDeW1VH1IIMaBtGxv2YOXli+0cu6PBBFL0xUYBou9LMtZXPVp/NtyUY8J1qA1zfdIjmZNiiLElKWdmXt3gIeMeLx/NTYKzmbITYUlzBctIfC1zmWDj+KHeDzgynZFkFw68WaOYwHzvf/xvQzu1ZEUbzutUG3uTQV1e1ublk+Fnt8Rapuri5+g2AyRACwTuAGoN4hO5uAwUUHAtB5L5tLnxBswmwX9W58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8uwRtydd0wthjUXJOROZK2PByEIWCIRmK9JjpaaSTE=;
 b=JmRgLUPqxngxc5fui9Ncbq4N1hrbQcNMfoNVot2eTKOooYdvKvbf2rd/BePzJyD+PdlIT7GoqwU2SS8t7JYLgNsgq9cPGifE6+DQH3hegZcd4/Cp326qsa+zofQMIlkKM2QcYYD8oiTBCemCv3XjPCMiCD4qb4AFwXnDboP8D2NNCxdOqUVbjpU8g9Aht3eCYIGLUo8nDeFSVc3t6DUH9Z4lEXtY25lhueQJ1NJpmpOaoP7sA2wMU/SQeCvegPI0rFizxP0a+9c4C1UbYRa5PIyKjXj5fAZyyFY59PQnQrTtA863MU9WbWVMQAl5Q+gzgVDYeQRupr/51/lLdicEMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8uwRtydd0wthjUXJOROZK2PByEIWCIRmK9JjpaaSTE=;
 b=Cl/RWJjsigQDWYgORCCEWWUWV+gbMChcYHLASMIKq4JD4UeRr/Drc8MI+eixmc0VLUzAYqrfW/xgqfgQSYi1CvhYNtJzgRunu2DsjAiUGf36tRJkCGy2CTekS2YW5DsOpMDOV9EMpj9DAiV162xYQgpKw//qU3JwRgc5FWeA8IonNjNGCKnkZXfiMRWSyIHZoxF4azP1oA7PxS2dri2uSDmDj+j9SE6SnTgkCvi7fzZNh0q9jOrJfvoylYJRxyj82iIAcJMki6ydbg4JLC9OQ13lQ7Odq/lTqXck7r3vKxvIbYFrATILfKcsZIxIUPZGiweZ/wT89fP/mye4nVvMMQ==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by MW3PR12MB4538.namprd12.prod.outlook.com (2603:10b6:303:55::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 17:21:14 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11%7]) with mapi id 15.20.5525.017; Thu, 18 Aug 2022
 17:21:14 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed during
 io write
Thread-Topic: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed during
 io write
Thread-Index: AQHYscMo59o17RgFDU6O7GkYAYNjea2020kAgAADfQCAAAo+MA==
Date:   Thu, 18 Aug 2022 17:21:14 +0000
Message-ID: <CH2PR12MB3895EBE43CB5B23F4E4ECA65D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220816225412.9095-1-asmaa@nvidia.com>
 <20220816225412.9095-5-asmaa@nvidia.com>
 <20220818162728.lnq5y7qzxbdsyexr@the-dreams.de>
 <CH2PR12MB38951132E24E6F1EDCCD18C6D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB38951132E24E6F1EDCCD18C6D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c39fcdc-78c6-432b-ad13-08da813e0de3
x-ms-traffictypediagnostic: MW3PR12MB4538:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yC4I+C3dwssFW63LKCwvkom8eINFxaVKdsg6r6ZkOnyJFpzfXzGjmkySkus+JVyT6/lT9uRDQ2n8O20brNXH3wA0mhwHZ7hZqNYqfKC+kLXNWtnQsD60YbppB6tJDh3Y7XJMddvQpaw0r2vAYaYQOM9/ErVONIn18/KVm0u0Ck5yd5fSN2brZRJ5fNK18MaEjaQemPKOKvTBxQeh491Y+lXleBDmcqHAFchuhaqwlDRgw8CTFnQkaflf+Q67t+RSc/hlS4zIXccHV787t2k3/mRGvOw115HeLiPGqBUSPflZgNo2QzsSzHdiMDuy7UhBcxAEYdDLvlVIaO9xKpteMTn7ruoD4IY0pKWSKEbv4vUJvSp0kRiTp00FXCf8Ev3lnNndXMxgtnkYtYg5+A496p9iZC3Ky624r6R7i5Z6QKLvNyS3F42Kob+b8/48s0c+eswihfE/F0AndaBBTw5jH2ZGplTq5OC8GGhQknx1Sp/tVGnZa0zE+3HZX2JPmyBql//bgSg+Pfw1GfCvOvbgUNO5KLSq7HJ2LgwgrbW80WVhqU2ObmMaTtKs5qPC5NmCeauJWd9/d6wjwcY421UWUHHg51hAS5DLFQLU5St3wIssAA4YYHadYCrvnNEkloMumYSDYKH+S892HbTRzjyzmjknYEkvzWWbI0lc908HvrMZfpSzUzsPPxrVjykyTG8ycb2C/hzSmdf42vRj6bP2JMbJcGMg3pd6LtUs5hGYpF1BJf6xaXu1zsA/bNAPsO+3JpznXTUX8ztEXQH3KPxENw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(7696005)(33656002)(2940100002)(6506007)(41300700001)(86362001)(186003)(38070700005)(53546011)(71200400001)(9686003)(83380400001)(478600001)(26005)(2906002)(66946007)(66556008)(55016003)(316002)(66476007)(76116006)(107886003)(54906003)(64756008)(4326008)(8676002)(5660300002)(6916009)(122000001)(8936002)(66446008)(38100700002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qzu7aXnKAMLtF5C18XCeVDJ7+LjiuD+BKGQpCC67wXm+rndusfiHxXb99iy/?=
 =?us-ascii?Q?CBHqsGsY46Wq31QLW8PwnWltAVGQ2okpw9S4D4ytj4urOTtrV7UubGNzUUlC?=
 =?us-ascii?Q?9YTn9DPj3eN4EEq7pxCHDrQqDUWbmfr/03BGayrCsQ7agcoee/KRG46MtgnU?=
 =?us-ascii?Q?rklxwJs2HYgQEsruZFkk8DUmYkToFy3qBsVMjITTw1e67wFEpRHKEq8LsEE6?=
 =?us-ascii?Q?f5NA4j7cnpR3NnDs43TRfzpaRJgcEhVAYUKd0JHKdFWVf5Nu8KigA9uw9tSV?=
 =?us-ascii?Q?KMjPBmvh+7wn7mhwguDdInT0rOKUnX4fBRMp0SBEcekw4yo5jCrE3WC1KlxW?=
 =?us-ascii?Q?J3Vu8H6eUzf5HNGJ2z35ffG/x/IMFw1K7v54IWfIQYmWT798NsatVtb/9FvA?=
 =?us-ascii?Q?JlEfCN0tsYsvvJFRHVPhNQvpGWCvDa7WRwjWD7tjdp9CgSXZUF9A2HtaJMND?=
 =?us-ascii?Q?jt3NrLFw/ZdV5z1EBFnXie/+z0oVe1KTpItfM0w/EOGbwSTpoV7CncNQlZ/P?=
 =?us-ascii?Q?INVMMPPPSU1/J6DI5PawJstJw+75Nk9EnzBIWka5LaWpZPQqYey7sQPFQOiU?=
 =?us-ascii?Q?4Fdi0VgmSBkPV8ExKx7XfiIkntLvLCjaVg14iPv82pHzrY7URhp4zjQQ/g2K?=
 =?us-ascii?Q?3uvyDGEvnvph19rMlYJLDeyZnynZt9gz5Cm+8W2tt0IEPL2sNsPhRlGHn9XY?=
 =?us-ascii?Q?JeK6wwRu024JHrMQKWEQHizTNbopYKv8p53K9Odiw1hb0P1AKL6pZK4AUnSS?=
 =?us-ascii?Q?Ofrm0MFHFMboIEZKfw6V8Zby/UOdCHURqsLGuOseGS+mjPLd4spbcMakCCRz?=
 =?us-ascii?Q?6gbYKw4X7IrlKK1YmWCWORuqfNTlGdYa0svpwq0lrVYAwhSSEQL119oong3T?=
 =?us-ascii?Q?LSuQ73AvsW6qzDUl2h2kEkOugSp7cxxlIXFjb1YAWRIHloHwAtg6lC0ylvCH?=
 =?us-ascii?Q?MXoqc/vem4vGyQeCNn4NltJj1IFOA242meUo5XXPxBomm+hTSasPf/u/m9S9?=
 =?us-ascii?Q?zQSg4BgsalQjKFpJ+LrgwODP9war+2K81CrmSVImHOJ+XZs3vHqTSdpl3xxk?=
 =?us-ascii?Q?36o5hriLpvHOVZ0zVCoxTUiMFi4ODQ+ruZJxtrHLVdeBmLfqYILBZx8WePb8?=
 =?us-ascii?Q?h5ara2APx2UCpeAqGoDoYOdwroYow+XF+oOra4AD54c64YCxKs/zODh0yrhs?=
 =?us-ascii?Q?/vT9HF6KLworKRs+gZas21+LZdUkoEcPaIXuQ9QBG899fU/vnhE8O3eE3OVM?=
 =?us-ascii?Q?qOAwENue085mS2Kgfjvn4UT0vfEKcuL3J4TKah8b4GfH7hqihepOiQZL/9hX?=
 =?us-ascii?Q?RTNy3MketAZYWqCA/kVUWqhx7nAt/eACslW+2qOCKV2f3gK4a2cwxGZxhljn?=
 =?us-ascii?Q?9tMihGcCPpKeVsAXk52GI49Xu1jTY9jpEbzFp9wzRGBjOoyfU/sU3ah+D/Oq?=
 =?us-ascii?Q?fzWsF+oF4Elr6yiKVAvJyv5MnM9/qWroDKN7bUgYclVrxMeO4bOA/uWJtRqu?=
 =?us-ascii?Q?tUBXgVazXjdDv90UjClHG4nAtF8tvRKo2s5YvyAa1WhsskvwdOFHCjPI8v2A?=
 =?us-ascii?Q?UK+QfaKWYoqtecY3DDQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c39fcdc-78c6-432b-ad13-08da813e0de3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 17:21:14.6858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPAqSWwpC0fu8ukNajntZjwXQrxKWk5IOCeZy41LED5TBNkj2Q0KGZgxpsbfaZrW2MFXzc7KJE1MZJN7oI6Qrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4538
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Apologies, just want to clarify that I was talking about the frequency fix =
"[PATCH v1 1/7] i2c-mlxbf.c: Fix frequency calculation".
In regards to the below bug fix "[PATCH v1 4/7] i2c-mlxbf.c: incorrect base=
 address passed during io write", we were lucky it works because this write=
:
writel(~0x0, priv->smbus->io + MLXBF_I2C_CAUSE_OR_CLEAR);
didn't have any impact on the overall functionality of the read/write trans=
actions. Writing to smbus->io + 0x18 (aka  MLXBF_I2C_CAUSE_OR_CLEAR) corres=
ponds to sc_low_timeout register which sets the timeout value before a read=
/write transaction aborts.=20

-----Original Message-----
From: Asmaa Mnebhi=20
Sent: Thursday, August 18, 2022 12:41 PM
To: Wolfram Sang <wsa@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-i2c@vger.kernel.=
org; linux-kernel@vger.kernel.org; Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed duri=
ng io write

It only worked on our first generation of BlueField (and we were lucky I th=
ink), not in BlueField-2 gen.

-----Original Message-----
From: Wolfram Sang <wsa@kernel.org>
Sent: Thursday, August 18, 2022 12:27 PM
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; linux-i2c@vger.kernel.=
org; linux-kernel@vger.kernel.org; Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed duri=
ng io write

On Tue, Aug 16, 2022 at 06:54:09PM -0400, Asmaa Mnebhi wrote:
> Correct base address used during io write.

So, the driver never ever worked? Or were we lucky that it worked somehow?

>=20
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-mlxbf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c=20
> b/drivers/i2c/busses/i2c-mlxbf.c index 39051c4a6db2..02ed6983c35c
> 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -655,7 +655,7 @@ static int mlxbf_i2c_smbus_enable(struct mlxbf_i2c_pr=
iv *priv, u8 slave,
>  	/* Clear status bits. */
>  	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_STATUS);
>  	/* Set the cause data. */
> -	writel(~0x0, priv->smbus->io + MLXBF_I2C_CAUSE_OR_CLEAR);
> +	writel(~0x0, priv->mst_cause->io + MLXBF_I2C_CAUSE_OR_CLEAR);
>  	/* Zero PEC byte. */
>  	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_PEC);
>  	/* Zero byte count. */
> --
> 2.30.1
>=20
