Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE63228A33F
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Oct 2020 01:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731357AbgJJW5T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Oct 2020 18:57:19 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:52950 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730297AbgJJStS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Oct 2020 14:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602355757; x=1633891757;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rdOJnTBbA7t79OkULJCMQPqkvHgSa0VE6JCs4NmyIPk=;
  b=H2OCq1hBCmP2WABLDpjM64IwfEs9oy+8tgjuO3nFEX0kLZVJKswIXQX1
   U9u/SwSHLsgMfdFck56QLKFIPkXIU1M1qF56w38I+/PFdvJIIZ7Bso+CN
   5K9Fc672yF7L2Md8Z+Gx/GzHhBueEMGOhaTMufF4XXFQzjASGxwC9b9O8
   oV3om/GIVE9NKSAoAjEXuezVZuCjCW2RH/d4vQ7908PyfxZ3BORKjkbzH
   3Z104XKRdeGvOQN3R0fMShayWnR/lApGOGS7JGTHr3KpgMcWJkM9nKYKJ
   vhKZmCpH+7cCDS+XLhfrLNO3QRZWyZoPfBDnDoUBAPYEq3yiXBTmoSpcP
   Q==;
IronPort-SDR: Xb/KXgqMkNLe/hxM5RG/9ZQM4+SpExadgpmyMbjsgAH90DwG6+z8cleZy+Tq+Q6yaMlFRL692/
 OvMFPWltJm95sZ3skl/mQ/wwFbraxP0OTLc9EZPHNF2nmnmelLLDhwCHUsDppJxKCs/JRML5I+
 qBjxGMOpJ0amtQ7O8wgDzKCAWyyjF/2w7yeifTN1S7PW8oNsa8y2JGsUxwy6UgvgpIrjX+2sJT
 vMF3GXKA+ogOTFxpRKlw001rd1GFeTuyimLrrEFenAhKqcb951MpMvid/5L1OjAvf8IKP9ZNTA
 NLw=
X-IronPort-AV: E=Sophos;i="5.77,358,1596524400"; 
   d="scan'208";a="94123941"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Oct 2020 05:28:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 10 Oct 2020 05:28:38 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sat, 10 Oct 2020 05:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3Keq8fOatEsVu57t+ySuiybvf4FH9KpEBm3fLowL3G0nwQ2mceuukBcsv9PESdSFbxL+Tqfm0yQHyoUYH2YgyOcdQsD224kazCT1OR/8fAivjBOAC9P0BX5uAJlfMP51TXioSzm7WYhoz249aEqEaV1PYe7vjpgAsyTSq0T5wy9mBJo+lDRXiXsHN0rFNTYw0+oePTQhw06wUnnNUMH5+CrNMyMQ5H59MQ4aUtdaeoTKhudW0esbT+GpurAKuiQ8Ig/rA0vSNAjQDa0oKfjEXGOZKyDVCfldkBw3Sg+Xf6A+ESxC/5LRfiFh8UKQbA+K9pfjeIZ+PlK8OyReswKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdOJnTBbA7t79OkULJCMQPqkvHgSa0VE6JCs4NmyIPk=;
 b=nPkBEM1StL31oR+H1DqFozcvZMyINyjf9gqpmOkqkD8RLd+mc7TMvQkCTsETgRr4OafCecLF6PHU1hC3akV8AE/bzxRYHyehH6qzIBSP+xilgkVqQOePx/EB6b7YGDvCa4LKKgHvbefXMoVyYU9To47qpWzgqxM0BjEebDHig1YIAWnKCRPwU9qFt7Y3uR3Gnvr5wWI/fPA8rZ2bm1F6aNl/h7Ysdo/inoVrxzzlKVO/eaN2mHD9wTftWQdQ8Yg880eoKHy5VMuQObvN7bfB4ZAIw55ITsklfhahM0HoYWzq9QILpDdBi5/Jfq0p+r3WqG6yXZ0dJckmDPb30JDyFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdOJnTBbA7t79OkULJCMQPqkvHgSa0VE6JCs4NmyIPk=;
 b=HbPpXDD4EbQiJS43NYctz3SpReZSeSx/ajUm2ktEt56Y7s1AJUj2mRhB+TN83LLXQ+8GtCSVlmiulmYILo4urlDN88g0Kcungbm25UIXN/WFWW+vz9hQ7jldfEAxVbC5rDWNuKn28U+Z7VIYc3Ut77uHn2EBr4Jqqc8RZ9/um5k=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR1101MB2344.namprd11.prod.outlook.com
 (2603:10b6:903:b4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Sat, 10 Oct
 2020 12:28:36 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::908:a628:69ca:d62e]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::908:a628:69ca:d62e%7]) with mapi id 15.20.3455.023; Sat, 10 Oct 2020
 12:28:36 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <alexandre.belloni@bootlin.com>, <wsa@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <Ludovic.Desroches@microchip.com>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: aT91: remove legacy DMA left overs
Thread-Topic: [PATCH] i2c: aT91: remove legacy DMA left overs
Thread-Index: AQHWlzn5NHk2l72zNEC7iGZiPhBr5qmQ00kA
Date:   Sat, 10 Oct 2020 12:28:36 +0000
Message-ID: <15861d85-9381-31a2-40c5-179973f99277@microchip.com>
References: <20200930145655.3044490-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20200930145655.3044490-1-alexandre.belloni@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.121.164.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f95170be-0054-4efb-e837-08d86d1802bd
x-ms-traffictypediagnostic: CY4PR1101MB2344:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1101MB2344CABB36A73CE55C50E873E7090@CY4PR1101MB2344.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l98zZvZYia1y7sOX7N9L4vuQX/DWdoQcxl+ado2KMjdwBbdQlltoKqj8KlkqJaSQMH/pqYzlf891w9ZFqISvnSHF0b+rO8IRp2A/TyfVgXy0+66CbfZLa+3Lrvw2Rjf3lTNUJI5MQtJ/+CU1Quzld25eeJWIuNGEIuO973y80m0NlXRxTope1S429z0q5BnmzXXJJomxBT0epVyyF0g/KS4LBgoA4dsnKQS5ZNf/DjGxJIVinhnUBSMaUCo5wD2CJyFZGIygEVwVNujqiy8PC6uGAUbl8i5a1Kew6+e/5cHa5Bkkv/TcLLCk3/3hF1GDT7Yyjy1th9eYTXPfWKjvJT89tcJBxZElxB3tA2q1VtDKh3Ce3xVAeasda4Td83JE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1101MB2341.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(366004)(376002)(39860400002)(71200400001)(31686004)(110136005)(478600001)(6486002)(91956017)(6506007)(76116006)(4744005)(54906003)(2906002)(8676002)(8936002)(2616005)(66946007)(64756008)(66446008)(6512007)(86362001)(6636002)(316002)(186003)(36756003)(26005)(31696002)(4326008)(53546011)(66476007)(66556008)(5660300002)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: l4XeT0IZxKXxL/DqumU61JxPj3ugiSDXm8xYlxNoK93nINif6Bkcl2y3CI1JT4byCYDEp3z87zFZ10Rk8S5EgPHYii1vK2Bd/YNQogguGgGvXDpb3G+6GrJb65Vg3EyLTJwP1b+mYdfOCUeDyqTlT/GMlLDGoeqRuFYvmYEFGlWJMPyl7ZR47u+rdZWIQxHriTEbxbL2FIxN/S9Arjy21RVaWRAq/K61XuyG2womukS8Yh+77S1ywMzeXEZ/zjvnG5HTPH2QJT7xB0AqIi6P/dUr2Hvrfifac48zVFRTKcFQndG9sB0NpGe7Aa8Lui5F1tOtIyCjDKshK69s4EytZlgHIdNIYqraIkPhsbPIfiFK+yEZwILhq2rde9hx7wN08l1VXvx5KlQtZx2COxOoXzhs9/WRxCGZeqtghOaJTZ9Za8QiObttx6NcftKL4TrNyYTsva9WygXIYijRGuo/97sD1TZIlf8ud+Qh/pY2jijTQe3W9tF44LmVD08rXeGt1YVNyhZ0Mi0cMOKqtGOCNPMIp9H+rKF+PCZjxRyKHrpFFOHSFMWjaQ4St/n+GkPwLQm8FApgN6ImkqBRByDGXh1W+FyxUcI6RzQ4gUUU0jODUfFQlVIUzIGuQiOcjMtNOxbU+bnL+cbRR6Kf5cVuOQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B271F7AADE03743872C0E60BCA49A1B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f95170be-0054-4efb-e837-08d86d1802bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2020 12:28:36.3538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vk/33hJc4MEh0BkwNsiZIcWNwWtjuuLQ/lcnyOvWcuOkBHrtvxSxu0OMC/a9tnZXinZCRCBD8yQpcIa6XcR3PMwDBAV8NyZPa1oOJWuyr+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2344
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMzAuMDkuMjAyMCAxNzo1NiwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQ29tbWl0IGRjNmRmNmU5MGRlOSAoImky
YzogYXQ5MTogcmVtb3ZlIGxlZ2FjeSBETUEgc3VwcG9ydCIpIHJlbW92ZWQgbGVnY3kNCj4gRE1B
IHN1cHBvcnQgZnJvbSB0aGUgZHJpdmVyLiBSZW1vdmUgdGhlIGxhc3QgdXNlIG9mIHRoZSBkZWZp
bml0aW9ucyBmcm9tDQo+IGxpbnV4L3BsYXRmb3JtX2RhdGEvZG1hLWF0bWVsLmggYW5kIHN0b3Ag
aW5jbHVkaW5nIHRoaXMgaGVhZGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEJl
bGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KDQpUaGVyZSBpcyBhIGNhcGl0
YWwgJ1QnIGluIHRoZSBzdWJqZWN0LCBub3Qgc3VyZSBpdCBtYXR0ZXJzLiBPdGhlcndpc2U6DQoN
ClJldmlld2VkLWJ5OiBDb2RyaW4gQ2l1Ym90YXJpdSA8Y29kcmluLmNpdWJvdGFyaXVAbWljcm9j
aGlwLmNvbT4NCg0KVGhhbmtzIQ0K
