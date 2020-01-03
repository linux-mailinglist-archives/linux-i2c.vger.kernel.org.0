Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFDE12F906
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 15:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgACOF1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 09:05:27 -0500
Received: from mail-eopbgr00123.outbound.protection.outlook.com ([40.107.0.123]:9536
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727523AbgACOF1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 Jan 2020 09:05:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOk+pt1CgMNFBDt/TXw5Q7hq8PV+BZBofjSNudgBmbSwrpXY+4AAN8cZ/di8CNhOEBwhux2KqPxLzjti7uEge4ajuhhw1kgcTblpHLgeO60UGAfdoZL3e+RiTlctyOZ+K9dAYgL5q8TWE3Z8q0+o6/ER1o0mNJe+2TiMGIe7XKKZrHvrhpptryaX0+IQRxAf2xHbP7TGkW/fafK1IU+fnxL13gam0W3dvNUzIWqjuXPPCfhgNGvsrd13pFjrBbnOEbGZRzPsHfyyF0uOwePBfOLmQwirmrmZEb7fv9oYvZqq7Thf36qLftLJAOeRXHqAKusFKszWQQNglYaushZw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOHmy3lI7yQ7oANwracM9mVnnZP6mcW47IG7reiXjdg=;
 b=Y9WtomckQSuF5/cmmJL3Nzb2tH61C07Rj5wq5XaForyb5l4eA0K+O3+6bpcpQK421Y/HwKbBPV6wz270S8lx5MB803vpyvjy6solMQQ8yqxHgZAMrFVqjEybCrEKuDWNypkAGaJ0C4hAdgZ0JN5cBKFCfQFgcOD7UZMBwIG1ALwahnkbYYDbgYDFgLA4G/SAUWjBuKHBPxifYidhuAGoFzcsnVVuVSi9AWPXDwzqaPenEcFLUZEDyAWoVRErybcRLpG3tSdM2bfRzx4CcbkTmv39vdMaQTU7fyCjqE+sSboURjEaWvp4zgu4V/e7PC/apyRuetbWPwOboyMehHUGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOHmy3lI7yQ7oANwracM9mVnnZP6mcW47IG7reiXjdg=;
 b=Fp8+LQo3ZRi/f3HKqGM34rKIvVCpDFCmuHTmvkErLjBlZC8vcFdthrsPc1zp6GHixq0gN+nxfYcpvQkEkDLJ+a5HuyeJB8s+g5cRCd8z8RsAFseu9ObMhjdegu7vJP7tZpWtXhb8jfKNrXKGm/O1NuEUwnxX+Smt/U93+UTlfGs=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3561.eurprd02.prod.outlook.com (52.134.68.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.13; Fri, 3 Jan 2020 14:05:23 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2581.013; Fri, 3 Jan 2020
 14:05:23 +0000
Received: from [192.168.13.3] (213.112.138.4) by HE1PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f7::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10 via Frontend Transport; Fri, 3 Jan 2020 14:05:23 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [RESEND v6,1/3] dt-bindings: i2c: support property idle-state
Thread-Topic: [RESEND v6,1/3] dt-bindings: i2c: support property idle-state
Thread-Index: AQHVuw9TtcGAyqD9p0aoW4HpuyVYKafZB4QA
Date:   Fri, 3 Jan 2020 14:05:23 +0000
Message-ID: <63bc0f29-5214-022b-99af-d585e5800f39@axentia.se>
References: <20191225103624.48342-1-biwen.li@nxp.com>
In-Reply-To: <20191225103624.48342-1-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: HE1PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::25) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5ee2adb-55f1-4775-3bd5-08d79055f9f2
x-ms-traffictypediagnostic: DB3PR0202MB3561:
x-microsoft-antispam-prvs: <DB3PR0202MB3561C64E1765A891B100AC70BC230@DB3PR0202MB3561.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(346002)(376002)(39830400003)(136003)(189003)(199004)(316002)(508600001)(16576012)(54906003)(8676002)(31686004)(110136005)(8936002)(81166006)(2906002)(81156014)(4326008)(53546011)(16526019)(71200400001)(186003)(26005)(52116002)(4001150100001)(956004)(36756003)(31696002)(86362001)(64756008)(6486002)(66556008)(66476007)(66446008)(2616005)(66946007)(558084003)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3561;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mb/PAmrhlglG+vlC264ZjoP/9Lne/5LOlo1ckd3EJRw9r83BR56shVi1RPTTZ7JSLsCMArZK7YDvF81YL3l2eGfNKXXTMHNmyXJpJ5I+UbF4I6cWNwutNkRj/TyFIUKIuI+Mz8xobR8bdS50/IIl+R4AmfPLwc44hl0PHhlVqPh74XFguBACWpfSmW1jpDZiD1TvNi9M+KKKAtuuGMpg6ayap5f2brt7EYeciJhP/Sll8tCPRd89kTV9Couh342TvSXCqOW0j7fj3dNcjqyGTq72pmXSRQTz9oGU+5gZH65UlmVUecqAXGQGzc75qMGQOz4IZiKl/UQxxZgePJbMASNlSpBqYUGSmr1S9zcI3OTcqQhuuQ6UAytcNc+rLKaT8mQsi6d6smaMibjZ8CmBrveY50ZMmDTic4fZ/bhckTKyD3o/RduW+jECN/WETgCY
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E99B8D1319CBA45A7B401B0C4209CF4@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ee2adb-55f1-4775-3bd5-08d79055f9f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 14:05:23.8255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JmbTfiO8CABMBnb9j6SMCf5bZvcJxkPrYU0kOnxD6s+/cGyBgU17JHlsDK+GH9kU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3561
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMi0yNSAxMTozNiwgQml3ZW4gTGkgd3JvdGU6DQo+IFRoaXMgc3VwcG9ydHMgcHJv
cGVydHkgaWRsZS1zdGF0ZQ0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29tPg0K
DQpQdXNoZWQgdG8gaTJjLW11eC9mb3ItbmV4dA0KDQpDaGVlcnMsDQpQZXRlcg0K
