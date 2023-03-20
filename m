Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187BA6C125C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 13:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbjCTMxd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 08:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjCTMxC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 08:53:02 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E956144BF;
        Mon, 20 Mar 2023 05:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679316715; x=1710852715;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y7Vv6cczqTKq1AG0WRgnhYt4v8tZ/AmDb4WJJVCM8Og=;
  b=18EPgElWiz+yeEdwuBD2J9m61XKYiuRq5MdSGoXFH+iL6kF1iq8BHajS
   tib+JISN9azJpo/WJTqvYSbS1oFGEnQFGj9epw6kaTnM19Ij3zM1oYtTz
   KlsL7lSRAv8xW0rnY3qifdhYowTeFuEEetr9/N++ZeLrpXvI9vwYl7u5+
   McSq/T6m506+uMMztrVlS+C8CYq1e+RT9SqgMctYbAY1KbZRo1krs78hp
   PwC7r6bk/u/h4TdAgWWhGXxVpTfICVxsufcyz9eBSuVe+4cdDIz7fu5OY
   c2ci4qUmSMR/kAEYEeHq7U9k87P6WqIP/bBKZ/PcKi7mXumSgIvr56FBZ
   w==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="scan'208";a="205514744"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 05:51:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 05:51:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 05:51:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSKZ7czLVVDAEOaWR/Snvo8yhF9Plc7O4oZM637Fl3YEB+fZuo7NWm83auIjNxO+OCmV6DWrJN5wtbz5hnct2v9/gkUcjXxlcYtgbw9DdaM7tTfbS2QCgKPqQSkxR9d8z4DA9OgIWMFa5szvMUxuuK7fykyLk8m28g0VKpGMTB4yFQAuNzHqmSwFYtJZk4oca7nCJhcBj1OO2vp0+s8zAZgUDXF3Kiopa5qpBXtWrJwLrA/iRTj0Pq/JOzh1ukzoqxzpD2IOgCfd4hNdjg6UhIqIrduBVaZyn5cCKk3611LM6zkJWmWAMwvStO3kmHnoImDlOhELVQMSXph4bb3NDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7Vv6cczqTKq1AG0WRgnhYt4v8tZ/AmDb4WJJVCM8Og=;
 b=WUBRXdogBiMlVYxbJyTU0Q8QcLDAP5kq07Rkc3dhE41iy6VYCP+fV8UgtatObZgpALN778wfAXa/JIgcuuq9V24YTbTAHTurwEk9LbO43cwpFe5VlvxOYoZdHNcGisjHJEMzKfmpGsxsRRpMgfGJEoqYGqDpm3uxG8/A/Q9wKkU3lCSl+jjxlZJ2LWMVAz2oJp9jhBaW/na6/8EGfa2+WhhmHhCTZ2fmInms3y8Uvmu93xFc2SVXXfN3sY33X6A1hGlZ3iqVHEAbjiPCB/dDw81xTExJ99KVCDBKmcS6YRCMKCo3XNuxldoOdaJCD6oFJO4py5b1Ca/Hw2ASswz52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7Vv6cczqTKq1AG0WRgnhYt4v8tZ/AmDb4WJJVCM8Og=;
 b=NIGC+m95/SsPO9d1WSOQFI0LPe5YeY6qXponimQQ00GrKp+OxAshHdiAu+7jXdb/G5vKE/j1cgdtnvLAq4csM/u2HerdmZ0q4DKmPEbVpYQyZPhFeNgI/15vX8ZwJYM2GPob4xsFnwLpHoPfNIMos3LP49v0WtpPMx3Iy40NtGk=
Received: from PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22)
 by DM4PR11MB5376.namprd11.prod.outlook.com (2603:10b6:5:397::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 12:51:52 +0000
Received: from PH7PR11MB5958.namprd11.prod.outlook.com
 ([fe80::3955:3a7f:9826:3670]) by PH7PR11MB5958.namprd11.prod.outlook.com
 ([fe80::3955:3a7f:9826:3670%6]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 12:51:52 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andriy.shevchenko@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wsa@kernel.org>, <UNGLinuxDriver@microchip.com>
Subject: RE: [PATCH i2c-master] i2c: microchip: pci1xxxx: Update Timing
 registers
Thread-Topic: [PATCH i2c-master] i2c: microchip: pci1xxxx: Update Timing
 registers
Thread-Index: AQHZV7gIF7SwxX3lvUGhNwxPrs1Tr679QZaAgATwwxCAAW+qAIAAA00w
Date:   Mon, 20 Mar 2023 12:51:52 +0000
Message-ID: <PH7PR11MB59586377E72FCFBE34655FE39B809@PH7PR11MB5958.namprd11.prod.outlook.com>
References: <20230316033223.2046359-1-tharunkumar.pasumarthi@microchip.com>
 <ZBL6JWXKCLsLyNzn@smile.fi.intel.com>
 <PH7PR11MB5958DE8BDC2B824B4961379A9B839@PH7PR11MB5958.namprd11.prod.outlook.com>
 <ZBhThvAm8yAEbNtS@smile.fi.intel.com>
In-Reply-To: <ZBhThvAm8yAEbNtS@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5958:EE_|DM4PR11MB5376:EE_
x-ms-office365-filtering-correlation-id: 2214b1f5-5d55-4f4d-bc6a-08db2941e0de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iHwRw7m/mm0sWdJsdXC0ZEi5p9x9VK59lITF+gndVWNJu857Rj4Ws1IHOFkSLk6FSsA6L0nQHC3XZLQFeFsumaQCR0FbGBackvLZppbYOU7GFx3r332JOnI/1w3ZV4ffNIdMTohC6ECDKv/ss2ZiPgrVdauYY0kndVaDRRl7Vm2vx0YZ3eKB5gdQ2JDDVIsYCAtzMV/BBViZ8fAYZJOePlNTzniGAC4zfpOf/Wo68kyHbWMDe8nsMEWvwXAMVYAKLw1wed6Kr744VKfe8xsOzGw6keohqI3V552BBowslu2g3kXFtR4l7IO+n/ZdlcN1W6t3fdiQiOd/e0Et/nWbdWrV8q3PHnYFMawLxz5iAwjZsMlkauJi2NXrflkY4Vl5PntikWIp9G37Z/ClWG4SKJEQRT/MmYjuvvqv1R3rroYJvKNiG1mEow95fTd5npcfuJtq9XA72RkOn7ZNwhUJ4rT8pVJAVVVqHwqrnqU7+DtHOMJNzPBOeoR4jHevQqaEZbyn5eLtSj+pOn9uwPyg5bvfLmqcVJqmbf01lprVvki1aodFvTV7Q2g/LIp5Iy6Knqz9K42OneUYoIoOkFqVhTGTn5hS6z2QzLDE1J5ArJsrOg5ETzHJQk1rHEFzrdt5PFKiWZDfeb7H9ShvnnCvu+NPmLHiItJOBvrfmQ5myyHDbkIEZ5vaOMpjY52Pk/Ejlyc+hANGAXJUXmq0zYSe8kRrMaVW3bFNq80V6VoGmqU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5958.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199018)(64756008)(4326008)(66446008)(6916009)(66476007)(66556008)(2906002)(52536014)(8936002)(76116006)(66946007)(4744005)(15650500001)(8676002)(5660300002)(86362001)(33656002)(38070700005)(122000001)(38100700002)(41300700001)(26005)(6506007)(9686003)(53546011)(107886003)(71200400001)(54906003)(7696005)(316002)(55016003)(478600001)(83380400001)(186003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Y2EGatA/NAcSJVKiLEVhV04HwhM+UpSsgg4oDt3JlLa06fehp7wHU2+5hh?=
 =?iso-8859-1?Q?D91wb9VX2uAyTZEEyH0TYNsxsKZAhSZIzEwqtDZz7j6ps6me8B07uRxlmR?=
 =?iso-8859-1?Q?o0yj8Qa3DvDLmyt3cEfyKR7DmaSPnI0mYBVch0n0i4Zl2F3Zn5JajOM7rA?=
 =?iso-8859-1?Q?XClf1gvPg6HjR3TDNU8SC6RIuPInacVxhgDL0P1lLZp1Ipo7tvQ5yNHpWT?=
 =?iso-8859-1?Q?VZiqqzKRR4SBeGuEecHGsEqkYT+5g4NKrgcUkyt1wZ6NED7Jyc58T+Bduh?=
 =?iso-8859-1?Q?jSBzfU0G9cI6D7KpDtquLw5FTlTJqNX2pNGtey4u5tzdlyjLkRRcdRZweO?=
 =?iso-8859-1?Q?m7ZPEw3y5LOLZ46tIHpo+qMuBCj537zwkqYnKoV7ltLa80YuariaoVFpF3?=
 =?iso-8859-1?Q?Xt1m5i1Z8KpfWHI4HOhE/CTKYzjF1E8vNAuYrnADW2+Ol0ljXKuDedx4FP?=
 =?iso-8859-1?Q?AYji21JIJkzizuN5fn7lXB0t5HeeOg79dwRLwmHR01wR2Ky19DoKoJTiT7?=
 =?iso-8859-1?Q?/ugvGYhOJ3IbdJT4dP+EQkpaMuDIU9hokgvsTBVcCy6eBUQwGMHnGLe65l?=
 =?iso-8859-1?Q?Gi7QlNzOBNSFlWYbgofJgXJFCBauLFST7MjuG7SQTkS1CynPHFkYW2c/ci?=
 =?iso-8859-1?Q?x4fEX74TKSMyM4XaTh3dSSZsEKpXEkE9x9jO3zdidHuuGam/w8oTWI2eFJ?=
 =?iso-8859-1?Q?yoleKsUhzJx/lUCpyloFSMDr6ba2aEf9p/tz2PKNAtt+A0CvWC5CY2QFo0?=
 =?iso-8859-1?Q?Pl2EsrKy+rzzQXJs2th4qD4zppxSz/dLOhhaYA9yO/WqkJhGWaW2SXo/ma?=
 =?iso-8859-1?Q?CGE2B0Weo8gW0eqhp2LX+ufykRAp7j1exCF4fS/RcSU1YESMkPkw2Ty+Ni?=
 =?iso-8859-1?Q?uhM4MmkZSOHPewfGek4m/yBjdMti6888C5SfKntT3jbWCrO+DDpZ+MZVSN?=
 =?iso-8859-1?Q?Y8Ejw8jPf/+qNeT1gIXXS7AVkxH2N+czLRzixWPOoJr1eh2Y80TlA45knD?=
 =?iso-8859-1?Q?6+tZZ/yKZ/QKrJa4gdqRpgMhKhmsx0vJmKhbWtYC0v+/DEbEcfONMmYI9U?=
 =?iso-8859-1?Q?14jp4Z7wQywF+zGcUdh7Vk99+ydGmg3HcpW9Je9DTLlHzaLgkgtqVwqOnP?=
 =?iso-8859-1?Q?ohghuu12UZG4A5WPa3Qi0jWGToxE5+Vof8rEO5DHYr3y0FKe2hvgCim5nz?=
 =?iso-8859-1?Q?fDU2l0YG3NyZTv6E6EZKSRMgtU3TUqbK+TJmRzuuccOCUFO4O5lF2Sh1sy?=
 =?iso-8859-1?Q?3HNcFuSbBQh4fk4p9tuJyznDzobVDipARkuGeEkQX187J3Veg+jE4hm1uI?=
 =?iso-8859-1?Q?FFSVswWeOSfaqjz/4Mxj9RWQv8wwFYDw+I561a/SX2u4QwyzILolU6u1tm?=
 =?iso-8859-1?Q?a5wMOd8giZkbed6jXYbTfSujslhNWkqz3KxuaXu8WW8KVdbHzht/FkQjPQ?=
 =?iso-8859-1?Q?axM3OvxppYJ0/Mcsv+lR3e63VQdFp7AOMoifdp7xKCIRspa6RRmiIKqHI7?=
 =?iso-8859-1?Q?rZvc1F1UHATIsU+krydwmXT1Xz3VnGMcqLTwyXJP0X5EgnZXVAW2hAEOa4?=
 =?iso-8859-1?Q?qD20yfIzOXb+HUNETGHoW6njbcV87GQc54P3DH3sPriCLrAnRPTXXdfQmy?=
 =?iso-8859-1?Q?DkBatnmlrQnd96X4VOSVPm1zLmAd0L79Z0HO7K8/j1Ghn8LyJPcu8HFnSf?=
 =?iso-8859-1?Q?cOysJUsPJhgRbPj3Fy8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2214b1f5-5d55-4f4d-bc6a-08db2941e0de
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 12:51:52.5051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9zYM28LaEbbVrgGN9kQ0zRNDfvvWD2nF+1aPQg//tmNSy7Hg2s7mUE0A8V8ufrr+TmC0kKc3B6gHnnUvYZnMgM3l8ox0TtqbPkA7fylcVfOflzzHbtTWZEc5S4axfvEd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5376
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
> Sent: Monday, March 20, 2023 6:07 PM
> To: Tharunkumar Pasumarthi - I67821
> <Tharunkumar.Pasumarthi@microchip.com>
>=20
> On Sun, Mar 19, 2023 at 02:42:37PM +0000,
> > > What about older designs?
> >
> > Older design is updated due to a bug. No future changes are expected in
> the timing registers going forward.
>=20
> Do you have customers for the older designs in the wild?

No. Chips with the old design are not shipped to customers.
Customers will=A0only be receiving the latest ones. Ok, I will update the c=
ommit description.

Thanks,
Tharun Kumar P
