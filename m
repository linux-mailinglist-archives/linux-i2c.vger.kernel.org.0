Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30F1513DC1C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2020 14:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgAPNeZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jan 2020 08:34:25 -0500
Received: from mail-vi1eur05on2136.outbound.protection.outlook.com ([40.107.21.136]:15052
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726362AbgAPNeZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Jan 2020 08:34:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzZVoCxfYJ2A0OPz73+Ta/3PFTYwXDJ8Pf2UUjKO2c8CBYSN0+XTJaMUpPkqyS9FO+sb3j4ychZ0+mVQtpExTXWZNyJZiLAGRWXmo52RICj42apP5eOAvLV9fYpwUVq5nZo3CWbvaWn45cJSQujJJnxpR5J6BWMdvVYnr+bVGDvsVJPMzEefJAhxzY7DA1GGExDaq3XxriNBUQyZsepX1XV7BDrJHhJu5EBhmoZuGYaR6zsBlTo9a63HqNuz+8uV7YgjfpZWDaouHAEb3y1U3PUkO4EAlYFU8xJixjlX9J57aOPTgyIH79zQm9AKL3TATjx5WtndKRsySOp/DtTLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtYMwBJ3zQ4610/BNfjKw0TdmqMIdtDEpXtX1DeQgUA=;
 b=VHBQaDU0WuzceODM5MS/0Y7t+lQqO+9bNMdVO6PxBGemrd517d7w00IHoO25A6WwhwD5yGj5Jg95QGFOG4duCiMYOlF0TEK/jyyGsDOjV34By8HsVaZXuhVsL+h3UsIgBKmV0Mw6DqfOASmP1DzDlnVLc7zNBusOoeE3naN96tr5OhQR/BITlhzbdC28KYY0Gxx4I23khJtdamkCOmX+HUJvFhQP/PwsbGHPyXF6Ed/xso5SGJsUbS2nuEo44E6y0NOAQVltB7GCDSnLyPCHSkMUoOb8n3nKeChKUqy9YFbIjcNsQ5VP2FBi1yFDRU2DvnkQnP0an+3T/gvJ47Sj0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtYMwBJ3zQ4610/BNfjKw0TdmqMIdtDEpXtX1DeQgUA=;
 b=jbG0SmCkZ5brFjXDWsrlcptfRdxXCr9h+WDcMGPMt7LUX0ZVSkF6gzDXAjEvAC5tBqY5T2R2WmMbU/TJBEr8kL5Y+1upQs1vPKuAJvL4uG7LzLmjKrez2atg2ZHIQkC/DSkAXVz7lKKWiwwwcDRbWnJVpodBsn+Goqs2Wz/iObA=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3404.eurprd02.prod.outlook.com (52.134.68.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Thu, 16 Jan 2020 13:34:20 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2623.017; Thu, 16 Jan 2020
 13:34:19 +0000
Received: from [192.168.13.3] (213.112.138.4) by HE1PR0102CA0067.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend Transport; Thu, 16 Jan 2020 13:34:19 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Jean Delvare <jdelvare@suse.de>
CC:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 26/26] docs: i2c: rename sections so the overall picture
 is clearer
Thread-Topic: [PATCH 26/26] docs: i2c: rename sections so the overall picture
 is clearer
Thread-Index: AQHVxGXNDNQyASjxnESfoQNX0mbuZqftG5eAgAANv4CAADEpAA==
Date:   Thu, 16 Jan 2020 13:34:19 +0000
Message-ID: <4a3a9917-5f20-2ad2-3fcb-5e9e252a2a3d@axentia.se>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200106074905.14438-1-luca@lucaceresoli.net>
 <20200116104907.3f2de4d0@endymion>
 <7809c0c2-1d83-cc95-b258-644ea8315f86@lucaceresoli.net>
In-Reply-To: <7809c0c2-1d83-cc95-b258-644ea8315f86@lucaceresoli.net>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: HE1PR0102CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::44) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d5ec4b7-6f01-4c0b-fe7c-08d79a88ca53
x-ms-traffictypediagnostic: DB3PR0202MB3404:
x-microsoft-antispam-prvs: <DB3PR0202MB34040C48D322085CFD449D4EBC360@DB3PR0202MB3404.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(39830400003)(396003)(376002)(136003)(199004)(189003)(66476007)(4326008)(5660300002)(53546011)(66446008)(8936002)(64756008)(66556008)(6486002)(2616005)(508600001)(316002)(31696002)(186003)(16526019)(86362001)(31686004)(110136005)(81166006)(956004)(81156014)(2906002)(8676002)(36756003)(54906003)(52116002)(66946007)(71200400001)(26005)(16576012);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3404;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cu3HpU5sRsZJZ2//3BWE77bD+sgkfap3omoAa5tOz4bYYAl54SqjyTXyNiF2WKSmwwarhClmdx7YY3Kv6uUNyalAGTZ0rCNJRJ7jJQjiYlYrXW88y2BOeLaw7hmGiRPZYu91E4/mrhpLUnkfjaJHexiV62MLWQQlsk0GHFx3QMc+m1dDUD+sVFTJ1QU5JZXf2FQAnYd9+s7SiuJrTKikwPokNCD5Bp2sA3GtFgR9a0DK7ifwnu/cSQYciIos6E9CG9ws6ZK6E1D8XBG3mOQNxWpZ7Sj2tLr6BHf/EQ+6HIfdU39mxtkms0igRyvLLJgV8a8tkeEfj8VJPLuLt0Zq+4bN03iGvcgTNqcOeRY0Y/KyMKcCYifN5aGJVXxdD4Ur/gcmbXunO3AUViXbKQZpdpLRGKF8HTJ+AtdgodHE2viMm4WHR8nA7y3M2oDqdWwL
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <94D8EA0D7FA6F947B6A39B1D514FEC28@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5ec4b7-6f01-4c0b-fe7c-08d79a88ca53
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 13:34:19.8695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2QgKR0IXhT43OZnQAs3oW3JuXmiuYjN4oN07MSDnTJcHuTAE8XeNycQXnScNRml
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3404
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMS0xNiAxMTozOCwgTHVjYSBDZXJlc29saSB3cm90ZToNCj4gSGkgSmVhbiwgUGV0
ZXIsDQo+IA0KPiB0aGFua3MgYm90aCBmb3IgeW91ciByZXZpZXdzLg0KPiANCj4gT24gMTYvMDEv
MjAgMTA6NDksIEplYW4gRGVsdmFyZSB3cm90ZToNCj4+IE9uIE1vbiwgIDYgSmFuIDIwMjAgMDg6
NDk6MDUgKzAxMDAsIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6DQo+Pj4gU29tZSBvZiB0aGUgc2VjdGlv
biBuYW1lcyBhcmUgbm90IHZlcnkgY2xlYXIuIFJlYWRpbmcgdGhvc2UgbmFtZXMgaW4gdGhlDQo+
Pj4gaW5kZXgucnN0IHBhZ2UgZG9lcyBub3QgaGVscCBtdWNoIGluIGdyYXNwaW5nIHdoYXQgdGhl
IGNvbnRlbnQgaXMgc3VwcG9zZWQNCj4+PiB0byBiZS4NCj4+Pg0KPj4+IFJlbmFtZSB0aG9zZSBz
ZWN0aW9ucyB0byBjbGFyaWZ5IHRoZWlyIGNvbnRlbnQsIGVzcGVjaWFsbHkgd2hlbiByZWFkaW5n
DQo+Pj4gdGhlIGluZGV4IHBhZ2UuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVz
b2xpIDxsdWNhQGx1Y2FjZXJlc29saS5uZXQ+DQo+Pj4gQWNrZWQtYnk6IFBldGVyIFJvc2luIDxw
ZWRhQGF4ZW50aWEuc2U+DQo+Pj4gLS0tDQo+Pj4NCj4+PiBOb3RlOiBoZXJlIGNoZWNrcGF0Y2gg
Y29tcGxhaW5zOg0KPj4+DQo+Pj4gICBXQVJOSU5HOiBNaXNzaW5nIG9yIG1hbGZvcm1lZCBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllciB0YWcgaW4gbGluZSAxDQo+Pj4NCj4+PiBUaGFzJ3MgYmVjYXVz
ZSB0aG9zZSBmaWxlcyBoYXZlIG5vIGxpY2Vuc2UgbGluZS4gSSB3b3VsZCBnbGFkbHkgYWRkIGEN
Cj4+PiBwcm9wZXIgbGljZW5zZSBsaW5lLCBidXQgd2hhdCBpdCB0aGUgY29ycmVjdCBsaWNlbnNl
IGhlcmU/IFNob3VsZCBJIGFzayB0aGUNCj4+PiBhdXRob3JzPyBHUEx2Mi1vbmx5IGFzIHRoZSBr
ZXJuZWwgZGVmYXVsdD8NCj4+Pg0KPj4+IEknZCBhcHByZWNpYXRlIGEgZ3VpZGFuY2UgaGVyZSwg
dGhhbmtzIGluIGFkdmFuY2UuDQo+Pg0KPj4gSSBkb24ndCB0aGluayB3ZSBuZWVkIGEgbGljZW5z
ZSBmb3Igc3VjaCBkb2N1bWVudGF0aW9uIGZpbGVzLCBzbyBJDQo+PiB3b3VsZCBqdXN0IGlnbm9y
ZSBjaGVja3BhdGNoLg0KPiANCj4gVGhhdCdzIE9LIGZvciBtZS4NCj4gDQo+Pj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vaTJjL3N1bW1hcnkucnN0IGIvRG9jdW1lbnRhdGlvbi9pMmMvc3Vt
bWFyeS5yc3QNCj4+PiBpbmRleCBmYzY5ZDk1NjdkOWQuLmFlM2JiYjlmZDhmMSAxMDA2NDQNCj4+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2kyYy9zdW1tYXJ5LnJzdA0KPj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vaTJjL3N1bW1hcnkucnN0DQo+Pj4gQEAgLTEsNiArMSw2IEBADQo+Pj4gLT09PT09PT09
PT09PT0NCj4+PiAtSTJDIGFuZCBTTUJ1cw0KPj4+IC09PT09PT09PT09PT09DQo+Pj4gKz09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4+ICtJbnRyb2R1Y3Rpb25zIHRvIEkyQyBhbmQg
U01CdXMNCj4+PiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+Pg0KPj4gSSB3b3Vs
ZCB1c2UgIkludHJvZHVjdGlvbiIsIHNpbmd1bGFyLg0KPiANCj4gTWUgdG9vISBGaXggcXVldWVk
IGZvciB2Mi4NCj4gDQo+IFBldGVyLCBJIGFzc3VtZSBJIGNhbiBrZWVwIHlvdXIgQWNrZWQtYnkg
aW4gdjIgd2l0aCB0aGlzIHNtYWxsIGNoYW5nZS4NCg0KVGhhdCdzIGZpbmUuDQoNCkNoZWVycywN
ClBldGVyDQo=
