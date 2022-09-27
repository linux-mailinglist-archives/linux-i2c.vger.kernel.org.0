Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9485ECF0B
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 23:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbiI0VAq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 17:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbiI0VAp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 17:00:45 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354582D764;
        Tue, 27 Sep 2022 14:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpBE7ObT1bgCh3ElEVgwe5XHpzaizp2O3YH22W6vUOXn9ssyqXt9AybrXVphti4cA51WrV0g/FeebR9KpcVnWwTt+GPb9yGaD1s+1dVvdQpusGnsGAHXSY5ElZKaC8e5w582I0FIB7cKOKaCKgDios4U0jISfS5xGHNF7yGiIE5FguqQC23Cl0inZV7MQrTfjJYHpBCnF1756zEggzQR7qJXWTRDIEIXSdtheJwvmpDSMsmpkckSxdCuUAPdf2J6ew+fp4IaYfGU+mxhvStSpnBT9EqYmEotg0qPUsOdgQaE1vNuMD0L5kpTNoqMXwX+I4wt2F3GBjEF7nNrMRSoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLniJsbDvNACMcsOkJ2syfefWQLDookg3p968kJ6Wvk=;
 b=CDqra1iZrfy5UC9HGM6E2CVuQMJv/LA9AI1EI02HaaLnRNsizDof2QgMXOnkXoTl+VoDlu0tlfK1vG/td+RN1R6NLWHPGFUL4b1e8XLRhFLx11YGDWBk89rQRD4SXzuXW3H9Uj+k/Hv3nXQm20bGQ7ofJM5NLmKy+TsC1cXB0HyuNnBh2ggNTJlgYeEV0y0bKltX0oY7E0QKNBolQEpDkM6vF6Za/XbIdzG9eX+UKxQhY5Bd7TW1dXSePcC9z6SURTpSR8c+TbfmjvLNA+Q5KJjnUf1ypXTt2dVDGmAy3QDxje5kiy5rhPpKeS7pjts8rxUHVzPUdkZuug0rvk5gMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLniJsbDvNACMcsOkJ2syfefWQLDookg3p968kJ6Wvk=;
 b=Iw8ap9/eUmpPzH40bd67WoW4pD/l1lfJK7MwQOKXWmjgKGil225uIt3hNmQ8HNNK8K6ihSzw10v+aYWmDhla6sKH4Y7/s19iSzeC6YUKeQ5ab8CqusxULAHjkmf14qEkLVrq8HtcTk4oq2wB4f6LuY+Y7UyRBAkq95xAkbRGg5l6ZAtCnEtPS1bbHRfHQfjw4d7fLjIK78akKQgyHcJDFXL/Gcmy0261r88pxwunYpZbieru4uMGPcVg2vcguIgqjcSG69612rh89rr873Suz8s111gC78YRCg2HWuLvCuHKzHzEX+Zkb/HzD0MtC7hzrG5Vsct84l/lsVL2TzwDSQ==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by DM4PR12MB6350.namprd12.prod.outlook.com (2603:10b6:8:a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 21:00:42 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109%5]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 21:00:42 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v7 1/2] i2c: mlxbf: support BlueField-3 SoC
Thread-Topic: [PATCH v7 1/2] i2c: mlxbf: support BlueField-3 SoC
Thread-Index: AQHY0rFDBbmvpN77U0KWiiFfo0QmwK3zvygAgAABWaA=
Date:   Tue, 27 Sep 2022 21:00:42 +0000
Message-ID: <CH2PR12MB3895CE98DCE26556680A6FDAD7559@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220927203924.22644-1-asmaa@nvidia.com>
 <20220927203924.22644-2-asmaa@nvidia.com> <YzNhPL0lUeqjCymv@shikoro>
In-Reply-To: <YzNhPL0lUeqjCymv@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|DM4PR12MB6350:EE_
x-ms-office365-filtering-correlation-id: a352b6f4-5377-419c-fd4d-08daa0cb570e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lG7r7M9x6uhd8e9bTgFbuX1ux/KxJNCiwyGMm/ANxH/GCSPS3PzYvc8Nce6FK/e+tG1jV62y3AcM8fMm31a07xsEbJ5kEL1wZ2313fbkeJ8NzlHCiHApvSi2FjVmVnjCtvUXUlWxiunbHIy58nD5Prtov18d1tqakxCNVdTSalESIPAUy7UxgwGsqFPAAA2z6xr7r2pt2FwR2q6IVqcnUDCwj5VPG6yJECnjXD3vqm5KtnSgoh73jMNICWNvHVSwhrdC/EfSqfpfyb/H+DwUo872ivqbUKkBPzMqy6E4E0tYF8ddjkfVhkdCt+u4y6DKY3MVA/5CvVOK248a/gZ0nXrdJdKhlTHG74ZVGPegwGwHo6qEpDXwZip93Q1/5DSsD9Fcr7o218KEunNdVH2gvTNCf0YkVRTc7g0Xte5qtS6E5D6PJRfE/q0bDo2xACYLWPGqRNtQNAWzcSsWGYozR9aoghOU3cAgOz9SlZYx5U7Cv/wGTr0sOPV1NyVV4k0/Mr6Qb10BZXKhCPlDiyZvZ1NNkBT7MIdSKrzG5wv6H6zY+YZSBhHOhnHnuOIj5yXlo1/s2lDQdaTVZh7OOnlWKPN/lkRQBBTWNMhMQrkskN8F+RBTNGBuEVo+nFRDfwABzVKjT+kDUajbnT98LFwykjaeZy2KLSh66HQYvxk98J6Lt+CejKJK5J5Q1pR+vHdwgyfJBpV+EQFudavLMgzeitCFs7q7kcSBNocw+gIBoz96QcqTbu4zDCnLtx5H6milaeJV1QtifYSm+przka8u1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199015)(8936002)(5660300002)(41300700001)(186003)(2906002)(54906003)(316002)(52536014)(33656002)(26005)(478600001)(71200400001)(7696005)(6506007)(9686003)(107886003)(53546011)(83380400001)(55016003)(38070700005)(66556008)(8676002)(76116006)(66446008)(66476007)(66946007)(4326008)(64756008)(122000001)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WQUSDS/6lKPfBvRTO/DVTaLj3pEkhiGhZXRd1o6HS9U2vsfP0uywQgRjTg6m?=
 =?us-ascii?Q?0C5HE0KsgYv++D0cS5lnhTDwdD2f2Azc04QJ6navpaPYGAQfdC/qzhDndvC3?=
 =?us-ascii?Q?zDVW/B9uWHYe+DlcnWViYdAIo/JcdHcyGqx2setpTTv9P4THYt5llIQBJX5A?=
 =?us-ascii?Q?e7Dm8OBXa4wBzXgsLBLBncoocYCZ11qwZSwXVXuIFqCLBt1WG2SLzMV9fs5z?=
 =?us-ascii?Q?Andz6gcaBLmx8q4xJB//nvx4TpDJvP8bOrLJMEa4usxTje0MtIPnRvxzmGOe?=
 =?us-ascii?Q?xV0Fjknp9AnHXHnOj9DlCOHW12/78e+8b8JVhmUDUQsMe54i42xaDOyY85xM?=
 =?us-ascii?Q?+RLBd004/Tlq+MqxoGnga7KWuSu87Hn7hhXeA3MHH5dnG33xxx7UJHxD63z/?=
 =?us-ascii?Q?e3q6ofMfaBxG7RLeoVsb/n19mlYUXA4cMztxDgAghw6lPJaXIpv2fu9dUPoc?=
 =?us-ascii?Q?BYcs97wTRx7qtulJqDxnJXeIhrrdyxuOkXabHBtZePijGXQGjg+7zRItzncX?=
 =?us-ascii?Q?fVmtlmMW1zVxpVl4Z8Vf8479t8h8hyXfdTrkMrtoB3A+IgRVTlmoNsADMokD?=
 =?us-ascii?Q?aAQtPIdNOND2wNnA3ZnlM1kMoCEs1eEW+5QbVSVUMob7kKn+Z9m0LTGB4rYM?=
 =?us-ascii?Q?VIkvqCqjE4lv+YH0nm98iBs73FFpmP2OHMxFJoh3YucsKqNH8tY14QEuyGQu?=
 =?us-ascii?Q?7vARdvYOJPbuu4Z+6m8C8GnXbVV8DA0S1E3O5IkqMoNKplLrZBYFNtyJIiRb?=
 =?us-ascii?Q?41mPl9hRomblZMsU1+DwQfIyo+j+Kgs89xNDLsqIxZoFETqORK4kAsJfqxLh?=
 =?us-ascii?Q?UlzEEOB8y2yVsYiXgwsWuqGtmsZwRDV8e5j5v4Ltefrkz64I9SqHbI4P1NHh?=
 =?us-ascii?Q?JJNv9lOkzcFF7TAEClypJqUMiZ8396MqKLhbnQyfjPS2bkraYyqWSOXxm3l+?=
 =?us-ascii?Q?CbHt3r8eN5KI4UgfodCuYU3ELdvVpGXrOpxaRXV8eM3KpZZcjTVVDeFViZjJ?=
 =?us-ascii?Q?WLLnDXZiRvTOJPgMr8LDK73tKZCDSbVd51I1MQpO4kub3V9e1HqP6QexVbGe?=
 =?us-ascii?Q?c4sHsGnKAnPYGcO6w+v/RffQisNZ5F4it0kOhHSWushHioHNLrilbd2UO1QB?=
 =?us-ascii?Q?9L2Gp2cjGx2G6SNpxQR8QHl8QOxdwjasUpoA+x5lU1VUQlrRPXW/gYUQUb2N?=
 =?us-ascii?Q?on6/fE9Jo9x8pd7ISP2jJQmebiBSWS2GKBKbd7mkVKygSVb1gRtOe5edMayC?=
 =?us-ascii?Q?WaW9gCgZlsv47c0DJPuE4FxUtkDy/RGqM/g0qRbalLM/kKxj4cV6z8/We+Qj?=
 =?us-ascii?Q?YLp4Fh7bBYNpJLFAF4rYaYA0UIZCc2nIBKdYHxnvPesxOhpYQwXAeZIV1upO?=
 =?us-ascii?Q?c1Zn8X7EkysfBQa2iGyNnS5HgkiYxLjCLzjR5WBR4NEpIQYHlUxEQ2Q7iN/S?=
 =?us-ascii?Q?4mJm0lN2SLVQefPWFauNwcSVNRQkCEaupDn0V7dC/jgcF+CYdw/XOPPMzLoS?=
 =?us-ascii?Q?mp0dtqMcU3uAnLBfYsSjFzLEAu4W4WWTSO1r3zr80lICTkYz9hT18u3GiRCs?=
 =?us-ascii?Q?u5RJbBti/IZC5Gox/Us=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a352b6f4-5377-419c-fd4d-08daa0cb570e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 21:00:42.5126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vvm4gBCno0e/xvXb/7o3J5sjvxLbhDNPNTfMlN6Grn1ZwjfardY7yGD+8gywyOF7vNFpumU44g/xexoICp5t5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6350
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thank you Wolfram!

-----Original Message-----
From: Wolfram Sang <wsa+renesas@sang-engineering.com>=20
Sent: Tuesday, September 27, 2022 4:47 PM
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org; Khalil Blaiech=
 <kblaiech@nvidia.com>
Subject: Re: [PATCH v7 1/2] i2c: mlxbf: support BlueField-3 SoC

On Tue, Sep 27, 2022 at 04:39:23PM -0400, Asmaa Mnebhi wrote:
> BlueField-3 SoC has the same I2C IP logic as previous
> BlueField-1 and 2 SoCs but it has different registers' addresses.
> This is an effort to keep this driver generic accross all BlueField=20
> generations.
> This patch breaks down the "smbus" resource into 3 separate resources=20
> to enable us to use common registers' offsets for all BlueField SoCs:
> struct mlxbf_i2c_resource *timer;
> struct mlxbf_i2c_resource *mst;
> struct mlxbf_i2c_resource *slv;
>=20
> Of course, all offsets had to be adjusted accordingly, and we took=20
> this chance to reorganize the macros depending on the register block=20
> they target.
>=20
> There are only 2 registers' offsets that do not fit within this schema=20
> so their offsets are passed as SoC-specific parameters:
> smbus_master_rs_bytes_off
> smbus_master_fsm_off
>=20
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Applied to for-next, thanks!

