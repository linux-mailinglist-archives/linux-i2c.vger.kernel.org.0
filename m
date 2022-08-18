Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90A4C598E07
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 22:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242841AbiHRUaS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 16:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242763AbiHRUaQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 16:30:16 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2046.outbound.protection.outlook.com [40.107.96.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DABC0E6D;
        Thu, 18 Aug 2022 13:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YotPFSGtAPmdOyoAxltBmmE2JT1EGYj8hO52i8c0dFou+yEY7NhyfYpHnqDybbUtYHYug9c7kxLNwiWm0QeAfmXIRX3zIfgEL/7A0MXImDgA6dgpRWIw+vlBNUBSgUUMGzDF959mDlAbuRRQnFyHVS4hOpmQTRCEnCUaaD+kRi2H8ZacEPdRVxUUigQK0qMi2A5lG2aoWqhmFKFmDFYPmPMEoVI6s/vgpCtFfJNfXVTvPbaySg/4NVK2TBUxrDM6V7ba8iAZp/reBjEpbouuGVFCIp3Ggxu2ki+Hb+T7TnKbpM1NOi2t0B1KukFgKf41Sj/DnM3/elAL4mKYlXn+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrS+GEwnlWFjamYhevvYRnYIljyDxjpL0uTmBC2tkEQ=;
 b=X5DvHiY94iipnWQRcZd8MDSzXsP7GOHj5UaeURdQDXUoUpM7BoAIqWcMwaWUeAv1zmhlWRFtuigyRZ7pZ63g1VPHW818jfW5eCYvc9CwscvLPb3L1kTZSouSA5siqkQOJvdCTSDOWYMYQd44LUkgm1EMJ15/YLuyuXyjIa17fsJT3C1JghBCyLA7KkebicN0IlhwrAH7f5awZs6IksFlwGvT6seqrLGVPXC2vJW2Jto2g6H8mGBr3Ejmh/rAK5h2y2kGXy6jWeBU2F+PxusTI+j+dMV2dcW7PK6sQIbqs+N6SpgY3SyO0vyWfpd0JCclzLNM/oa2HbAcUAfCTRGbVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrS+GEwnlWFjamYhevvYRnYIljyDxjpL0uTmBC2tkEQ=;
 b=b1hxTkFRSnqQZ2cLz1y+XQ650qaHkXXnp1Y8M3NgqosaSAUVGb14t/67XTByrl4Y7O3nyYd1XXtLMdx9/eK79flbGq2Dw/bYqmI3Zse137jFYhY9yEHy1vP1uP0W3k7RO7uxCCv/LOVTt2AuIKZpOPmruxEWTpAwyOUHZhSm0+bns0xCvWZGpeRpkMbzzIt0uywOz9HlfKDAaPPLBuNBDfQvLMJ36hN1hkh5OGBwYidAcSeEZeh764tO0QVU+OSUXvUEtOo+J/Clyf3kQl2L3gDymBIrHRv9cX+7tDOD37nHfv98ZoXdsglzLBkIg3JdbZPdhB3LINwkSFB8+Si66g==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by MWHPR12MB1485.namprd12.prod.outlook.com (2603:10b6:301:4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 20:30:13 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11%7]) with mapi id 15.20.5525.017; Thu, 18 Aug 2022
 20:30:13 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed during
 io write
Thread-Topic: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed during
 io write
Thread-Index: AQHYscMo59o17RgFDU6O7GkYAYNjea2020kAgAADfQCAAAo+MIAANHyAgAABldA=
Date:   Thu, 18 Aug 2022 20:30:13 +0000
Message-ID: <CH2PR12MB38958540981FE6BC85E96178D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220816225412.9095-1-asmaa@nvidia.com>
 <20220816225412.9095-5-asmaa@nvidia.com>
 <20220818162728.lnq5y7qzxbdsyexr@the-dreams.de>
 <CH2PR12MB38951132E24E6F1EDCCD18C6D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
 <CH2PR12MB3895EBE43CB5B23F4E4ECA65D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
 <Yv6f+zR9qk5vLOmI@shikoro>
In-Reply-To: <Yv6f+zR9qk5vLOmI@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15c5c105-cdd8-4f04-b2a5-08da81587480
x-ms-traffictypediagnostic: MWHPR12MB1485:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U/FaAMvPZaLtCqSxM3b3+RpAuahgZkxU3+UAkB8bM/XoqSthn28VH+TDtCTbY+TX8vWTkewxKUfu5/tWVFv8q0ydGErdYs7M84PBKD2a0huqx4fhGILjJk3GDx0j+OXMPZ8BaCQcwq6HBAeZzFRgrCyD2Rlya3wv0KgaNynU0vtOCh3WTP3481uv78ZK9O32eug30ZN/VyB360gqDjXmzd8oPpgVyd8NcjoTN2IqeOJC8Yhy/ikJXQMiTN/7/w6gJmoTpuQbKim6CD5i2++tB/VGdhmKwSQOazzeB8dfSPDqYgoA44QT0r+DSKrpRJPMc1h1ptvvjLOBfY+AAch+3HLuXC1I4M8svJQrMC76hTG9EuD9U6aV9wopdKFzq6dpgVTC/HPGjIE/NySh5Pi4959iBwDddx0t0lpNlswBl4RRuz/52Kp3pqpAgaq0/oQlKPLaagyg3x0XvhsTeZzSRewesXsNfvfxqIJItu2mM9oHrtVrAZBDo2cHP1IihNedlyq7xdLitFEKxSIL1Tyjzg++1CPqCN67HNDSWlwuRyWrddHLbbNaIbsPhEkLwzuFvqKhaEPoQbOcI6TrsBUGCRtQrGjo1evKx4NOj2bl6Rz34EJ3svmPaUrpcPfz+MdvGVwsJdOekQPNupCYXGRdiuc/ewmqikwfjX425fYEv8ugyJ/X5qOooulstHE+lo+YsCkGMzRXruI+ERqUX2SS/96m63grWQlyd9AJEV2wK/UdZi2HMjwWmEAEeziZ6nA0w5Lq4wFr+NtENUzjXcYw9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(6916009)(186003)(54906003)(316002)(83380400001)(71200400001)(55016003)(122000001)(38100700002)(9686003)(6506007)(7696005)(76116006)(38070700005)(8676002)(64756008)(4326008)(66446008)(66946007)(53546011)(66476007)(66556008)(2906002)(33656002)(41300700001)(26005)(478600001)(86362001)(107886003)(8936002)(5660300002)(52536014)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?brVfEMrKZjjwEPqR/VPvE4FGkd8Z32fWhQc/Xuz7v9ox9+LW2t+lcsJLxd3S?=
 =?us-ascii?Q?r6fcgnvb2RrrxamEpZQ4qwk6Ce7p+ZE1qwne5Z+aF0iGZg8f+hGYsPn0zBAa?=
 =?us-ascii?Q?aKK235GsLq9bma237GSPzCwKU0+borvNgXMhUVvnXyaw95l+lJOUspqTff6N?=
 =?us-ascii?Q?0b4OnvearR8J2sItS39+yGcI5I5sN5E4pcEJw19p88dr7XkaV1txRrwBHbyb?=
 =?us-ascii?Q?5rNPN6EyB0MfDZJWc8TfeZ+dzGpo4KK8M11mAdPFojGJs1Sv8r5XqUIDyKsL?=
 =?us-ascii?Q?x0lhp50Vwx3vyapM4D+JlH2bOpQGp76c1ikmYG9sVbUTYCHlHHwZoNsds8vC?=
 =?us-ascii?Q?d4o+frjgMArcHEPG6Tdd8V7UH4PtaXYU1H8ygJSEyOQEC1SxUbdPOgn4e+cQ?=
 =?us-ascii?Q?7PlAjmS5ANkhAdn9sxPFnhrSKiqdPBm2m4grhz+o4WJtqC8JMl4FhOfD3h4G?=
 =?us-ascii?Q?Rs9fR55Se8WLWJBMH58G46qq9MjF55Ysrr3yBQHRqwjrBpuWAZZiLdhjvpTL?=
 =?us-ascii?Q?DLruGJKXr6wHYmchs7XzufiI2aad03S2sG6tO+YgV/okmg6umjZIYczj9o/f?=
 =?us-ascii?Q?9NMmzP7Is4MezeLnbHXXQwYX0RrpYpIZWMtOX4JppRzaEh/JRTD86XQhbt+3?=
 =?us-ascii?Q?wnyaMweNgVUb6KyUeg7oz5jizuDda8dba1+fiSgSZ7fbxnlErqaUCMVw710V?=
 =?us-ascii?Q?e9qWo6akgqpMEtTyj3YEgPd7KUQjvG2eSq8RBUuAfzh6FnLO8JNOoLf3gNsO?=
 =?us-ascii?Q?eIcxjkQVg+BSRfigG207FmgoNdQ0xeIUt7f62bupphQdtUukDjkBLK7r4emO?=
 =?us-ascii?Q?M78h++ko9L1VP3zfG5WGBkd4SalK4DMzeQ5R4EJvp0HMzHz0pfhN+RuM5c6W?=
 =?us-ascii?Q?/3Wz+e40vMvLr1q2hGkJ6jbfbqXOMSbKQMS3wPq30BespaUrWgCtDYoOxUn+?=
 =?us-ascii?Q?VdvqkdXNXoGMsskPm7bBLneubyTKNoI9N+v/B/dnZvsvzIOgkdXAn6s6qxGj?=
 =?us-ascii?Q?9zNsrF7wSU0VUzJ+vdT6RObczuw5cyGsLPmG11YCS8HRnTIFARWdiHwIdP9A?=
 =?us-ascii?Q?Jj/xM1woD7MdvxODs9ApqvoSiZx/QATf7T/8wEwwsKtW04ciD99juuce+pmR?=
 =?us-ascii?Q?OUTT2vC4QwgM0/mLrKh0OVBaa7kKITSOasuONEpBZTmIbT0gN5LYochHf4n5?=
 =?us-ascii?Q?HuQpcK7g+woKut18F7f9+l/IDPHFzv7iOseBKUFG7dQ68Q3ifzEuU9VQTc2V?=
 =?us-ascii?Q?QC5le3gvnZgGzUnZn+9L9jHn3ctE2rOOjGMbfUMjbWJGWe5cb968W36hub/e?=
 =?us-ascii?Q?bliOTjlFFWDx1r/yfRJoBZrSp3OB2hbnaaN/C/BNWtnmEhN75sCBHN2Kv/db?=
 =?us-ascii?Q?Ue51mAvdiaqX7fWD/r2y4bU99n+D46unmO/+8Hw6CsjDnGLm+TkQz954AmXY?=
 =?us-ascii?Q?Nkhqq4cBXe5Z5h9dXLg63Dq/y1mcUlN3xW4l9grUuUgwrg0G1kzCLL0hHoKz?=
 =?us-ascii?Q?jxmvfDNCT0eo+d0YagPjHdYd/aoularoSclhRc9mfWQkvTxLCU3i0QyDk0bY?=
 =?us-ascii?Q?sHk5cHMPbwHizw2NbHE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c5c105-cdd8-4f04-b2a5-08da81587480
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 20:30:13.7418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BYlpkcrixOq4tODU3kFZOL+jEgjkwVeMWLS8EcGUo91RvaNSBXcsIMyYW+AH+fe/cKIyPVnoGk0fazMi8d0MAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1485
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

Sure!

-----Original Message-----
From: Wolfram Sang <wsa@kernel.org>=20
Sent: Thursday, August 18, 2022 4:24 PM
To: Asmaa Mnebhi <asmaa@nvidia.com>
Cc: linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org; Khalil Blaiech=
 <kblaiech@nvidia.com>
Subject: Re: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed duri=
ng io write


Thanks for the heads up.

> didn't have any impact on the overall functionality of the read/write tra=
nsactions. Writing to smbus->io + 0x18 (aka  MLXBF_I2C_CAUSE_OR_CLEAR) corr=
esponds to sc_low_timeout register which sets the timeout value before a re=
ad/write transaction aborts.=20

I understand. Could we have the above sentences (or something similar) in t=
he commit message then?

