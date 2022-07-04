Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2962E564D69
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jul 2022 07:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbiGDFp1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jul 2022 01:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiGDFpQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Jul 2022 01:45:16 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A58EE65A3;
        Sun,  3 Jul 2022 22:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXNvKFbttfj9QPiCKlA7VytbZ51mo9irhiSnc9aEI0PG0LotCJqmEJckgQshhtk5s6SEAY1Gbkg0pDcvusIYucLDY33mF87aNqW+lWb/uDRjNR6ok2WcKNM11aBAL2Q5g8KmypK/PsJBDBe+MxCrD5RBzEo+KWB4JwOJwXxS7VcmSbcEwMI/NNCSUr/8sIKij/lNrJWALkSKq0/5KLug4h0ADah97T3Nyl4Qe1vB3t4omrwrhqlUJtsXEZB/TfUgpP6PYkHSNQzTmJC2cjoaBuRn1difPedD21B9rln1/Ltwg7yntZZN1fV6If2ZtWEWzFrRyMrK68VykRjtKyrqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FGX2ESIlF53yMrj48/MVfShVyMxF8g9+20Um0jRYk8=;
 b=IvhRzUNNC3sNrahnYsDuskfYzk4xc0SCUYQgJXJfoXnAp6ZVMjCX4EmhQ1jg0KfUH1WecC4e0+MXIp+NMKNymWB7bOzaSk9gQhcB+70OAQENLNlFxVFtRixzFNmIMuHSjH2KJmH00+pntdQ/AR7n9DpijwPUiq+Noc1IFovJUtD+AqCzGMuTkYPra0kAG5Ij5Mw779Rs4akfBXRFL1efReNiRjBrphziXPxjn4mDjkTVs6PYCBIlcPnPE3YSxOVDuLCMcTo9/VtPEiw2l9b2U7tFN8fIXqowjq5vmapgsKECvTTgslWnhJFPmYmD/JXTSs9I+4rsVBkzbbCGkXVFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FGX2ESIlF53yMrj48/MVfShVyMxF8g9+20Um0jRYk8=;
 b=FhJsdR+UOIJTptExgagG4BGqROWaGM2TLKPw1nSmtRzcqfqm33ocRIcfBN+cD5RTDJ2wQJ58mQj2ppQoba6Fp51DKldEtYCcM2rMBOtTB6i34Pl0+AxwlZk5wKbtUBvTCioomN3tWaEhPY5Q+Dan6kuty8z6LJk8V0COB/zm5Sg=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Mon, 4 Jul
 2022 05:45:11 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::59c7:d947:6370:7de6]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::59c7:d947:6370:7de6%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 05:45:11 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Marek Vasut <marex@denx.de>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@xilinx.com" <git@xilinx.com>,
        "joe@perches.com" <joe@perches.com>
Subject: RE: [PATCH v2 03/10] i2c: xiic: Switch to Xiic standard mode for
 i2c-read
Thread-Topic: [PATCH v2 03/10] i2c: xiic: Switch to Xiic standard mode for
 i2c-read
Thread-Index: AQHYi7Z96YneRUlKs0uey4IWElH1DK1maycAgAABPICAAS8KwIABfgAAgAShLzA=
Date:   Mon, 4 Jul 2022 05:45:11 +0000
Message-ID: <BY5PR12MB49028DFD334FE0F716E64E1F81BE9@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <20210626102806.15402-4-raviteja.narayanam@xilinx.com>
 <ad7626bd-bcbb-48fc-5e32-bc95fafcb917@nokia.com>
 <80c524c3-8c31-346d-2691-48f93fa6001f@denx.de>
 <6cf9647e-10dd-8523-962d-a7c40b532fe2@nokia.com>
 <BY5PR12MB4902D6BAA8D1035BEF022D8E81BA9@BY5PR12MB4902.namprd12.prod.outlook.com>
 <1c944d68-a950-1069-40dd-7f5ebdc395f5@nokia.com>
In-Reply-To: <1c944d68-a950-1069-40dd-7f5ebdc395f5@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-04T05:45:08Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=c46bcaec-6ea9-433c-bcde-e2701f595575;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c75ae91-3c57-44fd-4568-08da5d805cac
x-ms-traffictypediagnostic: MN0PR12MB6102:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KkClR7gRy3TR3g1KR9FW+HQO5XNXun5JXASRvY+lhlrlROWxMHRjfb13M8RYgQQZoJLowoDS/L32UUobMnV0NkAfbqcWL0YIfxr3FSpuZupXypO+WNy+dTYSw+KZ7LgkRG4YB1SZfrf/j1nYk0WR8HJLgpL81V1mzLCwW8EmWR9iK09ABtd6FlqJB7la+exKPlRwGxdkfFzv15DgRhUYsQKcYdMvWn6Hg5KScuNfK3+Hps6cl3ADtGAF1RhCZ3/2mQMzdRHMYinodDASYVpi+YGYHXPUVw7YA7X4u/35CTTeuAnw5nA9Vlg26IqqhRLhZKlVh9ZiuXayCjxnlRZy2z+FLGiMSXJUTT+Upo/XVvdHc5MBaxNFI5Be5Frauok45VOFUY5ArJ/ive/0j5Ie8koZx4KmL/u1eymwoZg+edOU8SItiisSh3/2LsjGPZq1E5yTg6nWGPWXN3y3UNob+5GYsc5HeUC704tpEUXDNAEJHGVcjY5cSbjSyczmStmND1Hjb4qntMVBtqZSxir2629W98hsDqiTBpXiqHr6whWsUSVSJrkMsJCcK+wnzR3cBlnU5+Oo5aj86FQ/SdFWsttMqkBkpFIL9i6cYbgAYG2M83jTI0CY8TohPXZaxLH/3+7HbYVvA4um3JRhV2UJyW7UbZ5yZkma16NIBtRhLt+9yhlpUYo0ks5S17I+paEjBsiqpECdAJxYqtKUy80rz2jHVtaj+yIFj33ppsy8MlXTXwJw1ZO/Y6JLCal7wkNlzFLFkZUSto5iO1U3OW4O44sr4KIItvuhyNR2hDiTfm8yOlNwT9eId2W6aeMQMHEv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(478600001)(5660300002)(8936002)(38070700005)(52536014)(122000001)(54906003)(110136005)(296002)(316002)(33656002)(86362001)(71200400001)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(83380400001)(186003)(9686003)(26005)(2906002)(41300700001)(38100700002)(7696005)(55016003)(53546011)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHNnd016TkZFd0hpZnFoZmRRKzVIMHMyMUNoNDVlK3JxTFVTT2xHS3pGZlZm?=
 =?utf-8?B?MnlJaXFMdzVZS081MlF2RXNpRFNnRWV5c0xJQ09scTdqMU53c2lMYWk1ZVA1?=
 =?utf-8?B?M25OOTMycGF3US92S090clFKcWRSUXJITmhicjB0bk5mK3BDaWl6T3l1ZkJ4?=
 =?utf-8?B?ZUM1dGEvMFFTck5STlpmS05FbUtBN0NPdlQ2S1M1c3ZyaEQvUTlzeHhZVXlV?=
 =?utf-8?B?OTV6T3hUMGRJd2kreDA5cjFPbVFQSm5wTjFLdi81MEc2MU9zNHRTWTRaK1Q1?=
 =?utf-8?B?aGczemFtblhhNmYydG9GWEpXbFVMMjc5YlV1ZHdHQk1ZYzAxOVZ0elpDOWNH?=
 =?utf-8?B?THVjVTlJcGxVcHE0cTBZL2NFRkJPNm5KdkpPRjVOampkVHVLTS9Fc0RLaEUv?=
 =?utf-8?B?T3dRL251Z2NYcU9DQ3Aya1lkS0V2S2laT0Iyb2JubWYwQTViR1BwS0djMVVq?=
 =?utf-8?B?SkU5SlJNcE5MMWtmWkd0R1ZRUGFxQUwzaGMzajNhcnpqUjVRVTdzSC83NG1x?=
 =?utf-8?B?Z1FCdk90WVB3aVdjQzlBOVRCRmkwM0tBK1dxcFZKT2hmaUtocFF3dDNNVU5u?=
 =?utf-8?B?cE8xSUk4S3dyS0d5TFRYU25QajM2b1RKUDJvZ041c3RzZFVaVGNoZWFRaU9Q?=
 =?utf-8?B?Z0ZGZXRMbEV4cGY4WVplMzJVVE1lTm1zSGV4UzJYd3NLcXBqNituNUoyZDZ0?=
 =?utf-8?B?TW1tUXVPdUc2dldDald5L0pLUDY2QzRxQWdJeHRJTFRjTVFMVTI3bEpTYUMz?=
 =?utf-8?B?L1hKZXo3L1NIU3BiQjRFak5YN1BzOTJscGhQcitpWkJjVmdBVDgvSS9WOFdU?=
 =?utf-8?B?NFRXVTNNV3FRQlBGT1Z0RmtOcEpreGtUTDhBaVdQdVlxR1JDRFhpVWtrWGZi?=
 =?utf-8?B?cWNMMGZTbUZub2M1Q3JhTlU3cHdwR3YyTUdTM0lTY3VBTmhqL21GY3NmaFpL?=
 =?utf-8?B?ZjNDczAwRm1hd3dNdFppb3RiQWp3aTROZEpWVlN1amlUejN1N0hVUldjSmd3?=
 =?utf-8?B?aTYvb1Mxb0RWYmd6L2NscnRlSUk5STNRWWFMcWtWb0laNzYrejJGa1BpbHpR?=
 =?utf-8?B?VWVHZkxVZURMWkkxM0grTVdNa0lxUEZ5L1JwMFp1Mkg0MitpQkpnemZiNmRo?=
 =?utf-8?B?Q2liaWoxS3U4WTVTU0I0V2MvQjdBOURaRC9HWUhvVTF4UEc0N3pON1VQZEpa?=
 =?utf-8?B?djc5WlJ4UHBZVzBMOFRUaHZQTitJREpHRHlQS3ZDcm9oZGU4akRuanpkQjd3?=
 =?utf-8?B?T3lFdUx3eTBubnhxeDNnaFRMRDRuK1dmbXJUcGt3N01UOWtvdGZ3L0tERE5Z?=
 =?utf-8?B?MkdtTC9keElaYmNDZXFwTkR2TCtqendiZXlBREFZbXNDZGFtbkI4dVBSc3Bu?=
 =?utf-8?B?YUFneHlScUxNOW5YNmRHaGw3cmF0RFpGMTJ4NDNLSFVzVzUyd085dUVQSERN?=
 =?utf-8?B?YnhDUXR4SmpmZk91Z0VwMFVOYlV1YWFITDUydEJKakNnKy85SUo4VWY0WmI4?=
 =?utf-8?B?SVM2VGdyMkw3Ti9hMlJTUmpjc0RtM1JJLzgyOXRNbWZXYzJ6NGtUcWh6OXlz?=
 =?utf-8?B?cDJzZ1JiYnU5bFczL01jd1BDT3VLSk9qSFExS0F0TXJsUDRuVUgrYWZFRnRo?=
 =?utf-8?B?RWhYZXVQNlJmcERMNmhnaGZtTW1ZYXk1dlhBcmxGM25DV1o1TWMrb1RCUkE1?=
 =?utf-8?B?Z2JxR09GdkpZQWdGY3lhcmFwWUQvTXE5SlJFZzM5VkpjRDEvRjV6RkY5ejdw?=
 =?utf-8?B?NE5LWm1mTnQzWFRaOGZybit0THp6SUMwQkEyVHhBQWwwbkFyR1hLRVRLQ2tE?=
 =?utf-8?B?V1VCS2hqalpJZzVDM0RsenNEMzJNa2FjM2FpZGliL1VFalU5TmRiaVMrNkZN?=
 =?utf-8?B?MS9WZjkxMnVZU1hVeW9kcEhwNHlJbm9xU2xKUnNMMmQyL1l4RGZmejJSSjJV?=
 =?utf-8?B?bGw2bnZXV2FOYUtZMnZPcE1kWVlaRHFob3hzSjNtS1hBN1hOcVRlTU1vQVlP?=
 =?utf-8?B?SVBHUktKb0FUNG9rYzgzQXNlUU85WjQwVWRxQlRFSTJQSXBxYVRGQkkreVoy?=
 =?utf-8?B?Ris4ajNPOWI3bytSeC84M3hLUitRU2pheFNibWpRbytZOHFqc2xkamcwQnhl?=
 =?utf-8?Q?gJTs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c75ae91-3c57-44fd-4568-08da5d805cac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 05:45:11.8180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNT1tzBngJH8J7A9bIgBTecaRJupy4xU8t4982bajKVH3opr3Pi2Vopqu190rfS5/mrk+gXIqtl2Xioza81E2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBBZGFtc2tpIDxrcnp5c3p0b2YuYWRhbXNr
aUBub2tpYS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVseSAxLCAyMDIyIDEyOjMyIFBNDQo+IFRv
OiBEYXR0YSwgU2h1YmhyYWp5b3RpIDxzaHViaHJhanlvdGkuZGF0dGFAYW1kLmNvbT47IE1hcmVr
IFZhc3V0DQo+IDxtYXJleEBkZW54LmRlPjsgUmF2aXRlamEgTmFyYXlhbmFtIDxyYXZpdGVqYS5u
YXJheWFuYW1AeGlsaW54LmNvbT47DQo+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IG1pY2hh
bC5zaW1la0B4aWxpbnguY29tDQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGdpdEB4aWxpbnguY29tOyBq
b2VAcGVyY2hlcy5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMy8xMF0gaTJjOiB4aWlj
OiBTd2l0Y2ggdG8gWGlpYyBzdGFuZGFyZCBtb2RlIGZvciBpMmMtDQo+IHJlYWQNCj4gDQo+IFtD
QVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4gDQo+IFcgZG5pdSAzMC4wNi4yMDIyIG8gMTA6MjMs
IERhdHRhLCBTaHViaHJhanlvdGkgcGlzemU6DQo+ID4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAt
IEdlbmVyYWxdDQo+ID4NCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogS3J6eXN6dG9mIEFkYW1za2kgPGtyenlzenRvZi5h
ZGFtc2tpQG5va2lhLmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI5LCAyMDIyIDc6
NDAgUE0NCj4gPj4gVG86IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPjsgUmF2aXRlamEgTmFy
YXlhbmFtDQo+ID4+IDxyYXZpdGVqYS5uYXJheWFuYW1AeGlsaW54LmNvbT47IGxpbnV4LWkyY0B2
Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IG1pY2hhbC5zaW1la0B4aWxpbnguY29tDQo+ID4+IENjOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+ID4+IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGdpdEB4aWxpbnguY29tOyBqb2VAcGVyY2hlcy5jb20NCj4gPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAwMy8xMF0gaTJjOiB4aWljOiBTd2l0Y2ggdG8gWGlpYyBzdGFu
ZGFyZCBtb2RlDQo+ID4+IGZvciBpMmMtIHJlYWQNCj4gPj4NCj4gPj4gW0NBVVRJT046IEV4dGVy
bmFsIEVtYWlsXQ0KPiA+Pg0KPiA+PiBDQVVUSU9OOiBUaGlzIG1lc3NhZ2UgaGFzIG9yaWdpbmF0
ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFBsZWFzZQ0KPiA+PiB1c2UgcHJvcGVyIGp1ZGdt
ZW50IGFuZCBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcNCj4gPj4g
bGlua3MsIG9yIHJlc3BvbmRpbmcgdG8gdGhpcyBlbWFpbC4NCj4gPj4NCj4gPj4NCj4gPj4gSGkg
TWFyZWssDQo+ID4+DQo+ID4+IFcgZG5pdSAyOS4wNi4yMDIyIG8gMTY6MDUsIE1hcmVrIFZhc3V0
IHBpc3plOg0KPiA+Pj4+IFsuLi5dDQo+ID4+Pj4NCj4gPj4+PiBJZiB0aG9zZSB0d28gbW9kZXMg
b25seSBkaWZmZXIgaW4gc29mdHdhcmUgY29tcGxleGl0eSBidXQgd2UgYXJlDQo+ID4+Pj4gbm90
IGFibGUgdG8gc3VwcG9ydCBvbmx5IHRoZSBzaW1wbGVyIG9uZSBhbmQgd2UgaGF2ZSBzdXBwb3J0
IGZvcg0KPiA+Pj4+IHRoZSBtb3JlIGNvbXBsaWNhdGVkIChzdGFuZGFyZCBtb2RlKSBhbnl3YXlz
LCB3ZSBrbm93IHRoYXQNCj4gc3RhbmRhcmQNCj4gPj4+PiBtb2RlIGNhbiBoYW5kbGUgb3IgdGhl
IGNhc2VzIHdoaWxlIGR5bmFtaWMgbW9kZSBjYW5ub3QsIHdlIGFsc28NCj4gPj4+PiBrbm93IHRo
YXQgZHluYW1pYyBtb2RlIGlzIGJyb2tlbiBvbiBzb21lIHZlcnNpb25zIG9mIHRoZSBjb3JlLCB3
aHkNCj4gPj4+PiBkbyB3ZSBhY3R1YWxseSBrZWVwIHN1cHBvcnQgZm9yIGR5bmFtaWMgbW9kZT8N
Cj4gPj4+IElmIEkgcmVjYWxsIGl0IHJpZ2h0LCB0aGUgZHluYW1pYyBtb2RlIHdhcyBzdXBwb3Nl
ZCB0byBoYW5kbGUNCj4gPj4+IHRyYW5zZmVycyBsb25nZXIgdGhhbiAyNTUgQnl0ZXMsIHdoaWNo
IHRoZSBjb3JlIGNhbm5vdCBkbyBpbg0KPiA+Pj4gU3RhbmRhcmQgbW9kZS4gSXQgaXMgbmVlZGVk
IGUuZy4gYnkgQXRtZWwgTVhUIHRvdWNoIGNvbnRyb2xsZXIuIEkNCj4gPj4+IHNwZW50IGEgbG90
IG9mIHRpbWUgZGVidWdnaW5nIHRoZSByYWNlIGNvbmRpdGlvbnMgaW4gdGhlIFhJSUMsIHdoaWNo
DQo+ID4+PiBJIHVsdGltYXRlbHkgZml4ZWQgKHRoZSBwYXRjaGVzIGFyZSB1cHN0cmVhbSksIGJ1
dCB0aGUgbG9uZw0KPiA+Pj4gdHJhbnNmZXJzIEkgcmF0aGVyIGZpeGVkIGluIHRoZSBNWFQgZHJp
dmVyIGluc3RlYWQuDQo+ID4+Pg0KPiA+Pj4gSSBhbHNvIHJlY2FsbCB0aGVyZSB3YXMgc3VwcG9z
ZWQgdG8gYmUgc29tZSB1cGRhdGUgZm9yIHRoZSBYSUlDIGNvcmUNCj4gPj4+IGNvbWluZyB3aXRo
IG5ld2VyIHZpdmFkbywgYnV0IEkgbWlnaHQgYmUgd3JvbmcgYWJvdXQgdGhhdC4NCj4gPj4gSXQg
c2VlbXMgdG8gYmUgdGhlIG90aGVyIHdheSBhcm91bmQgLSBkeW5hbWljIG1vZGUgaXMgbGltaXRl
ZCB0byAyNTUNCj4gPj4gYnl0ZXMgLSB3aGVuIHlvdSB0cmlnZ2VyIGR5bmFtaWMgbW9kZSB5b3Ug
Zmlyc3Qgd3JpdGUgdGhlIGFkZHJlc3Mgb2YNCj4gPj4gdGhlIHNsYXZlIHRvIHRoZSBGSUZPLCB0
aGVuIHlvdSB3cml0ZSB0aGUgbGVuZ3RoIGFzIG9uZSBieXRlIHNvIHlvdQ0KPiA+PiBjYW4ndCBy
ZXF1ZXN0IG1vcmUgdGhhbiAyNTUgYnl0ZXMuIFNvICpzdGFuZGFyZCogbW9kZSBpcyB1c2VkIGZv
cg0KPiA+PiB0aG9zZSBtZXNzYWdlcy4gSW4gb3RoZXIgd29yZHMgLSBkeW5hbWljIG1vZGUgaXMg
dGhlIG9uZSB0aGF0IGlzIG1vcmUNCj4gPj4gbGltaXRlZA0KPiA+PiAtIGV2ZXJ5dGhpbmcgdGhh
dCB5b3UgY2FuIGRvIGluIGR5bmFtaWMgbW9kZSB5b3UgY2FuIGFsc28gZG8gaW4NCj4gPj4gc3Rh
bmRhcmQgbW9kZS4gU28gd2h5IGRvbid0IHdlIHVzZSBzdGFuZGFyZCBtb2RlIGFsd2F5cyBmb3IN
Cj4gZXZlcnl0aGluZz8NCj4gPiBIb3dldmVyICB0aGUgY3VycmVudCBtb2RlIGlzIGR5bmFtaWMg
bW9kZSBzbyBmb3IgbGVzcyB0aGFuIDI1NSB3ZSBjYW4NCj4gPiB1c2UgZHluYW1pYyBtb2RlLih0
aGUgY3VycmVudCBiZWhhdmlvciB3aWxsIG5vdCBjaGFuZ2UpIEFsc28gdGhlDQo+ID4gZHluYW1p
YyBtb2RlICBpcyAgbmljZXIgb24gdGhlIHByb2Nlc3NvciByZXNvdXJjZXMuIFdlIHNldCB0aGUg
Ynl0ZXMgYW5kDQo+IHRoZSBjb250cm9sbGVyIHRha2VzIGNhcmUgb2YgdHJhbnNmZXJyaW5nLg0K
PiA+DQo+ID4gSG93ZXZlciBkbyBub3QgaGF2ZSBhbnkgc3Ryb25nIHZpZXdzIG9wZW4gdG8gc3Vn
Z2VzdGlvbnMuDQo+IA0KPiBBbGwgSSdtIHNheWluZyBpcyB0aGF0IGJlZm9yZSB0aGlzIHBhdGNo
c2V0LCB0aGUgZHluYW1pYyBtb2RlIHdhcyB1c2VkIGluIGFsbA0KPiBjYXNlcyBhbmQgaXQgbWFk
ZSBzZW5zZSAtIGl0IGlzIGVhc2llciB0byB3b3JrIHdpdGguIEJ1dCBpdCB0dXJuZWQgb3V0IGl0
IGhhcyBpdHMNCj4gbGltaXRhdGlvbnMgYW5kIHN1cHBvcnQgZm9yIHN0YW5kYXJkIG1vZGUgd2Fz
IGFkZGVkIHdpdGggc2V2ZXJhbCBjYXNlcyB0aGF0DQo+IHN3aXRjaCB0byB0aGF0IG1vZGUuIFRo
ZSBjb21taXQgbWVzc2FnZSBzdWdnZXN0cyB0aGF0IHRoZSBvbmx5IGRpZmZlcmVuY2UgaXMNCj4g
aW4gaG93IGNvbXBsaWNhdGVkIHRoZSBjb2RlIGZvciBoYW5kbGluZyB0aGVtIGlzLCBkb2VzIG5v
dCBzYXkgd2h5IGR5bmFtaWMNCj4gbW9kZSBtaWdodCBzdGlsbCBiZSBwcmVmZXJyZWQuIEFuZCBz
dXBwb3J0aW5nIGJvdGggb2YgdGhlbSBjb21wbGljYXRlcyB0aGUNCj4gY29kZSBub3RpY2VhYmx5
Lg0KPiBNeSB1bmRlcnN0YW5kaW5nIG5vdyBpcyB0aGF0IHRoZSBjb2RlIHN0cnVnZ2xlcyB0byB1
c2UgdGhlIGR5bmFtaWMgbW9kZSBpbg0KPiBhbGwgY2FzZXMgdGhhdCBpdCBjYW4gYmVjYXVzZSB0
aGF0IHByb2R1Y2VzIGxlc3MgaW50ZXJydXB0cyBhbmQgc28gaXQgaXMgc2xpZ2h0bHkNCj4gbGln
aHRlciBvbiByZXNvdXJjZXMuIFNvIGl0IGlzIGEgY29kZSBjb21wbGljYXRpb24gdnMgZWZmZWN0
aXZlbmVzcyB0cmFkZW9mZi4NCj4gU2luY2UgdGhpcyBpcyBJMkMgLSBhIHNsb3cgYnVzLCBJJ20g
bm90IHN1cmUgaXQgaXMgd29ydGggaXQgYnV0IGFsc28gZG9uJ3QgaGF2ZQ0KPiBzdHJvbmcgb3Bp
bmlvbiBvbiB0aGF0LiBJZiBub3RoaW5nIGVsc2UsIEkgdGhpbmsgaXQgd291bGQgbWFrZSBzZW5z
ZSB0byB1cGRhdGUNCj4gdGhlIGNvbW1pdCBtZXNzYWdlIGEgbGl0dGxlIGJpdCB0byBiZXR0ZXIg
ZXhwbGFpbiB3aHkgaXQgaXMgd29ydGgga2VlcGluZyBib3RoDQo+IG1vZGVzLg0KDQpXaWxsIHVw
ZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gS3J6
eXN6dG9mDQo=
