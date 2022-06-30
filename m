Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D61645614EA
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 10:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbiF3IYl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 04:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbiF3IYJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 04:24:09 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1204624F;
        Thu, 30 Jun 2022 01:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2N3ROy+PtEtAhtoeT0+Qhwb1CH3zTx6KDOE6suilMfS8SwZ6Y714d0EWp50oIWIQGP95MigMmN7MRepVrP45+o1OMW6WBmbmANyv1lG6VS/lEXtIIKfqJQ6ZQUnPXHq/Hlm4/mRsqO4hheETKNVMM+BCZJ/oTY4AB56HJncH5xb+RVmlXS6NZnxMujN9/RAgXj32yKP6+v5xejgRKb5yu1IVBM7D5Zdk1GB1X+y1VDcU7/9ATr+7f97ndspdmBms6KsBILw5Qrmv2+dlISD3wBrd5RrbQ1MzuqlB+R+4dgiXOUyV90HdKpgwLe/ttZMZVatwiSteyVWJcpOp/SvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUKMIVxOLLX9sb5EwPwkvnTCqtbfb2s+TXdh91PPFs0=;
 b=VfyX+xPXXGjaBq+lHG2KuXcAJyMHJAI7xHEndioTkajtuF+CIeS+PXruGKGX0AGNfjdGySsCbRc8rdVasCgrHfaeBQduYHvilbIzyUlkLg9mC9AD5z7hf047kbz9VWBvbk4nqGN5aYVN9Kl8DMt1DurJNQg6+heYlI7Mf4hNqFoxH4rRQvR9XZ9oNRdMDNO2GVj2m1fXuVZpCW/nV5t7yjNhvym61FrFmBsmwNiMM23HQkExApxSGrOe8xlBkDyX70EfHeqilVxoTy4PCaszd3O/lonI1lpXwd4yzPM80cPOBkYBRmeMIEoa1gxsh+luYZJWhIy1P3UMws4eQCsK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUKMIVxOLLX9sb5EwPwkvnTCqtbfb2s+TXdh91PPFs0=;
 b=vHNaqhameFI4Uf+xSvSfSSjuDjUXly1nwUijjLMNZr1quK0lSqbyU9WrCPnXvwofyQ/L4GqfimyJ4UIGAljpz8+zQC+7L746VMLD792rcx+NKp8QYjFOnF+MwliUwpPM+35s5LGPNPJLh8Qijm4kSvZBuGOBfbnREzQdN175/ak=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by CY4PR12MB1350.namprd12.prod.outlook.com (2603:10b6:903:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 08:23:39 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::59c7:d947:6370:7de6]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::59c7:d947:6370:7de6%7]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 08:23:39 +0000
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
Thread-Index: AQHYi7Z96YneRUlKs0uey4IWElH1DK1maycAgAABPICAAS8KwA==
Date:   Thu, 30 Jun 2022 08:23:38 +0000
Message-ID: <BY5PR12MB4902D6BAA8D1035BEF022D8E81BA9@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <20210626102806.15402-4-raviteja.narayanam@xilinx.com>
 <ad7626bd-bcbb-48fc-5e32-bc95fafcb917@nokia.com>
 <80c524c3-8c31-346d-2691-48f93fa6001f@denx.de>
 <6cf9647e-10dd-8523-962d-a7c40b532fe2@nokia.com>
In-Reply-To: <6cf9647e-10dd-8523-962d-a7c40b532fe2@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-30T08:23:36Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=3ea90cca-9979-4bb7-8049-128158d3bb22;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c815711e-a733-4f76-8237-08da5a71d5c6
x-ms-traffictypediagnostic: CY4PR12MB1350:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x5gNYrB57aEdbTxC8GBiThbfF8JCEOZbBNwOHILLzVmFSeoFYMEbh4fPAwShGcS68Lue8JFsPvAoNyleUWfmuUO/6wqEV4EcyR/rGwZRbHt/7p+sFaH+DVLgF4qWCz9/zUCx8Z65L2eZ1YdAipDoFitSMYrovaPpaQlfGeMWoUAYCprrCRy3dLHtFgweVQ4dAegyZUp4Ubz3icmg4RNbpKpe+ZX9FNBViYej+lgV14UMHsKOMeYantXR/ETU4fD5jXMKhF1MJo6g3+rinISI4nS8uEX6+aRR/5NcolwVOHZLyrpfPbVg0Ky6HJU9CtV7EaHuKBp8ipILn4cNXw70pi1qNCMc68dHCR8w6/dzc5TkqEfap8ni86Pt9aUXesauH6YNKd1Con9K6AEupHLOuYj2+G9QmaT/N3oh76pczb+Jgxzmn5oS+26+BxEF2Bt2GjSRaQuCWaYm+VKHltspQFAbzF/CMtOYMGVzbsdd3+B29AD9McSuSxRtYjM0wanlpykiuUHyT0HY8O2XCsz9NBeu0aZ4ZbK0ZsD7dQR9iD9Hiw3dcJVj1G8OybUthTDXDNYrmChpDdo955ipiSRh7Z+O8qHlnOeHRYFksuYtsSbkCrE94Vrtxz/KQqIIgcE65qzbapmNp3RcaTP/3uC9uyyyLftbcu8lqQFUKpn0+NkF5PoI+9KloF6gi640Iv8lFShmPqQWHcqVozWtMpQYzTXTusy/jA+BcHFDAGSw6lb5mjxDVGKXWHTImrRp+Yp20FJvt4cTtFfvQ+tolQHOUhxTWKtWkih0ckyeTEXHdMhbEjs9gNVQv3qeW1PwAemB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(26005)(6506007)(7696005)(53546011)(9686003)(38070700005)(55016003)(38100700002)(122000001)(186003)(33656002)(83380400001)(66556008)(66476007)(64756008)(71200400001)(76116006)(66946007)(66446008)(8676002)(4326008)(8936002)(52536014)(478600001)(5660300002)(86362001)(316002)(296002)(54906003)(110136005)(2906002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2Y2OCsrMllPdk90eTNaVXU3VERYMG5VYmpmendtc3pMTEZHM3d5dGo2Rkxs?=
 =?utf-8?B?WUZ2dUJrY2tYWm1oUWl0Y1BPNW9xN1RJZUJZMzVRSzdLdzMvKzlVK2dNTWJF?=
 =?utf-8?B?NXdzWjV5eXB2Tk9JeFRmYlRheEJrKzE0M1gxbzlPS0I1RTdXQVZvU1VuK3hk?=
 =?utf-8?B?d2JOOURwMkc0aXF2SFExbEZSU3dnT1lQY2VqODAycURpUXdaSjNmNnJaaXpl?=
 =?utf-8?B?Rnl5amMvYk5QUXdocFYxUFVWTS9DOVp3UWo2QW9JS0lrYTNORS9IZTFvd0dl?=
 =?utf-8?B?Sno3aTBFTHZFNXk4MnBqRFlOa3c3NnVhem14dHB1aDZaN1FLL3c0TVNRclRR?=
 =?utf-8?B?OXJPVzlmTVBRSXRRUGhGcWNSekRBMVBXbHFqVGlYeFVnWGJxa05xOGFZajNn?=
 =?utf-8?B?Wlp4Y3Joa3RxelhoSTVDaTJsYjRGQmgyb20vT1ExNjhEV2NibjVneUFRYmF4?=
 =?utf-8?B?VWRDL1BlUFg1Mm83STM2eDJDWkhmQmxyZDVSOGQrbENqb1dJa0pyMmg2Q1lO?=
 =?utf-8?B?SVlacXNXRk9PNXhrL0x5RFhmT2dMRU05NlV4Y05XZkl0NmVCM3g3WHlPOGwv?=
 =?utf-8?B?VU1DbElaQmdXRWI0Sk9mSC9JY29xdWhqaURrb200c3BESEZFLzVJRUVwazQ1?=
 =?utf-8?B?Sk9JZWRBWWVPZUtuWG85V2o1ejNHLzZqS3luYUVBdzlhbm5GVnhFd1dCbFFZ?=
 =?utf-8?B?RjJNWlY2NUk3NFNuc2VWeThQV1ZRK0doRE9ZMkVIejNxMHBlVGl0aGZlTEtu?=
 =?utf-8?B?eWtVTTEzVkZVai9ib3MzZUFJc3ozTkl1TVpETkxicEUzMEZ4WnZjZm1Scmdo?=
 =?utf-8?B?cUtFMlVTbGtKRDIrOHBkZ2twSmZsUWIyQmhBa1hXNmRra0hPRElJR1RkQlVv?=
 =?utf-8?B?bFpYcXFjY2ZTWEx1WmppbE9hOU9hOWJnSTdwenNNU3ZKdVliL0RIMHBSSUtM?=
 =?utf-8?B?VGdiWFl5bitoYVpHb0Fid2ZzQVF2RHlIMm9ZWFNLaG9TMVJIbXdLM01pMC8v?=
 =?utf-8?B?WVBva1lYcmhiOFV1MC9keG5mWTlhSnZVbzBxVk9lS3hXcERHbm03bnJNeWhG?=
 =?utf-8?B?OGFHRjh1cFkxazJSbDdiMVM3L0lQNkZjSHdJNTRWQW56U3NEY2JaQ0w4VDQ2?=
 =?utf-8?B?Q05aMUVOemlvRnF5ejBSV1JOaEV2VjNwSTh6UGt0Z1dnTGxvNlhZSWFrWHhU?=
 =?utf-8?B?cTNUcSsxNFA2Ymh3UVlKMTQzMGFXelJBckllcUttT1VIWDNqdnVEanBMUlJG?=
 =?utf-8?B?Wk1RbFVCSjZqclFkZmxIcjZ6bWFkRWJaWXFLOHlYdlhCaWtpbXNUc2NRVCtU?=
 =?utf-8?B?L3FzRS9yNmkzM1FSQXYwODViMjIzMThQNy9hd2tTb0N6MlB5akVoNEQyUVVE?=
 =?utf-8?B?eER4bkpKWmVGVjk1N0tHZ3dRamZZanBwK2Nac3FMeU1QamJPYTBLdGM5OGt6?=
 =?utf-8?B?MnRmd1dqQ0FJb293ODdpQ2cyNzV5b2tyejJBNTg5cGxHMmVsZXpWNzV6OEJI?=
 =?utf-8?B?dzdyRG40a25qcnVKSFRBdnZsc1NwMVVIQmZWTG1UdDI5T055OWhHRERVU0pB?=
 =?utf-8?B?UytHT1RZVjhOWDhxU1ViVC93QXlvNldWSG9ya1RqbDFFQlIzMDhNYU5JM3Jn?=
 =?utf-8?B?MWdhVm00U3dLamlmd1U0QjJzN25PZXIrUEhLZGVmN0EzdERYVVdsL1FuYTYy?=
 =?utf-8?B?RUF1UVJYNWRpRi9OaTYrSUJ6dk9GMEtwMGVqSnNsZGVQcTcveStQZjJuaFZv?=
 =?utf-8?B?UnJFdk5hbWw5RC91U2VoT1IxY0lHSDVtbHpYNU9LQy9wcHZ5M3U2VWZGREVy?=
 =?utf-8?B?V3dFWnFmSUsvLy9FZ0pkWkNua0tHM25qclNKL1lRNTRYV1hyT3RVY0E0RGpG?=
 =?utf-8?B?YTROYW8veDlvR2xaV2x3b01uTmUzQllDUzN3bDdnQng4bnBoYU4vTmlaeVZn?=
 =?utf-8?B?QmFNaHdWZ1FCZ0c5OHZrL3g4MGcyMUZPSENEM2tSV3l6OVMrUHY3K2NWVy8x?=
 =?utf-8?B?bCtRU2xWNnEzdTB4NUhDSzBJRmdoL1k0RFFJMnEwS3VaV0Vwc0s5MVp4U1Ax?=
 =?utf-8?B?ZVFGT3p6VFFBUW9TYXFyUzdPc1o5aXhveHlHaGdGemFHckcrN2MwcTA0WkxL?=
 =?utf-8?Q?jY/U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c815711e-a733-4f76-8237-08da5a71d5c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 08:23:39.0238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AeWx1tXnYNHjiyx9NoFfBp2fgm2kcKMrNUGAbn6dm7MVymwNA4Q76zQgdy0lWM5/yXVxYpTeP15Iry5msi59Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1350
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIEtyenlzenRvZiwgDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEFkYW1za2kgPGty
enlzenRvZi5hZGFtc2tpQG5va2lhLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI5LCAy
MDIyIDc6NDAgUE0NCj4gVG86IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPjsgUmF2aXRlamEg
TmFyYXlhbmFtDQo+IDxyYXZpdGVqYS5uYXJheWFuYW1AeGlsaW54LmNvbT47IGxpbnV4LWkyY0B2
Z2VyLmtlcm5lbC5vcmc7DQo+IG1pY2hhbC5zaW1la0B4aWxpbnguY29tDQo+IENjOiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGdpdEB4aWxpbnguY29tOyBqb2VAcGVyY2hlcy5jb20NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAwMy8xMF0gaTJjOiB4aWljOiBTd2l0Y2ggdG8gWGlpYyBzdGFuZGFyZCBtb2RlIGZv
ciBpMmMtDQo+IHJlYWQNCj4gDQo+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4gDQo+IENB
VVRJT046IFRoaXMgbWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJj
ZS4gUGxlYXNlIHVzZQ0KPiBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5n
IGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3INCj4gcmVzcG9uZGluZyB0byB0aGlzIGVt
YWlsLg0KPiANCj4gDQo+IEhpIE1hcmVrLA0KPiANCj4gVyBkbml1IDI5LjA2LjIwMjIgbyAxNjow
NSwgTWFyZWsgVmFzdXQgcGlzemU6DQo+ID4+IFsuLi5dDQo+ID4+DQo+ID4+IElmIHRob3NlIHR3
byBtb2RlcyBvbmx5IGRpZmZlciBpbiBzb2Z0d2FyZSBjb21wbGV4aXR5IGJ1dCB3ZSBhcmUgbm90
DQo+ID4+IGFibGUgdG8gc3VwcG9ydCBvbmx5IHRoZSBzaW1wbGVyIG9uZSBhbmQgd2UgaGF2ZSBz
dXBwb3J0IGZvciB0aGUgbW9yZQ0KPiA+PiBjb21wbGljYXRlZCAoc3RhbmRhcmQgbW9kZSkgYW55
d2F5cywgd2Uga25vdyB0aGF0IHN0YW5kYXJkIG1vZGUgY2FuDQo+ID4+IGhhbmRsZSBvciB0aGUg
Y2FzZXMgd2hpbGUgZHluYW1pYyBtb2RlIGNhbm5vdCwgd2UgYWxzbyBrbm93IHRoYXQNCj4gPj4g
ZHluYW1pYyBtb2RlIGlzIGJyb2tlbiBvbiBzb21lIHZlcnNpb25zIG9mIHRoZSBjb3JlLCB3aHkg
ZG8gd2UNCj4gPj4gYWN0dWFsbHkga2VlcCBzdXBwb3J0IGZvciBkeW5hbWljIG1vZGU/DQo+ID4N
Cj4gPiBJZiBJIHJlY2FsbCBpdCByaWdodCwgdGhlIGR5bmFtaWMgbW9kZSB3YXMgc3VwcG9zZWQg
dG8gaGFuZGxlDQo+ID4gdHJhbnNmZXJzIGxvbmdlciB0aGFuIDI1NSBCeXRlcywgd2hpY2ggdGhl
IGNvcmUgY2Fubm90IGRvIGluIFN0YW5kYXJkDQo+ID4gbW9kZS4gSXQgaXMgbmVlZGVkIGUuZy4g
YnkgQXRtZWwgTVhUIHRvdWNoIGNvbnRyb2xsZXIuIEkgc3BlbnQgYSBsb3QNCj4gPiBvZiB0aW1l
IGRlYnVnZ2luZyB0aGUgcmFjZSBjb25kaXRpb25zIGluIHRoZSBYSUlDLCB3aGljaCBJIHVsdGlt
YXRlbHkNCj4gPiBmaXhlZCAodGhlIHBhdGNoZXMgYXJlIHVwc3RyZWFtKSwgYnV0IHRoZSBsb25n
IHRyYW5zZmVycyBJIHJhdGhlcg0KPiA+IGZpeGVkIGluIHRoZSBNWFQgZHJpdmVyIGluc3RlYWQu
DQo+ID4NCj4gPiBJIGFsc28gcmVjYWxsIHRoZXJlIHdhcyBzdXBwb3NlZCB0byBiZSBzb21lIHVw
ZGF0ZSBmb3IgdGhlIFhJSUMgY29yZQ0KPiA+IGNvbWluZyB3aXRoIG5ld2VyIHZpdmFkbywgYnV0
IEkgbWlnaHQgYmUgd3JvbmcgYWJvdXQgdGhhdC4NCj4gDQo+IEl0IHNlZW1zIHRvIGJlIHRoZSBv
dGhlciB3YXkgYXJvdW5kIC0gZHluYW1pYyBtb2RlIGlzIGxpbWl0ZWQgdG8gMjU1IGJ5dGVzIC0N
Cj4gd2hlbiB5b3UgdHJpZ2dlciBkeW5hbWljIG1vZGUgeW91IGZpcnN0IHdyaXRlIHRoZSBhZGRy
ZXNzIG9mIHRoZSBzbGF2ZSB0bw0KPiB0aGUgRklGTywgdGhlbiB5b3Ugd3JpdGUgdGhlIGxlbmd0
aCBhcyBvbmUgYnl0ZSBzbyB5b3UgY2FuJ3QgcmVxdWVzdCBtb3JlDQo+IHRoYW4gMjU1IGJ5dGVz
LiBTbyAqc3RhbmRhcmQqIG1vZGUgaXMgdXNlZCBmb3IgdGhvc2UgbWVzc2FnZXMuIEluIG90aGVy
DQo+IHdvcmRzIC0gZHluYW1pYyBtb2RlIGlzIHRoZSBvbmUgdGhhdCBpcyBtb3JlIGxpbWl0ZWQN
Cj4gLSBldmVyeXRoaW5nIHRoYXQgeW91IGNhbiBkbyBpbiBkeW5hbWljIG1vZGUgeW91IGNhbiBh
bHNvIGRvIGluIHN0YW5kYXJkDQo+IG1vZGUuIFNvIHdoeSBkb24ndCB3ZSB1c2Ugc3RhbmRhcmQg
bW9kZSBhbHdheXMgZm9yIGV2ZXJ5dGhpbmc/DQoNCkhvd2V2ZXIgIHRoZSBjdXJyZW50IG1vZGUg
aXMgZHluYW1pYyBtb2RlIHNvIGZvciBsZXNzIHRoYW4gMjU1IHdlIGNhbiB1c2UgZHluYW1pYyBt
b2RlLih0aGUgY3VycmVudCBiZWhhdmlvciB3aWxsIG5vdCBjaGFuZ2UpDQpBbHNvIHRoZSBkeW5h
bWljIG1vZGUgIGlzICBuaWNlciBvbiB0aGUgcHJvY2Vzc29yIHJlc291cmNlcy4gV2Ugc2V0IHRo
ZSBieXRlcyBhbmQgdGhlIGNvbnRyb2xsZXIgdGFrZXMgY2FyZSBvZiANCnRyYW5zZmVycmluZy4N
Cg0KSG93ZXZlciBkbyBub3QgaGF2ZSBhbnkgc3Ryb25nIHZpZXdzIG9wZW4gdG8gc3VnZ2VzdGlv
bnMuDQoNCj4gDQo+IEtyenlzenRvZg0K
