Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C183761A0
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 10:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbhEGIFg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 04:05:36 -0400
Received: from mail-dm6nam08on2059.outbound.protection.outlook.com ([40.107.102.59]:20224
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233730AbhEGIFf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 May 2021 04:05:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4j7MbfRejErLCpZ4VGzOUlqfrRuE575xSpkz2eAdXp69ZhvpEMLc6gp7XTn1JgavzRO7gTJANmwaFlIZcVnBLtKLdWg93jAeq6NLu2f1mZGjHI3xAxse5ucNql8Svuv3LDhyq5Gzpt46uU2CH+PRS2fn1OnKbdpQysLE6npCd9VBO34hBe+6su2/jGbxPSKathU7umL2eldUQOUoRK2KTKO8h3/1ngPLjs4l/6aKKbI4lggHpK/Om/qKbLluibhzlUAcSLuzV+cyHc58aJTfmU0J3ooMZrzlb874aPyQ9E0sAsfVXj9JUzOYsDl/WMGdBDgU/JqglUcLgJRcyr5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KG+kYpABf31SNiqjNE0n0zdn8N5udy85wufeFZwnGSQ=;
 b=c+DZx0RCzm70DpO5oHg6ncym444VsMU4IN1zyKUS2skbQNcupjms0IPC6Xzr6vlkgEbu7KWkMpHMgTNlkx1ueNtppJp/4rw46Ovuqo6k63gr22/NvPCGt0KGJhDT3YiEgV2Nvu6gvsh0oG53nqDnpr8rwkyCeXpAqpPhGh+Sph24x1/k1aAW/VSO14RrB5gzlhiOqVwhWTesAVPWJz655oGSZ1g3dKOcPfkgFknRmzhaM1iweJKKyd40z+e+7fLDJas2VjJAXDyx4S40gn31nMFkK3Tg6caAW0/W/obeORr76Kz/6sZcs49YLBDsXYS0Ek68UeLM70oADhemeO5B1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KG+kYpABf31SNiqjNE0n0zdn8N5udy85wufeFZwnGSQ=;
 b=QYMN3cXJ4cCsP0o60Rqsg9cdk/ZbeGaZWIeUNqzI8+9zs9UKUI/rhJp1zdg9A1LhgROtgz6qOPVHk+ZooeT2ux5gGNGCFum37Iw8T3TcFcSZmRap6SAcikcIODhYmjR7l1SJbBen8Y/7TtONCoHWnXFiINYTrn3SU1nYbr9Pr0M=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1639.namprd10.prod.outlook.com
 (2603:10b6:910:b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Fri, 7 May
 2021 08:04:34 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::111a:21e3:db9c:4b2f]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::111a:21e3:db9c:4b2f%5]) with mapi id 15.20.4087.044; Fri, 7 May 2021
 08:04:34 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "chris.packham@alliedtelesis.co.nz" 
        <chris.packham@alliedtelesis.co.nz>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paulus@samba.org" <paulus@samba.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] powerpc/fsl: set fsl, i2c-erratum-a004447 flag for
 P2041 i2c controllers
Thread-Topic: [PATCH v2 2/3] powerpc/fsl: set fsl, i2c-erratum-a004447 flag
 for P2041 i2c controllers
Thread-Index: AQHXQtm2VCM1Nld+oEKeJM0gRsT08KrXqYUA
Date:   Fri, 7 May 2021 08:04:34 +0000
Message-ID: <5e625652e3f980b7cd9fb86fe3d66f19a2f4201d.camel@infinera.com>
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
         <20210507004047.4454-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20210507004047.4454-3-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc0fc044-70a1-4af9-5739-08d9112ec07c
x-ms-traffictypediagnostic: CY4PR10MB1639:
x-microsoft-antispam-prvs: <CY4PR10MB163989D0EF33ED5221393928F4579@CY4PR10MB1639.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TrMUcyA/RvyK1+M+Ud6rF3VrCqJUBAPwxRpCxlnXWh6cTzNFzPjaibKaIOdXBVG6qIQxgin4rvx3bz0ERAm+Aw7CUEozhQ1v4HtkTECynveD/sfpE9FQVtjyF8eXczK1g6xuqc1lbVuYNU0Mm1EI7lYlW01M7hVlk8xEQ8RTj8VHcw7jC7/DMB2mA+bqSe/OgR97oO2ybsjz/+VJ4z7Mm0WYRxCynj3JkjYqckU0JW5rr5Pqy3kytBjrOaRdcnhGF9JWSfaJJQM2Zdbo/dQcHDd5+A4yrmnvvi4g7lt3qlko8vBbdIVmb+hYA2ZRf1wXVPB30aVwrxolHV+5KWwVWVWtoUxjhXILwZ0bMiRs9LRhDvspYQ2iQoZnPzie4URxiF4jrkwieJsfqvHROBjB6jIia95Av7ichFVt1tIBV3Q0XrbEfjDFctlnKRgvQPGZpRvA6Z/nEC86KyxFVpmZu1ds3oj4oY4mMVezr4fBfdncGn5/thnNR6fmrdFAP2uFRw7Lj9hGFv0pq1ZIowx52baNFH4rGz2xcYmnaCziT2yabvshJIee8bPG2qyqdbb9OSGoLP9HZrG2l3Gg/joXZLvLOwnIbGzTfnle/hFyFAM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2389.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39850400004)(366004)(110136005)(6486002)(64756008)(38100700002)(478600001)(6506007)(66446008)(86362001)(4326008)(316002)(66556008)(8676002)(6512007)(26005)(2906002)(7416002)(122000001)(5660300002)(71200400001)(8936002)(36756003)(91956017)(66946007)(54906003)(2616005)(66476007)(4744005)(186003)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NStBdEhERVhEL0RhMmFCUmFzMnMvOUNOa0l2ZE5BaUF4TWZNTHlST1pXWG96?=
 =?utf-8?B?SG5mTDN0bk5GUXFNRnU4aktIMHpkVm00dGp0cWpaM0dVSDVOUHhLckZMSHBQ?=
 =?utf-8?B?TGZvZDNRaXdRK29nYlhqZVNaZ1ZJRmZSRWp4SFZtMGlZcVM5RWY0YkZCY0FN?=
 =?utf-8?B?RUF3UDY4QkZZMENIZS9ycDBrV2tFZHpKVjdmZnlxT3F0U3B5dHJLdWh4bDJ3?=
 =?utf-8?B?cU1FNmhOeTgrWXB6RktEbW1iaVJEOE1qVUhQclVPM2lTOG5xWEw5VUJDRHlX?=
 =?utf-8?B?TVA1UEJMRnlXTmI2WUFnWU1BRVdhT09PclhuMHNQSE5VSHFwT1JhUTFwWXl5?=
 =?utf-8?B?M013ZVJXeE1XQUZuUVdnZ1FqZW83SHNaMWFUaC9Ubml2a2pOdkdZSFhETTNI?=
 =?utf-8?B?aVVjdWRNZC9NdFpncE9zUU54SDRSYlAvbmN0cHFEaEd5Z0VhYmhNWUJ5ZzVy?=
 =?utf-8?B?Q3JuSUNZc05vN21rVmN1TG01TjBKZEdHalRNNlVXSlhKZFdmL3pLdWpkazVE?=
 =?utf-8?B?bWZBZEg3SkJGbmdLZmZoZE8wdDFJaWZraEJQZS83ZG9Rc3B0Zno5U2FtYXlD?=
 =?utf-8?B?VHlhYUJpbytGdlgwTElsK01VM0tPbGVsdUlIczlTSTBlQ2hoWEp1SnIyYUlw?=
 =?utf-8?B?bkJkVkZyWDF2NUdzUzYrampiR2pNYVdVTDlLYzdGSnJTZE55d2pLWnJYT0dy?=
 =?utf-8?B?SXNHL2lubWFtR0hDa0NidnZmNkI0TmZoK1htcWZpMUlvYk9pVUVYWHhCUlYr?=
 =?utf-8?B?K0tFQ3o2b2oraVBvMDlBbHdBMFBmRDY4SEhoNnkvMTMwOHFkRHI4aVJCUEtP?=
 =?utf-8?B?OHZZNFc1TDBtWkpRVVc5c3VPRDNNK1VyaERyNnZqRVZQR1V2YU9hR3pBbWk0?=
 =?utf-8?B?OXlLRjJOcU1ZcGIxVEgrNHdyNThHa2N3Sm0zSmFGYTBsa3RFa1RVZm1wMjhP?=
 =?utf-8?B?aGtQblJRVkl3MTlSSUhwc1h6bkpDeEhScjgwS2dRN0Y0dnhLeDJBVmdPeHdm?=
 =?utf-8?B?SkpveG54UHhOanJPelZyUjJjeVovcG9JbHJxU3ZuZzVmcklsc3QwQytzM3NR?=
 =?utf-8?B?SmlnTS82OEFwTlUxRURiaUtOK0VMMTFIbnRuNm5NcHhRSndYRWJKQ2QrWHJy?=
 =?utf-8?B?aW83eCtxMzhnRHhnMEdERzNHV3VhM0ZDME4ybDJUNzZhdk5Sa2VQak9XTFNH?=
 =?utf-8?B?SW03VWZpY3hTa0pIYXNPWHc5MmhOZWtHZmJGdnNvQmZzc0J6ZndPbytVWERO?=
 =?utf-8?B?cGkxM3IrcjlONERFd2I2dnFPUFZVT3ZUcktvNmx5V0JqNlQ2YUROaHNXK3dv?=
 =?utf-8?B?NXk0SlZzR0pxSTdsWVB4dkx2WHpZYUZhb2diZVlnK3dnR0gxVVN5YlUyRElG?=
 =?utf-8?B?ZjJNY1piWG5QQ1ZrQU5uOEFranJlYUFUTDRuKzJQcFhkMDhkMEhQNlB2aGEy?=
 =?utf-8?B?ejlpeVhDeTJ4cW1FZzlBZ2thREdsNWxJQVBmbXl4SDU5dkZwUnZHbXNLMUJZ?=
 =?utf-8?B?UU1nYTlpR1ozZ0FHdWNOZTJDcG9OVXlmbHVmUWo3K3VDSTlxYXFGaVNySWtp?=
 =?utf-8?B?cFZ5K0ZRQVlUNVFCcFhnMEpuM3Q2R0ZGcXNBYnhVck5UTG0wc2xUZXZRNmlu?=
 =?utf-8?B?dUFvTXJHM0ZPWlhoZXRkM05SUHdSUGxMVkZVaFVYR0pmelEwOWJHa0JLYk1t?=
 =?utf-8?B?d0FCQUI3ZWMzQ0FMZG9YdVRja3ZkMVB3eDNpUG1EazExM3cydGZTRVVIWXMz?=
 =?utf-8?Q?ETFJnTuvsnU/PRlXvxdtl9/H09khUgwrV5gekRW?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1299C52BB51CD34A8571AA543F16B9E5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0fc044-70a1-4af9-5739-08d9112ec07c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 08:04:34.0520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gf2oXApwdbza/Q1xbhO6AOKoycPLi2cKO1eblmbMPE0rpTCUuBlMkna7w4aJFcVfq9azgZa64a1nK08akOm9HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1639
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gRnJpLCAyMDIxLTA1LTA3IGF0IDEyOjQwICsxMjAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0K
PiBUaGUgaTJjIGNvbnRyb2xsZXJzIG9uIHRoZSBQMjA0MC9QMjA0MSBoYXZlIGFuIGVycmF0dW0g
d2hlcmUgdGhlDQo+IGRvY3VtZW50ZWQgc2NoZW1lIGZvciBpMmMgYnVzIHJlY292ZXJ5IHdpbGwg
bm90IHdvcmsgKEEtMDA0NDQ3KS4gQQ0KPiBkaWZmZXJlbnQgbWVjaGFuaXNtIGlzIG5lZWRlZCB3
aGljaCBpcyBkb2N1bWVudGVkIGluIHRoZSBQMjA0MCBDaGlwDQo+IEVycmF0YSBSZXYgUSAobGF0
ZXN0IGF2YWlsYWJsZSBhdCB0aGUgdGltZSBvZiB3cml0aW5nKS4NCg0KRnJvbSB3aGF0IEkgY2Fu
IHRlbGwgdGhpcyBFcnJhdHVtIGFsc28gYXBwbGllcyB0byBQMTAxMA0KDQogSm9ja2UNCg==
