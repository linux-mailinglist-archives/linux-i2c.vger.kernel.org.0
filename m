Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEE887723
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 12:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406315AbfHIKXN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 06:23:13 -0400
Received: from mail-eopbgr10102.outbound.protection.outlook.com ([40.107.1.102]:4487
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726037AbfHIKXM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Aug 2019 06:23:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJAQ6PpWs5RGmOtp62nl3PSGmvWrqZ/Hd+F7amGwjb+JVMxkKc77a7jdeMs2+P+fgRbOUwzjB7KMEhOR39tSJp0pzQtnqPEwv2/wMK+ZhNebucT3X2GSPbkEHioQhwJ5pCwdiQFzzwYOY2lTUr4yqdEP9GBRVsxYkXaficLt/0zsy2CCYGJGgYef+B/kQE4Ze2YN2Ci/FKQ8gyHYIKYI+Uhqf1XazKiAbZBKUDCjmhuiNYAH4AVcO+72SHqYsbCdW5ELgu+1awFvBy+PnemfewnNUzAqBPPHdW17XnQd1I0WLakaBHkmh7tgKJVPDjhRK+439tNBJUKIa4BZbr6eXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbvcg6qneURZbKWpE/OJ0Pj7QaFpNn1cJeNBu0Y9Azw=;
 b=julB1iWVMRZrFRmAuqNY96jPGXNlvUAC8+cYNEPjijiWuY00+jwz5u1TDZbVICXvcrT5ZDlDmqR8OV8zz6nXyOG2bugs7/YaMPTrJGzxPU9Hgx6YmEpaZVhcvNQ5ScPn/4iN0QFJNtkZArg+0Rn3iZonOE+fMC7qiEDX2Rlmdb2zsBUFc5Sc2lit+ig9Z/I22mF6xPRNDoadygSUv2HqfGY68j2Utr3oTKwvRXEuWsZRisBl56ClkW5/mKtVSJeuxuf0CpVKP8g9Rbb8Vk5+SAut0UHhQWNFoCNbYm5vm82AKCViWXz0kNOCwDKvJe7wdJkpNCp7NRXVn9py4YE0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbvcg6qneURZbKWpE/OJ0Pj7QaFpNn1cJeNBu0Y9Azw=;
 b=IWf1TUB5ZJ38kYynkMfJy7PzLkgacd/2MgMTH4NPJVYSMCy2OQaPbJpxaevV4g+xyI+xovy0qOCOpY1IjQ9PKPmwlKTPeRyIIi6Bdo5TyRdazQzc1hJxpgUTJUClg//TqzePUY4qnlL2WRoxGNUaEa6NPWXhW0V4grpx5JZv4Dk=
Received: from DB7PR07MB6042.eurprd07.prod.outlook.com (20.178.107.151) by
 DB7PR07MB5466.eurprd07.prod.outlook.com (20.178.47.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.8; Fri, 9 Aug 2019 10:23:09 +0000
Received: from DB7PR07MB6042.eurprd07.prod.outlook.com
 ([fe80::7983:ce79:7be8:bc02]) by DB7PR07MB6042.eurprd07.prod.outlook.com
 ([fe80::7983:ce79:7be8:bc02%6]) with mapi id 15.20.2157.011; Fri, 9 Aug 2019
 10:23:09 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] i2c: rcar: avoid race when unregistering slave client
Thread-Topic: [PATCH] i2c: rcar: avoid race when unregistering slave client
Thread-Index: AQHVTiD44nw1Shk3f0CzUXyjDPevKqbynJQA
Date:   Fri, 9 Aug 2019 10:23:09 +0000
Message-ID: <20190809102300.GB25406@localhost.localdomain>
References: <20190808193910.12365-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190808193910.12365-1-wsa+renesas@sang-engineering.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0901CA0066.eurprd09.prod.outlook.com
 (2603:10a6:3:45::34) To DB7PR07MB6042.eurprd07.prod.outlook.com
 (2603:10a6:10:8e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8003b088-abb7-4c9c-d764-08d71cb3933b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR07MB5466;
x-ms-traffictypediagnostic: DB7PR07MB5466:
x-microsoft-antispam-prvs: <DB7PR07MB5466C628CADFAE75CE6047EDEFD60@DB7PR07MB5466.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(25786009)(86362001)(446003)(14444005)(52116002)(256004)(316002)(66476007)(66946007)(64756008)(66446008)(14454004)(66556008)(486006)(71200400001)(476003)(76176011)(71190400001)(6246003)(11346002)(53936002)(26005)(99286004)(33656002)(6512007)(4326008)(61506002)(54906003)(102836004)(1076003)(8936002)(4744005)(5660300002)(7736002)(229853002)(8676002)(386003)(81166006)(6506007)(2906002)(305945005)(6116002)(478600001)(66066001)(3846002)(6486002)(9686003)(186003)(6436002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:DB7PR07MB5466;H:DB7PR07MB6042.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HXyMDp/yqgmlFFWgAm8k+DVxf/WtBOG+X26eGC34qc+AUu09eFN0wUiv4BGcjnNtkRbwsdCa48X6u3sGMadyAlHfOzTAa9E5AbvJCm7RKYRE4MjN/5p2umZNeqJHqz6oLs5/KwUECGWlMChwkIZAJiDGZ4FDv72OhOTGdR0cz3qsh5aWll7TsdfHhFzo94ZtqITmE0wUoQma4In7YI0jxYk0chgLNcyp0mcVOehN5g0SZZekTM2iXTf4hHy9w9RjLzluWdV1KJsG3CaxDeKDrrYnlRwM2UlpzdTCAdN/hkFnz3X7SlUCxtALp+phFfOs7vQtTe56W2yMDuohAmZHIUMI4EJdDw5oVF+EH5PdZnpYpX6NCbmRW18CLPJlJFhvPbu4H3hx7kS3cwBtATbO6Y7F3ViZ3XSUPyqUSLiW7Os=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CDE7E8DF35A8F04F95487ACC5814E45A@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8003b088-abb7-4c9c-d764-08d71cb3933b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 10:23:09.2899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnISUFmCm0cX0u7D+0tMSijLZLAmqY1eF1Bx7Mi+LBrEaVKjA2514CbvmsshKlwwsbFm764smaR4rYmlsr5yCJSdP3O/KSgPXkynBch2F7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB5466
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 08, 2019 at 09:39:10PM +0200, Wolfram Sang wrote:
>After we disabled interrupts, there might still be an active one
>running. Sync before clearing the pointer to the slave device.
>
>Reported-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>---
>
>Tested with a Lager board (Renesas R-Car H2) and no regressions found. I
>tried to run into this race via stress-testing but failed. The race
>window is tiny, but it is still there, so let's fix it.
>
> drivers/i2c/busses/i2c-rcar.c | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>

Reviewed-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
