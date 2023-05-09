Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D847A6FBE52
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 06:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbjEIEnd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 00:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbjEIEnc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 00:43:32 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35037558D
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 21:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683607411; x=1715143411;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WP8TF74EVSJ32DfD6yWH2eEQZRowWMlUclyzhsxYeVQ=;
  b=AX7Deb74C7xEwUlWokea+bp85IdeGNADb1SeCON3IOOQWgnZOgPtFwvl
   XM5AHOhSz+K0S8CmNc/8CPjWD0QtZ5qbFn890PIjjDMSDeCpQiYdjwxbZ
   gwbISwTMfC2GFkCjQ5ooLoxRWVsMGGDa67vXaXsvFHP+m5aMS4s23fJp5
   3kpmRLTs46AmbERWKz0H7D/hPfZngfMyBb9omOxNkhI6PvOWm4Wx+F36c
   BcDiiF6yBPa5AAzC8wwcXCsoknTv+EbdIxjnMY89nImkcyJIndg0gwPFs
   WBQrIQKvNkXI2dhW98q2B9bL+EpnyWqS7ibYeXf/PogC3PSXMZuybSbQt
   w==;
X-IronPort-AV: E=Sophos;i="5.99,261,1677567600"; 
   d="scan'208";a="210285027"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 May 2023 21:43:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 8 May 2023 21:43:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 8 May 2023 21:43:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8KNJGPTEvcuk+eCWojS2FUKs7hqrzwoZFc/c0pQYXdZvG/+Ye3cXXm6B8BVrk5jb4P6TuNqRSyYv5wkfmQxPXNChf2W1XwiVHIeR+u7BMya/hUUQnhdKTeSqfT2t/INExn8tZJDs8NSR+Hs62ZBea0VXQZUwQAENPAWA1ka9VedsOf97b7aBBnNhyJ+VskqYuiPc0lrtRBBMV6MgaQFcKncWfjnYN7eFSoSbKRBeV/K9bRdumHd/DrU2f+qRJZcL9MqAkYCG9tLULPVF6jzjoatd1shksPc5y3iMP9RG6ijXud/JnWexoCqAuOmJTfJqnS/2kt0OIH3Q6Ti4VWciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP8TF74EVSJ32DfD6yWH2eEQZRowWMlUclyzhsxYeVQ=;
 b=d4Fa6IIuvMrHSF79bFtOisosgi2Gj959t5+EfNAWYfzqFE/wLv4zLO7U3iBWI4+1oQ92D1IvoR1by9sXjPMMi7ISJf0ajUcbMYKtH5xaxjJrBbdClA1RHpGo44lTRh/7Q+CaJpz71kDRqT6TkYmaMdKusStc0YFoveYEWRXhUIg4CL2ZvMFbLa4Vc/rAIw3rl2FGqrSho7mjVTAweRVDoONnrZkFVwe0DcbgL4b/PkqLKTg7dCXjAbf5HSfnbLjznszNHqmCpIo5nO4UbQ6lG4aEpm12fwtOl3oqTsonzixO7FtnbChKlhmeWgTWMPzN3h2fy5zRj5n9fS23QrvrOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP8TF74EVSJ32DfD6yWH2eEQZRowWMlUclyzhsxYeVQ=;
 b=h2AWxHAR9fs6qFEkWT5cFVJuuK9Wf6sXlrj0ENMVfXfOMk2OX9mv6EhJJFVb3HAsMjHykO5SR7xn/UpzNklOUquaek+ICYuwuyEXOAjP3XpmQSwURnZIiWt21KUtBdY+LKSwR9IwoYhAXOP4ZlmUXZl4wgr1nxjVNKIgeHb8/s4=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 04:42:59 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%2]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 04:42:59 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>,
        <codrin.ciubotariu@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH 04/89] i2c: at91-core: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 04/89] i2c: at91-core: Convert to platform remove
 callback returning void
Thread-Index: AQHZgjC7qun6XW0V/UqBNyu5BdO7Qg==
Date:   Tue, 9 May 2023 04:42:59 +0000
Message-ID: <b8b34f7c-0146-4d15-93c9-f7d9248fa13b@microchip.com>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-5-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|MN2PR11MB4664:EE_
x-ms-office365-filtering-correlation-id: 58993c89-5f77-406b-6ac5-08db5047dd9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XaRpEJKBsJyG7t6I7PP+BpHT13bbiCE1SdAlwFEHUmk76M+BsCxnSG0xKmJ15c0yhsTef9MbJLdM0r7z62VfyXUBS2zwBeec7/WQZpyoC7+I4M97H0fGF/OZyXWYj2sxgdUHaGYG24CflPlixLoZsiKOCZXWliYDSFvK7mZ+GlcCQZ/llcW9nAb55NO2tRBwd4DJkFEMfUnqM+Xog48u7IL46j8QIPpKdo6AtxWAbadP/4OI6ebdwplIdT5DvrbwFAfb0kRdpvhrhWk46MCQTb6x088J8YjRcu8CD5rtEZwy/VSNLOw2zVpCx/qCVtmYBX9BtfWMjFZhzYkKe3V8HmX+efIiYKzCSgO9uSaR8ZnFLlIhqwzv3j4duNXyyytx+CEuML9Q86qV4DLS0UQgknVOO76rhJuAU8bvnRvjPigMWeDGYPMS9RJpyQgO8CR0dz6apmIFmQpIEZoYLas/LknEHZznhoRvodEgqzS4feaSvPQxeLWlBLTmHpV52Hqg/twEZTjcupiTz+cgi7lvT5gDezUSh3flxYjJZTxvgFrlz/Gs46Ntof6sxDL9jRuMbfHtWsH2VGw3yC0a1PMr4D5klppIB1m9WupaYSCs+Mx+552djx1qHoFVHGVuoUlV1m3qpdwIoAxxg4ArozQAW/OCZwcHw/KxwcuEOAiXgIuNzql73KrRqGTZBjgFEBZY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199021)(2616005)(8936002)(8676002)(4326008)(38100700002)(83380400001)(31686004)(41300700001)(5660300002)(66946007)(66446008)(66556008)(66476007)(64756008)(76116006)(316002)(66574015)(91956017)(36756003)(478600001)(6486002)(186003)(71200400001)(6512007)(6506007)(86362001)(26005)(122000001)(53546011)(2906002)(31696002)(110136005)(54906003)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXpFVmVSNndHUjdiSFJWajVYbzMyZnNnd0FLV1Y5eGtaSWhMdnJ0cVV6bGlt?=
 =?utf-8?B?RkVHZEMxMTdUQzNyRHVtcXFjSDUwTUEwa0hJdWlFSG82RllnTzRQZ2Yxb1Iz?=
 =?utf-8?B?L25FSS9FdytWSUtZdDYzamJ2WnpYbzNDY25KOTR1WDZSTlk2ZEtFNTJ5clVz?=
 =?utf-8?B?KzNMUTZLNDViSk9GL3NoU0Z1MzlFTzBLUGRZWHZLWCtLU001SGYvWEY4MS9m?=
 =?utf-8?B?Ujg1QUhETWx1SGRqSk4rWEdrYkdUekpPN0RZZmdjbjNOSUpndmYrcjdlM0hN?=
 =?utf-8?B?WnF0REswOUNTams5L21maGYrSkEvUG9mdDJBTVR2dGRETklOenB3V3FlNEhJ?=
 =?utf-8?B?a1I3UVNUb3hJVkY3aG9XeThuZVdPZllOcDIyalNOTlNLMmp4MWpuVlQ2QjZV?=
 =?utf-8?B?ZXhUTmxQdXdYUTBzL1NkSVRWRHl2U1NPc1pmVFhsZUJWck9SQzJLWUk5akFZ?=
 =?utf-8?B?aHQzSDd3ZUFDKzVvckNDZVBSQmpMOTBzVGo3ZGw4ZE9vOHpJazh0QmhKUUoz?=
 =?utf-8?B?NVNrcnhlY2hKcW5PRFh0OFpaTVpobndZUzM5empRb1pHYytUNjUySUhqVkJR?=
 =?utf-8?B?eXNrVFR1Ym9PdUJpNk9xc3FPWFZQMVFBdTBoNEZYUXRtcjcxOVpDOVhwb29z?=
 =?utf-8?B?TUMwZ3NtY1NOc1pMV1hJT3RLQ01kTjFicDhSSnJkNkdkcHJVSHFhSzFZRzRU?=
 =?utf-8?B?cmRiZGRwUmxSQ0tQWFJycnlkNldQTEJjL1pzSmhBK2srbmJjazZNcWgyS0Qr?=
 =?utf-8?B?L2UrK1psWFIzUlpJRDhFQk5hOGI0OUNQdGxjdjdDNXBXWGdqV0dTR3ZJaEtZ?=
 =?utf-8?B?cWZ3aWp0NG5GcUhvMnFmSG50d0M0K3U1QWx2WE02VWd5QXJPUVhpYVArSGly?=
 =?utf-8?B?K2xtVzhMRUFrTkhPS2NmWlRMMGlNVU9RYTRQektkbitmYUlhUk9XdmF5K0ZO?=
 =?utf-8?B?Z3ZjTktFWnlEcTlXSkpLaENZY3E1SDllTVFYYnl3VmNyVEZFdTZYSWJXeGRq?=
 =?utf-8?B?VXBFRTdJR3JrUlBiQ2lXaUhjY2lSQ1hVL2NxeWhCSWFiZGhERmRMYkpRUzJY?=
 =?utf-8?B?bjVXUFFqUHZ0bm9EWjd5SHJLZWliNFA1MjlHUldyb3A0TTVTVWg3MVVYT3Z0?=
 =?utf-8?B?UHRaQmJxL2RPcnFMeC9PNWhONjQvdVo1RUduWEd4MktBYWdtUWZjODBkZWwr?=
 =?utf-8?B?Q2NuMVJ2Q1c1QXZsbGlpS0hJK2JaY1hzQ0NTSFVNQU4xbWZuMXM0VnlRVHho?=
 =?utf-8?B?aXNvVmdvL0RDVlNrT3ljTjQ2OFMvVzV1em4rMUNQckJFNDJwQXV4czFkN3Jv?=
 =?utf-8?B?azc5TS9kcUw1YUpheUpHNGl5bkJ0Uk1GZEVieG9KbVR5VzVudEt0MWN5dE83?=
 =?utf-8?B?S1lzV0RwY3BmSWExSXE5TFdRcE53YVVZaWRWcVdVQjlpNVJxWkhqUlpzMDdx?=
 =?utf-8?B?K1JnMUtIdSthWnU1SG5OZnljam51bGszSlpVSnBqUnZMQVZmbXAvKzdKVUE3?=
 =?utf-8?B?OG9sNXZROEdXU0VEMUVtOVJLQW42bGQ3dk1xUkpEQkV4TlBDTkVwT2NQOGYy?=
 =?utf-8?B?WWI1SlNUNVpOYjF5ejF0M3B2YThXVU82UXZsS243LzJPbkNQVDRSZlZ4UklB?=
 =?utf-8?B?eEQ5WjVPaC9hNEFvV3pFWFlJbVpGa0VqdnM5bVBCakdsTXB3VVRQZFB2Um13?=
 =?utf-8?B?MmhlUjlRZjgyU0VZR0h6RWhkQVhQMndaT2tHNm9JWWRHSHd3c05VbVRFS1Jw?=
 =?utf-8?B?SGxtdnV0WHVZMTA0RGxpYjZrTVNwTWlCc2ZHdlEyNkhpZUhJYVFpdnV4cm01?=
 =?utf-8?B?MmRjY2xnY3lKTWp6M3EvYzROcEJHcnVJb1g1cDFJZWlwSlNJTm1JVXpkc0VP?=
 =?utf-8?B?Y1lZMUZVZnkreG9ER3U4bXh2eXB4ck5oMDNHK0dnSDcrVkxQT1ZMOUZYUjgr?=
 =?utf-8?B?UkRLYUkxRzlvL1p1dEtYSzQ3WGRKbXkveTdsV2FhSnFEc0NjY1Y2K29QSWMx?=
 =?utf-8?B?NGtsZ0xKUEtzL0hhZGRTelBKcnBjTEJ2MTNOdjMyVUFFNW5USk5TdjF1NzdH?=
 =?utf-8?B?azBwZFBOM0U0dy8yeTl0R1lkeXg1R2NvR3ZRbHNNMEhYS2NzSXRrNFRQaGlB?=
 =?utf-8?B?S1FlUDJRdGgvaTBOUnVVL0prTWVhcElVUjhSSXBJZVNucmRGeGdFQzVCK0lP?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02ACD2C9DACC034082523794E5387A8D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58993c89-5f77-406b-6ac5-08db5047dd9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 04:42:59.3724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zDCHWV8Faaf45TsxH+6VyM0nHMEzW8l6MV3TnmmfohYlQU+z1NKLJWHxwdvTB4/GI17OcETTF7n3uMMZymGBOJFotasYuGzEg7y40LniAYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDguMDUuMjAyMyAyMzo1MSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBm
b3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMNCj4gbWFueSBk
cml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhh
bmRsaW5nIGJ5DQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1ZSBy
ZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkDQo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRz
IGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQ0KPiBxdWVzdCB0
byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVw
IG9mIHRoaXMNCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucw0KPiB2b2lkLg0KPiANCj4gVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQ0K
PiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlw
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLWNvcmUuYyB8
IDYgKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1jb3Jl
LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtY29yZS5jDQo+IGluZGV4IDJkZjlkZjU4
NTEzMS4uMDVhZDNiYzM1NzhhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LWF0OTEtY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1jb3JlLmMN
Cj4gQEAgLTI3Myw3ICsyNzMsNyBAQCBzdGF0aWMgaW50IGF0OTFfdHdpX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAt
c3RhdGljIGludCBhdDkxX3R3aV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gK3N0YXRpYyB2b2lkIGF0OTFfdHdpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBhdDkxX3R3aV9kZXYgKmRldiA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOw0KPiANCj4gQEAgLTI4Miw4ICsyODIsNiBAQCBzdGF0aWMgaW50
IGF0OTFfdHdpX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiANCj4gICAg
ICAgICBwbV9ydW50aW1lX2Rpc2FibGUoZGV2LT5kZXYpOw0KPiAgICAgICAgIHBtX3J1bnRpbWVf
c2V0X3N1c3BlbmRlZChkZXYtPmRldik7DQo+IC0NCj4gLSAgICAgICByZXR1cm4gMDsNCj4gIH0N
Cj4gDQo+ICBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGF0OTFfdHdpX3J1bnRpbWVfc3VzcGVu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+IEBAIC0zNDIsNyArMzQwLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkZXZfcG1fb3BzIF9fbWF5YmVfdW51c2VkIGF0OTFfdHdpX3BtID0gew0KPiANCj4g
IHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGF0OTFfdHdpX2RyaXZlciA9IHsNCj4gICAg
ICAgICAucHJvYmUgICAgICAgICAgPSBhdDkxX3R3aV9wcm9iZSwNCj4gLSAgICAgICAucmVtb3Zl
ICAgICAgICAgPSBhdDkxX3R3aV9yZW1vdmUsDQo+ICsgICAgICAgLnJlbW92ZV9uZXcgICAgID0g
YXQ5MV90d2lfcmVtb3ZlLA0KPiAgICAgICAgIC5pZF90YWJsZSAgICAgICA9IGF0OTFfdHdpX2Rl
dnR5cGVzLA0KPiAgICAgICAgIC5kcml2ZXIgICAgICAgICA9IHsNCj4gICAgICAgICAgICAgICAg
IC5uYW1lICAgPSAiYXQ5MV9pMmMiLA0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCg==
