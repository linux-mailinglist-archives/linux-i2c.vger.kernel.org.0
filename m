Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4D172C4A4
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 14:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbjFLMmm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 08:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjFLMmk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 08:42:40 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0459CE4C;
        Mon, 12 Jun 2023 05:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxfmnUfue035jPQP5fZZGh4qhEzD9ZXQH+PP7KcfLvqjM2CFVZnQ6zX2elg7zgFiT+WJTc2SpqCKZLKHxj7dljW9Uw0tV0gV4orqrTr/hnsY4uzUowTWqF/MhZkwX1OC6B4gpONc0mALnAgbpVCUUdsvhMF5vcOMCXKIz7d53/ITKnKSKUbofzmvM3L+ZJr8MQfVApd5I15JR1OET21R3motK2rIbT+tqrAOxfk2pfpMDMd7CRO2F6zSsBBaj4V95St5NLEdR0CQzoxDvmiax/rYkoADWLj6vZI98cYCMQH0QD95/4aOS1H0Pwh2gZ0SFamXcooRospwDuGdzBE8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4p5GHI6EeVESoagUeT2aZQkU0NUJTyWwhbwKx0KcvA=;
 b=IRzIxYA5qBahNhx0CAPh/xF0kxQPbHoOwOlQNE2BfHKPf8HOUSJ7kaX4PQBm3aCCaKsKW9ZcFoGpBV7jWIbI4VyPi0kFy9GYCQP+48rJMfltoExHNAOrl+uFr9kiem3LuLj6MvnFpJ8L+Am4L/ChmeAUIb803uPUZp5jYKtPxzb5i2iPl0aVFWrPVCIGZobpiE0z1v7Fku9sBAjGKYp/jyREkgODicy+tclypuPoIyvFvbmuAZxiOxtAvkP/6KhxgxdhxT0Mbb83YmyXPaWC573qrtDFGjs0HvQJg4hRBM8QSleIRtCjyaYohV8ZkY2b8JeQPzIy2ySICq/G7bLLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4p5GHI6EeVESoagUeT2aZQkU0NUJTyWwhbwKx0KcvA=;
 b=M5boKjc3jERu5vApJOi79oBVU4VgG4nSuvethHHfZRBJr5RgEPx+HHNAwteO4uXiUtlJ1/rvH+OZhTKoNwLD5OGaO/3Eum8uj7EgOy0ceHesos/pnlthxCnhIOoINMqQoTA8qNxyEgeiy1jYJw6qXeujeYeAuCQjyGCdgEczDFM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10735.jpnprd01.prod.outlook.com (2603:1096:400:298::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Mon, 12 Jun
 2023 12:42:33 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.045; Mon, 12 Jun 2023
 12:42:33 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        =?utf-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Trent Piepho <tpiepho@gmail.com>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAALpeAgAABR+A=
Date:   Mon, 12 Jun 2023 12:42:33 +0000
Message-ID: <OS0PR01MB5922D335D53C7B0FA021B3218654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612122353.GA22391@pendragon.ideasonboard.com>
In-Reply-To: <20230612122353.GA22391@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10735:EE_
x-ms-office365-filtering-correlation-id: 00719398-8873-4cf0-3029-08db6b427e3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jjt9a7AcjVw0B6KoKAO10IXCHT0mU0cwCQRUXH/zJ2LI4/MhobMys4FNkxwGkfjwFY4+G8W0CXZyFnt+ZFNLDje0uEoBztGqcEDYAf2wlUQ0wqTaT11aJvbs0nPiypU9zKicfEW8fJhAeKtid42t6+LYczyW8iZI4pjoAgKUlk8o/SKJyVswqF9LsToGfsj8ZoTCJZFKoNMXJxiblk/PjRrmUS4FixafXTDeVWi0zV9yTTm2nFYPUB0MIBMm5fG/mLfjYdxBtZI/M9zSuFuwzGVfLU0Fcc+wOSmYDBjT2iMdBq2gclSyLA/Gl1Bu/O9fbdoxjD8qbyR528lDc/nfjKP3OmGGqyu+1mQSHRheHptOS5FuP7uI83e6z9yiORCXJNu/PRg6hiZS9Bv9LJMHBz5uw2kyQuWJI1wIzZb7ZWWrIoAF4sJt+7RSAIEiO6wtWoQ7ADIlo3m63YsNVPBf1FcTeUFXW2IAYwIWUkyvPMQiUzV+N3YHNcCkoFzt/1ZkGBv+3J9S37BYtyuyr8et7skEMNqMuJHPrQ3gkt5bjcTqduu7gbDwNfEwMF78MEHHaqVaF7emc4Xos8SYjUcttSC6tFpJsoCvIul3jqwFr/2TOvMdcHylRMtaFail8r+RMoKKJkLSPgP6fA40Mr4gsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199021)(7416002)(52536014)(4326008)(64756008)(7696005)(55016003)(316002)(966005)(8676002)(33656002)(54906003)(66476007)(76116006)(122000001)(66946007)(6916009)(66446008)(66556008)(7406005)(2906002)(5660300002)(86362001)(38070700005)(41300700001)(38100700002)(8936002)(71200400001)(478600001)(186003)(66574015)(83380400001)(53546011)(6506007)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0UrWTZmQkhZbVpYcGNmd1hxUnhsZnlQem5zaXZvS2kwMllwOHg1SGdVN053?=
 =?utf-8?B?Rmpvdy9QcGdCU2FMUHFHOGd4ZFRYSzdoVG52bnpYTDlRcUJKbEQzaHV4Q2dO?=
 =?utf-8?B?T2pSd3R5M3VyWEovd1lGYWpsS2tFZlBqRHdTTFZ6Q29HT0x3MkxKL0w5YlYy?=
 =?utf-8?B?eE9ORDhGTzE5TDR2aVQrdFJZREgvNkhzL0tQcnhNNEw5anpRajFSSzE1M1B0?=
 =?utf-8?B?dlRVWFNlZmk0SXMyOE83NUhZenhFVkxFM2o0MjB1NGRYUWdJVEpwUFFaRFRa?=
 =?utf-8?B?bGc0eXB1R3BtZ0VJYVNYK1ZwQ0puWWVxVE1FMk9rYWlmdWYwS2tlcTJXbVc5?=
 =?utf-8?B?N0swUHFQNkFoOTIrTDdWWnVrQkIzUUkyMlpMZHV1RWxlWUo0NHh4cXlWQU5k?=
 =?utf-8?B?UVcyQm44dmJ4MmQrbWlzSitBc1lLN045cFVBSDNMTjBqZ09zY1NpSFM4Tloy?=
 =?utf-8?B?WVcyVEFVSTJvSTlJOWF2L2h4RW9ZK3Baa1JjZnU4VFdPVi9GZk9zVkE1NTJ4?=
 =?utf-8?B?ZjlyeTZtZWE0bkcvcjJtSzJUamZLL2dCZ1NTakxSNFp1VkFwTGJLeTEvdSt3?=
 =?utf-8?B?Nmt1eWI3TVlBWHVhMWNZdk85V2JBMjMyYkYrK0Zuc01SeEMreEgyQWhTWWJR?=
 =?utf-8?B?ekZMTUFLV0RVY0c5dTN1V0M4UkpLMDFWb3YvblNXVkNrc2Z5RVQyNGpJeUpy?=
 =?utf-8?B?bkVFQ004VkFpWDFxNE81SG1OTk9iM1B5bnphRTROcnpUSFhKSTVDeHhySWkv?=
 =?utf-8?B?cTVqUGhlMjdNeWpzbDZEbTJKSjM4NDI4OFZXeGZGejltdkNOK1BkeDhSTTJK?=
 =?utf-8?B?d0lpcmU2UWk0bGVLQm5EWXNuRnlBOHFHTVFZb3lIeWZYbDkzbHVDd2V1dVhK?=
 =?utf-8?B?bjRBRFp0NUNYd1V4WkR1bzZRSnl2V2JtUms0QmQvaGlQUmlZWGFub3haelI3?=
 =?utf-8?B?VW5TSTdNWGxFRmlpNXM3QUgxUk1CZmo0NjFDVzU4Y2NRcjRvbStXamQ4eVpU?=
 =?utf-8?B?T0JqdzRrWmdiaDN1eHcya1ZqWjBSVFA3OXN5b1kxZk9JTHFNaDlTMGV2NEZW?=
 =?utf-8?B?MDlXS2NSbGduVGdpTklmVjhyWE1kYWlNTDV6VXhFRUxBU004QnhzRkpwM3Ix?=
 =?utf-8?B?RDg4TXNBVmFFWGtlbzlPWDNJbWdpZzdvdTdRODJsZ2NpUEpZWVEyYkp5ZWwz?=
 =?utf-8?B?WFRJdnIxa1JZdER3NUVYVG01eEJCRXFUZSsyallKM3JwUWhzQWM4cmJVZ0tO?=
 =?utf-8?B?Z055UFVadGdNeEs1VkVDRkpCSmREc1RNWnNsVmVZandRMkRFMUdIT25MeFpH?=
 =?utf-8?B?T3JVOWtxVEhUTWdaRUNvUjhpTndYZXlmcHFRV3picWU2RktKRUNldEZvTW05?=
 =?utf-8?B?dzB6YWtuWGE2ZmVTV0ttOVVWVFdxS2tvL2VvdUNadzM5U0pmQkh6QmFMVmlY?=
 =?utf-8?B?bTUvNi9ZSEFNRlhtQy9DTEtublc4YWFGckpBTUtpOStFUStvcFZzQ2s2blB5?=
 =?utf-8?B?S016RkdxSWlsSWZKNStNV3pNWjBmOVVuaWF5NXpuR0ZLMWFyS2lieCtnN2I5?=
 =?utf-8?B?RXBoelF6ektvOTNOcWREMDgzdll4MjU0akVxc21Dc3NqSWVvRUdFbWNpMzgr?=
 =?utf-8?B?RnV2eHhGSFpxdkJ2T1N0SlF1Z050NVV5bTlsMG5Fb0ZNWjNtR2Z4WStpQWd4?=
 =?utf-8?B?anpBV1hNeUw3clhNZk9JbUdZbWVnYW9ZcWhxeVM1L0JZb3JXQTFzcTRkVERL?=
 =?utf-8?B?eDkvOHpncUlYbnFYclNaandXVG5uaFlHQkpkbnFNaEhMWTBSZmFYODgyRXdD?=
 =?utf-8?B?eXlmc2lzU1huNXBTeUJBUUVwZVRlbnpLcXorTzZEZVFhbTlDamhXQTU2SkR0?=
 =?utf-8?B?bFNmYTlzWUsxb0JuMVUrZGZ2bDNoOFVNSk90MUF0UWJPSXlKYmkrMzRodTBs?=
 =?utf-8?B?NThRZzJuV095eWVHc1Q2RzA4RlpRZzhjeHRjUkRQek1iYTVOUlFsTndqQ0pr?=
 =?utf-8?B?Y2xXOVNWZkw1NkpMb1RLd1RLc1F1WVpNUHlSSFFMdm12b2dSRFFUVHg3YWhm?=
 =?utf-8?B?UFVCMXNhcVU4MkkxVnBQMlh1UjJ4dXhJaHUrNEYxQUYyY3Nva1FBbUVUQjVm?=
 =?utf-8?Q?eFI5rd4JfyBXj3pPYYydvUSi3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00719398-8873-4cf0-3029-08db6b427e3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 12:42:33.3026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwhF7lbVb2oetVhdlRAE4pwFAbukP6bR7hsI9QSucCkyWH4syhsDraBJv1j9uSic2FRD4BBKIowwDyXmOJJvZKr6fm2DJmEEvznsNRngxFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhhbmNlIGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSBB
UEkNCj4gDQo+IE9uIE1vbiwgSnVuIDEyLCAyMDIzIGF0IDA5OjUzOjAyQU0gKzAwMDAsIEJpanUg
RGFzIHdyb3RlOg0KPiA+IEhpIEFsbCwNCj4gPg0KPiA+IEhvdyBkbyB3ZSBwcm9jZWVkIGhlcmUg
YmV0d2VlbiBbMV0gYW5kIFsyXT8NCj4gPg0KPiA+IERULU1haW50YWluZXJzIHN1Z2dlc3Rpb246
DQo+ID4gWzFdDQo+ID4gcmFhMjE1MzAwOiBwbWljQDEyIHsNCj4gPiAJY29tcGF0aWJsZSA9ICJy
ZW5lc2FzLHJhYTIxNTMwMCI7DQo+ID4gCXJlZyA9IDwweDEyPiwgPDB4NmY+Ow0KPiA+IAlyZWct
bmFtZXMgPSAibWFpbiIsICJydGMiOw0KPiA+DQo+ID4gCWNsb2NrcyA9IDwmeDI+Ow0KPiA+IAlj
bG9jay1uYW1lcyA9ICJ4aW4iOw0KPiA+IAkvKiBBZGQgT3B0aW9uYWwgc2hhcmVkIElSUSByZXNv
dXJjZSBhbmQgc2hhcmUgaXQgdG8gY2hpbGQgYW5kIGhhbmRsZQ0KPiA+IGl0IGJvdGggaW4gcGFy
ZW50IGFuZCBjaGlsZCAqLyB9Ow0KPiA+DQo+ID4gTGF1cmVudC9Xb2xmcmFtIHN1Z2dlc3Rpb24g
dG8gc3BsaXQgaXQgaW50byB0d28gbm9kZXMgYW5kIGdldCByaWQgb2YNCj4gdGhpcyBwYXRjaDoN
Cj4gPiBbMl0NCj4gPiAJcmFhMjE1MzAwOiBwbWljIEAxMiB7DQo+ID4gCQljb21wYXRpYmxlID0g
InJlbmVzYXMscmFhMjE1MzAwIjsNCj4gPiAJCXJlZyA9IDwweDEyPjsNCj4gPg0KPiA+IAkJLyog
QWRkIE9wdGlvbmFsIHNoYXJlZCBJUlEgKi8NCj4gPiAJCXJlbmVzYXMscmFhMjE1MzAwLXJ0YyA9
IDwmcnRjX3JhYTIxNTMwMD47IC8qIFBhcnNlIHRoZSBoYW5kbGUNCj4gYW5kIEVuYWJsZSBSVEMg
LCBpZiBwcmVzZW50LiovDQo+ID4gCX07DQo+ID4NCj4gPiAJcnRjX3JhYTIxNTMwMDogcnRjQDZm
IHsNCj4gPiAJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyYWEyMTUzMDAtaXNsMTIwOCI7DQo+IA0K
PiBNYWtlIHRoaXMNCj4gDQo+ICAJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyYWEyMTUzMDAtaXNs
MTIwOCIsICJpc2lsLGlzbDEyMDgiOw0KPiANCj4gQnR3LCBpdCB3b3VsZCBiZSBuaWNlIHRvIGNv
bnZlcnQNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9pc2lsLGlzbDEy
MDgudHh0IHRvIFlBTUwuDQoNCkl0IGlzIGFscmVhZHkgcG9zdGVkIHNlZSBbMV0gYW5kIFsyXQ0K
WzFdDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmVuZXNhcy1z
b2MvcGF0Y2gvMjAyMzA2MDIxNDI0MjYuNDM4Mzc1LTYtYmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20vDQoNClsyXQ0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJl
bmVzYXMtc29jL3BhdGNoLzIwMjMwNjAyMTQyNDI2LjQzODM3NS03LWJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tLw0KDQo+IA0KPiA+IAkJcmVnID0gPDB4NmY+Ow0KPiA+DQo+ID4gCQkvKiBBZGQg
T3B0aW9uYWwgc2hhcmVkIElSUSAqLw0KPiA+IAkJY2xvY2tzID0gPCZ4Mj47DQo+ID4gCQljbG9j
ay1uYW1lcyA9ICJ4aW4iOw0KPiA+IAkJcmVuZXNhcyxyYWEyMTUzMDAtcG1pYyA9IDwmcG1pYz47
IC8qIFBhcnNlIHRoZSBoYW5kbGUgdG8gZ2V0DQo+IFBNSUMNCj4gPiB2ZXJzaW9uIHRvIGNoZWNr
IE9zY2lsbGF0b3IgYml0IGlzIGludmVydGVkIG9yIG5vdCAqLw0KPiANCj4gVGhpcyBpc24ndCBu
aWNlLiBJIHdvdWxkIGluc3RlYWQgYWRkIGEgcmVuZXNhcyxpbnZlcnQteHRvc2NiIGJvb2xlYW4N
Cj4gcHJvcGVydHkuIElmIHlvdSBkb24ndCB3YW50IGRpZmZlcmVudCBEVCBzb3VyY2VzIGZvciBk
aWZmZXJlbnQgcmV2aXNpb25zDQo+IG9mIHRoZSBQTUlDLA0KDQpJIG5lZWQgdG8gc3VwcG9ydCBh
bGwgUE1JQyB2ZXJzaW9ucyB3aXRoIHNhbWUgaW1hZ2UsIGFzIFBNSUMgaXMganVzdCBhIGNvbXBv
bmVudCBvbiB0aGUNClNvTSBtb2R1bGUuIFNvIFNvTSdzIGhhdmUgZGlmZmVyZW50IFBNSUMgdmVy
c2lvbnMuDQoNCj4gb25lIG9wdGlvbiBpcyB0byBwZXJmb3JtIHRoZSBhdXRvLWRldGVjdGlvbiBp
biB0aGUgYm9vdA0KPiBsb2FkZXIgYW5kIHVwZGF0ZSB0aGUgRFQgZHluYW1pY2FsbHkgdGhlcmUu
DQoNClllcywgdGhpcyBpcyBhbiBvcHRpb24uIEJvb3Rsb2FkZXIgdXBkYXRlcyAicmVuZXNhcyxp
bnZlcnQteHRvc2NiIiBwcm9wZXJ0eSBiYXNlZA0Kb24gUE1JQyB2ZXJzaW9uLg0KDQpOb3Qgc3Vy
ZSwgRnJvbSBiaW5kaW5nIHBlcnNwZWN0aXZlLCBEb2N1bWVudGluZyAicmVuZXNhcyxpbnZlcnQt
eHRvc2NiIiBpcyBPSyBmb3INCnRoZSByZWxldmFudCBtYWludGFpbmVycz8/DQoNCkNoZWVycywN
CkJpanUNCg0KDQo+IA0KPiA+IAl9Ow0KPiANCj4gDQo+IA0KPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEJpanUgRGFzDQo+ID4gPiBTZW50OiBUaHVyc2RheSwg
SnVuZSA4LCAyMDIzIDE6NTcgUE0NCj4gPiA+IFRvOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiBDYzogV29sZnJhbSBTYW5nIDx3c2FA
a2VybmVsLm9yZz47IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtDQo+ID4gPiBtNjhr
Lm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJv
Lm9yZz47DQo+ID4gPiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgQW5kcnplaiBI
YWpkYQ0KPiA+ID4gPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsgTmVpbCBBcm1zdHJvbmcNCj4g
PiA+IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgUm9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5l
bC5vcmc+OyBEYXZpZA0KPiA+ID4gQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IEtpZXJhbg0KPiA+ID4gQmluZ2hhbSA8a2llcmFuLmJp
bmdoYW1AaWRlYXNvbmJvYXJkLmNvbT47DQo+ID4gPiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1j
aGVoYWJAa2VybmVsLm9yZz47IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtDQo+ID4gPiBjaXNjb0B4
czRhbGwubmw+OyBBbGVzc2FuZHJvIFp1bW1vIDxhLnp1bW1vQHRvd2VydGVjaC5pdD47IEFsZXhh
bmRyZQ0KPiA+ID4gQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+OyBKb25h
cyBLYXJsbWFuDQo+ID4gPiA8am9uYXNAa3dpYm9vLnNlPjsgSmVybmVqIFNrcmFiZWMgPGplcm5l
ai5za3JhYmVjQGdtYWlsLmNvbT47IFV3ZQ0KPiA+ID4gS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
IGtvZW5pZ0BwZW5ndXRyb25peC5kZT47IENvcmV5IE1pbnlhcmQNCj4gPiA+IDxjbWlueWFyZEBt
dmlzdGEuY29tPjsgTWFyZWsgQmVow7puIDxrYWJlbEBrZXJuZWwub3JnPjsgSmlhc2hlbmcNCj4g
PiA+IEppYW5nIDxqaWFzaGVuZ0Bpc2Nhcy5hYy5jbj47IEFudG9uaW8gQm9ybmVvDQo+ID4gPiA8
YW50b25pby5ib3JuZW9AZm9zcy5zdC5jb20+OyBBYmhpbmF2IEt1bWFyDQo+ID4gPiA8cXVpY19h
YmhpbmF2a0BxdWljaW5jLmNvbT47IEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXgu
ZGU+Ow0KPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtaTJjQHZn
ZXIua2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgR2VlcnQg
VXl0dGVyaG9ldmVuDQo+ID4gPiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBGYWJyaXppbyBD
YXN0cm8NCj4gPiA+IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBsaW51eC1yZW5l
c2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5l
bC5vcmc+DQo+ID4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2Ug
aTJjX25ld19hbmNpbGxhcnlfZGV2aWNlDQo+ID4gPiBBUEkNCj4gPiA+DQo+ID4gPiBIaSBMYXVy
ZW50LA0KPiA+ID4NCj4gPiA+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+ID4NCj4gPiA+
ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhhbmNlDQo+ID4gPiA+IGky
Y19uZXdfYW5jaWxsYXJ5X2RldmljZSBBUEkNCj4gPiA+ID4NCj4gPiA+ID4gSGkgQmlqdSwNCj4g
PiA+ID4NCj4gPiA+ID4gT24gVGh1LCBKdW4gMDgsIDIwMjMgYXQgMTE6MDA6MTlBTSArMDAwMCwg
QmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzEx
XSBpMmM6IEVuaGFuY2UNCj4gPiA+ID4gPiA+IGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSBBUEkg
T24gVGh1LCBKdW4gMDgsIDIwMjMgYXQNCj4gMDY6NDE6MzVBTSswMDAwLCBCaWp1IERhcyB3cm90
ZToNCj4gPiA+ID4gPiA+ID4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVu
aGFuY2UNCj4gPiA+ID4gPiA+ID4gPiBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UgQVBJDQo+ID4g
PiA+ID4gPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2UN
Cj4gPiA+ID4gPiA+ID4gPiA+IGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSBBUEkNCj4gPiA+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBIaSBhbGwsDQo+ID4gPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+ID4gc29ycnkgZm9yIG5vdCBiZWluZyBhYmxlIHRvIGNoaW1lIGluIGVh
cmxpZXIuDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBJbiBCaWp1J3Mg
cGFydGljdWxhciB1c2UgY2FzZSwgdGhlIGkyYyBkZXZpY2UgcmVzcG9uZHMNCj4gPiA+ID4gPiA+
ID4gPiA+ID4gdG8gdHdvIGFkZHJlc3Nlcywgd2hpY2ggaXMgdGhlIHN0YW5kYXJkIGkyYyBhbmNp
bGxhcnkNCj4gdXNlIGNhc2UuDQo+ID4gPiA+ID4gPiA+ID4gPiA+IEhvd2V2ZXIsIHdoYXQncyBz
cGVjaWFsDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gTm90IHF1aXRlLiBh
bmNpbGxhcnkgaXMgdXNlZCB3aGVuIGEgKmRyaXZlciogbmVlZHMgdG8NCj4gPiA+ID4gPiA+ID4g
PiA+IHRha2UgY2FyZSBvZiB0d28gYWRkcmVzc2VzLiBXZSBhbHJlYWR5IGhhdmUgZGV2aWNlcw0K
PiA+ID4gPiA+ID4gPiA+ID4gYnVuZGxpbmcgdHdvIGZlYXR1cmVzIGludG8gdGhlIHNhbWUgY2hp
cC4gSSByZWNhbGwgYXQNCj4gPiA+ID4gPiA+ID4gPiA+IGxlYXN0IFJUQyArIEVFUFJPTSBzb21l
d2hlcmUuIEFuZCBzbyBmYXIsIHdlIGhhdmUgYmVlbg0KPiA+ID4gPiA+ID4gPiA+ID4gaGFuZGxp
bmcgdGhpcyBieSBjcmVhdGluZyB0d28gbm9kZXMgaW4gRFQgYW5kIGhhdmUgcHJvcGVyDQo+IGJp
bmRpbmcgZG9jcy4NCj4gPiA+ID4gPiA+ID4gPiA+IEkgdGhpbmsgdGhpcyBpcyBjbGVhbmVyLiBG
aXJzdCwgeW91IGNhbiBzZWUgaW4gRFQNCj4gPiA+ID4gPiA+ID4gPiA+IGFscmVhZHkgd2hhdCB0
aGUgY29tcG91bmQgZGV2aWNlIHJlYWxseSBjb25zaXN0cyBvZi4gSW4NCj4gPiA+ID4gPiA+ID4g
PiA+IHRoaXMgY2FzZSwgd2hpY2ggUlRDIGFuZCBSVEMgZHJpdmVyIGlzIGV4YWN0bHkgbmVlZGVk
Lg0KPiA+ID4gPiA+ID4gPiA+ID4gU2Vjb25kLCB0aGUgY29kZSBhZGRlZCBoZXJlIGFkZHMgY29t
cGxleGl0eSB0byB0aGUgSTJDDQo+ID4gPiA+ID4gPiA+ID4gPiBjb3JlIHdpdGggYW5vdGhlciBs
YXllciBvZiBpbmRlcmVjdGlvbiBmb3IgZHVtbXkgZGV2aWNlcy4NCj4gPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+IEZZSSwgcGxlYXNlIHNlZSBbMV0gYW5kIFsyXQ0KPiA+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+ID4gQXMgcGVyIERUIG1haW50YWluZXJzLCBtb3N0IG9mIFBNSUNz
IGFyZSBkZXNjcmliZWQgd2l0aA0KPiA+ID4gPiA+ID4gPiA+IG9uZSBub2RlLCBldmVuIHRob3Vn
aCBSVEMgaXMgb24gc2VwYXJhdGUgYWRkcmVzcy4NCj4gPiA+ID4gPiA+ID4gPiBBY2NvcmRpbmcg
dG8gdGhlbSB0aGUgRFQgc2NoZW1hIGFsbG93cyBtdWx0aXBsZSBhZGRyZXNzZXMNCj4gZm9yIGNo
aWxkcmVuLg0KPiA+ID4gPiA+ID4gPiA+IEJ1dCBjdXJyZW50bHkgd2UgbGFja3MgaW1wbGVtZW50
YXRpb24gZm9yIHRoYXQuIFRoZQ0KPiA+ID4gPiA+ID4gPiA+IGVuaGFuY2VtZW50IHRvIHRoaXMg
QVBJIGFsbG93cyB0aGF0Lg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+IEFz
IHNvbWUgcmVzb3VyY2VzIGFyZSBzaGFyZWQgKGtub3dsZWRnZSBhYm91dCB0aGUNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gY2xvY2tzKSwgc3BsaXR0aW5nIHRoaXMgaW4gdHdvIGRpc3RpbmN0IGRldmlj
ZXMgaW4gRFQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKHdoaWNoIGlzIHdoYXQgQmlqdSdzIGluaXRp
YWwgcGF0Y2ggc2VyaWVzIGRpZCkgd291bGQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gbmVlZCBwaGFu
ZGxlcyB0byBsaW5rIGJvdGggbm9kZXMgdG9nZXRoZXIuDQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+ID4gPiA+IERvIHlvdSBoYXZlIGEgYmV0dGVyIGlkZWEgaG93IHRvIHJlcHJl
c2VudCB0aGlzPw0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IE5vdCBzdXJl
IGlmIEkgdW5kZXJzdG9vZCB0aGlzIGNoaXAgY29ycmVjdGx5LCBidXQgbWF5YmU6DQo+ID4gPiA+
ID4gPiA+ID4gPiBUaGUgUE1JQyBkcml2ZXIgZXhwb3NlcyBhIGNsb2NrIGdhdGUgd2hpY2ggY2Fu
IGJlDQo+ID4gPiA+ID4gPiA+ID4gPiBjb25zdW1lZCBieSB0aGUgUlRDIGRyaXZlcj8NCj4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gTGV0IG1lIGdpdmUgbWUgc29tZSBkZXRhaWxzIG9mIHRo
aXMgUE1JQyBjaGlwLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBQTUlDIGRldmljZSBo
YXMgMiBhZGRyZXNzZXMgIjB4MTI6LSBQTUlDIiAsICIweDZmIi0gcnRjLg0KPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiBJdCBoYXMgWElOLCBYT1VULCBJTlQjIHBpbnMgYW5kIGEgcmVnaXN0
ZXIgZm9yIGZpcm13YXJlDQo+IHJldmlzaW9ucy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJ
cyB0aGUgZmlybXdhcmUgcmV2aXNpb24gcmVnaXN0ZXIgYWNjZXNzZWQgdGhyb3VnaCBhZGRyZXNz
DQo+ID4gPiA+ID4gPiAweDEyDQo+ID4gPiA+ID4gPiAoUE1JQykgb3IgMHg2ZiAoUlRDKSA/DQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiAweDEyKFBNSUMpLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+
IEJhc2VkIG9uIHRoZSBzeXN0ZW0gZGVzaWduLA0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiBJZiBYSU4gYW5kIFhPVVQgaXMgY29ubmVjdGVkIHRvIGV4dGVybmFsIGNyeXN0YWwsIEludGVy
bmFsDQo+ID4gPiA+ID4gPiA+IG9zY2lsbGF0b3IgaXMgZW5hYmxlZCBmb3IgUlRDLiBJbiB0aGlz
IGNhc2Ugd2UgbmVlZCB0byBzZXQNCj4gPiA+ID4gPiA+ID4gdGhlIG9zY2lsbGF0b3IgYml0IHRv
ICIwIi4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSWYgWElOIGlzIGNvbm5lY3RlZCB0
byBleHRlcm5hbCBjbG9jayBzb3VyY2UsIEludGVybmFsDQo+ID4gPiA+ID4gPiA+IG9zY2lsbGF0
b3IgaXMgZGlzYWJsZWQgZm9yIFJUQy4gSW4gdGhpcyBjYXNlIHdlIG5lZWQgdG8gc2V0DQo+ID4g
PiA+ID4gPiA+IHRoZSBvc2NpbGxhdG9yIGJpdCB0byAiMSIuDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gU2FtZSBoZXJlLCB3aGljaCBhZGRyZXNzIGlzIHRoZSBvc2NpbGxhdG9yIGJpdCBhY2Nl
c3NlZCB0aHJvdWdoDQo+ID8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFJUQyAoMHg2RiktLT4gdG8g
c2V0IG9zY2lsbGF0b3IgYml0Lg0KPiA+ID4gPg0KPiA+ID4gPiBBbmQgZG9lcyB0aGUgUE1JQyBw
YXJ0IGRlcGVuZCBvbiB0aGUgb3NjaWxsYXRvciBiaXQgYmVpbmcgc2V0DQo+ID4gPiA+IGNvcnJl
Y3RseSwgb3IgaXMgdGhhdCB1c2VkIGZvciB0aGUgUlRDIG9ubHkgPw0KPiA+ID4NCj4gPiA+IFBN
SUMgcGFydCBkb2VzIG5vdC4gSXQgaXMgdXNlZCBvbmx5IGluIFJUQy4NCj4gPiA+DQo+ID4gPiBC
YXNlZCBvbiBQTUlDIHJldmlzaW9uLCB3ZSBuZWVkIHRvIHNldCB0aGUgb3NjaWxsYXRvciBiaXQg
aW4gUlRDDQo+ID4gPiBibG9jayBmb3IgUE1JQyByZXYgYTAgYW5kIHJlc3Qgb2YgdGhlIFBNSUMg
Y2hpcHMuDQo+ID4gPg0KPiA+ID4gT24gUE1JQyByZXYwLCBvc2NpbGxhdG9yIGJpdCBpcyBpbnZl
cnRlZC4NCj4gPiA+DQo+ID4gPiA+ID4gPiA+IElmIFhJTiBhbmQgWE9VVCBub3QgY29ubmVjdGVk
IFJUQyBvcGVyYXRpb24gbm90IHBvc3NpYmxlLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiBJUlEjIChvcHRpb25hbCkgZnVuY3Rpb25hbGl0eSBpcyBzaGFyZWQgYmV0d2VlbiBQTUlDIGFu
ZCBSVEMuDQo+ID4gPiA+ID4gPiA+IChQTUlDIGZhdWx0IGZvciB2YXJpb3VzIGJ1Y2tzL0xET3Mv
V0RUL09UUC9OVk0gYW5kIGFsYXJtDQo+IGNvbmRpdGlvbikuDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gSVJRcyBjYW4gYmUgc2hhcmVkIGJldHdlZW4gbXVsdGlwbGUgZGV2aWNlcyBzbyB0aGlz
IHNob3VsZG4ndA0KPiA+ID4gPiA+ID4gYmUgYSBwcm9ibGVtLg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gT0suIEhvdyBkbyB3ZSByZXByZXNlbnQgdGhpcyBJUlEgaW4gRFQ/DQo+ID4gPiA+DQo+ID4g
PiA+IFlvdSBjYW4gc2ltcGx5IHJlZmVyZW5jZSB0aGUgc2FtZSBJUlEgZnJvbSB0aGUgaW50ZXJy
dXB0cyBwcm9wZXJ0eQ0KPiA+ID4gPiBvZiBkaWZmZXJlbnQgRFQgbm9kZXMuDQo+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+IFRoZSBib2FyZCwgSSBoYXZlIGRvZXNuJ3QgcG9wdWxhdGUgSVJRIyBwaW4u
IElmIG5lZWRlZCBzb21lDQo+ID4gPiA+ID4gPiA+IGN1c3RvbWVycyBjYW4gcG9wdWxhdGUgSVJR
IyBwaW4gYW5kIHVzZSBpdCBmb3IgUE1JQyBmYXVsdA0KPiA+ID4gPiA+ID4gPiBhbmQgUlRDIGFs
YXJtLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBBbHNvLCBjdXJyZW50bHkgbXkgYm9h
cmQgaGFzIFBNSUMgcmV2IGEwIHdoZXJlIG9zY2lsbGF0b3INCj4gPiA+ID4gPiA+ID4gYml0IGlz
IGludmVydGVkIGFuZCBpbnRlcm5hbCBvc2NpbGxhdG9yIGlzIGVuYWJsZWQgKGllOiBYSU4NCj4g
PiA+ID4gPiA+ID4gYW5kIFhPVVQgaXMgY29ubmVjdGVkIHRvIGV4dGVybmFsIGNyeXN0YWwpDQo+
IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
