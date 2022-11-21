Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA07631D2A
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbiKUJqa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:46:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbiKUJqS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:46:18 -0500
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E340950F1;
        Mon, 21 Nov 2022 01:46:15 -0800 (PST)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL8Aq5W008009;
        Mon, 21 Nov 2022 04:45:55 -0500
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3kxssegqeb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 04:45:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaI/zgA/1khTjI+UKUPLv7SRF3bJBE86Y8yBPkhuuEh7SPOmCv+OtVzki617NNGKmg6k/BXJFv/y1LKhNxMh0pzg4D5chNGzDxO3QMqay/BTniIrREu9u1Ggfz3upuw+ILbtVw846oZC2sin7hChtwojpzvOvdA1mL03HwXl5xBzTqGz7KIInYNcSk54bcSZvZUEwr5I8ybC9XKA2iC9BXQD2Ga9OvSiIjFh0Vv6P6COhEBnPOdh/6gH02kj/tIV6VFYbPSw3f/6Fp4VlR1uuut8PeCrBMnFbKhGJ+0xAMryivLar2ZQsN5TZKKr1fsQ7IIZ7hwilxsJRSpthyEzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4BUpi+ZPp4ikj25TQ4Tp+tz+ceHZ811PP4ZOKhRCnY=;
 b=cUXhrq181Wf6zEBgTtAI1B/ezLJ1Qa8whw8YW4tA+BHpdUCdWbk6ODbK2b5Fm/7hH+b7p0YbNz8oFLyt+H/TjI1Af4uvmDuVwo17Dp4XnZ5yptsXilvsNzToxhLFectr57ZOAnWmeEEB8W0AWp57a6f3w9kN+Ar4tHjlScm1IFEp/vJazrt6HsVmmWi84W7Oh9O7Xn754FZ7AlGisgJuY9o/jfiXutLpGw6fUQEehfvvC7OmQAdk7vltMsGqh3WzGbGA2iiZuWjf/28gaFbNNlXdanMpHw25KLk+VdrF6mmxfUiRyJoVA3vN1muEYSCm8sIeiCohC7luehK7i5vLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4BUpi+ZPp4ikj25TQ4Tp+tz+ceHZ811PP4ZOKhRCnY=;
 b=nRr+jyw2trsg0csDY6ZNR7tpOSysa37WjmNIg+uWgAnjeZ4VflfTJMfR4iP9NlltSs9ShB1A+IJLIGuMnV7gpR+IsDoXCORB1uA85zCdFgFuy59df1LZ9y6pbDbgJSZX8+BSDMaip3sqy5gYUAlBpXgmV1Ee38x2I/5elMUf8NY=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by BN8PR03MB4914.namprd03.prod.outlook.com (2603:10b6:408:7b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 09:45:52 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::1ebb:3664:c148:f2a0]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::1ebb:3664:c148:f2a0%6]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 09:45:52 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 585/606] backlight: adp8860: Convert to i2c's .probe_new()
Thread-Topic: [PATCH 585/606] backlight: adp8860: Convert to i2c's
 .probe_new()
Thread-Index: AQHY+5/f8j2HGPblcUGqJiJpTIh0vq5JJMfQ
Date:   Mon, 21 Nov 2022 09:45:52 +0000
Message-ID: <SJ0PR03MB6253CE4F323018875FA5A9E38E0A9@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-586-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-586-uwe@kleine-koenig.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYldobGJtNWxjbWxjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTAwT0RGaVpEUTVOQzAyT1RneExURXhaV1F0WWpjeE1pMWlZMll4?=
 =?utf-8?B?TnpGak5EYzJNVGxjWVcxbExYUmxjM1JjTkRneFltUTBPVFl0TmprNE1TMHhN?=
 =?utf-8?B?V1ZrTFdJM01USXRZbU5tTVRjeFl6UTNOakU1WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXlNekEzSWlCMFBTSXhNek14TXpRNU56VTFNRGs1TXpRMk1UY2lJR2c5SWxW?=
 =?utf-8?B?bldUaExXbVpXUjNScWFIWnBSM2RCZG1JeFRrdzBORUZoY3owaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUVZwTmJrMUxhbll6V1VGWGJ6ZHpiMHg1T1RsR1VX?=
 =?utf-8?B?RnFkWGxuZGt3ek1GWkJSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-traffictypediagnostic: SJ0PR03MB6253:EE_|BN8PR03MB4914:EE_
x-ms-office365-filtering-correlation-id: 0255c9fe-b905-43c2-f0de-08dacba52df4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +WIbdrAK7i7GcwqVnNL8pjQqDOt8WGuLi2/umW8TRAoOrTQ0POr3cel/5x0UjSJ7cchraqm+JcO2OmeIzHpCVeaw1BnQveKrXmcXq3jU30oA2m+zT3UbS5SNpDB7et/0QF93QaFJVwcEqh8hfIF3MG2EO3TdgojJrpimLkfVSkFY0TK452IPHsyfGsWy/Q/pxT/e6+A3X+0PMqmFmvi6HSSEOcEMKYLdeA9hvGnRg/ObdoAMCWo7U9xgJ6zJuTxwCK82zFoei9KBGARfiAGdh1EBubrh8WxUFSj9Zgl2jdz7ZZrcTjPwrwaWMrJWrIspzy3k4Fu57XR+bgufcZqUozjOtB0Kcl3sadL7peWt01xjZK+Ajl3Lip0zjJgEBNxdXyOhHJ2Q+jQFxmbKJWYXunIYv47c1Y+krwNvz4fRrM30PXKokBxi41VHkXkmShvV4jC4FJGamgZYDAquN0etXMkNmJXPoVunv3i6e6/mpzvimQNdxPqPaoX8jD+wyKG+q9dzp/0zPCuV4vUia95RO/yvaVtbLCP2FH6CjayaeVXXqTfumRMcGIbrAzBK0gOc1AmAAv6r/6DPlfg7iA+fq4XvyQcpeeTOz6Ai4RPOQ9qYc0h/k49w5AM8n1RI3hoOkkyS3JXLQxQVRNQKVDayv8VDR/cqg8GIYFzqHlz2hHSuBFui8GsmlMmo0ocMwiZO4PzF6Ao5es7u0/CYvc/crHNjIPRWkCcw+cySCCBFeos=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(451199015)(64756008)(8676002)(4326008)(41300700001)(76116006)(122000001)(66556008)(66446008)(66476007)(66946007)(54906003)(86362001)(26005)(316002)(38100700002)(2906002)(83380400001)(55016003)(52536014)(33656002)(8936002)(186003)(7416002)(5660300002)(9686003)(71200400001)(478600001)(38070700005)(53546011)(110136005)(6506007)(7696005)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0JBeFNNclprQ0JGTkMwSWZHT01tYXVRMDhuczkzQkJpTkZXVzgrZGxoT3F4?=
 =?utf-8?B?eHRVV2FXOE9JVk5MSGdCMnF6Tlp0Qmc5VTZVdXN5d3kxUWovSWlzUlI1Sjlr?=
 =?utf-8?B?ZXdUTVJodXV2MmlLK25jNW5kOU5yRjg1U1JNNVR4bjJzanRybXBxandqR015?=
 =?utf-8?B?WDVKVFNnNTVSUTNHM0pQQUdDckhKOGVPcThVUFM0VWRrcXlpQWcvNGhrbG90?=
 =?utf-8?B?OHJPM2s1Y3hpZkErZGlTUmIwSFk1ZnJMYzRrbmgySUlsQk1MTDNOVTNoMlEy?=
 =?utf-8?B?RzIvZUt5VTluSmJSdDJGcUVOc3ljTklsWENDd3VJTlBLOXlGMXJXVHlkMGtE?=
 =?utf-8?B?SURQYVRWZ0dMOW5sRmQrWS95OGxobjhtdDVibnhZVUVNN3QvbDVFSmNxbzM1?=
 =?utf-8?B?QjkreW5HeFgzY1dQUW9BL0xWV2pTdzVIcTRHUU9Rei9qUXpqUFo3MDQweEN4?=
 =?utf-8?B?cS9CV1JUM2s0bFFleW9QQnV0UTc0QnVaZmtLU2lRN2syN2Z3MUJvUnNkRUtJ?=
 =?utf-8?B?Z2Y3L1llNWs2cy9QU2dtd2Z4NnVud3dYb05OV0FXcXNtZlJKT2xEL1ZuamZs?=
 =?utf-8?B?bkhwMjRZM2dxUWZUUWExUWZpWXRQMHRjVG9FOFNkMyt2d1dxQVU5Y1pMR1ZE?=
 =?utf-8?B?RG1IQkJzcFcrU2pQSEJDWG9xOG5OalIwdS91WEJpZXovK3lZNmJZQmdyVzYw?=
 =?utf-8?B?alhWbWVRd2dPM3B3Q2FOOU1id3J0V0xOV1QrWDRYOU9LSjZ5SUxNSjBJRm9P?=
 =?utf-8?B?N2JRdy9qRHV3RVRNNlk0SjQ4WVdWV1B5NzVMcURQTCtjZ25pcHdMWlZaMXN6?=
 =?utf-8?B?bTRQZXZ2STQ5NytKUG03OEZzYm9SVFl1aXBtZ3lSY3RTMWZZbW81VFNHYm5W?=
 =?utf-8?B?VEIvTEtIL3R3dFJKSkFsT2xqdnc4N2w2cGVVTWhEVXI4YzlxdFRyc2N6a2Zl?=
 =?utf-8?B?Ky9UTTVjYnZFaGYxNEF4Mk80OGZZZTM5SytWYlRsTTRZMFFCSHA0blVSZnZ6?=
 =?utf-8?B?SThDQ1dTbmIrQVllOG9Vbjk4WUliNlc0clVQNWk4dHFWUE5BYW1xMnZGT2lV?=
 =?utf-8?B?dVBRUC9NZ2p4Z2tlS3ZQZEVPV3hMajN3cGM1NWp1T2VBbW5zbzduRER6NFFx?=
 =?utf-8?B?WUxRektkMDVod2FEdFlGbzlwQUhtSkxDRGdJaU5SSlBuTlR3YnF2ZUJObkMw?=
 =?utf-8?B?VTIwQzdreUdISlNRcTNONnVuTmhEd20yY25ZU3VxTmxPVW1FZy9wS011ZnNn?=
 =?utf-8?B?OXZHRDhGS0IzSW9SemJjcFZrQkV4NlVDeTNhMFA3MEx4bHczamhmNVBZN2p0?=
 =?utf-8?B?R0UwaEFkY25lQ3h3bkpOU00yN1NydGdTZ2ZGMGVzZmNyVmVUbUw3b2FjWmZy?=
 =?utf-8?B?L1hzUkJrZW9wTHI4Z1lNcFdGcUJXUCtIdzAxelhpa0FPbGJCWGF0YzEyRk54?=
 =?utf-8?B?R25hY1hLcWVidHVOcm9aUHByRWdLQVJmU21kQk01eVcwbjlxVlplWGd5M3dv?=
 =?utf-8?B?MjZBQmEyOUpuZFJaTzEzS3pXV0FoT3l0b1NSNkQ2RG44cEdBU1RNZ0VyZjNT?=
 =?utf-8?B?UDRHY1V5ancrMzBVNjl4dWxHbU9ISHRlZ2F0Wlo1MEdJQldXQ0hreWhRdStL?=
 =?utf-8?B?N0tHV201R0ZGcCt3eHJuNEtQUVRUay91ZXJON0w5S0RhQTNyNUJmOXF3Y29T?=
 =?utf-8?B?MHdUOXc0VUdTVWRDQ0UycGVjTmlZcE5WUlU3QTdFTUd1WGlJL05FSFdBbm5L?=
 =?utf-8?B?RWtrYXNjWXg5bFZOdkJXWjhMUXJIWlB0R2g1T1pWSllhUVBmV2JVd2xRVFBn?=
 =?utf-8?B?djN0WUJKcEU5WDVPd1BYVHBqbUY1cVBSaUJCdStPa0RqYVc0Vlpld0duVk1W?=
 =?utf-8?B?Mm1QanBkZlZzVDNXOHVoQnhQQWJxM28yWkY5SlNwZGxNcm9mc3BDUVduVis0?=
 =?utf-8?B?aHRjK2tmVUJOVjJObDdMV3F2b0NwY0k4Tm50d0lrYmxyczRVR2VhWWJLMkNv?=
 =?utf-8?B?QTFaYURTZWh3K25MeWNWNTQwQ2VGSHlEWitnU3hOR2k0RXVlZkF1MGJrMUpZ?=
 =?utf-8?B?MEZBUG5FNDBXdVJBb0J4MVpReDhsYlE4eWdscXdyLzZvWlJDemVLb09GalZH?=
 =?utf-8?B?ZXUweXN5TXlETklvYmxzQ0RObkM2Ujk0Zm1hVE83TmhYZDZPNy9tUmFtRy9L?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0255c9fe-b905-43c2-f0de-08dacba52df4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 09:45:52.6947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XdX6jOlKbqOj+XaQKGLEur6IPflXh514iebM21ZbZ7zFHtJjznMmr0ifHwKzB5gF3D+WFfgm5zADU1eQ+7PMAtuBbY/D5+7legAvbTaskkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4914
X-Proofpoint-ORIG-GUID: uiCxjopO2_wyRKHK5f2MAyXKn7CbKar9
X-Proofpoint-GUID: uiCxjopO2_wyRKHK5f2MAyXKn7CbKar9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210076
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4NCj4gU2VudDogRnJlaXRhZywgMTguIE5vdmVtYmVy
IDIwMjIgMjM6NDUNCj4gVG86IEFuZ2VsIElnbGVzaWFzIDxhbmcuaWdsZXNpYXNnQGdtYWlsLmNv
bT47IExlZSBKb25lcw0KPiA8bGVlLmpvbmVzQGxpbmFyby5vcmc+OyBHcmFudCBMaWtlbHkgPGdy
YW50Lmxpa2VseUBsaW5hcm8ub3JnPjsgV29sZnJhbQ0KPiBTYW5nIDx3c2FAa2VybmVsLm9yZz47
IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IExl
ZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+OyBEYW5pZWwNCj4gVGhvbXBzb24gPGRhbmllbC50aG9t
cHNvbkBsaW5hcm8ub3JnPjsgSmluZ29vIEhhbg0KPiA8amluZ29vaGFuMUBnbWFpbC5jb20+OyBI
ZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+IENjOiBsaW51eC1pMmNAdmdlci5rZXJuZWwu
b3JnOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IFV3ZSBLbGVpbmUtS8O2bmlnDQo+IDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBsaW51eC0NCj4gZmJkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCA1ODUvNjA2XSBiYWNrbGlnaHQ6IGFkcDg4NjA6IENv
bnZlcnQgdG8gaTJjJ3MgLnByb2JlX25ldygpDQo+IA0KPiANCj4gRnJvbTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gDQo+IC5wcm9iZV9uZXco
KSBkb2Vzbid0IGdldCB0aGUgaTJjX2RldmljZV9pZCAqIHBhcmFtZXRlciwgc28gZGV0ZXJtaW5l
IHRoYXQNCj4gZXhwbGljaXRseSBpbiB0aGUgcHJvYmUgZnVuY3Rpb24uDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
Pg0KDQpBY2tlZC1ieTogTWljaGFlbCBIZW5uZXJpY2ggPG1pY2hhZWwuaGVubmVyaWNoQGFuYWxv
Zy5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hZHA4ODYwX2JsLmMg
fCA2ICsrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hZHA4ODYw
X2JsLmMNCj4gYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hZHA4ODYwX2JsLmMNCj4gaW5kZXgg
YjBmZTAyMjczZTg3Li5hNDc5YWFiOTBmNzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2FkcDg4NjBfYmwuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9h
ZHA4ODYwX2JsLmMNCj4gQEAgLTY0OCw5ICs2NDgsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGF0
dHJpYnV0ZV9ncm91cA0KPiBhZHA4ODYwX2JsX2F0dHJfZ3JvdXAgPSB7DQo+ICAJLmF0dHJzID0g
YWRwODg2MF9ibF9hdHRyaWJ1dGVzLA0KPiAgfTsNCj4gDQo+IC1zdGF0aWMgaW50IGFkcDg4NjBf
cHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCj4gLQkJCQkJY29uc3Qgc3RydWN0IGky
Y19kZXZpY2VfaWQgKmlkKQ0KPiArc3RhdGljIGludCBhZHA4ODYwX3Byb2JlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQpDQo+ICB7DQo+ICsJY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlk
ID0gaTJjX2NsaWVudF9nZXRfZGV2aWNlX2lkKGNsaWVudCk7DQo+ICAJc3RydWN0IGJhY2tsaWdo
dF9kZXZpY2UgKmJsOw0KPiAgCXN0cnVjdCBhZHA4ODYwX2JsICpkYXRhOw0KPiAgCXN0cnVjdCBh
ZHA4ODYwX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9IEBAIC04MDMsNyArODAzLDcN
Cj4gQEAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGFkcDg4NjBfZHJpdmVyID0gew0KPiAgCQku
bmFtZQk9IEtCVUlMRF9NT0ROQU1FLA0KPiAgCQkucG0JPSAmYWRwODg2MF9pMmNfcG1fb3BzLA0K
PiAgCX0sDQo+IC0JLnByb2JlICAgID0gYWRwODg2MF9wcm9iZSwNCj4gKwkucHJvYmVfbmV3ID0g
YWRwODg2MF9wcm9iZSwNCj4gIAkucmVtb3ZlICAgPSBhZHA4ODYwX3JlbW92ZSwNCj4gIAkuaWRf
dGFibGUgPSBhZHA4ODYwX2lkLA0KPiAgfTsNCj4gLS0NCj4gMi4zOC4xDQoNCg==
