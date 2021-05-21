Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB8438BFD8
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 08:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbhEUGox (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 02:44:53 -0400
Received: from mail-eopbgr40054.outbound.protection.outlook.com ([40.107.4.54]:64417
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233443AbhEUGo2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 02:44:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXDwkSOTTHwiRW9Hg94lYttITRd9dGklU9ZaOMmCPeGlNs44FT3fsiCv6u+Nv5vIUYo6D1H4dmZtKeXsa4Kz8EruhDoJFhygMnEOFVBfR9nHcKnsf9Ad3zCo9z05rSgH/CagdWcSVdxdhb0amUoS/AMrkliQ5s6u2y0pG3+4MOELRLJpRU50qDsaKfdGi7XOhSg1QS3J9fEucAO+1dMSqCfu9LnDINlyiLJtn+GAVd2WQ0vRUkqZyabUzPaj2Ai/Jqmqmh8Hh/Gz0OArBmlXox2eDm+/32snBHgfwyYEMHGUQDoVrv+QNQ58wMk35rkNEe2xq+sQK6u3GCB30U5Z2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MXiuTssbgAY7Ki+ZYpz0sxd2xmINLyMEe1mlblAN+8=;
 b=LSPyAq/dO6XxH8BWNxbPs1geooJltHXKEsDNIFVhJvDfmNMWHMS9p5q/D0ulzCbC7suxhOw0w7DHjJrp53Hj9h/uiLyOwRkzeLu+6RU7/9B1LMOxYcFlc/plmyW4j5UlTIYT+ikQnbcFon0Hj0U7OtK3ITllizzu5W5J4jHNSy3pxq0+qVnqVhnkGgy1dX8UO8cnsfN25ojn9dYoPPZ4eX2AjIcEY+/0OGTgEWeYyxovmrzgP1WV6lE4Ttd7Ka8D/qsKpGqr1MbIv5jZyx3K/JzkesfLc6NhwvfuTrC3AWx8JMAQSkTRclTz3T1/hUVtmrtQ6dEHDkX6gQ24DU263g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MXiuTssbgAY7Ki+ZYpz0sxd2xmINLyMEe1mlblAN+8=;
 b=dX2DMmPsyvOrwAXTW2KGliZjAG6Er0/Z+zTEA2Yj5cc2bosTn7hDB28BMGqg/h8pUjD5KsNhJPci398uGFhKptW4XcTJNm03F0zC4fXzIOGHYjSWTI6DzCkBjkHOqu8QhVb7z2URTts87e2FFWWbLDGSrhDtedbrvomjZPQZQT4=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4279.eurprd04.prod.outlook.com (2603:10a6:209:4a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 21 May
 2021 06:43:03 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.034; Fri, 21 May 2021
 06:43:03 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Clark Wang <xiaoning.wang@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2 08/18] i2c: imx-lpi2c: add debug message when i2c
 peripheral clk doesn't work
Thread-Topic: [PATCH V2 08/18] i2c: imx-lpi2c: add debug message when i2c
 peripheral clk doesn't work
Thread-Index: AQHXKtipxddpGSIHSEOxOfLZHVlnOKrtwm5Q
Date:   Fri, 21 May 2021 06:43:03 +0000
Message-ID: <AM6PR04MB49666CFFE3D51A6D3EF36DD580299@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
 <20210406113306.2633595-9-xiaoning.wang@nxp.com>
In-Reply-To: <20210406113306.2633595-9-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c99e252f-2271-43b5-1e64-08d91c23aedf
x-ms-traffictypediagnostic: AM6PR04MB4279:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4279AF750DED5600893F081E80299@AM6PR04MB4279.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2aKWdYYpTyGLzTZc3iQ+KGYn/AZVeYcOidmfDOlBsDSmzastVE1KrswXIEu9l08wwNUOYSZUkuGk+wLvAplMfybURAosSujzt96B5DD9RxjQWR2OICsd+iRyRLFkRoeZMOnwx7XYL8HazeH0JB/rYkW6AfFthBVQzRDYKDKGG0UmZYebolcNuTb+7p7NFXMNowUg17Pf5ZQv8pF7LdGte4ZAkd2BcuhhUiEX4MRyBwG5k/MQE6bpp688/uyGnrjduxnsREkX3TBAeZ92xOuhY1wZOT8ADGCZ6x284udSTQ2xRKtgFIHNScSqeDmbj1oc+OjzyRd8pL5p71FWq7UsriGM9TIiWrjgpcUTjdJyEM23pZqRtvWhsATwBc4e6759AW8qqmlQN553h/QdpiKrcbZeRhz/3BzJS64Jo60mzB8/zOM2xUBiT9nmqGRqRR+fkg3ulLc3x9E2nU+L+4I/E5NRx5uDfwgRplnD2O/E8O8JviXtDYckX81SjBFAdqraDv2kv333Dc6w47Z3nMPd6ai7aP07jIuPqWXVI2kVMvV1mZzyY1J4dF6wLe4I+qhMZ6L8WcdRpRmsHlGoXqmntkLVZN2aILPyuGtbx/m9jM0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(122000001)(5660300002)(316002)(83380400001)(2906002)(38100700002)(7696005)(54906003)(110136005)(8936002)(6506007)(44832011)(478600001)(33656002)(15650500001)(8676002)(55016002)(9686003)(66556008)(71200400001)(76116006)(66446008)(86362001)(186003)(4326008)(52536014)(64756008)(66476007)(66946007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QVNrOENKeXgvWUozYnJ4NDhyb2hUbXFTcEhyRURrOVlvYXVBQUdGQTR5TXFB?=
 =?utf-8?B?TElmK2ZlWHk5elA5Y0Z2YmxTdUsrQURObmFNU3pWV2FRUTl2MU4vd0hEUm1U?=
 =?utf-8?B?cGVLamF4SXY5TCt2VlNteTI5djF2WFc4d2kzR1ZoN2hmcWNpcHJzcEVvWGtw?=
 =?utf-8?B?Kzh4eU5TVHNaaWVDQnlzbHYwc0VLWEd4bXkvVmt0MVR2MGtldHBNMzg0TXJ0?=
 =?utf-8?B?K01xU1JNeFl3czBrUURvUTU5OFlrTlYrK3ozenhDeGEva2t1dFVYODk2RzJo?=
 =?utf-8?B?WmhpSGpraWZIZDVNY2RPaGMvalFtbC95QnFBWEJHb2J1aGlqMmRhbEZnS0VC?=
 =?utf-8?B?aFpmaEF0SnQxN1dPUFFFQWVWWnhGbXBIaU8xY2hYY3RnS3QyL1ZCRG5DaG9l?=
 =?utf-8?B?T0xwM3JvLzhKcy9qc2tKSGFkM25xbkdFOVc5a0RSK0pqVG94aFM5OEJMeWhB?=
 =?utf-8?B?OXMxc3ZEQndUN1VRcjlXN2dDN2dndXZzQmlmWFNwQ3REYjNVYVdVY29oeFNx?=
 =?utf-8?B?ajJvS25ONmc1ODQ4czMvcGtvLys3VEczTmN4aG54eUhBZEJJVVE5MHQvWjFD?=
 =?utf-8?B?WmwwWFk1RG9FREcwd2Z3Z2pqMWZpWmNsMklSRkVJNHEzOUx2enhzZXRiUE9y?=
 =?utf-8?B?ZHJWMnlvV0FkcHRhOVMvTThWQjcrVjRpcTdvYmR3VGo3S0YvTlFkcGNQNC9a?=
 =?utf-8?B?SzJoaGIyYjdmZWFvak1jbUhoU00zdmFQVVZqcVAreWtBN0srdEQzSnhoMita?=
 =?utf-8?B?bTg2eTdPYk5ZSXNFUjBRdWRpK3R2VUI2dWloRnFKeHNvMFk1Z1FjM2dmK2E1?=
 =?utf-8?B?bFFZdkRLcGQvcGVuZXc5LzA3S3RzK1FITCtEZzVldXhQY241Z2ZHMG4wcTho?=
 =?utf-8?B?MjIvWUtxc09aQnB2UGlqRFkxYTU0ci9BYzNyeDVxS0ozRWx5eFdnaGxsSWYw?=
 =?utf-8?B?SUNpZk15WEF4RUhyQU51VVkyVWNiSmVISitaUDJyNDgvU0xrYitRWm1Uem1T?=
 =?utf-8?B?elZCWnBHL0x3UEFOemtnTHNtYVpJUGt5eU14dHBHWlFDQzNzdjRRSXkzaFN5?=
 =?utf-8?B?SU5zSDcvZnpSY2dobVNmM0ZnVy8vQjBSRUNTV2Q0eERZZElUSnlaQWxpNTds?=
 =?utf-8?B?cmZLeEVRWS9FcVluNEVWYmhhdVhUYmFmMUcrL2lSajBFT21rTnZGZHRkWDc2?=
 =?utf-8?B?VVF1bHdYN214dVlGSTl6SDJMb3BHTldPL2E0SG1pcTNpODVqOXIwbitTa3Zs?=
 =?utf-8?B?RVY4SXg0TEpkc0lUWnNJWStqanZ6YVRyN0psejVoaGNQcFIxNFRITllsYnY5?=
 =?utf-8?B?eE5nTHY3Sk5mMGR1N012eitBUmIraUhlQk4yVjdHVGYwTHNpcmxCb0tldDl2?=
 =?utf-8?B?QmV1MzdUTWp5SWpEdTM0ZjBaeVFmSm5EZ1owVmgzNHk0amtmbWRxaGNTYWRC?=
 =?utf-8?B?VzVwc2lOSUF5Y0hoWDVzZGl0VDhWRkdzZzBkZm5HUUZSV1g2TC9ySEhRTjg4?=
 =?utf-8?B?dmxYUVA1Mk4zaWxVK3pvK3BaWnltcGN4V3IvbjF2azI0a1BTVmp2L0wvMGox?=
 =?utf-8?B?Q1V4L3FXcXVXRUkxaE9xKzlldVFFNE9mMjlSR0h3c3dlY2RHWEo5akd6T1l6?=
 =?utf-8?B?c2N5bHc2VENNTGxKMmpBOTF5aWJrajBpcmpFUlNrem5UZDY1NVFzQkFraDlY?=
 =?utf-8?B?TE5ub05BWnNaRDFNazN2cm5YYzNEUGhyWGtFQjVKU0x1RjZhdHVoNkJTTDd5?=
 =?utf-8?Q?EPJGsrFX1/6xBi5PwenhEL0waeAlD72cNe5JFDj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99e252f-2271-43b5-1e64-08d91c23aedf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 06:43:03.2597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +IomAxQMItu9fiosazw/mZ7GXuWKc4HEQvgQ6YixhpyUc64z716SvCaBcfzWS+GBvshhepeuwdnqpsTwoswmqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4279
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDYsIDIwMjEgNzozMyBQTQ0KPiANCj4gYWRkIGRlYnVnIG1lc3NhZ2Ugd2hlbiBp
MmMgcGVyaXBoZXJhbCBjbGsgcmF0ZSBpcyAwLCB0aGVuIGRpcmVjdGx5IHJldHVybg0KPiAtRUlO
VkFMLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAu
Y29tPg0KDQpZb3Ugc2lnbi1vZmYgc2hvdWxkIGJlIHB1dCBhZnRlciB0aGUgb3JpZ2luYWwgcGF0
Y2ggYXV0aG9yDQoNCj4gU2lnbmVkLW9mZi1ieTogR2FvIFBhbiA8cGFuZHkuZ2FvQG54cC5jb20+
DQo+IFJldmlld2VkLWJ5OiBBbmR5IER1YW4gPGZ1Z2FuZy5kdWFuQG54cC5jb20+DQoNCkRyb3Ag
dGhlIG9yaWdpbmFsIHJldmlldyB3aGVuIHRoZXkncmUgc2lnbmlmaWNhbnQgY2hhbmdlcw0KDQo+
IC0tLQ0KPiBWMiBjaGFuZ2VzOg0KPiAgLSBBZGQgbXkgc2lnbmVkLW9mZi4NCj4gLS0tDQo+ICBk
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jIHwgNSArKysrKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGky
Yy5jDQo+IGluZGV4IDMzMzIwOWJhODFjMS4uZGZlYzMzNDcxMmMyIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGkyYy5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gQEAgLTIxMCw2ICsyMTAsMTEgQEAgc3RhdGljIGludCBs
cGkyY19pbXhfY29uZmlnKHN0cnVjdCBscGkyY19pbXhfc3RydWN0DQo+ICpscGkyY19pbXgpDQo+
ICAJbHBpMmNfaW14X3NldF9tb2RlKGxwaTJjX2lteCk7DQo+IA0KPiAgCWNsa19yYXRlID0gY2xr
X2dldF9yYXRlKGxwaTJjX2lteC0+Y2xrX3Blcik7DQo+ICsJaWYgKCFjbGtfcmF0ZSkgew0KPiAr
CQlkZXZfZGJnKCZscGkyY19pbXgtPmFkYXB0ZXIuZGV2LCAiY2xrX3BlciByYXRlIGlzIDBcbiIp
Ow0KDQpzL2Rldl9kYmcvZGV2X2Vycg0KDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4g
Kw0KPiAgCWlmIChscGkyY19pbXgtPm1vZGUgPT0gSFMgfHwgbHBpMmNfaW14LT5tb2RlID09IFVM
VFJBX0ZBU1QpDQo+ICAJCWZpbHQgPSAwOw0KPiAgCWVsc2UNCj4gLS0NCj4gMi4yNS4xDQoNCg==
