Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333F9617ABD
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 11:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbiKCKYT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 06:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiKCKYS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 06:24:18 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315D8BF59;
        Thu,  3 Nov 2022 03:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWJdtlXlCoTBiwsG6Edww0uzKR53TsaDTJN2S3iAs95YCyW+XT47yF3Pw11mQqvGMrtACY31RXXO5L0Cj58SRWL5F2bzqaoU1jCPb4I2/WaTuPM3P6QIhLwqy7mI8VXAf9CRnq/qSaHHgvHLVgOoZZWEn2Zw0nBP4Z3QiM7RjEBgxb3amJnVsi0oqfVX5DE8gdG6uJ/Z8LLtvNlspKu1AM/6ueWWOxUalbfsaMp+d7sjZ0BMwhuT5br0KjfGFNbg5v/6OrqZzjRRkRRJVLOS6MBC9YEMqTuzNxFaEHlUmvdoYhZIJnMlPLBrdaqdA6/nr8kQFEDqpNVQmQiWFZoKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/1iHN4VZlPIKFDRLvJkaPw3mkWuvPfYo9DwHrSBvYQ=;
 b=ankLjlVNns58hOD2P4oNoTZlXK+7tAT6RQCbFKPzD3ZjSfPphiWfBnerp8KX61ON9y/v5Pp2LPYCghkkbsoQAxjIU1VHeq/C3kHCMXmE0/5H3AUg0HjtSioiDiPJKva+f31F1fLPZ9s4XmjlFnzsVGG87UT13sg0iGoBTkYN6N3XQdPngQrktiC6zvfgSGVlJ3geEvqTnUMNfi+e1azkuzDJazMm69IeUTOq7PkmCnwyOKqbmxIa20qsGR/waMmljvD5zueBX0cv45xMTNhZFEyPdZx9f2Z+2ZggPPFlRcHJL7oJBflva6k031NFeqJ2CSTW+uy7JCG5Pgwq158Q4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/1iHN4VZlPIKFDRLvJkaPw3mkWuvPfYo9DwHrSBvYQ=;
 b=RT9TKIk0VLNuMdgM/4qQckUrcFqR1rigBgwLdm/KE1Jjdcwn9s+6W6pBVwZfN1FMJ/MI5G8nMKnoGNUZE2Gq1egjp4i4CFEmDEkLuMhIsgmAqxg6DluAcbvZTn9Z44NFKQHmUH3HFBaGn4Q79hVw5ZZoF9+rNEBEKwqMh0ibFlwS9U7mUyM3Yhx9RfyKvScolr9+X83sTUZ+5UWIfZZ1W/A+Lly19r3WeFKTL8Jk/VDH0dkNZPVTWCErqx7hVAu7qF2UWZawg4x+AiViBwwTKkxy46tWhyJ/7XwnnW+JVB5v8hLI9/RZneuxsSwvvp140Akh8IaFprhuXJEXeDCflw==
Received: from PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8)
 by DS7PR12MB5983.namprd12.prod.outlook.com (2603:10b6:8:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 10:24:15 +0000
Received: from PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0]) by PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0%2]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 10:24:15 +0000
From:   Wayne Chang <waynec@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host
 controller binding
Thread-Topic: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host
 controller binding
Thread-Index: AQHY53wSeiP7yeQj9UuxV+ObPcDsxa4doiUAgAEfCwCABFdjgIAAds2AgAAcogCAAAZPgIAJW42A
Date:   Thu, 3 Nov 2022 10:24:15 +0000
Message-ID: <69fdd3c5-7215-f34e-5b9e-5c18fdf6a0e2@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-3-waynec@nvidia.com>
 <20221024145446.GA1763588-robh@kernel.org>
 <52ae737e-eb4f-9eb7-8b79-d58251062276@nvidia.com>
 <f5d2c979-a61c-e0d4-7a08-5b6f5b38dffb@linaro.org>
 <c8039494-9fb7-c72e-a852-8bde13c0a61d@nvidia.com>
 <8194796b-9845-cd02-a542-0bc0d66b4617@nvidia.com> <Y1u9RUv8twZF9uwm@orome>
In-Reply-To: <Y1u9RUv8twZF9uwm@orome>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5500:EE_|DS7PR12MB5983:EE_
x-ms-office365-filtering-correlation-id: c1e1d6c6-cdeb-4840-537b-08dabd858ed9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: moF6fFzSUuM3PnuVcryLXacVpozTJ84YWHnd79122wA3axUChZouZV93WogTOmBBGK2vSOi2pncKV3U4mruUrtX8XfrtrZI74l/xot8HWzRrvEDJi03rqCLL87SU8JHHPJAHjMEJmaetW8CKvsLj/YSQ9v9WATbRZQQkDRfNIal8e7qzC9sD8z0JPOZh4FafHLqZGKTIeOTBwFUI3KoOy90K/l8X1cN3iVrn/ZqTWg2BuBhk1ZGtgZPQb75oJPI713u3nEC1gW2FrQC5fW/v6aeTWjH8gpNBDy5iWmljRz1dC+NTejH4ALoRBWkTKAeK3nksAxqIez6AeL3pK1VAofg0W19Ny9pLKmNk5xaXZ7H3Ra1a9YzmkTJyXLJCcBZ5pRJeXGxFke65jJcDDjHL/+7D3aYIzWOchlxFEGVyj0sxqjxUeHzLEQCXDt1JGNzAQ1QyeNxtqP7NyFWPW0RG4aKQVgIc9xosKRcJCSx8G0o2HgTCeelsqReW3amNJEYNhrVzRVph/Jr02IwRX5/Qx533MQz+jp9KziPUZWY7er9XGSBnC4uKiZp2rvtvZef3epRjJZEwRGsse2puIjdHNE7JtlsVo13j7EOPqwHZcIo+Yq8QxUCQYWPo04Ck8XPgjgFSHwBIF+XXmtAiJ/Thx0QRgVWDUDw/ItIWZsPktWVtAer47/KracMFy+QVem/BLLG605BVwVrGTLUKLAeJU+G6lrvrMcQYeabuBciMMvF+Pu75llALIWyuhOUVXvtKEbTLUqdt493ujHNKt5w/vkOAG4znfZqEvJBO8cSF/RO1oRETSnv2FY9ihk/3duz89oeTcTyxrFYcbG3/kdIhIVZwYO/ckhx/odFyIjQlQd1WHmxZbL0bOWb8p/1gSWChJCSrMPz0o2GUnOTe5cJDKiuGTav/cs5WMF7/tFmMobE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5500.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199015)(36756003)(2906002)(38070700005)(5660300002)(26005)(86362001)(8936002)(186003)(2616005)(6506007)(31696002)(71200400001)(66946007)(66446008)(122000001)(6486002)(91956017)(7416002)(478600001)(8676002)(6512007)(66556008)(54906003)(4326008)(76116006)(66476007)(6636002)(41300700001)(83380400001)(64756008)(110136005)(38100700002)(316002)(31686004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjlBOXZ3bDA4WE4ra3ZqZk9SNk5Pa3lZTFRKRk96eEJUR3pSTDNjRzNSYjZB?=
 =?utf-8?B?MmQrcHY5M0FKdWZSYkY1OENFWHlMQUNNcDlWTUVZWkhTR2dMT1kraklWMWk2?=
 =?utf-8?B?UklnL1VNQVVnekFmN0VOK3RmY0ZkNUpRRjBOQXhpQ3JvYlRlNHpjOTRieG5q?=
 =?utf-8?B?Tmh4cWR5dUFTSHJLZkVqM2pFbkRVclZCVy82dFZrWnU2QlJ3U2o3SkNFeFJX?=
 =?utf-8?B?QnA3MzlITlRkTjAxOCtuMnJOVkNQbEJmZit3a2JaUlFHZ1hZMGl4QWRaTXRh?=
 =?utf-8?B?Ym54YndpWVQzdzZuRmlYNTN4aG9qbXNIMFBRRUplRmhDUUZOOXUvamJQaEE0?=
 =?utf-8?B?Um1SZWcwRU5YV0xtZ055bStGWkprNkJ0RFMvd1IraTRLNStJMk5qWit3cHdH?=
 =?utf-8?B?bEtLN0RvdkJvajRsZGxFUjlTd3k4WjN4a2ExZlRXc1dBZnppVisrTkVnTnVm?=
 =?utf-8?B?ZUo1dGJsdlhOQ0k1TVgzQTRzNjR4OWtMVStEblgzQXJmN0ltWjJKWjFLalMr?=
 =?utf-8?B?eForZ1lRdTladnhGUmc1YnBhNXFmVTBLM1BsRTFlMHg5R0NwOUtnd1cxZzZI?=
 =?utf-8?B?OHpQZ2tjS0pjMWk5V2l5NnEyeEpydEhPcVA2REE0STZpTFF5SldQVlpaRWtP?=
 =?utf-8?B?MW1OanF4SndibFVoUVBENlVjNlU2am40WENjTDNic0Eza1l3MkpUUzhaaEdL?=
 =?utf-8?B?Y0RiMjRHZTVaQ3Fkc2JPcThObjVRdnpGMUh0dkdTMW1sY0tGMlNnTnBuaURK?=
 =?utf-8?B?MThLT1ZLNEtYZTk5czVIUEErZlptclpRWEowZWQ4SGZ0eDJKSCsyRm5sZ3pJ?=
 =?utf-8?B?aEVtdVp3QWNiN3N2a1h5RGFreE1obEVRU3l1ZUxOcElpR0xrQnJFN1hwU1VG?=
 =?utf-8?B?aXVoOCs4V1VwbU1zV1FseUMvMmVKbXFXWUpKbHIxUnk0bkk0NG43eFFLK0Jk?=
 =?utf-8?B?WjIwLzRXWTJNYjVhaHpKSXJoQVNxdjZVYmpLcUZVeEgwQUhrZGR5d1ZaMkcz?=
 =?utf-8?B?YnhrdlBISGJ6cHc4d2R6UkdobC9naVJ2QUJQY3RzODdVVDlaZGhhREk5MGpR?=
 =?utf-8?B?emJZMmZ3aGNHVkxOVTVDMWFnd2lPU3hRUWp2N1N2clVTQ3pBRHM1MGxQdHkr?=
 =?utf-8?B?NWdOTUYzR0JyUXV0WFcrMHVUa21oMWZ5Qk11TUxjMlRmTzJSZUlrZDN2OVhu?=
 =?utf-8?B?bEtLaUhTSm9KOU1QcDNLY3dObHJ2TmdCTnhNYlkwd1RnNmUvd09yM2RWWndC?=
 =?utf-8?B?RC9Pd2tVMnEwbHljU3RyNkFRM2VXQ0xFalBLQVpEWVZzRU53UkNBeGlISjNn?=
 =?utf-8?B?Vm1BNFZSZTRZTjMzd1RDOWRyM01VZWc2b1N5dzlBSjlsY1U3VFZRaDVPSXJS?=
 =?utf-8?B?UFhRRmhxT0VRcG9FTEtpT3VrY3ZZQ0J1TGE5VkdFZkNqZFA0OWVMbVBIYnM5?=
 =?utf-8?B?bVVhVi9peG5xTHdZaXY1b1pWMEFqZG5oN2RDUEtOaFJmNjM5QnlHMEhjTDZG?=
 =?utf-8?B?ejdMS25Xb3d3UXAweWU2bVRjdnVmQ0k4bERhQWRFL2tMTmlTSXBVUGliNEF2?=
 =?utf-8?B?aTR1Vkp6endheE9KeXVaNWNVZ3RMamltQjhwL3V1Tk9vVnV5cThkSnpoalNT?=
 =?utf-8?B?emhYNGpQeU43d2xCdmxmZXp2WFVLVUROUjdib2NxdDg1OG5BRUU1MmlrSCt6?=
 =?utf-8?B?NHFzdnNMQ2NpdWJYa2x1eG9xYjltMFhKZnZqWkp2Um02ZVRSekRBTy9sNXdp?=
 =?utf-8?B?RC9JQytDOWFiQS9hektoUVRNUWYyZllCRU9FeVNnTWErV0V3S29qLzJHZUNl?=
 =?utf-8?B?TXVEdXNFRVdLRkZBeFdaU1ZsVXVEaDNWRmRyN2xGbzc5TjlrOEFCZTh2NGFB?=
 =?utf-8?B?RGhidk1Wc3RjeFZXaFhYWXdTazdVZ0syME9ZcStkUDZSeU5BQUorZlYwOVIr?=
 =?utf-8?B?T1dXclZDQmJOUUlQNG9JRFJySnFTK3A3WE15bjBjV3paTFROQXVXR3VuUFUy?=
 =?utf-8?B?NkMyMVJzbVB1cXY0R1JyakFXbTRqUW9OekpXK0lKSjlndUNWaWp6WFVNZ1po?=
 =?utf-8?B?Nk1xbVdwV1JGRkk2d2VkUjc0SFhiNlgrbE9GQ0w3M3JOZVJCZkozOHpsaGZz?=
 =?utf-8?Q?+sV/h7/LAtb+Ybzm3s0fkO+pZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C3D3D3295041D4AB6A2668B7F1E5C66@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5500.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e1d6c6-cdeb-4840-537b-08dabd858ed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 10:24:15.1097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yWY7/OT3lDkPBNeZ8MfcFzxJOsyi+ZoZbV/ouEWzE583DYvEUgLsalY8LTx+pb7orZADVFNZf4xYLLheGS1z7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5983
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDEwLzI4LzIyIDE5OjMwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToNCj4gT24gRnJpLCBP
Y3QgMjgsIDIwMjIgYXQgMTI6MDc6MzhQTSArMDEwMCwgSm9uIEh1bnRlciB3cm90ZToNCj4+IE9u
IDI4LzEwLzIwMjIgMTA6MjUsIEpvbiBIdW50ZXIgd3JvdGU6DQo+Pj4gT24gMjgvMTAvMjAyMiAw
MzoxOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4+Pj4gT24gMjUvMTAvMjAyMiAwNDow
MiwgV2F5bmUgQ2hhbmcgd3JvdGU6DQo+Pj4+Pj4+ICvCoCBwb3dlci1kb21haW4tbmFtZXM6DQo+
Pj4+Pj4+ICvCoMKgwqAgaXRlbXM6DQo+Pj4+Pj4+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IHh1c2Jf
aG9zdA0KPj4+Pj4+PiArwqDCoMKgwqDCoCAtIGNvbnN0OiB4dXNiX3NzDQo+Pj4+Pj4gRHJvcCAn
eHVzYl8nLg0KPj4+Pj4gVGhlIHByb3BlcnRpZXMgYXJlIGNvbnN0YW50IGFuZCB3ZSB1c2UgdGhl
IG5hbWUgdG8gZ2V0IHRoZSBwb3dlciBkb21haW4uDQo+Pj4+Pg0KPj4+Pj4gIMKgwqDCoMKgdGVn
cmEtPmdlbnBkX2Rldl9ob3N0ID0gZGV2X3BtX2RvbWFpbl9hdHRhY2hfYnlfbmFtZShkZXYsDQo+
Pj4+PiAieHVzYl9ob3N0Iik7DQo+Pj4+Pg0KPj4+Pj4gIMKgwqDCoMKgdGVncmEtPmdlbnBkX2Rl
dl9zcyA9IGRldl9wbV9kb21haW5fYXR0YWNoX2J5X25hbWUoZGV2LCAieHVzYl9zcyIpOw0KPj4+
Pj4NCj4+Pj4+IHdlIG1pZ2h0IG5vdCBiZSBhYmxlIHRvIGRyb3AgdGhlIHh1c2JfDQo+Pj4+IFRo
ZXNlIGFyZSBuZXcgYmluZGluZ3MsIHNvIHdoeSBkbyBzYXkgdGhleSBhcmUgImNvbnN0YW50Ij8g
TmV3IGJpbmRpbmdzDQo+Pj4+IG1lYW5zIHlvdSBkaWQgbm90IHVzZSB0aGVtLiBJZiB5b3UgdXNl
ZCB0aGVtIGJlZm9yZSBiaW5kaW5ncy4uLiB3aGF0IGNhbg0KPj4+PiB3ZSBzYXk/IERvbid0Pw0K
Pj4+IE5vdCBleGFjdGx5LiBIb3dldmVyLCB3aGF0IHdlIHNob3VsZCBkbyBoZXJlIGlzIGNvbnZl
cnQgdGhlIGxlZ2FjeQ0KPj4+IGJpbmRpbmcgZG9jIFswXSBhbmQgcmVwbGFjZSB3aXRoIHRoaXMg
b25lLiBCdXQgeWVzIHdlIGFyZSBzdHVjayB3aXRoIHRoZQ0KPj4+ICd4dXNiX2hvc3QnIG5hbWlu
Zy4NCj4+DQo+PiBUaGllcnJ5IGFscmVhZHkgaGFzIGEgcGF0Y2ggdG8gZG8gdGhpcyBbMF0uIFNv
IHdlIHNob3VsZCBmaXggdGhhdCB1cCBhbmQNCj4+IGluY2x1ZGVkIGluIHRoaXMgc2VyaWVzLg0K
Pj4NCj4+IEpvbg0KPj4NCj4+IFswXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXRlZ3Jh
LzIwMjExMjA5MTY1MzM5LjYxNDQ5OC0zLXRoaWVycnkucmVkaW5nQGdtYWlsLmNvbS8NCj4gSSBo
YXZlIGEgdjIgd2l0aCBhdCBsZWFzdCBzb21lIG9mIHRoZSBjb21tZW50cyBhZGRyZXNzZWQuIEkn
bGwgZ28NCj4gdGhyb3VnaCB0aGVtIGFnYWluIGFuZCBzZW5kIGl0IG91dC4gSWYgd2UgY2FuIGdl
dCB0aGF0IHJldmlld2VkLCBpdCBjYW4NCj4gYmUgaW5jbHVkZWQgaW4gdGhpcyBzZXJpZXMgYW5k
IHRoZSBUZWdyYTIzNCBhZGRpdGlvbiBiZSBhcHBsaWVkIG9uIHRvcC4NCg0KVGhhbmtzIGZvciB0
aGUgaGVscCwgVGhpZXJyeS4gSSdsbCB1cGRhdGUgdGhlIGJpbmRpbmcgYWZ0ZXIgeW91ciBjaGFu
Z2UgDQpnb3QgdXBkYXRlZC4NCg0KPiANCj4gVGhpZXJyeQ0KDQp0aGFua3MsDQpXYXluZS4=
