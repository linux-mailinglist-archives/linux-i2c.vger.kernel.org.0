Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02B7D59B9D7
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 08:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbiHVG40 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 02:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiHVG4Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 02:56:24 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14EC127FFA;
        Sun, 21 Aug 2022 23:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQuHLlglgQwSCwnbiKfUBgOvZl/2wBSMZGTu5eB6XYu8Pk/W/TxFmR2A/NmKtc7rmzJ+7Vv8/gddpvxl549acX3lYvmWPusraErjebJyRES87G2UOumKfngleVJla8nI1ceg0s43tWrHsmtOmiyFnIjcp6JF413Ra2raA+u35anyrP+duDrytEuymP42U57dcmKcZFfbUCN7AlfKjDwdBt6l+xhwQBDKjVcmyokubBD2TWOCXZ+sY0WszOaeYo7b8cNV7f0RKrWn0SAuYnaZaHgmrD86+YEwfsGeThmVWUOoDv6hAXnxIFNeBmHXy/0xo5qCoPhoXYOQ627AXn6cMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s9fMXdwNrnUrqTg06f+SplW05Xo+uG0uN9ALAFxXBM=;
 b=bU7vQsJd+HKQD7j1zYAJvKrp4fH0AYVxYF74x+aIdpWkZmK4WVcMbVXZ1SF1FlQJMH0uXoJfxiCKVZwp47VU65QcpeWpsoT1jT434ZLpdZHsQO7CSifLnVKBw06rJifFOQ6X3PnmDXkWWss7Fym75X8SBEd3wfBmnNtYTWHJdwplH9bA2TTJB5LjUTvvZArNgsafDIuuLSDVoLGhQ/vwmQR/dQg+wSExOdLHqAwgvdVvB5SF8ORM99J0gOCKLZA2+++SB/aULTDF2yRkEoUuNcIw/lby4qrE7QQlKD+yHMpkhpOBykJoF4gUz2o0MbjpvbIDOPu3D9YXJgvpKdXNLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s9fMXdwNrnUrqTg06f+SplW05Xo+uG0uN9ALAFxXBM=;
 b=Ih88/5dN+lwLyJMxUFv5Yrjelif9UQ0E2K1B8QMsLxCTbg0f59ltSpD20SEjhxDLPZfRT/xNgmg04ACMEt6I+uQn3MWtEkryANU6zybh/K5yBpWc9J4VTBYySjSM9unkjYBRsHiqv65NxO26ZHsWU4AbOPeV9pP5j+ifoU3BSNPmuwWJJAGF5LHrl1qsHfJaJbnQPuUB8obXCJGRt/e2dmLE9CWpwpXOX+3bZgaslD9iEY3/67YoivmQUIy/M8m+Hjrf07NCIa9k4QH6CQrqh+YDytxeQNptvxYOh1eMUv40kEcMaqWBEe2lRe9fXb9vJfPnCBmzrKU0G6l1mW978w==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by DM5PR1201MB0156.namprd12.prod.outlook.com (2603:10b6:4:59::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 06:56:19 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::24cb:46cd:5176:aa13]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::24cb:46cd:5176:aa13%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 06:56:19 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Thread-Topic: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Thread-Index: AQHYs8aKp+OlLQycOkO470/UfA2RzK22VXAAgAADTwCABBngUA==
Date:   Mon, 22 Aug 2022 06:56:19 +0000
Message-ID: <SJ1PR12MB6339FC1F82EB1BB7417E533BC0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20220819122313.40445-1-akhilrajeev@nvidia.com>
 <20220819122313.40445-2-akhilrajeev@nvidia.com>
 <20281ca7-e597-7030-4861-5f9a3594726d@gmail.com>
 <89a746fd-a98e-3147-7811-33c5051c2b6d@gmail.com>
In-Reply-To: <89a746fd-a98e-3147-7811-33c5051c2b6d@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cab91d2-eb3e-43da-1f0f-08da840b6aaa
x-ms-traffictypediagnostic: DM5PR1201MB0156:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TWJcIJr7Hg0PZmYqdT4JIp938LgsW4LZ8Cyu/6JNqaEbeDJ5LqsESDEjHUxTSsjH2qHyHZf83kDrAXPgjmZyohoxiZRgOsRohXPoy7CyUsWfIDDQTSLSWPKAENx7AWRcxWPzZWrTL1xM0vvgjOq1wEEZQVjU87d7TFJeAqF905ZB+7SV+Ksx3g34wpTzTROu0VnmKU6DHvIpNBzUrBMsrvOuZAncS+/LwxcxNlhp02hPlUPMzvWJsx9KBZ03In2L02l2P3jPx5/OfT1M1UOjbi3WL8MtldUQBVetEPZNoz975nO/gZ8+DmoQBpu1obnAVhXsD6zau1+4Euav2BmMmlMVcrEmS3H5nj80cQMvoxAeY7NgeN1PSi8vzRkxwdd+wEctZblgSJumrgOzk/O0HwfZ1/J1ZrQlICdn4y21C2MPjblsAeoR1v2h0jE4Sds0YFEkq8em0DI4ArV4+fsdhml6lo/4/b7izrXG+NP/8MSQpO8iQQG/kenyu8tfGRFKFzz1w3Ptq72Vd3LOpmuDUdcGfwgtDdP1Wsz3zwEq65diOio5NAdeF7VQhWaXMp0rIoqv5JYBiYBoPLrwxF17Jld6G3FkpCi9lLol7NeYtAronluCkrdz8QmvOFV7XPSJ45PRtZNTaanSaKxz967i793gCcYyX9K7LPtO1M54/IpvPlfBEs32fbBAaFp8OxT88+av3ESCOQbyQfVNbEVsT19hURot8XCNvL/SMFojPmktaqwpyvDCscrumNcQclBs4czQf5hjfIF2+qeZpJfk6FdKpK6ThfEPOgjW/XSBiGI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(8676002)(66446008)(64756008)(316002)(66556008)(110136005)(76116006)(66946007)(55016003)(66476007)(5660300002)(8936002)(7416002)(2906002)(38100700002)(52536014)(122000001)(86362001)(33656002)(38070700005)(921005)(478600001)(55236004)(6506007)(7696005)(71200400001)(186003)(41300700001)(83380400001)(9686003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXpYWE9WelNxRTlkNjQxQWlxWUVDeEhISDgxRHhHNE1lOHpOK2x0cnBzSThT?=
 =?utf-8?B?N01SYW10dGZ2WDc0dlp6dzZieTBLcjVtK05zamNTRjdxYys5MHZTV1VlMFpv?=
 =?utf-8?B?S200YzRUakRpdmlSakgxM2UzWGdCbXV5K3RzbmpycEw2Q2YvTXl1a2huSDdH?=
 =?utf-8?B?NVowekF3dk1Zd3RxcGhqOGl5N3NaSkN3VjNHNXlCMk5mZEZQY1EwOHV1aDVx?=
 =?utf-8?B?QkhIQU92MElRS3ZiOU85ZXhseW1sbUtuMTNqcVZjQjEvWWIraytBaThzSGJx?=
 =?utf-8?B?SFNJZjc3SFJPNk9rbGIwcEh2SEd0T3pHU3prRjJCd0FhaS81TlYwMW51RVk1?=
 =?utf-8?B?OGJtcElWTFRuT3NLem04VmUrdllLbGJzcUkyR29PSFpWSGZSZFJUL3lzcU01?=
 =?utf-8?B?elZWQ3RqYTdCZ2R5dEVVQS8rSXZReUdtWG1FUFBDWHNCeEQ0QnJrZ2drNWNQ?=
 =?utf-8?B?dGpQZVZ5Q2wrbEczd0VHMmtEN3B2aFhHakwvTHZaOE9tVGphTkpnZURmWGJh?=
 =?utf-8?B?dlJZMzdGbWdWaUZCUnFQQkVSTUdwVGVTYmFuZkp6LzRMY0VOblZFTmRZdHQ5?=
 =?utf-8?B?akR5MnQwN0JXMmpZcTJPdGFScXVqRzlzem5SK2J4c3ZrYklmdDM4NStUNUlr?=
 =?utf-8?B?T3hrMXFjdnE4VXhheENYSjN0MFZLN3dGTy9kbGxwRVFiYjNyKzR0UFlvTGJz?=
 =?utf-8?B?aytzQndEb3czck5xUUdzSE9ma3pUallFTWNzZ2h1Znl2SVI1c3RGVFRnZ003?=
 =?utf-8?B?SmU0T3ZTNGV1SUMrYldadVFORU1WMXJLYWc5RkZyM1J5LzlndWxVWU9rOTF0?=
 =?utf-8?B?N0JxN1dqQ1ByblFwSU1PNkJoNlhaakdBQmU4TmxzSUpIM0FDRjh5ZXRmQnFs?=
 =?utf-8?B?RUMwbWhxRzROTzl4SjlWaXRsK3lKY0wzcktBUllNS0h5U2dKUGpoMk1TcFhT?=
 =?utf-8?B?OUUzOTdVYUNkUUxSbkxUdEZycVlvVk9CbEE5ZHFzeHJ1djY0WGM0YWJyWFlI?=
 =?utf-8?B?aDcydVVnSHBFdWxKNURacnFSQ3d0ZEZaT3NPajk5cDVpUm1tYlZIY2ZQTEVj?=
 =?utf-8?B?Y2xqZTFaNHFuNmkxb3pIVkxqRTlodzYxenBnUGo3L2EvZjZxU3FEVnhMNDkr?=
 =?utf-8?B?TnV0RklkeEEwM20rM2RkM000eVo3QzJyTmRqbzBYb1B5YkkwY1p3QjNFU3J0?=
 =?utf-8?B?QmQ0SUNZWDdRUW9vNkxUUmcrL1AwcEpHY0dNMFVzVlh1ZlcyMUltSy9XbTZF?=
 =?utf-8?B?UmJhSHFJb0dTN1RnUDVNelUvbHJOT3k0QjArZytUcHVHMzI5TTJyd0RTWjNj?=
 =?utf-8?B?U3g2ZEE0Uk5GcnltSDJLa0U5WVFSWUVGYlhSSEp6REg0SjMxdVllbUhpSUcw?=
 =?utf-8?B?TUc5ay9HUDlZc0MrL0NtcFJwVlpNVnFia3dnTzNZbXp2eGEzVGtCTzU3NUky?=
 =?utf-8?B?TWE2VGF2ZVdJK0RhYWNpTXVKUk1wNGUzTEJjUHczVklQUE44YTlKZm8rc2c5?=
 =?utf-8?B?QmFyKzRoQjViUHBaa0VVVWwyMUNoQXdiWnExckZSRHQwVWw0c3BKY0wxK3M4?=
 =?utf-8?B?VzlidFFBTjZhaHkzcDBrUERxcllrUDdySXpxRDNvOEpSTmZZUFhDcUpJZ3JH?=
 =?utf-8?B?dmlLMWFUZkREci9wdGdlUnRUTkRRRDlNQ2F6NVM1TWNWeWcycGNzaHg4Yndv?=
 =?utf-8?B?TjZocDlicGExQW5pNllyd2dXaU4zQStOaUZoMVdpUUlPOVZtY0t6MTR1bXVL?=
 =?utf-8?B?RVhkODNMSERqWDZIUnJNMklHUlRGaGlRQzcyN3hmbHEyQmx6bnNIcUtSL2J4?=
 =?utf-8?B?dzZKZjcrVElzcnJXcHZyWlVEdnBRRmdNWTVpSHpiNitKUWVKeHNObW1BSDdk?=
 =?utf-8?B?VWhPdjBJQjExLytTeTkvS25RaFBTZE9GSHh6SzVpekxhanJoMVE4TVhZOHZB?=
 =?utf-8?B?M0dGZktBVGY4TGUrQUU1aGdobFp4QlZ4NFRxRGNwSVUwVFlYUE4vQ1J3dFBT?=
 =?utf-8?B?MWxmaEZDSHZCWlBzNTBNWk1yclAyMDdGMnNBU2pSMS9ZQk8xbW1QbUxxQkUv?=
 =?utf-8?B?bDd1UWdQeFlyVFdtTVlKT1p2bmJka296ODlJdDRpS0FRRDlvb1FncGhYUnho?=
 =?utf-8?Q?pZFDovArjbFrcIb5mSDKAs8i/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cab91d2-eb3e-43da-1f0f-08da840b6aaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 06:56:19.5230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LKEjuX61ALU6nUd81u6Z+r5qO7r07PX8P0vL427zoyub0mIRQZtfwcoOJ9hKpiGd3TQ35GItt3WnwjnWC5HjYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0156
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAxOS4wOC4yMDIyIDE4OjE1LCBEbWl0cnkgT3NpcGVua28g0L/QuNGI0LXRgjoNCj4gPiAxOS4w
OC4yMDIyIDE1OjIzLCBBa2hpbCBSINC/0LjRiNC10YI6DQo+ID4+ICAgICAgaWYgKG9mX2Rldmlj
ZV9pc19jb21wYXRpYmxlKG5wLCAibnZpZGlhLHRlZ3JhMjEwLWkyYy12aSIpKQ0KPiA+PiAgICAg
ICAgICAgICAgaTJjX2Rldi0+aXNfdmkgPSB0cnVlOw0KPiA+PiArICAgIGVsc2UNCj4gPj4gKyAg
ICAgICAgICAgIGkyY19kZXYtPmRtYV9zdXBwb3J0ID0gISEob2ZfZmluZF9wcm9wZXJ0eShucCwg
ImRtYXMiLA0KPiA+PiArIE5VTEwpKTsNCj4gPg0KPiA+IDEuIFlvdSBsZWFrIHRoZSBucCByZXR1
cm5lZCBieSBvZl9maW5kX3Byb3BlcnR5KCkuDQo+ID4NCj4gPiAyLiBUaGVyZSBpcyBkZXZpY2Vf
cHJvcGVydHlfcmVhZF9ib29sKCkgZm9yIHRoaXMga2luZCBvZg0KPiA+IHByb3BlcnR5LWV4aXN0
cyBjaGVja3MuDQpPa2F5LiBJIHdlbnQgYnkgdGhlIGltcGxlbWVudGF0aW9uIGluIG9mX2RtYV9y
ZXF1ZXN0X3NsYXZlX2NoYW5uZWwoKSB0bw0KY2hlY2sgJ2RtYXMnLg0KDQo+ID4NCj4gPiAzLiBJ
ZiAiZG1hcyIgaXMgbWlzc2luZyBpbiBEVCwgdGhlbiBkbWFfcmVxdWVzdF9jaGFuKCkgc2hvdWxk
IHJldHVybg0KPiA+IE5VTEwgYW5kIGV2ZXJ5dGhpbmcgd2lsbCB3b3JrIGZpbmUuIEkgc3VwcG9z
ZSB5b3UgaGF2ZW4ndCB0cmllZCB0bw0KPiA+IHRlc3QgdGhpcyBjb2RlLg0KPiANCj4gQWx0aG91
Z2gsIG5vLiBJdCBzaG91bGQgcmV0dXJuIEVSUl9QVFIoLUVOT0RFVikgYW5kIHRoZW4geW91IHNo
b3VsZCBjaGVjaw0KPiB0aGUgcmV0dXJuIGNvZGUuDQpZZXMuIEFncmVlIHRoYXQgaXQgaXMgbW9y
ZSBhZ25vc3RpYyB0byBjaGVjayBmb3IgRVJSX1BUUigtRU5PREVWKS4gQnV0IHNpbmNlIEkNCmNh
bGwgdGVncmFfaW5pdF9kbWEoKSBmb3IgZXZlcnkgbGFyZ2UgdHJhbnNmZXIgdW50aWwgRE1BIGlz
IGluaXRpYWxpemVkLCB3b3VsZG4ndA0KaXQgYmUgYmV0dGVyIHRvIGhhdmUgYSBmbGFnIGluc2lk
ZSB0aGUgZHJpdmVyIHNvIHRoYXQgd2UgZG8gbm90IGhhdmUgdG8gZ28gdGhyb3VnaA0Kc28gbWFu
eSBmdW5jdGlvbnMgZm9yIGV2ZXJ5IGF0dGVtcHRlZCBETUEgdHJhbnNhY3Rpb24gdG8gZmluZCBv
dXQgdGhhdCB0aGUgRFQNCnByb3BlcnRpZXMgZG9uJ3QgZXhpc3Q/DQoNClNoYWxsIEkganVzdCBw
dXQgaTJjX2Rldi0+ZG1hX3N1cHBvcnQgPSB0cnVlIGhlcmUgc2luY2UgRE1BIGlzIHN1cHBvcnRl
ZCBieQ0KaGFyZHdhcmU/IEl0IHdvdWxkIHR1cm4gZmFsc2UgaWYgZG1hX3JlcXVlc3RfY2hhbigp
IHJldHVybnMgc29tZXRoaW5nIG90aGVyDQp0aGFuIC1FUFJPQkVfREVGRVIuDQoNCiAgICAgIGlm
IChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShucCwgIm52aWRpYSx0ZWdyYTIxMC1pMmMtdmkiKSkN
CiAgICAgICAgICAgICAgaTJjX2Rldi0+aXNfdmkgPSB0cnVlOw0KICsgICAgZWxzZQ0KICsgICAg
ICAgICAgICBpMmNfZGV2LT5kbWFfc3VwcG9ydCA9IHRydWU7DQo=
