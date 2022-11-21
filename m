Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A053631D34
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbiKUJrN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbiKUJqx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:46:53 -0500
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED4697A9F;
        Mon, 21 Nov 2022 01:46:52 -0800 (PST)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL9aloI022022;
        Mon, 21 Nov 2022 04:46:43 -0500
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3kxsvaub8q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 04:46:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nm5fqVb64i0cYLUxamF2qECVhXJCshZbDqbhn42Dq6h0wtlzMfAc2VgY9eBHpUsDRF1oBhh0fohe4ZwzU/lS2ltWEIcVI/Y/cJCh1BjqnTQEcHijkdsIandWoxCXwB+B60xOzahrVMtADm2iSbaC9dP+Dqwh9de0h7hHD1l5jFkD0Dk2EoTX0O144bjsGJjRRZFC9yUEgpxDc2YFwk6JXLg5VzKP0Nievntry6jzm6cu5xFIyEXIAfyDoHUQBPOuhKrj4+ewpRzFGebm92NXAkQ3hKGPpi3yMzI0+JxpZrC0b+s6Gm2P+EaGqtvvopLTccB7PB8NQDlfEiITSgjfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/nPnompThzwwG50NA6AIkHWAQDwegkEmkiSiEgv/vQ=;
 b=Q8Mkq/2jzDnVksSp7cWQde6iZ0gDcM6BBNQt+Jl/cKY74d/lmqkqyRM6v3bIEy+5h5MaxhTQlQK+XfnaWGeULZk9emTGhLt0A+5zuu3IxnzfSgysdIbGMyCc5Qd4VfAGS/Gg7evrirxzjOoepxZUYvaBMYVZd+AmESidXUR4i8EZmVZENyc8+WKFVjYXD1wPeqwrnWJeTTgsB0h0ox0h2nci5Uvmmlf/3ek0c8qeK/uJKp10+ljgSsdkjDNkW1zZmAho3ARdqfYD17T90XzzAGQzGCAlYhqZP6C4RqldHouRT9via5xyYCAIWTHS0sNKh79qdpHyXM1i8kCjM1yEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/nPnompThzwwG50NA6AIkHWAQDwegkEmkiSiEgv/vQ=;
 b=fGLEwxVmGUlt1tneJ6MkvTUV+2XOBW70PdxLovcmt9EwORYz3M9ReWBTlO6ViRWgu59qfazczFF0xtN5L+jhJLkGvNJj+TVWODOqI94PD4zNg40czENAw9saeoxfmwbPKYgDAzDwYs5OcDB3FJRtnkeXtMSiOL9llNynKVkQzk4=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by SJ0PR03MB5870.namprd03.prod.outlook.com (2603:10b6:a03:2de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 09:46:42 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::1ebb:3664:c148:f2a0]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::1ebb:3664:c148:f2a0%6]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 09:46:42 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 417/606] mfd: adp5520: Convert to i2c's .probe_new()
Thread-Topic: [PATCH 417/606] mfd: adp5520: Convert to i2c's .probe_new()
Thread-Index: AQHY+5/NunaB+X1HA0Kt7eUmCsmO0q5JJQTA
Date:   Mon, 21 Nov 2022 09:46:42 +0000
Message-ID: <SJ0PR03MB6253ED58BC0D35B188E08F4B8E0A9@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-418-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-418-uwe@kleine-koenig.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYldobGJtNWxjbWxjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTAyTldOaVlUTmxPUzAyT1RneExURXhaV1F0WWpjeE1pMWlZMll4?=
 =?utf-8?B?TnpGak5EYzJNVGxjWVcxbExYUmxjM1JjTmpWalltRXpaV0l0TmprNE1TMHhN?=
 =?utf-8?B?V1ZrTFdJM01USXRZbU5tTVRjeFl6UTNOakU1WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXlNVEE0SWlCMFBTSXhNek14TXpRNU56WXdNRGd3TlRneE16RWlJR2c5SW1n?=
 =?utf-8?B?NVFWTlFaM2xxYVhWdmFtdDNkMjVHTVRsQ1dVSTVhSFptWnowaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUVZRNVUwMXZhbll6V1VGalRsRkNPVzkyV2l0cU9I?=
 =?utf-8?B?Y3hRVWd5YVRsdU5sQjNSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-office365-filtering-correlation-id: 96ad571e-2606-4a5c-5b04-08dacba54b9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lROq8lgfCA2DAMtp9fNaAT9J4Z0ftAQZ6OnP3Jipx8ZO8Sn7WwYeM4V1WH715+IyZ3XsUp7SYePN2I+Mib86YkeKiF+6IageDDnxDgCwvvRI1k8Yx3ZcsGCWFrU5bbdRpqrKLvdenqyvc8K7dgMwA+xLCuBz9iauPeW4TsH7b/EtKpWHfTlhj9gNwQZvwnIf0wFe5HFw01mGn/yqs/py+B4ASGz+IrNhhs9aOMNtMtv/TQc3pV7ite2GWxmbJ7wS36OpExFmlsvMvTFOdrWpYMmriPZJlFC7CFgSdn80RePGuSZm5Ls1uoC8f6Hyupi9jqZ2rOEYYy0/L46iFzfLStxKye2bA6A1n6Ca7GjZzb2Ha8oyXB3wVKNoFE9K0LH0gwwbsHzXHXhrViiox4l4yJu19+HDa/ziPMWXM6CZ9l9yf2C7TeW98ffv97+lr0Q7PWoEGWUQdy5yygS8/nRNabmnmwMb96MxO0CIctTwX8aWz3Dz52OxJkIqGvf5sAOyEilPZBWSjgvYH+pwiFXuWhjf1BKw09OjNnWu9S5w0I/ahMLgFuOQQOhqjXfH+ZtpPlXmNGJRlO83XWbdrrldtW3Q8aNE3/LhRs6/+IPDZN1IxY4VweIWDin4RUH8YG4Px/4eEgDzhh6EcVfIXzo2XKrEwMe1ts7iQoLaU3BQPY0yINAMOZFnOpRgTJI/8enosxUr+IWx9YUO8Hsf+k7z8x2qD5nFTU/ke+AJCEHPUsw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199015)(6506007)(186003)(7696005)(9686003)(53546011)(110136005)(2906002)(478600001)(71200400001)(122000001)(38100700002)(38070700005)(55016003)(83380400001)(33656002)(86362001)(26005)(7416002)(8936002)(41300700001)(66946007)(76116006)(64756008)(66556008)(66446008)(8676002)(66476007)(52536014)(4326008)(5660300002)(316002)(54906003)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjJ0MG5hbGNoRnM4cDRMTURoU3dVb1Ywb3RqRzg5SU1WRTVUSFdHbUhtbElN?=
 =?utf-8?B?S1dUWVNtaFpiV3RKaXBGZ2VmRG9kS2VqdVRVRDFzR1FGb1l5SkphNnRvamdm?=
 =?utf-8?B?UUFuVUNmN3FNSjQ1b3NoblVpTEVJa1ErbkVuMmMrL1hjeGIwMjJibFFoZFlX?=
 =?utf-8?B?N0x0NUc2V0FqTCtHZjEyanNZV1g4d1h5aVZEUDVzWmo3TXBxcXlxV0Z3aVZS?=
 =?utf-8?B?blNkN3RSb200Y2pnOGZrd1RGdDVOelRJYnRBR3BPbUdpMkN1NTRSUFlwNWFQ?=
 =?utf-8?B?eGZlN2F5dTdqeWREWUZlN0FiNm9QQzhUc3lGNHU3b2V0R2JyejJxdzdNdnlR?=
 =?utf-8?B?RU1TVFl2UEYzSmhCSXp1Z2dLaFhpTm4vTG5DbzUzalBXb1hZKzFTN1Y3aVQv?=
 =?utf-8?B?SHRJa3A5STRwM0Foc1lvMWd0TDJLWHhxUjJyMXFpc3pra1VGdkUzWUJvSmkx?=
 =?utf-8?B?N1N4dTR5N1BmQVhKMHdHN2kzSDZsbm5ocSsyb2JjNCtrd09wUjJrbDRmNjRU?=
 =?utf-8?B?VS9vQXRFcTBLN0ZibzVodjROdVpSdEtjM2tGRFozazE1N1hZRnVHemVYTEpp?=
 =?utf-8?B?SlpkcDVjeHE4V1RNTm5WeHg2bkJReEVhNVpZQW9Nd2Z0Q3AvNXN5ZTRoTjRs?=
 =?utf-8?B?UlFNakVpVWxoWXVkMTlDdTY4L2hXOXByZWJUT29raWlNdUM2YkljclpadTM2?=
 =?utf-8?B?NGYyRlZXcUhzNEVrcmtXZjgzenVXRUFZSVY2aURVS1NtOTBVYTB2WGtlYm9k?=
 =?utf-8?B?RFRHNU5oSTIwSjdVUzI5cVM2UU5tQUMxdWxLYVgvQUk5Zjh0MWtmTCtCYVBW?=
 =?utf-8?B?Njd3dXRNcDl5c1JFM3pIQXdwb2FnZithMkNtZGs0K05CbmhCWk84SEl0bE1H?=
 =?utf-8?B?SHN3Zmg0bFp3Mmk5cDBZc1pmenFGNm9vSjllS3RHNW1ZUVU1aW91UlRDeWtr?=
 =?utf-8?B?SlQ3ZVd1SndPUGZnZEV4M0hkVXNCaWlBMnlRUk5vNEpWcU1JNGxqanJTclVt?=
 =?utf-8?B?VlU4UCtMMnFsTUplL2lYenZSYnhWZ0dIcVJSb0crT2Vyd3BibGhrcVExREVm?=
 =?utf-8?B?bEhKcSszekV3bStQQzJpa0Jla0JUcVJnbU9BZGtFSkNCaFRsSW9xaGdjZWtQ?=
 =?utf-8?B?eEY5UmlWSnIyT3FOT21HL0FlNjFkcjZ4M2ZaZEhEYU5BWmY4bXdzTkRqOWo3?=
 =?utf-8?B?eTlVOFdOdFUxdTUrditwYWtCV1NjT2pYRGNaNHhXczk2eWpDNGRLN0R6ZjFV?=
 =?utf-8?B?QjE0YUVmUTRYc1hqdGJLZFl2cGM5ZHRJM25oVFlvTG9WRVowY05aTHZ2M1Zt?=
 =?utf-8?B?RzlWSWVMUTVzbVR2UVJsNFlRT3NRbTF2ZmVLT2FGSEJydWtJcFZ6SmowOElQ?=
 =?utf-8?B?eTBrek0wUW9veHB5bzBzK2NCa0tIRGtvUENYR1JXVkJ2RHNzY2M3aHZ4RjJz?=
 =?utf-8?B?K0p1YU1rRTlrakNNcmVqWFNsN1FVNXc4MU95enBCbVZ2MXB2UFZzMXRua05C?=
 =?utf-8?B?Vy9aT0o5MCtHTi9tcm1RZW9BUkg5WmNiVVF0VnhWRUhsTXRrSFRrdnR2R1RE?=
 =?utf-8?B?M20yajFJMDgvTk5qWmtXcE1ybXBBbUVRRlk3elBTblpOMDZ0dkR0SDFuMlox?=
 =?utf-8?B?VzdzaWgxNitCbCtrS0JJR0cxVjNvRlVqVURSb2xZeUdFRmhnRVp4anpqMmVN?=
 =?utf-8?B?N3lOdC9KYkdrWm5QUytyL01sR1pOeHZlR2VoMGpiQzBkQVFCUHZaL2MrMVdv?=
 =?utf-8?B?YXdtS3JiUGZPeThrZWcwRUYwb2ZmUzBLdTlETERRMjkrbDd1K3o1T2N4WVZ5?=
 =?utf-8?B?bnBhS3k4QVNRWllzeFl3T29aNHE5ejhCalVWQkxGenk3R0xVN3ZLcFAwSHVW?=
 =?utf-8?B?T05ZWnBmK0duMkUzTmQ2NUR2a2pRaTQ4L2NpQTRIY2xPbnRiU0N4ajlMeXJJ?=
 =?utf-8?B?bUVlNDRnb1VXemxLbmhpN28xenovV2hrQnhuVjl5d0lVU1Bqa2V3bjRrYndE?=
 =?utf-8?B?NGxSVnA0anVQaGwrNlhsNVRtaHBuZkxYQ0tIekdkb29KWXdiSkxsK0kzMzNU?=
 =?utf-8?B?b1F6NWxRM0tFcW9KRDNGM091dGUzdVZNSFY4NnBab2l4UWZuN0xXZjY3Z2xQ?=
 =?utf-8?B?dWE3M1NueUl0N040WkJ0R2MvTk5udGxLZ3ZKbytla0lITHFTb3hMUlNLR1Z0?=
 =?utf-8?B?ZHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ad571e-2606-4a5c-5b04-08dacba54b9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 09:46:42.4236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TmY7FEF9Wuii1+LJPk9yFh3g5UEKeAGorGOih37qz6vIvDHdCMPwnv2WhnIon+wLQomqbOND70HDUdblulfTivqOVTrscu+lqaqcjVRvX/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5870
X-Proofpoint-GUID: Obqn0Qjgy5DemKbrxs8Yle_4RBp6QUEz
X-Proofpoint-ORIG-GUID: Obqn0Qjgy5DemKbrxs8Yle_4RBp6QUEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
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
IDIwMjIgMjM6NDMNCj4gVG86IEFuZ2VsIElnbGVzaWFzIDxhbmcuaWdsZXNpYXNnQGdtYWlsLmNv
bT47IExlZSBKb25lcw0KPiA8bGVlLmpvbmVzQGxpbmFyby5vcmc+OyBHcmFudCBMaWtlbHkgPGdy
YW50Lmxpa2VseUBsaW5hcm8ub3JnPjsgV29sZnJhbQ0KPiBTYW5nIDx3c2FAa2VybmVsLm9yZz47
IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IExl
ZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+DQo+IENjOiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3Jn
OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IFV3ZSBLbGVpbmUtS8O2bmlnDQo+IDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1
YmplY3Q6IFtQQVRDSCA0MTcvNjA2XSBtZmQ6IGFkcDU1MjA6IENvbnZlcnQgdG8gaTJjJ3MgLnBy
b2JlX25ldygpDQo+IA0KPiANCj4gRnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gDQo+IC5wcm9iZV9uZXcoKSBkb2Vzbid0IGdldCB0aGUg
aTJjX2RldmljZV9pZCAqIHBhcmFtZXRlciwgc28gZGV0ZXJtaW5lIHRoYXQNCj4gZXhwbGljaXRs
eSBpbiB0aGUgcHJvYmUgZnVuY3Rpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQpBY2tlZC1ieTogTWlj
aGFlbCBIZW5uZXJpY2ggPG1pY2hhZWwuaGVubmVyaWNoQGFuYWxvZy5jb20+DQoNCj4gLS0tDQo+
ICBkcml2ZXJzL21mZC9hZHA1NTIwLmMgfCA2ICsrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21mZC9hZHA1NTIwLmMgYi9kcml2ZXJzL21mZC9hZHA1NTIwLmMgaW5kZXgNCj4gODgyZWRkYzMy
ZjhlLi5jYjE2OGVmZGJhZmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWZkL2FkcDU1MjAuYw0K
PiArKysgYi9kcml2ZXJzL21mZC9hZHA1NTIwLmMNCj4gQEAgLTIwNCw5ICsyMDQsOSBAQCBzdGF0
aWMgaW50IGFkcDU1MjBfcmVtb3ZlX3N1YmRldnMoc3RydWN0DQo+IGFkcDU1MjBfY2hpcCAqY2hp
cCkNCj4gIAlyZXR1cm4gZGV2aWNlX2Zvcl9lYWNoX2NoaWxkKGNoaXAtPmRldiwgTlVMTCwgX19y
ZW1vdmVfc3ViZGV2KTsgIH0NCj4gDQo+IC1zdGF0aWMgaW50IGFkcDU1MjBfcHJvYmUoc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudCwNCj4gLQkJCQkJY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQg
KmlkKQ0KPiArc3RhdGljIGludCBhZHA1NTIwX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGll
bnQpDQo+ICB7DQo+ICsJY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkID0gaTJjX2NsaWVu
dF9nZXRfZGV2aWNlX2lkKGNsaWVudCk7DQo+ICAJc3RydWN0IGFkcDU1MjBfcGxhdGZvcm1fZGF0
YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKCZjbGllbnQtDQo+ID5kZXYpOw0KPiAgCXN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7DQo+ICAJc3RydWN0IGFkcDU1MjBfY2hpcCAqY2hpcDsN
Cj4gQEAgLTM0MCw3ICszNDAsNyBAQCBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgYWRwNTUyMF9k
cml2ZXIgPSB7DQo+ICAJCS5wbQkJCT0gcG1fc2xlZXBfcHRyKCZhZHA1NTIwX3BtKSwNCj4gIAkJ
LnN1cHByZXNzX2JpbmRfYXR0cnMJPSB0cnVlLA0KPiAgCX0sDQo+IC0JLnByb2JlCQk9IGFkcDU1
MjBfcHJvYmUsDQo+ICsJLnByb2JlX25ldwk9IGFkcDU1MjBfcHJvYmUsDQo+ICAJLmlkX3RhYmxl
CT0gYWRwNTUyMF9pZCwNCj4gIH07DQo+ICBidWlsdGluX2kyY19kcml2ZXIoYWRwNTUyMF9kcml2
ZXIpOw0KPiAtLQ0KPiAyLjM4LjENCg0K
