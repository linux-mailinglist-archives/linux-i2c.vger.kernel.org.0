Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE6A84554
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 09:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfHGHJh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 03:09:37 -0400
Received: from mail-eopbgr80125.outbound.protection.outlook.com ([40.107.8.125]:27625
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727114AbfHGHJh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Aug 2019 03:09:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiTm4nXPqdzUYLJO5XwTKH+23aWbgIdHns9wtv1cuNQuPe8Uhk3vGapH1d8HJEn1PjyAt1ncnmuGVyuj0/uPjISVhotBOOf91Py3bwMrnhfvtXOHVwgEtFK7yz8VSAMdLodMwdlOduvHhWGutXZrSFJq8ja0xJNY8JJHf6G4lNnqnTs+JFJ8URiKsh1+duPWxrtxuAiZU4HGRYv50vtZxEhMNAAl51zIcMXZMsWhOdRZrPjlWnfZ7T6aCRrcQL8Ly5eiAr4wVnPdr94GVeDc/WSgY2mgf9TAeadOSuTCoJbJCt7FUwX8b2kPjW/n9y70/FmcCE/2trCQfD3CVUZL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGWh70SunHa3t8rc3Pu4GCQHmUdB648PUMurdKxlOtE=;
 b=DMKR2ft9OpE2j8zjvACaXb/PxJjueA+qm05HWk6x2PmyEO6tOnOYJw0ZO2jRX6Tve0qmJAc36t/XrlHi/H/S7ct5+K8qYLPJ5ygxq2r82KhJVvdth3ELXiVllw7uBxP7BMJXZEdugRv1kh63sBfRODg7VEyerbeu3fYJKtDKnlRjWlMY4u2vFiMJYh7ib4rB2rpLzYuur1ESspYWumIcPi9RREVmPuAmVAIyXxX3FU4xAEja4wwNXCToEfdn9ubM8K6z53tpgsdL3WX/FwwpyH3q2bOnnJqHskp0RhsTAOaD90+57H7dN7HF4bKDzI81zrukKNU8btattk6ct680kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGWh70SunHa3t8rc3Pu4GCQHmUdB648PUMurdKxlOtE=;
 b=cmjzkf6a/nfW9Bxsl6mZAQFRkXKZ02YQY8UZo0uFblXUSnOAi70M8Qkmy7TXJ7JrQgf70q52tB40irmFnx+nFn8qk/OGxr2jPrir5IZHNN5zH0q3JYNph65geySrR8qxpM7eEbX5grgZwoT6b8PpI4IqSwvokryMZwKz0HCboFs=
Received: from DB7PR07MB6042.eurprd07.prod.outlook.com (20.178.107.151) by
 DB7PR07MB6043.eurprd07.prod.outlook.com (20.178.107.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.9; Wed, 7 Aug 2019 07:09:33 +0000
Received: from DB7PR07MB6042.eurprd07.prod.outlook.com
 ([fe80::7983:ce79:7be8:bc02]) by DB7PR07MB6042.eurprd07.prod.outlook.com
 ([fe80::7983:ce79:7be8:bc02%6]) with mapi id 15.20.2157.011; Wed, 7 Aug 2019
 07:09:33 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH] i2c-axxia: support slave mode
Thread-Topic: [PATCH] i2c-axxia: support slave mode
Thread-Index: AQHVSGwOk+MxAclOz0u7iP5t8pKxw6buoJIAgACsrQA=
Date:   Wed, 7 Aug 2019 07:09:32 +0000
Message-ID: <20190807070926.GB17104@localhost.localdomain>
References: <20190801132129.GA5550@localhost.localdomain>
 <20190806205124.GG911@ninjato>
In-Reply-To: <20190806205124.GG911@ninjato>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P18901CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::26) To DB7PR07MB6042.eurprd07.prod.outlook.com
 (2603:10a6:10:8e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.32.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5fd92c5-f316-44cd-893e-08d71b06328e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR07MB6043;
x-ms-traffictypediagnostic: DB7PR07MB6043:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR07MB604391F0B4032A1C0EEFE7EAEFD40@DB7PR07MB6043.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(189003)(199004)(61506002)(71200400001)(4326008)(1076003)(25786009)(107886003)(66066001)(5660300002)(71190400001)(478600001)(14444005)(256004)(6246003)(66946007)(53936002)(14454004)(66446008)(9686003)(66556008)(64756008)(6512007)(6436002)(66476007)(6916009)(33656002)(86362001)(76176011)(99286004)(6486002)(81166006)(81156014)(8936002)(8676002)(386003)(316002)(305945005)(186003)(52116002)(6506007)(2906002)(6116002)(446003)(3846002)(26005)(102836004)(68736007)(486006)(229853002)(7736002)(11346002)(54906003)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB7PR07MB6043;H:DB7PR07MB6042.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gVQRo1ZpHExQx/AGMbG4QnNkiMGlYTGqctCOtwGR5l514hvVSiJWEFAllWZ4+lIOM1xgVI1WEmLAuiEhhl833cbRz2ylIdSjvUNM0nogDv787iwNuKX3ABfa2QtAlRaamiDc38Ul2K9cIWFedI9iu0xBrDDgeM4daUG9o0aWO5owf3BR9hysZZjgZ+Y8KhI1f8XlPNs6nFVzxfAz0zPQrltRHmmghxsOXNKNeFjXktSrQI5uhMxCLAHyDwFm6gIjeZAXIIiz6/MzQEd0zwsKSEUKI+TTD7UBrhqTSStmw9X7dmabcNupKUC6CsRutJW8gQHNo2l4xeFMqjGbgt2IB8q7pVEFbHeWNLq+sh3Ji4zpxXuPlp0WUP/zaLk+PcxL/OVYB8nbzLGLBCjdx1Cn/bZS4N5HR+H4hzis/pKc7L0=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <88B4540EB1019A4C9C932965A65343C6@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fd92c5-f316-44cd-893e-08d71b06328e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 07:09:32.9199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lxxM5YN4ZUN370NwvRJ/h02xF6SSU9gYBvFBORFWerjWu37xf5zND7xNBuFsTD+MNhHqapRO9lbwIRgQk1Cwdfz/EMWTjAswzpSANz1PK50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR07MB6043
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

>Hi Krzysztof,
>
>> +	if (fifo_status & SLV_FIFO_DV1) {
>> +		if (fifo_status & SLV_FIFO_STRC) {
>> +			dev_dbg(dev, "First data byte sent\n");
>
>I think, however, these debug messages could go. They were surely
>helpful during development but assuming things work now, they will not
>help backend authors. Can you agree?

Good point. I'll remove those verbose messages and maybe leave one or
two debug messages with just a summary of the status which will
hopefully be a good compromise. Will that be ok?

>
>Rest looks good from what I can tell without knowing the hardware.

It also seems to work correctly and I tried to do everything in a way
that nothing is changed if slave mode is not used to eliminate the risk
of regressions.

BTW, I have added this synchronize_irq() in unreg_slave callback just to
make sure it is save to set idev->slave to NULL already. Most of the
controllers do not have such a guard and I'm wondering why that wouldn't
be a problem for them. Like the i2c-rcar.c - isn't there a small race
condition if some slave interrupt triggers just before ICSIER is cleared
and somehow does not finish before priv->slave is set to NULL? This is
the situation I was afraid of and tried to solve by using this
synchronize_irq().

Krzysztof
