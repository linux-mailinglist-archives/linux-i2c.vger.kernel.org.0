Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28710702DBC
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 15:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241411AbjEONNI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 09:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242315AbjEONMv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 09:12:51 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2057.outbound.protection.outlook.com [40.107.104.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A105110E;
        Mon, 15 May 2023 06:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kN8RVyXXS8BU/Tjpdybbb9TsE2cDpMLPC9xCG17HufszIEYJFWa4qKdK7moOjaU0cBTXJt5kP9oNVUgKE2lJR4c7d5j/Dme1jnBmhHh1Uf93nhKGBqz8UtA1bbrhuLLamDjzjt6KANV47gzdzDblp4GNnABaqyIs+UBlVLlpIezX3x2Om0xVeBpsj0WwQRZbVbOTpj4Sw35ss50Kc3MDHe9m6kBnSPeHZHm+qnGZNvX/20NfZHPWt9dqaxZ/GhYIfxYH4lyS9ehv/FsKyGjBjOPptTa6++KWJO1XkElb5xLqgh6ePw4cDCent68iaPFUqgfXDuo/M1l2xqQyQRol9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggeWfl2u9h5sAHvU9xpRf5d2/DSuOu5KAaRt2m0JsKc=;
 b=YOKUEzmgrEYtAXT+WRH1gIiRY5U4qXQGZL6hhn77E9dINykvJtLx2Mdsomb9yeF3U/ucyasQQxw/g3zxeMB8eswYyYwHL6qe38pf6dRyUwHQ6WFj2RkBQW4EzdqNxznKqxd8Bftphjivoko0O6hnNqBKBW5ZCmNva9hm4YxfxkDMVPUfNnTyWe9EyKqD32ncPibOQyG3Bk0WOB2Y+RA2/4gHBy9CFgsPT6o5B/XU9WkjeaI0x8mJzkvPujS6R/zz93Bb9RuObRvk6Mx0SjYkfYb57tnDemr1ewK3mK1Rl3WOtYkN4q6EO7y88KydB0mTRXaNHvxHig/GvNuMcgfS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggeWfl2u9h5sAHvU9xpRf5d2/DSuOu5KAaRt2m0JsKc=;
 b=UVMVrmzdeNwRx/f0s1KW0nWIRGAV2SdKELkhqfONzrmlMS1Go8UYX5RuxQPamwbd+DdhJAczLaYUrw5FZwkULQZtC3mHFwG1CKs4vGDv9S4uAF6mf2fA3wAQfdBGZn88tKXjvlvmIY7klfY0CX4C/06xdleRvKmJbCzSXSwTfDdd0kEC9a0J+5PuE9L5AFd6X4GRii+/i8Cjf6L29ofsR7jhwjDkYJRQDILkeGicKlgksoXTHtGg+i+7JnMVgucmeJjy1qcI0mVBA5hYsz5dyS7TQyI2ulZ1nKTSYCHYr3QtrfuoMY2PzKy5nfvy8cNvcAteJxuYUcEiePhXej5Dbw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV2PR10MB7512.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:d8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 13:11:33 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2324:90ea:1454:5027]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2324:90ea:1454:5027%6]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 13:11:33 +0000
From:   "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To:     "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>
Subject: Re: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Thread-Topic: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Thread-Index: AQHZU1FiB+tZxN7Xn0OaUbnFTWPYCq82CWmAgCWtfIA=
Date:   Mon, 15 May 2023 13:11:33 +0000
Message-ID: <40a2af076fb86301dd1ffac60488ae550a083be7.camel@siemens.com>
References: <20230310130815.562418-1-alexander.sverdlin@siemens.com>
         <9272339.EvYhyI6sBW@steina-w>
In-Reply-To: <9272339.EvYhyI6sBW@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV2PR10MB7512:EE_
x-ms-office365-filtering-correlation-id: 2370d659-82a8-47a3-85d0-08db5545e818
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WPX2gaSzuESr6CfBlxXjhEEF8KJAv5Blj9dgAbCtCnGPMQqY6FpWyXp4L40PmMAinvbUTaTouS87dfs/fioAd0GUZSLDy1mYMKd+vCIq+xmcSXUolKSmu+mOEaM0+uwaFu91yhUMTBiJth8Q0bPpIpFXS4SqDf4qWPbu/KszRkVUxI2ny7TwWJmutlNddSLXZsExaPFD7JgiYWbYS4DsuM8YzKEEm+aoGvzJyxQTZ6Wc1SgCX71w99rzSIlRv7LRdvY512QuR8XmGtBmj/MvgsZNaye1OWaUdis7/oWcIpeHgi5gtT7HZEaSEhSWrl7rwO3ZGtI0veDHveubjJ1u127P2lfL8svmKLX6L3IQWJglundL3jHucI5MmUTpRQLHZAJpkj41gOEBt/z5uPTEHhkvOAHJ6DipKXQ1vfSQq8dTmnjJWOyBRCg+hqvHmR62DakMUweNqBr14OizrAURHvf6LiMYAi1xaB+cejPZCiVndrCPqhrvalCcakM9LbbnW19z2xH8lsduIQqipCPsMbqfvgS+qd5YGRZ+kqR+3X8N3NUyZff5VvWYCNyWRc5h7lyNfblhm6TkEPoH4gUmyX8F051WS5wyULQuLTwevc1CMDNkcDZGzudBAplOwnDpsD7vzbAGfexNM8nei7BlCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(15974865002)(110136005)(86362001)(54906003)(478600001)(55236004)(36756003)(186003)(6512007)(6486002)(6506007)(26005)(71200400001)(122000001)(316002)(38100700002)(41300700001)(66556008)(66476007)(66946007)(66446008)(76116006)(91956017)(64756008)(4326008)(82960400001)(7416002)(5660300002)(38070700005)(8936002)(83380400001)(2906002)(8676002)(2616005)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWh2UnFEVGtPL3lUejFRR0MvZm9hMkVGRU9GVkM0TTQ5REFCZUZIK1Q5TVdO?=
 =?utf-8?B?YzcrSVlCUWpXTTdHNU5COVlERElobTdMQVhjQ255Mm5LMVNoOTgzYjhEM0Zu?=
 =?utf-8?B?dngzN1V5ZXc0Wng5YmNOaTNuS3BGTWdsbmZvbEFZMUwraFpDRjlNaDRqY0o0?=
 =?utf-8?B?WmoyRmFiS2NCUWpyT0JaeVpvbnJMRFcyaWVBeE54cjdWNndOaVdnYlVpYnp0?=
 =?utf-8?B?dzg3UzcxclF4T2VwOVFtc3F2NTFyZG52M2wranNUU3doSUtpOGhrYjNLa1lB?=
 =?utf-8?B?aUp4ZFVSWWxPQ0d3KzFEUUJDMDMxemFOeVZJOVJOa3ZDaWRmcENUd0pMU3hF?=
 =?utf-8?B?RmRTRnkwcHRFMmFINit3WmtkZk9iZG9JSVZWRFZ4NWwrRlZrRlVZbVhPN0tG?=
 =?utf-8?B?ZXRLRnJpdDRXY1NqMlpacUdrTjMxK1l1N3RxeW5UNFZsZmJKb0taWktaVW5P?=
 =?utf-8?B?MXpvTjIyOHlvSFM2eW9IVkN1VkdCYnRraXVsVUFzNGN2eHYzZnY3VkRzTHdh?=
 =?utf-8?B?UFBIb2Ztb2UvS3JmZGNNbUtiL3E5bzVNeEFTQkxXMjlrY3RCWnhjTXlyby9E?=
 =?utf-8?B?M2JjYkpoaHdGWGI3QXQyc2JGaWRWZXRIeDdQelZqTTMzcnB5VXNxU2hUbC9X?=
 =?utf-8?B?NndaU2dYVDNCNzE4UytmWVdHSFNMNUJNODlpZ0dVK1ZyeXJreElWMXlzM25u?=
 =?utf-8?B?T2tIajZmVTVMbGZERGxobG1rNVQ2NWJIQnRKaDZRZmtycmlCYjdxNm9iVWhk?=
 =?utf-8?B?OTVFZDdQelZyNDhPMS9rVGgxSGU5aFhmUFIrcCtEYWtoMzd2aDR4Nkh1cWdR?=
 =?utf-8?B?ZVIzOGxOZnpxV3J2KzV1SEFFRG1KMHpyWEx5VjF5QUpqcXFIaG1PVXVwcEpo?=
 =?utf-8?B?a1hvdEVPZ2JFTG83UktxaWMvTFRNcXQ0OGVPU3dTV3BmSHV5V1hLZUlWZWVQ?=
 =?utf-8?B?OEsxaWJtWDg0YXFFWjB2SW51YmpJaEdaVW9DTXJXVnYyWlFUQlB3NXcra0tn?=
 =?utf-8?B?bDZybXpCTmlleVJGWVFRWHZBd1pUc3ZQVWRoRWdUVldtMDBWWnJ3RjZFdFBE?=
 =?utf-8?B?UzUxK2J3SE9Ta1BKMnM0cXFnOUtYNTVsdVNnWjJoZXlkdnIyK2k1MUg5dDla?=
 =?utf-8?B?VUNWMHhubVN1dTA4TTN4dzBzdlpWTFJFZG5CYU1EMXVydnFSYmQzRlZTQVZa?=
 =?utf-8?B?OHlnOWRDWStTalorYTVRb01VL0xTQkhtenA5TWUySkZPU3NPenhqNEgrOFY5?=
 =?utf-8?B?bVo2Tzh4c3BQQlpaNEtINjJsc0kyNUh1K0Y3M3M5bzRKazNDb1JBaWFlamRr?=
 =?utf-8?B?NGc1R3M2eWFUNEUzQ2dMNUIyV2pOcmJXS3FucnRRTE0wRGZRVkR0MUJxcFcy?=
 =?utf-8?B?RFFxYkVyY2dwMVMzaDVNWlNyTEhvT2ZFZittMFJmcW53TVV2N0IvSnBqY0x3?=
 =?utf-8?B?TnF4bG1wNDltekVuZEpuTTBoOUJiM3FvaTIzaHVVYzZUdll3TDlCZkJZVDJp?=
 =?utf-8?B?U25hUnoxZjRLYk5PbEtEbmhVemVIUjBFWCs3eUYwVGFmM3IrckhiVnQ2VnJK?=
 =?utf-8?B?RWdTNzB3aVRVeFJZd0lYaHg3dEM1WWV0OU5VNEs4aTUvelFMNHMxSFJQenR2?=
 =?utf-8?B?K2cydGJaeTRQWThwcXFyZW5raUtoSWFmakxobDRycXFHbGFzNHY5WmNITEw4?=
 =?utf-8?B?b0NEcDdpdXlwK1VmeDRQTGFpUFMrMnd1VWc3dDMvY1B1ZXVybUVZVFlMTmFy?=
 =?utf-8?B?TTE2M0ZlazhJY0tpZmFkK2hGdzBGbTZXb2w1VmxLTWNOYUsyeE9nOUw4L1dL?=
 =?utf-8?B?NDU0UFF5Z2JOYnlUWGx0N3ByT1MzK29Rb1kxKzNWTytrUUpVd1ZoVU1mRzZu?=
 =?utf-8?B?a25vSjRPRWNMdDUzdS9GdC9UWUcyMlM5a1dyWHhQcFY3bGJDK2RkWXN1R1pE?=
 =?utf-8?B?V1hseWZPRkNyNkpYQ0dLQ1ZHcGxwSGlKZU9IczRNN0lZQXRiNzV5cW5BTnBi?=
 =?utf-8?B?MXZDNG90d3dUd0hoeCtONVB5bzVSS2VuZ1Z1RUkyVHZPZG1Vd25SdGZ2NDhm?=
 =?utf-8?B?QzFuQ0piNzBhOXJjck5xRkZjQTBuUjF1R20yemxEa2dkb01ZVlY2UUFFbWZr?=
 =?utf-8?B?dWJSbjVQWWdxMmtlaWlNajZSSXVHMGFaY2UrWG9GcDVZTXhXaThEMGhvRUJS?=
 =?utf-8?Q?5Qg8xn6lEHzAp2T2UNUCes8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <807B3F5FA2EED8418FE9A21B67B02E7B@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2370d659-82a8-47a3-85d0-08db5545e818
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 13:11:33.7803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U4oD8cU9nQXJFO1HjGWOVHmxhVny3V1TMa44MiU/g9ZEtwMJP+9XSDcYg8S8EzggNJCWhTM2RP0ngdAJiR1LgnlS0krtJ+2gfN3uAQSXoWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7512
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gQWxleGFuZGVyLAoKT24gRnJpLCAyMDIzLTA0LTIxIGF0IDE1OjQ4ICswMjAwLCBBbGV4
YW5kZXIgU3RlaW4gd3JvdGU6Cj4gPiArwqDCoMKgwqDCoMKgwqBscGkyY19pbXgtPmNsa19jaGFu
Z2VfbmIubm90aWZpZXJfY2FsbCA9Cj4gPiBscGkyY19pbXhfY2xrX2NoYW5nZV9jYjsKPiA+ICvC
oMKgwqDCoMKgwqDCoHJldCA9IGRldm1fY2xrX25vdGlmaWVyX3JlZ2lzdGVyKCZwZGV2LT5kZXYs
IGxwaTJjX2lteC0KPiA+ID5jbGtzWzBdLmNsaywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
JmxwaTJjX2lteC0KPiA+ID5jbGtfY2hhbmdlX25iKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChy
ZXQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGRldl9lcnJfcHJv
YmUoJnBkZXYtPmRldiwgcmV0LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImNhbid0IHJlZ2lzdGVyIHBl
cmlwaGVyYWwKPiA+IGNsb2NrIAo+IG5vdGlmaWVyXG4iKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGxw
aTJjX2lteC0+cmF0ZV9wZXIgPSBjbGtfZ2V0X3JhdGUobHBpMmNfaW14LT5jbGtzWzBdLmNsayk7
Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIWxwaTJjX2lteC0+cmF0ZV9wZXIpIHsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKCZwZGV2LT5kZXYsICJjYW4ndCBnZXQg
STJDIHBlcmlwaGVyYWwgY2xvY2sKPiByYXRlXG4iKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ICsKPiAK
PiBJIHdvdWxkIHN3aXRjaCB0aGUgb3JkZXIgb2YgdGhlIGNhbGxzIHRvIGRldm1fY2xrX25vdGlm
aWVyX3JlZ2lzdGVyKCkKPiBhbmQgCj4gY2xrX2dldF9yYXRlKCkuIEFGQUlDUyB0aGlzIGxvb2tz
IGxpa2UgYSBwb3NzaWJsZSBsb3N0IHVwZGF0ZS4gVGhlCj4gbm90aWZpZXIgCj4gbWlnaHQgY2hh
bmdlIHJhdGVfcGVyIGJlZm9yZSB0aGUgKG9sZCkgdmFsdWUgZnJvbSBjbGtfZ2V0X3JhdGUgaXMK
PiBhY3R1YWxseSAKPiBhc3NpZ25lZC4KCmp1c3Qgc3dhcHBpbmcgd291bGQgbm90IGJlIGVub3Vn
aCBJIGJlbGlldmUsIGluIHRoZSBjYXNlIHVwZGF0ZSBldmVudApoYXBwZW5zIGJldHdlZW4gY2xr
X2dldF9yYXRlKCkgYW5kIGRldm1fY2xrX25vdGlmaWVyX3JlZ2lzdGVyKCkuIEknbGwKdGhpbmsg
YWJvdXQgaXQuLi4KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4KU2llbWVucyBBRwp3d3cuc2llbWVu
cy5jb20K
