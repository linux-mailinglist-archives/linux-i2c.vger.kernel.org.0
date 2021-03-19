Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9BD34148B
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 06:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbhCSFLK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 01:11:10 -0400
Received: from mail-eopbgr20075.outbound.protection.outlook.com ([40.107.2.75]:12070
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233633AbhCSFK6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 01:10:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YASSj3TqsV51lbnxb3Xh6BeAh9noI2eviYCSqN4MILlALy2wMg6gktsYGjEYByk/+fPOuVzy6+hhdF6/4PQrFw4T47OMHOZla6CE//SA49KQpSEG3pktZSj2XhpdWrb+t6gzRWLDCa9o7jGilxM/OqMu8LFtvII5VkisTcd0yyfhe3XHY9q/tM05fFMkz7JxMl7lXuNtA0IAsc/JZ+eGGyz+sORxBkGw4yK9WsyfHuPJ5OUX9meSR99lFzXS5Mm6aWqOvVLEQEnwIdOPRmQnjtSpFXqx+4by982E8D8K8laK3HpvOhcoUUY45b1gR+CK5RPXGT31sq7KarvS7kkrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vq+qkQ6I6tgiPWD6A1pPrWodtNiGw9vOSeW2uy8a6cw=;
 b=SPoy++tZRV9PwUUteBlMVceYaWOSD8LjXVIT7qerawT2Bh76QemjnjF1YTwyfEfarurKA2UTsQa/3IJqw/bDXRigVMRslzNueyLY2cUzoo5S3dKIH4u0/vJtD+Nb0frExBKtwJXHG4R7eRTzD0FxrXhDekSSXssFi9c6El535O2wFajoH49p0BnGftHSccemVNYfE1y4pSRiMDvrl1xivn6ndBeeMV3f3riH5loIooOmfrkH+yZV7SdTNxlc6haRGiRTEsPOOMADJqNkFSrFdToO0Hqd4e0THcMeK8z+cm25ekTjpEeVcaNzAorAncBpv5OtXrYfUitCRiWiFmPFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vq+qkQ6I6tgiPWD6A1pPrWodtNiGw9vOSeW2uy8a6cw=;
 b=S2Gq9HAz6l84krn4ga2CGuegYW/WcQ2vEH4YfIdPXmHsQDqVklhvz3JqiJOSoNOag2ti2FsiyBk/cvHzhbQU4JqrCXSZ5cFFHjFGX/SN4+gIuBIMLKXngSYVprQc9ie0zdcz0hbCzbMES4i541kJxNBdw6UrooMZ03/KqI4gBXE=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM5PR04MB3154.eurprd04.prod.outlook.com (2603:10a6:206:7::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Fri, 19 Mar
 2021 05:10:53 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 05:10:53 +0000
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
Subject: RE: [PATCH 07/11] i2c: imx-lpi2c: increase PM timeout to avoid
 operate clk frequently
Thread-Topic: [PATCH 07/11] i2c: imx-lpi2c: increase PM timeout to avoid
 operate clk frequently
Thread-Index: AQHXGvpXf6PumfbCQECEmNugMVWJMaqKxYzQ
Date:   Fri, 19 Mar 2021 05:10:53 +0000
Message-ID: <AM6PR04MB4966BD849AF2D26DD097851A80689@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-8-xiaoning.wang@nxp.com>
In-Reply-To: <20210317065359.3109394-8-xiaoning.wang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d1cac0c4-c9eb-41c5-d5e6-08d8ea955ef3
x-ms-traffictypediagnostic: AM5PR04MB3154:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3154806A1073178393D1377380689@AM5PR04MB3154.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /SMhh7OezcVkrnILlHh0qHkuRUf57ftmoC+TAkZQP01Ly8ES+GN8JvxIsk+nC3UYNDYN2s3vtY4oNdFJ8+fD1kjyAsHRN8sHdQUe781iyqDcem4/0N7z+JMKxKXbq3Gv4FxrwZt/H0isYmbdRXI7h5xzj5yltNCQ2ypO3LQDM6nkyXsVb+h9cefJekLWWHBXDrsJ1uG4dO+1OpnHe82LhWBVhOZDFlHoU8HdJyHOGrd7vQbdIEhBuYBXCHbGkoIj304oCbAq20T9iRmeBSqUooMmwagKGldKbL1x+P9teLikmu60Maz4zvouiZmbYvQlRXtloEubMvPtr8MGeJBnuuAYQyZzhBg/7Si/L+Ly9v1voOhxCqye7Zjc4O4uWKJwlqR2zywkSvheF6Ichtm9pXARhXZ/C+sJ9u+jK1JOvvxZmT+NZP7k6fB4g5KNB0ZyYJrws+LQVdQza5hbgx0LWEolZuPggG9qc9YRPLdgh9Tz5QjJl1zqFRavFRdk84lN0is3MW5JjBx489wHoRepsVKj7afDQzf9wEtJAhzm7hM0YjNTrb2ImXM+wKH+QaZ6io6Per+7SbihHkQc8KnspQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(8936002)(76116006)(9686003)(8676002)(316002)(86362001)(64756008)(4744005)(6506007)(66446008)(66556008)(66476007)(33656002)(4326008)(7696005)(66946007)(55016002)(5660300002)(26005)(83380400001)(52536014)(478600001)(110136005)(71200400001)(44832011)(54906003)(38100700001)(2906002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?S0FucFV3K2VYQVlFenF0K3NTS2dyNXhNN1ZxTUZLZ25RUGVGWDAxNDBDQlZs?=
 =?utf-8?B?ajBZbExGMU02U2c4NzlRREtEUWZkem4xT3duMURZWWFmbDV5ajJ3WWw4Z0xI?=
 =?utf-8?B?V0I1azdCMG5XSWhBQ2NQVnZsWXJ0cnhXK1NjVmI3blVySXlRTHRwdEFjV0RM?=
 =?utf-8?B?VnFxV2VZSTMvV24zcldlNzJ3U3cvQS84aDJ4SUI2dUxwUzlhU2pxcldRejZo?=
 =?utf-8?B?QjFoMmVWaExoUERnWWNpVG81b1BLelBxV0FNTnJjNVlBVm1ObmY1dk15YkJl?=
 =?utf-8?B?bzgyTlFFRGd5U2NkNmduRFY5aVdEdjdnT3hYS2c4WUZmSnZIMWlzVUNvNDly?=
 =?utf-8?B?ek9Wbmx6QUZRS3AzR29nYSszS3JTek55SFI3RWowd3ZwZTI0RmEzVTRyT0ND?=
 =?utf-8?B?cjdvMEJOQmxNN3AzbE4wS29nSjQ3MDhReFJJMW1lazdhRWNpNnVBWmNsSW9a?=
 =?utf-8?B?ZndlcnpNeGdLZVo3QlNDYW9iNDI2K1pPMEhyNjFKUGdaWGRzMGFIeFhFTW5l?=
 =?utf-8?B?aXNDOTllWGxVaFc1Ry9PWklhbzNGK3FlSkVZM0dJWkF1VmN4SjFXbTlBTkdM?=
 =?utf-8?B?UEk2blRKSnNndDRrL0RHb2ZjZjFtbDlWYTJVcm5GSXFzc1BHZ0hzMUMwM2lO?=
 =?utf-8?B?ckJtUzdVanBqWjF2RCtYRE1SV1YzT0x4djFhN28vbkVUOWgvU3B6c3ZDWUdE?=
 =?utf-8?B?NnZSV09CTmVSUTk3MnZua3hycGtRbEtuOFI4Sk9lT1ppWU1tZFUydkt3cGhu?=
 =?utf-8?B?UmxpNXl2YXlEN2lXLzErZnY0Z3pyeE1ZNjlQYTBHZm1HMURBaHc3enMxUGJO?=
 =?utf-8?B?ZHRCWXpNb3dVSFE5V1R4eFZJRjVFekluRFpUVGtTWFFyUFR2bTAwSjM1K0dG?=
 =?utf-8?B?ckZmTGZSMkd1LzZ4SzNESW5OOFpGL2tyODNwWmJCWElHSGJrYjRyUjY3cjNq?=
 =?utf-8?B?cHRocWZZMmZzSy9ncVJ3UllSZHBzQWl3M211ZzJCTDcyZ2Y3S25PRmNPeldT?=
 =?utf-8?B?dkVkaHNUWk9VNEpIRGp4ekJ2d0NUdUllQ2VIQ1l0K09Ma0ZrVGRtUnlabGZk?=
 =?utf-8?B?a2k2Rk5HeHdkKzU0UWVaMlFqbllhdzFPR29qNyt3SThmaCtubW1semlrYjJa?=
 =?utf-8?B?T3VoRGpsVFJOQ1RQcEpJL3ZTY1QyaVZxZUJkeHM4MGovYUJrcWZwS1c3Yk5T?=
 =?utf-8?B?bTRjd2U3OXNGdGZJdGFmUUNuZ2srbkJIeDQ3VG5jcVZEM0ZKcUd3VXY2U1NZ?=
 =?utf-8?B?SmZHTldDcExOSGFlMUxkYnBib21KcHNNK1F6RU9XMzExalUwdW9ZNTAvbWcv?=
 =?utf-8?B?Q1BkZXdUUDJGUFIvWk5LZnVPcE9mTUIwZjVkUkhMZytDRDJINEtrcWI5eU1E?=
 =?utf-8?B?NmxuUDJwTjY1L2dJMTVtZ25Kd2Yyam1hRnVORkVqMFlmL2o3Y2lvc3A0VmxB?=
 =?utf-8?B?N09Zak11d0JCTzErK3g5WkIyWUJkMU1zdW5QYkVHT1puU1dCMW5YazdjTmgv?=
 =?utf-8?B?Y0VuVmVVSXlnbE51d0xhM2FYY2REMFBVRlU4SVh3RmJ4Nzdud00zTm1qUUJK?=
 =?utf-8?B?UWQyQkZIYzJOWkk3Y2h2cVZvOXFlY3EyYUxZMXNxK2hTcmx6NGtKMG5rM05V?=
 =?utf-8?B?UXhYc3JKN3RiV296Zkc2SkZUcGwrSU1DYTl5dmw2RGE1OXEwU1hEY0NnMVVv?=
 =?utf-8?B?NW5TNEROdE9KR3lPMnIyQVM1LzYzcjFpRGFtWEVjNWo4U01LQ3U1UFJRTWNY?=
 =?utf-8?Q?gfeopor3PJfBNVEvuhIZRfKT+EtxuVW10Gayun4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cac0c4-c9eb-41c5-d5e6-08d8ea955ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 05:10:53.5687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qh0y5iu6iTyaTiVk4BYXNnHrsoQ9NH7/nET7AYSxVLtIZp+80IsAYwZv/s5RPDh6/z3J5gqSGXcQWNcyh65/tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3154
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTcsIDIwMjEgMjo1NCBQTQ0KPiANCj4gU3dpdGNoaW5nIHRoZSBjbG9jayBm
cmVxdWVudGx5IHdpbGwgYWZmZWN0IHRoZSBkYXRhIHRyYW5zbWlzc2lvbiBlZmZpY2llbmN5LCBh
bmQNCj4gcHJvbG9uZyB0aGUgdGltZW91dCB0byByZWR1Y2UgYXV0b3N1c3BlbmQgdGltZXMgZm9y
IGxwaTJjLg0KPiANCj4gQWNrZWQtYnk6IEZ1Z2FuZyBEdWFuIDxmdWdhbmcuZHVhbkBueHAuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+DQoN
ClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdh
cmRzDQpBaXNoZW5nDQoNCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC1scGky
Yy5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMu
Yw0KPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gaW5kZXggODZiNjk4
NTJmN2JlLi5jMGNiNzdjNjYwOTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtaW14LWxwaTJjLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXgtbHBpMmMu
Yw0KPiBAQCAtNzUsNyArNzUsNyBAQA0KPiAgI2RlZmluZSBJMkNfQ0xLX1JBVElPCTINCj4gICNk
ZWZpbmUgQ0hVTktfREFUQQkyNTYNCj4gDQo+IC0jZGVmaW5lIEkyQ19QTV9USU1FT1VUCQkxMCAv
KiBtcyAqLw0KPiArI2RlZmluZSBJMkNfUE1fVElNRU9VVAkJMTAwMCAvKiBtcyAqLw0KPiANCj4g
IGVudW0gbHBpMmNfaW14X21vZGUgew0KPiAgCVNUQU5EQVJELAkvKiAxMDArS2JwcyAqLw0KPiAt
LQ0KPiAyLjI1LjENCg0K
