Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B033761D1
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 10:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbhEGIZn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 04:25:43 -0400
Received: from mail-co1nam11on2081.outbound.protection.outlook.com ([40.107.220.81]:49953
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233681AbhEGIZm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 May 2021 04:25:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QU+ILWeGdXUhuzBgd2B4RaK/zN9r5Wuer7+T5lsrLyxo+JduYpl5NnDRfwmVlKuS76qW6C3dOvXVgB1YuU2mNA1bePjclYz0q5AmVc08OsMrSOwnaKprqKYOfm/AchGjEVS3HWjciyea8teAGZiraIADIrkor8QSddVSfFXgdmGk9U71SKn7zioBVeHG+0EPjU/UyDIrCHNwGaIS7q2HPsjxd+pX1OHYuURSX4ij0DcllBRJ8c1Aa5KoTEe95PRaqdlZASawp8uJpxbAFQ2/l0T7uv1B3hE5opJl6BglH/t7tsdxKZhLZV+bZ/nVLfsG/2UDhDId8qyrshYGt9zv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdCk2KB/TY+wQhYefwlRSOoBYDo1F8FvKdHqoVBIzzA=;
 b=iZg0NJ9PeiSLmD8BcviFJPLcsvdgK0Bdw0X+dJUJUYNQLNNWgzuOpInxJRttOTuKfI8bZCVf7s3/Xrk2/uhuXMbH6W4oIznqpT4TkZKEBrvKBhG7SmqH2eqbJh8x2b7fffWd1nmaxjqp0PS27N6UmQ84ZPmUlNSfyNcNtZOATHJG5n2yX+Of6wMlcoaX+PMHoLoVSSvl79NoH6SOm3m/LlApzfvOIoWo1kNOOKrPWdGbFFOazJveCKhgV8THSC8aTBO+2dvGg3zdcPcD0C+s2oDBhADvnBDzBzu370vvnBe+7slEu1pr4MKBII1oFfANLrJ9AehYOW16Xaia+tr+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdCk2KB/TY+wQhYefwlRSOoBYDo1F8FvKdHqoVBIzzA=;
 b=Pu9Xvl3M3h81eDevPAB4BaEWDr/ASLQPutyYdG4uNN1X8sQ/UHlAmBitpH+BIBuJ8WwXwkCJodO13YKeK/7iiJLiNap6Hm850hoOxdk7Itcq4IAvNeACsdCIlm0wlx/GLmwSXMPINxsFJ78RJ6OXyYbN/SaIz1F/Qfq3yQE6CXE=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1751.namprd10.prod.outlook.com
 (2603:10b6:910:b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Fri, 7 May
 2021 08:24:42 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::111a:21e3:db9c:4b2f]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::111a:21e3:db9c:4b2f%5]) with mapi id 15.20.4087.044; Fri, 7 May 2021
 08:24:42 +0000
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
Thread-Index: AQHXQtm2VCM1Nld+oEKeJM0gRsT08KrXqYUAgAAFoYA=
Date:   Fri, 7 May 2021 08:24:42 +0000
Message-ID: <cc8d990216e159ee1dd463511d538baf9a6cad1b.camel@infinera.com>
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
         <20210507004047.4454-3-chris.packham@alliedtelesis.co.nz>
         <5e625652e3f980b7cd9fb86fe3d66f19a2f4201d.camel@infinera.com>
In-Reply-To: <5e625652e3f980b7cd9fb86fe3d66f19a2f4201d.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74f1941d-60a2-4279-c5a7-08d911319059
x-ms-traffictypediagnostic: CY4PR10MB1751:
x-microsoft-antispam-prvs: <CY4PR10MB17512DAD9ACE3503E12CAD3BF4579@CY4PR10MB1751.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +TZ7WbAAFGztUWK6TeibybW8G/jh682R9Co6qahGZHBBqpfAgojagxzlnbQM4ZnAwnIxvJ7lnBYh8t9PMc6696b+4DazuLSPwuXiW7pQduOX9CRkYfZLkgRUaHTO5N5wY0SMxPiRXRARqKuhNRXLUDw8njBhj2axHG8JsgsRfqakcilSiEZ3ED+WB3r8EOi92sLgKbflXhe7OLSNw9Pe1fHZBisyAqSFq5NPvCsKrTSx1tEwMJIrULNUwgoUpJuJ05OXG9Xkf2lgGDqooQEVvevoc6ZQ2Y6hqNbdSXA+TXHBWS7iUbDgSmi9GewcmWX67RcBjgVB1C+iYKlyPQNYAC/Vw+NkJJHtZ2C25dUNJiV3YkdWMOcjbcHPDC2xJ0m71tRsx9BgzX5RjV2KpQadk16YEGp5V8b0EC8NnTrWiYcRkCpqhWfmbYdd6U5SYi7jZ4xW73TKNZm2e2XDQ7NvTJ2bbzlP7WeQxHhvfZnzPmuLogiMlwWolzeh15RPT4slLrlAylfRNiPfm07LMk8tX+ziEEjtDcmFDGOCUoHwczvWkHVuBA/+u2LpErlWEUi0htUC+H9pgdoKT2PFcjjYDO3Um5SmqcJVNxRQ1ked5frAN315TGq4HMUqw7Pwu67annWCFreAr0C54eD58P+C8fVcW34FbTGcgHWATEhNik2/l7IjU1TxMMsesfWeB00F
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2389.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(86362001)(7416002)(2906002)(122000001)(966005)(110136005)(8676002)(6506007)(38100700002)(6512007)(186003)(8936002)(498600001)(6486002)(64756008)(66446008)(2616005)(36756003)(5660300002)(66476007)(66946007)(66556008)(91956017)(76116006)(71200400001)(26005)(4744005)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RnhVaEtnK0JQbHJsYmxRUjVOVC8vcEZrL0pBMlJzcU9kQVVvVGxxTlZWbUJy?=
 =?utf-8?B?dU53c0p0NHBFUDRFaEhEZGhTTWZweW1lbUh3dlJqNlViY3pPWWFuKzZLbUlJ?=
 =?utf-8?B?ZURrU1l4S1kvWTIzbEtlZFBSTGxMbFZCZ0t2YXhhdzFKRUkxdGg0N0wzV1cz?=
 =?utf-8?B?dnBYZlF0TncwMzFjb1c1MlpDMWNpbjRvTURqdEtDNDE4UFBpUWRrKzdlYVY5?=
 =?utf-8?B?Um96dDVSc1NVRzFLUjFXT3laMDJWZ2FvbFRuVXplcmFjbGFpeVk1RjErUHU5?=
 =?utf-8?B?bTVxK3RoNDAzTTZvQm1nVy85ODVLSzczWXdvZkFweCttSFVkQUwvUjZVSUJV?=
 =?utf-8?B?cE96N05IT28wUmFQRHBTdElmb1VzNkhybmRNMndwTjN0UjFBRzUvMk42d3ow?=
 =?utf-8?B?ZVEyREpaQ3YySG50Vm9WbCtpUGxHRDk0VHBudDRMaWQrSnZ3WUc0dVRtcmg3?=
 =?utf-8?B?N2w0bEZyejA2MlA2MDBvMHpjM0FQY0lEdFcvWm9aL3Uwd0d6UTFWUS9rN1VF?=
 =?utf-8?B?SU9zWDIwOGUzdU96VS9GSjUvNGJodGJWSWNrWE55bzl0eHE1V2hoQzNFSGxU?=
 =?utf-8?B?Wm1nd1c1WFpWU29ob25UMDJ5bHkwWmtRcXR3U0oxV0hTbEVlcGdXN3N1b1lm?=
 =?utf-8?B?RDM3YlBiK1hyVXpDdmpJUnJzQndRQlZ0WGk5b0ZoenVDUXMzdE9MOWg1aFAv?=
 =?utf-8?B?VFJsN2c5Sk1VMW0wVE9QaTVacGN0aW9la3puekxiTUd0SUVCTURjUDBNdWJh?=
 =?utf-8?B?MlpJOVdCeUhYZXh4c1A0ZWdJZjUzY1lXREIwVDlkTHhlblNjSjl3ZEEvY2ZE?=
 =?utf-8?B?clkwUmdpcWZVUjJIaTlEbi9YbmUwYlMxVllQWXVYRytkSnd1eUpuT05iREhS?=
 =?utf-8?B?SXhtTC9hTHU1QkhpWS9KSGg1Qy8yNlpLeCtQV0VaYUlrMTNrLy9RWTJsT1Rz?=
 =?utf-8?B?ZDBCaUdlNENVZlJrTXBEY0pzdFVFd2R3d1pUSUV0ZU5LZHFxeXlnNmh4WlFR?=
 =?utf-8?B?Y2Vjd2k2eFAyS1NEcVlVWEdJZHpyV2FBeVJ2TWdsSDArRVpDanh0alRiNEJ6?=
 =?utf-8?B?TlYrVFRycFA5c2JKMnJTUldVcWZlU1FHT1lUOWVxbWNWSUtkSlVqQXI0T0hn?=
 =?utf-8?B?K1h6VjB6d3p1OHR2ZEdnZ0FCdkwwQlI4dVhtcXBjL3hnV2h2aGRpazdhSFI2?=
 =?utf-8?B?M29xWXhLZllpN3RoMmprU0VQVGtxRi8xWE5YRGxhMHhmZjFvSnFBcWh3bTdp?=
 =?utf-8?B?ajVQbVVaaXBtNDRtaGJtSTVYOWNESlQ5clVMKzlkdnNUdTh4N2dyK21YMXpK?=
 =?utf-8?B?cENaZlNNamlUVmlGR2hFSDRZMG1kZCtQbUFIb010c0NUY0F0R3JOOTZyNXNU?=
 =?utf-8?B?YklHaVFhSlEvemF2THprS0Z6WS9QVzhCSjc3S2tDN2x5WjM3REhGTDdTMlRy?=
 =?utf-8?B?a1B1K2RPR1ZRdGRsRHZLdFBuRkd2TW1oaXEzYmdjZ0JSeW5QemhQQzVrU3hX?=
 =?utf-8?B?VnEwTEU4WUxsSlRLV3JyV2JSSDJRQmplUlZDWkxCQmNpYkJaRkttM2w2b1U5?=
 =?utf-8?B?cUNQOHJNRlNKL05xbUIrVGNla2V1VHlGOFFMNHFXeGwzSTl0VnNDV3gyaGRP?=
 =?utf-8?B?U3d2RTE0bm0vWUc2MHZqa3BRa2JtamhwSERRT0ZWYmx3RkJSR0xSTDVQQjZZ?=
 =?utf-8?B?eTdWT3RORzJvdFduUStFUFdoc0FwVGlrQk1DdzlaNWpQVHhZRFA1a1FLa0Y0?=
 =?utf-8?Q?N3l65GrkjIxMZo0w8yv5BQJxmdxkzcDcLl/t+IE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <552A2A3BD6E7B74781E87CBEA29E97B3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f1941d-60a2-4279-c5a7-08d911319059
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 08:24:42.1408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LrosVLXLA/41grnJ4J7u7SJONO0RCxPdmhlkSC9X6coTtDDapsVsI55jrsQjxF36yBAUdfEV/r7ik+Zl1JkqHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1751
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gRnJpLCAyMDIxLTA1LTA3IGF0IDEwOjA0ICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBGcmksIDIwMjEtMDUtMDcgYXQgMTI6NDAgKzEyMDAsIENocmlzIFBhY2toYW0gd3Jv
dGU6DQo+ID4gVGhlIGkyYyBjb250cm9sbGVycyBvbiB0aGUgUDIwNDAvUDIwNDEgaGF2ZSBhbiBl
cnJhdHVtIHdoZXJlIHRoZQ0KPiA+IGRvY3VtZW50ZWQgc2NoZW1lIGZvciBpMmMgYnVzIHJlY292
ZXJ5IHdpbGwgbm90IHdvcmsgKEEtMDA0NDQ3KS4gQQ0KPiA+IGRpZmZlcmVudCBtZWNoYW5pc20g
aXMgbmVlZGVkIHdoaWNoIGlzIGRvY3VtZW50ZWQgaW4gdGhlIFAyMDQwIENoaXANCj4gPiBFcnJh
dGEgUmV2IFEgKGxhdGVzdCBhdmFpbGFibGUgYXQgdGhlIHRpbWUgb2Ygd3JpdGluZykuDQo+IA0K
PiBGcm9tIHdoYXQgSSBjYW4gdGVsbCB0aGlzIEVycmF0dW0gYWxzbyBhcHBsaWVzIHRvIFAxMDEw
DQo+IA0KPiDCoEpvY2tlDQoNClJlZmVyZW5jZTogaHR0cHM6Ly9tZWRpYS5kaWdpa2V5LmNvbS9w
ZGYvUENOcy9GcmVlc2NhbGUvUDEwMTBDRV9SZXZMLnBkZg0KDQpBbHNvLCBJIHRoaW5rIHRoaXMg
c2VyaWVzIHNob3VsZCBnbyB0byBzdGFibGUuDQoNCiBKb2NrZQ0K
