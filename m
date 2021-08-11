Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9D33E9273
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 15:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbhHKNX3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 09:23:29 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:3047 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbhHKNXV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Aug 2021 09:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1628688177; x=1660224177;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=P0+9WhUbwBfvlp/fZG0Bq51TPzWbv1ob8r5Uh9JV94I=;
  b=ulS1l56F8psmAbmPg7hmEjnKTkKFzC5jYjyCzIB7bLb6VCXV+Nu/0byQ
   cqe5SjIBJNTd2W3y2uZ3ZoQPHikrlroIJdNQUBIC+3AzuO5tSRmrUhFwl
   gRz+6OiYmN5mw+KYjRdRDZOJAtmQ3hfAIQiguCFXWtB2dXBbdNTzNt093
   ezZExIIiIkCVobrZvA383UlkS0OMl7/apHahmYIXnas6eTtMeufVB6lRp
   wvw2GKuFVHJvWQiHzVwrmTWFepEEItrLpfZ+c0KPVQOqAji8a2z9qr3S1
   GWXGz1zYZiDTFF7AsC7JblbkOW697CSJLgkCFcnMGSx1DTkToMj0oVV7q
   w==;
IronPort-SDR: 3UvqrtW8x7I32z+8/LkeOsgQgS0XWrnLPj7ge//qlmljSmBuus6nM5ApqWH3EWWNXDyz1Mqr47
 Pg9Mtm2FTE2nOgEx1MCw/8WV0d2ZbpudcFpvfujDYDqj+wWlIypOJ3XBENwYeT+RwLryNGajxi
 lHJxyNvwHYjr2V5PeIiH8Gl3IYQ9fFuHLHC9V7a8Rf96jB9OQ8mB12vUVysj7dZ7XoTBzdowKG
 ccxZWt/b/Jj+kYPFPsQvKV6+zMKS5IArSVG1oqyrTaA/rhMsl5LFPdp5d6OKnl7KQJUfMMMMPT
 ygRh+LKeAbitxeGM4WraW+cw
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="125415960"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2021 06:22:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 11 Aug 2021 06:22:25 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Wed, 11 Aug 2021 06:22:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn5nqZbPbu4grJkH474eo7mYkofCEz98WOEMvcXcjWtuT9j2p15D1wefNBxShCDmz4R8haADnyBuHm9U06oS6bnbAkINomBLhY3iyzilpDr7rM5N1PL+XZJfnOaketV5Q8e93on9NkJZ221vfwn4h0Y4S8/TBVKGHHrbOxLWKuwF032SvC4V1r27tSo10ndFTeLFBgyMtTNSSCDRKvYwgvu3/V59d/DBgPTei//+CEk59eU579/p8B6VNG6DHoppYYUGPk4/9t15AdwKmA6rBI+w7/ATCaKVl19jbiB1Mdv7Ucpvy0SMZQj9/CKzKQBfw2Wh9WJ8F0IrC1ChURFz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0+9WhUbwBfvlp/fZG0Bq51TPzWbv1ob8r5Uh9JV94I=;
 b=iiFV4eJ5o3+4y1NJ7/pj37bd3zIo5wilzCZyFngafQRHlT70EKPSr9hYtg4nK3azynWAu/XAB2nc/Ytq8xAJf2JLO7WlrGUgH9Nqn/oy9F9izVfnNpLQ57PUhtQ8YP2iVtRKGm79XWIFp7vJNtRqpvGwEx2fOOQQdyd+zoIxmcKjCs1MqFYi+6rB9Va7X6DuLEnzWbuoT/K7vs2azQqWqApJOre0es/uYgVJ922mzCM7M1xW0oQ57nhK3+MHHeKc/+Wk213CaV1Yn5B9RQUZtYbBupIyuzVglEYTcTKL6wax/FTAd70xSJLN0ej5v4a+DG83uYGEgUEzdwNBNKBDXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0+9WhUbwBfvlp/fZG0Bq51TPzWbv1ob8r5Uh9JV94I=;
 b=hnc0n/IUNDPZdAZfEX2P4Ca6arZppXFaP3rD8cmY+ADxCvOX35Nt6GLGsoi4UvAgU4wG+7+22y9U+8qOe6jyix4o6WuXFQPfvFi7l65fHwg/+PYf+3mZ9VhjF3MAlLQz3UJKX1psjc4jO/bTtE6j+UjeNcH2ZFW8582OVS8tI7Q=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM6PR11MB4107.namprd11.prod.outlook.com (2603:10b6:5:198::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.19; Wed, 11 Aug 2021 13:22:23 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::bd6e:aa3a:af25:11a6]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::bd6e:aa3a:af25:11a6%6]) with mapi id 15.20.4415.016; Wed, 11 Aug 2021
 13:22:23 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC:     <lkp@intel.com>
Subject: Re: [PATCH] i2c: at91: mark PM ops as __maybe unused
Thread-Topic: [PATCH] i2c: at91: mark PM ops as __maybe unused
Thread-Index: AQHXjrJPsNhkGeLXfkqX32WGfpRaJatuSnAA
Date:   Wed, 11 Aug 2021 13:22:22 +0000
Message-ID: <04538645-1bed-0ff0-7874-9ae594adfcce@microchip.com>
References: <20210811131002.2201-1-wsa@kernel.org>
In-Reply-To: <20210811131002.2201-1-wsa@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7eeafc2-f158-4cab-a68b-08d95ccb0df0
x-ms-traffictypediagnostic: DM6PR11MB4107:
x-microsoft-antispam-prvs: <DM6PR11MB4107FE48E565BD90FADCBF8AE7F89@DM6PR11MB4107.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LiM6vfzU6icoVkjf5a4NKG/F/5IYUTR3hJvtGpDVbhGHHmui2rXnojLNQMWP7nFAQ1T8/PBc4yE9jQnSuDJ9FwRrC72D95r6NTE0AUxz+Oj4NKSxC3qx9aVXb3BqsNPSGuFIDkPEDGPGqu7jDVvxjfzScCvPHDIyna7kq19GNxZiTITa/1Kv8IJbqvoLoCiROyzvTHpNj1i8YlnrvA8/1YbxzWxlwGnPnG6NI6Php2bVJx9MBwK/VZpzNn9+CaZw0zqXEtHwVZU4GSSWREeoL+wuP4vXr86tccFmEyLHBXpJGxvYAkuEBKRKrE/MUBkdBb5fxVJHxDNgJOYEyh5PJYAQAlqZjDa+53waIbXDIb/anKI91ufOmim9OQfyNd8dRhohNuV09GiLIwUjqGpNShOiSqttmUpBxSnI0IXNbht5EDnHI8PzaupSZFmqjYccJpd2A+8kCcLivuwyWNuCe5BsmGmQtsY3BFXOetZOygJn2kGusrqSKOP4hlk4Ty3OnXLcdWcxMHEqkKErv7uCc/9fcMS+bLZM4NAf5/TjSn+uECi3inmUj/cHicGzXh83jXnwJx4q4pU0SRtMGaTH3EVUoG+Txi3tCjSlOFOyn9f+Whw5YfMXdnu7l9ubIiORzidYOcuFQvm/JXTZphpugai5EqIWS/NPluDlYSrZo0wIRDo7tX6tdqqkPYZxE6NHHC6jcFqEIKDo20t4kse9nHkjvw8MiCr8Q6SQzvKBb5w9+NEq6VNk6JX5VRRR3JHF4pHJF4QFfKESDXSjNhYI/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(396003)(376002)(39860400002)(71200400001)(2616005)(4326008)(6486002)(5660300002)(6512007)(2906002)(31686004)(316002)(38070700005)(8676002)(186003)(66446008)(64756008)(26005)(122000001)(31696002)(38100700002)(86362001)(36756003)(66556008)(110136005)(66476007)(8936002)(478600001)(66946007)(558084003)(53546011)(91956017)(76116006)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MitHRTVRYnBMSXJNVWZxRzFVK0tJOWdWY0hldVIrOE9DbE9WZElOOGhrZWVC?=
 =?utf-8?B?cCtuV29nL0orL1ZIZjlWWmNUUG9SdFVJUkM3N1hBcHZwQ0M1WTJhT3RPckZ3?=
 =?utf-8?B?cHpNS1BsZ3B6eW9JMEVwb1hQZ2tXak1YNTZwaW5laUZzbmU0MXVzZ0JFcEVL?=
 =?utf-8?B?NGtObUZzeGcvRG9FK3l2ZmFuVlE1bWFsMHJORlRDeG00djg1UVZSbk5JNEhO?=
 =?utf-8?B?SnBEVTBIWmtURkM2aUEyVUEvRy9PSzQvb0QwczBKY0NYU1lxRmd6MWtPMllz?=
 =?utf-8?B?NkROMUJZQXhLRHdPblJSVktaSGNmbHVnbUttNDdZKzFraEV1Z0Y0akZ3QzF2?=
 =?utf-8?B?Nitha05OZlBqcERiVHZHbXFBSmg5ZDZpcVlMWUpueXBucHY3ZmdDeGZRMWwx?=
 =?utf-8?B?eUMxam9Iamh5V0t3dkw2MWsxZzZTV2NTTXJqeWE0amhoQlVPSC8wVDJOREo2?=
 =?utf-8?B?QTBuTmk3bW9SZnNDaHRablQ1Y2pnZmp0MFhCOXRMQ3FLM3luemVEQ043Sy9t?=
 =?utf-8?B?S1V0TTJSSTJRZlliSDhoOE1rM0RleXZvOGg3RzYvQnNXZG1HbTBDV2ZPNElt?=
 =?utf-8?B?eHZJb1E4dk1ETXhCWnY2LzB2cWUyMXdNckRnbGF1b241blpnbGJFUjByUUl4?=
 =?utf-8?B?ZkdNbC9JV3o0M1BpbUtJanBnd2xta2NLNUw5ZHZ1V3dVbW94T3V3MGEwL0s2?=
 =?utf-8?B?dlVTcGprOCtqaCswVnJLTlgvVCs4TFV0YlRKUTlFNXdBczFabnk5bkptYmw1?=
 =?utf-8?B?eVFRYWZSL3N6VzhUNkZidG42b2R6S2VjVXF0OWFQWlBoTytzRWJ0MzVHU2hu?=
 =?utf-8?B?Y21WY1F2c3RPVW43bEpZWjBOU3VsckR4cFpuUDNBMGZLTjFjUFkzSUcrVXpN?=
 =?utf-8?B?SWEvR1dHTjNuNXVDL2krdHkvbHlId1lMQlRCeXRWOVlqNE8vdFE2TEtWWXdw?=
 =?utf-8?B?cHl6OHhZSnhOR1RSS1krenJnTmt2ZkZ2TkNJQVZOR2pFbGZUZzVhSXljQ2ha?=
 =?utf-8?B?cGJwQjhKNEtMbWdIbGwzWmFwanh6bUlIaU54VmlYU3g2MDRVU2twOHQ4dzlT?=
 =?utf-8?B?R3Z1Z1Qwd1dSRkxGNW1KNzZ2MmdQVGlTUkxqaVB0MVE2aHdURXNXNWVzRG82?=
 =?utf-8?B?VEQzOFJXWFBHR2dZOHpaUjBsTGJIcUtFeURkeUplMzNHS2cwUHJSaFF2NWxC?=
 =?utf-8?B?WHZzNmFwNkl2elVJN3I0QlBpN1g5VVpUVEMzV3ZSR0ZyU1U5T1AyOFV0dWVy?=
 =?utf-8?B?SWU5OFk0amNsbnpmNkZqem5lRll5eWZEKzBFNkZTWFBNbjNhVzZPbzVtdGtI?=
 =?utf-8?B?Rk5YZjRmRjJEVTR4cFppbjFGKzFNWTlHMmVxQWlTM1BuQy9adGJmT0paWjFT?=
 =?utf-8?B?OHBEMkx6ZTJKSzFvMG1Sek5yVzRVMTBEelEvd0pyVUJBblhXS1FUUHJjc0tP?=
 =?utf-8?B?ZGdrbzMrNTJNZi9EUUJPVEIwSkV2WVZyTDJCeHkwSUgvTlhFKzNHcEtXZ2Iz?=
 =?utf-8?B?TXJyZE9UK1BnNjZjTC9JVm9vU1dpdEVrK2dReFdIekhiQ0pwbXc4T1YvdHJi?=
 =?utf-8?B?Wi9oMzdmTVcyK0ZtL0pFRGRXZVNFSUdINEJoZEVGOGpWZXdvMlVjRTYydVlt?=
 =?utf-8?B?QTlUYXcvMmpqWGZiZzMybGlBcjNndU1RUmhZeGh0TUF1cEk1L2o0cnZEc0VB?=
 =?utf-8?B?MWFSWGJrY3lnRU5BeWlVQW1LL0RwMmtGOGl0aGJTY010NDZhMFBpUzJHaHNv?=
 =?utf-8?Q?egbvFIly6nzmDuu0rs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AED2F84209121D49B02D4C006553D4F7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7eeafc2-f158-4cab-a68b-08d95ccb0df0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 13:22:22.9984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: szOBGi1aBPV56/nmmlaBxv3BCCw/88kz//mikqlVwbKZopkMG2/nnHf6geo9ja09S36R9qX6BrPJbkR7SWHYZ5zQhMuVWJW1Wuh687hNytc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4107
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTEuMDguMjAyMSAxNjoxMCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBUaGUgZHJpdmVyIHVz
ZXMgcG1fcHRyKCksIHNvIHRoZSBQTSBvcHMgY291bGQgYmUgdW51c2VkLg0KPiANCj4gUmVwb3J0
ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiBGaXhlczogZGFiNGIw
ZThjOWE1ICgiaTJjOiBhdDkxOiByZW1vdmUgI2RlZmluZSBDT05GSUdfUE0iKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYUBrZXJuZWwub3JnPg0KDQpSZXZpZXdlZC1ieTogQ29k
cmluIENpdWJvdGFyaXUgPGNvZHJpbi5jaXVib3Rhcml1QG1pY3JvY2hpcC5jb20+DQoNClRoYW5r
cyENCg==
