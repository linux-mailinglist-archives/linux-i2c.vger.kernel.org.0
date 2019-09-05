Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4CDAA52D
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 15:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732741AbfIEN6c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 09:58:32 -0400
Received: from mail-eopbgr50099.outbound.protection.outlook.com ([40.107.5.99]:47493
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730739AbfIEN6c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 09:58:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5uaPA2gs4WQ1xXVtTvXgYR49gkKPbz/cB21D12depCR1ip7Bm0OqvFU3TPviCPpTc5dWV1hYo6k0CbnKe0Bif40rJuRdDDyWR+oNgeiCkmr3fse1AmXClVklAf8TaE3CiVlwlt9AsCG26zg8UQqDHhy7fBtIJqaKR3ZzxKlYh0733DEM/SLZL2fkkRR6SftGS51oXao1vdsloM9oIIJ7tcy/5JPGNEyY5RtmWE4aLpQuZ1WExaUqJbvuLj0kEcSt6MB4x/A0VGhAItg1ZSssANAubSlgYKNe93XHU6uE9U1nNI78mqeO5+axmEQnNqLqztguVnyHh8+XjkpZRikbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utsaBLCJganQV5SdQABLEt8dkWnVAQMfeaiOyy2TwNw=;
 b=eR40THKTGni2WVaXwFj5RV6zXba+DCmDPdgCS/jBhPcyTj4qAv+2U21gBVDdRd/ygbW+1xliG6qieAv1QI0kKPM/8N13dskX1huMvY4+yqZ5VDl+IUdZC1LKgTPgQquX1kv9x7vklO/ip2g8iRAUTQKDt9do9ckKlwKTdxF7FdAPHGszeYP9DLwlcFc9aR49GbCwfDDZf5rXJVKzhhDHq1B1o+snyRpLaBvtk2ihLOhHADLbb8uCAZ80BjtAtoIq0vuoUccZDoFPv5AfkvdYRQdLrAbjCD3McpCZrezL8RtwTooqjfgsU/bwJ0nxn9nn8+INz9LmDYejquOTmPjnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utsaBLCJganQV5SdQABLEt8dkWnVAQMfeaiOyy2TwNw=;
 b=esarSxK0SCESZ7uHnv2BHAUIcXFADsghNn7tEkp75KWzZ7bAihgdFpwfHYFH6Q0ZehKCStOHpAJqopVWWeeoVPMdMJaj/FzU1diAt5TEohf9KDa+HUebAwfPrvlaJoT6emEvMcOBiRdvbBwtBXZ6uxd7xS4Z3B8c4ilukWo01c0=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3404.eurprd02.prod.outlook.com (52.134.68.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Thu, 5 Sep 2019 13:58:25 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09%7]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 13:58:24 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>, Lee Jones <lee.jones@linaro.org>
CC:     "alokc@codeaurora.org" <alokc@codeaurora.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] i2c: qcom-geni: Provide an option to disable DMA
 processing
Thread-Topic: [PATCH v3 1/1] i2c: qcom-geni: Provide an option to disable DMA
 processing
Thread-Index: AQHVY9PiTM9rqMwvEUyL0vDv3ajYn6cdGeCAgAACawA=
Date:   Thu, 5 Sep 2019 13:58:24 +0000
Message-ID: <3458ed2a-ae49-b46b-3e89-ce039a2749b4@axentia.se>
References: <20190905102247.27583-1-lee.jones@linaro.org>
 <20190905134941.GG1157@kunai>
In-Reply-To: <20190905134941.GG1157@kunai>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR06CA0162.eurprd06.prod.outlook.com
 (2603:10a6:7:16::49) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eea0af23-5e3b-426a-4af0-08d732091eaa
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3404;
x-ms-traffictypediagnostic: DB3PR0202MB3404:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB3PR0202MB3404D99EBF971483D51B7B0BBCBB0@DB3PR0202MB3404.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(136003)(42606007)(39830400003)(366004)(189003)(199004)(58126008)(65806001)(65956001)(54906003)(2616005)(316002)(11346002)(4326008)(53936002)(110136005)(476003)(66066001)(71190400001)(71200400001)(8936002)(446003)(99286004)(52116002)(76176011)(6512007)(6436002)(5660300002)(6246003)(6306002)(25786009)(31696002)(7736002)(256004)(6116002)(508600001)(14454004)(6486002)(102836004)(229853002)(26005)(86362001)(36756003)(66446008)(64756008)(66556008)(66476007)(66946007)(7416002)(186003)(486006)(81166006)(31686004)(81156014)(2906002)(966005)(8676002)(305945005)(386003)(6506007)(53546011)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3404;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xDOuuvqxrS9glJKYa7/86AFZprjNL2TjHTSPqfDFOix3FIfXyaq3IAgmLYME7MuIVBL+SFX9S4XGaHHBttJuaeWICuur6/a72Wq9tU4XF5D8L5c5nuyZLQ69GzV4onREM59cH82gu2UU/H4trcbXzpgbUQc5+5RyYn7Rad8x4NT9w+fYAwPfO0HA0c/W7+EoBFDbYkSUWjq6zI48I5L5Ix2VM8BjTNs8hL2Dkqwva8VzwQyyFlOUeNMzOCjF6O/t/kZBsa4OlwaOTcWAVx5KtrDD73+OW2cUegf91nDLAUqhUKOEpdceaoqTAImVNKBLN+T0hDuHTR8nvonJUdGegeW1A86b9xEsF2yarsIOR6zCoyGcBhJphBf7XjRC6KfsuUpZpq15zF7H2KmtKJPRFfPRVBvfsZQWDwpb2Ph89jk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <813F8E51C3E2B141AF9AC8B67D62FE76@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: eea0af23-5e3b-426a-4af0-08d732091eaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 13:58:24.8524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jfgVotAS0pgobuVIHFfQC0PWUnx09cwdMJa6OY+7pSKyKaiEHOrbBxzNOgJ5a7JH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3404
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2019-09-05 15:49, Wolfram Sang wrote:
> Hi Lee,
>=20
> I understand you are in a hurry, but please double check before
> sending...

Linus indicated that an rc8 is coming up, which should provide an extra wee=
k.
https://lwn.net/Articles/798152/

> On Thu, Sep 05, 2019 at 11:22:47AM +0100, Lee Jones wrote:
>> We have a production-level laptop (Lenovo Yoga C630) which is exhibiting
>> a rather horrific bug.  When I2C HID devices are being scanned for at
>> boot-time the QCom Geni based I2C (Serial Engine) attempts to use DMA.
>> When it does, the laptop reboots and the user never sees the OS.
>>
>> The beautiful thing about this approach is that, *if* the Geni SE DMA
>> ever starts working, we can remove the C code and any old properties
>> left in older DTs just become NOOP.  Older kernels with newer DTs (less
>> of a priority) *still* will not work - but they do not work now anyway.
>=20
> ... becasue this paragraph doesn't fit anymore. Needs to be reworded.
>=20
>>
>> Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")
>=20
> As said in the other thread, I don't get it, but this is not a show
> stopper for me.

WAG: because ACPI made some driver load at all, and when it
did it something started happening which crashed some machines.

Cheers,
Peter
