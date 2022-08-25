Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE2525A11B2
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 15:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242439AbiHYNQN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 09:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242433AbiHYNQK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 09:16:10 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8A1A6AEB;
        Thu, 25 Aug 2022 06:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661433366; x=1692969366;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Xs5EgiE7wOLJ42QoKcluU9cCIwYa9Viql62RbcX7AS4=;
  b=hMDKhbiQ46oRIpD6z4ercuRaWJAqA6kSbVRCpe6lBDLWTVqHJROP33Ad
   j3VftRuV/8sbGNJr4HJmOIkS8xZ+5zh8uSm2e5A+lKqhUbuNn32lvYM3D
   1ZwBe6zkp2hCq+Ejw1SZL2wrQLEvoLyPc2grRTrWutARiqQx+GiYm4YCP
   nZ6YMKc8RLPira+R6AitnEhNJD8UThyijUuGO37KpoFaPyT4GkrU4k1W/
   Cwq83pseX/mzGXJOsUlzhdsBDDHzbtxK0bE1RGA3s7tVNGVbQSIOr78LJ
   nTohffH5HQ/1K/I336djLkvP8C7GcdMUKa8i1C0/hNZ2nzXgp9RorboH2
   w==;
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="174128042"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2022 06:16:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 25 Aug 2022 06:15:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 25 Aug 2022 06:15:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek5yhto+VvSi+ZN+I38FWZwrmDeyAXuxnhxnAdYW2hHqo0uCKxOxHY7K50JHiNx63JSdY/3wjMhNijGWRY2vo60XRXLwznRzp6zup2ABnLkF+S3t4pziczNSlC/qZjc4cPRbsKGhES9EVaRYcoSBfLJ02p7kh340vI5g2oKB7SozumZGN1ZZh2xHItSUnt/cS4pCMZqO6CqQsXPjPRFwIaOhREgC4QYyL7zTiBYUulTr4/+ZXcCxTT4rPzHQQlmt7un1MkknWSePWVlsuFomU7sqjyM+h4SM3nIe6KMsbzW/wvL/JG1sulAiJJt2UFs11fP5AsedqMnym/oVjGU/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xs5EgiE7wOLJ42QoKcluU9cCIwYa9Viql62RbcX7AS4=;
 b=PobjaOOtuWf8yazgwbJAzteN51x/c2/LDQ+Kvi2gsxvLcl7cfHHxA6py2b72ze7kPBrcw76Rol5XADo+BPAA54rIq8iavDIJNlAiAZ+verOv5XZE6J/CxsA8KzeUdCbAxuS18d5oWvLenL0pzfNnIIpNEdnvKotmmA0qRdq6tSo3kRww0pAo+8XFp4drKpXsvmzlpWCflL+b1M7x9WokrlzvGkbpRTeKlNaOpvOzUX3zOqCxuzyNsjGsl7vBEHkj1kE1N/py5nkO0fgenRP15EVyZ1zjzcHoAQRA4WtGJgv9eNZlpW1Y9cK5TUpFZbR4DLkFrU+UHaPl5o9GZjHZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xs5EgiE7wOLJ42QoKcluU9cCIwYa9Viql62RbcX7AS4=;
 b=csbHZHntkwgs29q3F4Oixm+ct/6/WlqaDMd2mZljcmRcSuOULzdfBjUptTJi9KRpxmyop6+54jnKqiTslo+gNWKsdbPoMTPXHrFVRaVaIJSCAYGDQg3m/7jOdLtM6AS5C++8bYX3ol6XaeMqpSJhOT2+A3MhLIt+fNbz54bBG9A=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by MN2PR11MB4061.namprd11.prod.outlook.com (2603:10b6:208:136::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 13:15:43 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 13:15:43 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andy.shevchenko@gmail.com>
CC:     <jsd@semihalf.com>, <wsa@kernel.org>, <krzk@kernel.org>,
        <sven@svenpeter.dev>, <andriy.shevchenko@linux.intel.com>,
        <linux-kernel@vger.kernel.org>, <semen.protsenko@linaro.org>,
        <robh@kernel.org>, <olof@lixom.net>,
        <UNGLinuxDriver@microchip.com>, <jarkko.nikula@linux.intel.com>,
        <arnd@arndb.de>, <linux-i2c@vger.kernel.org>, <rafal@milecki.pl>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYttI9ItE0vA92WES0jroLXsIOYq28lckAgAGLSYCAAEDGgIABOm4A
Date:   Thu, 25 Aug 2022 13:15:42 +0000
Message-ID: <787644272b3b260980ff8b9efc317ce3194b0acc.camel@microchip.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
         <YwTsnCdxM5I6BoJu@smile.fi.intel.com>
         <80debd4bbf819cbfa16681172919436df476558a.camel@microchip.com>
         <CAHp75VevAifCp_Bz5HN1MmGm7UEJWFR017kngzARfBh+Z8aAAA@mail.gmail.com>
In-Reply-To: <CAHp75VevAifCp_Bz5HN1MmGm7UEJWFR017kngzARfBh+Z8aAAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd203448-c2f2-4d70-204a-08da869bea0c
x-ms-traffictypediagnostic: MN2PR11MB4061:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7HHHKkAhEImSDWYYM28sYX3ftOeYg2pwbll8+HFMXBBFdYpG05upibmsmM6Oez/wmIt4oIMQXzdPJ9IKSZgW6z2L4Cxg620QyeHEzBqXVuoLN0TwGkvt9dFmc5aJ8KSgsDjqdUgri8zF3OPxny7/3GFsjemw1nLOAW5QRL7IbM41l4WedjvNwH78JotJFiKGusElhG5GeDNplaz8khy58z0XiyYfDMoOs5cjeILueyAzgUCEy52yJxHorYgH3NzFlLroG6qOxVizFkPDpEMYisb7DPkHEOnWfBzNbggdD3PqfmgMDyXhBQ7nKtOrgBOzDAdn+wSb9ssR8guEpDdxS3BTUAMEyhJU8tXZeeEi2BFPv7IthkNXHCq5r3/medZlvPuf3N0534SN6S/zo4BM1ImJfXUvM3UbPtZoNNEhE2Fg3eaac5AxoeDY5Fc4csfl/EiQz7uiPX73npFRVdbvfah+4wzfuUH78IjYFynsn1p7cXdLJbrsFfjk5psTAKCY3oZAPOeqPvO/6hW4VFqlCCkm9QRtZWyJXUKzsdn5IDMapjliFTG1yzEqXjGYGOEnDgf+mzZGUkKfhphwBfIHKCP+KJLgg8+oUr9+IVR9cKzXH7htFcOve9v2QzwHtZo1vrl2Nw6ZNxp7SfkKLEyeexehNUxOSsJU4W1SajwBVlUoUykSnMy24hNZXczWgYr9k/421A4LKpW/R+qe5hI56P9UFBNJPuQZlDX3kycDUkDKP+X+kKQU41ntRZrOcWVRWCOn9eSSRgWUbxsFQOM7j6va7f6tzbXf7vqRelJ77vk8zv9gMD8+qWcP1q5yR+ET
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(376002)(39860400002)(366004)(396003)(122000001)(7416002)(2906002)(478600001)(2616005)(6486002)(966005)(71200400001)(8936002)(83380400001)(36756003)(5660300002)(66556008)(86362001)(66476007)(6916009)(186003)(64756008)(76116006)(91956017)(38100700002)(66446008)(66946007)(53546011)(54906003)(316002)(8676002)(4326008)(38070700005)(26005)(6512007)(41300700001)(6506007)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0ZxdDNQMk1VakdNak1EYnJyalFEVFc5MlhHRVFTWlJqZnVoQ3BEMDZoM1dL?=
 =?utf-8?B?STc1U2dhMm9xSGxEQ29TdzE2SzFVaW45Wk1BQlgxc2NZYndndE8yeW45NlRs?=
 =?utf-8?B?RmdYN3NpMmllOFJCRmsvb0tkTC90SlFKYktiZE9ycXhlQVR3NHJSRGhlblFJ?=
 =?utf-8?B?RjVKOVpBbW5aSW5SMUNRWDRVZUdYMTF4UWJvdG1FZ2FkTTdZT1NQRk1wQlBz?=
 =?utf-8?B?T1FyTTM0eEpJUGcvR3Vjbnh5ZHRRVExYT3MyV0tITm5mTGVsZi9vRFhwTUdO?=
 =?utf-8?B?dk5QTG41ZmtvbGNpNzh0Ym9aVFlHd0tEaUIwdmI4cElGT1NPazlXcWJ3Umpw?=
 =?utf-8?B?dlp6N2tFVXp0bzF1OG1rditrTEloS21mOHhPaG1STmNxZ2pPOSs1WjJDOFZ1?=
 =?utf-8?B?SlIzRFE2a1VLWmpDUzJoSmpJZXR2V2hJRUV2Zk9iajVIUThHRVYyTlAvTVUx?=
 =?utf-8?B?anNqOENvVDFnamdubktPSDQxdGJiZkpUQ093WG8zNmlCeXB1cFBCT2VzMzJr?=
 =?utf-8?B?WUxWaTYrZWx3UWxwaWF1UW9NdXZZYkx5a1BBS2NTd2VYcUdVYnFNbE83ZzJn?=
 =?utf-8?B?Z3pTZC9kajV0QWZqeUc4TEM5VU9nQjBxOWdYS3JEcTE4b1JBR3ZGRW5tcTl4?=
 =?utf-8?B?OWxCYjNSam5QSHNnYkg2T1d3WVB1RDNmcUJjV1pzMHN3Tmh2N0xFenZpazZD?=
 =?utf-8?B?dHZwSm1jT1hyNTd4Y1BWWmo5UEQxV3E4TnlmbFJGaHdaeTVFaEdoaFE0ZzJC?=
 =?utf-8?B?dzBjNmlORkhrbE92VWhXSm0xL1gwaEIyVmxmalY1Z3Y4MmlwYkJYNWZ4ejh3?=
 =?utf-8?B?ejdqUlFjaWpVUlFTNXVDY29KNXRmYVBST0xQTEp2YnowbTBZLzErZnBKN3M0?=
 =?utf-8?B?OWV4VjlrZGhvbDZvMkdLU3pLbkh4UDJMMGhOd3dJUFltcXRmQU5pZjdVOGpD?=
 =?utf-8?B?REorM1paVjZxeEhlZnBkaEd1ZHZ3aFV3TUlWN24yL1lPR0lDNUN1YzBRQkhH?=
 =?utf-8?B?T2ZiaVNrYlFJRlJ2NmJ3WEl2SFNNTm82TkNRVEthWjA0YWtURDZncC9WcjZI?=
 =?utf-8?B?L1NOV013bG1Hd1pJV3RuM3pSNG12MmNXR3V5YXFnTXhrSHhjUkw3UXlhRnVp?=
 =?utf-8?B?LzgrZE5pT2o4ZThiZUo0Njl3VHdXUXdlKzhqbUFFeFFwaWhnOUsvQWNSYkwz?=
 =?utf-8?B?TDV2YVVWMjdIOWtVb0REMTltYVU4Z1NBd1BkaUhkY3A5K01CRW9neTU2b051?=
 =?utf-8?B?QWp0bndZYlI2MzFFNVZkQVFnZVhWTTdGbFJhVkNOUS8zU295UVUvc0IwWGFZ?=
 =?utf-8?B?M1RieEVxand0TVhrTHduaGlUZjU1UHcwcUo4bmZTdktpc21MZGptWW5kZS9D?=
 =?utf-8?B?bVdnSE9WcEFPUVorMFEremNja05pRmFTYjlSQmYwcHgzUGwxdkRvUVNlY3FN?=
 =?utf-8?B?Z201Skdta2JmOU1VdWFtQ1VjcEVOVGlNeHovN0Z2YVdHQVlCZE93c0dyeG1B?=
 =?utf-8?B?U21GWFFkV0RKWGZiTWdIREdSYWRMUlFOMXE5VHBUaUc5S1JnUkFXNkpVVWcw?=
 =?utf-8?B?cXBEYkJzanhKeU92ZEZDNFl2a1ZFQzFQQUViR3lpbFhLaVdnV0U2Y2hvZHVG?=
 =?utf-8?B?MnpZQ0ZCRU5zL1lzdWdLczZrMHBlcGJsMTlWSUxkUjYzSU5GTldQd1JZNFJY?=
 =?utf-8?B?T0ZYWG1NQTFFL0VOY05EalVLZmlVbzBwZER4SE05ekJ6S2xqM0lRdTI3OG1W?=
 =?utf-8?B?bzRONm9FbVozSkZkUElSR1Zvb0xKc0hOa1NrTXhEVVdDU3E5UTlvRnJPK2NJ?=
 =?utf-8?B?L2o4SDJjSXU2WnZOT0dTalArNW5rL3dFU3FNbXNCUUV5YWloejBHMm10SHFP?=
 =?utf-8?B?Q2xWNjcyMS9oM2FyZTIvcWVpUHl1M01qTkpWV0ZweWV1MTZyS04rc2VuTGVx?=
 =?utf-8?B?eW0zYzRqbE44Uyt5QjZTaSt5ZGMzRW4wL3daQi9EZnAzbnAwZkdyekgzWUhv?=
 =?utf-8?B?bFBJNTBXTENWT2JxRFg2Qkp5WjZtTGtrWU94VFk3ZDZKSHhEVVZ1TDBLZTM0?=
 =?utf-8?B?WUhKWm5CeThyQWM4ZEdHQXZWQ2NiZGNTS0kwUHZ1Q2Fld0JVcGtDS3VNNXZX?=
 =?utf-8?B?cm8wclNOYjJrNGp4NmZEQmU3NjFTakJ3WTRYNlBXc082VFVxMzZxUHNKV3BQ?=
 =?utf-8?Q?C/0SeGr8Cbne8DNSOHl4nn2MJfNLd8F2L4+5XQFoUYEl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31F2C8CDA1B2A048B5633BAC818D4931@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd203448-c2f2-4d70-204a-08da869bea0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2022 13:15:43.0593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: liYSiySAJZuC3t8tPkXi0YmVNG5KpI8j++A57Enu8xzen8kanYTeQ5xJtci7DguUge29YTYOGQY6Gq5Zbu1WOu6ThSXEFV2dAHl9cOe2cuMk0Xly1jXLOjuaas0hfwE2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4061
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIyLTA4LTI0IGF0IDIxOjMxICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IA0KPiBPbiBXZWQsIEF1ZyAyNCwgMjAyMiBhdCA2OjA0IFBNIDxUaGFydW5rdW1hci5QYXN1
bWFydGhpQG1pY3JvY2hpcC5jb20+IHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyMi0wOC0yMyBhdCAx
ODowNSArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4gT24gVHVlLCBBdWcgMjMs
IDIwMjIgYXQgMDg6MjY6MDNQTSArMDUzMCwgVGhhcnVuIEt1bWFyIFAgd3JvdGU6DQo+IA0KPiAu
Li4NCj4gDQo+ID4gPiA+ICsgKiBBdXRob3I6IFRoYXJ1biBLdW1hciBQIDx0aGFydW5rdW1hci5w
YXN1bWFydGhpQG1pY3JvY2hpcC5jb20+DQo+ID4gPiA+ICsgKsKgwqDCoMKgwqDCoMKgwqAgS3Vt
YXJhdmVsIFRoaWFnYXJhamFuIDxrdW1hcmF2ZWwudGhpYWdhcmFqYW5AbWljcm9jaGlwLmNvbT4N
Cj4gPiA+IA0KPiA+ID4gU2luZ2xlIG9yIG1hbnk/DQo+ID4gDQo+ID4gVGhlcmUgYXJlIDIgYXV0
aG9ycyBmb3IgdGhpcyBmaWxlDQo+IA0KPiBEbyB5b3Ugc2VlIHRoZSBpc3N1ZSBub3c/DQoNClll
cywgSSB3aWxsIGNoYW5nZSAnQXV0aG9yJyB0byAnQXV0aG9ycycNCg0KPiAuLi4NCj4gDQo+ID4g
PiA+ICsjZGVmaW5lIFNNQl9DT1JFX0NUUkxfRVNPwqDCoMKgIDB4NDANCj4gPiA+ID4gKyNkZWZp
bmUgU01CX0NPUkVfQ1RSTF9GV19BQ0sgMHgxMA0KPiA+ID4gDQo+ID4gPiBBcmUgdGhleSBiaXRz
IG9yIG51bWJlcnM/DQo+ID4gDQo+ID4gVGhlc2UgYXJlIGJpdHMNCj4gDQo+IFVzZSBCSVQoKSB0
aGVuLiBEaXR0byBmb3IgdGhlIHJlc3Qgb2YgdGhlIGJpdHMuDQoNCk9rYXkNCg0KPiAuLi4NCj4g
DQo+ID4gPiA+ICsjZGVmaW5lIFNNQl9JRExFX1NDQUxJTkdfMTAwS0hawqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgMHgwM0U4MDNDOQ0KPiA+ID4gPiArI2RlZmluZSBTTUJfSURMRV9TQ0FMSU5H
XzQwMEtIWsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDFGNDAwOUQNCj4gPiA+ID4gKyNk
ZWZpbmUgU01CX0lETEVfU0NBTElOR18xMDAwS0hawqDCoMKgwqAgMHgwMUY0MDA5RA0KPiA+ID4g
DQo+ID4gPiBTaG91bGRuJ3QgdGhlc2UgbWFnaWNzIGJlIGRlY2ltYWxzPw0KPiANCj4gVGhpcyBR
IHNlZW1zIHVuYW5zd2VyZWQuDQoNClRoZXNlIG1hZ2ljIG51bWJlcnMgbmVlZCBub3QgYmUgZGVj
aW1hbHMuIENvbmZpZ3VyaW5nIHJlZ2lzdGVycyB3aXRoIHRoZXNlDQp2YWx1ZXMgaW4gZHJpdmVy
IHdpbGwgc2V0IHRoZSB0aW1lIGluIGRldmljZS4gSG93ZXZlciwgdGhlc2UgdmFsdWVzIGRvIG5v
dA0KY29udmV5IGFueSBtZWFuaW5nIHdoZW4gcmVwcmVzZW50ZWQgaW4gZGVjaW1hbHMuDQoNCj4g
PiA+IERpdHRvIGZvciB0aGUgcmVzdCBzaW1pbGFyIHN0dWZmLg0KPiA+IA0KPiA+IFRoZXJlIGlz
IG5vIGRpcmVjdCBjb3JyZWxhdGlvbiBiZXR3ZWVuIHRoZSBoZXggdmFsdWUgYW5kIHRpbWUuIENv
bmZpZ3VyaW5nDQo+ID4gcmVnaXN0ZXJzIHdpdGggdGhlc2UgdmFsdWVzIGluIGRyaXZlciB3aWxs
IHNldCB0aGUgdGltZSBpbiBkZXZpY2UuDQo+IA0KPiAuLi4NCj4gDQo+ID4gPiA+ICsjZGVmaW5l
IEkyQ19ESVJfV1JJVEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMA0KPiA+ID4gPiAr
I2RlZmluZSBJMkNfRElSX1JFQUTCoMKgwqDCoMKgwqDCoMKgIDENCj4gDQo+IGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjAtcmMyL3NvdXJjZS9pbmNsdWRlL3VhcGkvbGludXgv
aTJjLmgjTDI0DQoNCkkyQ19NX1JEIGlzIHVzZWQgaW4gZHJpdmVyLiBCdXQgdGhlIHB1cnBvc2Ug
b2YgdGhlc2UgTUFDUk9zIGlzIGRpZmZlcmVudC4NCkkyQ19ESVJfV1JJVEUgaXMgdXNlZCBpbnNp
ZGUgYm90aCBwY2kxeHh4eF9pMmNfd3JpdGUgYXMgd2VsbCBhcyBpbg0KcGNpMXh4eHhfaTJjX3Jl
YWQgKGZvciBzZW5kaW5nIHNsYXZlIGFkZHJlc3MpLiBUaHVzIHRoZXNlIE1BQ1JPcyBhcmUgcmVx
dWlyZWQNCg0KPiA+ID4gTmFtZXNwYWNlIGNvbGxpc2lvbi4gRG9lc24ndCBJwrJDIGNvcmUgcHJv
dmlkZSB0aGVzZT8NCj4gPiANCj4gPiBJIGFtIHVuYWJsZSB0byBmaW5kIGFueSBleGlzdGluZyBN
QUNST3MgZm9yIFdSSVRFIGFuZCBSRUFEIGluIEkyQyBjb3JlLg0KPiA+IEtpbmRseQ0KPiA+IGxl
dCBtZSBrbm93IHRoZSBNQUNST3MNCj4gDQo+IC4uLg0KPiANCj4gPiA+ID4gKyNkZWZpbmUgUENJ
MVhYWFhfSTJDX1RJTUVPVVQgMTAwMA0KPiA+ID4gDQo+ID4gPiBVbml0cz8gU2FtZSB0byB0aGUg
cmVzdCBzaW1pbGFyIGNhc2VzLg0KPiA+IA0KPiA+IFVuaXQgaXMgbWlsbGlzZWNvbmRzDQo+IA0K
PiBTbyB5b3Uga25vdyB3aGF0IHRvIGRvLCByaWdodD8NCg0KWWVzLCBJIHdpbGwgY2hhbmdlIE1B
Q1JPIHRvIFBDSTFYWFhYX0kyQ19USU1FT1VUX01TDQoNCj4gLi4uDQo+IA0KPiA+ID4gPiArI2Rl
ZmluZSBTTUJVU19QRVJJX0xPQ0vCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQoMykNCj4g
PiA+IA0KPiA+ID4gQklUKCkgb3V0IG9mIGEgc3VkZGVuLiBTZWUgYWJvdmUuDQo+ID4gDQo+ID4g
V2lsbCB1c2UgaGV4IHZhbHVlIGZvciB0aGlzIGxpa2UgaW4gb3RoZXIgcGxhY2VzIHRvIG1haW50
YWluIHVuaWZvcm1pdHkNCj4gDQo+IFNlZSBhYm92ZS4NCg0KT2theS4gDQoNCj4gLi4uDQo+IA0K
PiA+ID4gPiArwqDCoMKgwqAgcGNpMXh4eHhfaTJjX3NodXRkb3duKGkyYyk7DQo+ID4gPiANCj4g
PiA+IERvIHlvdSByZWFsbHkgbmVlZCB0aGlzIGluIC0+cmVtb3ZlKCk/IEkgd291bGQgZXhwZWN0
IHNvbWV0aGluZyBpbg0KPiA+ID4gdGhlIC0+c3VzcGVuZCgpIC8gLT5zaHV0ZG93bigpLg0KPiA+
IA0KPiA+IHBjaTF4eHh4X2kyY19zaHV0ZG93biBBUEkgd2lsbCByZXNldCB0aGUgcmVnaXN0ZXJz
IHRoYXQgYXJlIHNldCBhcyBwYXJ0IG9mDQo+ID4gcGNpMXh4eHhfaTJjX2luaXQuIFNvLCB0aGlz
IEFQSSBpcyBwcmVzZW50IGluIC0+cmVtb3ZlKCkgYW5kIG5vdCBpbiAtDQo+ID4gPnN1c3BlbmQo
KQ0KPiA+IGNhbGxiYWNrDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhhdCwgYnV0IGl0IGRvZXNuJ3Qg
cmVhbGx5IGFuc3dlciBteSBxdWVzdGlvbi4NCg0KSSB3aWxsIHJlbW92ZSB0aGlzIEFQSSBpbiAt
PnJlbW92ZSgpIGNhbGxiYWNrIGFuZCBhZGQgaW4gLT5zdXNwZW5kKCkgY2FsbGJhY2sNCg0KDQpU
aGFua3MsDQpUaGFydW4gS3VtYXIgUA0K
