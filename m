Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343AC705C52
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 03:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbjEQBWg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 21:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjEQBWf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 21:22:35 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::61d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFA1E0;
        Tue, 16 May 2023 18:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq2+0relZN3OyjMQ3e6wRTaSSIjY7geavGCjFPA1v8kcU5I+llN1vcXvcKnAzdB3ldXUXMLjnW0tXuH3hyVxYvZOIty7rrnhPOTpqVTlgE/k+Z9fOZ52va2wUbDUFuAgnvS49wyxi2pcE/zs1c6APGQC+Do+ydyNbfq/SXtl15zQsB5HylOA+gQWl2UkoUNuQV2nToZF8KJ1IfcP6jsqHX0UuMGQggg9P+lg6b0EBmAz8iIhES7LynKyVXvciqkOf17noCm3TfSVYjBNsXktv9xIXjSOLqAMIZbdg/hK5uo9pB7kqITXVdGzcQKMk6RINrvJR69kCiFIDfkCqcbx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fyq2emCby2ChJmUzmw4Yac0Tj5mGWpZCaPqaqqkg7+w=;
 b=js3PBJ9657k/kZ+WiJhszzGXQBAXiphrfLpkxmlTRDkatlX2OKqk7tEQMbTo6KoZbXoVhWa/KBtHEFYQSMYOoaKesxVwNHd/50C+lUPXOBgHv7Nq1RHQGCdohZrKLbS2HZq5FYKFUBmU+0AGLvD2GGlZI+ki3aOqh3cS5rRPeli13Wq4H8GZbQz0PfxCjhfMm6ClmqXB3Ifz9e2v9JquM9IwoxVUiRQenfGSeFL56tlSbJBcC9ZcQXK/381Ztt6mltCQVqXzf0uAXcHn0Vul1qb/iGFBvD4n/srv0Le5meqyUNSADe6p48dVsj+mOJPrdxRoaGKewm/jvXrdacQnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fyq2emCby2ChJmUzmw4Yac0Tj5mGWpZCaPqaqqkg7+w=;
 b=LSObnUyqwqjYks0sT65oCwLZVtgx8jdNTJGJdWtFBfBcgNEOQGu6PmlwjTsNlXQ4mAMcrAmHF5124ITL2ddZn9vYnzjZXknL9lX8rh29yKGEyt+KBFUJPdcYWdFAE34iLl9iTSorn1v7DW45DpJ57sa7zBvrpNX9gt8l0EcKqA0=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 BY5PR12MB4949.namprd12.prod.outlook.com (2603:10b6:a03:1df::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.33; Wed, 17 May 2023 01:22:25 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::f860:816b:a9bb:27a4]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::f860:816b:a9bb:27a4%4]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 01:22:25 +0000
From:   "Quan, Evan" <Evan.Quan@amd.com>
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "ajayg@nvidia.com" <ajayg@nvidia.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Lazar, Lijo" <Lijo.Lazar@amd.com>,
        "Goswami, Sanket" <Sanket.Goswami@amd.com>
Subject: RE: [PATCH 0/2] Adjust logic for power_supply_is_system_supplied()
Thread-Topic: [PATCH 0/2] Adjust logic for power_supply_is_system_supplied()
Thread-Index: AQHZiCcatcN5IiwPCkqQuW4NpJlo8q9dq36Q
Date:   Wed, 17 May 2023 01:22:25 +0000
Message-ID: <DM6PR12MB2619C223B0450A23A39BB093E47E9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230516182541.5836-1-mario.limonciello@amd.com>
In-Reply-To: <20230516182541.5836-1-mario.limonciello@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=8bfa0a28-2987-4b7e-9ea3-ea3c04db409e;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-05-17T01:21:26Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|BY5PR12MB4949:EE_
x-ms-office365-filtering-correlation-id: f9476c1c-6393-4d79-f16a-08db56752c22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H+MQf+v5NEQYxd2t0olTIKagzGGaqxK18IoNm1sE+sVEWDK02DZFLaJL48zRZXz+cM0gZZAx7Bcyltu72OwEXVSi+hM9n9GUC2jUCUxU/Lx8UcDfU0Ui73jd43Prja6m/RNGxPbbf/4smvUlchWD2yw86UJG5+z9Xmk/1+9aSHe/1oXrfLkIBwxUk2iMFXG1ZtaqK/1kk5pM8l4HGlC07NtTv0uc/mpqHBnMyxNRHvt/wUO3+OZ7dgPNH5A+nMXQudQ3GKRpJUYh8SVmNgzjhH0e6iZ9J4cBMyWcUQIjspoewRGakGGVTluZcooOwr2VWkyXVem1G/QI3B4fjxmhRnSThuyB5r8SCnA4pxVG9Q5x6VtLDhB89ceyavL+FioJVHJJORxtu+XiaYOVFWDaDTRaTluGZ6ACVACs7N1WKtUBCKey+2J6Wb5SSfQIL4wHyw84ZNK01Z6mUBeM+GdIkGLbFof8AIw1CJOW5FSL36tPBKZF3Pu+Q4J4OjYlngK6bqTOFOXKjxLsdhapOkw52wgSW3L9G3dgSQbBOvUpg4t64BmkO7eykgWSTBMVrX9VhSHKTbUPsC0pnXD2crv/2OKLaLSLIKYN9G0hMJSGEf9MkKpF0a8I52miQEMFoSbS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2619.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(5660300002)(8936002)(52536014)(86362001)(8676002)(83380400001)(6506007)(9686003)(53546011)(26005)(38100700002)(186003)(122000001)(38070700005)(7696005)(478600001)(110136005)(71200400001)(33656002)(55016003)(316002)(66446008)(41300700001)(66946007)(54906003)(76116006)(66476007)(66556008)(64756008)(4326008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4APnCqu8eT2qiP6k/wYo7upcxulc6HZ4kpWJEpA26hlZZuaX/EnOv+EfmJZU?=
 =?us-ascii?Q?R9NyppW2/P9z4pb3x6W1oNadDplvD4+t0UARFHdqfGpCiDvqXgUZbI7GBw0q?=
 =?us-ascii?Q?UVpW2GzJ3cB+x3V1AJvtBexFnF8L1Ylu5JNkIMpkTYOJ8aoXbbhVQp51QwKI?=
 =?us-ascii?Q?93QUXLsPgTO6n+Gch+KJbFvt/MhX1vCgNtiL23QGChB7vQWCO+Y1hryvp8N0?=
 =?us-ascii?Q?mOCV1+JMJtrwtS0BbbKSpbse84WujZCqaMmJ9TXmUf1Fo7AICRWdGmm9fiNc?=
 =?us-ascii?Q?M+N1eN5CoHSrfYXwQEmdo7Y9PamSNyUbZGRB9fiwcKV+h0IwJtY31z5NoAKv?=
 =?us-ascii?Q?icLMSGEfFg4IsOYDbxDOYY+N3b2KXk+rhlZOfbvHWd8TcOPMF4y5y8bgwgWE?=
 =?us-ascii?Q?Mb8cJUwnX2gTzhzmWucSqshGqXnqLmjJ3GareLZPRuuopUsiFfbQvd3W+Ip5?=
 =?us-ascii?Q?QC7Jqd2XufE5GUKv5g/E+hnddb0UyCXhb0jiHRNFUWXkq2h4uZ3dgHxpJtEz?=
 =?us-ascii?Q?J0AWoIFpVbU2oyVJFfd3NIpqlgijlDpot9EMNZarafh4IydTcokc/UnXvf7C?=
 =?us-ascii?Q?2MN2dteE9qo2z/jC+ORtbcEVa4ilyDQwe/SbDjIOKo+Jx1n44Ko+4yENbtzv?=
 =?us-ascii?Q?AyuJa3Kc3Ishe0R0sLmVTixaKDfi7I+WbFyPr84HjWXFjJSFziHhQUVKO98n?=
 =?us-ascii?Q?NAV89v0bFem6uQeAZznXiGiJ7uCtBrtZNJHfPTeaCUVWNJPIhPO57DKxxCmG?=
 =?us-ascii?Q?PRPdGkqeSb6UOrks/2wb15h+farkh1Y5Tyv4zV1msP3CccERSEHGsguz3jsh?=
 =?us-ascii?Q?4qMQXbZZ2DzgzpMmdd8sHsRT4qYzSsqEBG2b8gKQ2kFW8t+KHJuqFR+wIsSi?=
 =?us-ascii?Q?4F6kdxM2xXsvro4dT2XJ75PVxvJ4C5QdqVtUkRKfOgbVOu7+nD7OCfgPkW9h?=
 =?us-ascii?Q?VylYDyD2zWV9H7JNUYEDVXOEGnqMEfZfiQlY5Hghirc8aWcW0kvFxnWMx08E?=
 =?us-ascii?Q?lhY+VLtPccfe6v+l0E9M/B8grQ9dZ3bAVtWiw9cmrfcAcUoSWxkXJnsGahm7?=
 =?us-ascii?Q?tOPHBhdWyl1oQuTNpFYerkg3YWZ+fkbEsJ1pY3Vy7m7cwN/BUu6P+jxrnDf8?=
 =?us-ascii?Q?ETdHiIvyxnoFJSsyD9LY0RjDff2s2C24ZpYPwibU1kysXLwZHdBl6lqZaxeh?=
 =?us-ascii?Q?RWR7eDeK8ZwRSG77f3DfhmvnkSkv/umZblX98MtsqQHDV26RXcGF2hU9LDXc?=
 =?us-ascii?Q?j2VQ5DOrg15+ov1KtJ+wwVR+rdS1oFz7/Uud1QQhQgPt9edqpRr5DJA5ewI3?=
 =?us-ascii?Q?+1V/H9uNbOH5F7w0uf2Y2teXZblw3tEeUr6qTdK/2XhSEKyiG4SA3oe9DKEA?=
 =?us-ascii?Q?GA0QfNL+XcKDqVr9MWVCm98JAl5KMQIfuKNAnCk7KXGSc75pURwj5fNEGXgl?=
 =?us-ascii?Q?DiZocYrIzOi0RVkP5BzmXVJTRGP2fg1Y4P57M46mhprx5dG6non7Pc1g6f/J?=
 =?us-ascii?Q?EN/LkcIH4BOGsIjMZp1OXBZCaRm7Qo+Gsth5kCRa45qYbTcS7zQCHl73FBwS?=
 =?us-ascii?Q?R4AQuES9oOpH9uyOwxs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9476c1c-6393-4d79-f16a-08db56752c22
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 01:22:25.4193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0qnUwEJmI/yqMUsv+XxQ7XeMpVJpNWDgA6EJbTmpTFjo3iiSid3HxrGtFBrKQZv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4949
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[AMD Official Use Only - General]

Series is Reviewed-and-tested-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: Limonciello, Mario <Mario.Limonciello@amd.com>
> Sent: Wednesday, May 17, 2023 2:26 AM
> To: heikki.krogerus@linux.intel.com; rafael@kernel.org; ajayg@nvidia.com;
> andriy.shevchenko@linux.intel.com
> Cc: linux-i2c@vger.kernel.org; linux-pm@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-usb@vger.kernel.org; Quan, Evan
> <Evan.Quan@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; Goswami, Sanket
> <Sanket.Goswami@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>
> Subject: [PATCH 0/2] Adjust logic for power_supply_is_system_supplied()
>
> Some systems don't provide any ACPI power supplies, but drivers use the
> function power_supply_is_system_supplied() to make policy decisions.
>
> This logic works fine until a new device is added to the system that prov=
ides a
> UCSI power supply. This power supply doesn't power the system but the log=
ic
> assumes it does.
>
> This series adjusts the logic so that these power supplies are not consid=
ered
> when making these policy decisions.
>
> Mario Limonciello (2):
>   power: supply: Use the scope of power supplies to tell if power is
>     system supplied
>   usb: typec: ucsi: Don't create power supplies for dGPUs
>
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 13 ++++++++++++-
>  drivers/i2c/busses/i2c-nvidia-gpu.c        |  3 +++
>  drivers/power/supply/power_supply_core.c   |  8 ++++++--
>  drivers/usb/typec/ucsi/psy.c               | 14 ++++++++++++++
>  4 files changed, 35 insertions(+), 3 deletions(-)
>
> --
> 2.34.1

