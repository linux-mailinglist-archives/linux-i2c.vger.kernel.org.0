Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA523AF07
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 08:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387581AbfFJGgu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 02:36:50 -0400
Received: from mail-eopbgr50128.outbound.protection.outlook.com ([40.107.5.128]:51546
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387464AbfFJGgu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Jun 2019 02:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8BQdb3SRazE1QSjIFxhl2w5hJ6E6pSiALoKrKWE4qQ=;
 b=EzDNFDJOR5e/cywrrvOFyEuMyS9aR8UJfANp9J0CzfcH604rv5g9ngC/2Ud6NrXKN2fpm79sUbKE219kH45cbT0oc99xqNUGR7gkiX80rwGcXWK1jwK3ar0PCuoWGQGOgfAWiYRIANi40L6ogJxTQBAuHW4iMKFfLGtZDDhRI/8=
Received: from VI1PR0701MB2752.eurprd07.prod.outlook.com (10.173.81.136) by
 VI1PR0701MB2351.eurprd07.prod.outlook.com (10.168.137.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.8; Mon, 10 Jun 2019 06:36:46 +0000
Received: from VI1PR0701MB2752.eurprd07.prod.outlook.com
 ([fe80::f477:e7f8:c964:4d06]) by VI1PR0701MB2752.eurprd07.prod.outlook.com
 ([fe80::f477:e7f8:c964:4d06%7]) with mapi id 15.20.1987.008; Mon, 10 Jun 2019
 06:36:46 +0000
From:   "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] hwmon: pmbus: protect read-modify-write with lock
Thread-Topic: [PATCH] hwmon: pmbus: protect read-modify-write with lock
Thread-Index: AQHVFTTnFHDIhjzuaE2NtFtr8sxEU6aQ11AAgAOr/YA=
Date:   Mon, 10 Jun 2019 06:36:46 +0000
Message-ID: <20190610063639.GA18981@localhost.localdomain>
References: <20190528090746.GA31184@localhost.localdomain>
 <20190607223217.GE869@kunai>
In-Reply-To: <20190607223217.GE869@kunai>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0238.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::14) To VI1PR0701MB2752.eurprd07.prod.outlook.com
 (2603:10a6:801:a::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=krzysztof.adamski@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [131.228.2.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a592131-282a-454e-21eb-08d6ed6e028a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR0701MB2351;
x-ms-traffictypediagnostic: VI1PR0701MB2351:
x-microsoft-antispam-prvs: <VI1PR0701MB2351F57A1A7EF3D5ED00BE4AEF130@VI1PR0701MB2351.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(396003)(346002)(366004)(39860400002)(189003)(199004)(478600001)(66446008)(53936002)(73956011)(54906003)(66556008)(64756008)(66476007)(66946007)(386003)(6916009)(76176011)(6506007)(68736007)(33656002)(99286004)(102836004)(52116002)(316002)(14454004)(305945005)(7736002)(14444005)(3846002)(6116002)(4744005)(8676002)(81156014)(81166006)(1076003)(2906002)(6436002)(6486002)(229853002)(86362001)(9686003)(66066001)(6512007)(256004)(11346002)(25786009)(476003)(71190400001)(71200400001)(4326008)(186003)(26005)(5660300002)(446003)(61506002)(8936002)(6246003)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0701MB2351;H:VI1PR0701MB2752.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MgFrVsws+qjhTmuwmiZzhGT79MnqJBxQK8qu1v4xQGEiBHbfVk3LJnDrhqqlgUHwxxqTvl2ZgQLkCARSuCJDmNsjZGg24HMdd5KaqCKJv6W+p0kAT7ifS17spYvk2VqzvRKD7NvwrKTwan+3rjZYOJq9Aum3WV78bBdR/I9yFpZc2fSDWAVaJ+5YH4GPdIAcF+FQh4AdArMKJCcImVKpOtSuZ9YSXqvYBseXw9alA/2VEpQiMg+gb7t4RqoiWwOo52diPvX/IMK6piRqXfa6OrU/EP1UCgjAuAZUhMYB6ZQLQO3CdcQ1uGpPDf62ZLgm5nho24u4iR9WhczlVaC67MprDJLvTRsk87MhAHmzdHTrCkflTkKDvmkygB/eDBg+JInkeyljKKL5P5B23o5r48dwbZJ0tOu6SwQqEAto7Bc=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <405DED71A7499E42BD0DDDC2705F4D70@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a592131-282a-454e-21eb-08d6ed6e028a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 06:36:46.7198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krzysztof.adamski@nokia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2351
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jun 08, 2019 at 12:32:18AM +0200, Wolfram Sang wrote:
>On Tue, May 28, 2019 at 09:08:21AM +0000, Adamski, Krzysztof (Nokia - PL/W=
roclaw) wrote:
>> The operation done in the pmbus_update_fan() function is a
>> read-modify-write operation but it lacks any kind of lock protection
>> which may cause problems if run more than once simultaneously. This
>> patch uses an existing update_lock mutex to fix this problem.
>>
>> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>
>Please use get_maintainer to find the people responsible for this file.
>It is not my realm.
>
>> +out:
>> +	mutex_lock(&data->update_lock);
>
>Despite the above, have you tested the code? This likely should be
>mutex_unlock?
>

Sorry for that, I made a mistake and used wrong command to generate the
patch and send it to the wrong list of people. You can ignore this
patchset, it was resent to the proper mailing list instead.

Krzysztof
