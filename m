Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8572C6C0272
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Mar 2023 15:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjCSOmv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Mar 2023 10:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjCSOmt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Mar 2023 10:42:49 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1F11C331;
        Sun, 19 Mar 2023 07:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679236966; x=1710772966;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+0vZWELmdgsqZF2g+czr9bcJtN8KHrAglJy0HkBAdX8=;
  b=SB8kCJRn7irxddhg32yOInKKFLlHplY827k8g2j4+AZp/8kejATmSLM+
   hSiJ73fF3QEYvi7HXu9s3Ejhtq5G+4BZE3mDsCxL4IoCjpvx2hqNjJzgJ
   SPnQeOWjtpU7ByL7pcjnhSzASKDdnk9N/hNEqZj1YYata0F1mlx+teBTQ
   phx0Q6+WBj6ggtjrw5+qKMx6rm2cj7CsDjdQj+6bx4uHGuUiqB6zg0kx6
   UW1wI5miTHdI9DmmQjnDOYA1kBxdzmT2S+G4IXHF6shBEd3CqLdvx2ze5
   LpFPg0c17RySP3rjVupGUdjqewSV7Nbur9ISl6vgBBXAA4f808weLDKkn
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,273,1673938800"; 
   d="scan'208";a="142797093"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Mar 2023 07:42:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 19 Mar 2023 07:42:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 19 Mar 2023 07:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntDqzEFQva96V87xijBaUsxPBrhKlAuSSqb6N98dyt5QhnIUr1jCAGdvFJe1uCpycnp2p41roITcX610FIii8QNsXwBMZ+zbzlcvvJZpjpfXDcCKifygyAZHYeRxTgIYoXx8JWGNicGJD7K1oZzi+/oO3qsy5Iuds1t1nm06yd1CwpH5vGFrggkhATg/SzD4aAEyJOYVKX+qrmd1OICGY/mH3MA6DzC4YvH9ZywMJL9MXAvY9f6MnV+aJwhdbdqZ92hyA/YR3clLL0aDEFafXki6mIeHAweYdYWLrOcE0ndkNrwFWjac7rT0ZPTr81ZhPKgP5NUxfGCezj1IekNHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0vZWELmdgsqZF2g+czr9bcJtN8KHrAglJy0HkBAdX8=;
 b=RF5hmRkCt5/2+t8Kk2iG1TQt5zHHo8wnT9giCbezWTBliX12iZ/eP+vTarv3QOcE1pUJ7vD0KxPynPcNF2Nqx4BRl6mXL6ifmOxUk+hmE+ctpmSXXGk/SGfjDlnM+KiAWAtxTwoArOBb1bvgISb/63azWWhoX9pnR/vIZ3LhWQAcRqJyfThef9hmZbB63zWYKXVqfhfnE9Vi9hw46F6LiV/uGC5YAhecdxHrLS2ZwacD+W3LjH2SOLMBILRDSFSKXV5rCzcrJbDAlUA97KGCXkTnJ311aVdiWoNnjJInVOCkqKc2cLBsLdaxogiiVtVzZO1XWPv28yezZ3tzIfJd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0vZWELmdgsqZF2g+czr9bcJtN8KHrAglJy0HkBAdX8=;
 b=bKhXv/tP1r/jijx75BX9vGubmbgGP9fQfwC0kbarAggJTRP7w5zUshaIjhOODjRSde3gTmEk71v+bkOWKPe2RHl2r5TX1umERYS/InNCY1MjagzV5JHF57veUVvPpLXqA0tos8MTG/gX+8VRrlNY28cWsL7ZC+P3YRDLtploj5U=
Received: from PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22)
 by SN7PR11MB8044.namprd11.prod.outlook.com (2603:10b6:806:2ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Sun, 19 Mar
 2023 14:42:37 +0000
Received: from PH7PR11MB5958.namprd11.prod.outlook.com
 ([fe80::3955:3a7f:9826:3670]) by PH7PR11MB5958.namprd11.prod.outlook.com
 ([fe80::3955:3a7f:9826:3670%5]) with mapi id 15.20.6178.024; Sun, 19 Mar 2023
 14:42:37 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andriy.shevchenko@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wsa@kernel.org>, <UNGLinuxDriver@microchip.com>
Subject: RE: [PATCH i2c-master] i2c: microchip: pci1xxxx: Update Timing
 registers
Thread-Topic: [PATCH i2c-master] i2c: microchip: pci1xxxx: Update Timing
 registers
Thread-Index: AQHZV7gIF7SwxX3lvUGhNwxPrs1Tr679QZaAgATwwxA=
Date:   Sun, 19 Mar 2023 14:42:37 +0000
Message-ID: <PH7PR11MB5958DE8BDC2B824B4961379A9B839@PH7PR11MB5958.namprd11.prod.outlook.com>
References: <20230316033223.2046359-1-tharunkumar.pasumarthi@microchip.com>
 <ZBL6JWXKCLsLyNzn@smile.fi.intel.com>
In-Reply-To: <ZBL6JWXKCLsLyNzn@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5958:EE_|SN7PR11MB8044:EE_
x-ms-office365-filtering-correlation-id: 98453d05-4ec7-4ef1-867a-08db28882efc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NcpLJM4SLVVD6+eBruPi7EfXaHW6kd8ogPEoOySHg7i0IR1BtTvpV2nzwJLyPNYrX4WTv3beA/hUavaZPzfMrnX6+xyjyj0NsFNi9mjc9VGtunTJtTO7RE1eTOtjyQ8w+SZImimOFYZu0P9UUpeE6nz0mxrqMHiJAwCDt9uZC0O2yyMh9B2IOD66CuEOEkfrC/FJn2vFAZfRI8R4P7pd9dtKC3WDi10gdIYtqh82YJ4+U6AcX7fE4lnEuu8dAMXjeVgYO6t7oUW7mgj2x2rDjuCz6OtIMJbgaX8Dsxl/TGv2a1nUutfloqmi94GffVrx5+dvK2zJIID7McP3TO6jG9Mxcf8YbRsuVAzOxdwtJzeXG6nQeDXUhC1gGlKMS7mKl9vr6dkekWnCBMmKkIZe/s7uvR+WFwASA4wXk9A3cU3+CflpZr+/f0gMtsBpKX2uIjKeJ8brsder+AzM6b3ItBj90WHHzV5IRkMTaZQwfstL2UIo7NYYPIBCOPQPX9gR9Ln2t6rfR82ba/SKzep/I8OINHz6blrVhFKqqcTfJpNc/hZ6hV1uSjRvYJUzVM85yt4rWADncL8PN+EsSTiys8u1X/Ljd3xQJ6bMoZo1uewziZrMGNDhqcqFjpTUOh34rJkhdz76LCTXzumVp30/KKbHplkUICaWQY9JIUaILlQ/6lyuqJImJKCwNjtaJqL4vuYSU/a/ram3e+RjthHHX0KdfFqppQtzSDBl8haPkJY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(136003)(396003)(39850400004)(376002)(451199018)(7696005)(86362001)(55016003)(33656002)(71200400001)(83380400001)(316002)(8676002)(64756008)(6916009)(4326008)(66476007)(66556008)(66446008)(66946007)(478600001)(54906003)(186003)(9686003)(26005)(53546011)(6506007)(107886003)(76116006)(38100700002)(38070700005)(8936002)(52536014)(4744005)(5660300002)(41300700001)(122000001)(2906002)(15650500001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z01aELrt7/neV9osq3xJKcorZ9CbK1W+2s7hDC7uQsQEzCRr4zsrUAauQfwG?=
 =?us-ascii?Q?Q1FIkPltqB6TXgtajxOYW0XHbcyHvugDmFKE9PpSFW1wQWf8br1WLuryaBRX?=
 =?us-ascii?Q?aJak9MEr2C/M62e2r6SAv6tVJYwRA0Np1e9PNOiQlzbozLiyFgKcblFDC1gF?=
 =?us-ascii?Q?zC3p273O4QhFtJkSwdZhJnd5CJiQrS4F8WyiedO/TK4Y+YtbtArO7b5psDCG?=
 =?us-ascii?Q?YvPa7sKKpAV4AnmFcIO9Iqh8e2xMizJX+LDb74gISXIkFL06amwzSyWc/dgQ?=
 =?us-ascii?Q?diPTGJ36yYi4sYW8ism+zeAejcwIdjOOHQKf4wImr+9KxYkSLjuli5y+RDAv?=
 =?us-ascii?Q?cmcUxNK29krHsJti13zIAAoO8tIlybqMAQgwxwnAUbLyovAtHa/shcuPblQQ?=
 =?us-ascii?Q?oFKSJYaMN+1/BMKaaSIoImpp8Rjo1OlsNLDsgFlaf7LRm9A0k8nxhqkW1kCI?=
 =?us-ascii?Q?ewLgZ3o1n6gXO+fL0PlACdZ5avqENrX/1ALQJllIuaCvs7ohFrwAc0SJ+cB8?=
 =?us-ascii?Q?T75cZ+OQ1Svn0U+GnPX+1+PiL9erUJLhlOl//KzwvgElMqlyGwusiLiQK5iY?=
 =?us-ascii?Q?n6gwnE4zKF7DMPGQD+vYlqQSkDwmlnSF9C98IQukLYloY51suazVdkA4tug7?=
 =?us-ascii?Q?GcPNcDsz4kWE2JxxKL0hgIke6wLXcWiWewJF8BFH4EIrhrSm/dt2uerofNgu?=
 =?us-ascii?Q?SLAJKeqCfQ6JESNOuXeMhMLxhX+zA/VTR9+jujwdQ6TvHnzby7tFPaAoKUVH?=
 =?us-ascii?Q?pTAgEjXg2ZI8jJz16aX+aFj+EGfasPYn978ZYB/v7vuku+AYrkNp6R70erJA?=
 =?us-ascii?Q?6wnHgNKjjTOCW/fZ5W0eunohG2xkCuFVJtPVKpaA36Tv6hX8cMyr6tss1Nhl?=
 =?us-ascii?Q?T3XX5NUssN9Y1UN4cdeSLvHl2F/J0GefSyyK0Xo5HPi9AloFN8DEPAPk2sfo?=
 =?us-ascii?Q?0HNAM7DFWb/5ItiUPsxMXYNty7AcOp+DCPeJY65cTCAbCNX0MnJ3gL1fCg3A?=
 =?us-ascii?Q?ZjmwLFRjlHE6TNOVe0mjzOBPiLOG9a4H10q0k2F+qfvdmS/khA+eoB8lNe4e?=
 =?us-ascii?Q?7Iu+g1DyQdAoz3bnTkJ8/5aUA1jE7oGS+m3o7mYcYlG8XiXTsv0xdbFTyla6?=
 =?us-ascii?Q?1NzV+bBDxONSrJbcGsqF5jD40gVwt7LXsySFmckpcUFDRZG+oxJJ1MfAAJcM?=
 =?us-ascii?Q?AaDG+LNTCOxkAIMsPx3PjoMbFV/MCXFduOzavNnyNZYl8WekYi6qDRwvSM8T?=
 =?us-ascii?Q?BvaRBDTVdGEK/8mZ2IqaZRYo8XoTpF5ppv7+7TJs5jzkjjgJeky6cx7C1u0z?=
 =?us-ascii?Q?p98aQZVHnszkhI55gY/EO9yv8tNjxO9+fX8vVtXUb/FWojt1jpae//HPOC4V?=
 =?us-ascii?Q?Yj8U+CLE7fxsk6x9s5TDvWEkms694pXly/X295nBLdduBqL3/W18Bib3OpvG?=
 =?us-ascii?Q?LWWjzKoHEG5/G0c6zXAHsAgOvNWjdrZnDxmhN2sWxAutSjjIOGg8YZ11eJNX?=
 =?us-ascii?Q?ziyAzuKm+7pDbd9kqeVYoFuPwbWRoTidIE0kRoXseJ+3pDhSht2ql569gWlZ?=
 =?us-ascii?Q?edWkTfHMgznmgyJYCXaBoKjdDY9xe0CzJIZOtshQLbS7MLl7I6fjILSGJPsf?=
 =?us-ascii?Q?Oof99cmQTS52hfIEz0cFkDw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98453d05-4ec7-4ef1-867a-08db28882efc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2023 14:42:37.1396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RJEQ5tQDadFR6PMlRXP1QuBMQM8l1m47Ow1SXZm0pp5xJRDcFD6FVvpIncjs3T2+jyewnPLt3FAbAlrbuMzWSYoincdV30xL6dzorOkyNdLj739MjhwPMLiDqvmYIMyy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8044
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Thursday, March 16, 2023 4:45 PM
> To: Tharunkumar Pasumarthi - I67821
> <Tharunkumar.Pasumarthi@microchip.com>
>=20
> On Thu, Mar 16, 2023 at 09:02:23AM +0530, Tharun Kumar P wrote:
> > Update I2C timing registers based on latest hardware design.
>=20
> What about older designs?

Older design is updated due to a bug. No future changes are expected in the=
 timing registers going forward.

Thanks,
Tharun Kumar P
