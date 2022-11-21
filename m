Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375DA631D2E
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbiKUJqw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:46:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbiKUJqk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:46:40 -0500
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1EF98276;
        Mon, 21 Nov 2022 01:46:39 -0800 (PST)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL7Ci9J021981;
        Mon, 21 Nov 2022 04:46:30 -0500
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3kxsvaub7c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 04:46:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bi4y8agEZB1DIUXNKv4pMq9wBlaS/bD6DWLuC7id4XrTcmtnMtKxVNl7ZFnLvLy1S77ePLpBlCUEp7h1CqlqRG9YR2rL+fSN4Bm7N3CflHWGqS5UhpESeklmDUyMXKEsev6bRzdH0LJYkcnHWjQCd8pQVTJ/biNgE1aPVLiRP35sSYoNtqOnJw9K+zQNUqsbhRFv6SXjFyGaI5Gqfip0bgHGHzteRzagsWPSMB5J8wz34vAHvuaAqZHs6CNKTVbaCD9jFjWf3x7jX4qebslJNwJGCX4Den1e5ucUzTxyOkdKYmhGxe8uVqcknKXor40Ltti+GRh62Uj7kJ3IiHWSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+fF00eQsh7xrWtddsBCQUiAbX1fDwnCtQsSBAHi3xQ=;
 b=XewecDgE0/aiA62e/o+lDKtk6pxDQNCRmOHjHjPmwbcgE2KSjTdZd/yyqEFkH2FzcrGcaRUwYvMzylE53HRyI6XiAKEWhOQA4qC5BWjtrTZK4lDDvvxBaBFzqb4nADaWkSJFYKXxhHebbWwm5ViQAgdHV6TI4LKYqk0mWtP0uxYeEcblAD5gNvbUF6kjJ1X15iwBqcBxEh7QjQUE24hxk7faXqjxxumQaenv9eAL5ydNfHWLdjHQs94HR8HgxX1QnR3n5+cT6CV69mym4b1ZJ39Y7fJWkBYxgInEEodrfEu8U98NHX18RcNXrnp1u8SIILMDi8xr4t/+LTTdKYaqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+fF00eQsh7xrWtddsBCQUiAbX1fDwnCtQsSBAHi3xQ=;
 b=xnpfv1TrjmZmAf1CaQPhGMWskwEQw0oUGlIL7Cx3vMLCEU0mbb7fcpYGxh5hYjO26hEKWhQmc+KmitzucQ2SII3YhaOmUSBQQd93ZT8Uv2ohewpAbuFLnTSQrYzVZeWwIc9N3DdXkkIotFKSw75D9sz7dgRGapYVqMYbaItDI48=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by SJ0PR03MB5870.namprd03.prod.outlook.com (2603:10b6:a03:2de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 09:46:28 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::1ebb:3664:c148:f2a0]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::1ebb:3664:c148:f2a0%6]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 09:46:28 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 513/606] power: supply: adp5061: Convert to i2c's
 .probe_new()
Thread-Topic: [PATCH 513/606] power: supply: adp5061: Convert to i2c's
 .probe_new()
Thread-Index: AQHY+5/YN1Lct0wGz0K8MEZbZZocGa5JJO0w
Date:   Mon, 21 Nov 2022 09:46:27 +0000
Message-ID: <SJ0PR03MB6253C5F78CD207E4CB7976AE8E0A9@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-514-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-514-uwe@kleine-koenig.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYldobGJtNWxjbWxjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTAxWkRRMk9XRmlPQzAyT1RneExURXhaV1F0WWpjeE1pMWlZMll4?=
 =?utf-8?B?TnpGak5EYzJNVGxjWVcxbExYUmxjM1JjTldRME5qbGhZbUV0TmprNE1TMHhN?=
 =?utf-8?B?V1ZrTFdJM01USXRZbU5tTVRjeFl6UTNOakU1WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXlNREU0SWlCMFBTSXhNek14TXpRNU56VTROalV3TnpNek56Z2lJR2c5SWxk?=
 =?utf-8?B?VFFVTjZMMjFzYUdSWGNHcGhWbTgzUjNwamVpOWpLM3BYUVQwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUkdsTWNEUm1hbll6V1VGYWJGQkJiWEJRTXpobWJH?=
 =?utf-8?B?MVZPRU5oYXk5bWVDdFZSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQldEVnNNa3QzUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6253:EE_|SJ0PR03MB5870:EE_
x-ms-office365-filtering-correlation-id: 676bb7ff-38e9-4d9f-8841-08dacba542f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jxzxBWi0B+GDTFYZKh03bFRvne05WlHYQ6PvMGp4LIBhytN1KgS9uK0ftNtu7oer9vKi+ir3J4ggzm6SFqG8iXvSerGlpXpHK/kMcnLTfBOIX5muLEdLL9qm6sr1RJexih7sQvTXDq2dzaIZp85bi1ynEuTymduntnPdUvozzG1A1q/dCHIGzokAVr3v8wYmNV6VlPvou2wSHh+hEq2wNbdAwMF1kQu3W/BbWTBBN4Hkd2BKRRem7HoddWC21SQWEqNQrdHvuI7bwBfetfoWQyR7lHzg0krAG9iwrZl5NSh9Z2zy6huMZk45jcU1wNsDRzDRwbQwDwHPd0nfBniPpIfvbdsQEJBiJ3XjqeLx361hFu3H3ZFJ9ZUfO+ixmRcf2B0WrFpGIEp2UKo3JQfhBlAQc8H74H4zw1zhU9oxdwelp6HoF4PTpDuve1XOOoPyug+Fl3X3lThNaiLfeoibIEYOSTQgs86kOhO1cHiftc0KpsagZjPkj5RDNcVHtO+ek2zhacbYUn53paDfVrsCL3AMUpxb3Ao9wBh9FRTrOIPT3I1YKobnh8pMcw50oOqKEDQqSkXH6ActYzA3FvkaNZW8sa/1LhU8bsCDYHW92fOfEBMapJYOllRKUs2PSoQEqGhUGNIM5NrY1CzGetNkJg5mS8altsu/epwRTKNdzzw7TYsbiW1LeWk3qpp88wjcJuzSoFU1g4/X8W/IvFtZ4rfCCCfOcjJ7xoVwF4pfwJA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199015)(6506007)(186003)(7696005)(9686003)(53546011)(110136005)(2906002)(478600001)(71200400001)(122000001)(38100700002)(38070700005)(55016003)(83380400001)(33656002)(86362001)(26005)(7416002)(8936002)(41300700001)(66946007)(76116006)(64756008)(66556008)(66446008)(8676002)(66476007)(52536014)(4326008)(5660300002)(316002)(54906003)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTBoVnNwOFp5R3I1RitxK2xOWWJ4WVhuZlNZemFPMFVHL08ycDdtKzdlS1Iy?=
 =?utf-8?B?V1pWYTREUUU1L2FiME5yN1E4ZVMxSDFQcmxsMGtzcDk2anIvR3VTcUtnUS9J?=
 =?utf-8?B?OFVZUmxKTXBISXhaVkFNN1RsMFJ0ejBVTUt6bXJsVWNBVEs2ZHF3SGhwcEtJ?=
 =?utf-8?B?T3dtOTNTYTlKYTdveS93ZXdRWlQyWWhETlp2M1Nvenk4QlJnc3lOajlhRnUz?=
 =?utf-8?B?YkxRU1JLYkhleFQ0QVNDRVVhVTJ1R29BUWlYUHppZFc4WjcyM2FjVXRzWEIr?=
 =?utf-8?B?OXkvMkVpQVFqU3ZlbzRZajZ4bThpMkdSbjR4YTI0ekdTaUpteUdvWG84WEJ4?=
 =?utf-8?B?SS96ZGh1UUdoUzZQT2JGKzFiRHE1alc3MVd1L1NDYy8xUzYxUGk2eFdaNEdv?=
 =?utf-8?B?dlJSakVtQmJ2eWNYdUR3dU5CM0FVMU5NaU9JVkZuRFJGTGxGVlExSE9oSVMz?=
 =?utf-8?B?ZHQrL3c5ck1meVVNOGdUZzNOWFNZWm5oZkRDOVVaMEVsU0l4OUMyMGIzOC9V?=
 =?utf-8?B?MU5JT2NqNWlrU3MwdElOZllzT21NSGRIaFZmQmVBOW1pcXZ0UGtKc0lNeVNS?=
 =?utf-8?B?U1JWUk9UUGRkbXQ2Ym5BMGlBVGpZRUhqblp4SU9sajluY0habVBwOTRCeXow?=
 =?utf-8?B?U0x5ZWQveDhncEpkMVpIU292NFZMWUl3cytvTVJNaDdmdjRiQko2U3pDdldH?=
 =?utf-8?B?OVhULzdHcFFWQ21ZRk5GUVlZaTdhZUF1NjVWV0swUU9LMWZlelBjRlZRRUxZ?=
 =?utf-8?B?TUlUTmFpcElvK2d0U1B3NEFtejRjREZlaHF4RDVYM1NLVWlzbTI2Q1hoc3hH?=
 =?utf-8?B?YjltK0VnelpHTnI2WXUxZHorQk80QVZkSFR3NnduM0lieGoxb0NsdVE3ZnE0?=
 =?utf-8?B?Y09jaFdrNXNVNVpOaHRaeGZ2ZS9ETDBkQjJWOFJZU1pUajJPNEQ3dTdvcll0?=
 =?utf-8?B?MlNjRXQwQWE1QUw2Mnh5RjJjaUJNY0F1VCt0RmsydmJ3VGlFckllUDgzbHMw?=
 =?utf-8?B?d2JndW9GT3gwUVo5dVI3MmdqQlQrbDRleEtMM1dtdlB5TU5oUDg3SlVhNlJr?=
 =?utf-8?B?M0xPWWd0S3hyYU5HTkI0ck9WdittS1pwRTlWQUIrUjF6S01jRk1VajdiT2gw?=
 =?utf-8?B?dDhpNzhaZGlUMWZiUFFuenRuL3dhSEJoU0dIVEp6VHdMbmVtVmRza0VFUktl?=
 =?utf-8?B?NGlwVzJ1MnYzTmR3ZWVmWG1CZ0lkUkt2UVp5SHoxTE1wZHk0RTBoQjc3a1A0?=
 =?utf-8?B?MU5ZdWVSUjl5RHRxQ1hMTVh0aXZMM0pUSnBZZG5qYkdkbzZHSUZTVmM4Q0kw?=
 =?utf-8?B?L0hMYUltQ0s1SnFYcEgvajdIeVNCY05HcHMra1Mxb09HeU5nVWk3NU9MNitN?=
 =?utf-8?B?RkdxanlPemNMQzJzQVZsaDZmNC93eUlUMW5hU3BmdEhudmF6NWhKMTA5ak9r?=
 =?utf-8?B?QWFaY215NThLZUxYLzVVNm9OK3ljTUlMK2ZkS0FWVFF5bEpTNkFEaFNFZ3NB?=
 =?utf-8?B?M0YwdnVaakV3eW1pSnlqUStrd1VUeGhzRldlV3gwcWdBV3Z3WXBFKzBpQzNp?=
 =?utf-8?B?bVV6b0tteVFjU3dDUEhTWUFkZ2xGM214aFFiZ1RlYWFFQUZNOTRpSlY3U2NL?=
 =?utf-8?B?KzB4SGhYTlZIZlFGbmZTazRlS3d0NWRrUFBUM2IxVGhPZlFYWWpFRndsWncr?=
 =?utf-8?B?TDhBYXZ1NngrWHQrcEVwN3JaM2hhTnBEbzNVR0tBZHpqSm9ycXNxRVJoVVR6?=
 =?utf-8?B?WThJanc0MU9ra0RMcWQwc2NaUWVqTW5ySFJKYVkwZGVUamdEejkvQ2kyQ05w?=
 =?utf-8?B?WEdqRUlzWVJZNWx3QUlSZ1dsay9XTGxnQmtHWnFKa1dYTElBc3k4U05DRE1m?=
 =?utf-8?B?K21jczRDSllpTHlUTmlmMUMwZGd2d0xqcFBSSko1WTQ4SE1QZlpoRkh6QnlU?=
 =?utf-8?B?cng0VlFqSC96SytTOEJmd0dXZ3pUbStLaU96cnJaM3N4eVMzTmNvcnBpQkVH?=
 =?utf-8?B?SzYzZVZtajVjakdLMURKMGFKbmlWbWJaU3VaakFKVDZtNzNobFozamEwNG1z?=
 =?utf-8?B?cjRlU29idmtXZEJ1MjZocVdhNkF0Y2VSdlY1U1pHQmc1YXRKbHdJcXlaaTZ2?=
 =?utf-8?B?QWtvUTFCTnptc0xnSVFoaEVBOHJYRUxENXFEUkJQQUVzZTg1elplYUIxNTA2?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676bb7ff-38e9-4d9f-8841-08dacba542f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 09:46:27.9569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JEl0YDJMnVwE4e77CojhwusA52C6w0QWBNJbZew3J6BuxpM2xTyRSXsFHfGB5GBo5FP5dK1P/Gv72v2kKOYIVLg87PqrIOPz7KWVZmj8WSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5870
X-Proofpoint-GUID: xsZIGcVyPBB9B0fJV-hb9WUf2IfsYie1
X-Proofpoint-ORIG-GUID: xsZIGcVyPBB9B0fJV-hb9WUf2IfsYie1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210076
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4NCj4gU2VudDogRnJlaXRhZywgMTguIE5vdmVtYmVy
IDIwMjIgMjM6NDQNCj4gVG86IEFuZ2VsIElnbGVzaWFzIDxhbmcuaWdsZXNpYXNnQGdtYWlsLmNv
bT47IExlZSBKb25lcw0KPiA8bGVlLmpvbmVzQGxpbmFyby5vcmc+OyBHcmFudCBMaWtlbHkgPGdy
YW50Lmxpa2VseUBsaW5hcm8ub3JnPjsgV29sZnJhbQ0KPiBTYW5nIDx3c2FAa2VybmVsLm9yZz47
IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IFNl
YmFzdGlhbiBSZWljaGVsIDxzcmVAa2VybmVsLm9yZz4NCj4gQ2M6IGxpbnV4LWkyY0B2Z2VyLmtl
cm5lbC5vcmc7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgVXdlIEtsZWluZS1Lw7ZuaWcNCj4gPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT47IGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZzsg
bGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW1BBVENIIDUxMy82
MDZdIHBvd2VyOiBzdXBwbHk6IGFkcDUwNjE6IENvbnZlcnQgdG8gaTJjJ3MNCj4gLnByb2JlX25l
dygpDQo+IA0KPiANCj4gRnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4NCj4gDQo+IFRoZSBwcm9iZSBmdW5jdGlvbiBkb2Vzbid0IG1ha2UgdXNl
IG9mIHRoZSBpMmNfZGV2aWNlX2lkICogcGFyYW1ldGVyIHNvIGl0DQo+IGNhbiBiZSB0cml2aWFs
bHkgY29udmVydGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCg0KQWNrZWQtYnk6IE1pY2hhZWwgSGVubmVy
aWNoIDxtaWNoYWVsLmhlbm5lcmljaEBhbmFsb2cuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9w
b3dlci9zdXBwbHkvYWRwNTA2MS5jIHwgNSArKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bv
d2VyL3N1cHBseS9hZHA1MDYxLmMNCj4gYi9kcml2ZXJzL3Bvd2VyL3N1cHBseS9hZHA1MDYxLmMg
aW5kZXggZmNmOGZmMGJjOTc0Li44NDBkYjYyOWE0NmMNCj4gMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvcG93ZXIvc3VwcGx5L2FkcDUwNjEuYw0KPiArKysgYi9kcml2ZXJzL3Bvd2VyL3N1cHBseS9h
ZHA1MDYxLmMNCj4gQEAgLTY5NCw4ICs2OTQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBvd2Vy
X3N1cHBseV9kZXNjIGFkcDUwNjFfZGVzYw0KPiA9IHsNCj4gIAkubnVtX3Byb3BlcnRpZXMJCT0g
QVJSQVlfU0laRShhZHA1MDYxX3Byb3BzKSwNCj4gIH07DQo+IA0KPiAtc3RhdGljIGludCBhZHA1
MDYxX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+IC0JCQkgY29uc3Qgc3RydWN0
IGkyY19kZXZpY2VfaWQgKmlkKQ0KPiArc3RhdGljIGludCBhZHA1MDYxX3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpDQo+ICB7DQo+ICAJc3RydWN0IHBvd2VyX3N1cHBseV9jb25maWcg
cHN5X2NmZyA9IHt9Ow0KPiAgCXN0cnVjdCBhZHA1MDYxX3N0YXRlICpzdDsNCj4gQEAgLTczNyw3
ICs3MzYsNyBAQCBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgYWRwNTA2MV9kcml2ZXIgPSB7DQo+
ICAJLmRyaXZlciA9IHsNCj4gIAkJLm5hbWUgPSBLQlVJTERfTU9ETkFNRSwNCj4gIAl9LA0KPiAt
CS5wcm9iZSA9IGFkcDUwNjFfcHJvYmUsDQo+ICsJLnByb2JlX25ldyA9IGFkcDUwNjFfcHJvYmUs
DQo+ICAJLmlkX3RhYmxlID0gYWRwNTA2MV9pZCwNCj4gIH07DQo+ICBtb2R1bGVfaTJjX2RyaXZl
cihhZHA1MDYxX2RyaXZlcik7DQo+IC0tDQo+IDIuMzguMQ0KDQo=
