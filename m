Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334C57BF435
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 09:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442509AbjJJH0C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 03:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442669AbjJJHYk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 03:24:40 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03olkn2013.outbound.protection.outlook.com [40.92.58.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2E1184;
        Tue, 10 Oct 2023 00:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6Zd5xpaqdN4vlxTEvvrAelkLwujZ84ZiZBztMDONo0i7Iiz4mV7xrP7Qep1XWBEJqF2j/bjTd3mFnaeimqkYsVPUEPb1hIspBl3OVq2cG6x6fwyI0gB/LFajCGAxuNamYcI6Cs9T2mbkar7qd6ENUTkR6mvBroAHaXWdB4mh6p+WTQFII5GgrsgVK0Qzv4AxaFVAopAxpDVzLLuvV7HuwrohFkN2lfsJMfJ0U28JiFhjzKFTt/bKsSBlDLWGHOW2ohgzbU4O/eWQFz6S8xBNfLtjE/9zllhZRI4FCRGJOkbJWg7aFHpY7xViF8A/VuTLxAM1RyP7Ost7utyFkaUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jY2beGmCFAXwKd6f2q05xeG5Y7NhL/3MgjNQXTcjJfw=;
 b=AWkI0bwR6TbK7lyllyHcNOnkqGUegf4ZdxEADonaC4YPHbpHntGta7wht0Sh66APoCSp6GQ823ZeOAjMp68nVE7fEoW1VA7pm4Hd7TskLh4lcFLguOCN4Vwwz0uS35f9w90hy/iTOTD6yPePJdxOAYkIyaTzTohDQUOXonV/PiJw61acg7CXaGzYX6Zx3RZaLVLS91v+5daakNTMFhvK+zZuIkXU/fAB2vNzmiGRQ5AMKDR/U5/ky9xRH2SMRRUU5bQ8RRtDsfhzp2vdhBaBjN/+o7Xk+NbgKYrn/ceL7WnLm9ZOEJZH0Tebf0Kc3+XjIfWTeDBI19cXgg0gppObUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jY2beGmCFAXwKd6f2q05xeG5Y7NhL/3MgjNQXTcjJfw=;
 b=OKv76C7y+EZuNoY+bT9+VkjUftnPQYbEuE0wn2+J0UKlB4LWjMQ7wCUPwGiEWDX0haFqcyr7DEbN13N0dT/KubqChe5CDVHmoL1mOr+x/Mv9AzQHW1WWOFERVT2oRHaDq/ZBeTTNVG00AzLuUvJelR/67eEW52D8rEgxLQ371dQMabB+JBTa/xqCG1WD4tbDpn+BLEYQZ4ORQaLPpEGIS+Sgbrvaw29AT47r1CblkSygzpMgu12cWxXYSns23ECyc7XMlYIdLvO8dH5Ea5NCVDss4IiZiE8htLBytlAG86qy42+9HMypa3mGF7p43rYFg/j+sCrNBm0gjZS5VvLZRQ==
Received: from AM9PR02MB7010.eurprd02.prod.outlook.com (2603:10a6:20b:266::16)
 by PAXPR02MB7800.eurprd02.prod.outlook.com (2603:10a6:102:223::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 07:24:04 +0000
Received: from AM9PR02MB7010.eurprd02.prod.outlook.com
 ([fe80::ecb7:be77:2f83:d9f6]) by AM9PR02MB7010.eurprd02.prod.outlook.com
 ([fe80::ecb7:be77:2f83:d9f6%5]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 07:24:04 +0000
From:   Ms Jacquelyn Mitchard <dousamurai@hotmail.com>
Subject: Re; contact me to my email: ms.jacquelynmit@hotmail.com
Thread-Topic: Re; contact me to my email: ms.jacquelynmit@hotmail.com
Thread-Index: AQHZ+0q/imRVcp1TrE+c7eqF5l/aZw==
Date:   Tue, 10 Oct 2023 07:24:03 +0000
Message-ID: <AM9PR02MB7010634FC293F4B4348D3787C1CDA@AM9PR02MB7010.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [gquoouuIa6guRQHGQl+RihmnUNM8WVoP]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR02MB7010:EE_|PAXPR02MB7800:EE_
x-ms-office365-filtering-correlation-id: ec05ee4a-3ad4-45ce-b01a-08dbc961e1bd
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RKmbBSflJ7T/QdcuOa9T1cpgpL1AP5thYijpwy5RVIrMLUavlJ7tRQqgZ0bN9fPIBmclK4gf+dNG/H9dC12x4WcWVKUTQKhCOIqUI9CaV2ct724MZw7gt+zKUktbsiR4H2vD9nb04n2tDFLqgXvFJud/5fQb3WM41OCj+yMy6JGm+mWvk5lnz2G/VUYz2VfAdXdM2wKnnfaKasGdX8PU9EAr6XtDGYLePITui1Ho63kJkYkp4p7tH1x7LyAAHA/fBOjAuA9GXbwtOdHn7ut2QwJYZ+I8cFoKsT/J/J8QVUMNpuAkLk1E9AREcjTRTLbMKBcPg4u8WjpZGNLPxZFSpfo+ZpvAT48WdGzlV2biLiGvPGr55i+DSwjx8WUoZAU4c4akRySHYiN+4Gkw+SJQ9G/nR+28r++3VdTqYu4o1IZqoz9VANdXnIXfDjUUqI8LrE2Gl00/SQV+Md5X7etilsjUyM0anq6vdENVzIQaQZK7fzwwU1Fk0OkQQNiDCW0TbnfNkmYzk7ZqXt5y38ko5PShnGuBJ1NOKn35PmyV4UCIQn7ls3WxWXSt8yvn93ZQ
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GkbZK93eLCv/XaJAXHUOvshooR3EnLOuSXGsW+9NUzUrr4GDtXj+uvc2f4?=
 =?iso-8859-1?Q?2/B1Z1p6DrcV0Jhws1TBs4AKfg+DLayb2Pdbefzc+MDMfSMdTm+rszWbNc?=
 =?iso-8859-1?Q?08Jc1p0MVY6lbIcNosXFmZvkRPMVUhl4HCmeKysNG7qrS1Rw0V7BYut5s1?=
 =?iso-8859-1?Q?57MvBnQPxRsB4qayuB+uuHF9fsxPPZ9aQvHm1vGGnMWUvoSzvWcrk2/lWY?=
 =?iso-8859-1?Q?TbaATP7B3zq7X5eweIbBDhIWDk5WxtaP1pcZZrTsd33U0OfZNwkxexlx/+?=
 =?iso-8859-1?Q?122FWxkaKKaa0AaSwsT9TBbamVKYnyxZt7j256BwVeVFOiQSjgXcjKoYm0?=
 =?iso-8859-1?Q?4AM5kt1BUlrZkNog8giB01sA94wkXCTvLPUuFTiKrfTezdg7JVMVmt5Bs0?=
 =?iso-8859-1?Q?OzkOk1FOei5jw8dNCc0DiWgfDga23lPmG5lZB0KR5dCoQ+bWnZanjLMbYj?=
 =?iso-8859-1?Q?z5djOHB5a2My/Yvn490LJsVNPlQ7sZvs5AjgKKSqmDa7o1Lwv9HdwT/X1d?=
 =?iso-8859-1?Q?N0vJ6fAG+mggGx/kvD3URj2xPMyPmFGYQ/gUYrZaF1IDhZ3XpsIVPuSS0R?=
 =?iso-8859-1?Q?h050n/mZa12s/9GWvGYy3K/E9MpqPvJGZ36Qk3nAoP0Ss7khrLK81B4+Nk?=
 =?iso-8859-1?Q?+lcnttAuo3rLzyIGzSNfokIQffxAGnTzsL00VyS1Wzk2jzWKPZuDqfUBLO?=
 =?iso-8859-1?Q?iQvdX1VSVjZqx9TR9HakwC9xn+yc+6lNOk0/HRrH6/dH4T7hAWORwUoW+n?=
 =?iso-8859-1?Q?K/SwjpkHSOlXo4CPwgEBsTDTFgavAwIhKQmnlo+ykCqKRqnguBrKmTWYjA?=
 =?iso-8859-1?Q?7QdTsV1aSdhyM6H0Zr2zLV/EY8WWks5HYHXaEIYy2KUzxDcK5vzCdnnkFU?=
 =?iso-8859-1?Q?/bim+obUQIKgr9Rx1iz36BPQT78xzAfdbui/bSGB7lAgn9S3EctiRABknw?=
 =?iso-8859-1?Q?n/b9Wa3yL5QyzGGcDaH0Isvj2rN3NIk7wWI56SCL96BtdRvpvvVuslSKii?=
 =?iso-8859-1?Q?Sv447S061pCLSShDWLOi9Dcl6YO5o1eenkChD13JfhX6LoT34V8LipAwd8?=
 =?iso-8859-1?Q?vWh1mSy36LniEoRmhY8nAtv09jGh7SJPCmtT+dw2HyW+sVUusN4BP9wbUv?=
 =?iso-8859-1?Q?xDue7er4/QN1IzklB+krvdYPUx//ZT+62tqa82siabXASXXx72NVmu6Z4m?=
 =?iso-8859-1?Q?//ckYZW9IolwtQsAMv9rwe0d1jZN0UnA7BksX7XktARPd8XNTlIFm8+eOx?=
 =?iso-8859-1?Q?Cj2Jw7vcWq2MPvUEYRCQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bcc80.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB7010.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ec05ee4a-3ad4-45ce-b01a-08dbc961e1bd
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 07:24:03.8823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7800
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        MISSING_HEADERS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=0A=
=0A=
=0A=
Hello,=0A=
=0A=
My name is Ms Jacquelyn Mitchard, a banker by profession. I apologize=0A=
for contacting you in this manner but the situation at hand demands=0A=
urgent attention from presumed beneficiary. I have an important=0A=
subject to share with you, regarding late customer fund's=0A=
domicile in our bank.=0A=
=0A=
Kindly contact me to my email: ms.jacquelynmit@hotmail.com=0A=
for more detailed information.=0A=
=0A=
Thanks=0A=
Ms Jacq.=
