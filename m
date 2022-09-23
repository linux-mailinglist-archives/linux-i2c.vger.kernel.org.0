Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC055E7C51
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 15:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbiIWNwE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Sep 2022 09:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbiIWNwA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Sep 2022 09:52:00 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014E011DFE3;
        Fri, 23 Sep 2022 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663941119; x=1695477119;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y5WRQ42/zYKj57q3m6I7CLbth4/3sZGXcG85ETMbOE4=;
  b=np+mIl3S2rUdMuGh0mBNRNUHmfkNftXdnI8kKTYQR+pRNUVmqod54153
   h9sYg0B5PgaQT3FSc0ZAha4+v1QEPM1Zx/ttK73o8pDLtkUoq1dz4CAsj
   F0lVCRjkoWnut0iIE73oaQSNsGB/jS9d9nHj2twCFa/4BrXEeNL1wFZ75
   TXNc91zlIMBsXkZ+8UZHcp57IZCF5fZCjaBDlDoF/bpKjnBh4rYmkDkN2
   NcH65Cb5KhHWLeyD6HSiJViAJ377WZYm7kz4N3h2AAjg7HgCNTewjBys+
   q83/jvF/XfLlFKRc1h4xUnyFn2mCqP53xbetivCVEoCxHWTehHiD4xsmF
   w==;
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="115110731"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Sep 2022 06:51:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 23 Sep 2022 06:51:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 23 Sep 2022 06:51:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGIxPmn/jroOJ/8G642B7ZhtNkq8VCmVb1W1Ib0xcBWrf7+x/O1s/shDQK6wXwNqEfxxdwouSuPPSVZ13t0UxGXX0Ry/8JjnUdKQ9joYP1kNN45AFo6FI6kzCKRwcZ8EWjBMSXaDSKqpWwNYFwBN8j+yGM9lCh+bipe7cyygwRzQZnJ3em806PIyGlb8wtKA2r1z0yXLI5hp4RtyZyNg/vjt4OCUmA1hltm0gIz+9Novqh72vcYBo8ZaCDFWr235Wv+RBiNWm3+IabzJ4IKlVPMzosm/eoi2TIoPNi39DGp0ftmZx7ZAXPMCTFWYEMLhY6ZyI+pw8xaCxas5prmczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5WRQ42/zYKj57q3m6I7CLbth4/3sZGXcG85ETMbOE4=;
 b=hEFhYLn9nVMI1agX8mYg0MubqwBXLCR2SaoA2QMp+jUkMhb3MjycpyYSDL/PjaNuPLXd78VrEHGvd1waVM81T8imhL7U7nrZGEtRvgrU3pqcI1ytKshB/b3mOtcZwDfJOe3qjUPuGUmcggn/uiHIEq9MWGhH4NIgrl1clABZ/YTIVBtYG974Mx8NeRqWCcrBSxHdd3gZRoRQWae+lpuosDWfPgHgZoYZibLEETPdX2UoaDDEfrJabfHRKkc3QYlhvOUu+Kc/gc1aQfjveNhvZzLnL6H2cJXmSk/bBNGZrk4F1udCD/aCVoOB3JBeRl3ju6xu7ZEQoLYS0Wc1OPddxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5WRQ42/zYKj57q3m6I7CLbth4/3sZGXcG85ETMbOE4=;
 b=dThzu306aC6HqDV+x8aYaoTtOpqoNycGW7omA0G5KKmrOMqPPbzLNmXeQ8tEHHkt0KhEg/3C35msom2PdrTmh5Xr0cMNUtGpaETAX73ZazoS9ZZjCrmPTXJtcwT/T+Bkl3VbbWYYKHmUQq414xi2nFNsBqjogATZrstXK2iWa2M=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by SJ0PR11MB6624.namprd11.prod.outlook.com (2603:10b6:a03:47a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 13:51:52 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::61bf:18d5:c7e7:f89c]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::61bf:18d5:c7e7:f89c%4]) with mapi id 15.20.5632.021; Fri, 23 Sep 2022
 13:51:52 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <wsa@kernel.org>
CC:     <UNGLinuxDriver@microchip.com>, <krzk@kernel.org>, <arnd@arndb.de>,
        <andriy.shevchenko@linux.intel.com>, <robh@kernel.org>,
        <semen.protsenko@linaro.org>, <sven@svenpeter.dev>,
        <jarkko.nikula@linux.intel.com>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <jsd@semihalf.com>, <olof@lixom.net>,
        <rafal@milecki.pl>
Subject: Re: [PATCH v4 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH v4 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYwtRuLt6yI1LWVkm57IwqsE/vHa3kK74AgAj2UAA=
Date:   Fri, 23 Sep 2022 13:51:52 +0000
Message-ID: <55e6769b1d7e890f4211b44f821b11654a5b9f4d.camel@microchip.com>
References: <20220907161143.897289-1-tharunkumar.pasumarthi@microchip.com>
         <YyY1vESf5JalT6GR@shikoro>
In-Reply-To: <YyY1vESf5JalT6GR@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5096:EE_|SJ0PR11MB6624:EE_
x-ms-office365-filtering-correlation-id: 79fc1db8-3b98-4f98-f8c1-08da9d6ac52f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NyirQbmBlD9dagOkem2oXhU1Av6gg6+LrOENzOayDOwjMEtbIUbC27lbegMH5bX6JHjmdoehovTSL+Mpm51VR8gc2a8unDJgt6FCuCGtw9SUl6onEsrRqLHIQTHPl4/GtCulD6gVvB0Mn8Q4/4Mv6D4OYQCwMirojB2bjH2tBKr7Xgq0kFARDUUCgolLFM+CoIF/ijX2TOTyrousvZJwmxhGPpKllSnxvQghYExiOq9HVz7tfNzYM0GFUAs8VbekxCdGkaAu2lYNXZT7jkj/m4b2GDNxfsEz0ynoQM6B+FaRmqY2qqM3m2aI9D+oZMgJJZ7bAJ21KBp9vBrhGszTMh6lxMgYsyQ6GB8xaXHeLqLvk0XQ/Enz/1nI2UeFKxmKY09e2Q1LfwAwZWZHJtukLMl6nsDPbvwkQ7X5IRK2sIH6jcvLa22/fFMgZEM05ZgJv3E20eGCvcRE02O50N8D3zttA2nLtYYwHfIapilMoYVCrJ0uPejA3+gP2mETql9phZHpBKNtAQaDEViVp7376nSyJRauXdq4dWURbf8Sr9W7NBvavZxYsyWAWGpV7j7KGSzm/5RvfRqmzXZVB7gYmFS7oWgBs1E9npwHIPN/uFvfGhYSYiLZj2VyT1kw87E7purrMbwnGF5ELK/w3EWtj7BgqKPYBm2Pq//Y6BlEZXVHlaroOVr4SNVzM/GTWNRSBb6qzXeJerZrgeG8M2BmFddIfvWxvswW6eFD2jsSZ4ER0hHmYUZKjqKtbU7OziNACp7lNJS9NEsgT8cazfJ0ZSIxGnXH9hqlifV5T6e81yw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199015)(91956017)(2616005)(71200400001)(8676002)(4326008)(186003)(41300700001)(38070700005)(76116006)(66556008)(86362001)(64756008)(66446008)(66476007)(36756003)(4744005)(66946007)(38100700002)(6506007)(5660300002)(6916009)(7416002)(478600001)(54906003)(122000001)(6486002)(8936002)(83380400001)(316002)(26005)(6512007)(2906002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q01WSHFsSUFaMzFSOFVEcVkrUytqT3pwNG83UHAxb2lkM3NIU0tGUzVPWDZM?=
 =?utf-8?B?M1dFa0o2eDlaSExMcm4rL3VOZjA0OU5NMlJkQS92anZ6Snh0K0tSWUZkSUli?=
 =?utf-8?B?TnJPM1E4cWZMcC9MeUVZRk5qeDBrNW9aYTdtaXhWNGg0QUlndFhicVFPRlg4?=
 =?utf-8?B?dEFydk9QQTFzcUM1OUEyb2FMeEc0WExEbFFQc0NlWExIYzNGMWs2d05vVWtO?=
 =?utf-8?B?WGJhM3lFVVFzTWFKc2tQTDI3QWgxYW5mQUR0cTYwYjYwblBYWTJQblRUSnhC?=
 =?utf-8?B?T0lDVWJpZ2RMQWw3QmtVQ2E4SGNEcGFkUHE0dmpPS1FKOThNYUpZeWdzTGhM?=
 =?utf-8?B?aTNycFhmbmM4WXJRUnp2Q00xblFsaC9vdDhiTmxadkFZcDA2MXFTbzI0T1FV?=
 =?utf-8?B?N29GWGl2aC9DblM5ckorWmY1SkVQWGtnaGRYTEJDM3RFUks5OEJ1MkR1RzdD?=
 =?utf-8?B?aUljejJNYTloVFpMdUg5TVNIZkEyNkN3czZrcXhiQUp2TkJQdVM2S1gvcDNk?=
 =?utf-8?B?R3c4RitkOHR3YzYxL2Y1bHZ4UmRleUhlSTBkTFEyME1nbGkwREFGYVRxMkps?=
 =?utf-8?B?aTQrb3g3K2s3RWYrMTEyWkczdUpKWUhFL3ErWGdTT2tlNXUzMFRXeTVocDcv?=
 =?utf-8?B?RTlvK2ErcTlIdEdpcGg1QVdLeTl6Qzk4U3Q2WmR5TUtnR2ZvV0lyVnFhdzJ3?=
 =?utf-8?B?NkJZVDBROGJtZXNOdStLQ0s5ZjV6RFNpdHVtZEFoa29qcUFYSUF0VlNlNDZK?=
 =?utf-8?B?R2dKOUZVdmdMZjFFRTJDYWJtaktKczZ4dFdkdzVnVlF0aFBQT3RObVgrRkk4?=
 =?utf-8?B?Yk5FYkRWeVBUaTBTY2h1ZVNxaWtTWWFwQWJaUkdvK1VCbm5xMVZvRkhwdGFK?=
 =?utf-8?B?NmxZV0lORkZwQUprejBQQ1ZjS1pGUlBaSVBmVWJwTWlHRS8xaFBxU0RJL2tS?=
 =?utf-8?B?bnBsOU8zdlRKKzdlQ3BKdWgzbmVNS3MyRWQ2Rkg3ZkVKR3ZoUTEySkFKaTl5?=
 =?utf-8?B?aG9pSFptenFZMnNXbDlFQnliNkZIUUxrbEVCWTFYb1EwZWxmaGhpU2ljYUNu?=
 =?utf-8?B?eFY4YWVDaWJDNndtVnI2c0hoQXcvVmtpVlpNSGJydk5iZ3hpR2xBNVJlZG16?=
 =?utf-8?B?b1BtNlFRWWgzc2VMSFRXZ3VydnY4NmlCNmFObEtKNjJHYkJwTEFEeUJoTCtY?=
 =?utf-8?B?S09SZ1RrQjdwVFNIdXFJV2FKdFpkazRaRVdFNmQwYSs0RitqNTNqTWJPdjVT?=
 =?utf-8?B?eVlEcEVnUHhkN3cydnlXd3B5Wlp0RC9tTTJ0bklGQy9PT3hNK2YxdG42OFZj?=
 =?utf-8?B?eWY5VE9zNHN6UzJQbVcwaEw1ZmVNMlBncFBFcVFLL1RGSzRqU1pIS3hSU2l0?=
 =?utf-8?B?OWloTFh5UFBQWXpWZURTSDRMdk5QcXFRaVgyWjdLSVlBSFJ4OTlrY3FLR2o1?=
 =?utf-8?B?Z3lwOFBzbHV0MERVeGpVRFc1Y0pXQWdvdlBVN1dKeUhhTkRmRkUzQ3QrNzRO?=
 =?utf-8?B?Yi9vRlNvMlJITk5yMS8rSDh2NS9aWStsSXhDckt3d1piWmpySnlSc2hMM3E0?=
 =?utf-8?B?Y2dzK3AvS2RkRVJUc3ZVUXlVSXZDenFlWXd3TklYeEIwSVJIU2phSnV6dDJ3?=
 =?utf-8?B?eVZkTzlIbEkrNFBIZlF2Y3hZSFZzajBwa24rUThMUnpuYXFRUTJXeG9BNjlB?=
 =?utf-8?B?U0kvSDVrRUpVVWJrM1h4ZlEwU3RLaEpKMW12K0Rnd1R4dE40enM2U3RxT3J1?=
 =?utf-8?B?QkZJeEJ6UTR5WnV4OHhLTFY0Ny9KdmFVc3RuZTdzaVFjUzhpVDlQMWxwaUd1?=
 =?utf-8?B?VVNvbDBpbHhDNndmYWN4L1RkY2lnWDQrbFJTWkp0T3lKS056dXRWS1hTdjRU?=
 =?utf-8?B?dmM0V3NFZVJFUU1aRjRzR3RnSE5Ca1FDV000bXMvYzNwdWJMSS91RlJEU1l5?=
 =?utf-8?B?QXVqWTVRM0Z2YmJZVFNaaWFvYlpIdmcrZCtEeWdRUjBwOUJ6ZXFFUTI0YkVR?=
 =?utf-8?B?bXFETHpHOTV1cWhGd0Y5MlowV2dGZnJzYzBHUU0xa2diRFZmODY4RWpMNllr?=
 =?utf-8?B?ZUV0NVMzZmx2eU1PUklmUVZqL0hZVkgxTkJoK0FjNkZCZ3NRY1g4aksrMVhG?=
 =?utf-8?B?UHhaRWtRY2NzeGFjU0dFb0FyK09HNS93Y0o5K1pVbk1BVjZzRU9MNHNKS3NG?=
 =?utf-8?Q?QE+YdtA9+l9ZoqpOCdLOps3hPwnBE62E8OYFtn4Q78hA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D883A1622322448A735D5E5D43E871D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fc1db8-3b98-4f98-f8c1-08da9d6ac52f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 13:51:52.6384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 34E9XZlW22tTlKmXkDxwo123tnAf7zanOVU6SXQUx9Ki2cOS1eiV/5gPjEtVc1aYoeY5i3+pdB/gWan/ThLmDXNBNInWRrZ8Y8CFOOWZ89OLK+DKKGB4MvZVwY7PBI/A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6624
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gU2F0LCAyMDIyLTA5LTE3IGF0IDIzOjAxICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGtub3cgdGhlDQo+IGNvbnRlbnQgaXMgc2FmZQ0KPiBJZiB5b3UgY2FuJ3QgZG8g
STJDX0ZVTkNfU01CVVNfUVVJQ0ssIHRoZW4geW91IG5lZWQgYW4gaTJjX2FkYXB0ZXJfcXVpcmsN
Cj4gc3RydWN0IHNheWluZyB0aGF0IHlvdXIgSFcgY2Fubm90IGRvIDAgYnl0ZSBsZW5ndGggdHJh
bnNmZXJzLg0KPg0KPiBBbHNvLCBhIGxvdCBjYW4gYmUgc2ltcGxpZmllZCBoZXJlLCBlLmcuIEky
Q19GVU5DX1NNQlVTX0JZVEUgY292ZXJzIGJvdGgNCj4gY2FzZXMsIHJlYWQgYW5kIHdyaXRlLg0K
DQpPa2F5LiBJIHdpbGwgdXBkYXRlIGNvZGUuDQoNCj4gV2h5IG5vdCB1c2UgdGhlbiBzaW1wbHkg
MCBpbnN0ZWFkIG9mIGEgZGVmaW5lIGFuZCBhIGNvbW1lbnQ/DQoNCk9rYXksIEkgd2lsbCB1cGRh
dGUuDQoNCj4gSSBuZWVkIHRvIG1ha2Ugc3VyZTogZG8geW91IGludGVudGlvbmFsbHkgd2FudCBh
dXRvcHJvYmluZyBmb3IgU1BEPyBJDQo+IGFzayBiZWNhdXNlIGl0IGNvdWxkIGJlIG5lZWRlZCBi
dXQgaXQgY29zdHMgYm9vdHRpbWUgd2hlbiBub3QgbmVlZGVkLg0KPiBBbmQgY2hhbmdpbmcgdGhl
IGNsYXNzIG9uY2UgZXhwb3NlZCBpcyB0cm91Ymxlc29tZS4NCg0KQXV0b3Byb2JpbmcgaXMgbm90
IHJlcXVpcmVkLiBJIGNhbiBtb2RpZnkgY29kZS4gDQoNCkFsbCB0aGVzZSBjb21tZW50cyBuZWVk
IHRvIGJlIGFkZHJlc3NlZCBub3cgb3IgY2FuIGJlIGZpeGVkIGxhdGVyIGFmdGVyIHRoZQ0KcGF0
Y2ggaXMgYXBwbGllZD8NCg0KDQpUaGFua3MsDQpUaGFydW4gS3VtYXIgUA0K
