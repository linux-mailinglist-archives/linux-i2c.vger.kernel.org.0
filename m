Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A031323C5
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 11:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbgAGKgy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 05:36:54 -0500
Received: from mail-eopbgr40127.outbound.protection.outlook.com ([40.107.4.127]:28800
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726565AbgAGKgy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 05:36:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyGLYbZ6MXqxLfSq0jMciEp4Sphxk7IDVEKXTVhX8sr2oDzQECcKA33fJQjzZLceM1A5JlQuyd56VcK2hE9AyC8PT+9Njo+HwLWoQY+wK4fh0mmiM7w8ySNx/P1FmOz8+kSb1OFURNOpkXy6yrYFtdhK1upOTgC697B1zFijAfsHOkRILyflCgNbcTiXgDn9n7uU8IjzEQcgzTxpFeovajtjnbyBh2vjLjJgg5xJJP+0s/fUyup4mPggKVBnNfDb/Zi5xy5KC4FrI313n/IXwh2rVujgvt4fMT2GRTR5aFNIqsju7VKjiPCtcmF+LyV1K5aNjwFkjU+iCUSx/IcxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTMGa+tZMotaA4nyahaS3i2Jf6sk/eQx4lwkL+MbWEU=;
 b=oPuiLCq4OyHi0OX/AjLGEO8/CxQI597WQoULB/ehuPmyfcxnjUw0Xi8fY8Z8y81k49vETQxXBDv8WcYdFBm6YlN9OV7wyVSck7DISU5cp3HQGEGqSCWb1zdaUEo5WXgLd7gCljGnGXaOYhsUNJp5+QLX0yYqUJzmsf8sGj5hdRZY4FE66ObZ5cesjINl+H5l7H9kpGFbroa/jviTf44lj2N3Sb+FlBOd1x9lnz3nN7VrVos1sSDhboKGBK4++CzrUcm4ClQy5kpRvPDf/ZBy25rhAjzJ2ovPT9YPdH5joJQn1Hh+B6Tnj/8A+2SaNTwwLlFUPjkSweWiUTj7NC001w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTMGa+tZMotaA4nyahaS3i2Jf6sk/eQx4lwkL+MbWEU=;
 b=fcWTO7BLtMC+0JR7foB67Avg2zWVK2GEwTfYEcP6vzBr//YyCOe7jOcik6S+m3vvGZRfmt0UAte07HAQldp883wDQx9bKw6qY9jiqAyq3zn73Xb5PNWQXyWeuSQ1tawh/67zi1LmR10gVIK93f9T8dt+NCV5FIAAbIM6JoQBm0s=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3435.eurprd02.prod.outlook.com (52.134.65.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Tue, 7 Jan 2020 10:36:50 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2602.015; Tue, 7 Jan 2020
 10:36:50 +0000
Received: from [192.168.13.3] (213.112.138.4) by AM6PR10CA0013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11 via Frontend Transport; Tue, 7 Jan 2020 10:36:50 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 26/26] docs: i2c: rename sections so the overall picture
 is clearer
Thread-Topic: [PATCH 26/26] docs: i2c: rename sections so the overall picture
 is clearer
Thread-Index: AQHVxGXNDNQyASjxnESfoQNX0mbuZqffA+4A
Date:   Tue, 7 Jan 2020 10:36:50 +0000
Message-ID: <18dfcdd7-4ca8-cd4d-de18-ae3931d31782@axentia.se>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200106074905.14438-1-luca@lucaceresoli.net>
In-Reply-To: <20200106074905.14438-1-luca@lucaceresoli.net>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: AM6PR10CA0013.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::26) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a110c6f-eda9-416f-b492-08d7935d812f
x-ms-traffictypediagnostic: DB3PR0202MB3435:
x-microsoft-antispam-prvs: <DB3PR0202MB3435E88F82B13559AF8B32DFBC3F0@DB3PR0202MB3435.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(189003)(199004)(52116002)(81166006)(53546011)(4744005)(54906003)(81156014)(31686004)(36756003)(110136005)(16526019)(2616005)(956004)(6486002)(8676002)(8936002)(31696002)(2906002)(186003)(5660300002)(86362001)(71200400001)(66476007)(66946007)(16576012)(66446008)(26005)(4326008)(508600001)(66556008)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3435;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eKWMcAfYqL1STWJdy1mnHefASDrzpX+2n52HRsPWGvhck4/f19skOnHlpV1eUwx7DENf8MPZjnZOtzlSp12IB2FhBMkpE6FvPt7ECG8gRMyjzIVWlJVAbZRwmhGC3ZBvxFx3LKFIzpucRF9HoNnlLZ4FYagOrlicl9f5YuIxUtSO3sgQuty+WOUb9RL3a/o2KzBHAioca2dDsJnOCCDQzCyinGZS/M3+uMet/DSlMqSuJiTgZPIioZovUq40de2WNao2QlLzMPb283NthnBt5rUhz8fgDwbcYFUZ74UxeV4XqtvouFmHo7r8dGzClVb15s7sR8ObKD2pCW/Yq6g+Ck9ExtnNRLzl2+z1IA0d72dkbQFIYpqeYq77gNRhy6j8jtToNOvtzyw9H6gW5k8pDxsMlB/siYE/XNS4FEHvIe3qTE/pMKymijMdx6ex2A+X
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEA0F610040C55459313E8BC691C8F15@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a110c6f-eda9-416f-b492-08d7935d812f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 10:36:50.6162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v9btLOmHN/GTNEuLoHo2ci2tZEYqGRtEcrOKVwWRXozWrSbFeMimsNLXS1OIkqGg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3435
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMS0wNiAwODo0OSwgTHVjYSBDZXJlc29saSB3cm90ZToNCj4gU29tZSBvZiB0aGUg
c2VjdGlvbiBuYW1lcyBhcmUgbm90IHZlcnkgY2xlYXIuIFJlYWRpbmcgdGhvc2UgbmFtZXMgaW4g
dGhlDQo+IGluZGV4LnJzdCBwYWdlIGRvZXMgbm90IGhlbHAgbXVjaCBpbiBncmFzcGluZyB3aGF0
IHRoZSBjb250ZW50IGlzIHN1cHBvc2VkDQo+IHRvIGJlLg0KPiANCj4gUmVuYW1lIHRob3NlIHNl
Y3Rpb25zIHRvIGNsYXJpZnkgdGhlaXIgY29udGVudCwgZXNwZWNpYWxseSB3aGVuIHJlYWRpbmcN
Cj4gdGhlIGluZGV4IHBhZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENlcmVzb2xpIDxs
dWNhQGx1Y2FjZXJlc29saS5uZXQ+DQoNCkFja2VkLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBheGVu
dGlhLnNlPg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo=
