Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92DA260C5FA
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 10:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbiJYICM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 04:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiJYICL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 04:02:11 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BF9A3449;
        Tue, 25 Oct 2022 01:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDItG+LlOIt7tR6uA6vT9GcpJ7NDcG7f5gMtV7UJCGNaB9r9QW7kVnW/K+HzyxgEMhNqzFEJd112RBtdvmkV7kjJnuhp+ARR847/pb1Zxt6AlH52SG4fSH+hu19QNW2C0lrK3Sjf9Cu2sIUk2qQjYSR5KS4ZtxMQ/E4H3XSndVxI6EWGF0kO32it8MfmXjFY6oXIi6VwruFvSmp/Sj4ujsvkTc8wqn8MgnilXW4RiBINPMKObGLnthfl2U/qyX54lYtpYJHE+MdhzYoA6MjMmTNY+Unfi8fjorzVs3sL9nC8EHklcSBPZHbtYcqmfBazLTyM+k//jrPlBjc1+NDMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nKf9zvd5O5jgQpljeD7AMQQXJLPJrhPzYXqEiPq/Ok=;
 b=CuuDXT15gjplrhYh47MqJjgeZWFS0UAr3re7aInArfEgZrNKZ0qHxSwnxfDDB1BKtXutreGXU09rpF2qoS4XBc0gYfVdzA7rpVAa1eo/rCcWdWYGK+6T9TufdXKuFeXJj2epVYLjX1GjKcHg7JZ1OYi4AxKXC0nwd3CgICXpDy3mdqZyVWN53fZ99Gw6QmGJVwBpYtKXFVakftahZRMmMrCLDVBjDGdkdoEV6kpg0v0PA8lfmtZ0aDISk5ZIow7P6L4aPqBjapDMWeMrB5IMdCrydYooJnoh5ezpIy/gt1r526Ofbqm8NYNUzGkrbdY2yWKWrD3AMYELkPRGdyNjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nKf9zvd5O5jgQpljeD7AMQQXJLPJrhPzYXqEiPq/Ok=;
 b=h5wKGXMYQzuNVpHxaS+v1+3Gtb7kE9Q493TrCxApziUFead7TAYqHPXGUVO/dub7JVQc48tS69w6m4u5UJ6SStV6U14X5AZt4IcB2BsoSS0OMnQrcmncYSj99jH9mmfWNG6+U8W3ISz9HiRjhn2byOpRIfSA2P58yak2kfk1FaZj3FPHWBal5vJ6qFVSRu1oOFYfNwCF0nFqUhEYJYZdBs9UNJALOTRz7ORO54JaahBIs2mT6VIOuJbzdfK4eh95MYTEb2prxPiUtgwSK2NFXv9wIoyHWeUeaYwA0olnN/kOO0p4ApyqS2HR5EuqZ/SI8Hk/mYK3BtRFaCTok2EYfg==
Received: from PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8)
 by DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Tue, 25 Oct 2022 08:02:09 +0000
Received: from PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::b482:3b7c:c503:9d11]) by PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::b482:3b7c:c503:9d11%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 08:02:09 +0000
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
Subject: Re: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host
 controller binding
Thread-Topic: [PATCH 02/11] dt-bindings: usb: Add NVIDIA Tegra XUSB host
 controller binding
Thread-Index: AQHY53wSeiP7yeQj9UuxV+ObPcDsxa4doiUAgAEfCwA=
Date:   Tue, 25 Oct 2022 08:02:09 +0000
Message-ID: <52ae737e-eb4f-9eb7-8b79-d58251062276@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-3-waynec@nvidia.com>
 <20221024145446.GA1763588-robh@kernel.org>
In-Reply-To: <20221024145446.GA1763588-robh@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5500:EE_|DM4PR12MB6133:EE_
x-ms-office365-filtering-correlation-id: b4d0dbd5-6176-4f8b-9561-08dab65f3738
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0f+F8whB3Oy8DdA4q6YJ7GcZ7akf8/U3p388ge2JMrRu5eYn0h4gTtzDTk7F7lU2IlgPNoWWm7OIKp2P5vuupUEw/CbAMzCqX3xqiLAqNlpKYUya4s7Xdp6WBy8zxT6afR7r1ApMqPR5yBvpbeN+RJwX1LwTq4oB9XCF8dnL9TBAnAZZYmZYHDZwn6Dy5oCQ9Ipe7MyTBVVwLgJa7Cpi3F4M+2cFTmA0c5dzV4vJ5QcvXzlTXuEj7dXVBx/jEfvkfazgaefjvdcDHShx8cbOV6+nLm5bSp/Ci3Bwlg1fqUSUTi7uuRyu3ZvuAvzRhFBy4T3Uh59kp2vC0jfjhaX924X0L6hg8IU1FNqAEN60NDUNhY65hKkXks/kjezYOhKH9RQ4Osf4xHSYsXPvjUU8osF2NGU9JSsUxbyCv/IGCvRms0OIQZVS1FvPkmNCwqz8lYaqU8Unlbq2x/qbMDA6S8p3YBGuBhjkhXHaRJa0yP5XSGwM1o+wHNvkEPnfQdbbDnzA6csq9lBQfMh/8d5o0E2oMoHN3v36biWUyd5q6Ol2xBc7jGV14TPV20AuhSRv5sEkk7xT310bsTX+st9q0Zk2JdQ2xLyslEir9L78QtPD10WtMvLS5mGGdy/P4dt+4r9F/r++W+UMknjf5djurn9YLEAP4a22gdjz1EdK4UUs1j7gLvI33H20fy8b41BzAgY0rnxSobGtzYAQTq77nULJWPcEjPalgEodYQRQ2IRB5Bb0gYEp+xCF1V41y4osHF5TPkf5eafsV09EzFEb/iapHVG+XecXuU3Qw2CthBjZXwyYcTXb/QgcubCsvV3N8CqtJKl/QgZWU3OQUW4Zfw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5500.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199015)(2616005)(186003)(38070700005)(31696002)(86362001)(122000001)(38100700002)(41300700001)(83380400001)(316002)(2906002)(4744005)(8936002)(7416002)(5660300002)(478600001)(6512007)(26005)(6486002)(71200400001)(53546011)(6506007)(76116006)(4326008)(66446008)(91956017)(66946007)(6916009)(8676002)(66476007)(66556008)(64756008)(54906003)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUcyUlJVZGd3c1NJak1TUHZYUGtKdU9CVXZUKzhtSi9yR0kwcmZLL1NDbUFF?=
 =?utf-8?B?bXp5Mm9ZOXlVODVjWGp2dUdlRjBKUWNiSUNTWnUxOE5lcE54SFowMlJYN2dR?=
 =?utf-8?B?SmhyWWt2RHcyeWN5bjFxdlAwTCtLUDUzNHM3aXdqekEwSlN4cVVaZDd1V3ZK?=
 =?utf-8?B?Um5uemVHeGlhMVVHK2c0dVBBcXBhU0c5QjN2eXJyMlFnNm5pbDYrWVFaNkcr?=
 =?utf-8?B?R2hoMkRDeHgxOHBwaTNyR3J6VXdSN0UxYWVOTEl3TlBSM0Zxb1pPMnM2Q3cw?=
 =?utf-8?B?S2tMbUtDN2Y0ckkrdVNmdk1lN3o0TWx0V2x1Q1A2ZlVwdEtOQzl5Y1FBTlhS?=
 =?utf-8?B?VVR3ZnJZQVdOc3ZqNld3KzdoYk42b0FwMkE5ZkRaZEhOTUsxbytYR05ZTEwz?=
 =?utf-8?B?RjltRGhrRitza09nNTRWNzhjWHdJMjh3Rm1tYXZhUG5lazBlN254N1U2MWdH?=
 =?utf-8?B?WG8rekY0S3gxOS9QWmVVRmtQeU5rb2M0NVY4eStxOEZXeFpldVJNU21pTVlu?=
 =?utf-8?B?YW1nd3JJYW5hYzdIK2laU2NENk9sUmtidWs0RElGUzdWQ09zWGxLMFk3N0s1?=
 =?utf-8?B?MEpmNnJuZi85MUYwZGFUNldNbDdjaDl6OGExMmgvSkpHWU43RjV6NUtZcGxQ?=
 =?utf-8?B?aStrbDBJcnM5U1gxOUtvZjNsNlZaSUkzVlcxeG92NXNNNlFCVjNVSitQUHk4?=
 =?utf-8?B?SC8xZDdMeEFiQnZ0TGJjSEVPdlN0aFJxeEFpdTZsaktGVitBeWxPQ1BmQmdT?=
 =?utf-8?B?bmo3ajFRbU5DM0N1Wm5FVDhaSFV5QmRpWHhIeVc0L1ZMNWNFKzhGakZmdStI?=
 =?utf-8?B?M1hiT3hiL1dwTEtvRC9XQ2NCa1dHb3NqdGNHNUVQSHNDc3BkbW5qR1ltaTha?=
 =?utf-8?B?b0d5L2gyc0djYm4vcnlGcGVWMjN4WmhCazhwcDN6Z3lvdjd4QWI0OHBHY0F5?=
 =?utf-8?B?eWE4MGJKWlZpd1l6QitZTXNGYzcrbjFBSU9hTUV1TnhOcWpYWEUxb1VRamNi?=
 =?utf-8?B?NFZ2VmV4S1BIZjZ4Zk0zNURmcUxKMFJMZjVQSEdvdkxTRUxRc2YzZUtrRUtr?=
 =?utf-8?B?eittdVlzU004YWVkQ3pZYnJad3pMNHgyVnlXZFRZYVl1V2hGK09ncWxxaXVt?=
 =?utf-8?B?TFQyVDV3Z1I5SVE0VzFqb2dKUmZzMU9Hd1ZnU1BhSFFyWmtqdWF2K1IxOHU3?=
 =?utf-8?B?OUl6ODVyWm9ScEJCSEt0N0NGS1BOVWU3QkprdjBYMnZVcURWVDR3cG9MNWhk?=
 =?utf-8?B?WmFJVmZEa3BoSlhkSWp5V081a0Vta1NPUGdXVXNqT1hXSnRxeVA5bzZvK1kw?=
 =?utf-8?B?dUQ3M0FTNUtxQzhRWUtvUzdHUENDZCtnSEtoWUYxTUlieFRpcTdGcE8xMEVV?=
 =?utf-8?B?Q2NydzEvOFF4RFBtaEFJc3lna0RjMGg2bE1kUGpBL0RZSkwyM1hCN3gxREdI?=
 =?utf-8?B?Q2tXNmtxdHNVRG5lOFhiY0Q1aCtGOEk0WXh0ZXBXbXF6U1ZicFhPaWNpY2JU?=
 =?utf-8?B?TGN3bFQ2TmFZV3BldEhyNlQ3ay9heXphVHNUMjBMWFpYMitjeDNRTWxLT09w?=
 =?utf-8?B?eGxCdUNoaEJQUVVwVUd5a3dDV3hsZjJRMHdYK2V3L2poWGZ4QmQ2Ym1yUVY1?=
 =?utf-8?B?MDR5RDY2K3BORDBiSHFRbDdEQk9Kb3R1SmlsTXowdFBvMm94c2JER1lZRUwv?=
 =?utf-8?B?VXh3bVVZWm16NTZ2clg0T1hHQmU0SVZ4US9ndnJicE0zc1lTdnFLajBXaEtR?=
 =?utf-8?B?aHBPdjVlakNPZ1hYZndYUDBtWGllenlBTFZNRnd1d09jSHV1V0VtSUtYTFAw?=
 =?utf-8?B?WXIxUVhaRXJwdkZGQW5uNE5TWVR5T055TC91NHdsUkNvd1FIVHdoLzRBRFl5?=
 =?utf-8?B?dHpLZ3hRSzZHalRqTVY3WTNac0VPb0F4YzFuVTlqRW9jRUhMQWJoK2ZnMDhv?=
 =?utf-8?B?RzcyT1ViRGZPYjl5em5meFk2cHBzNXl1N0lqSUlrWUJ4ZW5IU1pvSTduK1Ex?=
 =?utf-8?B?Q29zSGNueGt4QkY5cWNsdWVqYXVSWVordk4rQjduUU1uSlpOVXZ5SFNJUE9C?=
 =?utf-8?B?aUpqZGcvdUZBVWVSMU5YUkVhM2h6aGxVWUE0M3VyUjlUMDdRZm1PdnZKUzd0?=
 =?utf-8?Q?HfHpXFrRb7gNgqQCljlKc0VzA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8AE689E5C8B184BB35D08F6B3712B50@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5500.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d0dbd5-6176-4f8b-9561-08dab65f3738
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 08:02:09.0325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q89quY6aVnboOzejqX9To2ke/qxg6gwbs7xELVtM2V8YRAhV44iVT73+9YQpEVhlqo/9nZUpNgMrAbXK2NGpeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KQWxsIHRoZSBjaGFuZ2VzIHdpbGwgYmUgdXBkYXRlZCBp
biB0aGUgbmV4dCBwYXRjaHNldCBleGNlcHQgdGhlIA0KcG93ZXItZG9tYWluLW5hbWUuDQoNCk9u
IDEwLzI0LzIyIDIyOjU0LCBSb2IgSGVycmluZyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWw6IFVz
ZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMNCj4gDQo+IA0KPj4gK2Rlc2Ny
aXB0aW9uOg0KPj4gKyAgVGhlIFRlZ3JhIFhIQ0kgY29udHJvbGxlciBzdXBwb3J0cyBib3RoIFVT
QiAyLjAgSGlnaFNwZWVkL0Z1bGxTcGVlZCBhbmQNCj4+ICsgIFVTQiAzLjEgU3VwZXJTcGVlZCBw
cm90b2NvbHMuDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIFdheW5lIENoYW5nIDx3
YXluZWNAbnZpZGlhLmNvbT4NCj4+ICsNCj4gDQo+IFJlZiB0byB1c2IteGhjaS55YW1sPyBPciB1
c2ItaGNkLnlhbWwuDQo+IA0KSXQgc2hvdWxkIGJlIHVzYi14aGNpLnlhbWwuIHRoYW5rcy4NCg0K
Pj4gKyAgcG93ZXItZG9tYWluLW5hbWVzOg0KPj4gKyAgICBpdGVtczoNCj4+ICsgICAgICAtIGNv
bnN0OiB4dXNiX2hvc3QNCj4+ICsgICAgICAtIGNvbnN0OiB4dXNiX3NzDQo+IA0KPiBEcm9wICd4
dXNiXycuDQoNClRoZSBwcm9wZXJ0aWVzIGFyZSBjb25zdGFudCBhbmQgd2UgdXNlIHRoZSBuYW1l
IHRvIGdldCB0aGUgcG93ZXIgZG9tYWluLg0KDQoJdGVncmEtPmdlbnBkX2Rldl9ob3N0ID0gZGV2
X3BtX2RvbWFpbl9hdHRhY2hfYnlfbmFtZShkZXYsICJ4dXNiX2hvc3QiKTsNCgkNCgl0ZWdyYS0+
Z2VucGRfZGV2X3NzID0gZGV2X3BtX2RvbWFpbl9hdHRhY2hfYnlfbmFtZShkZXYsICJ4dXNiX3Nz
Iik7DQoJDQp3ZSBtaWdodCBub3QgYmUgYWJsZSB0byBkcm9wIHRoZSB4dXNiXw0KDQp0aGFua3Ms
DQpXYXluZS4NCg0K
