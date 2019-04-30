Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFE110022
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 21:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfD3TPq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 15:15:46 -0400
Received: from mail-eopbgr150108.outbound.protection.outlook.com ([40.107.15.108]:44158
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726123AbfD3TPp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Apr 2019 15:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iO6c9OefnZxinjt87wkNZfNqtVqaajtSkn/uhMyjAvk=;
 b=VBreA40Wh2nt3nmXdcLJnJL61nNnHl2wrEPzGgIUnBxNwcsiD38qqDjuuJBYcQMm3AHT/BTSdKJs7jidA0JoPXI2uJIIn2gtCws5p0m0zilRK6h/eQPB/d1iZcn+kpK1/rmu/SMMo/M4VJC3PEHbWTSYCTuv2dFonhEYLyvmoIc=
Received: from AM0PR02MB4563.eurprd02.prod.outlook.com (20.178.17.97) by
 AM0PR02MB4500.eurprd02.prod.outlook.com (20.178.19.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 19:15:41 +0000
Received: from AM0PR02MB4563.eurprd02.prod.outlook.com
 ([fe80::e80e:1cbb:5e37:b8c7]) by AM0PR02MB4563.eurprd02.prod.outlook.com
 ([fe80::e80e:1cbb:5e37:b8c7%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 19:15:41 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PULL REQUEST] i2c-mux for 4.20-rc1
Thread-Topic: [PULL REQUEST] i2c-mux for 4.20-rc1
Thread-Index: AQHU/4jSYsaWfc1w2UeMl9+o5RIxeqZVEx4A
Date:   Tue, 30 Apr 2019 19:15:41 +0000
Message-ID: <aaa181c8-8966-0b56-e793-9250767eb600@axentia.se>
References: <3a139b00-0749-e8bf-08f2-857e68f7a828@axentia.se>
In-Reply-To: <3a139b00-0749-e8bf-08f2-857e68f7a828@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR07CA0026.eurprd07.prod.outlook.com
 (2603:10a6:7:66::12) To AM0PR02MB4563.eurprd02.prod.outlook.com
 (2603:10a6:208:ec::33)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d453d44e-5cf3-4114-8ea5-08d6cda03c88
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:AM0PR02MB4500;
x-ms-traffictypediagnostic: AM0PR02MB4500:
x-microsoft-antispam-prvs: <AM0PR02MB450048EEA2075508686FF7BBBC3A0@AM0PR02MB4500.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(366004)(136003)(396003)(376002)(346002)(189003)(199004)(58126008)(86362001)(26005)(52116002)(99286004)(316002)(102836004)(65826007)(256004)(97736004)(110136005)(2906002)(31696002)(186003)(64126003)(476003)(446003)(2501003)(3846002)(2616005)(486006)(11346002)(7736002)(6116002)(305945005)(76176011)(386003)(6506007)(508600001)(229853002)(6486002)(6436002)(14454004)(8676002)(6246003)(81166006)(81156014)(53936002)(71190400001)(36756003)(6512007)(71200400001)(31686004)(66946007)(73956011)(66556008)(64756008)(66476007)(68736007)(8936002)(25786009)(66066001)(65956001)(558084003)(74482002)(65806001)(66446008)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB4500;H:AM0PR02MB4563.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ESmy4fuiY5uNAOU+il+VLw0w1ECKm159QXZvXISFLTwkERtjqxes5x/g5sLg8d4mI4oVE7FTzoxldJOy73cOouU4WWmUdJ/CkDJk023qbmTFJJ0D7R9vAF8M74W+7YcxqopR7pdV6/3cWoPVhVUwVsvZ1q6Lt+5dMgxJNcJv1hUgbHLpsZ8qSlOn2fV0zez86IeHVtK1JZtvtH9pvh/wdUSTWk2kBSdJdzSy0DHBlrduBIVKaBC5aqf3Qph8HwtrLRYHL0zq3yjcHbMZ7DoVaNG00TGM+xwv8MfeF0TZLSCBcEd4wcMFEKYDQ2vCJ7AeugL4gz2xOz5o72Q4olCanFc28ms8yi1ovGQzHZJuzwD3ImhC9cbQ2bHcRVbcKYkDqQ5rwXHYq85YZrcGJ4EwJDMbqlPcbt84WX5LZrRP3UI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A80557CB6DE9A740A7881F711D84E1DC@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d453d44e-5cf3-4114-8ea5-08d6cda03c88
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 19:15:41.6199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4500
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SHJtbSwgaHJtbSwgZm9yIDUuMi1yYzEsIG9mIGNvdXJzZS4NCg0KQ2hlZXJzLA0KUGV0ZXINCg==
