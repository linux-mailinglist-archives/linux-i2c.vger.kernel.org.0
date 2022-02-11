Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2A34B2137
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 10:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235458AbiBKJLZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 04:11:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiBKJLZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 04:11:25 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4851020;
        Fri, 11 Feb 2022 01:11:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFW0mSoakIoao9kcMLCYXixQKOkpnmsto1AKqghzZPUuZ2LB7N0aCCAM81XJi7BBoSI4qR8Jop4dgukm9/v162zdZKteVoQcchoyYi/gidNtD0m35lPpHjn4kKE7YtOoC5q9MW5fuO0S0QUODQEcrCL5eJhRxYBUNAJuZ9QBcsBWaQTePVfvPyLvUJFerOTezcED4Q1nB3GX6OrD2Zqfhvy0VEnlDeSdFrM0bP0UHtrjz4ae3KQ134hHyi6BaH9joXPkYZXca4hGrL1Gcfl+ArB4trb7z+AIOQ33L29z39ZKDPnHAinF7HnlupaIVGQHNg5FWWBwignHVuRSkrVa9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzgNYxwP4OQ/k2ZE6i76k7EnUA3nicTOLkhnDbf9wpM=;
 b=WKwKiRXGJg2ulH4cgNdkDK2k1yiRF8qK0UviATOSk6FNmVVDkguqrPf5pphwc+ZGhAVzVjzFNtHDlw0pvZdB/v4ru1L9D1TNUD5wr9d5X8cp1w87tOs2jbXa/teRSlUh+w2TmvqBvuCvqfPKGUanKaxNUWW1RFbmUzljaA7JvchA+9dqI8vR324l7YTQv5v+T44P9vp5h04l9RQNFVQD+vLsats58tqSLV7olpQJQ6LsXK+ze80h+CVJ94uLwiA0XrT0HcNCajv1qzpQRoUdyLDzdPj+zWNolynSVL0MJ07M69gwaImM2MpmmoHd4NG5Eq+c5muDtpjNeakys9mkCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzgNYxwP4OQ/k2ZE6i76k7EnUA3nicTOLkhnDbf9wpM=;
 b=Znxnq4IdrGEVtZf2aw1grUzH4F0It06ti3l0QbZ6jr8e2fvdt3d6ohlN0Kwil0Bi/2UHEq8qOT1Hpz+3mu/ch0TGPd8UKeVHLpir97jAtaog4CIXstGTHUa2J35r/oB+8pX7mjhpQ76tTkG6df4OaYcyxuXg4dqd79UXsmV+kWfW8H5dsBcj0AGtivO/LZQa8GXiJmacK9HVIXUDd7fzvD0tNWBaeFZRt8toxTFrhroPCR/ycGLyz4s93uwgTGG2lXOkEABtQiZ+v1WOeVA2q6k/IbC20ETBekp+PCuYv88TKe9o1cWBfH9eIuWYSsEClKxkk36nozMIY0MAoR80jA==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by MWHPR12MB1870.namprd12.prod.outlook.com (2603:10b6:300:10a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 11 Feb
 2022 09:11:21 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::94d8:5850:e33d:b133]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::94d8:5850:e33d:b133%4]) with mapi id 15.20.4951.021; Fri, 11 Feb 2022
 09:11:21 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Subject: RE: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Thread-Topic: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Thread-Index: AQHYHpP+iBNzHq+ctEuAu+zpK3JSjayNO4IAgADToJA=
Date:   Fri, 11 Feb 2022 09:11:21 +0000
Message-ID: <DM5PR12MB18502CF86E602F7071A1EA58C0309@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <20220210153603.61894-1-akhilrajeev@nvidia.com>
 <ae6d300f-962d-9731-bb78-3594b4c31aea@gmail.com>
In-Reply-To: <ae6d300f-962d-9731-bb78-3594b4c31aea@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cbb2167-30e7-4297-35f1-08d9ed3e7884
x-ms-traffictypediagnostic: MWHPR12MB1870:EE_
x-microsoft-antispam-prvs: <MWHPR12MB187096F2474E10BF51B4D6DEC0309@MWHPR12MB1870.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wb3cK/pWn71oUDj9++cVOgvdqIT4HTgZC8IpHUIDyaxh9o8i7/C9lcI+5J9DD5rDRHq0WHlJuCmOSAIBmbtQumRGk2ZzchQ2Cy3QVEV7RP5xTuMQWVZGV8thQAhD51LZ1HaPEnJPlhxtt7Alyd24/GMPlF+3C24QcLiuQADexaICiTf09bXUaC4hMg5HxJSoarVwM/IlmbYxM4r08bF5pE07qXHV0d3OqqbAIQS2uOIguEwPY9anSf/6jPEEdkQiTJxZG8NYdSB1N4t6mvVfF+h9QrzSuufbz8T+q7Z93aszgDnNAIyAjbLxCvZlrN5EgG2LjxhjIIV03D3Hyt5mVKUNU9oiuRVMxifjM5o18a3XB6UyjLAG4ow3qTGhsjVmkcGjxEU8md9jebhbuxLlUvHzHd1JpkwfrRUdufB9nzjQ9bNw82fpSL3OMdk8ipWitJkMDT8FaZsuwGLtdXTyt+BqMB8u/deWR0nc+WJV33nDeD3WDa19l+0hplMZGoNfC2+bLvNf/TMvyIvhxsxqsS1u9lvQ+wmffj/ohMmALN9pz+PncmYLC7P3joyjToVIhADKFuKK3UxspbyzCbLb/hQB8bF7MVBonCBpUMTAfam6D0shVoEi9PiwvdUN8vGjlxnAhj47YiwY/MApr2XjMRAVYFXvDeb6qiQ30Pki0VL8NaeWYBF5EXAuDMiSwRyYwTXbc1TfQunTomSvmOzzT1SemFm3DeVXgf9yRdnYPZ8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(110136005)(921005)(38100700002)(2906002)(66946007)(66446008)(8676002)(26005)(186003)(76116006)(64756008)(66476007)(66556008)(122000001)(8936002)(55016003)(52536014)(86362001)(5660300002)(316002)(83380400001)(508600001)(7696005)(9686003)(38070700005)(33656002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3JvUUs4czF0d1VaQ0hHKzNBTk9ydDAzdXFEcHJOc2VRTVZSdVUrYkRDOTZq?=
 =?utf-8?B?YTMrOW9lN1RBUCt2QzN3TEJCM2E2Y1JlK2JTQTBrRnRLeGQ4N2p1SmR1TXRh?=
 =?utf-8?B?aTZMSGM2aklhR25CVVZJZ1JPcXBqQW1ManBmL3U3TWJsT0tuR3hMSFFrSEpG?=
 =?utf-8?B?ajZaTGR0ckt2Q2tiZGUvbUpuZ0VFV0NEMXVJQWMrWFdpbkIrOVM3YmsrVkhM?=
 =?utf-8?B?Q3d5WHdaRjNIQ1RPN3lwK2E1TWQ3TjVjZkZBU3ZuQisvM2laNTRkZDBNUnhl?=
 =?utf-8?B?QnlyRzI4NXdpNHJNQUltRHdQT2JHajlEYlBTTzRBVHJXN09oV01PNGFxeUg0?=
 =?utf-8?B?eldXbnk5NTRxS3RPNzQyMzBzeDFOUm80bVpWNUlETGE4WWg5V3YyOWhLbm15?=
 =?utf-8?B?b05iVUNJbHlnRU9URDhzWHU1RTZRRWNwQmlhTmZpRGpFMS9FVXAxazF3WndN?=
 =?utf-8?B?ek9obkovcDJrekhTTU5BNXdYbUJxY1JyQ2N0dG8rbmd0Z3ZYaWRhajV1c3Mz?=
 =?utf-8?B?UXk3aTdrcU1Ydi8xQlUvQ0l6MC9uVTBoRmdDa090TnJxK3NNa1htUW9obUtn?=
 =?utf-8?B?ZVZQQlNoam5aeDhpdDRPZlplRGJFUnJrWWxRRUtmWHNkYUhrU1YwMGhqM3FT?=
 =?utf-8?B?dEVNeDZUbENqZi9WT0dUNnhJVU94MUhyejFKWVdmRXhPTUdIREhzNU1ZeGhr?=
 =?utf-8?B?R0NRRXkxQ1pEckMzMGJjdnRCQlJmWkZrMTdiS3RkZkRLTm4zaG91dVcxVU5M?=
 =?utf-8?B?WjBFWGZ0ZmdRU3RTamZ2NXQzZm1vM21XaUNMUUFmOFhsdXJnMjYrOFVXYlN6?=
 =?utf-8?B?Nm5xbFBKZmEwckVLV3JsbUJqLzVrK1k2M2IyTXZRU3RVTjk2ZUs5aDNjbmhh?=
 =?utf-8?B?c1FWT3FFSG9YRzlsdUI4T0Y3c3pOb242dXMrZ0NqRGtwZ2VhVXZTVmUzVnpu?=
 =?utf-8?B?MFFVWmE4aUtENkdBZUt3NkVIbEVuak95VkFwcW1DUWxzNnhGeGwvVGVSb2lJ?=
 =?utf-8?B?MzJjQlJBNFpGWXdZeXgwSEtTSGQ4Tzg3SXhPRTUwMk5tTXBpZnFGdytUSE01?=
 =?utf-8?B?Zmh6cUxtTkY3UWRCRWJCTXA5NVBLZEdjKzc2WXRMSzZBNy8rZXZxQ1c2eUQ3?=
 =?utf-8?B?cXo4NkRmQnBwb3YzNlN2K0puSGQyNmE5a1JJYVprU0dFaVRVYWI5bnp4bURB?=
 =?utf-8?B?dStPM0dhSk0yV0VZZGNZOXJUeW5pR1l5OUdZUWtldFo1bWtVMVl1NDF1MzBJ?=
 =?utf-8?B?V2tBWkFHTGRuV0htYlBENFdKdEpnQXBRaUlONHhxbTZ5NDNVRFJ6ZDVJaDVH?=
 =?utf-8?B?Vmc2bEhXMUw2YmZVai9BL3JzcEdMNXNydGVzWTlDS3YvYXFNalVJc1dEWFpr?=
 =?utf-8?B?VEhhU3NaSzdzRVc5T1JxR0JQbDVlZ3VEV0MveTBxeGtXMWFCbHRJcUVPSnNp?=
 =?utf-8?B?S3pzNjQzeFpvcHdrVEVyUXp3bGNOaDU3KzAxWksxakluM0UranBZcTZ6QkNi?=
 =?utf-8?B?MHpUc0U1ZFVadzNITU1UWEx6endXOWpuTkpYTXRQbFA2MGZoVmY3SE56V0NT?=
 =?utf-8?B?bDV2bWVqMHVRUFJFMWNMdm9obVRBWkE4Yno3N3hoZ0tqaFpZeEl4L1dZaWxX?=
 =?utf-8?B?ZjQxdTBTcGUvSmhKb3Z6UHpoc0hOdkh3TG5iNTBkTlRSZStTT2R3VHBBRERC?=
 =?utf-8?B?NkRjM2dJNXdVS2l4QmJQcFdLRjNzaHdYb1dxa0dkdWxoUHZKWkRqRUZJSzZI?=
 =?utf-8?B?SnZoaFFmamFxUmx5SE9PdWdNek5sZFZDQXJuN2UxeS9xSUpGN3R2T1l5Tk9T?=
 =?utf-8?B?Um9BY1pxL1BoMkRwZU95QmY4ZlJ3ckI2MEhWZjd0T1BwTUYzaHRJMWVwSHNV?=
 =?utf-8?B?NVdPbDIvWDVQRnlzN3lRZGZmTXQyOHZNSUtVcDNBTmw4eEdKZXNINDA4Ymgy?=
 =?utf-8?B?ZTB2YTdvZGovand4RENwalRuY3hMTzB3MUduRTArWjlhN0p2VHlJNUpjUm04?=
 =?utf-8?B?bVhqNjJtUUl3QmN6dFVUU2pmbEJKazhLK3hQWFE4dXUrZVlBVWFXNTFYc3pP?=
 =?utf-8?B?Tnk1K2ZFSXd1d3FrbVY2dUNHQVRSSFpkQ2Q3SzVBZXNkM004eDVndjdzYWsy?=
 =?utf-8?B?TGtWK2xseHl0NnNFYnN5RzQ2ZnFvY3l4bERuQzR3ZTRrL0N5dkM2bCtvbTdh?=
 =?utf-8?Q?zOI04LANAaT2Wc9QdC+jGHg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbb2167-30e7-4297-35f1-08d9ed3e7884
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 09:11:21.3915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxJIFs/g0UJojZ7Jabmudad2zYd6v49fZkCB1dMO8ReRpnyYKVJJBM+zQEXLzHvwDnmMJtGaba9sc1x6A0KLeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1870
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAxMC4wMi4yMDIyIDE4OjM2LCBBa2hpbCBSINC/0LjRiNC10YI6DQo+ID4gRW11bGF0ZSBTTUJ1
cyBibG9jayByZWFkIHVzaW5nIENvbnRpbnVlWGZlciB0byByZWFkIHRoZSBsZW5ndGggYnl0ZQ0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQWtoaWwgUiA8YWtoaWxyYWplZXZAbnZpZGlhLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jIHwgMTggKysrKysr
KysrKysrKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
dGVncmEuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0KPiA+IGluZGV4IDAzY2Vh
MTAyYWI3Ni4uMjk0MWU0MmFhNmEwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtdGVncmEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0K
PiA+IEBAIC0xMjMzLDYgKzEyMzMsMTEgQEAgc3RhdGljIGludCB0ZWdyYV9pMmNfeGZlcl9tc2co
c3RydWN0IHRlZ3JhX2kyY19kZXYNCj4gKmkyY19kZXYsDQo+ID4gICAgICAgICAgICAgICByZXR1
cm4gZXJyOw0KPiA+DQo+ID4gICAgICAgaTJjX2Rldi0+bXNnX2J1ZiA9IG1zZy0+YnVmOw0KPiA+
ICsNCj4gPiArICAgICAvKiBUaGUgY29uZGl0aW9uIHRydWUgaW1wbGllcyBzbWJ1cyBibG9jayBy
ZWFkIGFuZCBsZW4gaXMgYWxyZWFkeSByZWFkICovDQo+ID4gKyAgICAgaWYgKG1zZy0+ZmxhZ3Mg
JiBJMkNfTV9SRUNWX0xFTiAmJiBlbmRfc3RhdGUgIT0NCj4gTVNHX0VORF9DT05USU5VRSkNCj4g
PiArICAgICAgICAgICAgIGkyY19kZXYtPm1zZ19idWYgPSBtc2ctPmJ1ZiArIDE7DQo+ID4gKw0K
PiA+ICAgICAgIGkyY19kZXYtPm1zZ19idWZfcmVtYWluaW5nID0gbXNnLT5sZW47DQo+ID4gICAg
ICAgaTJjX2Rldi0+bXNnX2VyciA9IEkyQ19FUlJfTk9ORTsNCj4gPiAgICAgICBpMmNfZGV2LT5t
c2dfcmVhZCA9ICEhKG1zZy0+ZmxhZ3MgJiBJMkNfTV9SRCk7DQo+ID4gQEAgLTEzODksNiArMTM5
NCwxNSBAQCBzdGF0aWMgaW50IHRlZ3JhX2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRh
cCwNCj4gc3RydWN0IGkyY19tc2cgbXNnc1tdLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBl
bHNlDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5kX3R5cGUgPSBNU0dfRU5E
X1JFUEVBVF9TVEFSVDsNCj4gPiAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAgICAgICAgIC8q
IElmIE1fUkVDVl9MRU4gdXNlIENvbnRpbnVlWGZlciB0byByZWFkIHRoZSBmaXJzdCBieXRlICov
DQo+ID4gKyAgICAgICAgICAgICBpZiAobXNnc1tpXS5mbGFncyAmIEkyQ19NX1JFQ1ZfTEVOKSB7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldCA9IHRlZ3JhX2kyY194ZmVyX21zZyhpMmNf
ZGV2LCAmbXNnc1tpXSwNCj4gTVNHX0VORF9DT05USU5VRSk7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIC8qIFNldCB0aGUgcmVhZCBieXRlIGFzIG1zZyBs
ZW4gKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgbXNnc1tpXS5sZW4gPSBtc2dzW2ldLmJ1
ZlswXTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgZGV2X2RiZyhpMmNfZGV2LT5kZXYsICJy
ZWFkaW5nICVkIGJ5dGVzXG4iLCBtc2dzW2ldLmxlbik7DQo+ID4gKyAgICAgICAgICAgICB9DQo+
ID4gICAgICAgICAgICAgICByZXQgPSB0ZWdyYV9pMmNfeGZlcl9tc2coaTJjX2RldiwgJm1zZ3Nb
aV0sIGVuZF90eXBlKTsNCj4gPiAgICAgICAgICAgICAgIGlmIChyZXQpDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOw0KPiA+IEBAIC0xNDE2LDEwICsxNDMwLDEwIEBAIHN0YXRpYyB1
MzIgdGVncmFfaTJjX2Z1bmMoc3RydWN0IGkyY19hZGFwdGVyDQo+ICphZGFwKQ0KPiA+ICB7DQo+
ID4gICAgICAgc3RydWN0IHRlZ3JhX2kyY19kZXYgKmkyY19kZXYgPSBpMmNfZ2V0X2FkYXBkYXRh
KGFkYXApOw0KPiA+ICAgICAgIHUzMiByZXQgPSBJMkNfRlVOQ19JMkMgfCAoSTJDX0ZVTkNfU01C
VVNfRU1VTCAmDQo+IH5JMkNfRlVOQ19TTUJVU19RVUlDSykgfA0KPiA+IC0gICAgICAgICAgICAg
ICBJMkNfRlVOQ18xMEJJVF9BRERSIHwgSTJDX0ZVTkNfUFJPVE9DT0xfTUFOR0xJTkc7DQo+ID4g
KyAgICAgICAgICAgICAgIEkyQ19GVU5DXzEwQklUX0FERFIgfCBJMkNfRlVOQ19QUk9UT0NPTF9N
QU5HTElORzsNCj4gPg0KPiA+ICAgICAgIGlmIChpMmNfZGV2LT5ody0+aGFzX2NvbnRpbnVlX3hm
ZXJfc3VwcG9ydCkNCj4gPiAtICAgICAgICAgICAgIHJldCB8PSBJMkNfRlVOQ19OT1NUQVJUOw0K
PiA+ICsgICAgICAgICAgICAgcmV0IHw9IEkyQ19GVU5DX05PU1RBUlQgfCBJMkNfRlVOQ19TTUJV
U19SRUFEX0JMT0NLX0RBVEE7DQo+ID4NCj4gPiAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICB9DQo+
IA0KPiBQbGVhc2UgZGVzY3JpYmUgaG93IHRoaXMgd2FzIHRlc3RlZC4NClRoaXMgaXMgdGVzdGVk
IHVzaW5nIGFuIEkyQyBFRVBST00gdG8gZW11bGF0ZSBTTUJ1cyBibG9jayByZWFkIGluIHdoaWNo
DQp3ZSByZWFkIHRoZSBmaXJzdCBieXRlIGFzIHRoZSBsZW5ndGggb2YgYnl0ZXMgdG8gcmVhZC4g
VGhpcyBpcyBhbiBleHBlY3RlZA0KZmVhdHVyZSBmb3IgTlZJRElBIEdyYWNlIGNoaXBzZXQgd2hl
cmUgdGhlcmUgd2lsbCBiZSBhbiBhY3R1YWwgU01CdXMgZGV2aWNlLg0KDQpUaGFua3MsDQpBa2hp
bA0K
