Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992EA5BCC2C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 14:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbiISMvU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 08:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbiISMvS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 08:51:18 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1CD2A971;
        Mon, 19 Sep 2022 05:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddhE2K7cot2pq66mt3m2gW1OXeCpLMPLixQwRql7+Xb643RDtAJVspIFVzlzT3WU43O5cMQKfcoaV6yc6vmCT4oeNV+YXP8g4t1NFKLX6WCDK+YjPYxUCdWxyP2wFHB2XZLaDcnhXmQyZc8dryhUn87IFPRKGiitSi7vXcswFtCVkDP6M6L1yIaczVr+afFDS476fvamHdw7QEkyI2JK+Yh+RU9LQ21rfWeoicjfnO3h4mycD8/ELBt0BgVx0W2wjJcFBHam0WqlUqo1Ts61iifdLKPK55TM4XdWil1KiBQ+U0QMeRbECJgRsi/ambPBhSi79FXcfsCyiKJf2cMoqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiWtrHGsYZhH+BZXtLamIhEdd2Ik/eDZ2HpOgAzqRKo=;
 b=McsfqMMq/RJP5Hs9XTNfKBJwiwa4/ZVsKfXOuVbB9KgiQ91GfNn+ceMsgiG645N2OTodHp3S0DTMV/GjC7/0ChDgeF2DSamgC/xZQPCpxO26l4PgTqUfyh5Y4Bo0qw6I6oUXy3KjpZPLOolGfPByEed90iVMdeWo3OBEGU/4v8QGgGe05hdnIXu+4qLgwHp1efIi6r22k5S87D/SQCMSjbKZaaPX2XPifvWnTQMi9jaTdnMdDNE7Lb0YumEal1kvcPgzCoNj6GZFCG+DPhYgs30oI5JyKPm0aA7xJwHg5hNjDZwEDawTcjs5ATUXSXKy5Sv3lRHYznF+NJCGYTSIQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiWtrHGsYZhH+BZXtLamIhEdd2Ik/eDZ2HpOgAzqRKo=;
 b=PRvo0EerhOMaynBFwR4NAX3dmUfXEPWqWfUCHRZypI6W+nl4mSGzm6fsd3DqB6Fy6RkIsRbUS8QpWOIWZ3N1qw6aiq4z+7OFSK5J+wUD+1zD0yQUqEfGR528k0hzbPAB0pBSZZmILT7Vc6kaYP56tQkyMsU8nniHORFvhPrOdYIQ000npkl6LNZKBz/j7jncJp54bACmlEkt25oI39MW3FaGgODIrfKs7CFpBVy7Wr8UEFuDAFxE3FuHN5gv8DKBAdiW7ZA2W9yirYpnTOjHIEIGozvasU0xm1v0Y7rbXZKXHRGvksc9LK4rfVaCDt2ehz/++ZJTlWLfrmYl7llDWw==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by DM4PR12MB5198.namprd12.prod.outlook.com (2603:10b6:5:395::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 12:51:15 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::41c4:dc:edc6:b5e2]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::41c4:dc:edc6:b5e2%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 12:51:15 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v3 6/9] i2c-mlxbf.c: Update SPDX license
Thread-Topic: [PATCH v3 6/9] i2c-mlxbf.c: Update SPDX license
Thread-Index: AQHYw6l4m889ZgMAeUmoh2Hwrkcv8q3j/+YAgALFr/A=
Date:   Mon, 19 Sep 2022 12:51:15 +0000
Message-ID: <CH2PR12MB3895007CF192640BE2D3F0F8D74D9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220908173544.32615-1-asmaa@nvidia.com>
 <20220908173544.32615-7-asmaa@nvidia.com> <YyYSWjFJcmzCF9z5@shikoro>
In-Reply-To: <YyYSWjFJcmzCF9z5@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|DM4PR12MB5198:EE_
x-ms-office365-filtering-correlation-id: 7a1933b8-ddea-4390-26da-08da9a3da3a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: teJAiG2m00FJz9EVxSR1kWxbnqra8ayamKJ/ZnM2SMrfArERAzq3kBoVZ7DLSaKOKzGjQS78z95SNi0jjalRY85pWujeexB+xe7+M9m6SO1FOyN263dcHECT2MdIHTWfNxUjKtcDRZc3yW/Nci1aDm5Q7X3gjjBCHkn4RrxiiagoGKJjKlRMhA1jhNtKN5rYn1/RfvLMcwAx1LLxsoj2C0MyuCPXA5/PhFHaMQ4sewQaxVEDK9wmIEd2lXgh4cnx2GRgWTxYNv3AEGJbcVp46MWq5wPFKKm9s0Qmwy0cder5yUUf3yH8y5Ani/F8f8E2g5aZF3bnHG4ufMQmblwiU8gSv981l8ncdutTIxftEjPvyt8YHytTXH92mCWu0JTzJ/ir0O0nOmaAzqq25FcCGPcRbUKyQ1LK1MFihjCsOMaRp5gEmERMpt7N5exc6qODTuKSTMcVViaIqT5t3tDuc4uvoWESP8dqV3Q3SjUhKuMKw+ggHcErrAhX/CGmITzLpgoDgQlHH4kEmEaVpsEaU7Nn4JGAzLGkjhonpmdNOwlSrclzxi1oP0+Jb2bXHMGv0DBoV1fHXNA3T7gXOJ+Ev+7r2biwtH1ztb14sQJN/SOrIM+8RY9lY2/AkVjR2ycnvAo+pdK/pbWuTIj8ie8eJq5VJvqELLvwzVpMsfj1zrfK5Jy9TerHn9nuN8aUaQwif8jF2uNUYx+lINsIDNU6GPCug9WSED8+YxsZLlhjo/ebtid+VngN7i2FRku6cz+VWuZz81fG5TfqnJTdgC58RA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199015)(55016003)(15650500001)(2906002)(4744005)(122000001)(316002)(38100700002)(4326008)(8676002)(66556008)(76116006)(66446008)(5660300002)(66476007)(64756008)(66946007)(8936002)(86362001)(54906003)(186003)(478600001)(38070700005)(9686003)(26005)(33656002)(52536014)(83380400001)(41300700001)(6506007)(71200400001)(7696005)(107886003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hw/UlQjQY3GMv24iUnpFyXRjQchTEOc+9pqfx/GLfXlNusYwneb16DvZ/opi?=
 =?us-ascii?Q?KzQjYPWJEee5x8CVNtklNaQDr/8Fd7cvU5HJGLpxWoIFMrDdzTi8o80zKUkE?=
 =?us-ascii?Q?Bp0OnV3d7/ljGrQaPeF1eXdI4vDpSH2FZWzp+/UfudM4rziCCu0t2ZpGicir?=
 =?us-ascii?Q?kfg76u702BvQRB4wq6ETOkFAmeQwTX7Clj/iEP4GDtlWJspBxhHgQD2uB65y?=
 =?us-ascii?Q?AkZd78OlacsgAFFvKr12oZMZDGphEq0cVX1AqB09N35uaM2NZiHTLalLSmtZ?=
 =?us-ascii?Q?q59WM8mgorpcovou7Dyz3aa9SLeyNEyynAZkxNqJ75wjQ7yK7y4M7Z7kFMkR?=
 =?us-ascii?Q?WBYiXptN5iSV24obXzT7a60/bZbss12aodKjkGnta0Cs1ovSrljX2DFWwm9R?=
 =?us-ascii?Q?tmlpoe44Dc3dCzwp5v/S0cb0O+PozBZDAKHZWRAvEeENZgBc3sD9wqdzcyeY?=
 =?us-ascii?Q?frPaw989/amSsNU4A/Nv8948H7LRfib3QV/ef0tNvIBlsLkQDwEj/Ld6oXPq?=
 =?us-ascii?Q?FWTEo41QzAavzoRnFL903juJZV0A8XfCpWAvc1Oksm34OxznuvZM3fVdT/4S?=
 =?us-ascii?Q?hoTcUxPtZAOfFrwdM21WKR2IDfCyOKLSbAZpyWctmWA1NAew/A4AFtxiikUc?=
 =?us-ascii?Q?VUq1Icen8CbsdlfgYn07o5So7xAzw9BlYQiqN3+jUMWrib+8T+knZ1gEEQ8W?=
 =?us-ascii?Q?LS81Gk+FNK3VU0NWiFR9s8IkjgfaVHG6apWYno+rz7SWwBxTRvXrY+KVDaNo?=
 =?us-ascii?Q?y4ZTtae0zu3uyL3fiaxE9c0IBuQJCylTWCgotdWbVH0G0tjQGh3I7jlj4c5Q?=
 =?us-ascii?Q?RF+XEbJViwyJckzDN60eIJpp4xs6nVjh/lyPwZATgjY6Syp2S1zyh2GQB587?=
 =?us-ascii?Q?QmK6eOYDRc+8Z51W9w36w+RYrM1uhXFVcmlLtUXxoyWqlippp+ufQtKl+6b0?=
 =?us-ascii?Q?ABVCpZ7ncyOHtJAk1sgfM7Lr3gZq2krNmovPfU4cP5uz4m+wk69nY3EG6bX/?=
 =?us-ascii?Q?pL/A2Dttnb9iL46G1Qp5MiAK0+KSyylWERzHUHzWtRNQ64vg8W7bA5OrNe0U?=
 =?us-ascii?Q?sIjs+kxhrAv/ec7DQcKzFXOm9yYt7CWYGHil7sYO/K24XXb2HNsSJZcJalFj?=
 =?us-ascii?Q?nsHh4xaNAsGWoLkZJGC3YMI2szlzhsJ8GjuooBP8J28tqRLOahHyD8E911Fl?=
 =?us-ascii?Q?tqplEfZ9MJm2FdV4xislYkD8PeSZ8MFrHWJT5rT9ejHTDwYISgDV0OQL0tGT?=
 =?us-ascii?Q?YQulrKJXpipEg+NacisOZOkhdSASoaiDM0nqg8k1ysa4/f786BMukA/iOOaw?=
 =?us-ascii?Q?ccRnCujFouTKfL/B+NDIw7grJdRSlkSVP0fOv+/fYUOYJoQhjUBUd70mGtlV?=
 =?us-ascii?Q?HAGgdTeCdOTP1Pkp6v7HkTQcUW8ezI507wekUMurVGDowbvzGO+PjKCh3rZ8?=
 =?us-ascii?Q?Imk5/1BnVHTcL39PazhYFybuHtyvc/7//6aQxtqrI96yjByAFGaPNrUuKbj0?=
 =?us-ascii?Q?Na2h8T8XNHIOxZRR5o+vrpcpDSJ/xjD4YGvKty/V1n3m7UCgNcptZtbrf/wy?=
 =?us-ascii?Q?moc26O7yhquur57+7+w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1933b8-ddea-4390-26da-08da9a3da3a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 12:51:15.5029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 45cbUn1/lZ817ube002UXZKpAQmtFR9a2uyvOCKYi8DXNqTk0/zDRepHVWwtW6q/EYMqw/pp+WDyQydVdZJuiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5198
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Will do!

-----Original Message-----
From: Wolfram Sang <wsa+renesas@sang-engineering.com>=20
Sent: Saturday, September 17, 2022 2:31 PM
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org; Khalil Blaiech=
 <kblaiech@nvidia.com>
Subject: Re: [PATCH v3 6/9] i2c-mlxbf.c: Update SPDX license

On Thu, Sep 08, 2022 at 01:35:41PM -0400, Asmaa Mnebhi wrote:
> Update the SPDX license to GPL-2.0 or BSD-3-Clause and update the=20
> copyright to NVIDIA CORPORATION.
>=20
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

This needs ACKs from everyone who has touched the driver in the past.
Please resend and set the people to CC so they can respond to your request.=
 I suggest to move this patch out of the whole series and handle it extra.

