Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9733617B9C
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 12:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbiKCLfj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 07:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbiKCLfj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 07:35:39 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2070.outbound.protection.outlook.com [40.107.212.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCC61208F;
        Thu,  3 Nov 2022 04:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auDfOoxyZlQ732M5N3j8Y2bjMAWu3TnEpLDMWKHU5hf+qPUN4FB7X0hz0CZN7Bz0DVs+v084XyByJF/xwv0bCliaAtPVeWkstn3o0P/KeZXY4mEmV4C/wQ9znCx3W5ccEpFUrqW3Lsk7d1GeTJh9AxlYrEobuXz9tXjq1QBcLY7YiTeW/AqZP2rwskci2A4LPRkMZfh36UYUW4ET1VT2GiCqlXbsJxYTV+tlCbSdkv+VHCn07tVNxyK1aPBW33Rz87HfiIrU0hR2EE4J+YJUlYOF1MZ6nXHjxduBjPcYTu4lNSqLGpbFUcgQPk8dOtookqsT2ABlYTeKleU5r6REdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfEhjgOujK70qoqyHZrYQnDwhe9b/5atdEuHqgct6Z8=;
 b=hVXhHuudtUhHBlV86RNYF/6RyWafiNXLz4BBXA1qutAr6FgNodaAZDJ66CDkgPiFf6U6L748tzTNcavfyl4Py7EzJ5TgtLoJI+jhSu84nqCn4NH4Kc51Gj9k+blPvxhyU95WFgkJ6AOB5w9PSrN2rxJNzrq7DeFgoJ78UHLoyp70l1r2E1eeZmAD/MV21YQ7zzsy6hqmIe+enJZk9kxBCJl3v4L0ZE5hU3VOxuq98dFfVQrtrDonKaj3WYRnQ3Sstej5vMqmgPab/gX5IrjOYjgpngenqaLwIBTZGFS/BxwS23hE2L4doUa5V4Q35POEqTjD1W7jPJXn5aeEOCwZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfEhjgOujK70qoqyHZrYQnDwhe9b/5atdEuHqgct6Z8=;
 b=CeSLSZun7bTqglOZiilJjaDB7L6PZseW6j1WnOretqoTir37Tap64MaUlo6ZNNJ1gtyB4I73mrxcTWB14ngdkzEtFVry45iPNaJFjqx9hHuzurJtGKxlQuYNdXkqpXkwvFZTsfsHjq1VL8I7fNw7IFtIU/Qp5p0FgFVYjVlUPyVN3z9vClBZhwixTkpaq/e3E1yg/XNtvJu4Hsyw9tPkksSpzXHYjloKoF8CvPR8x76Qbds6t+tWAuCrIG+sEiOfUFtNBIXP2K1D4JyY5ezMC6cOvH3gQ75fcH8DfYvvV2IBLKIet2BxORfdaDC5QGQi1TzCN0HjHW+4wI7YHqu40w==
Received: from PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8)
 by CH0PR12MB5073.namprd12.prod.outlook.com (2603:10b6:610:e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 11:35:34 +0000
Received: from PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0]) by PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0%2]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 11:35:34 +0000
From:   Wayne Chang <waynec@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, "kishon@ti.com" <kishon@ti.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        Jui Chang Kuo <jckuo@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sing-Han Chen <singhanc@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 10/11] usb: host: xhci-tegra: Add Tegra234 XHCI support
Thread-Topic: [PATCH 10/11] usb: host: xhci-tegra: Add Tegra234 XHCI support
Thread-Index: AQHY53wo3NNMFhJmekOLN2ByXsW15K4j1nMAgAZd/ICAAu1bAA==
Date:   Thu, 3 Nov 2022 11:35:34 +0000
Message-ID: <040d3ab4-6b5e-9f55-2af6-1ba1028a4eae@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-11-waynec@nvidia.com> <Y1vblCOXOCtX/RTP@orome>
 <c33efd7e-7cb5-0933-4511-bfb84ff662aa@nvidia.com>
In-Reply-To: <c33efd7e-7cb5-0933-4511-bfb84ff662aa@nvidia.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5500:EE_|CH0PR12MB5073:EE_
x-ms-office365-filtering-correlation-id: dc914b05-705c-4b25-3147-08dabd8f858d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dtg9+c5pPy3xLycT9KC8xdmWAbEajUa0kXRzUVX08tolp5DOyHyJRaMQd7OwazQH/glhap/HwQ946tjwBWMShycxk+tDYtynuNyzmc+HFIoAT2yw2dZudhkSpoItcPO/Fl96cxfXRN1ScvGTfJDOPKAOM6Ja2zb4i4rnID4brtgMfK+6MOUFLTrZcKTMzrnvnD9GLTiyLnyVH1+rJc8mk9WIRToukzWKJvhN3SqjGX18kXIOcZc6GdmuSpS/DC24W3YcNA79nACnEuxOMX6tI2hFIqtoZ4GqhvlpU1kG3hseHh5EryT+6mB4FzEz4ZWiJVAc9yNP8VoY9gadIPdN5Rhp+Kfo7ef7b+kNrqVshnr9dd8zIYOnxPlXGV4NqgWYZmqIfcJzXu0CWK5vo1gSrTBeuABnjnP4cTXEQCmK/KWVW0YhT7haclL4TVEis/984QNYzOBplFnTf5Ux1FApNvjhgNx8wLfXtFfO5ixmmcbLz4KZqUzu6LoWhuraAU9yXJLc8gvDct4VrZVWX/1LMWA+9jVwlRJlupiOhmAvJge8GImCqzcGdIh1/xEGx62dfdZIubzIxz0lgBLSQ5gKn7xtNi7gvch2l2HzLGPBtRcRmHG/rXbxkCQsUcWKxbJf2VP2o7tA5rnKEnU1KNyWFlvBRiMi5VmwfkgbxS3FGixnDr90ZcVN1urOaH8v0Xhmkf2Cu8Eti0uXKcQRTsBXzyT0JMwBir4u66b+1ajHc9zvdfgsIUhz8P2LG53L9eNV+4Tj0l85ZzCQtw1qn6AS1BoZ8bY2FcJDVDiCymsckKVHiapRFF/s1nE27/fVjgAmrxcqq3v6kzC8mGnGQvPscQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5500.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199015)(38070700005)(26005)(36756003)(86362001)(31696002)(41300700001)(8676002)(64756008)(66446008)(6512007)(66556008)(4326008)(66476007)(76116006)(66946007)(186003)(8936002)(91956017)(5660300002)(2616005)(7416002)(6506007)(478600001)(6486002)(71200400001)(53546011)(110136005)(54906003)(316002)(122000001)(38100700002)(2906002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVo4SVkwVFd4YWE2V0pkZ3dMSm10UVVsRlAzRkJvbWxmRzExcnRxVWlJb0h0?=
 =?utf-8?B?NXZoUVNoWDdMbmViTXc5M3AxRDBaVGRsWStOSmJRV2dOUk9zSjc4NFdNRnRW?=
 =?utf-8?B?Z0U4aEVLQXduUWU2NklGeXNZQXZOZzhCNS9kbDFyazcwMkxaL1R4VnhXVjVG?=
 =?utf-8?B?c2FodWFIS0tlZmo1d3d6cjRoZDRLbDlVbXRWcjhDSXprOTdWdGVuSHQ4ODY5?=
 =?utf-8?B?b0hhWWlkT2FzM3NLR3VoRDhtMG5YVHVXam40ZHR1RGNiWjFnamVabGFrRzlw?=
 =?utf-8?B?dVJCZ1FKakFkbitheXoxQklpYk1iYUY2WEk4eWRuYzNCOGlXVElDOEhjT3F6?=
 =?utf-8?B?N0kyUlhwQWNLSHFadHU4UEpLUHBsYUR1Rkk2TXNMQ3NjNlMyWjhycjM0NXFH?=
 =?utf-8?B?RjZVdW9TNG9jUGNOYXZaZzU0S3pwR3YyOGFHc1VLUG9qRHRXaDgyb0ErVmN5?=
 =?utf-8?B?OXdLTlF2Z3lmQlBSdWYxN250NStxSWJaM2NqdGJxdWc5Ykk2VGJTWXlGRDdt?=
 =?utf-8?B?aG5Zb1J2MlI5UFZmNmc5WGZ4aTAvU21CYTQ5VFYxek51SjZSNHRIc21KdVE5?=
 =?utf-8?B?Wm1JMDFHbHVaSGpseFkvaGhFd3Arb0hMZWZWVXAzUi9pSmdHVDM3WFJEOVVB?=
 =?utf-8?B?enNXRHlyMVduNWxWdWhvamU1VnZHenZvWERPYmZWWG5VdmNpc0FQVXRBYm5r?=
 =?utf-8?B?d1RDOXBYSjc1N05GN3gzcmxOeWZ1alkxWWlxVktMKzQ3M2xYSnlVU2gybmcv?=
 =?utf-8?B?UDNYYVMra1N0ZUJRY0RWZXhIeEtsQ0VsanNnNUxEcUJULzdUWGxOeXdTSlNW?=
 =?utf-8?B?d08zclcwRzV2QWpWQWtRcEZwOUhiejdGYW1TWFc3NG9BcDQ1dmRmd0JyUmIr?=
 =?utf-8?B?b3dPTG9lQWkzc3NMWmQwWXpzSVB1Kyt4Z1FIcU5VOVRnMDViaVhqRjBBU1Vq?=
 =?utf-8?B?ODJzbm9TbGV4TGJJTVY2cU41ak5lWXRNdG85Vm44QldFSnFpbzFuMTlEZVJJ?=
 =?utf-8?B?dUdyMHVLU3diS2h3eEM2NDRTU2pweC8ySzJnK2xKbnJGbndWR2lxcTYvc0Qv?=
 =?utf-8?B?d2xqRkJZb3lkTTBFWEN3SDE4N2NVL2l1ZWljUkpRYXRicXBIVTd1RE53KzYy?=
 =?utf-8?B?aERkRVNGd1RjdWxQUjZGVU1GUm84NGtyRU1UUGhzR2R5S3VoRENtK1grSmFE?=
 =?utf-8?B?RHBQWGp1Tm1uMENDb3lIT0p3SXJLRnJRQmVla1RTVURDVExCOGppYzBVd2RY?=
 =?utf-8?B?UzdtclFOMGZDUUhUL3VQeHJoTWlMaFRDSkp4b29vdXFYUlhVVDRqMldHMnl4?=
 =?utf-8?B?V3ZabWFWaXZvZUFPUEFNTFgrNkxXaXJpNEpXd2lFVnBRTk9Jc2tNNUljVWNZ?=
 =?utf-8?B?dm5ONmlzUklSR3MwaEkxakMvM0VWcjdXK2xqYkJZWHJaWlhpai9tYXpaWnV1?=
 =?utf-8?B?dVVyOEsvUHg1RUVpL3M1c3htQWJEM0hmWUlzWDBacHppa1h2TDNVV0Ixa3JC?=
 =?utf-8?B?bXlRblRmNEcweEJOMHZUZkJ4SnRRUkFnaFBsemFwQkdKUUJHWHJLUmdXYmly?=
 =?utf-8?B?anU5Q0UrZ3Y0NXNOY1R5Ujh2S0ZBWmRtVmUvQnczRTBleDF3dG9QWjA5dUMv?=
 =?utf-8?B?a1MwZzVjTUwwZ1oycGNyWDdjclF5c2tqMWpoOGxiMnNVemNZZWpsQ1NCTFEy?=
 =?utf-8?B?RFo0enVIeHNuR0cvNkhUYUp1NWNjcDVhVzVCc2F0MlZQMXdKeHpaOG9QS1dW?=
 =?utf-8?B?OGNjT3hlRDRaOVdSS2NTOWMzemR4WWllTXZHN1AvdVEzQTFTNWhDNzR3a1Rv?=
 =?utf-8?B?L0lQcnBpYXVxa0ZVelVSanRCQTN3d2d5aEswVUZnRWRnS1A1TFkrYmNxb2pT?=
 =?utf-8?B?bXRyd3JPNGJrRG9tcU5aZ243SWErNmFYWGFhUFZ5dGFGZHlpVk5pYlR6dEpL?=
 =?utf-8?B?bEdaYmNJMDdpRk9pMmwrVnZWV0loNnk3cWoya3FQTmZHVHExcEh2UE5SVXUy?=
 =?utf-8?B?QlR4NG9DZkRubVh1NHpOSXliU1cvOCtxVHlid0Z4d1BZTEhIeW82RkV6SWhh?=
 =?utf-8?B?V1N3R0x3M09PY0Y1elhpbkI5RGxsenN4YTVtTit5OFpCLzZmL1lDTXEybDZt?=
 =?utf-8?Q?eKibF7UcN/BTAjbf+mf9rCqJM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7DDD0519E97D649A86F83476608B06D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5500.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc914b05-705c-4b25-3147-08dabd8f858d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 11:35:34.4473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVA+hfQirby87cgywXCPqC1IsMkCaYPEWkTSlQSz6KFDUaYyEN6pKWqNjyD184AqbVmRfwF4S07/XSpy+TeR1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5073
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDExLzEvMjIgMjI6NTMsIEpvbiBIdW50ZXIgd3JvdGU6DQo+IE9uIDI4LzEwLzIwMjIg
MTQ6MzksIFRoaWVycnkgUmVkaW5nIHdyb3RlOg0KPiANCj4gLi4uDQo+IA0KPj4+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IHRlZ3JhX3h1c2Jfc29jIHRlZ3JhMjM0X3NvYyA9IHsNCj4+PiArwqDCoMKg
IC5maXJtd2FyZSA9ICJudmlkaWEvdGVncmEyMzQveHVzYi5iaW4iLA0KPj4+ICvCoMKgwqAgLnN1
cHBseV9uYW1lcyA9IHRlZ3JhMTk0X3N1cHBseV9uYW1lcywNCj4+PiArwqDCoMKgIC5udW1fc3Vw
cGxpZXMgPSBBUlJBWV9TSVpFKHRlZ3JhMTk0X3N1cHBseV9uYW1lcyksDQo+Pj4gK8KgwqDCoCAu
cGh5X3R5cGVzID0gdGVncmExOTRfcGh5X3R5cGVzLA0KPj4+ICvCoMKgwqAgLm51bV90eXBlcyA9
IEFSUkFZX1NJWkUodGVncmExOTRfcGh5X3R5cGVzKSwNCj4+PiArwqDCoMKgIC5jb250ZXh0ID0g
JnRlZ3JhMTg2X3h1c2JfY29udGV4dCwNCj4+PiArwqDCoMKgIC5wb3J0cyA9IHsNCj4+PiArwqDC
oMKgwqDCoMKgwqAgLnVzYjMgPSB7IC5vZmZzZXQgPSAwLCAuY291bnQgPSA0LCB9LA0KPj4+ICvC
oMKgwqDCoMKgwqDCoCAudXNiMiA9IHsgLm9mZnNldCA9IDQsIC5jb3VudCA9IDQsIH0sDQo+Pj4g
K8KgwqDCoCB9LA0KPj4+ICvCoMKgwqAgLnNjYWxlX3NzX2Nsb2NrID0gZmFsc2UsDQo+Pj4gK8Kg
wqDCoCAuaGFzX2lwZnMgPSBmYWxzZSwNCj4+PiArwqDCoMKgIC5vdGdfcmVzZXRfc3NwaSA9IGZh
bHNlLA0KPj4+ICvCoMKgwqAgLm9wcyA9ICZ0ZWdyYTIzNF9vcHMsDQo+Pj4gK8KgwqDCoCAubWJv
eCA9IHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgLmNtZCA9IFhVU0JfQkFSMl9BUlVfTUJPWF9DTUQs
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5kYXRhX2luID0gWFVTQl9CQVIyX0FSVV9NQk9YX0RBVEFf
SU4sDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5kYXRhX291dCA9IFhVU0JfQkFSMl9BUlVfTUJPWF9E
QVRBX09VVCwNCj4+PiArwqDCoMKgwqDCoMKgwqAgLm93bmVyID0gWFVTQl9CQVIyX0FSVV9NQk9Y
X09XTkVSLA0KPj4+ICvCoMKgwqDCoMKgwqDCoCAuc21pX2ludHIgPSBYVVNCX0JBUjJfQVJVX1NN
SV9JTlRSLA0KPj4+ICvCoMKgwqAgfSwNCj4+PiArwqDCoMKgIC5scG1fc3VwcG9ydCA9IHRydWUs
DQo+Pj4gK8KgwqDCoCAuaGFzX2JhcjIgPSB0cnVlLA0KPj4+ICvCoMKgwqAgLmhhc19pZnIgPSB0
cnVlLA0KPj4+ICt9Ow0KPj4+ICtNT0RVTEVfRklSTVdBUkUoIm52aWRpYS90ZWdyYTIzNC94dXNi
LmJpbiIpOw0KPj4NCj4+IENhbiB5b3UgcHJlcGFyZSBhIHBhdGNoIHRvIGFkZCB0aGlzIGZpcm13
YXJlIHRvIHRoZSBsaW51eC1maXJtd2FyZQ0KPj4gcmVwb3NpdG9yeT8gSSBkb24ndCBzZWUgaXQg
dGhlcmUgeWV0Lg0KPiANCj4gDQo+IEFjdHVhbGx5LCB3ZSBzaG91bGQgcmVtb3ZlIHRoZSBNT0RV
TEVfRklSTVdBUkUgY29tcGxldGVseSBmb3IgVGVncmEyMzQuIA0KPiBQZXIgdGhlIGNvbW1pdCBt
ZXNzYWdlIHRoZSB2YXJpYWJsZSAnaGFzX2lmcicgaXMgdXNlZCB0byBpbmRpY2F0ZSBpZiB0aGUg
DQo+IGZpcm13YXJlIGlzIGxvYWRlZCBieSBjYWxsaW5nIHJlcXVlc3RfZmlybXdhcmUoKSBvciB2
aWEgdGhlc2UgSUZSIA0KPiByZWdpc3RlcnMuIEkgd29uZGVyIGlmIHdlIG5lZWQgdGhpcyAnaGFz
X2lmcicgdmFyaWFibGUgaWYgd2Ugc2hvdWxkIGp1c3QgDQo+IGF2b2lkIHNldHRpbmcgdGhlICdm
aXJtd2FyZScgdmFyaWFibGUgZm9yIFRlZ3JhMjM0IGFuZCB1c2UgdGhpcyBpbnN0ZWFkIA0KPiBv
ZiB0aGUgJ2hhc19pZnInPw0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpZZXMsIGNv
cnJlY3QuIFRoZSBmaXJtd2FyZSBsb2FkaW5nIGlzIG1vdmVkIHRvIE1CMiBhbmQgdGh1cyB3ZSBk
byBub3QgDQpuZWVkIGl0IGFueW1vcmUuIEknbGwgcmVtb3ZlIGl0IHRvZ2V0aGVyIHdpdGggdGhl
IC5maXJtd2FyZSBpbiB0aGUgc29jIGRhdGEuDQoNCldlIGNvdWxkIGNoZWNraW5nIGZpcm13YXJl
IGluIHNvYyBkYXRhIGluc3RlYWQgb2YgaGFzX2lmciBhcyB3ZSBub3cgb25seSANCmdldCB0d28g
d2F5cyB0byBsb2FkIHRoZSBmaXJtd2FyZS4NCkknbGwgbWFrZSB0aGUgY2hhbmdlIG9uIGl0IGlu
IHRoZSBuZXh0IHBhdGNoIHNlcmllcw0KDQp0aGFua3MsDQpXYXluZS4NCg0KPiBKb24NCj4g
