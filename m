Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E1A702CE4
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 14:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241986AbjEOMk7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 08:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241542AbjEOMja (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 08:39:30 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2040.outbound.protection.outlook.com [40.107.8.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1C81990;
        Mon, 15 May 2023 05:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j//EGd8nXOUtXyJKiqoHspJ+tw5UldRQbcDcXy4rhUgrtX+jwAUgrHNCBo72zM4MK4t6mCRwlZDQzKTYJpJLiC0zTRYNL+299+hK+fXbgavUmMZqkpmdiAk6oawKXIr1DLaFNaJAIaMuObFCa97v+Xm3MrLVVM7WATn6v30MsoqRUzWkORDU9Zodjd4Aa3HG7pImacrKljNap/chY35OW/xW7xQEWq8W+PtcRqEpE9ECmH7r4N344W2abhXTVTO4a6a3RQYT6CejhBy7HM6m73SVbNHFynBFQ19GGq3DqBpvcSd6ZGrgVOYKLWVzl7pGDsJv1hgyJOyOlo9NFbOvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6OAsvrf6OVHKqRXcLeAybidA67AMxUajFgFbeMazLc=;
 b=ErH7ngp8RbvfrKC1TTkceGqRYBNTffwOsDM0VbqAdnX97/EQWaa1qc1+grMjsiPhzpcxRj9Sgx79dfikX/XIsSTX3tMCkTTw5qkzdIOBkI+KHmf9Xn6hc/2ggtCW8NLAdXPOnjmOiht/KO8/15/zbF7m7LaQwd9gXYjCvaQwMYH6Y25sEvKkaStxQRVj0KQEnNWnqe7RTJfE65diDXIySK9VExdShSaebkB8I1jkEJXqEeeDqeSKHTLbo2CcHEM36ybqO8pIyow4+EW0RRP2cg/kvcQ81VUroa6iXUlad2bCJcaGXwYma8jltA4fhG9h1iLBN95qFSrkL9fu/UOPLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6OAsvrf6OVHKqRXcLeAybidA67AMxUajFgFbeMazLc=;
 b=Qwp0MC9Mz4u0veoU3SA+s5zo5k6WjHop/H+mUr7Y9vN7MqW5av12a+5Rpsd1MylqjYRwNfsZsq38fls6Camu4tYQyrSD+WiiOvJjV4wT9Whzm87X/s+xRfpYeFdU11fHJu2H40HcZw0/7Pxl7TvN/9o95hh8PL9A6RGzbEczCTF2M7nrRtgetSnxGSlQAd8LD98aaogE36IJNppspeVN8F2RMWJrQdnPC3hIX0HMFgjd5lQLR3eePlyL+L/V9s0fxVWqvWosHJ4Vm8mcgl6XMx4mPui3AR38wiHpgULc4e49JaYJFwZ/XobApTh4sBGFJHEKYnZsS2phtVj/h1GKSw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 12:37:17 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2324:90ea:1454:5027]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2324:90ea:1454:5027%6]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 12:37:17 +0000
From:   "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To:     "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>
CC:     "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>
Subject: Re: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Thread-Topic: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Thread-Index: AQHZU1FiB+tZxN7Xn0OaUbnFTWPYCq82CWmAgCVqjYCAADAcgIAACAQAgAABPQA=
Date:   Mon, 15 May 2023 12:37:17 +0000
Message-ID: <8ba04ce7b28d587e9713b35dd564c8158acb2eb5.camel@siemens.com>
References: <20230310130815.562418-1-alexander.sverdlin@siemens.com>
         <1933234.tdWV9SEqCh@steina-w>
         <e60c6055ad3902031e3bb632b7503ff68a9c215d.camel@siemens.com>
         <8299946.T7Z3S40VBb@steina-w>
In-Reply-To: <8299946.T7Z3S40VBb@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DU0PR10MB7076:EE_
x-ms-office365-filtering-correlation-id: dc03a877-cce6-49a9-feda-08db55411e31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VByvDBD5FmiZ9vMAnxf16ZYnAf58DwhjCfLnX5fGqy8Emr4sJ7pFbuhfKKKcJjjESVIyNh6sEoa2j3bA3ZDf+tvxUgRqY9MahsUcMs7E3kj574/RcFaSbOZtspMFS3zYg6XhmjKm+BdQhn4Mlg1AI1e/Dqm1nRchnQr+yNO/6BJg2aN20KfC//eCmB285qVTThNQWC21ih2+FCG+Gj5uT52ldW1EvC70aSV3VcmgrzBQ8YOd5YLoAGPCA+9Y2N+WQlFCspHa8M0r2f7IllVzeXWQ3LiURUSzz6+k1JglHupCUlc8DT3xYHgUvI8pkuf+OorKrbRUtrinRgTISRyULQUhzYZauOCJzW57uu5LTmy6RYeUQHZw8nsqSPl9HIJ2IA0xKXXqHdP6Y766apjR3blafbJ4n5N7SAZpfklS0X3p3lkcUYlkImU6uGPx3WyUl5v6uiWHgJHf6AKyGcc4P5/xed+ZKVJDBdJO4+lnoEbAUYuaNUnDw6YENyg1UsuxhFB4t6YOl8CAkCvcAdFj2UJWN904zJ9DTnS/Hb129SXPndmVXsoyrOHyT8zhiRvvVMdrwYrFYgpFI8nBIEqn47ATjyicvnRrJteVK1YplgggnFFUsyCHcjC3jxXsHPIaQxPgmDhF8RWa0785pEJ18A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(66446008)(64756008)(66946007)(66476007)(4326008)(6916009)(66556008)(478600001)(6486002)(76116006)(86362001)(91956017)(316002)(54906003)(36756003)(15974865002)(83380400001)(186003)(26005)(6512007)(2616005)(6506007)(55236004)(71200400001)(8936002)(5660300002)(8676002)(7416002)(2906002)(82960400001)(122000001)(41300700001)(38100700002)(38070700005)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUlDZ05mblhNMkkvRGNLWUU3bTVDL1hrNk9VSlJJRGsrZ0N1aUtFaGVhZ09m?=
 =?utf-8?B?a0taM2hyY203NFlnNDRwRlEya3EyQ0R6WEwybVRpTkxoMHBvU3g2K2RDc08y?=
 =?utf-8?B?ZnFEVFdqdHhjd3NUckNCVDVpcDVvbHAybllHblpJZ0pGckJuc2dDaHJLeDAy?=
 =?utf-8?B?NWlkTE5IQllIRmdhckRra1ZtWloyeDExSmRjaW95U054cVJSZzAwa1BuVlhF?=
 =?utf-8?B?K2pWaUlIVTBPbjVvOVhFUGQ0L3FEa2RFT2lXcndHeEVLOWJRWS9JaldYdGR6?=
 =?utf-8?B?dkVmVFFHcEUzN2M5L2p0RW90Zjk1TWh4SjAxRFZIU29xWUwwZTVNdk9SbzRr?=
 =?utf-8?B?bHdEMmliOStoazJWZFNKNitXNUY1djE0dXIxMkZLbXlBQUhwajZHTUd4eWVE?=
 =?utf-8?B?NTY4eWxQZVhJSERCV0N2YkhQaUtzajB0aytVbW9HTndPL21YOXdZV0pzSkhw?=
 =?utf-8?B?ZFJBSzZtSU8zMG5hMFhYdGVSVDhvQWYrREtxUXNoMjc2TlJTTWxVd3lFSGcw?=
 =?utf-8?B?ZFlsZjduRE9nMmVKL0pDcVJEcTZpREtDdDViMVlFK00yYWRVZFc1UW5UOTR3?=
 =?utf-8?B?dG1KZ1VEVXY4RTdpMG5hRnRldytISXJMTGY0RWp5MEVjS3ZzTEtON2hDN2JE?=
 =?utf-8?B?akx3RmpnZnc1czlMY3YrUjRrMUhoMGdSdWVWMm9JZWdUc0E2TzJ0OHBkZnJO?=
 =?utf-8?B?bEVnSklKbDZXNTg2RkFjLzcybVJxc2NtTXlXeXQveStTblVFRkUwSmJ1dC9v?=
 =?utf-8?B?VUxQdEYwRXFoRTJaaFQ2OWpqejNoYmxud3ZHOGhpdU1WRFpBRnBUVWdlUE44?=
 =?utf-8?B?VTBBbnRYU1VUbFpDdW05aVo3SERmcEdmWUxGUEFJR2tFekE0SDlWZHVoMHlN?=
 =?utf-8?B?ampobVpoOXhNMHhWNXdFdTNIb2pHSEYrcnV3ejBrS2xYcVRRRmRNdFR6OUsx?=
 =?utf-8?B?WHE3SVlGMmRjYVBJQnNoNzJYMWRyOTE2b2pLa3ZDbnRoSXhFbnpyUUhmb3pr?=
 =?utf-8?B?dzhJUkp5bVlRSU5lYndILzVtd1JTZzM2OFJOL3BlVEk1cVdiQnFSQ2dyYWJq?=
 =?utf-8?B?Y2Rpdm5iOW5PczVaVXJJMlZ5N1VEMjJIeE11STN0dWZXTkM4SU5LSWpKbUFB?=
 =?utf-8?B?dDJ0bW5NNmJrVHlGcjJaaFRnUWJoamRzYnQ0VTc3SnZhVEVNYnpSa0VaTmh2?=
 =?utf-8?B?cTVqMjNvU1BnU2NlRzk2VEFsRHA5bEEvTWhaSWpScDNqd2xaVjk3RGpObXRY?=
 =?utf-8?B?dVY1eEVOdTVXT1Q4WDBJMU1CU1NkTm1KNjBoRTk4bHJ3eW93QkU2K0ZnUnJQ?=
 =?utf-8?B?UlFkM3U2NnBNd0czMzYxdHNHVlFIYThMeThzQW5MYkxZSzM4Qksweld6RTVI?=
 =?utf-8?B?NnZxaUVFZ0hwRzN5MUswNUdYa1FnZlBSZEdTb2oySDlSRHNKQnZRalpoYTBa?=
 =?utf-8?B?SVhqZUJBMHVsczVmV3pSMkQxeHo3Z3EzNVhVUk1XbWV1eDFYK1pNMkdIUjNz?=
 =?utf-8?B?RUNBU0d3bEJudXk2blR1ZFJPRXN2eXJkam8xTWRneEVTWjUzYURvZjZKYVBw?=
 =?utf-8?B?b2FQZ2dHKzlpTXJId0xTN3MvNk9NZUJGZGw2Mnh5NmNJMS9RSmk4ZXBEM3F1?=
 =?utf-8?B?aC9EcWEvYzJYY3ZCTHpuWEZUcTNON2t5OXN2OU1Xa09SUlpXKyt2UmhGcUtx?=
 =?utf-8?B?dVYza2prT3NUZXJ1bURidi9TMnQ5a210Y1ppaWtMazFjSVdnWXdIcjRxM2FT?=
 =?utf-8?B?dnpNeCthZDg5akJ4N3NVdCtiZlltVzVBeXlkRklxeFQ1YlNkNEZuZUxzS292?=
 =?utf-8?B?NGxJdVBUcTlvTnBPbVNzYTkzTVI5aTh4R0ZMUkdldVVDdno0OXFTRzZHRjFY?=
 =?utf-8?B?SW1nNE1RTXRYUkxJZDNSelp1ZlkzRERnVkZ1VnhKRk5yTW9ndjBlUGMvVVBi?=
 =?utf-8?B?bGVFZzEzZ0pqN0twTThoa0VjRFVYTCtvQUlWL0p6bGRvb1d2YlZOeGtPdldW?=
 =?utf-8?B?SkN5d2NLaXVXek9EWFZGQ0JGNGNjbno4VE9uSzlZaTZqR2lZSXNBWkdhV3A1?=
 =?utf-8?B?TUQ1c3JYZktkQ0hUVDJpaEhnRDJ6cEdTRGI5cStzS1hQcnFVdHJKTVorbU9j?=
 =?utf-8?B?TElXQXhQRUJVekczNFFzSjdwMjU1b05FOUFYTW1iYTc5WUNJdmlvTHZXUTY2?=
 =?utf-8?Q?9TCFeHAyS3pBuZuKhyti2pU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68AF472E1807E3489E35B33E24CED3EE@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dc03a877-cce6-49a9-feda-08db55411e31
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 12:37:17.0529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LW9urk3toDzk+CYuFCdxqVoshpf/Uvs8ITClTHr9umlr2coyBzvqBvMfqYc95r2WbgkAIBw58u7+vqjjK+Cq+889KD24OBf9kYi+2pUeuB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7076
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8gQWxleGFuZGVyIQ0KDQpPbiBNb24sIDIwMjMtMDUtMTUgYXQgMTQ6MzIgKzAyMDAsIEFs
ZXhhbmRlciBTdGVpbiB3cm90ZToNCj4gPiBzdGFjayBiYWNrdHJhY2U6DQo+ID4gQ1BVOiAxIFBJ
RDogMjIzOCBDb21tOiB4eHh4eHh4IFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoMKgwqDCoCBPwqDC
oMKgwqAgDQo+ID4gNS4xNS43MStnaXQ4ZTQzYWVlICMxDQo+ID4gSGFyZHdhcmUgbmFtZTogU2ll
bWVucyBQWEM1LkUyNCAoRFQpDQo+ID4gQ2FsbCB0cmFjZToNCj4gPiDCoCBkdW1wX2JhY2t0cmFj
ZSsweDAvMHgxZDQNCj4gPiDCoCBzaG93X3N0YWNrKzB4MjAvMHgyYw0KPiA+IMKgIGR1bXBfc3Rh
Y2tfbHZsKzB4OGMvMHhiOA0KPiA+IMKgIGR1bXBfc3RhY2srMHgxOC8weDM0DQo+ID4gwqAgcHJp
bnRfY2lyY3VsYXJfYnVnKzB4MWY4LzB4MjAwDQo+ID4gwqAgY2hlY2tfbm9uY2lyY3VsYXIrMHgx
MzAvMHgxNDQNCj4gPiDCoCBfX2xvY2tfYWNxdWlyZSsweDEyYTQvMHgyMGEwDQo+ID4gwqAgbG9j
a19hY3F1aXJlLnBhcnQuMCsweGUwLzB4MjMwDQo+ID4gwqAgbG9ja19hY3F1aXJlKzB4NjgvMHg4
NA0KPiA+IMKgIF9fbXV0ZXhfbG9jaysweGE4LzB4NGQwDQo+ID4gwqAgbXV0ZXhfbG9ja19uZXN0
ZWQrMHg0OC8weDU0DQo+ID4gwqAgX19zZXR1cF9pcnErMHhiYy8weDhiYw0KPiA+IMKgIHJlcXVl
c3RfdGhyZWFkZWRfaXJxKzB4ZjQvMHgxYjQNCj4gPiDCoCBkZXZtX3JlcXVlc3RfdGhyZWFkZWRf
aXJxKzB4ODgvMHgxMDQNCj4gPiDCoCBscGkyY19ydW50aW1lX3Jlc3VtZSsweDcwLzB4ZTQNCj4g
DQo+IEl0IHNlZW1zIHlvdXIgKHBvc3NpYmxlKSBkZWFkbG9jayBpcyB0cmlnZ2VyZWQgYWxvbmcN
Cj4gZGV2bV9yZXF1ZXN0X2lycSgpIGR1cmluZyANCj4gcmVzdW1lLg0KDQpZb3UgYXJlIHJpZ2h0
ISBUaGFuayB5b3UgZm9yIGxvb2tpbmcgaW50byB0aGlzIQ0KDQo+IEFzIG1haW5saW5lIGp1c3Qg
ZW5hYmxlcyB0aGUgY2xvY2tzLCB0aGVyZSBpcyBub3RoaW5nIHdlIGNhbiBkbyBoZXJlLg0KPiBZ
b3VyIA0KPiBwYXRjaCBzdGlsbCBpcyBzZW5zaWJsZSwgY2FuIHlvdSBzZW5kIGEgbmV3IHZlcnNp
b24gd2l0aCB0aGUgcmV2aWV3DQo+IGFkZHJlc3NlZD8gDQoNClN1cmUsIEknbGwgZG8hDQoNCi0t
IA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==
