Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A419C6A058F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 11:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbjBWKEx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Feb 2023 05:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233345AbjBWKEq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 05:04:46 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE6F149A7;
        Thu, 23 Feb 2023 02:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEoNRP2ym4si/CAPMk4D59wJBY0noakZMY2bHM1Z6Yvdh5BBoQjx9JZH9DNm9ndJ1Y2KKyphVk+W14WXY4xDwNxgnKIfxoZTe18k252Udc2tI4+AACLlV9t7kM1Ahif3MN7g8jLa+Jfkl3QcAw2s2kHPuzoFEI+sOL8yv4SbxHr/FsWbOn8GHaHT8OAIIGOajE2fEyISjH9W2u0ULJntuE9IxVVraelJIr0mAzv+QkxdWMNvMB1x8fjQPemPyZHUY6vGxVZmU46PgkobfvDcBMl1SFTHa83zJtSetsDLeV1sZhIsx+lZwojsIgv0OCQuLa292AKJyCjl5l3eNPFnyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/eq0GTBaNKQiiRxCOAY63KemU/IiM0oGRKVZBwnANw=;
 b=HoF+5Xi1oR3nvEBOsVnZTF0bSk4iNTIowzOJC948MrR+0Qd7FY3tSo1G42yV2i68ixfzfLM8s1DAKf5YGqLzIX4yyX46ea9YVhvXIXHtZRawV5VEV042fSI80AxTEBZbTWQITXIlgGzgTDKnQLZoJv0+Ss/drTv3unxGJOzDlnIqupOLXgtS4ta6gXutUDU/QQvKnGzllrnJknV5CzS+W1N3bBYnbyxEbhoGtp5QXvZHb2/cE7cB/1MF61xMPVXatsJOGDgYMUpA9aQWM5+Ff2dqgmgrNTyMr8xqbnVTQquAvGum3TmR/qTequDbIG8krLsJHqEHHMucXjhiMhmWyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/eq0GTBaNKQiiRxCOAY63KemU/IiM0oGRKVZBwnANw=;
 b=Ia7R0lhA23n6jJAk1KjXRkHreKNROSYFuPRwcIkOl1aSzlXPC22s4+N82vAyNE/A1aNJnxF7wtZUI+1ow8eO36blJcQ34GwRyv14PPo91u+5pE1HYdiH8THsyPL2BpOkqmHbRuFFh9+ogMbg5fdBt4zE8Zj+p2N8I8fh6NvONNxN50B58PmoglCbdxDKHRXwi7AB6Za1mTQdjdxcMI28QBOuAOAqJc3YA2EtDqg806PPaxmQx9hewE+m1jFLWRoK3AAEdwNhpEUTb3kSrcY+xnJxMedbK4H2WEnp9z9pYgnIblMYhob17a5Nc3d3qK1+FmlF+6zBmgJYTci4DVoDjQ==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by SJ0PR12MB6903.namprd12.prod.outlook.com (2603:10b6:a03:485::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 10:04:43 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::7bb7:121f:4ffd:2f80]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::7bb7:121f:4ffd:2f80%7]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:04:43 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: tegra: Share same DMA channel for Rx and Tx
Thread-Topic: [PATCH v2] i2c: tegra: Share same DMA channel for Rx and Tx
Thread-Index: AQHZRqhoys7GDrpzlk6j6Sg5IxRKrK7cPgMAgAAO5xA=
Date:   Thu, 23 Feb 2023 10:04:43 +0000
Message-ID: <SJ1PR12MB63392512C6CE08D70FBBC7BEC0AB9@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20230222102759.23165-1-akhilrajeev@nvidia.com>
 <Y/cr1EKI7R6rtg+O@orome>
In-Reply-To: <Y/cr1EKI7R6rtg+O@orome>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|SJ0PR12MB6903:EE_
x-ms-office365-filtering-correlation-id: 76f18656-8727-4b88-8c25-08db1585628c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wcrydPmfb/4XSnKOC3FLYhnILxBDVcxGPcFEHS0T2LUem9p6Oe+30jT7PC5q9u3bhb/fZIJPuldKPsS4O2iUMJs82zbjqnT1fBiBqPZwGbWLpDoGxqRTzrFvWCWLaRaV1SOuQ7u0YjRbQjs0RqFq6jZgcU2pidlXbgiC0cWmSGDxX0df35ofr1JnXjKlsZ0dyPeop5wqLeQAN34qbOIXDGjaELh8gX8PxoHc96y3Drjbcr+vLnDRuFkLL10Ad5duMBAzNW1d9BKYqOBgdiXu9atyB9jSDsklcEm0ka8zcFD1O28SJIdIGb5b3Xgt/8qcSVVTZ5mcxr4yW9xZmu7g+l0GxXTOAu+qHV32u96KI/9OcdNhArVpIx2R6UUvlNdSAF1TSO/VldDi4wRKibPAVkEie+KqVSeM/LZE9m5oIWiIw2qNvajZPZUUx7/xe12zo3yyQe8Qr/StwGuDDxqQ7ijfdXdh23bwl0BHJPTGTqynkwSo2Zo1MPlJvP4MtRIvhhNessLkdACm8WVDs890Q+WL7krYeGF8yntKoVze6760t2DXllDCcop+NFm99FCfaEFC9fmOcdtZufY2Hq0XVT8bM4m8COh86N2beEgDD/N7ZgA1upJZidXY7rNBft9uZOoBoh249IE27/YOSFALhvfrZCU20JlcxaLQ947p5cSI0mgIgVorF/n1bM2enwq4Tqb4isJayzQg4kQUW4+p5Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199018)(41300700001)(8936002)(7416002)(71200400001)(86362001)(4326008)(76116006)(6916009)(66946007)(5660300002)(66556008)(66446008)(66476007)(52536014)(8676002)(64756008)(478600001)(2906002)(55016003)(316002)(83380400001)(7696005)(54906003)(33656002)(186003)(6506007)(9686003)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HtCUfLbeCXO6w+WyfbAkImDiqUaOQmVnndqfGVhSW9EmkWW/i+zOFedNU3U4?=
 =?us-ascii?Q?HwMBlrzA+7Hc4aFJAyEdhDD6aJGY7jwyUJX+3SNzwNeE+f1Jm/+1vZg4AjIu?=
 =?us-ascii?Q?mI8SBoWFot7g8sGI/y866EbNraESqBfAWxP7tWwkH8ljcPinq4Tp6gpIylLX?=
 =?us-ascii?Q?tB/PwYRfsCsrvI2lQUpf533mQDT0grETtJoLHbAiyUdm3tJqYKFkoW3ga8WG?=
 =?us-ascii?Q?NxyfPur8yrbShYRFptXtpY/IYbBMcDv4A/f6xFbKawzJviZyMlntYX8wLk+8?=
 =?us-ascii?Q?H7jsIaO5le5H2tNUsxn6/MomEYtTeTTt7+ISpdVCPMfNPXuyFeO7/Y0FTQy0?=
 =?us-ascii?Q?hvw5IY7DkuD+5QPt9hUiZT0Z9EimniOmh8MqzzSuHuIzWDjrwdjky90ITM1r?=
 =?us-ascii?Q?/lqJ0Znui4yC8w3FK6sAIy9i+wUAz0mzzLae1wd0/UM0p81rDuPgvUOaQSeE?=
 =?us-ascii?Q?dCWW76Hp9KDmu0IUQaADZRjqMXgke83zi8Y6aE1ZrmIk7Zpx7dNQs2ILeu66?=
 =?us-ascii?Q?GNpfl3U1eSYVb7Yj+cvOeYOA1IoyLqalOSnffcCyyn35L9NgRovsJml5EwLy?=
 =?us-ascii?Q?rjuuLjdbqrj7eNDzZnxZ4W6uBwPzmmHdxn9RtFJZTB6goX35vlrWD17MxINV?=
 =?us-ascii?Q?AFHEEovDgfyaru2KWfv6aNFDpreb2vPRJsouETXG6Tb0YkQ1XQXZ/Dd+JKPB?=
 =?us-ascii?Q?D7tuO8aVtmuQi0l6jMuMvPUcTDPfSKhXZnl33UEmHlds3qwlJUBIYLGE+gfS?=
 =?us-ascii?Q?BeC6brYkXdfsgFr8GjZm4RmnaqvHXDhKewmqLo+fZn2aA7cz1/Iwh9HqfJj7?=
 =?us-ascii?Q?mkY7hliMf36IxH+tHgUxlW7F4FaYmYTULP1pMDw8c02TCoi0s4U3NlgmeL77?=
 =?us-ascii?Q?OwnJvu+fOFxBndwN6qklNMvd2E+EhFrq3qcX5b4oDyjRTjJx12aCMbW5IWM5?=
 =?us-ascii?Q?pnrBhxxuHdiRMgsrZT7kC73ZwfUAFW5B97wIzjM4UykMgP1fyMY3sbc2WwP1?=
 =?us-ascii?Q?DfZY2RZNhgFzCqXRoL6AqnOzAOxoBYbRcefqhvoRgokStG+TDAJJbQyXleFq?=
 =?us-ascii?Q?15KOm6uvvqE6d1ds9u/20A1HRhDCKRDTknBKF6XkhUqRPcfX26Fo82O3ZhNi?=
 =?us-ascii?Q?YEhyLHilj6/jD2nsVoCt2u+yt04JQdn3bwoz022dGa6gPHNfk3XOy7ANzgBd?=
 =?us-ascii?Q?xR7WgC7nJ7W8SQeD+nKPS/18deC2ELW/mSQbKs1WkoZ8DYYkkNDwZYJF6DBC?=
 =?us-ascii?Q?9sah5WsfzJCPPTwj5H2LZdXaCRJ0UWRLUrrh+HMZjAaCSP7aWQAfXswxUt63?=
 =?us-ascii?Q?kWeGCnzZX1eINHIMKcim6mgJpEUch1SKXwAgHa1zMA2RZ+LBsWzFIfWsYxx5?=
 =?us-ascii?Q?O/Piq29OgRPJbdWOF1JEZFav/AWPssPAlmVmczL8MVk89gfMy8qy9OU7rOGz?=
 =?us-ascii?Q?flUUoWapGiJdk9/08t8c1W8EazuX2MngNSf0AG22FG3xUgMbqZquFxP60C3e?=
 =?us-ascii?Q?w1bWTZD/W5Iq05MtgE6CPpDFJjmbD0j2A8hPN1KIq0xOZDdWxAs318P6uWjV?=
 =?us-ascii?Q?AnLwuOt+Wqyx7wEEFaUFS8cJab0CHW0oNQuhA6AYoAlVWUmpqCJLize7z34P?=
 =?us-ascii?Q?+LDGtYDa2VfJGOzzUF7lrDuQzcRsm2cZWIBnTJuNyER3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f18656-8727-4b88-8c25-08db1585628c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 10:04:43.0643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aI6vr9vkX7JmNdwlKcIFrradk3l1hkLVRXQrfY96R1gZ8ubB4EDCVjQGx4lANGQedK8mQrNk4lSdXS7Sjk5hkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6903
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> > Allocate only one DMA channel for I2C and share it for both Tx and Rx.
> > Since I2C supports only half duplex, there is no impact on perf with
> > this.
> >
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> > v1->v2: Remove WARN_ON for DMA channel mismatch. There is only one
> > channel in use with this change.
> >
> >  drivers/i2c/busses/i2c-tegra.c | 54 ++++++++++------------------------
> >  1 file changed, 15 insertions(+), 39 deletions(-)
>=20
> I'm a little confused by this. All device trees already list the very
> same reference for both TX and RX DMA channels in the I2C nodes, so
> these channels are already effectively shared, aren't they?
The value given in DT refers to the slave-id of an I2C instance and not the=
=20
channel number. Each I2C instance was in-effect using two different DMA=20
channels with the same slave-id.
This change is to free up the extra DMA channel since both will not be
used simultaneously.=20

>=20
> So all this does is to get rid of the duplicated pointer? In practice,
> is the DMA channel pointer going to point to the exact same memory or
> are these separate objects that happen to point to the same hardware
> resource?
They are indeed separate hardware resource itself. As I described above,
two separate DMA channels were in use for each I2C instance.

>=20
> In either case, I think the commit message should clarify that. Also, a
> few minor nits below...

Agreed with the other comments.

Regards,
Akhil

