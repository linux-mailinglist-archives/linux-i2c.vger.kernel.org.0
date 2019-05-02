Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA11123F0
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 23:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfEBVOu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 17:14:50 -0400
Received: from mail-eopbgr20083.outbound.protection.outlook.com ([40.107.2.83]:14588
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726030AbfEBVOu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 May 2019 17:14:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxMqPFVD5F1NVwXHQXY7T6Dor29b+UiLfTZduVllgCg=;
 b=HMFfqZ2dSMeB7XynS4K1pXEo8y1qJPPuUELSsAQVWjGqVpafVJG45vS0oEm7giTmOzlYk4a5Q5IosM/iyAXFxURXaNxZT2R6IqjBgel6eLLJCTeA75+uKe65Z0cf/Y4iDfoOIwrdbfCwN92rccUBKC6bsxVM+kaLyzLqCm761tI=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB6311.eurprd05.prod.outlook.com (20.179.5.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 2 May 2019 21:14:46 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56%2]) with mapi id 15.20.1856.008; Thu, 2 May 2019
 21:14:46 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        "minyard@acm.org" <minyard@acm.org>
CC:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Michael Shych <michaelsh@mellanox.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v4 0/1] Add support for IPMB driver
Thread-Topic: [PATCH v4 0/1] Add support for IPMB driver
Thread-Index: AQHU/35gob0SSpnmDUiPba8AHw4raaZVL7uggAL0uwCAABz5AIAADgcAgAAH90A=
Date:   Thu, 2 May 2019 21:14:46 +0000
Message-ID: <AM6PR05MB522465330E2C594B0309AE78A2340@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <cover.1556645340.git.Asmaa@mellanox.com>
 <AM6PR05MB5224FCACBD4EF55F3890EC6AA23A0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <VI1PR05MB62392EDC0FD3C960519C91ABDA340@VI1PR05MB6239.eurprd05.prod.outlook.com>
 <20190502194954.GJ6623@minyard.net>
 <VI1PR05MB6239E3C9B9BBBA226DCFDD12DA340@VI1PR05MB6239.eurprd05.prod.outlook.com>
In-Reply-To: <VI1PR05MB6239E3C9B9BBBA226DCFDD12DA340@VI1PR05MB6239.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [84.108.218.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a23a4258-c815-42fa-ac94-08d6cf433432
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR05MB6311;
x-ms-traffictypediagnostic: AM6PR05MB6311:
x-microsoft-antispam-prvs: <AM6PR05MB631106C797E903425913B877A2340@AM6PR05MB6311.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(376002)(366004)(39860400002)(189003)(199004)(66066001)(66946007)(66446008)(6116002)(3846002)(66476007)(52536014)(66556008)(73956011)(2906002)(33656002)(25786009)(5660300002)(4326008)(8676002)(64756008)(305945005)(76116006)(68736007)(8936002)(81156014)(11346002)(446003)(229853002)(476003)(81166006)(6436002)(86362001)(102836004)(26005)(6506007)(4744005)(486006)(186003)(7696005)(478600001)(316002)(76176011)(110136005)(14454004)(256004)(54906003)(99286004)(7736002)(9686003)(71190400001)(74316002)(71200400001)(53936002)(55016002)(6246003)(2501003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB6311;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3Ppx/RLi4my40WJ5skjXabGxQsBpM384DhjXSYEcvXATthvGSD7yHf+PUqWmXQkkI6Vsy/sSwz2AEr1oN54Ep8wK8mYS0A9aSEGTeWxPCgConSuJ1bcJ07KMB+oCFDkI15cFZO1N5qo8jN3mPFvkROwCF6Fpy+X4Tm4MepFuoAK2vQzwvEigmkO4PtpJoIFw2gimtcVGMwAHhol0KJ9a5oS/gUsqX3KW0d8kSsPq5r9Hyg0TSILTDoAu+12ykbj1Rd0FLHXp400HKCwx9z58A7m25kA052Jv//DHy1FQaO6atHeuz6RX4Z2YtlAyGZDp+16ztwQ0R0ZjKaAx4WHe5x1mavWUPpGsEVHtdq+V+12VjKtTJ1aouCW+Az9yyl9oXe+xzfsjfCD7sth7nCiyQnZCmsqL3ydrp/rD/TjPljw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23a4258-c815-42fa-ac94-08d6cf433432
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 21:14:46.4187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6311
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

 [...]
> >
> > >>Better, if you can avoid cast.
> > >>Would compiler warn if you use for example rol16(client->addr, 1) &
> GENMASK(7, 0); or something like it?
> > I thought it wouldn't be too much of an issue to use typecast here sinc=
e other
> existing ipmi drivers use typecasting: bt-bmc.c, kcs_bmc_aspeed.c,
> kcs_bmc_npcm7xx.c all use (u8) typecasting.
> > But if you really think it is worth it, I could do that.
> > I just think it is not as straight forward to read this code as using a=
 simple
> typecast. Some might wonder why a GENMASK is needed in this case.
> >

Hi Asmaa,

I will not insist in case it's OK with maintainers.

 [...]
