Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23635DF140
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 17:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbfJUPYA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 11:24:00 -0400
Received: from mail-eopbgr40101.outbound.protection.outlook.com ([40.107.4.101]:11453
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727140AbfJUPYA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 11:24:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jC8hkpDEVIBf4ubqsjy0iX01/ZU2kSs8n1ZTj/ji5ZNCIvv66l2D/c5nYQQ2BMLsR3tDhgNHn/TaEkU04FlN9D62v/b6jkTHY0JHk1eRAudk6TxIWgLVFO4Dma/MHFbk8LZKTdPdKor8mTzcBqwnVMNqsOVNdjCuRtNNyj6b95SRdiG/9906r0jE9YKqZcBYSH0/KRVVqCPs1d2ZqGo2R/x1APb7nIoiddtG4skAUJBF793+/14Smv6S5tBRVtLVDCBNhnbxkNGhBBCKHax8C20/gQYI057sI5DX8H0SWG3gtCC3PDFsn1W1CtJLKh8v2dTz0pxhbyMMkgtmkrqC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx6kOuyc4Ro67mNwa4n9HD0kzfxFP2ooqXnUoypIvHQ=;
 b=dRc5jgRnP3hlElKmsQWg9/GCfNfce0jWtuADj+YeLs5gr+2xG9Ok+drRcPqWzl3sZzQw3xtW63dyKaqJL8OyAF1aNeEx9NRDcUi4A6OjfyYMq5awUXtTIhXq+dKhD2kttsRUsX1OEK98rBRFmkr8dNj+kBAWkmfPVjYa/FQa60mm1vb4IZMmVkKLsKU8QgsQZJyFZxbgIMsd7w0bwQviyzPPsXfLd/fMXkmerF1I1+C9F/INoQaXM+qRJaA87TIKHRywrrCBZHYC7T9szsH13EUc06qZriztzlYChBIl9lMZSh58f9RycAyhiSIE7LvHcJIEgU7zBZSn7Xq1ilfMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx6kOuyc4Ro67mNwa4n9HD0kzfxFP2ooqXnUoypIvHQ=;
 b=fzDD2u5aRXAute0K6/4EeocrMjvoO69WoMsL52No+LF7FPokCjsfSr+3Yg7UKNW/UYRGey+dIqy4b2SRtKHFAtNkaiX9pYF7lvZuVWywROTL7M2r88QRuhTM99G7hEnfI07U7krFpePJFhqwJutEtVD4ts6pj0Z79Bq2e2IqZFw=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3435.eurprd02.prod.outlook.com (52.134.65.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 15:23:15 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 15:23:15 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>,
        "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>
CC:     "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "Ludovic.Desroches@microchip.com" <Ludovic.Desroches@microchip.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v5 0/9] i2c: add support for filters
Thread-Topic: [PATCH v5 0/9] i2c: add support for filters
Thread-Index: AQHVaHpLr7113TR4Hk2itVe9BFeajadO9gMAgBZqJ4CAABXHgA==
Date:   Mon, 21 Oct 2019 15:23:15 +0000
Message-ID: <f5bd0c1f-9a72-6661-146b-ef5de77e31ff@axentia.se>
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
 <c17182ac-67dd-d11f-5daf-066bf446b969@microchip.com>
 <20191021140515.GC26782@ninjato>
In-Reply-To: <20191021140515.GC26782@ninjato>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR07CA0034.eurprd07.prod.outlook.com
 (2603:10a6:7:66::20) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec7f5e47-6753-432f-46e0-08d7563a97e1
x-ms-traffictypediagnostic: DB3PR0202MB3435:
x-microsoft-antispam-prvs: <DB3PR0202MB34353FA956C351DE96B30572BC690@DB3PR0202MB3435.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(346002)(396003)(136003)(376002)(366004)(199004)(189003)(11346002)(7736002)(31686004)(8936002)(71200400001)(71190400001)(508600001)(31696002)(5660300002)(446003)(86362001)(316002)(476003)(2616005)(305945005)(3846002)(25786009)(7416002)(6116002)(256004)(14444005)(486006)(2906002)(76176011)(52116002)(2501003)(6436002)(58126008)(229853002)(66476007)(66556008)(64756008)(66446008)(99286004)(66066001)(110136005)(65806001)(54906003)(6486002)(66946007)(36756003)(6512007)(14454004)(26005)(81166006)(81156014)(186003)(102836004)(6246003)(4001150100001)(53546011)(386003)(65956001)(6506007)(4326008)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3435;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pWuxGBn7XG4yM+XRDcuNA6uQV2R9rqrWZFoSen+1zMWiegUU8TS0Oi9iS1F3KPF7I73E2u7p7IsaBxYFXVzRQ28xtnhjrXKO29DOgfBk1JHBdAG491iuKX6Ls5vprySq2TZVSlq5HWYAtb9PLt1AwG+/heNEjlmnpLrNEtughdhGiQcgZ6VwRRSuoibm4t8OV5s1eKxiy9vHn0sae07UHjtfP5M6xvBahCpbw0crNfd+t/4HX58lIg9+0YfEEVH1fQCihApZ99fKIJHpM0WKzXO5LaA2bZ77fhwOg424i9/9FKSvvw2cBcAQzuBKphtlO+WUHdL5GIPb2yYzx5uTjIG+CYnB1uuCkqSgwE0o2l39ZPH7HG412CDiGoTl18zUksAPNjHwIQceR/R7sc2uzRo5ptwndHvqhbFtGrlAts++9HOaia1V/BoXRhvktL6q
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <542A5BB2F1351346977B834EB3C11628@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7f5e47-6753-432f-46e0-08d7563a97e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 15:23:15.3938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 546Ctu3x6wdXrmmTcp/2Pd2JUwyCfmDKIbZrO++SlVOT1TPMI85NgE3ijiiYqSb9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3435
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2019-10-21 16:05, Wolfram Sang wrote:
> On Mon, Oct 07, 2019 at 07:53:21AM +0000, Eugen.Hristev@microchip.com wro=
te:
>>
>>
>> On 11.09.2019 11:24, Eugen Hristev - M18282 wrote:
>>> From: Eugen Hristev <eugen.hristev@microchip.com>
>>>
>>> Hello,
>>>
>>> This series adds support for analog and digital filters for i2c control=
lers
>>>
>>> This series is based on the series:
>>> [PATCH v2 0/9] i2c: at91: filters support for at91 SoCs
>>> and later
>>> [PATCH v4 0/9] i2c: add support for filters
>>> and enhanced to add the bindings for all controllers plus an extra bind=
ings
>>> for the width of the spikes in nanoseconds (digital filters) and cut-of=
f
>>> frequency (analog filters)
>>>
>>> First, bindings are created for
>>> 'i2c-analog-filter'
>>> 'i2c-digital-filter'
>>> 'i2c-digital-filter-width-ns'
>>> 'i2c-analog-filter-cutoff-frequency'
>>>
>>> The support is added in the i2c core to retrieve filter width/cutoff fr=
equency
>>> and add it to the timings structure.
>>> Next, the at91 driver is enhanced for supporting digital filter, advanc=
ed
>>> digital filter (with selectable spike width) and the analog filter.
>>>
>>> Finally the device tree for two boards are modified to make use of the
>>> new properties.
>>>
>>> This series is the result of the comments on the ML in the direction
>>> requested: to make the bindings globally available for i2c drivers.
>>>
>>> Changes in v5:
>>> - renamed i2c-filter-width-ns to i2c-digital-filter-width-ns as this
>>> is applicable only to digital filter
>>> - created new binding i2c-digital-filter-width-ns for analog filters.
>>
>> Hello Wolfram and Peter,
>>
>> Are you happy with the changes in this version? I haven't heard from you=
=20
>> since this latest update.
>> I am interested to know if anymore changes are required or maybe we can=
=20
>> move further with this support.
>=20
> So, I had a look now and I am happy. I will give Peter one more day to
> comment, otherwise I'll apply it tomorrow.

I had another read-through and only found one nit which is in a separate
message. You can add

Reviewed-by: Peter Rosin <peda@axentia.se>

for the whole series.

Cheers,
Peter

> Thanks for your patience and keeping at it!
>=20

