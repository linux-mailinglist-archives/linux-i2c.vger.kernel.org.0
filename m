Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE6B34146C
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 05:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbhCSE5T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 00:57:19 -0400
Received: from mail-vi1eur05on2062.outbound.protection.outlook.com ([40.107.21.62]:43174
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233736AbhCSE4t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 00:56:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSgNasMEuJYV/vswR005sq1s2UK0y5wPXSVPs4hGxG+oxXKXWDLRIrGeh13jNco9X6P0ndaAZT+fFgRqfkWiR4ckSoCeHFQW+rpnmrAX/8GeswQ2qjzoxemxTTzvmhvHyL1CPULA+/sNA3G9ZDd5EeIt4NY3KD+hpReiXsSkhF+9QG55QgeFtefCrEZHUAlPRzIQQpReOFAq45W66CmKziISkPJMx0I+4WT09kyBu9NmnqGc1o/l1TB2HAhdLWdIkvCWyuvALhcQGdWicsc2UXmUH0X/Npm84VrJDXh/sdtHZg7VstbM774ppbFImAnVaG4nQ/3e5DATpZCZ9gpUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKb8KbAlJohFNPkML+hPh0aeBtp7BDPUhnfpxqyGu2Q=;
 b=LsZ3tTNTU5Wbpldf0SY/5EOdQaYmV5F2cc8IqyiNmzXEHoaUqK+OfEbTsYmfLShn882H347ogu/1MpnzLAU1fUdbvn6dY0Ugam8EvOxL99ouIvPO6pq6FgYfxy/08RN93e3+hBPZVCDgh/+WHP0y5stGZySiZbn5mJznhyVZJioUekvT0bIwBVYoh6CUioBUlqldqKL+myDWT/Qr9VMIoySLtDvN7s8HO1QGLdnGkcvMnsgqsN+69I3AaYf0Xk66IWnirH/h7njTbNoR8wGAU//Ghh/hKyfDaK2iaBETZTjw7EQBFwsMhES22FD6juN6ZSTPFW9Xku9ObzgN8JWE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKb8KbAlJohFNPkML+hPh0aeBtp7BDPUhnfpxqyGu2Q=;
 b=fNzxmxYz5stKwfa9qMnkzLPHb/xWRz9ma3QmuFRV9/1GBYr5t5BMEM+cJUqdkJzdIG7jVWvLtfhABbEXGlwVmAQlXh0Qog7ASbsHjg0kO4WU4sCJ4ynF+xvAwZX4TgqnsHy74LdKhl0+E1gmZiUls/zhFM9ilTUlMBvQEgUYtYc=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR0402MB3895.eurprd04.prod.outlook.com (2603:10a6:209:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 04:56:47 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 04:56:47 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Clark Wang <xiaoning.wang@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 05/11] i2c: imx-lpi2c: add debug message when i2c
 peripheral clk doesn't work
Thread-Topic: [PATCH 05/11] i2c: imx-lpi2c: add debug message when i2c
 peripheral clk doesn't work
Thread-Index: AQHXGvpTVx9VOWHIOECRhHtxaLmGl6qKwekw
Date:   Fri, 19 Mar 2021 04:56:47 +0000
Message-ID: <AM6PR04MB4966E686EEE0FE022996B26880689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-6-xiaoning.wang@nxp.com>
In-Reply-To: <20210317065359.3109394-6-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0e5ba71f-2d23-4caa-afce-08d8ea936663
x-ms-traffictypediagnostic: AM6PR0402MB3895:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB3895E67AF27DDD55F398A0CE80689@AM6PR0402MB3895.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pL5vtH3jYEntQgU+rgwq5hReF4F9rfvHEw/jHqEtu/vzSqDUjaZENE928M5lks/f0cCug+h7h0kib/XjqbWcKS6mDmNq6jzj1HbetYQfn9Q2lLMON0Gc4SrNHgKF2XqpwQ0L4y1m4TwBKoQH+e4sVKaRT7Eg2o/9c2h7BGRU56cqFGuhstbKKrLF3Yq3qkWIXyu72QSmvvZmgk156RbyuEGBmWSQCvy0X0TfkvsJn0MCXQXd1lTitYY2FSBf+LZsf7qdwAv7demANJpRGhkTD90hH7MxfcqGLZOMJZ2XGSQQ8G5AUlRQFVP/eOqt91bemMJOFeVmxfdoCYAsT6se0nMa3tnuloqCNaivvIePnXTVcItN2W+FFBMQNVR3mW9yPlDhNlIM7c7EUAOe7IMHrbOtx/nLMUYHbIIsyIiC9u/LbT2WzWOB7B4BSpyE0AeuE2ciaTK3HEhJO/DdU8aGGEbeiBNQRulUIGdZ82YfW8gn2XAza1dKZOzVsCsMePbhZpcTCfijCHHnY4Bstol25+4CWIP81d/y/iy2/WceeT5bka6HEf/Jf6moPfiZJQmRPGe/eeUJEekrYb5a2w8AfJOFq43TLuHLrHal6TdJEX6kcOJvkp/P6WScZMVL7SGJugjEOW7VvNvyYf9D9+vk1tUZur6j8c/5ojTRBWYAMdM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(6506007)(15650500001)(86362001)(38100700001)(2906002)(8936002)(8676002)(7696005)(33656002)(5660300002)(71200400001)(52536014)(83380400001)(26005)(55016002)(186003)(66446008)(66476007)(66556008)(64756008)(76116006)(66946007)(110136005)(9686003)(44832011)(54906003)(316002)(4326008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YXU5ZVBybi9jMDEvYys4b0kvRFhWNFJ5OEc3bXhEQUd0ZXUvR3duMWRMU2tz?=
 =?utf-8?B?dDNKYWozcnVCZ3cxSTcweXoyd2I4bWk5M05xOXhiNDNlcG1oVU5QVHQvZzQv?=
 =?utf-8?B?YzAvM2k2UG9CVDhDa2dSS1dLL1FyQ2dyRXV2OFlMSGdhV2ZCbUdlbldjeXlR?=
 =?utf-8?B?VVJSNG5QN0NVemVta0Q2R2FIb2lqV3BPd0Voc1BxVzBsZnA0VWYxWUNxV1RE?=
 =?utf-8?B?YmU3cUZTNFV1U1hFSjQrTHVDblEzV2JSMUZ1U0paWk53L1VONmpkbXRaT1FI?=
 =?utf-8?B?VTBjUVNjYUh3MkZjK3JLTzNzNzRnRDhtaFpRVnJQem5yVEN3K09kNmF5aEE4?=
 =?utf-8?B?dDBVSVI2T2JPa1ZiWE1Pb1VnMkxnMHNWM3pMSjZZRWRLcjhlVE1BZXViNTJk?=
 =?utf-8?B?aGlCVWllWGNqS1E1YmFrUnRlU0toemFzazdJOHl3UGRpcFFqWGNtZDZ1MEI2?=
 =?utf-8?B?NlZLQ2JIbWRJRUl0dkxJOGhiU0Fhb0w5T1A0OXhXOHM5M3dJZExscXFZWm4v?=
 =?utf-8?B?aEhOaTNJVFFzNzJ5ZWN2RW9WMXlZLzFxaDdUaXNML3Mvendrb05HQmpJZk5H?=
 =?utf-8?B?ZmJXcHFvZU03cXNnZjRqeTNBY0ZQODltNkZjcmFOZ0hoQ1gxaS8zaEl6THY1?=
 =?utf-8?B?clpEa29CQTJScFlvZWJMcG9nVUtWV0JIMjdhUk5yTmJSNTczblZ0dkFlNXFp?=
 =?utf-8?B?SElYMkVkUWhFZjNkTzN0ZzZBV2FsTWs4VHRwdkp1NXVvdGdTRDZpTUtZNy9h?=
 =?utf-8?B?WmRSSG8rUzcxYXAxeUVNTCt4TWJiMEdxcUZvRkhGQ1hQdEk1U1kxK2N5dnZt?=
 =?utf-8?B?RTZZYUlSdnFMZGJwWW1rclhoM2I5VnFsWFByMkdtZkFoeSttYUU3RXNyYzAx?=
 =?utf-8?B?Qm1POHRTeDJDc2dreTFMakVubG13K0RxcEtFWFpOc1ozOTB4dHhXWCtsRVk4?=
 =?utf-8?B?dk1KNytRanFMeHNxWGVvMndxNWR2bW1ZbG5KejVjMHBheWRLcDBlNGEyenVh?=
 =?utf-8?B?OE55dU5WUXZFTzNZQTc4YlA0S2c3aGFaclhaSEQ5UW9XREJEdk84b2daRGNO?=
 =?utf-8?B?NjdHcm5BUVFyTFFyWDhaNTAzeENZOHUzNENudTBPaG8zMlhGWi9XV05TYWhB?=
 =?utf-8?B?UFQzNTNPYjBScFpWdks4YjRRRVZxcHUraXJJR3lzTCsvVy9vTXNGQ0luRk5v?=
 =?utf-8?B?aEVkOVZqY1lMek96ajVDd1pQQWt1eWhaYmxJN0FERlhRUUZvQmRoTGxiZ0N0?=
 =?utf-8?B?MFF3U0ZQL1Q5MGRhaXlwZENrcjVyajdkc0lhUUtleThpak1SNjJsV3IyZnFj?=
 =?utf-8?B?MnJWR3pJY3BuS3ZDUmhobXBZQkhpc2FFZFcyT0ZPQ3RlWTRaMmt6dmg4L2M1?=
 =?utf-8?B?V04zelRDN0d0cHpOaUw2UnZVQlFQZUp2M25UbG1nSGdYNWNGc0wrUGg4d2wz?=
 =?utf-8?B?TEpRZ2h4eHBLQ1VWOTlVVjgxUjJ4K1MrM0RDNDQ5WjE0UFh1MGFyNGI1WlhX?=
 =?utf-8?B?VmZQZytTNjFqZmgya25mSGZwNHl4RkFXMi9yQXRHQ0p4UjhSaXFEak55b0ZL?=
 =?utf-8?B?eFUwMk9pTVhLNkkremRQUWdTcW1CQmIrY0NWMHVmR1N4a2Jpc2F2S1FZNGoz?=
 =?utf-8?B?d3hBdndwaklNSUZXMjloTERua3hKKzBHY2NBd1R3c2tGbjZmRS8zWnZZOVlv?=
 =?utf-8?B?ckVCT3NMS0tBQ21GRUh0VHZRd3U3RUgwc1dGRHhTVUo0MmUvKzhFMzY5UEhD?=
 =?utf-8?Q?iSEMJ96fTFcT0oZm/ZWWSygW3HU5tgVqq3Qq1c1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5ba71f-2d23-4caa-afce-08d8ea936663
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 04:56:47.0778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEVTyTUFaeWYHqyAxF5PlExa4tFeZrirj7TfnufK1hP8WM6yEODW0fZ16j9lUYzcnycmsjrGuk7oMaaBPrgAOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3895
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTcsIDIwMjEgMjo1NCBQTQ0KPiANCj4gYWRkIGRlYnVnIG1lc3NhZ2Ugd2hl
biBpMmMgcGVyaXBoZXJhbCBjbGsgcmF0ZSBpcyAwLCB0aGVuIGRpcmVjdGx5IHJldHVybg0KPiAt
RUlOVkFMLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR2FvIFBhbiA8cGFuZHkuZ2FvQG54cC5jb20+
DQo+IFJldmlld2VkLWJ5OiBBbmR5IER1YW4gPGZ1Z2FuZy5kdWFuQG54cC5jb20+DQoNCkRyb3Ag
b2xkIHJldmlldyB3aGVuIHBhdGNoIGlzIGNoYW5nZWQNCg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMgfCA3ICsrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1p
bXgtbHBpMmMuYw0KPiBpbmRleCBlNzE4YmI2YjIzODcuLjhmOWRkM2RkMjk1MSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMuYw0KPiArKysgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+IEBAIC0yMDksNyArMjA5LDEyIEBAIHN0YXRp
YyBpbnQgbHBpMmNfaW14X2NvbmZpZyhzdHJ1Y3QgbHBpMmNfaW14X3N0cnVjdA0KPiAqbHBpMmNf
aW14KQ0KPiANCj4gIAlscGkyY19pbXhfc2V0X21vZGUobHBpMmNfaW14KTsNCj4gDQo+IC0JY2xr
X3JhdGUgPSBjbGtfZ2V0X3JhdGUobHBpMmNfaW14LT5jbGspOw0KDQpJIGd1ZXNzIHRoZSBrZXJu
ZWwgY2FuJ3QgY29tcGlsZSByaWdodCBiZWZvcmUgdGhpcyBwYXRjaCBiZWNhdXNlIGxwaTJjX2lt
eC0+Y2xrIHdhcw0KUmVtb3ZlZCBJbiBmb3JtZXIgcGF0Y2gNCllvdSBuZWVkIGRvdWJsZSBjaGVj
ayBub3QgYnJlYWsgYmlzZWN0DQoNCj4gKwljbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShscGkyY19p
bXgtPmNsa19wZXIpOw0KPiArCWlmICghY2xrX3JhdGUpIHsNCj4gKwkJZGV2X2RiZygmbHBpMmNf
aW14LT5hZGFwdGVyLmRldiwgImNsa19wZXIgcmF0ZSBpcyAwXG4iKTsNCg0Kcy9kZXZfZGJnL2Rl
dl9lcnINCg0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gIAlpZiAobHBpMmNf
aW14LT5tb2RlID09IEhTIHx8IGxwaTJjX2lteC0+bW9kZSA9PSBVTFRSQV9GQVNUKQ0KPiAgCQlm
aWx0ID0gMDsNCj4gIAllbHNlDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
