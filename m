Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8026F47F4C2
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Dec 2021 00:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbhLYXpg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Dec 2021 18:45:36 -0500
Received: from mail-os0jpn01on2138.outbound.protection.outlook.com ([40.107.113.138]:2958
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233090AbhLYXpg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Dec 2021 18:45:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTIKESbVz0mDBoGjzUtNDCTqCzt8b+fZ5tIwhLrRdgfPHDCXQpvqVFU/DopsFs9d+Z7OO3XH7QgshunQwGcVcXeV3chssahyfmij6iOmEtsyJn/kcOgrDqCLpOPBFZZ2/rZcpXZ8ZxlD2DUe1teTiI1GgyiiThRrrirJh789EtivtLqKZQogeEb2ydijYXu4CNwglls6s8Uvb8I+zhESWe+RPQH7/TOT+K5N/q7UV2Kwiu0RrWQ3SfT5rjOdXFi9NtdYaLtypnF7Fb+yy4CQGT0igKtejgq0Xnvyf9iCEbytuCEdJkCH5wZ2cKVNhPHVaGiO9dj67+E3azsnVXdv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=533U8ndtRvHbnXdAX3fwwZAPQQnwspMcy0cwDxmu8IA=;
 b=On9qsdRYMXlSqv97mHsqUbSlWpgFzwQ/fd3l1wmBe9uDSlOkf7rZek0avfjvuL2hctfSy/piOoB4pYvmSQ9MXGpfExFPLgt/xMnNitc7+HbjySX3KrnvwYtQAp/Z1qwk4R/5MmzZXKucpgAiw46YxnuN1QPECirCMe4s4Xd6FJS8ZlmqAeRf7lQ0lVKA3WR5tawEI278/fI3z+EYjLOlIOdK5AqQZ/XCG5S/wrE3igEN9/BLqzLR6lMWP9vaHaQNII/iUsu30KrHIwwoffF4xcedKjkEzBu/aEhHTshBer1fsrn0qp5ZXbuWCdNsMUCBks9ax2j3j40MitVH0xG6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=533U8ndtRvHbnXdAX3fwwZAPQQnwspMcy0cwDxmu8IA=;
 b=SLdFqTaSJGWEI1lbYhGCM1LgJH0eBdfpgZlpZkPIi8DRuJCB99bOFAsfjbNlvtuKmx4Srqn5ORxh1BLo75V9IJPbIDzdKn7ttGUKyyztOTkqbe7G7ixu55cIFBktzLkK1+jtnuOf4BtKdc7qpW86SDGYGVMYeoLHKSVFm2EndBU=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OS3PR01MB6373.jpnprd01.prod.outlook.com (2603:1096:604:e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.22; Sat, 25 Dec
 2021 23:45:29 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::2182:43e9:3f29:1b3e]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::2182:43e9:3f29:1b3e%6]) with mapi id 15.20.4823.022; Sat, 25 Dec 2021
 23:45:28 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v2 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
Thread-Topic: [PATCH v2 2/3] i2c: sh_mobile: Use platform_get_irq_optional()
 to get the interrupt
Thread-Index: AQHX9pOtbmN4kJTmC0uw9YMZISqyVaxDgiwAgABi3LA=
Date:   Sat, 25 Dec 2021 23:45:28 +0000
Message-ID: <OSZPR01MB70197F402C7BA0147AD50DF6AA409@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20211221175322.7096-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211221175322.7096-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAHp75VcxCGjPiuQi9w5M3Gv97nj+TQVMdF86TQXi6bxgSTL1mQ@mail.gmail.com>
In-Reply-To: <CAHp75VcxCGjPiuQi9w5M3Gv97nj+TQVMdF86TQXi6bxgSTL1mQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e124f0ad-3d7c-4652-ba6b-08d9c800a1c7
x-ms-traffictypediagnostic: OS3PR01MB6373:EE_
x-microsoft-antispam-prvs: <OS3PR01MB6373FD9130B15802A03A0B27AA409@OS3PR01MB6373.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4r7hxAG4xZ/lasetdQP+9JUKt2uY3N+jqXApqttybyU9rz9ZqRWluuQSkiy/ZARw1/zFAMUkizHmqOiTya4URm4gKUXRHfS1d4begi5gaoHToP2v+FltRTRBBGw9FMVT2APR7VEa8JE7gToY4ldFDuKs5/O4J+UUexn9apPoVWFPPazQii3d8ZoRoFPEt/tCMb0jluVQLhmPj3m+N6pdZQXdkbn4TDbECXyFNhLZve6WvmfsEWKt8jfCud9WCEVJciVPlTsW1U2Mj/nbSZMIPWsDWAlW9bxveWUumprlEV0HI16KrCb65NUqHD3XMmt4unc574yuIDuLzZRgNQgS5PLyaXv1fKfAyzuXeLq1qLh9GhCfE+1Cwuhi/gX+G/6dhDJ6CVB9RbRYGnZgebBgx3wcuuwpLo7d3kjvqnAHIhp1gxLZ0eImgmsVzet7S8Ara5hmK4zBaoiSUBFWC+Rl2lZ7NuMVU/FdfyiY+sOJSQLyQRIFXvnu698wSV7MM0jdQpwuSTeebTsN/qdr0jJkQGuK/T622cMUkQ8Z58ZOUIp5eCV0FmENh3zYB0S6NrKCLkM7p/CLlOIIHbwoq9XY708Quo0Ngbalt381lf/jV+vzNyeH/Ipi2iOc3PG1jM2alSasrj6BO7nMY4YaPiBQBPW7ZTDr2bIonbu9Bj7nJdRceNnXEzpPe3HSu//vIvohIgjznkP2STYq4dqzDidZyr5lbEuNnWA1YsG65szSZUhHGUuWijVW0YlftQgoEmP9JShmeJM4WG7c5H69iPzyJ7gwRk5FK6XNOt1p1/yx3uHA5fHTxIlsA708S+gk5Goo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(83380400001)(52536014)(38100700002)(5660300002)(6916009)(122000001)(7696005)(8936002)(7416002)(38070700005)(26005)(316002)(53546011)(9686003)(6506007)(54906003)(33656002)(66946007)(2906002)(966005)(508600001)(76116006)(86362001)(8676002)(66446008)(64756008)(71200400001)(55016003)(186003)(66556008)(66476007)(15583001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tkp5K1ZMWmRUYkRIbExiU2FOZFBVejVPbWZwVTVQMnRwVklwSytieDY3OFRt?=
 =?utf-8?B?c1E3cGFSQ1dmbCtBbytWN04wYnVqZXo5am0yQXhQWUV3Q2hsSkJvOU5lclc2?=
 =?utf-8?B?UlpzMU5jaHI0dWIybXBLeEV3WW1XVWt0b1lwazM3a0djQ3Z3ZkRPTms0NUda?=
 =?utf-8?B?WUNtakVHVU5WTDFLbEJZbHEvU0xFRmJuaGU4SnQrbkxqZlBJWnlCWGU3YWF2?=
 =?utf-8?B?enpTbW1PNjl3MGg4YnByTFVTczNmaWo3b29MNkpCejd0YWI2U2wrTy82RUtR?=
 =?utf-8?B?SXNvZlFLa1Q0VzBkaENmTDFONmxuQVcrUnZ5cDdZd2FHbENxWFAvQldXMmJj?=
 =?utf-8?B?K0pMa1psVVdhU3kvYWtpZHEvQmI2LzN1TXNUeGY2R25zdjc2TkY0M3R0akRn?=
 =?utf-8?B?RE55QTY1aC92dmgyNDBOb2w2OXlXUnR4YkQ3MnBMdUZXNE40SjN0cXhNMnMv?=
 =?utf-8?B?M2Jua1pCRWJqc1JkTmZNV3N6WHVrazdhSHUxWCtRK2t2NnZpRGo2Tk1lM1Yv?=
 =?utf-8?B?bWFQU2hFUTdHRkkySk5zbTV1T1ExRTFhVjNFTXBxZXI5d0xYS0xhR090V2tx?=
 =?utf-8?B?azRJcEVwbEFTQTZSMTJhOGE2VE13NCt6MW0wRURia1Z1TUFYcVdLdDZrVWMx?=
 =?utf-8?B?MElGcGNYZXVrMEMyNlJoSVhJb1lQWHozZFZVMEhubWJxNVZLaGZZZGhnRmxC?=
 =?utf-8?B?SHg0THhzdXRnb2NaVjlNK29zSS9Qb0psYjVpTC96LzN6ckRnT2N5OGJQc0VK?=
 =?utf-8?B?c0xCWUNCOWJyVFltRStpaGhpYVR3M1FWQVlUVkJYNzQxY2VXeXVzYzF6VEM4?=
 =?utf-8?B?YzliclNEcktlNm5kTmRVYXFaYWhWcm04SDFjQmlOMGxHVEVLaGlJUndpWm9Q?=
 =?utf-8?B?R0E1bis4VlNkN2dIc1R2TkdsMHVPS2szcGNyRDdvNlVoTzYyaFl6MGJ6QWph?=
 =?utf-8?B?RVE4WjRVZnNHSHlVdENqNnZwcE1TcGtqa1Zha2VpSjhHNyt3amNtU2RraXlP?=
 =?utf-8?B?MVZMNk1CZFh2ZjNyQjNJSlExRUMrYVM4QjA3eFdGb1k4R0N4U3k2cG9aV3lj?=
 =?utf-8?B?bHVVWGhLQXRqOFNCZXRKTTh3cXZEcUJWdEVHTU1KMXU0S1JRdXF2NnZQTUNO?=
 =?utf-8?B?WURZRGZkR1ZDQWxZampueGtKR0o4NjhEQzh0QklGYmhwRWpmNVlsVDlzZGox?=
 =?utf-8?B?SkIvR2M1R3pZM3o5eGU4TkRYa3RVUCszcEpLQ3F3RklodXhuTjNDd1RCWjlp?=
 =?utf-8?B?UlRHNnFuZ3JSc1lCSzZ6SWFlbkpXLzQwWGJFYkE4MkpZYi90R3VJREtzekhX?=
 =?utf-8?B?RkEvejZHcUhMQkx2YnZ4WUNYQmNBeEV0SHljVzlKNFVpYlAvS2V2bHI5bjlP?=
 =?utf-8?B?OHc5dGU2aXBMTW5LNjR6b0oxZG5maCtMNVR1RkFNc1lTU2wwY0lwZmducm9R?=
 =?utf-8?B?eFpuK2RkaU9UWVloYjdxZDRQL3FhMHl2aitRc1kyaFBZVFBvRFVrbFhlNHpv?=
 =?utf-8?B?Sk1yb0lUQnNkL1dvNmd0ZC8yZUhSZWNWWitQRGlWb1lJLzVkRzIrZzNTZkZ2?=
 =?utf-8?B?ZWk2NmZFNFJEZVhyYjczbFZXbXpqMnhObVRUMENxUWdkN0lRMHZCK20zWFI2?=
 =?utf-8?B?cWFoYUQyRWU0dDlUVEkzUU5iQ3Q4RkVhRURTZ0RNTFNqQ3FRWUx5MFFUbnE1?=
 =?utf-8?B?K0ZJcXEyd3VHNUxTVlZhN0dvb0dRR2g3VVhDRi9ya1laV0VtUjQyN2VSNFMv?=
 =?utf-8?B?YXFjMGprNjRLeHQreWVSKy9NaEpLQS90eVJnbUc2SjdWakR6S1Z3MFk2dmZI?=
 =?utf-8?B?ODQ5bDhSRjBYK3VFV0E3b1ozQ2hCeWpvQnYwZjF5US9tcTdKUHJlNnhnTi9a?=
 =?utf-8?B?ZkdpSzZIU2VyLzE4OStMN1hqbVZockxwZVA1SDZNcjUwYzBDZTRYYTZ6WGxC?=
 =?utf-8?B?M1dtTERsRHd1VjRLWTdOVDBoNWJ5Rk80Y2pIT3JtRDlKSnlFQ0lOS1ZYRzAw?=
 =?utf-8?B?amI1MDkvOFh6UW1sbUVxaGJrWjVHazc0ejgrVEdybXdIM2VJSU94aFo1Y0lh?=
 =?utf-8?B?andldFAzTkpNYXFHVE40U2dKT1V0NSt1SHJUQUZSUXc3REZEb2ZUNUFtWXY1?=
 =?utf-8?B?aGkzeTRSWm8xNkE5aHp6YVhnVURCcGtDb1YvK3JWSXF3SDdIK2VicXFlZWdT?=
 =?utf-8?B?KzFrQ0szVEdBK3ZrZFpEdENGSHR2Q2FubndXUmhsZVJCMDBuV2FYMVZtYm02?=
 =?utf-8?B?TVQwdUwxNnRjYmRjZVY2c0pIWVRZWVV0a0ZGaFNYUGJFM2FaT3FvSFp6OHFk?=
 =?utf-8?B?cHo1cExGTVZwTVg5TklyMjc4TUVpb1RYTERHQkFpS3RJcDg4OFR0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e124f0ad-3d7c-4652-ba6b-08d9c800a1c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2021 23:45:28.8631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/6t6juryjZOrpjlNZ/XNiaERW5sHYouF2f5sxLJ1JmznAxMbw/EAvzmPf2cKYYM9q1bcZxxSic9cixHdnPxxbjeuP+EP7M328kU5Pv9DutU95Idw3vnyEAFWCkmtUB+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6373
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQW5keSwNCg0KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdt
YWlsLmNvbT4NCj4gU2VudDogMjUgRGVjZW1iZXIgMjAyMSAxNzo0OQ0KPiBUbzogUHJhYmhha2Fy
IE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+
IENjOiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT47IFJheSBKdWkgPHJq
dWlAYnJvYWRjb20uY29tPjsgU2NvdHQgQnJhbmRlbg0KPiA8c2JyYW5kZW5AYnJvYWRjb20uY29t
PjsgYmNtLWtlcm5lbC1mZWVkYmFjay1saXN0IDxiY20ta2VybmVsLWZlZWRiYWNrLWxpc3RAYnJv
YWRjb20uY29tPjsgTmljb2xhcw0KPiBTYWVueiBKdWxpZW5uZSA8bnNhZW56QGtlcm5lbC5vcmc+
OyBDaHJpcyBCcmFuZHQgPENocmlzLkJyYW5kdEByZW5lc2FzLmNvbT47IFdvbGZyYW0gU2FuZw0K
PiA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+OyBsaW51eC1pMmMgPGxpbnV4LWky
Y0B2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1ycGkta2VybmVsIDxsaW51eC0NCj4gcnBpLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgbGludXgtYXJtIE1haWxpbmcgTGlzdCA8bGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgTGludXgtDQo+IFJlbmVzYXMgPGxpbnV4LXJl
bmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Ow0KPiBQcmFiaGFrYXJwcmFiaGFrYXIuY3Nlbmdn
QGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvM10gaTJjOiBzaF9tb2JpbGU6
IFVzZSBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgdG8gZ2V0IHRoZSBpbnRlcnJ1cHQNCj4g
DQo+IE9uIFdlZCwgRGVjIDIyLCAyMDIxIGF0IDI6NDEgUE0gTGFkIFByYWJoYWthciA8cHJhYmhh
a2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IHBsYXRm
b3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX0lSUSwgLi4pIHJlbGllcyBvbiBzdGF0
aWMNCj4gPiBhbGxvY2F0aW9uIG9mIElSUSByZXNvdXJjZXMgaW4gRFQgY29yZSBjb2RlLCB0aGlz
IGNhdXNlcyBhbiBpc3N1ZSB3aGVuDQo+ID4gdXNpbmcgaGllcmFyY2hpY2FsIGludGVycnVwdCBk
b21haW5zIHVzaW5nICJpbnRlcnJ1cHRzIiBwcm9wZXJ0eSBpbg0KPiA+IHRoZSBub2RlIGFzIHRo
aXMgYnlwYXNzZXMgdGhlIGhpZXJhcmNoaWNhbCBzZXR1cCBhbmQgbWVzc2VzIHVwIHRoZSBpcnEN
Cj4gPiBjaGFpbmluZy4NCj4gPg0KPiA+IEluIHByZXBhcmF0aW9uIGZvciByZW1vdmFsIG9mIHN0
YXRpYyBzZXR1cCBvZiBJUlEgcmVzb3VyY2UgZnJvbSBEVA0KPiA+IGNvcmUgY29kZSB1c2UgcGxh
dGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIGZvciBEVCB1c2VycyBvbmx5Lg0KPiANCj4gLi4uDQo+
IA0KPiA+ICsgICAgICAgaWYgKG5wKSB7DQo+IA0KPiBTYW1lIGNvbW1lbnRzIGFzIHBlciB5b3Vy
IG90aGVyIHBhdGNoZXMsIGkuZS4NCj4gV2h5IGlzIHRoaXMgY2hlY2sgaGVyZT8NCj4gDQpCZWNh
dXNlIHRoZSBpbnRlcnJ1cHQgcmVzb3VyY2UgaGFzIHJhbmdlIG9mIGludGVycnVwdHMgaW4gb25l
IElSUSByZXNvdXJjZSBbMF0uIExldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueSBvdGhlciBhbHRl
cm5hdGl2ZSB3YXkgdG8gYXZvaWQgc3VjaCBjYXNlLg0KDQo+ID4gKyAgICAgICAgICAgICAgIGlu
dCBpcnE7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICB3aGlsZSAoKGlycSA9IHBsYXRmb3Jt
X2dldF9pcnFfb3B0aW9uYWwoZGV2LCBrKSkgIT0NCj4gPiArIC1FTlhJTykgew0KPiANCj4gQ29u
c2lkZXIgMCBhcyBubyBJUlEuDQo+IA0KT0suDQoNClswXSBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92NS4xNi1yYzYvc291cmNlL2FyY2gvc2gva2VybmVsL2NwdS9zaDRhL3NldHVw
LXNoNzcyNC5jI0w0NTQNCg0KQ2hlZXJzLA0KUHJhYmhha2FyDQoNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBpZiAoaXJxIDwgMCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiBpcnE7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gZGV2bV9y
ZXF1ZXN0X2lycSgmZGV2LT5kZXYsIGlycSwgc2hfbW9iaWxlX2kyY19pc3IsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBkZXZfbmFtZSgmZGV2
LT5kZXYpLA0KPiA+ICsgcGQpOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQp
IHsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoJmRldi0+ZGV2
LCAiY2Fubm90IHJlcXVlc3QgSVJRICVwYVxuIiwgJm4pOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZGV2X2VycigmZGV2LT5kZXYsICJjYW5ub3QgcmVxdWVzdCBJUlENCj4g
PiArICVkXG4iLCBpcnEpOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaysrOw0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgfSBl
bHNlIHsNCj4gPiArICAgICAgICAgICAgICAgc3RydWN0IHJlc291cmNlICpyZXM7DQo+ID4gKyAg
ICAgICAgICAgICAgIHJlc291cmNlX3NpemVfdCBuOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAg
ICAgd2hpbGUgKChyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UoZGV2LCBJT1JFU09VUkNFX0lS
USwgaykpKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZm9yIChuID0gcmVzLT5zdGFy
dDsgbiA8PSByZXMtPmVuZDsgbisrKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZkZXYtPmRldiwgbiwgc2hfbW9iaWxlX2kyY19p
c3IsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDAsIGRldl9uYW1lKCZkZXYtPmRldiksIHBkKTsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZGV2X2VycigmZGV2LT5kZXYsICJjYW5ub3QgcmVxdWVzdCBJUlEgJXBh
XG4iLCAmbik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGsrKzsN
Cj4gPiAgICAgICAgICAgICAgICAgfQ0KPiA+IC0gICAgICAgICAgICAgICBrKys7DQo+ID4gICAg
ICAgICB9DQo+IA0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtv
DQo=
