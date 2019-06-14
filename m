Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12BC6466FA
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 20:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbfFNSEi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 14:04:38 -0400
Received: from mail-eopbgr80123.outbound.protection.outlook.com ([40.107.8.123]:46388
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726305AbfFNSEi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 14:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LECnJZEsal1Pq84BtcOe/D4UqrqE85B+/KpYnhrFXZI=;
 b=St0by6BqWkwrQcsJ67WLhNewyMMTZQD5VTcj1fjh+zh8rlTIG3Xeeflvel10xUJiiFRbZqGC2Yu4/WnT/sUrnv2luGo33ffpV/Ay0BuWCzwuXIlSRCxsB/AufN7ox/YC2l6cYsP6s8D9pPKhRC6shQzLnHV0Nw3ImePbXWabPtA=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3323.eurprd02.prod.outlook.com (52.134.65.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 14 Jun 2019 18:04:33 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1987.010; Fri, 14 Jun 2019
 18:04:33 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] i2c-mux-gpio: Unpin the platform-specific GPIOs
 request code
Thread-Topic: [PATCH v2 2/3] i2c-mux-gpio: Unpin the platform-specific GPIOs
 request code
Thread-Index: AQHU+72dy7EDmo3k6EmkNrf+93yZ3aaUQGEAgAdlaACAABnvgA==
Date:   Fri, 14 Jun 2019 18:04:33 +0000
Message-ID: <fb96ba56-4754-a962-ceea-4fd50ee59c69@axentia.se>
References: <20190425232028.9333-1-fancer.lancer@gmail.com>
 <20190425232028.9333-3-fancer.lancer@gmail.com>
 <783250dd-87c0-b3cc-0e90-7978605a9b07@axentia.se>
 <20190614163134.zs5xyuqvp25ahbng@mobilestation>
In-Reply-To: <20190614163134.zs5xyuqvp25ahbng@mobilestation>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0401CA0073.eurprd04.prod.outlook.com
 (2603:10a6:3:19::41) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11d99de9-9c10-4d9d-b1bf-08d6f0f2c113
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3323;
x-ms-traffictypediagnostic: DB3PR0202MB3323:
x-microsoft-antispam-prvs: <DB3PR0202MB3323BBCCDE8C375D1A1086ABBCEE0@DB3PR0202MB3323.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(136003)(396003)(376002)(366004)(346002)(199004)(189003)(52314003)(71190400001)(66066001)(65956001)(65806001)(2906002)(74482002)(31686004)(4326008)(229853002)(6486002)(54906003)(14454004)(58126008)(25786009)(6246003)(68736007)(256004)(26005)(14444005)(11346002)(2616005)(36756003)(446003)(5024004)(186003)(6916009)(71200400001)(6116002)(3846002)(65826007)(5660300002)(486006)(476003)(305945005)(7736002)(52116002)(64126003)(73956011)(66946007)(102836004)(81166006)(99286004)(66476007)(508600001)(53546011)(6506007)(386003)(76176011)(6436002)(53936002)(31696002)(86362001)(6512007)(66446008)(64756008)(66556008)(81156014)(8676002)(8936002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3323;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jhB15HxpHvjYcotksUaQ/9l9UaUNg+De/69tQgYAljWfSCBfOP7Ey2Sy0/52ifP8a0bn5foTKpXpob5eZwDkDtOpAKXmOnSAbg5IoC8W3/3h/9XSavc9LlKQCupHanMBVJKMipWrrmyvE/7oqdDiY3N56Eo9MnPRjhlWzSCMbQC1gFjvEnA0BhYW8Abb20JQ2olwxVrPltb3HJH71Qys2T+DtYEDdF6y6sPU1PjlBTWrG90KThDjqT8Q0qGHmHMRDVqJJoMPvXKNW9D59vxb5ZtpN6cexthKW10m1AHq2f8CovTh41/zfeyB1iYUeLpHywRAIswuugxXIgEO8pJP/x3686f6DNIoFTihu0YPDwd00WpMkAW0kgv6lOGHlwjyPrySyI0BkQySbBWo82NwMlTHPmr1LU/8ifqgC6fKCOI=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <08FE068E0DDD4D4BA3CCFA48B999AAE3@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d99de9-9c10-4d9d-b1bf-08d6f0f2c113
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 18:04:33.4877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3323
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2019-06-14 18:31, Serge Semin wrote:
> Hello Peter,
>=20
> On Sun, Jun 09, 2019 at 09:34:54PM +0000, Peter Rosin wrote:
>> On 2019-04-26 01:20, Serge Semin wrote:
>>> The GPIOs request loop can be safely moved to a separate function.
>>> First of all it shall improve the code readability. Secondly the
>>> initialization loop at this point is used for both of- and
>>> platform_data-based initialization paths, but it will be changed in
>>> the next patch, so by isolating the code we'll simplify the future
>>> work.
>>
>> This patch is just preparatory for patch 3/3, as I see it. And since
>> I'm not really fond of the end result after patch 3/3, I'm going to
>> sum up my issues here, instead of trying do it piecemeal in the two
>> patches.
>>
>> Linus and Jean, for your convenience, link to this patch series [1].
>>
>> While I agree with the goal (to use the more flexible gpiod functions
>> to get at the gpio descriptors), the cost is too high when the init
>> code for platform and OF is basically completely separated. I much
>> prefer the approach taken by Linus [2], which instead converts the
>> platform interface and its single user to use gpio descriptors instead
>> of the legacy gpio interface. The i2c-mux-gpio code then has the
>> potential to take a unified approach to the given gpio descriptors,
>> wherever they are originating from, which is much nicer than the
>> code-fork in this series.
>>
>> I also think it is pretty pointless to first split the code into
>> platform and OF paths, just so that the next patch (from Linus) can
>> unify the two paths again. I'd like to skip the intermediate step.
>>
>> So, I'm hoping for the following to happen.
>> 1. Sergey sends a revised patch for patch 1/3.
>> 2. I put the patch on the for-next branch.
>> 3. Linus rebases his patch on top of that (while thinking about
>>    the questions raised by Sergey).
>> 4. Sergey tests the result, I and Jean review it, then possibly
>>    go back to 3.
>> 5. I put the patch on the for-next branch.
>>
>> Is that ok? Or is someone insisting that we take a detour?
>>
>=20
> The series was intended to add the gpiod support to the i2c-mux-gpio driv=
er
> (see the cover letter of the series). So the last patch is the most valua=
ble
> one. Without it the whole series is nothing but a small readability impro=
vement.
> So it is pointless to merge the first patch only.

Agreed on all points, except perhaps for the "refuse" part below and
that the readability improvement of patch 1/3 is perhaps not all that
pointless.

> Anyway since you refuse to add the last patch and the first patch is actu=
ally
> pointless without the rest of the series, and I would have to spend my ti=
me to
> resubmit the v3 of the first patch anyway, it was much easier to test the
> current version of the Linus' patch and make it working for OF-based plat=
forms.
> Additionally the Linus' patch also reaches the main goal of this patchset=
.

I'm very pleased that you do not feel totally put off, and are willing
to help even if we end up storing your series in /dev/null. Kudos!

> I don't know what would be the appropriate way to send the updated versio=
n of
> the Linus' patch. So I just attached the v4 of it to this email. Shall I =
better
> send it in reply to the Linus' patch series?

I get the impression that you have already done the work? In that case,
how I would proceed would depend on how big the difference is. If it's
just a few one-liners here and there, I think I would make a detailed
review comment so that it is easy for Linus to incorporate the needed
changes. If it's anything even remotely complex I would post an
incremental patch. Of course, the former does not exclude the latter,
but I do think an incremental patch is better than a repost.

Thanks again!

Cheers,
Peter
