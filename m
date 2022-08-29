Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C082E5A55BD
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Aug 2022 22:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiH2UqP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 16:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiH2UqO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 16:46:14 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC16642DC;
        Mon, 29 Aug 2022 13:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFetXRNCGO/39URH390mk+Qw+jtZRnkJ6m4zyWwgOgbt/p6yCqc8TRh739EKM0hxabGvcxcQGs1J3/TrzStFUxi0gRV6fJK7MHUQdywU0vwwMcDBaRNRPL7VY8qjiR5RLPdwnoeOckxwElUoRnewPvYWOgE3VQLSF6pwjvuQiCOBX/nYIIuBu983vg8dVzmCTItbxwV4pSRnsdzx1SxoY6G0nktdGux3Ocv6BV5RytXGGhSr6M6w7vQDCGBN+0nSxIMzgeKoAcOBV61MksrTaHx4utLrf0BmejwxnonsAN2t8BMCswWag5JgXm73UL+toz1mzcOpI8dO9YoDDZSndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWp/XtUPUohUcS+iACO1Y8dXpM+R8QbHY9rueWYQGn0=;
 b=dL/I4Q/ye/9f/UwDPqo8Bl3+ToH+9gw0F7fid3h8mDiioBLZOfJb4xg+Ua5RxA5Zkx4wtMpdWNnOgLQZniNPfXbRcqlGCdKF33w0vhm2Gr6w6Ib/PK47h55x9PBQsHyQzD3Yh/vzNMdlA10inzv1A67chMgMZqDw7aC92a0CIgjrZsalg7i8aNriD1PlmpNei3wVUMe7rmRLthQk18KiLPqb/1LFYOWwv1oMaopUCOyXoWkX0ed/dG5Ewx3KmsXPPGld68GpaXPJoi9dQaaA6+I9QCca208Oojk4zU195APoAXtC1rmC6isBgMVR+nCcrMRxRWEOwgvS2jRsUogbjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWp/XtUPUohUcS+iACO1Y8dXpM+R8QbHY9rueWYQGn0=;
 b=ti955YyPAUQO/Jv+nlk/g3N88+Kybswv1xrGvxqIgtdGivMqN0O4Ki0NHkG3AJaRDui80pzMv/VPpgzwsrr1UDaNlShfU7d2jOMNz717Qb2N+UTdrLSoGcRqeHbqU+ozOFy0bUJXjeG2MVcWnV1X6q5xi6/qG3v3MTuxY0uNtSH+XVmr1nrMx1vNreVtI9XZPvuvs9tZH3OaItoK29b6e55bGKnnVtUxaU4EHUXaBxWwDoVK5K3ZsrhN8ZZdPybMJgQmvno4krIEodcJHRNSMsbo8450pME0X7IEd/nekNDz+fSubxWiLU03xFSfAE/x72jJa5fEyi7VHWbMnJbVqA==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by DM6PR12MB3260.namprd12.prod.outlook.com (2603:10b6:5:183::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 20:46:06 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11%7]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 20:46:06 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "robh@kernel.org" <robh@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/9] i2c-mlxbf.c: bug fixes and new feature support
Thread-Topic: [PATCH v2 0/9] i2c-mlxbf.c: bug fixes and new feature support
Thread-Index: AQHYtmFspLN7eEXzUE2AAJMrZ0F9+63GXGUAgAAEL0A=
Date:   Mon, 29 Aug 2022 20:46:05 +0000
Message-ID: <CH2PR12MB38951B9B8F189E1B991A7950D7769@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220822195725.12656-1-asmaa@nvidia.com>
 <Yw0fNuOWtJbe/OT1@shikoro>
In-Reply-To: <Yw0fNuOWtJbe/OT1@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f61014e-14a8-4365-a784-08da89ff7e94
x-ms-traffictypediagnostic: DM6PR12MB3260:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S7qF7gw07D6RXDdpEVJwwaJbhIj4LVKWgrcu2rHSMzHgcWXTCMaz48qgFiGSpvrmBqX2rtk1G3HcNzM2/4/2TOugdY/EiHEc0vNw67SABXFlv3mv6ZjylTfT/UUGoZkt8myDdm9mYGFG4xMrTekhsWNVUWbU5nQDBCh1I7MmLaed/n7sRym7FMd2XscQCO07/xBY1x+IakQdVypg5IAXzgvBr/gCAexs3iAEr0Fo2RUYzHtBZQE0qE8O5sSglpiPrHbbMEeW9N+h4KZouURiXHTZbJwaUzAKzh2Ufjln0m/CB2wv4tvCTe6LqORyDSSFZMlfRrgDMBJMLgJXSdbIIdUSDIKBNJuNVdlRpKHWnjjFGPRWrki27gr16ouTLw7r2rz4hOtwc9ALqrI8QHGlJwzu+1BPy913Dkc+/PBpJz5c6MamcnQsX7TK4IYJC8mCie7jQVv1qW8fC0EDuru1ORNzzQz1hB7YWuO8mmbPj5wTgQEDw7vxietcsOWqkVPa2WgmHrhfIgHqE8aMirJbVla92z8XtUbg6UQbrsxbkBQg1Jg25/B1nPNCaBu79wthtP+um02s2FXHilhA08wfjfciGr/AaWfTToVKg494SWFuPOxLdBJlLwExwAOrcCALmJuiXawHJ9PBlPdfrhKavwdqca1H2mGqN1CabVk91yC+xd94duLfzsEzVtvGJSaeaRU02an3MZM8Es9BbGnMPtpVFRhMXwJ6fY3sfbN2MsHRQl3cawg3jr2cdRU2nBrGLoYl3KzEX3yw/oCobAbPQ/i5WNkhnFKfIpmPsu8JbuURQroO0Eeg2tBs1l7RhwAc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(122000001)(55016003)(38100700002)(86362001)(38070700005)(54906003)(66946007)(66476007)(8676002)(66556008)(76116006)(64756008)(4326008)(66446008)(41300700001)(8936002)(5660300002)(478600001)(52536014)(71200400001)(316002)(186003)(33656002)(7696005)(83380400001)(2906002)(26005)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iFYkTz8aLVXv+xbgAgHS+PYTMDYK+7/KUEIEAPXDe/6k7q2r0mbIwA/eVWjB?=
 =?us-ascii?Q?0tkiO1ftvh7bnLdJgVPzYKELWzPqr0U7yGV1A93PsT5m8xuSPMZxq3qDcT1D?=
 =?us-ascii?Q?ckxZvUPHX61NkFpoYsGLhRprT+it9ZVhJcgnJLaPkkO7hglaxEO75vVXojzi?=
 =?us-ascii?Q?nL8OLw8K9OOWEUfTLNEVbgF+rcBv3cgBpdP7VieDndZIuXUaB4oYayXMhDYY?=
 =?us-ascii?Q?4sYNnLP9wiELukKsHKC5MFGJLZ4KPrCm9bbaQyhsOZVH1DI6wyDkj6cg+oJh?=
 =?us-ascii?Q?r+Do8A/2IrTAW4PbY6f6gYzRkjLH0/5CoQGlG+yWQw8duNQ/e70YAWkZK3TW?=
 =?us-ascii?Q?ClB9jeeTt+wcvg1n/sQt/nNpFSYaOBwsh+ejzVbS0xIfI8wSLvKLI9+Zy57r?=
 =?us-ascii?Q?EeJiS1m77+yRzYO+rI57TCG+wW9oG5GJb9sqPCA75WDon++NGflmATRmH2/5?=
 =?us-ascii?Q?2hNNp1nYgOj2VKhvkQ4WiDEfxF/9WEHvS5I4vYllSPkMJmqT2Odl7MuPCT4x?=
 =?us-ascii?Q?Ge4NvqJGPxNxcZEvwi23tLscKAGexyqG5ubpwKoNBTV2ipmsqFngJUlG2yKR?=
 =?us-ascii?Q?AkY4vfPxiTq8DRwcXGe3KT1r7hOBo9VaX0VTznkz8QzIMv12AowEIdfmIKc0?=
 =?us-ascii?Q?YVKi740llchb5Yvgn8OyVhPmMRaMGWVTuvrnIty2DNODXeZLcjYJTNtsfB51?=
 =?us-ascii?Q?MvaiTroDwbmmW7FVNePLm+4xhFNs1ZpObP73VqGxAA31pcwBe2a+h3IcBTD+?=
 =?us-ascii?Q?pCQSJNpEfmjgwvdiaQSdT+HFWOLRDFJK4HHiko/JAJ8SzKWjg+U+AKgSq9Gz?=
 =?us-ascii?Q?pmgDOS18QXzYNRLMZMYLz0VWWL2mx+Oh2ahRCsJ2rwSrUEdy20mjOIkq8tQY?=
 =?us-ascii?Q?HtddbLWsTMfxX1Kn15izeswTEnTfWPiO2m9KC0YtlkzDnAUGelrWyIvYEhJv?=
 =?us-ascii?Q?vdkOD8pdXAIkkaUmTkObtjWGb+2u/pkj6X3zLYR11cDiEZ1YQYLBws4OXVKT?=
 =?us-ascii?Q?9XCDe9U8N5+NH4bEXDZ/OU3BlseCfg8LsAmeGlJ3Fh7uc1SOaIUSnFznHDC1?=
 =?us-ascii?Q?8aL7ty0wXo4EDUQ5VqvI7q4xwsR8HABdQwsSa+RhBvhXIA6zJO9+AdM8Hh64?=
 =?us-ascii?Q?YGBWns8G5oNsBy9+FSW/AGBUvJ3zryY96QPv8VgOnqCPHII+rIQnruqSqq92?=
 =?us-ascii?Q?DorjCqtkMcusOSyrQBWzwaA6CmaxPlZ90LXTUgwFTRN5DPpCD85LkXfUUv0L?=
 =?us-ascii?Q?hy63R+3HcI+wKlbrnhyzm2tUtzg1LvBJw/4loBNRuscEy+EoLOsZCNedqyUB?=
 =?us-ascii?Q?NRVVkwvlXYq368Y3Xq8UqyFTz8kWQYge7yZqO6kJ3o/yipgFOimtNjopj2V4?=
 =?us-ascii?Q?vZ5DuHeTTgUQAOEjFplQSLZFTgRrhYAFGEaHqRkLt+u+rrkxm2cpZQdhFImC?=
 =?us-ascii?Q?z+izC8QnRoVovJ5OwMT0U1VNNQs33DcBaOjX264KFcQNfU1Co8Vvz1JLVHuG?=
 =?us-ascii?Q?Bocu04SA+OmEgyytwQ0emRAXRxfOgJovxcKr8Ls5sY2GcaEx+LtcS2R6Gy0j?=
 =?us-ascii?Q?JgaKyCHfSZWsi1pRdxs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f61014e-14a8-4365-a784-08da89ff7e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 20:46:05.9371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCnCkXqvaHJpUQRccoJi4AnLnT70CBtPQTLi1W1ihWJ1iVdvWZM8AkkdWeG/yOtesnI9oFV2KF1xWn5E/wgNKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3260
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> This is a series of patches fixing several bugs and implementing new=20
> features.

What did change since v1 and where did Khalil's Rev-by tags go?

Khalil told me to remove the rev-by : ) since it is supposed to be reserved=
 for the reviewers. I will add it back and describe what has changed in my =
next set of patches. As a note , this is what changed from v1->v2:
1) moved all the bug fixes to the top commits and left the features for las=
t=20
2) split the BlueField-3 SoC patch into 2 to address Rob's comment: one for=
 the driver code and another patch for the device tree binding yaml documen=
tation file
3) addressed  Rob's comment regarding keeping the device tree/acpi tables b=
ackward compatible. So add the new resources at the end of the enum.
4) update the license in a separate patch

> Bug fixes:
> 1) Fix the frequency calculation
> 2) remove unnecessary IRQF_ONESHOT flag

Is this really a bugfix?

This is not a bug fix. We removed it because it is no longer needed.

> 3) Fix incorrect base address passed during io write
> 4) prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
> 5) Support lock mechanism

Here, I am also not sure if this is a bugfix.

I think this is a bug fix because we have an i2c driver also in UEFI so we =
need this lock mechanism to avoid race conditions over acquiring the i2c bu=
s. Not using this lock resulted in unexpected behavior.

Thanks for the update,

   Wolfram

