Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D380462E99
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 09:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239623AbhK3IjB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 03:39:01 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:61877 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234404AbhK3IjA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 03:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1638261341; x=1669797341;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ROVkIvQoQzqMhuD20JFf3bk/3xpKm6GRrOWBIIP4rlA=;
  b=t5euwYk7HkTisKnkwgYkxmaL8DkgxeMClqTXscnV+Llms9+zuxXn8Ogl
   GZw9f8gZ+HWbXEB3cR4MaXnQsfKFIm+0fJT+35xFs2ubmvK9FswONFaFr
   JErCRzo9cEW+2YVguwFsW4WFjmNtt8lp7Furz5TQgoAmnVZZspXcPwpTO
   B+WQGULmBI4Ooj1UWywkA3sfr8sy9SR14VhxsicBI3b5wgwn4qAG4rjls
   RplcySjWJGiV2cCS6xUsygWx0UV2SWguaAcvvjCctI/excjtrGqNC5bZg
   d4vL8iXngJC1tZp7XKBghA51kbmfOATHIxCNR6PySgLh8WEYFatFPaDWs
   A==;
IronPort-SDR: MH6TIwLhMRUFxN+DgbfD3YM7eZSKG4BAeJ2xnaQzKjHKTOqStZATsSXJ2dcgGN+iH1nQKLAHeT
 gqzhdBmwFICK/TfRLUm8SbIuP6Ct5BTNO8xLiFRHBUywwx/kR9X02BC5hVdIgYZVSk1tDTeM98
 AxKGszS4fVBJNpcLNYEs66shg5pmDPUxtlNTG/PlWpMGmnQtpQrvndWjOwJSsBjYeoZNgBp4bk
 QgwoDpBnIPxqtP791wre3sALG7rie308T7mYG7S7djyvXBNUBum3J/7dWZAoLwZev8O+c7LC7r
 ZxxGxrUMPXgWqd3dmi6qUgoZ
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; 
   d="scan'208";a="77965963"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Nov 2021 01:35:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 30 Nov 2021 01:35:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 30 Nov 2021 01:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncghz9vdJeFXA1lrul4lieiYGO4uXpAxpxm9OgdPiIQ5Fkr9hEnJZko2afgq6q0jlEF9zTMIA0E8pgivq7CqbqQ62I9cmTq/n9pMik7EN1eCKOEIoFj0hJ3lv66De2/6iHL8RrdO/yYpPZNsqTU/YNhOtZ9KzcDaABmnV55vqsvFmCz69h1VkaBDS5V2l1SLWddieYMimtbuthf2z+qnCW4xoTZOE9H4WZxRiEY8GKK9SvfwgUMenVxc5PvPBfaJj14/YrT63fqrWBgg4zJN26nCMdN2DvoSKgQQ3KCzwJJIHE6U/iAk1zLyPSBPRBvzrItrXtMYiWCF6+WOaLyxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROVkIvQoQzqMhuD20JFf3bk/3xpKm6GRrOWBIIP4rlA=;
 b=mlM5XWv86F8+n8R0NAiRC3cfC0VC4gzWM21kyPq1uN1cH2o+7BH6eaQKQa6vDnFlPxnosb3UHRNYnNKg/Oio21F3bpcdtIb6Vmf8xAOGM2GYyV4fzOSo5w2U6JokuBBXFveTtUkO8QjuxXValWrJNevRV1PGBl3WHcz13nXVRxVnS9kTIefZZtMvtT8JUyikkB+J8qwmdtm8uq+8OfjiTzSDmP925YzXOcQEPgsP9nH2H+YZ5E0HpyffJ+K+q8BPwv0aszLn0VAAUQu5GtzLFUYi1931thsx2fsG6ietbRD1zwbi1G6p51rt3Gk77iyMPRDWYtSkY9n+QuLaeDaLVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROVkIvQoQzqMhuD20JFf3bk/3xpKm6GRrOWBIIP4rlA=;
 b=lobthqbkEEYlQ7buxiNlDZ1Mr8Ot/oMNbFFO4yGdhQwHXNFQPbzHVaV1GjLqN8B2xUGmqOTrhMgxLkHM0LfsAJ20BJPwMG2dQkyQPnO810mx918ob4rGX8A054QBI5wZP53bj5pYasokUUbjG6XGZtJtkbJ5+iGYFQbuPmwGuKI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 08:35:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27%6]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 08:35:34 +0000
From:   <Conor.Dooley@microchip.com>
To:     <robh@kernel.org>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <broonie@kernel.org>, <gregkh@linuxfoundation.org>,
        <Lewis.Hanly@microchip.com>, <Daire.McNamara@microchip.com>,
        <atish.patra@wdc.com>, <Ivan.Griffin@microchip.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <geert@linux-m68k.org>, <bin.meng@windriver.com>
Subject: Re: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr compat
 string
Thread-Topic: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr
 compat string
Thread-Index: AQHX1LJNdMdlY4vowEeneOogTbWpzawbDvGAgADSigA=
Date:   Tue, 30 Nov 2021 08:35:34 +0000
Message-ID: <63e29e99-d064-b157-eabc-ff08f55eef72@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-4-conor.dooley@microchip.com>
 <YaUyDUsyEoaA6nky@robh.at.kernel.org>
In-Reply-To: <YaUyDUsyEoaA6nky@robh.at.kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a48a33c-82af-4d82-ea45-08d9b3dc60af
x-ms-traffictypediagnostic: MW5PR11MB5857:
x-microsoft-antispam-prvs: <MW5PR11MB5857C11BEBEB14C69F9AEC8A98679@MW5PR11MB5857.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TxqjtUT75lMNwoNkXmIdjYi74DXikGWA3jlRnNY1MgRmnwN+3WM9ycyjOvNgp/fiFNKHjlUoxyTUQzYYqSNA9aenufhiASv00cyfFu5bWLJvd0z7EhBrpn+SrtYxIWdnMe3RwJTn64FNlNlk8L6daeIAOOMtYp6uIvKvHeKfNRF+mkjf6svh5/R7su56MuUfPLDc4X4A7wAcajlXEiHj7NGZjqMGapqyaCIWgpXzTKmVsO2KU97TKFlZs6B8U5n5iODQh8i/qXValAQaMfF7CXf4Q3TB9rLRfowWH9BKXhjKTqz0gYUS4FjYvzpe6YzA5ic2B57mhgCUzSlFkHLopyFyRU/e9FqBGgbsqRBbzex+68qrxJvTD5ZRQ9WGpLKLS88JeWr/pzBjorp9n/l3bdfZJrZ+DDlUe+FLiqFBv7CIAUzvpodvh/ZDAeEvEvCve5Sjl0/jrawWf9/PhAKg2WJHtl0uvK7dDZVC+0DOfVwV6anV9zKDKS1mYSSw4ci/8G19ImLT1prnGa1thSjGTy6nRCZcLg3FPgM+Njien4SRxRnvmSOINVU5WRi45m5jMK30msk7qWHtlQrY74i6yUnzPDt6OxLKOmyt/+Jz40yOGxg0CkU/yReWJEveqda9dqSEAP0OHuuXB4VwN5b/BKtYe8/E01+XwoIR0QzuMs4dCqvwYgXxTjEj78mMaVFHnNn+nCIQ+zYcZM626U6AlHtdpQ7elmZJNWog5m9xSGtfllOeIrlbGYZKvP4vrHfOzMiNPmEwT+StI/fhtXp0mWhxO0MJmdny6MlZFQmMbYZsllxMKgayvdOnOhCyhszn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(64756008)(76116006)(8936002)(91956017)(66946007)(83380400001)(6916009)(66476007)(316002)(26005)(66446008)(2616005)(15650500001)(86362001)(36756003)(6486002)(38100700002)(7416002)(8676002)(38070700005)(4326008)(54906003)(71200400001)(6506007)(2906002)(6512007)(186003)(31696002)(122000001)(508600001)(5660300002)(31686004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFp4Rlp0RGtQZVNnM1dkemMrT2xOeGpFcklITCtCeHBRTTg0NGRqSFBaV1RF?=
 =?utf-8?B?VWRVK1RvVmY3ZDhOdDYvaC9JOVBSRnNBcTdMYWl3Z0RLNU9GclBGOXNyRWlK?=
 =?utf-8?B?bFN5MDdJTnN6bWZycGpVQWlVYUlOUHd2QVU1ODcyTndXbVZ3TTMzbWdpbkJi?=
 =?utf-8?B?SlJ6MXVlUW5BNGlEZkcrVG9JUThpNGdCSDh2cWpDNHV3QnJmUHRML3FIQVBj?=
 =?utf-8?B?OEY1R2x4cEJ1cFRYYzJBbldmQkpMSmU2ZVdUQ1ZMdnI2S0FwUzhSTk1zNGV5?=
 =?utf-8?B?L25oQjk4aGFqYWtSSjk1VmFWSkFuVlpYa1Bob3Nma3BBNHhvNWF3VytyUWZD?=
 =?utf-8?B?UnNZNjIzajNlMUliRnBJcUR2TXlOWkI3T1l3K1hrUTRUYmtocXFJejlmUzJv?=
 =?utf-8?B?UzJBT0ZqdkM5b2p6MTVwRm8ySm9oMkpPUW9kTDQ5RFR3OUx4ZjZrR1JtRHdr?=
 =?utf-8?B?SXpxcjRrdllHUGtseVRCZjJxeVdNL0JvVkoyM0ZXdWFLclpmZVZpZmxhTWlu?=
 =?utf-8?B?Y3ZOOG05L0tjRjh1MTNtYnQ0dnQ4czlhVHlpRHdCWkpIL1pyOXF2eFBVYjlr?=
 =?utf-8?B?aXJ6Yi9XMjNlQTFRZ3ZUU2tIQ2JicDR3NlBDL1piL1pZVFhvSkxxcituK0ZQ?=
 =?utf-8?B?dWNMMzEzOHczdkhIK0NQbWpvMzlXWll3cUJtUlhqUFppOStvL1F5aFBYM2Qz?=
 =?utf-8?B?Y2JVZUpXN0JUVXFqMzRrVEsvYlNUMWdQSXBjenB2akNYd1orY0lLbUo4UDdR?=
 =?utf-8?B?bVdIR0c2WFRjam5aU1BncEJMQ3A2VEhvTHpCcG43YlhuVnRsenRDVTZaSWVN?=
 =?utf-8?B?S1V4aFZ0Qkh4RXVSc1NYbEZyb1R5L09lbHFLblNsYUVJa2Y5R01pc1EvRUU4?=
 =?utf-8?B?Yk4zK3FvTTdkQkFPNFRncGd1N3BhcUM1Z1pkaWRtM0laV0UzZ2FRZUpkMWFs?=
 =?utf-8?B?S2VwenRNWUUzdHVoVVc4QWN4ekZiaXRjcUo4TXdyV0pLc01DTDRtOW8yMkFX?=
 =?utf-8?B?L1F5R2I4dkRaRTNUOHhtcEk0VXJya2ZFQXBkK2hrTGI0dFJJaHJzMUJnakl2?=
 =?utf-8?B?N0ExK1hOeC9laW9yQ1JCNUtqREx1RFl6ZnN5TkczZUQ5dTFMTE4xOGxwcXlF?=
 =?utf-8?B?ZFprL2ZnTUFQcXFoUkJ5U0dPbnNuVjdzWTRMbFNHRURZbDU1WFN2TlRLd1py?=
 =?utf-8?B?b1FScVIySUFYUmI4WWh1dnRaaHVUTFBmV0hQYkJvUldId2h3SXZId2ozUnBL?=
 =?utf-8?B?UTZUMng2MXovcVBVVjV1VFpaS1VKa3A2MGZRVjZzODIwRVpiRXhpdGNHR3Ju?=
 =?utf-8?B?b3dBVUNGNVlIYklmaXRUNUgrTXNvdjNHOXBUckJxdVZnUzZTSjY3cmtpYTZ2?=
 =?utf-8?B?TGRzZ3JuZFo3T0xqQWZ0V1BLalhLblBvY0d3Q0NmZTZoa0p3MHdtZEY2dGNk?=
 =?utf-8?B?dFRSajhUZ2RLVTYra3F6WWVRNElMUFB1SzBNeGM4NkdFRzVOWlJqdHdjVjdO?=
 =?utf-8?B?ckcwOTZjb2RSVkliVlJRbUpuejlMMkVwMWdyalBnR254QXVXU1UwM3ZnUFk0?=
 =?utf-8?B?eE85QXQrQy9NeUNVUkx4Uk43b2svVHRGRzgrT0ZjOEY0SlBIMmpIZDVtcFVj?=
 =?utf-8?B?TWVveFFEZHNpTnFkMTU1VnFZNzVIOXI2cDRYK3lnWHNSVVBoaXdnNU5lWU5k?=
 =?utf-8?B?citUV1NoQVJLaHRrdW84UURoL2dTZ1cvMXgwUnR0L3lBcFJTNlBuWTNXU1NB?=
 =?utf-8?B?LzN4b2svbklTTU9BcEFMWW5LYTFZczg2MUxJTm91QzVDQ2grekFGMWs1dW1X?=
 =?utf-8?B?NThLNCttMFlaRHNFWTVCbnF4Zm5sYUhsOEtCK2tXQnM4dDNCS2JCajIyMGk1?=
 =?utf-8?B?SjRyMzZCS2w5aUVyZ1dBeWJXay9YMVB2SURxcmY5OGszbTBlbTI5NzJxNmVS?=
 =?utf-8?B?QnpQYThGUDh3d0xONlJjVkRjL1V6Vm8wUUpxcWR1MGJGRFM1TzBHWklETXNM?=
 =?utf-8?B?VFZsbmx5RGsveEJHRlMrQk5nZk5jaFVwTDFwbC8vaVp3QnVnWVR4OVJjS2VY?=
 =?utf-8?B?RC9rdXo0bnZhTnlud09HbFBWYS82bGZ6WHVJNkkrZEsyYXRvZzVUY0FHeity?=
 =?utf-8?B?cm1IY2FDK0w4c2RrdkxCRUJaUUYxWFRMU3VOVjBWSXlIYUlHeVRJakVFSFlr?=
 =?utf-8?B?NzhVaU5UVkVJTXhQdnFzSXJGOHBMUmFpeldoZWxrTmpMNEJHaVh6OTQyZDJ1?=
 =?utf-8?B?N2NnUU4zV29JTnFuYWJteDZCdllnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EB259CAAF9B0A4094BB4EA194BB8AD2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a48a33c-82af-4d82-ea45-08d9b3dc60af
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2021 08:35:34.1583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQNZdNuC5sUtJdYn84Ln33SqIJpul3zHe7KqQt+u/ZiDoVnIy8oyvpZkwi0IaLCDT5yxmbeHVB9OW1piHGds+muveui2+mz96jSJxOTHUkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjkvMTEvMjAyMSAyMDowMywgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gTW9uLCBOb3YgMDgsIDIwMjEgYXQgMDM6MDU6
NDRQTSArMDAwMCwgY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBGcm9tOiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4NCj4+IFVwZGF0ZSAn
Y29tcGF0aWJsZScgc3RyaW5ncyBmb3Igc3lzdGVtIGNvbnRyb2xsZXIgZHJpdmVycyB0byB0aGUN
Cj4+IGFwcHJvdmVkIE1pY3JvY2hpcCBuYW1lLg0KPiANCj4gV2h5IGRvIEkgY2FyZSB3aGF0IE1p
Y3JvY2hpcCBhcHByb3ZlZD8gWW91IGFsbCBwaWNrZWQgaWRlbnRpZmllcnMNCj4gKHRoYXQncyBh
bGwgaXQgaXMpIGFuZCBub3cgZ2V0IHRvIGxpdmUgd2l0aCB0aGVtLg0KSGkgUm9iLA0KDQpZb3Un
cmUgc3BlYWtpbmcgdG8gdGhlIHBlcnNvbiB3aG8gd2FzIHBlcmZlY3RseSBoYXBweSB3aXRoIA0K
InBvbGFyZmlyZS1zb2MiIHdoZW4gSSB3cm90ZSB0aGUgYmluZGluZyBsYXN0IHllYXIsIGJ1dCBJ
IHdhcyBhc2tlZCB0byANCmNoYW5nZSBpdCBpbiBvcmRlciBhdm9pZCBoYXZpbmcgYSBkaWZmZXJl
bnQgY29tcGF0aWJsZSBzdHJpbmcgaW4gdGhlIA0KZGV2aWNlIHRyZWUgZm9yIHRoZSBzb2MgYW5k
IGluIHRoZSBiaW5kaW5nIGZvciBhIGRldmljZSB0aGF0IG9ubHkgZXhpc3RzIA0KaW4gdGhhdCBz
b2MuDQoNCklmIHRoZSB2MiB3YXMgYSBjb21wbGV0ZSByZW5hbWUgZnJvbSAicG9sYXJmaXJlLXNv
Yy0qIiB0byAibXBmcy0qIiwgDQppbmNsdWRpbmcgdGhlIGZpbGUgbmFtZSAtIGFzIG9wcG9zZWQg
dG8gYW4gYWRkaXRpb24gYW5kIEkgY2hhbmdlZCB0aGUgDQpjb21taXQgbWVzc2FnZSB0byB0aGUg
Zm9sbG93aW5nIHdvdWxkIHlvdSBiZSBoYXBwaWVyIHdpdGggdGhlIHBhdGNoPw0KDQogPiBDaGFu
Z2UgInBvbGFyZmlyZS1zb2MtKiIgY29tcGF0aWJsZSBzdHJpbmdzIHRvICJtcGZzLSoiIGluIGl0
cyBzeXN0ZW0NCiA+IGNvbnRyb2xsZXIgYmluZGluZ3MgaW4gb3JkZXIgdG8gbWF0Y2ggdGhlIGNv
bXBhdGlibGUgc3RyaW5nIHVzZWQgaW4NCiA+IHRoZSBzb2MgYmluZGluZyBhbmQgZGV2aWNlIHRy
ZWUuDQoNClRoYW5rcywNCkNvbm9yLg0KDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2Jp
bmRpbmdzL21haWxib3gvbWljcm9jaGlwLHBvbGFyZmlyZS1zb2MtbWFpbGJveC55YW1sICAgICB8
IDQgKysrLQ0KPj4gICAuLi4vc29jL21pY3JvY2hpcC9taWNyb2NoaXAscG9sYXJmaXJlLXNvYy1z
eXMtY29udHJvbGxlci55YW1sIHwgNCArKystDQo+PiAgIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94
LW1wZnMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsNCj4+ICAgMyBmaWxl
cyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hp
cCxwb2xhcmZpcmUtc29jLW1haWxib3gueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLW1haWxib3gueWFtbA0KPj4g
aW5kZXggYmJiMTczZWE0ODNjLi5iMDhjOGExNThlZWEgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9taWNyb2NoaXAscG9sYXJmaXJlLXNv
Yy1tYWlsYm94LnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tYWlsYm94L21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLW1haWxib3gueWFtbA0KPj4gQEAgLTEx
LDcgKzExLDkgQEAgbWFpbnRhaW5lcnM6DQo+Pg0KPj4gICBwcm9wZXJ0aWVzOg0KPj4gICAgIGNv
bXBhdGlibGU6DQo+PiAtICAgIGNvbnN0OiBtaWNyb2NoaXAscG9sYXJmaXJlLXNvYy1tYWlsYm94
DQo+PiArICAgIGVudW06DQo+PiArICAgICAgLSBtaWNyb2NoaXAscG9sYXJmaXJlLXNvYy1tYWls
Ym94DQo+PiArICAgICAgLSBtaWNyb2NoaXAsbXBmcy1tYWlsYm94DQo+Pg0KPj4gICAgIHJlZzoN
Cj4+ICAgICAgIGl0ZW1zOg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLXN5cy1jb250
cm9sbGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL21pY3Jv
Y2hpcC9taWNyb2NoaXAscG9sYXJmaXJlLXNvYy1zeXMtY29udHJvbGxlci55YW1sDQo+PiBpbmRl
eCAyY2QzYmM2YmQ4ZDYuLmQ2Yzk1M2NkMTU0YiAxMDA2NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxwb2xhcmZpcmUt
c29jLXN5cy1jb250cm9sbGVyLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxwb2xhcmZpcmUtc29jLXN5cy1jb250
cm9sbGVyLnlhbWwNCj4+IEBAIC0xOSw3ICsxOSw5IEBAIHByb3BlcnRpZXM6DQo+PiAgICAgICBt
YXhJdGVtczogMQ0KPj4NCj4+ICAgICBjb21wYXRpYmxlOg0KPj4gLSAgICBjb25zdDogbWljcm9j
aGlwLHBvbGFyZmlyZS1zb2Mtc3lzLWNvbnRyb2xsZXINCj4+ICsgICAgZW51bToNCj4+ICsgICAg
ICAtIG1pY3JvY2hpcCxwb2xhcmZpcmUtc29jLXN5cy1jb250cm9sbGVyDQo+PiArICAgICAgLSBt
aWNyb2NoaXAsbXBmcy1zeXMtY29udHJvbGxlcg0KPj4NCj4+ICAgcmVxdWlyZWQ6DQo+PiAgICAg
LSBjb21wYXRpYmxlDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L21haWxib3gtbXBm
cy5jIGIvZHJpdmVycy9tYWlsYm94L21haWxib3gtbXBmcy5jDQo+PiBpbmRleCAwZDZlMjIzMWEy
YzcuLjlkNWU1NThhNmVlNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tYWlsYm94
LW1wZnMuYw0KPj4gKysrIGIvZHJpdmVycy9tYWlsYm94L21haWxib3gtbXBmcy5jDQo+PiBAQCAt
MjMzLDYgKzIzMyw3IEBAIHN0YXRpYyBpbnQgbXBmc19tYm94X3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+Pg0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBtcGZzX21ib3hfb2ZfbWF0Y2hbXSA9IHsNCj4+ICAgICAgICB7LmNvbXBhdGlibGUgPSAibWlj
cm9jaGlwLHBvbGFyZmlyZS1zb2MtbWFpbGJveCIsIH0sDQo+PiArICAgICB7LmNvbXBhdGlibGUg
PSAibWljcm9jaGlwLG1wZnMtbWFpbGJveCIsIH0sDQo+PiAgICAgICAge30sDQo+PiAgIH07DQo+
PiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1wZnNfbWJveF9vZl9tYXRjaCk7DQo+PiAtLQ0K
Pj4gMi4zMy4xDQo+Pg0KPj4NCg0K
