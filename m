Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E444F877A6
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 12:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730233AbfHIKk3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 06:40:29 -0400
Received: from mail-eopbgr150139.outbound.protection.outlook.com ([40.107.15.139]:61214
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726196AbfHIKk3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Aug 2019 06:40:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIFEo5dWBg+wccjj6//dbPyQoK7K9vwoE1IbY07V60enQkybZgg6hzG+BgKNlBbuFFSzLN3mJnWPWozA6RfMYYrfU+l52F5JDqJKFnq6gG4f796IZPaOJK89t7ZFHgENsDx9hTszb+gr1tA2Bgc3eMC6NGDpGMnix0hwFy1pnsI0DafA38Tio6RSN/K4dP6crjrBdhieMtqV84fLIXjB+Frbf76g9nm8VkoLl4xh7E3nN84R3ApHMCpKlujos9fET+dGRlZ+6AFHI0CZca6XTbnt/IK747GEOVQ5DexmjLdLl/ro4DnINe9HVvWyPM4vWSMEYv3kXyB2pSFRYiToBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDt+rxykthRtZc3rocQ37U3sA3IPjoSAw7XV9MenHdg=;
 b=h+q8WOIkxmRv46ZEkGqjy2oLiTcFCB+pie1DNjlQMtt/gChFqkFFLZuueSrD7qyUE+Tq0/+GcmDMEsi/dZiV124T6v6bwD+uKEc3EjtZ7EGdguiHg2ZAk3cE3vXTotF2zT7Rrjg3ghVVsVXIiDKSd4l686qmBpzkR1vhgzp+ZJvdNJ9n/KQsTsB7ZkBuvByCJ0NzojKAPLSNVzsw2fZODAaQVjFM5/l/1K8s9gAoMEw3KfCoKxAUBSggk9LdEOKL/3FmSyqfBdlM2Kbh+rD1evwXcMbEXl6bOUyauvHnmBYLvECzyy6+VPrKCkSSgJfBG4q+u+v00D5R9ffggd/R8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDt+rxykthRtZc3rocQ37U3sA3IPjoSAw7XV9MenHdg=;
 b=reUtp43h9VE7ji7LPeuTWBiyGceZLll0FLfTQ59B3mRbzXXKnoluOA8tHLydm9MxTKAREKTz7g7TkpUNy/k0BlSTbCfkHnyQ/ynfgJf1ngHQ5ixBVz7KkHwUlGlSWtTsj7r1b9cqh1mIImV16TPV8NpmIXqzyitDiXMHQSTVlos=
Received: from DB7PR07MB6042.eurprd07.prod.outlook.com (20.178.107.151) by
 DB7PR07MB6106.eurprd07.prod.outlook.com (20.178.108.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.8; Fri, 9 Aug 2019 10:40:25 +0000
Received: from DB7PR07MB6042.eurprd07.prod.outlook.com
 ([fe80::7983:ce79:7be8:bc02]) by DB7PR07MB6042.eurprd07.prod.outlook.com
 ([fe80::7983:ce79:7be8:bc02%6]) with mapi id 15.20.2157.011; Fri, 9 Aug 2019
 10:40:25 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH RFT] i2c: emev2: avoid race when unregistering slave
 client
Thread-Topic: [PATCH RFT] i2c: emev2: avoid race when unregistering slave
 client
Thread-Index: AQHVTiMSV/GhjreW10G5tAhDxZI1hKbyoWMA
Date:   Fri, 9 Aug 2019 10:40:25 +0000
Message-ID: <20190809104016.GC25406@localhost.localdomain>
References: <20190808195417.13482-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190808195417.13482-1-wsa+renesas@sang-engineering.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0273.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::25) To DB7PR07MB6042.eurprd07.prod.outlook.com
 (2603:10a6:10:8e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2f1d68a-c800-40ab-c150-08d71cb5fcee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR07MB6106;
x-ms-traffictypediagnostic: DB7PR07MB6106:
x-microsoft-antispam-prvs: <DB7PR07MB610660B00D7EF5C1D77068F3EFD60@DB7PR07MB6106.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(199004)(189003)(6506007)(26005)(86362001)(52116002)(256004)(66946007)(66476007)(64756008)(66066001)(6486002)(14444005)(99286004)(66556008)(229853002)(6436002)(6512007)(1076003)(9686003)(71190400001)(71200400001)(33656002)(66446008)(5660300002)(53936002)(61506002)(486006)(386003)(11346002)(186003)(7736002)(478600001)(476003)(446003)(6116002)(54906003)(3846002)(2906002)(25786009)(6246003)(76176011)(14454004)(8936002)(4326008)(305945005)(8676002)(81166006)(81156014)(102836004)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB7PR07MB6106;H:DB7PR07MB6042.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XfUpNUxW0Nl/TkgQmA89XzVHyhOT1LDLoVEoj2ejaeliMkbLuvZlkAo2QdO6rZWMKB8VmHEXNkw6DXnT9I89wshYZy3jSzcZQZzLrTeH84hNuBYvJ+N5OFmwJP95jMwBLMEf6VJanV1YYNC6bpUeBJBwLfh9fmco7lGVcDjuq+Z5pOXgisR28qD5eiJTorBu8gVmpAaeo5UgnBRI39XKIkUB/pSn1TyNneT45KWmiKLW+wM+aTiT4iomxf02UCJOzdvIAXMZAdO7Z8SOIMyy7WBG7TawTFCphawJ+CcUt7TBPljS1fJILTNqHghbbwEKYBy40TmYs6+nnmc21oWe3i0DGGwFLHtCJ6EdMNDIVokaD+S5ArgE+Nq7385eKCr4OhRx/XV7Haw0mKNufKAF/NiTLEl+UJMwMH+ko6CD74w=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A1F51E0049A1D14C9B07EBFAADB6AF92@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f1d68a-c800-40ab-c150-08d71cb5fcee
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 10:40:25.5887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sb8cpt/w5q6PHw5OghkkLZJkvpZalvU/DNhz7cbq10rDeJotfJDBkNT6z7vr+PeFYMJTzOeXE/KFyIlkeRNxqolC1hW2dUB9Y557PWJu/A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB6106
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 08, 2019 at 09:54:17PM +0200, Wolfram Sang wrote:
>After we disabled interrupts, there might still be an active one
>running. Sync before clearing the pointer to the slave device.
>
>Fixes: c31d0a00021d ("i2c: emev2: add slave support")
>Reported-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>---
>
>Not tested on hardware yet. If someone has the board set up, testing if
>standard I2C communication works would be nice. That would mean irq
>setup did not regress. The actual race is more complicated to trigger.
>If noone has the board, I will fetch it from my repository. It is packed
>away currently.

I don't see how this could influence the standard I2C communication at
all. If change in em_i2c_unreg_slave() is excluded, all that was changed
is moving irq number from local variable to the em_i2c_device struct
which is also not used outside of the em_i2c_unreg_slave() appart from
logging :)

Then, if we consider em_i2c_unreg_slave() I also don't see how this
could regres as no locks are being held in this function so calling
synchronize_irq() should be safe.

So from my point of view:
Reviewed-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Krzysztof
