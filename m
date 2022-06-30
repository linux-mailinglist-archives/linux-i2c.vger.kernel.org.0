Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72BC561429
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 10:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbiF3IGr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 04:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiF3IGq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 04:06:46 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5468740E40;
        Thu, 30 Jun 2022 01:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjBTKsc4pxUWtpX8UUNdhifxC9RViYFSjcj81YT/mbkUPMd7O0/+VBgcpyKWyFimjuGMhw/pwFIQ4fLrkEGmh4wdziQjNgaI/QrHQSp28MnIQLDHOxPYyGMnaJqwlDse2JByTad0AHaeCwhgV76NvEYVWMfLFEZPBgh3XAUvXpjUJH1KzZT5DhQeoYGRJJBrUT1DkYj8vkzzQbFL6KyEpKq3J9tQzHSI/yrqgvGc4OvwiIfjFrA9t3AOTvmeStTdrCpQh2EMrF5u+05Db0RmEQQEYpNuAZGGm1cznT+V+VV+rdndFVXmMU3h7Og5YmcrMVdYB0WI5cbZqw+BL6beJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbyjQBE/8wJ6UWElYsZNA6YEKMrsiTCV17ivBZ89W78=;
 b=OG1TGXUhpqkRPf3Z4sTCPdvMqwgArT2YCMifVsENHXkyp0Y/OdOn1cQ87vudp22wASeUDUwCAPma+r9v/wbY/uw+MwySgjfDOwhatWiYEaPN5f9hvNFGyzLKhuGhFeeKWxAbQzWurw/hV9FCsNYf1rqKddBLaSFOvJCmSpe2R4JEL1b381KX94Bm/iXLxMoWqi83yn09SZ9SiiHrZ8QKdZ9IMr+5/ALrwCnyI7qJlzGIjY6gI6lxTO/ZdPzWiWZP6z88nOoXEvCbFZO5F/kbouGNx4vLNWzvKI/bfkT5PEfCnR1+PVueQvXe1icj/kvcSLnaNas02Bp7pLOUqeITlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbyjQBE/8wJ6UWElYsZNA6YEKMrsiTCV17ivBZ89W78=;
 b=MtR1xGTgHVOwdTwdLdPjvRb690pXZBZfRzMcwroaFaXEOe8xKMBv3pzAdN3ZOA4Mh2s+XJtw3SHox0qq5M6JbxNa5B0PD7FTYT9iZ1nTi1r1t6d0hnjxji5ANm8Qd9XSExlF+5WRhzs3ted3Xk6DEb+497g3gvTruO+XEGEE6TE=
Received: from DM6PR12MB3932.namprd12.prod.outlook.com (2603:10b6:5:1c1::24)
 by DM5PR1201MB2490.namprd12.prod.outlook.com (2603:10b6:3:e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 08:06:41 +0000
Received: from DM6PR12MB3932.namprd12.prod.outlook.com
 ([fe80::a88a:d6dd:520c:55bb]) by DM6PR12MB3932.namprd12.prod.outlook.com
 ([fe80::a88a:d6dd:520c:55bb%6]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 08:06:41 +0000
From:   "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>
CC:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: RE: [PATCH 02/12] i2c: xiic: Enter standard mode only for > 255 byte
 read transfers
Thread-Topic: [PATCH 02/12] i2c: xiic: Enter standard mode only for > 255 byte
 read transfers
Thread-Index: AQHYh8LHjGaJ0g8C3UKlnJTYREMiAK1mVgaAgAFK2PA=
Date:   Thu, 30 Jun 2022 08:06:41 +0000
Message-ID: <DM6PR12MB3932054561C83FD4DA974B818CBA9@DM6PR12MB3932.namprd12.prod.outlook.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
 <1656072327-13628-3-git-send-email-manikanta.guntupalli@xilinx.com>
 <ba4ea0d6-b134-c0ef-962c-0adf8b3c924b@nokia.com>
In-Reply-To: <ba4ea0d6-b134-c0ef-962c-0adf8b3c924b@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 162e674a-2b34-42b8-2dea-08da5a6f7773
x-ms-traffictypediagnostic: DM5PR1201MB2490:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MY8voUTtUpdbQl3jn7470wy6C80nzutXK2wzf0Z3ULnVFqCteVtxIaKh9ujL0tY5zLTT4OHxSxnY1Kg31TpWlGGQRoMOpBdeY/RuanOilv/P9Dn1oX+XvXLlJMvv/fhr9PMOsmJjP14U+G32E+f12TQcO/uge+QtPp9PRo7EcyFS+LQ/MTak2jUI4pr6I0IBeToG9fuVYm0r0XxqlvTPTl/eAIBtjJgq9u/MLPQc8I13YV3MVthVDD4NUCF4cwlgjmOljK6gAg4OwDlv2S/G9XubZMrRfTkIZZ+nfU41M9zv0INdyT4q59+SrkyBkfTFQUem+JXvPWhxpfXHIrHuGxESPhBmgKRbzzDRsRCIVQbq1iuQ5B0EVbjUnQvrHmFYqRRERL7O8vbqJ2rcMTjPJj3o7cgZYOCrLFRHl03kKPY61iSMOWAQAzqph4D6rZjZ6w3DKNU0K0JRFY//GnM1FxjO9uIIMMjnmf/T8Xh9i3T5mmVaWjLOB6k4blLWW6p6E1T9e2obEyzwMAibdynvVg1JpPue3RIEc0/oovcjwpaBaKSUQjiWSrEv2vGf1110lQEYIejT7lMxkPrYSbbiADhWx0V6xqLuwxLvQTUTlvZSNr412v3nB6eGqlL84piwFhg4yXRcg7CaWM/qBFIgrkAOuKK2SMRbo3jspOXCdvo/cMW2EfYqSW8WZ0G0R9ZXdxbIjNg+KTUg/Ex/KYlxozZmbTRrzI8tTILNy0WErhMeNXauK0r4ctwUQri/ZoQidpv7V8RNestQTEpKEnWPTydYfZ/41Wq7FzY5oWG5jKU7VOMbEStoSvxKPicR3FGf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3932.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(38100700002)(66946007)(316002)(296002)(76116006)(66446008)(66556008)(38070700005)(66476007)(64756008)(4326008)(8676002)(107886003)(186003)(71200400001)(53546011)(6506007)(41300700001)(478600001)(9686003)(26005)(7696005)(122000001)(55016003)(6636002)(110136005)(83380400001)(2906002)(86362001)(5660300002)(52536014)(33656002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c285enArditzV245akdhT0FjTHVFeWVxZlRJRnBaMjF4VmYvWFBCZDI4RUwx?=
 =?utf-8?B?RlVpcW1ETlRMZk9naXFCelgycHpGQmRmdWdJS3I2bk1iYXNMZ01zdStyTHVl?=
 =?utf-8?B?bjJjZ3BpcVlUaURHOGVDc25mWlQxMU5GbzA1RVdPWFU4Yk9RTCtUV044TVRP?=
 =?utf-8?B?amtOV0NYTjFVOG5IQ0lQYmxzVDJXakVySEtoZjN6OFVBVEhZakdHUncyb0pv?=
 =?utf-8?B?VXVUUUV2Sm00RWVTWVRIMVcxRUF6TlFhYm9wY0ZDNVN5dnlmUVNtSE5BcVdu?=
 =?utf-8?B?SnJ4UDdvRk9yR0NBUXZtT2ErTHVtN2VvRmsyVCsrdnp3b3JubXZ1V0UwZWhD?=
 =?utf-8?B?V3phc3ZCeHlJVStScUF6Z3E4U1EvdldaNnJtUHFaK1RtTXJBcGVrS0VHVnRF?=
 =?utf-8?B?ZkQ0dEdTRlVDNkpwOHVaNnFJenpRWHBhVjZzQUF0N003YVFIcWVaRHBKYnd4?=
 =?utf-8?B?UXpFVWZteWxZb3NnZmczNFNHZlV5ZUVjTmRldlYzQkc1QnNlYm5zMnd4RU9s?=
 =?utf-8?B?RnBvR2pwTThFR2xzdS9LOUJzZFl5dkQxdHdTWEZzbnNFbVZNN084WGdlWVo4?=
 =?utf-8?B?QjllVjQ4dldFYWM1a0FvSURMcWlQK1crVWFTU3ZKWUFkT2JBQkp3d1pHZkN3?=
 =?utf-8?B?UEVVOXhjdWFZR0drR05Rb0FFL0lJZE02UXR1S2RORXdTZm9zSnQ4VnU0SlQx?=
 =?utf-8?B?Wnpuc1RwTnFXMU1wdkVNWi9FZ2NXSXlpRDZISXVxemx0K2w0UnBjMzM2aDk3?=
 =?utf-8?B?b1lXTm9BR1VJdDFrMWtNbXF5K1FVK1RGaGVOWmZ0L0xMYlkxWlMxeEVtQk8w?=
 =?utf-8?B?WDJiYVhsZkttZjRHOVVBSHBBaldmSGxOYUpxeFpUanExS3FTTmdUWTFkVVZo?=
 =?utf-8?B?ekNXWEtpazViSktCSWhXcDJtcFBCMFdiUmdlTUIrdmYwVXoyUkQxbk9TUElE?=
 =?utf-8?B?Q242K0RzS0dyUjBxeGNYN1ZBVVBOMkttTC9OMVMvc2FYaWJoRS9nQkhORkQw?=
 =?utf-8?B?NkN4akxPbVZKNFp0ZGtoL29kOGkxbVZtRVlsaGhNK2VwLzBKNmpJdXFSTy9n?=
 =?utf-8?B?OFQ3QTBYQkxGakZBNk5qL01BOGpSOEQxMlMvT2g0RFB3MTZVY2lieEVwYTZZ?=
 =?utf-8?B?RU1XR0FKZVhrQURkRFRJUVFwblhIVTlTTEV0ZWZNVWcvMGpVMXZLUG9kSXdk?=
 =?utf-8?B?VVNpSnh0ZWlyUWVZeHo3d29lUFRjYmVpR3Z2MktTb1Y4WVpjM0t5ZTBPcFg5?=
 =?utf-8?B?WEJLTGlwZWxHMnpCUGlpdWZWS1c4TzVKNnVDM21mN3o0US9wODR3aUwzV0Vi?=
 =?utf-8?B?V1R3UU1QZ3FiOStCQ2FnMTBPN2VaWHY0Q25SazdhY0hiUEdxSFovU2RISlUx?=
 =?utf-8?B?MUlMbGJzUk42cmloZEVGb2EvRnBlNGg1cTZJVnNTVHVTY0RBSm9ndUYxbUlh?=
 =?utf-8?B?UnBHVWxld1dMUGxSQzdDMzJGMWVhbm91THZSTXp1TC9wcXFFMFU1T1NObU13?=
 =?utf-8?B?WmRqa1RVNTN6R3Y3bVdlVGlPMzJZREw4Wm1FV1RXaGJDcUhzSFNXbWdNNzJv?=
 =?utf-8?B?V1UvYU92YmZCcDZQODdZNTArZU1lL3BpQzRUY1pHTEUrS0MzYUFGRFhYeG9G?=
 =?utf-8?B?ck42VlhpSUY3VkN6T3ZhZVdrd0xpc2FHUS91eEtWWkdZNElJcTJXdHBhU1E4?=
 =?utf-8?B?KzFVSjZkUGk5dDB4ZTRJdEN5Sm16ZTVjazNJMVlzSk9JUVgrNkRiUU4zRHlh?=
 =?utf-8?B?WFFXK2l1MGJhVTNYbEtEckovc0VNTktVOEFNMEZzZjVocEppRzhNblROV3ps?=
 =?utf-8?B?SzdPMnI5NUMzR2xFdW56QmtpSEx0K0QyK1F6M2prYWF6Mk1mWk1zelAranVV?=
 =?utf-8?B?YTB5ZnlKNi9vd3g2cHVJTnFGSTc3VVF4Q2ZUeHhSR2c0VjJ6SlgzL3M1T042?=
 =?utf-8?B?dGhlWWFMUFcwa0lYV09ybnRQYVNVUXQ4YUo1MHFrK0tyK3FBbFBka3pjclNG?=
 =?utf-8?B?SkkxaVpQa3ovNUJwZkRld2wvWUFVRGcwTE9yYmp0dkwrbG9adk9nM1Q1YUJz?=
 =?utf-8?B?dEhyakxSV2hjRXp2R1E1RlhPUEl3WjNRTExvR3lEYVpmUWIvZTVDV21Dc0RM?=
 =?utf-8?Q?DunY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3932.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 162e674a-2b34-42b8-2dea-08da5a6f7773
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 08:06:41.7784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9CUBdFNLHQhaXN6TBQEE78Ra4bnsLnq5mtspsyF428rYG5d+Mtjq655EGU7JrBQQscpjkGCah0V7PeBfGTY0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2490
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEFkYW1z
a2kgPGtyenlzenRvZi5hZGFtc2tpQG5va2lhLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5l
IDI5LCAyMDIyIDU6NTIgUE0NCj4gVG86IE1hbmlrYW50YSBHdW50dXBhbGxpIDxtYW5pa2FudGEu
Z3VudHVwYWxsaUB4aWxpbnguY29tPjsNCj4gbWljaGFsLnNpbWVrQHhpbGlueC5jb207IFNpbWVr
LCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPjsgbGludXgtDQo+IGFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGdpdCAoQU1ELVhpbGlueCkgPGdpdEBhbWQuY29tPg0KPiBD
YzogUmF2aXRlamEgTmFyYXlhbmFtIDxyYXZpdGVqYS5uYXJheWFuYW1AeGlsaW54LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAwMi8xMl0gaTJjOiB4aWljOiBFbnRlciBzdGFuZGFyZCBtb2Rl
IG9ubHkgZm9yID4gMjU1IGJ5dGUNCj4gcmVhZCB0cmFuc2ZlcnMNCj4gDQo+IENBVVRJT046IFRo
aXMgbWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNl
IHVzZQ0KPiBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1l
bnRzLCBjbGlja2luZyBsaW5rcywgb3INCj4gcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KPiAN
Cj4gDQo+IEhpLA0KPiANCj4gVyBkbml1IDI0LjA2LjIwMjIgbyAxNDowNSwgTWFuaWthbnRhIEd1
bnR1cGFsbGkgcGlzemU6DQo+ID4gRnJvbTogUmF2aXRlamEgTmFyYXlhbmFtIDxyYXZpdGVqYS5u
YXJheWFuYW1AeGlsaW54LmNvbT4NCj4gPg0KPiA+IFRvIG1haW50YWluIGJhY2t3YXJkIGNvbXBh
dGliaWxpdHkgdGhlIGRlZmF1bHQgdHJhbnNmZXIgbW9kZSBpcw0KPiA+IGR5bmFtaWMgbW9kZS4g
RW50ZXIgc3RhbmRhcmQgbW9kZSBvbmx5IHdoZW4gdGhlIHNpemUgb2YgcmVhZCB0cmFuc2Zlcg0K
PiA+IGlzID4gMjU1IGJ5dGVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUmF2aXRlamEgTmFy
YXlhbmFtIDxyYXZpdGVqYS5uYXJheWFuYW1AeGlsaW54LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBNYW5pa2FudGEgR3VudHVwYWxsaSA8bWFuaWthbnRhLmd1bnR1cGFsbGlAeGlsaW54LmNvbT4N
Cj4gDQo+IFsuLi5dDQo+IA0KPiBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHdoeSB0aGlzIHBh
dGNoIGlzbid0IHNxdWFzaGVkIGludG8gcHJldmlvdXMgb25lLiBUaGUNCj4gcHJldmlvdXMgcGF0
Y2ggd2FzIG9ubHkgY2hlY2tpbmcgdGhlIGZpcnN0IG1lc3NhZ2Ugd2hpY2ggd2FzIHdyb25nLCB0
aGlzDQo+IG9uZSBmaXhlcyB0aGF0Lg0KDQpXZSB3aWxsIGZpeCBpbiAgVjINCg0KVGhhbmtzLA0K
TWFuaWthbnRhLg0KDQoNCg==
