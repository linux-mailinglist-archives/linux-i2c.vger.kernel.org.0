Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7005578272
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jul 2022 14:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbiGRMhR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 08:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234616AbiGRMhQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 08:37:16 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0A165C1
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jul 2022 05:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekuBy3aj/AXA4PcQjcXmL6l5CM1bXCzbmzpr9Xs0G9bduPWW3l/5VZHjvu70PNX2lQtlmVgJMiVj5JZS9BcrAcf2q4WMoLlOfhg6PAWow19oBpIDcKAo3sMmJcjrwErJNlvH9AAudmSAru/vDwnWuYod0uEKCnPNO8qt3xKLM5qDgq16qU7vC4acqIrYU9n+Wp62KXKAQNlX8WUhM/VErPq2k6Ne/IRaO5x/S76juGVH+RPFkoSiifcQbcGVvs0B2tNptHFFWXkyCdweEMdZN3ydEC8c8o+/SD8Np0z8U37AxUU7UNeiefHjGZhgDESUNs9jG/kWuoyJ3G6jxNFcqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlXk9N2/IoEfkboFZmkBmfJYnHBdvSAKDV0n7zHwrw0=;
 b=gsIhDOrIWSHdkoYXKovwaNmZm5Xqan94DpQDhlupCPJqaBeb/aY65SZIXEn8+5H0sQbisSuJ9rdqnykgXGxX4oOyrSWWLEk0zQ9dAEbPzkiw9GloYHw8akOkAYMu1sR4xeUK38AP2FPETgW3YKVfHICNMr/RtFKxBDAOtDRAFQ5QQRbt4JRaaKB+qda0tDjHSAUT8ZCp9EtRvNlWp4r4nZ/t0ASFSqWZJ9zjlnbKjlcsXw2L8253fS5rbFoOCdilsoQXnC/zp7BLQowb0C610dx++r+3iH7CRt0Fl4J7bVbdxz+FWrYwanGOGFoX80a5grWmPPzFdUEwKLx6q/WiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlXk9N2/IoEfkboFZmkBmfJYnHBdvSAKDV0n7zHwrw0=;
 b=NRMV76ZUB+/JjvZQwBP5QCkj5bbmXuMGc2oGQ/Fk14yDPh1V83lC/RJgGHbC82wey65Yv+KxT0I+aHTor1ZmHZjTZTakU4sabSnsp/nIAj4SWqEtQi5bEPwX3zEBeKo1Pb9//Cil34qkJzLoZAqm2evZ/dfuFLhaYfROHq0a+Bg=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by DM5PR1201MB0154.namprd12.prod.outlook.com (2603:10b6:4:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Mon, 18 Jul
 2022 12:37:12 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::c070:5fa5:52c4:5d43]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::c070:5fa5:52c4:5d43%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 12:37:12 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     "Simek, Michal" <michal.simek@amd.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        git <git@xilinx.com>
Subject: RE: [PATCH] i2c: cadence: Support PEC for SMBus block read
Thread-Topic: [PATCH] i2c: cadence: Support PEC for SMBus block read
Thread-Index: AQHYmeznYUqm5iyLDkS4/kIYRp8pP62D3OSAgAAvgGA=
Date:   Mon, 18 Jul 2022 12:37:12 +0000
Message-ID: <BY5PR12MB4902D36D299948DE036AC0BF818C9@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20220717145244.652278-1-lars@metafoo.de>
 <768b56a8-df1c-e24d-7879-328512598549@amd.com>
In-Reply-To: <768b56a8-df1c-e24d-7879-328512598549@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-18T12:37:09Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=b1b98bb8-9631-4460-a416-ef796465984a;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45db3394-c045-49cb-4feb-08da68ba3d49
x-ms-traffictypediagnostic: DM5PR1201MB0154:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dNeVMOIdTKeViKFyQOB/43lT75lHCYeO4szTuoIm/BMDSrCCtCkZV1DG14bNe5vBT2Jn3EuTFIiJ0p6G9qhEqh62W5dwBfpH7nLlpTfDJYbuuPP0AbkY9B+MJrKlPbHfqnmzXd01N1IU6DK58n5jSI2j+LDS3fE/zhFJt0WdfGMO4s2OdWFENqlJ/JsxA2OWeQA1ag12zVjJ4sxmVBBAq8Jr1vvsBQXI5AWgZ8qIkurO6xnZdtCV0wlBu/TFt6dPvieGOlekQgyzB15m7KKteQXFjlUZDB8ceJNVxc0pQYPauUZhGZ7lcJdxrqS5+SytmG8aRzWYdY/tanhA9JyL3M1WVdmQUbKFSmt7nvgKebTV86rj1Y77p68Ov+jyTnxnSUI+Y5sa1Axcunr0HbNb7iXLt+W37z37Lr8RnP1nYfpAxioetVZTNPpmL1bCydhQvUdsxsaYURny/1RisW2UqvFxDY25PNHb9B2PRxQmFsezebG/qFHgNf6xmQ/UGM3ROgFhnwQOOffrNsSTuUI9H8KJYvOcxsNASGyFW8CHYoGYOeM/njrdl5oJwZN/MtRWkHNe7SMjv4O+bbfgMEcT77ZKCEP4t+pBmO8wWyzcmz+cSC7yEMBWE33kF6qt5YOkOeJuu9adRVR/dz+LwsTbrlMZsz/q+OifrJVVA13jYLYuVbhhxZa8x2DCahSeGIh3DBiyRbsqip9VY6TVTOZZLslHbqlhzkXL9Ze4FHSU6RyORTpC2TQsGLYWZLgBeddwgp7xK7jmsj8zKZ4+iF+I5ffpqCdEzGMFdvOxVO1KA2LmlMt2VhGErjubCWAbSt3D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(122000001)(55016003)(316002)(38070700005)(83380400001)(186003)(38100700002)(66946007)(52536014)(33656002)(5660300002)(76116006)(71200400001)(4326008)(8676002)(66556008)(66476007)(2906002)(41300700001)(66446008)(64756008)(107886003)(478600001)(9686003)(26005)(7696005)(6506007)(8936002)(53546011)(54906003)(110136005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UllYUnZIcWRodUU2dnE5Q2E4Y2FFdzVWbS9uRTlCYjZ5VmlBL1NDdnhzMmRR?=
 =?utf-8?B?a0lKcFBUV1NFZzdEeS9KZlBaZjV1dEpyN20rbTVMeWlSSGpyZDRKS21oMnRG?=
 =?utf-8?B?MlRRK3FoQS9Ma29vZEFjcXhXYjdGYzZCRWlYTHF1OHRLWlZtSmt5Q3d2NkFH?=
 =?utf-8?B?aVpoWm9uM2pVdGpDZkh0dnFFOFRaQVRYK3cvdGgvMHVlNnZvajdPdWYwalRu?=
 =?utf-8?B?Sml5TjRtMkxKeG5KdDQ1eGYwandjTCtYNEpYRC9YWGx3RWxVeCtoYjBLb01Y?=
 =?utf-8?B?aDNENTEyZVU5aDg0OHFWOVV1Y2pBMFhOeGIyc0c4RmZ3ZU95bXlNK2d1ODBI?=
 =?utf-8?B?RjJDRmN3b3ZzWEdyNDJHVm5yR3ZSVWVQd2tTOW91MFdaSFlNZG51OVBSajVy?=
 =?utf-8?B?NnVzeS83djl3dlZvU3llYWZmcUtNT3U5T0EvTEMwR2NrRjVhQnlXcFA4RVYw?=
 =?utf-8?B?cDNidHcwcXZXZGs1L2hMTm5OSUg3djFQYW9mTS8wTEF4QnRZQlMrc0ZkcnZM?=
 =?utf-8?B?dE13cGxFNGdacW9kRmNDK2FZaTFDTXJWQjFteWE5Y21IVENJbEhBTzBtd290?=
 =?utf-8?B?Z2gxU0NEQUNTRGlhS1REZWNHQmNtV3FYZHZaaWRnenVMSmNrcTlDS3dTTERx?=
 =?utf-8?B?eERmV1EzMmgrVzhORHdjdWovTVNtV3ZtY3ZUVzFDRDdPMmNNcHJBWmVjTnpP?=
 =?utf-8?B?VWhBNWh3MjBEU2hYbThzVGxlbnNsMHV2Wno0S3d3OGF3eC8rZE90b3E2dDZ3?=
 =?utf-8?B?OWVVcHIwRHEwalBkMUF1Y2g3dGRKaVVtd0liY3BLVG5ZNFhTQjRTWit3Szdo?=
 =?utf-8?B?YWhTdjJYWWJjcXVpbWhzQnhHZVdQenZKQThRY3VDV1NLM0NTTGNIdFFLMm1k?=
 =?utf-8?B?c0VSLzdrTHpxQmlRVXVmZm1BdmE5b1lzNm0vOEpYM0owOENPVnNYNkQ2VkJw?=
 =?utf-8?B?MGNCVThTdmUrcE1wOERybTFvT0JSaXp6Y2diWU9seFdvbnp5YWlnYXNzR25R?=
 =?utf-8?B?Zi9jaEZJVzNQSDJob1BxS0MvdjRMMTNDVkl6ZzBRcDVXcE50akgxTzYzQXpz?=
 =?utf-8?B?cVpWdWJWVCtOdGF2UERza0gwWnpNM1kycHBtU1ZiQXZlaUZ6M3dnM3N2azNn?=
 =?utf-8?B?UWRCUjNWNzdycFN4SWU0NGE3REpnMnRhSVZBbVVNRERiTTZWOHJhZDNTcFlo?=
 =?utf-8?B?NmZsNkRrRldSaFAzWVA2ZmFha2xXNnpsUFdMQmtqZnB2Q2NQQk8rV0JadzRh?=
 =?utf-8?B?TjhnZHJ0SVBRNUEyR3Btc2liTzgyTkFPaWtoUVkyQUE4UTlqeUdSUWNhUXh3?=
 =?utf-8?B?R1prdEVTMFpabGQyL2tuSERtRzlvbmhJTmZqdXI3WTQxYVpiWk8vcEh0aSsy?=
 =?utf-8?B?OE4xRmp6T3BjY1VjSHVTNkpFL2V6OEIwVkVNcFZWUUFSMHQrTnVnUkVVOVlK?=
 =?utf-8?B?Umt1eU05Z2hacU9vdFJ6ZWxpV213M3VPRm5ndUVlb2NueVpmeDlwbmdGQnZQ?=
 =?utf-8?B?Vk95bHYwWktuOU9HazY4aEZYMjl4MHFwL2g2WWo2eUg2UTR0VGJ6TE13TVlZ?=
 =?utf-8?B?S2kyZVlQSTJFZHIvOUpla3VBbkZEZnJxYVR0RVk1ZTdWMXJrN3BteG1zV0FI?=
 =?utf-8?B?WllOT1F2RmJTZGN1QVBCWmZqNzh2dUg5aC9xQy9JUTJxYkE3d2RMTEVReElk?=
 =?utf-8?B?Ni9GcE9zZENabnhxZTh5T293NTlOOUVQTG9PN0hnUEhzU0xyNmpCQW5qemRO?=
 =?utf-8?B?VUtHSlBLcjlpMFo5RS9SM0o0YndDd2VyWk9NRnVRUHkzY1ZHRGx2WE1yWEV3?=
 =?utf-8?B?NnB1S043TTZTcVpxVkFwdGIvQ3RMWWF1MklWQ01qYjczQ0w4R1R0RFJHcjYw?=
 =?utf-8?B?eldid1RkMzM2RjBmMThtaitBbkNoNmhwN1VIbGNodHAxNFU2REt5Qldqb2N5?=
 =?utf-8?B?dXdVM29qS2xMYmVhSU9RSDd5endZZ1MwcWxObXFyeE1vam9LR0xwUmJCbTQw?=
 =?utf-8?B?NjBjVVYvV1YwbHFCcytXMVRuTHNYbWVHeWNNTVp3Tm55NVhoSTlpR0pVViti?=
 =?utf-8?B?RUVHTEMwNmdlWUJkUHpkSE9TM0Q1WFBISGxiWnFlQ3Z1ak5WbnkyNWh2RG81?=
 =?utf-8?Q?vebs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45db3394-c045-49cb-4feb-08da68ba3d49
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 12:37:12.7142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vpsuc1HAVpQMzGgyJQ+2H864kL1o34NWW8x6PDUOtfl0oyJqAFykUaNhB9Qbo9an0FCvhbir2bhU9qU/ZXA4kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0154
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29t
Pg0KPiBTZW50OiBNb25kYXksIEp1bHkgMTgsIDIwMjIgMjo1NiBQTQ0KPiBUbzogTGFycy1QZXRl
ciBDbGF1c2VuIDxsYXJzQG1ldGFmb28uZGU+OyBXb2xmcmFtIFNhbmcNCj4gPHdzYUBrZXJuZWwu
b3JnPjsgRGF0dGEsIFNodWJocmFqeW90aSA8c2h1YmhyYWp5b3RpLmRhdHRhQGFtZC5jb20+DQo+
IENjOiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBnaXQgPGdpdEB4aWxpbnguY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBpMmM6IGNhZGVuY2U6IFN1cHBvcnQgUEVDIGZvciBTTUJ1cyBi
bG9jayByZWFkDQo+IA0KPiANCj4gDQo+IE9uIDcvMTcvMjIgMTY6NTIsIExhcnMtUGV0ZXIgQ2xh
dXNlbiB3cm90ZToNCj4gPiBTTUJ1cyBwYWNrZXQgZXJyb3IgY2hlY2tpbmcgKFBFQykgaXMgaW1w
bGVtZW50ZWQgYnkgYXBwZW5kaW5nIG9uZQ0KPiA+IGFkZGl0aW9uYWwgYnl0ZSBvZiBjaGVja3N1
bSBkYXRhIGF0IHRoZSBlbmQgb2YgdGhlIG1lc3NhZ2UuIFRoaXMNCj4gPiBwcm92aWRlcyBhZGRp
dGlvbmFsIHByb3RlY3Rpb24gYW5kIGFsbG93cyB0byBkZXRlY3QgZGF0YSBjb3JydXB0aW9uIG9u
IHRoZQ0KPiBJMkMgYnVzLg0KPiA+DQo+ID4gU01CdXMgYmxvY2sgcmVhZHMgc3VwcG9ydCB2YXJp
YWJsZSBsZW5ndGggcmVhZHMuIFRoZSBmaXJzdCBieXRlIGluIHRoZQ0KPiA+IHJlYWQgbWVzc2Fn
ZSBpcyB0aGUgbnVtYmVyIG9mIGF2YWlsYWJsZSBkYXRhIGJ5dGVzLg0KPiA+DQo+ID4gVGhlIGNv
bWJpbmF0aW9uIG9mIFBFQyBhbmQgYmxvY2sgcmVhZCBpcyBjdXJyZW50bHkgbm90IHN1cHBvcnRl
ZCBieQ0KPiA+IHRoZSBDYWRlbmNlIEkyQyBkcml2ZXIuDQo+ID4gICAqIFdoZW4gUEVDIGlzIGVu
YWJsZWQgdGhlIG1heGltdW0gdHJhbnNmZXIgbGVuZ3RoIGZvciBibG9jayByZWFkcw0KPiA+ICAg
ICBpbmNyZWFzZXMgZnJvbSAzMyB0byAzNCBieXRlcy4NCj4gPiAgICogVGhlIEkyQyBjb3JlIHNt
YnVzIGVtdWxhdGlvbiBsYXllciByZWxpZXMgb24gdGhlIGRyaXZlciB1cGRhdGluZyB0aGUNCj4g
PiAgICAgYGkyY19tc2dgIGBsZW5gIGZpZWxkIHdpdGggdGhlIG51bWJlciBvZiByZWNlaXZlZCBi
eXRlcy4gVGhlIHVwZGF0ZWQNCj4gPiAgICAgbGVuZ3RoIGlzIHVzZWQgd2hlbiBjaGVja2luZyB0
aGUgUEVDLg0KPiA+DQo+ID4gQWRkIHN1cHBvcnQgdG8gdGhlIENhZGVuY2UgSTJDIGRyaXZlciBm
b3IgaGFuZGxpbmcgU01CdXMgYmxvY2sgcmVhZHMNCj4gPiB3aXRoIFBFQy4gVG8gZGV0ZXJtaW5l
IHRoZSBtYXhpbXVtIHRyYW5zZmVyIGxlbmd0aCB1c2VzIHRoZSBpbml0aWFsDQo+ID4gYGxlbmAg
dmFsdWUgb2YgdGhlIGBpMmNfbXNnYC4gV2hlbiBQRUMgaXMgZW5hYmxlZCB0aGlzIHdpbGwgYmUg
Miwgd2hlbg0KPiA+IGl0IGlzIGRpc2FibGVkIGl0IHdpbGwgYmUgMS4NCj4gPg0KPiA+IE9uY2Ug
YSByZWFkIHRyYW5zZmVyIGlzIGRvbmUgYWxzbyBpbmNyZW1lbnQgdGhlIGBsZW5gIGZpZWxkIGJ5
IHRoZQ0KPiA+IGFtb3VudCBvZiByZWNlaXZlZCBkYXRhIGJ5dGVzLg0KPiA+DQo+ID4gVGhpcyBj
aGFuZ2UgaGFzIGJlZW4gdGVzdGVkIHdpdGggYSBVQ005MDMyMCBQTUJ1cyBwb3dlciBtb25pdG9y
LA0KPiB3aGljaA0KPiA+IHJlcXVpcmVzIGJsb2NrIHJlYWRzIHRvIGFjY2VzcyBjZXJ0YWluIGRh
dGEgZmllbGRzLCBidXQgYWxzbyBoYXMgUEVDDQo+ID4gZW5hYmxlZCBieSBkZWZhdWx0Lg0KPiA+
DQo+ID4gRml4ZXM6IGRmOGViNTY5MWM0OCAoImkyYzogQWRkIGRyaXZlciBmb3IgQ2FkZW5jZSBJ
MkMgY29udHJvbGxlciIpDQo+IA0KPiBTdWJqZWN0IGlzIHNheWluZyB0aGF0IHlvdSBhZGRpbmcg
c3VwcG9ydCBmb3IgUEVDIGFuZCBoZXJlIHlvdSBhcmUgc2F5aW5nDQo+IHRoYXQgaXQgaXMgZml4
aW5nIGluaXRpYWwgY29tbWl0Lg0KPiANCj4gSWYgdGhpcyBpcyBhZGRpbmcgbmV3IHN1cHBvcnQg
SSB0aGluayBGaXhlcyB0YWcgc2hvdWxkbid0IGJlIGhlcmUuDQo+IA0KPiBJZiBpdCBpcyBmaXhp
bmcgaXNzdWUgc3ViamVjdCBzaG91bGQgYmUgdXBkYXRlZCBhbmQgdGhpcyBGaXhlcyB0YWcga2Vw
dCBoZXJlLg0KPiANCj4gVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZS4NCj4gDQo+IFNodWJocmFq
eW90aTogQ2FuIHlvdSBwbGVhc2UgdGVzdD8NCg0KSSBoYXZlIHRlc3RlZCB0aGUgcmVhZHMgYW5k
IHdyaXRlIHNtYnVzICB3aXRob3V0IHBhY2tldCBlcnJvciBjaGVjay4NCg0KDQo+IA0KPiBUaGFu
a3MsDQo+IE1pY2hhbA0K
