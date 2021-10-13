Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5530342BAD3
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 10:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236460AbhJMIv3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 04:51:29 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:11224 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbhJMIv2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 04:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634114965; x=1665650965;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=0UBjeWozYfP4FaGUAH0Bt9QTRpP/qw16DOu/H1Wy3Wc=;
  b=STrJSRoPXebgskhuN/kZKcTd5rlskUEyv3jm6MDcctaLxYZSrwceQbvX
   X100BydMLS9R/xUnzLcibaoYFw8nRbixx5mTmdnxYhhKpgQHnTNslXPeV
   ksQ+Ttss0eGYs9MAi8w45KcukGJ7C0OJb0V/g6xZ610tfNJY1CVSEaFM7
   G5oJO6rCNIJJ+wS2AJCUScdorCx3opnT3vYxQ3rrYCYUzTSNcio4+eNCt
   s3meZYjSQ6TrxG/LVihMEu+IBhovug7gkXSFzTBS0e0CBlFiMIydw7aqW
   jxhGdDW0+bZt2Tmy7Yt3euQOSE9U1ut5kA5fc3Y/t/L1L/75HZ94+sIlN
   A==;
IronPort-SDR: izofhjbrdmKFWrFPvFn6GjCKK+aOvWm/527WD5Sf2muZcuhvrRL7KZg66qg1Kbp9cYJnNVWPsX
 yLsDNevVL4OD5FztPnzq7s9CROYdX6U5bN9I3UayKd9k/EwqdS4pM/QlGQBUVOn2Q7LId5tonN
 7sYvsMoWraJ+Nkt1H1x4hHzfldV7NuRYiRU5arMeZWS/Wt6PPu8PEObMt3PESxZZ9FMnu5sNDs
 bePDlflfJQmWKei5wCT1CsNP+vD8HmrvrT1MQjFi+8EWSuXa1EMAIYBe7+FZG22ZJWNQ3GzX9o
 T+QzvWWLp6PJRK812MxL2eAa
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; 
   d="scan'208";a="147905707"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2021 01:49:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 01:49:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 13 Oct 2021 01:49:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMdotS62/AyNMYsv2i41Kg1q/T3TS0IghQfKt413f6bymjT9pTHLS33oPrY1+lulG1Jmp+SnO3xbL+8VZbPLMjZpS9q2OBCFGV2KYXzdwYYlqFs3vlLGBlH5idim5Ml2BO4z3MReGzJQdQQly41ePcGWepm/xsVpRo1h/GbNY1QBybsZL98OS3q1f93au1pLXwiB0vybh0hDJVdHXuOartPX7SpuH3AYTzeVU9C2ZS0zDi9DlRYVeapXBG846Kr6Jq4Klf/v/0mVqzkbiyVqX59+MvEDI9sBrEPu7a5o5LZaFBf+HcBg1D+BHb4SM3CltrC9VEoDj+TmI18qdJNZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UBjeWozYfP4FaGUAH0Bt9QTRpP/qw16DOu/H1Wy3Wc=;
 b=GbakvovYUgcpu/XTLgn2W5AN5J3xLBd3ra73rgBjuZeZ4S6seMEYpS/Ld9aAfwIgJkEQ4AE54PUrlnTQ3zWkHsffkV7TtvHn8WjgOq8pRx8TZS2OQhPiZJja6V11RWzma1jzABncfY40VXy8e8mS12II1h8anPL3J1P3CRouxgyskmcZYRdq37mdzZQAW5a8nflkDCTjRYEuvtD/T5gXFGiv9PkFLyEoytQINhp+CMuzeNmpVFFIRU3qdef+x7zZgsSUNoi6E2UCxJ0Dkz5tfYJgdrP2RbHvN0y2cJZVJK8GzTpvQpIkDoIxf5o25XXfEWMw+Jm3CPUATJPaxJKqSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UBjeWozYfP4FaGUAH0Bt9QTRpP/qw16DOu/H1Wy3Wc=;
 b=G4IcHSPZ/sBbUXibateSguUU+spFzfiH8MCX7nR7aJhn5Yb0k/EZCEE8eDPqGjGN4k78XAfAEb0zSgCyxJ2m4sSrOak254lh/dkE9M0iGYf3O9sU8ch0IuqhdZQmSLtPywTPj+ch4giyIGSeNIe3mCPeMT1EXevxlnF4RwAXIiM=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM5PR1101MB2169.namprd11.prod.outlook.com (2603:10b6:4:51::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25; Wed, 13 Oct 2021 08:49:20 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::50fa:94b5:51bc:6409]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::50fa:94b5:51bc:6409%9]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 08:49:20 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <Horatiu.Vultur@microchip.com>, <robh+dt@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Thread-Topic: [PATCH 0/2] i2c: at91: Add support for programmable clock source
Thread-Index: AQHXv3JagbJxWnjRXkiEtRVe8te35qvQn4gA
Date:   Wed, 13 Oct 2021 08:49:20 +0000
Message-ID: <8a775c67-00a3-1dbe-daa3-09a537f482d8@microchip.com>
References: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
In-Reply-To: <20211012140718.2138278-1-horatiu.vultur@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e729f836-5e3b-4f37-3ccc-08d98e265947
x-ms-traffictypediagnostic: DM5PR1101MB2169:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB2169291CCE8F901698F16093E7B79@DM5PR1101MB2169.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ++dEEp1HmeK+57HJzqUdgmjATmoj9+n3xfgleZf6KwrcFu6vAETsXDbHKIZIhsOkk61w49n61EmSTiREmCtyhLLfiIUDe9OA2m9NGotgK1mrguDMX/F3voIONHgWm1pZlsT0kcHAu5bSuKEbwYUZOAjtcdxb2rCDIPWW/vIn/IDZEbdXBs3Z7qBDc0uMtMNYmEaodILI1inDt6DTaIEnm8rbjIOmWk8z+dYjBvvuLR8g2fqAngpJVZU2wIUJ+AF1NTBGX6yixSs9INA4eujWSlsMklqIqmVRZJn/18cXl+Xe4cPn9CLf8+RfC5tchnY+hfsYX1kA9Ogql16dAONmZJhuP94ZlV2V5o70GeXMukgKxbpx7Bt+fBk3opIMgKOjMuIYwqKd7uZZAOFWABPBaPqmnDdJpZ2Vb5tzS+dvm3hks9POFO1H9Jr5wilGGUvgxjg9DDhL0huMoIbrueq5BQNifmOoPwHLSUlPYADQWMwQU7PVXAxfy3ylLmGtYJgfz0+C4/eP7QWNPO9PFwicz2ElgxNe50lbDE/C/TisHXxVMPzW0dxCj2b/s96BKApSqzO+mzSpHCYFezrg45Fl+y42zDW6/TD/smkAuWB3GykT0yUCCkQ1p20SXgOHmuZEpVWx0mJLK+JighgtMGyAHNGNzFucQbWR3iKFyMQHs1IMIH/tjZqe8amrGRJgJd3E38YfyCGvb8rqR84r4m81EZp2HOHfzpcO8jG0XT+nPUyL7JsBcjpuvhmcUiz2lgE82soyHDx2wok/PuOEqa4LbA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(83380400001)(38100700002)(122000001)(6486002)(86362001)(8676002)(66446008)(6512007)(38070700005)(5660300002)(508600001)(316002)(64756008)(31696002)(71200400001)(110136005)(186003)(91956017)(53546011)(66946007)(66556008)(66476007)(6506007)(2906002)(31686004)(8936002)(76116006)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aW5XRzN4ZkxaSXpJMnJWRTgzQTN3Y1cwVjBCVUVyUzdEanBlMnREakFzMWlO?=
 =?utf-8?B?RzlpU01ISHdoNlVLRnk5R05xckZOVUZDM2lFc2poNTdzUnhLM2kvMm1yVXQ5?=
 =?utf-8?B?eUd5QXMxVERSdUN4T2k5M2ljS0ZSZnl1NVArYkd1SHpyc0swaGJ4dGlSa2tG?=
 =?utf-8?B?U0dmM0RYSC90SmVlSm1QVDhCVkIwVHpGcjA2bTU2K3hLQmlZc3d0QXVOZUU0?=
 =?utf-8?B?VkJ5SVphajVjVm5pcHVoeVZqMGR2elQ5c1N0MmlkdDNjaldKVTVXZ0t2cVc0?=
 =?utf-8?B?TmF6aHlqTGZIbEpzM1J4NTErd2hDQzhXaVA4NTFoMVpZVno0WGhKZDVLaFQr?=
 =?utf-8?B?MmprczNiR3c3T05kQkRzL2hWbCtKd0lURktMTmtsT1FxRXJERW1zekNoZnZS?=
 =?utf-8?B?SzNHZTljaHNvRG1LTmZaV1Z5Z0lQTk41NEVMYXBRQXVDY1JaYVJkcjRQK2ZW?=
 =?utf-8?B?Q2xBRFZ2TUg0bm9CY1NIMDNSUkc2NEtBNE5rSktkQk1Pb3RVcnBjN0Fvd2N1?=
 =?utf-8?B?b3lBVVFRd2VjTzFBWnovdktwY09KVkNlOVppZkhyRlFkdDFPc1AzMjJlVy9M?=
 =?utf-8?B?RHpzMDdDVHpzWjgvL0xwVTlFc2NtTXNwZWE2NEtNWDI4L1d0MWsya0M2bGdt?=
 =?utf-8?B?bDBpdE1odkk1T2dnS0JXa1dYRzZMMENQTWpZbEpkV2JOQ2RxQThKM3dhU3FX?=
 =?utf-8?B?ajFKVE1UMzVJNWJaVzV3Z2RZSWV4UmIyQys0NURFMlYrTTZNOGhUaVE2bFBU?=
 =?utf-8?B?Slg2UGRJODhmVjE5d3RqK0xzNEcyUlo4dmtkRUVod1ZrNVZjelJaUFQ2UERX?=
 =?utf-8?B?L3JLYW9vQ25ZK2hGNUMyTzhaZVhKRy9VMk1kelREaGhOWjlHeFJVdnU3R0tP?=
 =?utf-8?B?RVA0cWRPNWVSNXJpQmNqNm02Yk0wbWNmaDFOMGltY09RQVdkY1owMXp3dkp1?=
 =?utf-8?B?Q24vOHBobHVNcTN0dmk5M05iR2pMTGNGTG9vdTRtRk9KU3lNWjhSU085UVZs?=
 =?utf-8?B?QThEL0VvV1dMM2sxMlpQR3d6cm91N2xic3c4aFVqSmNwK3JmMCs3cy9jSGUv?=
 =?utf-8?B?QlA3bjdJRWl6ZVMvRWFLZURxTXBPaTY5eDlCZlRJbHgxRTZ1MStDR0pMdHI4?=
 =?utf-8?B?aHFqZm1QOCt0RGNvS2JoRjZ1ejZoQlE0TmgrUmJoWWZGQ1Z6djJ1U25SOFdT?=
 =?utf-8?B?aTZMcHZJdFYvV0FlZ3dyOWxMWWJTVnpTL1J4cDBHNGRIc2ZhdnFvaTg2UUps?=
 =?utf-8?B?ZGVsaHJxbzVXMWZiS20wOGt4Q1JmdS8vUDd0NjVUaXFOT3JJMElaNG9wVVc2?=
 =?utf-8?B?UmlYSERHdGVkT256UTFORnRPNzlPaVpEaHZJWkNVQWNpNk5BWWdOYUNzeFE0?=
 =?utf-8?B?TVdrMW5tS2ZOTEpvV0hvL0wrN2c5ZjFGdTZaREkwZ2NIN053QjVYS2VtY3Zp?=
 =?utf-8?B?bGtlQkpXbnBYNWVXY29DV2ViQXM3MkpaNVhZdmx0ekRhaFdhMWE5MS9nZURV?=
 =?utf-8?B?TlpxTGxXYjdxd2p0d29DU3pkZUpKMHpMOWJwSS8rQysyWHZQdGUxM2pMcHpj?=
 =?utf-8?B?NVZ0aklpelM0UEo5bkkwMmN4NjRmQi85a3dPeTJ3VzJuUVd3OVZ5MTV4Rzli?=
 =?utf-8?B?QzlWcFJINFhNbzJlUEVEekx1SUpWUzMrUjBtUCtUMFA5Vm83WVJsQmpKbkVF?=
 =?utf-8?B?SWh1NjhMT3hBTHIwMmNVb1J2a3BVMC85TUluaENQQ2tXNVNPM3RDUUdDODRu?=
 =?utf-8?B?RngzL2lIR3RySWhGZll4YzZpUXJLdTZ5L0c4dnMzaFhsRFBkazlkSnU1QzM1?=
 =?utf-8?B?aDM4MU0rTUYzclpWTTI5bjJOcnp6Q3dLUERZREVsTmNPaEtHend0dmxYeXZ5?=
 =?utf-8?Q?kkBL3S2Q1M018?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5F2FF34DDF74E499BB58AB0317B9797@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e729f836-5e3b-4f37-3ccc-08d98e265947
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 08:49:20.6780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4YQ/T9wAQ4ScTbOm6TrvPp/KsrgsNBKB2wHHlZxKvNkFmw7znjYhSxj7xUmgViI4dQzh8az4M/4Uq80Qfx2geoZA9Nb3xBE4P3pWFO0X5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2169
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTIuMTAuMjAyMSAxNzowNywgSG9yYXRpdSBWdWx0dXIgd3JvdGU6DQo+IEFkZCBzdXBwb3J0
IHRvIGJlIGFibGUgdG8gc2V0IEJSU1JDQ0xLLiBUaGlzIGZlYXR1cmUgaXMgc3VwcG9ydCBvbiBs
YW45NjZ4DQo+IA0KPiBIb3JhdGl1IFZ1bHR1ciAoMik6DQo+ICAgIGR0LWJpbmRpbmdzOiBpMmM6
IGF0OTE6IEV4dGVuZCBjb21wYXRpYmxlIGxpc3QgZm9yIGxhbjk2NngNCj4gICAgaTJjOiBhdDkx
OiBhZGQgc3VwcG9ydCBmb3IgYnJzcmNjbGsNCj4gDQo+ICAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL2kyYy1hdDkxLnR4dCAgICAgIHwgIDYgKysrLS0NCj4gICBkcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWF0OTEtY29yZS5jICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrDQo+ICAgZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLW1hc3Rlci5jICAgICAgICAgIHwgMjMgKysrKysrKysr
KysrKysrKystLQ0KPiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oICAgICAgICAgICAg
ICAgICB8ICAxICsNCj4gICA0IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pDQo+IA0KDQpIaSBIb3JhdGl1LA0KDQogRnJvbSB3aGF0IEkgdW5kZXJzdGFuZCwg
b24geW91ciBEVFMsIHlvdSByZXBsYWNlZCB0aGUgcGVyaXBoZXJhbCBjbG9jayANCndpdGggdGhl
IEdDTEsgaW4gdGhlIEkyQyBub2RlLiBUaGlzIG1lYW5zIHRoYXQgeW91IGFyZSBmb3JjaW5nIGFs
bCB0aGUgDQp2YXJpYW50cyB0aGF0IHN1cHBvcnQgY2xrX2Jyc3JjY2xrIHRvIHRyZWF0IHRoZSBj
dXJyZW50IGNsb2NrIGFzIEdDTEsuIA0KVGhpcyBpcyBub3QgbmVjZXNzYXJpbHkgY29ycmVjdCwg
c2luY2UgdGhpcyBuZXdlciB2YXJpYW50cyBjYW4gYWxzbyB3b3JrIA0KZmluZSB3aXRoIG9ubHkg
dGhlIHBlcmlwaGVyYWwgY2xvY2sgYW5kIHdlIHNob3VsZCBrZWVwIHRoZXNlIG9wdGlvbiANCmF2
YWlsYWJsZS4NCg0KSSB3b3VsZCBhZGQgYW4gb3B0aW9uYWwgR0NMSyBjbG9jayBiaW5kaW5nIGlu
IHRoZSBJMkMgbm9kZS4gVGhpcyB3YXkgDQpHQ0xLIHdpbGwgYmUgdXNlZCBvbmx5IGlmIGl0IGlz
IHByZXNlbnQgaW4gRFQgYW5kIGNsa19icnNyY2NsayBzZXQuDQoNCkJlc3QgcmVnYXJkcywNCkNv
ZHJpbg0K
