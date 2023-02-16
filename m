Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C832B698BAD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 06:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbjBPFTa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 00:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjBPFTD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 00:19:03 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C178A442F6
        for <linux-i2c@vger.kernel.org>; Wed, 15 Feb 2023 21:18:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKmvc9b2/qDwtX2FjwfJgE/lE1X5BNK0yxpLn4M6bmeXeDLvoBmTDFX8iihNLRy9O7MavLnhjKubJ6B50avgzHXyZLZCK1yxxbSdZDwprcQ91+oU9xY1NZyURcagKVZxV7dye2pejqQj1K4SZVJnm/EB99Mh4zr3xcWh9I+HDq9FVnMgRHbZA8GqJ5QpSx6/1nj9wSdCNsjYO44Hp1YFntqkmqCWUgdgp0zRuL0PKN2i+tCTRpxTIo1MUetOSUl6x7FpAKB/piBQDMVBa2ckdQP3cjLIKyPGR6NbOxAROJLUXuUr231ipjvsSFwjBnR96sZGxnYfJSD45H+vEY7t3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lARjr9oAjh7Dzemqa7zzM1FQ4NCaWGRRakALdjgN1U=;
 b=dvl8LSCGunbYd74YG0RryUP8yJ1OHPkquwedPNfZRtec5b82TCiPTDe2Hvo9jj7g5QUKMJwrKHnhGNIHwwgwMQH3LXA99GJ1hvwuzVPjSA5NKR6+NP+quZAYqZbBjuWLIZdo8VeW8m8Gcdvxf+kt77K3ECRaMJpLOlR1BCQaXRjO/bIQ6XJdODMPtFIRTuTAZHhHtXekTNKU3wvm+JVxme3ou+o0r6rqg5WH3b5CjOEO6Oig7880SEIPq2vKFX2C7V97sp1dJwZPQiecC6TXRIOsl/4/UW9hhALda4DnJJQfpUfzjb6OtL511gKUMeiVt6cQuHRYnmynEzZeIHx81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lARjr9oAjh7Dzemqa7zzM1FQ4NCaWGRRakALdjgN1U=;
 b=po++BkiKbjScFFszpXZZSbyiqJMpxlTGUq/JIGcRSQt3AU3G+YHnFWj/s7+W2z4K7B/sFfun+GfG5R4eZ9CTBV0kwNG5SeghkCIO61kjUdf0F28R0egr4nqLSzcLDtWQ5bqOtG7fYkcRqduQyeUZUoboP4i74ceIHPN1ybIi6sE=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 DM8PR12MB5495.namprd12.prod.outlook.com (2603:10b6:8:33::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Thu, 16 Feb 2023 05:18:22 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::8f39:45c6:4067:ae15]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::8f39:45c6:4067:ae15%5]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 05:18:22 +0000
From:   "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH 0/5] i2c: cadence: Small cleanups
Thread-Topic: [PATCH 0/5] i2c: cadence: Small cleanups
Thread-Index: AQHZIt25YvFt5ztNH02099B3S7ru8q7RQfAQgAABOwA=
Date:   Thu, 16 Feb 2023 05:18:22 +0000
Message-ID: <DM4PR12MB6109270B0E938DFAC2D19C168CA09@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20230107211814.1179438-1-lars@metafoo.de>
 <BY5PR12MB4902E8FC89477C6A1038F15281A09@BY5PR12MB4902.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4902E8FC89477C6A1038F15281A09@BY5PR12MB4902.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-02-16T05:02:29Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=914acea3-6806-41f8-8667-99d72a207bfc;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|DM8PR12MB5495:EE_
x-ms-office365-filtering-correlation-id: fec0e0c2-9d95-45b8-8b59-08db0fdd3943
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 29icZ13C3J5YQESAhkxG4YlobaI3uA0XFNG1ejdzpkyNLoPH7bT8pm8/6+uqLFweLyB75f1G6CNW8GpvE62iEFYu4jLCH4iPmZCKsmoJUTf6Lkp5hRm/ckDYOB93i24WMtpVxHpAbcr0KrjGN2zGdqBno+KLNu3Ak7Imc8q/cxILuArpoC0wN3Zx9oZTXFke9458qWVKoWkmjug/0O2CShaYBLKQgtHreKUvO2axPqUUQvwKF938B/Oajjo1bsJL/LqfwhNauM8B/ZEF7SCMzKzmMKQV7OTb/YTPBq91kNGlsUN1oQuFzQVZ9ArOlZoapSzvvKyX9qCkiJ2Y7BU9WQRY6stJz5EcR8cLsS5np0BXdWIymVCgqAj1Zgxj9B8S4wAo4ksTB+W/QddZOxmyaCDxvfUYpXgTxVzPuYDHqEqIbSokM7F0j0TTXoX6LtYeKxx7eJwNCgIKXMZwXlN8JNIrLz/wWy2VFwdcZ7oX8oSfvxJ+NkPmQerrhwoJyrEwORexAk79Px0WNcBLnOpSLsizzbq/4Id8xUM6k1NufzH+4IS0ti940kG6uhYJv+u7GkJwIES4pbF83I5QPjnGENcMokAsNszm1121YSthS2RVUQeurY/m54b9w2j3ChBoFV84QtTR+lw5fatJ38YJBPN2tzaQBFCkfKngAHvwZt5RdnU+B1D+folM78lqog9qJV4rLDbN6HoAhZPURLDbZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199018)(2906002)(52536014)(71200400001)(8936002)(8676002)(5660300002)(86362001)(4326008)(66446008)(66476007)(66556008)(66946007)(6916009)(64756008)(76116006)(33656002)(41300700001)(54906003)(316002)(83380400001)(478600001)(55016003)(38070700005)(9686003)(122000001)(6506007)(7696005)(26005)(53546011)(186003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?937+ZxkmuY/6qqesJ7tP9cBL+PxNwUPUJNfJUrZZDnd9NwwhyvcToDR/hrj1?=
 =?us-ascii?Q?7JlNioH8PNPUqkSqG2g1lY6Lazg8Gg/gmAC5ZPXhw71H7GrIl5vl/PGQ+jOs?=
 =?us-ascii?Q?YkAg1mDZT2S25zu9rIYTEkow8stW/rZiAI5oHYHYpJCq2yiLxVoGhK00zYf0?=
 =?us-ascii?Q?PFh2Ac82PAJPmZ1nIXHdquq9c6yipWLNGEfJIzc5Yx/A7wV7xjvXxbcISAhC?=
 =?us-ascii?Q?h4AnlMU6ajHznFgRzhm10ueQp590Oe6cajMZ3yQ1A71Ki1xstg3WvLdhqhc/?=
 =?us-ascii?Q?sSLnWjNK7RN52Yo/gOByHP6JCWhd8VTXUPUbC3mIOsTEzNyNnlfpxDBYU50a?=
 =?us-ascii?Q?i4Z6VjUJb9A0p9C6gGlbcU/Lc7SVPfjlQifTeY5Mc3zSp1RaBSAMS577+cvL?=
 =?us-ascii?Q?0Cd9loBU8Y3v8hSkJOT+EVneHzGVLZWBKYtgexHD5jyEbU9Md+rONfXg820z?=
 =?us-ascii?Q?XFBvMPDBIJ4NrNHCavvGhsNwfGftcy4MtUQf0k738yehOarUds5W5FIVBE2v?=
 =?us-ascii?Q?LPbej3c5z6fMyQQyqsI6K5ZgjHzUXn7S4rNUBLs4K34ZlZFzDfhQ38ldyuzr?=
 =?us-ascii?Q?2Pk14gk2AS4qRYKwAGgelS9MXUopUQyk0PaWgrnGNEXmd0TypSGFLWTbNPop?=
 =?us-ascii?Q?1UTk8VzouYdNQt8I92Q98BicDES3oE9v2oNuXeg/HEtMQNOsgnh4CHoRvVBV?=
 =?us-ascii?Q?DKgIIBSSBU0LzV+mtcDy703PbSXJjxpdmUKUppDgx5YafxUm83Fe0MzEqUVj?=
 =?us-ascii?Q?G6pxaKFh42ThDtM6SDijTvNLgWtIHu9gXgSV/dqLHaJNMm7injNm/3k9/9Eo?=
 =?us-ascii?Q?plgragfGewlbpdeicOzj3XVCEZYkDgXTl5gbzdfeBaeX934Ll2gaXZf1h9SH?=
 =?us-ascii?Q?5b9PBzP5z/Edt+28wOX0q3KE014FhypgsLUJByBaZS+cyn5M4AxjlI0Men9i?=
 =?us-ascii?Q?umzNeuTM9yGwplbZ7ul8q/F/ccsCX1jzAmR34TtkTeOkJ6+TLYK63Gc7jTfW?=
 =?us-ascii?Q?mat6nDs+7Ih1rjP2eAIrZcWGsEA6rZHgkk6X5+qYfw40QNsyrkKvfHCbhVNA?=
 =?us-ascii?Q?8WQ0BkMZbPZEWPaHbu1jvXHScAefB60eYTfu+NuCZ/IPmGKKNkc/elqK4Hdk?=
 =?us-ascii?Q?MTgr69vnMvI6ct5o9xucjZZp0aTdVK8uJ3nvODcYmWCANoeihmavaCDt49Rm?=
 =?us-ascii?Q?V/PA+BVzoqqerf/yROpPlxvg2wGKXrNdVTOV76RY7r5sKDI5VYE2XM2VzkeJ?=
 =?us-ascii?Q?H25Q8BFyYvnmOOUtO+WpGB//bTZrbvnzQYPiPMRQagQrLiVcvPKhSZpqqfKQ?=
 =?us-ascii?Q?rJzoOnAaaTctI2gaZ3qD2OY5ujUTOfp9s7lst8j6yNu+J5RJQu19ureMMRkb?=
 =?us-ascii?Q?0eeg0YOXs/IOkiVM6hsP785NY7aE4cUL1To7kHOhtgClk/AsQDpk7zM3G6UM?=
 =?us-ascii?Q?tkqVITTThfikd3QBip/+T9RxYFQFvNNt5MiujMJJs2DcYutccb/JMx6vwCov?=
 =?us-ascii?Q?7R096FN4jZqYmy+ONRFb2GQ/PmzdIGvNa6zP3E2hTejsWVs9rENkiBjNrY40?=
 =?us-ascii?Q?taucui2MXVdp4PnkC0s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec0e0c2-9d95-45b8-8b59-08db0fdd3943
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 05:18:22.5349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SpUhCFUcNt9J3Is6+lvLwgzkLfMjB3vRAAyhTpk7VlCGH41EsEsAZHd4xoKsIpEUWGmpLQfZ75TCyfQEwqFzNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5495
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi ,
> -----Original Message-----
> From: Lars-Peter Clausen <lars@metafoo.de>
> Sent: Sunday, January 8, 2023 2:48 AM
> To: Wolfram Sang <wsa@kernel.org>
> Cc: Michal Simek <michal.simek@xilinx.com>; Datta, Shubhrajyoti
> <shubhrajyoti.datta@amd.com>; linux-i2c@vger.kernel.org; Lars-Peter
> Clausen <lars@metafoo.de>
> Subject: [PATCH 0/5] i2c: cadence: Small cleanups
>=20
> Caution: This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
>=20
>=20
> This series has a set of small cleanups for the Cadence I2C driver. The
> changes are mostly cosmetical and there is no change in behavior of the
> driver.
>=20
Tested-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

> Lars-Peter Clausen (5):
>   i2c: cadence: Remove unused CDNS_I2C_DATA_INTR_DEPTH define
>   i2c: cadence: Remove `irq` field from driver state struct
>   i2c: cadence: Remove redundant expression in if clause
>   i2c: cadence: Remove always false ternary operator
>   i2c: cadence: Remove unnecessary register reads
>=20
>  drivers/i2c/busses/i2c-cadence.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
>=20
> --
> 2.30.2
