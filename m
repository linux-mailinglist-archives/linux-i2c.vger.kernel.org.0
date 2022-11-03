Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4145617AE0
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 11:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbiKCKgs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 06:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKCKgq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 06:36:46 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C35101D5;
        Thu,  3 Nov 2022 03:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVUraGacgndWs6y8PdXNQsyLehXJEUfVcxHhyu/ApdpaBJMG8bphNHg/0um11E+ouponTt39PaUB9YQQ96cbUqROvWjlm++hoEb/YHldS9VfK3Bb5VzWYEMqjZrAOhqA5N6dh76y7nC/BbMB+zRH2mOwhTkWgAfXgOS4cMxp1sxXj2K/fduUjO0imuJImU4Bhm7lX1ZtplpKnLaiirstV+BUfHD11dohoUya/ICG5Wv/CaDsa2FwELcvzkfBdjbGyiP1aln1C2c6bbFeHcObPhd0TwjP+C/LFdbzFo8V01MVytpzStLOqg5M22QQi7V7i6QFnLlnXgty4uFT7C+Lyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7mpgQ9mcpc+vQSFk8LBb2AV/bzfoTBi8kVt9Vlq4NU=;
 b=T6VSXv8Sn3wMbJYaRuXjbJ0Dz5pzDkUISkU9omp4XCdjB4J1DQPyxuivmdoydJ7ZQvIqhV0fVxD3GQC/bcStdXGVV4H2vLaqEKg8IQbl+JFItdl6aXhlhD8Y8lKV42x9yZelolwqbLVSg+uqLXIMw2+d55pPKZ2soU/ZY7SlNpoHdDrdLDXeaZmokEhvMM5RMBgsjzsoc71BpPDO9noIAQb0O34jfhG6dIU0BZmAeRCqQa/v3rJVRRWqTM+EBNXOyAhZF1N/vyP8f+yUgRb5mzpljNOQ79uvxuPzTJkB58aXphs5k1umRGQj0nYloesVVRiMTDEWFmTPEAXgkrApKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7mpgQ9mcpc+vQSFk8LBb2AV/bzfoTBi8kVt9Vlq4NU=;
 b=Ba1VSQrYH9sFdlv0d97Ab7EvfXOTiA3ZpD6iQwqkI3m6gAbPOHWGUKQ2UI8shtueFyVCF9zeyu3opiFTdZM0t3n9ySvXByO09kQA+l9HUcgLK6pWTvxsZQJzNjXsG2Mj3U94K6xGF/ehlKdpDM1D5/nKMvfV8DND4CiVVZy/036PUvmTmCN7whDR+llntOwRj9TK1bLkhoZJ4rSuiLBE1XnYGOrgT602IMhP8J3ivlftmBzQfNeYTXb2OexbvcBgCUWw11tFlVAnppaAoauNbyFrjihAXC09ltDhysnh8rcEGnw4qV02uvit7XsaliR2wY3YF3hZY0z02UicRf/u+w==
Received: from PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 10:36:42 +0000
Received: from PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0]) by PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0%2]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 10:36:42 +0000
From:   Wayne Chang <waynec@nvidia.com>
To:     Rob Herring <robh@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
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
Subject: Re: [PATCH 01/11] dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB
 controller support
Thread-Topic: [PATCH 01/11] dt-bindings: usb: tegra-xudc: Add Tegra234 XUSB
 controller support
Thread-Index: AQHY53wQnDjvju/CBECRVhiE3Sqmja4fwvAAgA1OaYA=
Date:   Thu, 3 Nov 2022 10:36:42 +0000
Message-ID: <159abbc5-495b-4329-0b44-858fbcca7124@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-2-waynec@nvidia.com>
 <20221025232440.GA3430479-robh@kernel.org>
In-Reply-To: <20221025232440.GA3430479-robh@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5500:EE_|SN7PR12MB6813:EE_
x-ms-office365-filtering-correlation-id: ddb609fc-7110-41cd-4ef9-08dabd874c72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: He+rZmyt0DyhpDLsllk6lM4XHwhQA1/WpOVfS01lEawiIEE/FiwmzDMQ2Qrost0bo9/O2p8itdTn15Q1JOLgOmrlxfvpsa6RAdvuCf+cZBja/cxEQ3LY6PkPBvADPkiKIyITt0XoCugoW+v635FTNaSmVK5kJztaZxVRVdF44iO0X3dAvik6QBZiBXSZsALnpxXjX+0v/u/YTUDxjZ3NZAp5eL75ya+PzFD+Rnf7DsPYyTiOKMUE24uxVN4ALysIyXyTsISoRCI+rnHVMOVo6G94jbxPlZy2Po80XG7ux8HJHbWwNlScBuVP1rEd5oki0DOG5OIzRoPazYDeE6dEKgt0jhOngo6Jx823Q55/cbqsWe1TcnmGfi6liZ2aJGIloSBevsAQ8KX5NmWhuW5A+BWsCRzc7ATJVrynSkvUHOk/bnf0y/DjxekKBOqx6fFe23yaqRVs7297mUV527+yqEMrk0kCrYF0JLn39TaeIrH6zRw63M57kXa0PRiatiN4yd4p5iuF9UItCQls+RwxL+H4XGkiXL7KVRnq6+ghi2GswPyaKUJTCLCRUJH1PmaaVeZjRW+em0VhJ7adr7c4unqw3WngrYFcnsRrlZHQ+tvmire/u+a1mFQowHkkupMaZrRH7c/nfZ7BT9FzhxbrLTT7xMkk0C4stZXW4QLXnjCUwsedQVA6NPzskBngHl1g61bUB0JC5p/axUas3x8Ls+gdzL2Z+WBcYeflOwqzITnQVXmsPynshPLVgBvEUUZiHjyEGSgJpUCBVInE4gIxYPCfzNCifv8sd39ZMTfStoMysLa2HrldeHs3YI/LWK+SDvZ5zorVQXcxXf9xOE8dHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5500.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199015)(71200400001)(478600001)(6486002)(38100700002)(122000001)(31686004)(38070700005)(54906003)(6916009)(2906002)(316002)(8676002)(186003)(4326008)(66446008)(86362001)(91956017)(66556008)(76116006)(66476007)(66946007)(6512007)(26005)(36756003)(31696002)(53546011)(6506007)(64756008)(7416002)(41300700001)(8936002)(2616005)(5660300002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUZUQmZLVVE3OXNWUVN2TVBmK1d6bk9kOFliTUEzNDBZNTBhMXpic2QxMGll?=
 =?utf-8?B?VzY5NXdvRWprbS9aTXBSWWlqVEVDQndoazJ0aU5kYW5qNnNickRpN0RoWWU0?=
 =?utf-8?B?YS9CN2U1MlNOT1FNbmM2c0RVdklwVGFZS3dreXdwMUVQQzIvL2I2NGRVU0lu?=
 =?utf-8?B?MzNrbzhvNGliUHZnc3o1VEtwWUtxZUI4MEF4aWxsOEEwZytwcjJnemo1ZUkr?=
 =?utf-8?B?ZXBVNWlIalBQcC8xT1plRVQ2ckluN0tqWVdMbGhGWFdSaFdQUExRRkhhUnlT?=
 =?utf-8?B?dTQ3dkhCYk9PNWVob2JEZnNMNVFwWXNBTDJzRmhCc2RMWlFEL0JCbG5FdUFT?=
 =?utf-8?B?QzNlWXIxc2RMbCtMMExVdmZ3Q1ZDR1YzQStIRWpSRFBNcUpwMkh6aEFDS1Bh?=
 =?utf-8?B?YTZNRzJITmVHajNtYkRvaWNWdHFPSFJTcVZmaDJOUnNPZFd3US9TbnlUMWxH?=
 =?utf-8?B?dUM0aFMvYURGTkNwcUcxY2JwN1JhNkQxNmhCSm80VG4zREhUNjBSQlJFMkFh?=
 =?utf-8?B?eFJjcm9DV21lWmR3VE83K3Bnekczdi8wUlpuaFAwQ2NrVkU1THlEOU55RnJE?=
 =?utf-8?B?ZVcvaTBuN1pzZWtwN0J3NzM0dktIZUg2WHlzS1RKZEZWYVBYa0hzM2EwSzdY?=
 =?utf-8?B?ZFZlcmtOSkxhL1dtZnlIbndrcEJkTm9BUFNYM1ZYRTRoZS9aNkp1TzhZVlQ4?=
 =?utf-8?B?Tjk3eVM0UTEvU1djVEVBcVZXQnFJVVhnVnp6eERCN3ZrMDllMjBXa3l5SGNy?=
 =?utf-8?B?eUZyY1dLTjBYRnhzNjd0dTdmY0UyNnc3ajV3RWNJdVRJcFRsbXdBZXFYeHIv?=
 =?utf-8?B?OUdUV1BMMUcwRU50QjZ4anljMUZHR2M1dE9tdmxjQW53bGJSamNVQ09Oby96?=
 =?utf-8?B?bUs0NDlTRVRIUDdLUkRRaE1GSHc2OWUrYVFUczdWQVk0VDdCVmMybnNrWlhy?=
 =?utf-8?B?bHZDSlpIMDNYRWFXQ2x5T1Q4OEkwR1FBTVp5aXZPbHRIY1pvbWQweGFZSlds?=
 =?utf-8?B?WlBzbTdhOTZ0cUU0WHVZaEJ3MWVNRStoR3lqbllNRUdaQjZ0eHNzbG50SHFo?=
 =?utf-8?B?MjJmTStFdnRMMXMwU0hjQjkwVmt0Q2liRmRmeEsxYUE4b3M5SW1DanI2WEl0?=
 =?utf-8?B?UkVkaUtHQ1lpMUVFSzF5RXVtWHVHenhNVXdqQXdaREVnNU5xWHlFVHBaRXpT?=
 =?utf-8?B?RTZKS1F2cmIwSFdxZ3dibExRdVBmMkFqZ0MyMHFuMWdEWkgrOHJzdXcxNHhT?=
 =?utf-8?B?RjJ6OUhURThhS21nZVQrRjVteVVTTjhsMzJlMnpyd0w3VUx3MnBhdllxTXJK?=
 =?utf-8?B?RDVRMmdCd1A4MEVaQitiV1JYdXptbFppU2FWYTF3enc0N0w3ekxzb3BPbWhL?=
 =?utf-8?B?dmFTY0ZKSmdvYnNsUTFmMHp1WUNhcjQ3MldKdFl0N0xta2tmaThRbUh6ekd5?=
 =?utf-8?B?Z2V6U1VTRncybUtaQU1naWIxNW4vZ21TOUZCZjlqcGluaVBtQ0tWc3RxcUcz?=
 =?utf-8?B?MGgzSWV6eFpZNVJYdTZlVWFIcDUwdmpXOVZUY3JiOWFjbGsyNG9iQlJGeU5q?=
 =?utf-8?B?dzNjMWpMelRFSW5tMSt5WUNWTVZ0QXhvL1FvaGlxSGdqVWpIN05sVlBLaGFW?=
 =?utf-8?B?TWgvRUtKSFh1SUJXQkZwSGlTNzR1WmdWTm1IZkhPWnhXWDJQRUdyN0srOXpp?=
 =?utf-8?B?dUpacGp4RklCMk10SGJMNTZwbFY5cGxuMjdaRGhKdjgwOVhqT1NROTZLb3M2?=
 =?utf-8?B?SjN5TW5sUzBlTlhmL3pNL1RQYXJWRjJwcXYrMFArTjhBN0FqRElYT01rTkV1?=
 =?utf-8?B?cVAvQnRWUnY5amM4VjZXamVqY3NPVEh3NlJNYlQ0TU1Rd0VBNjYvZ0pMTEk4?=
 =?utf-8?B?dk9QZWtxLys3RkN5REhoRVBUblIwN1RQRWxkSnNFbldKR2txZ0dabEVWREkz?=
 =?utf-8?B?cnpJbWxKNzdST0J0d1czcVgvak5nMGhCZ1NNREkrMHNEL0tJdkRMT3NVbkF0?=
 =?utf-8?B?QlBpVVVVL2pCdmVrUkpkeDN1bXdqc2dOVldFQ241ZS92eW4zMXpnck1YcW4w?=
 =?utf-8?B?SHo5OGdaUDBSQlV4eW9iYWxXTTgrWWhpZ0ZxaVJEampzYllROXNBK3ltbWtY?=
 =?utf-8?Q?Qg5RA6apQR+J/QGKriw7qXRIV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4155ADC02B2F4468881E2B82B6D25B0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5500.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb609fc-7110-41cd-4ef9-08dabd874c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 10:36:42.6984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PVQlaSiLsUfg6JMUhjeUaOZ/AYRVwvHuSATQpQR7BA/GQwZQX0s+2VJyWSxObPs1Xz3Adj5NWHkFkAg3mpraOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDEwLzI2LzIyIDA3OjI0LCBSb2IgSGVycmluZyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1h
aWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMNCj4gDQo+IA0KPiBP
biBNb24sIE9jdCAyNCwgMjAyMiBhdCAwMzo0MToxOFBNICswODAwLCBXYXluZSBDaGFuZyB3cm90
ZToNCj4+IEV4dGVuZCB0aGUgVGVncmEgWFVTQiBjb250cm9sbGVyIGRldmljZSB0cmVlIGJpbmRp
bmcgd2l0aCBUZWdyYTIzNA0KPj4gc3VwcG9ydC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBXYXlu
ZSBDaGFuZyA8d2F5bmVjQG52aWRpYS5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2JpbmRpbmdzL3Vz
Yi9udmlkaWEsdGVncmEteHVkYy55YW1sICAgICAgIHwgMjQgKysrKysrKysrKysrLS0tLS0tLQ0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9u
dmlkaWEsdGVncmEteHVkYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9udmlkaWEsdGVncmEteHVkYy55YW1sDQo+PiBpbmRleCBmZDZlN2M4MTQyNmUuLjUxN2Zi
NjkyZjE5OSAxMDA2NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy91c2IvbnZpZGlhLHRlZ3JhLXh1ZGMueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9udmlkaWEsdGVncmEteHVkYy55YW1sDQo+PiBAQCAtMjIsNiAr
MjIsNyBAQCBwcm9wZXJ0aWVzOg0KPj4gICAgICAgICAgICAgLSBudmlkaWEsdGVncmEyMTAteHVk
YyAjIEZvciBUZWdyYTIxMA0KPj4gICAgICAgICAgICAgLSBudmlkaWEsdGVncmExODYteHVkYyAj
IEZvciBUZWdyYTE4Ng0KPj4gICAgICAgICAgICAgLSBudmlkaWEsdGVncmExOTQteHVkYyAjIEZv
ciBUZWdyYTE5NA0KPj4gKyAgICAgICAgICAtIG52aWRpYSx0ZWdyYTIzNC14dWRjICMgRm9yIFRl
Z3JhMjM0DQo+Pg0KPj4gICAgIHJlZzoNCj4+ICAgICAgIG1pbkl0ZW1zOiAyDQo+PiBAQCAtOTAs
MjEgKzkxLDI3IEBAIHByb3BlcnRpZXM6DQo+Pg0KPj4gICAgIHBoeXM6DQo+PiAgICAgICBtaW5J
dGVtczogMQ0KPj4gKyAgICBtYXhJdGVtczogOA0KPj4gICAgICAgZGVzY3JpcHRpb246DQo+PiAg
ICAgICAgIE11c3QgY29udGFpbiBhbiBlbnRyeSBmb3IgZWFjaCBlbnRyeSBpbiBwaHktbmFtZXMu
DQo+PiAgICAgICAgIFNlZSAuLi9waHkvcGh5LWJpbmRpbmdzLnR4dCBmb3IgZGV0YWlscy4NCj4+
DQo+PiAgICAgcGh5LW5hbWVzOg0KPj4gICAgICAgbWluSXRlbXM6IDENCj4+ICsgICAgbWF4SXRl
bXM6IDgNCj4+ICAgICAgIGl0ZW1zOg0KPj4gLSAgICAgIC0gY29uc3Q6IHVzYjItMA0KPj4gLSAg
ICAgIC0gY29uc3Q6IHVzYjItMQ0KPj4gLSAgICAgIC0gY29uc3Q6IHVzYjItMg0KPj4gLSAgICAg
IC0gY29uc3Q6IHVzYjItMw0KPj4gLSAgICAgIC0gY29uc3Q6IHVzYjMtMA0KPj4gLSAgICAgIC0g
Y29uc3Q6IHVzYjMtMQ0KPj4gLSAgICAgIC0gY29uc3Q6IHVzYjMtMg0KPj4gLSAgICAgIC0gY29u
c3Q6IHVzYjMtMw0KPj4gKyAgICAgIGFueU9mOg0KPj4gKyAgICAgICAgLSBjb25zdDogdXNiMi0w
DQo+PiArICAgICAgICAtIGNvbnN0OiB1c2IyLTENCj4+ICsgICAgICAgIC0gY29uc3Q6IHVzYjIt
Mg0KPj4gKyAgICAgICAgLSBjb25zdDogdXNiMi0zDQo+PiArICAgICAgICAtIGNvbnN0OiB1c2Iz
LTANCj4+ICsgICAgICAgIC0gY29uc3Q6IHVzYjMtMQ0KPj4gKyAgICAgICAgLSBjb25zdDogdXNi
My0yDQo+PiArICAgICAgICAtIGNvbnN0OiB1c2IzLTMNCj4gDQo+IGl0ZW1zOg0KPiAgICBwYXR0
ZXJuOiAnXnVzYlsyM10tWzAtM10kJw0KPiANCj4gQW5kIGFuIGV4cGxhbmF0aW9uIHdoeSB5b3Ug
bmVlZCBhbnkgcmFuZG9tIG9yZGVyLiBJZiBpdCBpcyBqdXN0DQo+IGRpZmZlcmVudCBmb3IgVGVn
cmEyMzQsIHRoZW4geW91IG5lZWQgYW4gaWYvdGhlbiBzY2hlbWEgZm9yIHRoaXMuDQoNClRoYW5r
cyBmb3IgdGhlIHJldmlldy4NCldlIG5lZWQgdG8gcGljayB1cCBvbmUgb3IgbW9yZSBmb3IgdGhl
IGNvcnJlc3BvbmRpbmcgcGh5cyBvZiB0aGUgVVNCIHBvcnRzLg0KSXQgc2hvdWxkIGJlIGEgY29t
bW9uIHNldHRpbmdzIGFtb25nIGFsbCB0aGUgY2hpcHMuDQpBZGRpbmcgYW55T2YgaGVyZSBmb3Ig
dGhlIHJlYXNvbiBhYm92ZSBhbmQgcGFzc2luZyB0aGUgZHRiIGNoZWNrLg0KDQpQbGVhc2UgbGV0
IG1lIGtub3cgSWYgSSBoYXZlIGFueSBtaXN1bmRlcnN0YW5kaW5nIGhlcmUuDQoNCnRoYW5rcywN
CldheW5lLg0KDQo+IA0KPj4gKw0KPj4gKyAgZG1hLWNvaGVyZW50Og0KPj4gKyAgICB0eXBlOiBi
b29sZWFuDQo+Pg0KPj4gICAgIGF2ZGRpby11c2Itc3VwcGx5Og0KPj4gICAgICAgZGVzY3JpcHRp
b246IFBDSWUvVVNCMyBhbmFsb2cgbG9naWMgcG93ZXIgc3VwcGx5LiBNdXN0IHN1cHBseSAxLjA1
IFYuDQo+PiBAQCAtMTUzLDYgKzE2MCw3IEBAIGFsbE9mOg0KPj4gICAgICAgICAgICAgICBlbnVt
Og0KPj4gICAgICAgICAgICAgICAgIC0gbnZpZGlhLHRlZ3JhMTg2LXh1ZGMNCj4+ICAgICAgICAg
ICAgICAgICAtIG52aWRpYSx0ZWdyYTE5NC14dWRjDQo+PiArICAgICAgICAgICAgICAtIG52aWRp
YSx0ZWdyYTIzNC14dWRjDQo+PiAgICAgICB0aGVuOg0KPj4gICAgICAgICBwcm9wZXJ0aWVzOg0K
Pj4gICAgICAgICAgIHJlZzoNCj4+IC0tDQo+PiAyLjI1LjENCj4+DQo+Pg==
