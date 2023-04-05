Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB98F6D7E2F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Apr 2023 15:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237958AbjDEN5R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Apr 2023 09:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238126AbjDEN5Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Apr 2023 09:57:16 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D355B13E;
        Wed,  5 Apr 2023 06:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOKiwwdulpmXOsHqsE1xMUYxNeLPmr0+r+O/cQzmhXHfMUi442hcD6kq4Ua1PHLfFNvy5wgeZq/kuUiNyJ42imkyPMhnxnOHG1Oa+oZm53vE7dMyFbZtVaRoVIU+h1JafmZXTRMonlfoD2rsL+B3gP0CWtPZktU1f+Kl67Nv4qP/30GgV/dElh8D8ASwx3PFkA7r4QL0hhh82QaZ+HOKTdbJadscW1PCF4YeAAhFuuds6uaNvRDxtaau4Q796fiLxJ5mwgfRNgoZ3UO4zeaU0gwmBdAqKVAzb7AFPsq5EMWUwgsH34mHt8sDLmw0xIEcuqmosUBibGiGvEE4vvO2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz1PO4yXYPVpTyMFdokxDGlEzRdb0774snLRT1+274Q=;
 b=nCpzX6Ij549otc7vRdzTSBmDRhqO95Zicv40Pyjr1jgTu12P7ICxBFzJob6N5e84ZJV0lmeWFseW52a2VLSNlKx9NcNO9CzGjOczWSHpWW2Ym2FmggP0xJD+0zpmsIA/PAPesgkvZgKCxLaNHwYjET6VVFM0iSuyY5y7tw5Lh3C30aDgSRUwSpUu3Wippm+PL2BWcltCJmvlMsS7oj/j35DTlQZxxirkTMjEqIGYJ60ErvrX42Et6xTGEOfe6+dp4RfHmNjN2jLhsxqYx/9DampCaz0/EOIeVMazitGkn1NU2TjXrsuKIv/RFeAD/Lxrhl3Q8oc0R0Sg7/Y/2iBB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz1PO4yXYPVpTyMFdokxDGlEzRdb0774snLRT1+274Q=;
 b=lCexjLGnbQPttvdobRggca3+6iQjEboHb4BcLldtmKWy3R8kUK3Y7YwePDQNYPPK/myJsdRbXX2zU3zK/Lj7ate63VI3OU6I8Add8kIT+ZBYWfaWPHrBZCQwsJO4p8pWVrdoajMrpIqqBWYcjnFxQmKk69pYXhCGEHd7XjS1Jqv3br2w5E0VD3JOD6dEG1hkkmIzwRNxqFibRkHv6eR/JvjseFfu1Lc4FyJkv98MROljT+K24g6NstnhYErFa5tlxkzBFpKVw1+f0dhrusJ5CymQzE1hFMTueHkukVDNdgEWqblTWt1NB4GiU9dsoHdhso3Vxrbz+zUW/VWeU8vxhQ==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:312::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 13:57:11 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::b22f:ead7:357e:803a]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::b22f:ead7:357e:803a%4]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 13:57:11 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/1] i2c: mlxbf: Use readl_poll_timeout_atomic() for
 polling
Thread-Topic: [PATCH v2 1/1] i2c: mlxbf: Use readl_poll_timeout_atomic() for
 polling
Thread-Index: AQHZZ74ZNeXzh4WpmkGxoB5q8VI7ja8cvTbA
Date:   Wed, 5 Apr 2023 13:57:11 +0000
Message-ID: <CH2PR12MB38957218E53584EFCC2496DDD7909@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20230405125643.42398-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230405125643.42398-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|SA3PR12MB8802:EE_
x-ms-office365-filtering-correlation-id: ce4841e9-bd5e-4d2d-0f0f-08db35dda746
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AKsE6gqLyD323oDEszHik0+4Gc2WyaJ/HGjRTCbW+XQxSUY5IDJyQ79s7YnOgy3wV+v1DPRtDZB+FeADbw5akATGLagc8Pepi8HF8WQO0ryXdVp9/61VEEoTq36BGBksrhxyZWuRGz2PLeF2XWxo5hAcX1GB+b8w32nRTD25aizU6kedhxXZTBxmzmSCIfMbkh6kW0gqCeGe/4P5bMDQa4WahlYoueRTLlHrG1Dn18qsKDH+bffS1OiFE2f5dnPXQ0aSHaZbRqdeMx6v3Fv6sI9wAYyjQbsfK9kt4d2VEBh21UWCj0fVIx9x5uPykoS/J0urFO4bw2jlvmIFRbsz5PEgGazkWFTdWrKwHcHBbFaAvZpOOnON98WgKUBbZGiH8FvquI5tQQqmf/7nTrQx7NHPbD1AUsRiJPZVZaN4NzquyI123ZbdQasYQl4JZ6ZWAdz9ac8kSrzb3Bfxeu++M+lTT2CE467v1Xz3o+CNxkYMOcJIuVb7Cl2fNig59h+xhGMyZURUDwIrn8mSg2u7RPLW1wfP2LSgtNwCHIKslem3Nx4PpYwYClXLSuQZSO2KWnxto/fT1QpeSDwIWyoov8ftH3REqXbVxzKg9ARlEWPGGRhQdV8bQcQ5sDxJskTV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199021)(478600001)(66476007)(66556008)(110136005)(76116006)(316002)(66946007)(66446008)(64756008)(8676002)(55016003)(7696005)(71200400001)(2906002)(41300700001)(52536014)(38100700002)(8936002)(5660300002)(86362001)(122000001)(33656002)(38070700005)(6506007)(9686003)(26005)(186003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BgD+DImPfdpMUp3qu8bc+2XZ7JNYJWQblL+5+QBlTth4NlcoVAkhndGxZ81F?=
 =?us-ascii?Q?6pPGrwZwAQP9bGi9a3Jst0aSp6jutuvBQndljGyQema952AEVVUkx1ER34ZJ?=
 =?us-ascii?Q?U2JQ/g4MgBIHqTbrGLMNSl5aY1tErZSerfW5rATRc82rpCjxqaQTjFWfLSTw?=
 =?us-ascii?Q?4e211/dOAJ2XLv4hfT5/t4Gv2iSIrg64hVvNhN3V3ngeK1JBKCz6FJMwH/+N?=
 =?us-ascii?Q?L78UqLtyqzwIerKSeFAhzt5u8e4eApkVBTQLtNdxNl5sCWdRYOWPt9OUaLUb?=
 =?us-ascii?Q?SRCqeCiMUxU6RkHCH7N3pheD0se4Z2bMaSLX5rslB3pUsVhILoS83mDUZUQd?=
 =?us-ascii?Q?fIIR4juXcZUKDucd4OYgrnrg9HRzLlrzqW3A3UKNaQTiN2VhbwEsG55aHW61?=
 =?us-ascii?Q?EsLW43s3UXpPADY0GT6+/vHiEO68z94oQ5fw1PHnVjd4nvVT/2oRyX11ewW1?=
 =?us-ascii?Q?1XxOKjSnMXzCb2+xKa/ibEiZpjId0Yox4dvZU0/Ae9+bi7ystnXnfHHY7/Jl?=
 =?us-ascii?Q?7fPMyrH5jabSq/QQiABaz1XJqhcIThGRmd+BgPX+4kuD4n0xBtYyhM+S94rU?=
 =?us-ascii?Q?WmCcUMrolaVq0u5PkAGq45BDsfYijHnI3T2V9u0uRIwqCyQDfDDbtpdtULhq?=
 =?us-ascii?Q?w0bnbDGa8X1i2KlnCDLqcxFGZZ09BXECowdZx4GWRnQxKi38ZP09PdLPWkUg?=
 =?us-ascii?Q?u7XnqPFexBzkjbyzVA4WN6aReLl5K3uJORdCvjBKlsRaJVajfgAZtvovpKQg?=
 =?us-ascii?Q?68dJA4JZuBj9HrveX2BC5XD3fkgNis3YRYPB2ngFykNh4k0jMUQonGwgksCK?=
 =?us-ascii?Q?I9qlQMJojJjhl/qeqvo7+GmmT1CZ1mr4KT8XT+6tZeyR95mPrhdmhMTTFwRM?=
 =?us-ascii?Q?3WmqBonLWSdlTIjxhK5imdZmapwTiSNu/Gqz8cdzgYfidHPsH3ErncFshbVU?=
 =?us-ascii?Q?xPkwvjXJMhSR5vOlTvq1wdJ4T0QA4LuE2leMdGNVDnN/YydsPmHlCKchlTsD?=
 =?us-ascii?Q?xgMrJG4ZAsSjUcV18lgfYiOL8nGKHwgD0HgmdoFchZa3sDHim/72uVZ6Wvao?=
 =?us-ascii?Q?gWbSZsE9kPHNgjY7DAVhCiWR5DSB97eBTA7HdCDAJCWE3n+cIX/Stb3Js0zn?=
 =?us-ascii?Q?tzhtC8FirGxrJXyq3TeUpWjaAhLFgBzQdT3CKA8y2w9Cbcg1F62i5lV6Zssu?=
 =?us-ascii?Q?Fhlf2PLSOSTAPFt1oLT1KP4bTJmlB0hwuIhO0v26FDQPkTk/iq9vSMKTj4yk?=
 =?us-ascii?Q?lQ/RaoDJvU9x5DRLiGgALzl1VbIa+C5nYL+koepLICRoz8m0loKqnuVU1nCf?=
 =?us-ascii?Q?fN90FDN4VPTFUk2ErAY2Xmslcvb0iZ1fnxsKuxCIBYppR067041o0YKJRGSR?=
 =?us-ascii?Q?ZGwwYVnm3Eiyt6g3CV2VnmSJY36RnB9v2v3Hb7q0weQt8E3ItO+K5AKJzbgo?=
 =?us-ascii?Q?przOvqsStg4bq9/dlvWStncJXBhZNPDz32tdJ3+JCgbkbNK+u/4+Xh0GhbRE?=
 =?us-ascii?Q?+qGK22NysctDLV1AhtWc7lWeVWV8Ni1JB96AwW610PqKotQpppI7Ks9UGefE?=
 =?us-ascii?Q?suRrcYeS79Xwvw0ubGk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4841e9-bd5e-4d2d-0f0f-08db35dda746
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 13:57:11.3258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zwwZgIzF3VIveCvdr1dY2j9Xf/wKVo6y3LWZoIWpyWvLQshlUADV9/DFrh4PJ1rW5HpTX8gfXSc0DEZ8vYPAow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8802
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reviewed-by: Asmaa Mnebhi <asmaa@nvidia.com>

> Subject: [PATCH v2 1/1] i2c: mlxbf: Use readl_poll_timeout_atomic() for
> polling
>=20
> Convert the usage of an open-coded custom tight poll while loop with the
> provided readl_poll_timeout_atomic() macro.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: corrected comment (Asmaa)
>  drivers/i2c/busses/i2c-mlxbf.c | 106 ++++++++-------------------------
>  1 file changed, 26 insertions(+), 80 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxb=
f.c
> index 1810d5791b3d..d9d4b65cb276 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -12,6 +12,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/i2c.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -495,65 +496,6 @@ static u8 mlxbf_i2c_bus_count;
>=20
>  static struct mutex mlxbf_i2c_bus_lock;
>=20
> -/*
> - * Function to poll a set of bits at a specific address; it checks wheth=
er
> - * the bits are equal to zero when eq_zero is set to 'true', and not equ=
al
> - * to zero when eq_zero is set to 'false'.
> - * Note that the timeout is given in microseconds.
> - */
> -static u32 mlxbf_i2c_poll(void __iomem *io, u32 addr, u32 mask,
> -			    bool eq_zero, u32  timeout)
> -{
> -	u32 bits;
> -
> -	timeout =3D (timeout / MLXBF_I2C_POLL_FREQ_IN_USEC) + 1;
> -
> -	do {
> -		bits =3D readl(io + addr) & mask;
> -		if (eq_zero ? bits =3D=3D 0 : bits !=3D 0)
> -			return eq_zero ? 1 : bits;
> -		udelay(MLXBF_I2C_POLL_FREQ_IN_USEC);
> -	} while (timeout-- !=3D 0);
> -
> -	return 0;
> -}
> -
> -/*
> - * SW must make sure that the SMBus Master GW is idle before starting
> - * a transaction. Accordingly, this function polls the Master FSM stop
> - * bit; it returns false when the bit is asserted, true if not.
> - */
> -static bool mlxbf_i2c_smbus_master_wait_for_idle(struct mlxbf_i2c_priv
> *priv) -{
> -	u32 mask =3D MLXBF_I2C_SMBUS_MASTER_FSM_STOP_MASK;
> -	u32 addr =3D priv->chip->smbus_master_fsm_off;
> -	u32 timeout =3D MLXBF_I2C_SMBUS_TIMEOUT;
> -
> -	if (mlxbf_i2c_poll(priv->mst->io, addr, mask, true, timeout))
> -		return true;
> -
> -	return false;
> -}
> -
> -/*
> - * wait for the lock to be released before acquiring it.
> - */
> -static bool mlxbf_i2c_smbus_master_lock(struct mlxbf_i2c_priv *priv) -{
> -	if (mlxbf_i2c_poll(priv->mst->io, MLXBF_I2C_SMBUS_MASTER_GW,
> -			   MLXBF_I2C_MASTER_LOCK_BIT, true,
> -			   MLXBF_I2C_SMBUS_LOCK_POLL_TIMEOUT))
> -		return true;
> -
> -	return false;
> -}
> -
> -static void mlxbf_i2c_smbus_master_unlock(struct mlxbf_i2c_priv *priv) -=
{
> -	/* Clear the gw to clear the lock */
> -	writel(0, priv->mst->io + MLXBF_I2C_SMBUS_MASTER_GW);
> -}
> -
>  static bool mlxbf_i2c_smbus_transaction_success(u32 master_status,
>  						u32 cause_status)
>  {
> @@ -583,6 +525,7 @@ static int mlxbf_i2c_smbus_check_status(struct
> mlxbf_i2c_priv *priv)  {
>  	u32 master_status_bits;
>  	u32 cause_status_bits;
> +	u32 bits;
>=20
>  	/*
>  	 * GW busy bit is raised by the driver and cleared by the HW @@ -
> 591,9 +534,9 @@ static int mlxbf_i2c_smbus_check_status(struct
> mlxbf_i2c_priv *priv)
>  	 * then read the cause and master status bits to determine if
>  	 * errors occurred during the transaction.
>  	 */
> -	mlxbf_i2c_poll(priv->mst->io, MLXBF_I2C_SMBUS_MASTER_GW,
> -			 MLXBF_I2C_MASTER_BUSY_BIT, true,
> -			 MLXBF_I2C_SMBUS_TIMEOUT);
> +	readl_poll_timeout_atomic(priv->mst->io +
> MLXBF_I2C_SMBUS_MASTER_GW,
> +				  bits, !(bits &
> MLXBF_I2C_MASTER_BUSY_BIT),
> +				  MLXBF_I2C_POLL_FREQ_IN_USEC,
> MLXBF_I2C_SMBUS_TIMEOUT);
>=20
>  	/* Read cause status bits. */
>  	cause_status_bits =3D readl(priv->mst_cause->io + @@ -740,7 +683,8
> @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
>  	u8 read_en, write_en, block_en, pec_en;
>  	u8 slave, flags, addr;
>  	u8 *read_buf;
> -	int ret =3D 0;
> +	u32 bits;
> +	int ret;
>=20
>  	if (request->operation_cnt > MLXBF_I2C_SMBUS_MAX_OP_CNT)
>  		return -EINVAL;
> @@ -760,11 +704,22 @@ mlxbf_i2c_smbus_start_transaction(struct
> mlxbf_i2c_priv *priv,
>  	 * Try to acquire the smbus gw lock before any reads of the GW
> register since
>  	 * a read sets the lock.
>  	 */
> -	if (WARN_ON(!mlxbf_i2c_smbus_master_lock(priv)))
> +	ret =3D readl_poll_timeout_atomic(priv->mst->io +
> MLXBF_I2C_SMBUS_MASTER_GW,
> +					bits, !(bits &
> MLXBF_I2C_MASTER_LOCK_BIT),
> +					MLXBF_I2C_POLL_FREQ_IN_USEC,
> +
> 	MLXBF_I2C_SMBUS_LOCK_POLL_TIMEOUT);
> +	if (WARN_ON(ret))
>  		return -EBUSY;
>=20
> -	/* Check whether the HW is idle */
> -	if (WARN_ON(!mlxbf_i2c_smbus_master_wait_for_idle(priv))) {
> +	/*
> +	 * SW must make sure that the SMBus Master GW is idle before
> starting
> +	 * a transaction. Accordingly, this call polls the Master FSM stop bit;
> +	 * it returns -ETIMEDOUT when the bit is asserted, 0 if not.
> +	 */
> +	ret =3D readl_poll_timeout_atomic(priv->mst->io + priv->chip-
> >smbus_master_fsm_off,
> +					bits, !(bits &
> MLXBF_I2C_SMBUS_MASTER_FSM_STOP_MASK),
> +					MLXBF_I2C_POLL_FREQ_IN_USEC,
> MLXBF_I2C_SMBUS_TIMEOUT);
> +	if (WARN_ON(ret)) {
>  		ret =3D -EBUSY;
>  		goto out_unlock;
>  	}
> @@ -855,7 +810,8 @@ mlxbf_i2c_smbus_start_transaction(struct
> mlxbf_i2c_priv *priv,
>  	}
>=20
>  out_unlock:
> -	mlxbf_i2c_smbus_master_unlock(priv);
> +	/* Clear the gw to clear the lock */
> +	writel(0, priv->mst->io + MLXBF_I2C_SMBUS_MASTER_GW);
>=20
>  	return ret;
>  }
> @@ -1835,18 +1791,6 @@ static bool mlxbf_i2c_has_coalesce(struct
> mlxbf_i2c_priv *priv, bool *read,
>  	return true;
>  }
>=20
> -static bool mlxbf_i2c_slave_wait_for_idle(struct mlxbf_i2c_priv *priv,
> -					    u32 timeout)
> -{
> -	u32 mask =3D MLXBF_I2C_CAUSE_S_GW_BUSY_FALL;
> -	u32 addr =3D MLXBF_I2C_CAUSE_ARBITER;
> -
> -	if (mlxbf_i2c_poll(priv->slv_cause->io, addr, mask, false, timeout))
> -		return true;
> -
> -	return false;
> -}
> -
>  static struct i2c_client *mlxbf_i2c_get_slave_from_addr(
>  			struct mlxbf_i2c_priv *priv, u8 addr)  { @@ -1949,7
> +1893,9 @@ static int mlxbf_i2c_irq_send(struct mlxbf_i2c_priv *priv, u8
> recv_bytes)
>  	 * Wait until the transfer is completed; the driver will wait
>  	 * until the GW is idle, a cause will rise on fall of GW busy.
>  	 */
> -	mlxbf_i2c_slave_wait_for_idle(priv, MLXBF_I2C_SMBUS_TIMEOUT);
> +	readl_poll_timeout_atomic(priv->slv_cause->io +
> MLXBF_I2C_CAUSE_ARBITER,
> +				  data32, data32 &
> MLXBF_I2C_CAUSE_S_GW_BUSY_FALL,
> +				  MLXBF_I2C_POLL_FREQ_IN_USEC,
> MLXBF_I2C_SMBUS_TIMEOUT);
>=20
>  clear_csr:
>  	/* Release the Slave GW. */
> --
> 2.40.0.1.gaa8946217a0b

