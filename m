Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75F30627D43
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 13:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbiKNMDV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 07:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236190AbiKNMCz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 07:02:55 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01901FE;
        Mon, 14 Nov 2022 04:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD4YrXM/1ZAXZXFYMDZdaO0rt2baRyu7MnbVaIVId1SmArnn6Wjgp4NleYhcgUIG9Y4U/k4jLm6vbXSKV1qY6hr3B480yHFa/pTRSUfD0fqQjJp3OOiXcvyDc4CF6LO/sfJy7Fa52dZ28ygIrjOLym4c41JvEvpUjSBP0BxV/W7SE2O6RwO7qHifg3csfA/xjFGkqsKnDnRywWRlKcxaUL0VJa/nSYxntbOXr2Ay8AYUFx0JNJdEzI5uzDmledyLqDtq3xgnsLFV9VAe8yJW8s78hgNoRa5Ig7YmieL7WbxbuNaGJVkEO3vo9B4sohW7YGqTZ7MN8Y+8AfAS2wL1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6Lly1RnUFtShKgQi7WboqfkVcoemXoR7JeZCz/NhUc=;
 b=L2pkKAhf30JkvlM0PZzArou7UhiUp+BJtOJzEOWQaQvFW0vZKjs6UfgsulWSji9kIDtGZnXK8ie/mRyeMWPqn+CUSgeLdOqSP8Z1gj/IfYfuA70GTsjxcu2kYFGc3k/XmN6xmhDLWZ2B7Tzib+wgvxzXq+Xfaw/aAbqwMrDe24OCgjIALWP8PXf5wNigmiUbHSrTgl/v3pwJppqysqQfjks7LHKsJ73IHepD8LRYffxua/xbV/iVQdtEqKdAjqYRKqgx6IngeSW24C2oy6qAHufYbO5wEd0rOodPpCtukGUhGdX8Ql9IS+hBWuhBufqjcSwexYz7S0oq1X+/svMfwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6Lly1RnUFtShKgQi7WboqfkVcoemXoR7JeZCz/NhUc=;
 b=ArwwJqdyIMRwtx3MqiFH3pGGTITzX2TKRt3bcm0j46CoyPZdl/0k3+A+vom4FGs6+pEw+g+mmUU5JELZcCPFQfey0IJgkhVhaG7sdHEe2AwAuG3w0exBzPHkD6w8bfEtWhPMy5x4qNcm/0XK2ZAILGj7HoJISz/6WcZyu6UC5+anX+nfUS2DDGufn2ihsdtjaaYjFWRh+pE95xbHzA+kaA4IT8i2Fl4dZKSPZ4OVdk3tUskshZJqsjSDXvguhdjhb8LkdgoqajpVF+fiTO1/psDN7MVd89cWvmrCTZjVYGg5a+xbfsscPFkuJJtvMc3oVW71+a5mxS1Ru1A96bYxZA==
Received: from PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8)
 by DM4PR12MB5963.namprd12.prod.outlook.com (2603:10b6:8:6a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Mon, 14 Nov 2022 12:01:12 +0000
Received: from PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::991c:e140:f751:2439]) by PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::991c:e140:f751:2439%4]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 12:01:12 +0000
From:   Wayne Chang <waynec@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        Jui Chang Kuo <jckuo@nvidia.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sing-Han Chen <singhanc@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 03/13] dt-bindings: usb: Add binding for Cypress
 cypd4226 I2C driver
Thread-Topic: [PATCH v2 03/13] dt-bindings: usb: Add binding for Cypress
 cypd4226 I2C driver
Thread-Index: AQHY9bagj5nVKjt9+0+hdgHtfVo8lK45yq6AgASLdYA=
Date:   Mon, 14 Nov 2022 12:01:12 +0000
Message-ID: <64ffce75-e64e-91ad-162f-c1c7c4c9d472@nvidia.com>
References: <20221111101509.999589-1-waynec@nvidia.com>
 <20221111101509.999589-4-waynec@nvidia.com>
 <f491fde0-5448-ddf2-d227-c42e30fd37d8@nvidia.com>
In-Reply-To: <f491fde0-5448-ddf2-d227-c42e30fd37d8@nvidia.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5500:EE_|DM4PR12MB5963:EE_
x-ms-office365-filtering-correlation-id: cd4d80c0-a7ee-478a-31df-08dac637ecf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?NWcrTlhlNnlYSjRNVFNVdUhpbHBDWEU3TkFRRCtmT0VDWFY5QUc0Q1pENFZa?=
 =?utf-8?B?UzNJa2dSbjhIQmlydkRyQ1R1dlVLWmI1Q215ZlNYWWpnSUVQZ0puUGpuSU5Z?=
 =?utf-8?B?KzJWNnN0U1JZYzhleW4wR29vcEVqWnovYVkyZXdlK0xhT1E1M2UyazFJRmpW?=
 =?utf-8?B?K1FzMFJmYUs4cXJlWGVxbE52Rkl6aUJuUE56dVB0MGZ5emlseFdPQ0xCZkto?=
 =?utf-8?B?M3ZaZXF0aUgyNW90TDVCeUZZNXJUQ0poL2xHMkFKUHRXalhJVHVieVVHWG84?=
 =?utf-8?B?RjE3d0piUGZqWFVudmcyNzNyYlUwUE1BVHp0cG0vLzk3Rkc4V1pYZHp2WTBD?=
 =?utf-8?B?VmQ1UnJINDZDNUE3bWtGNmhUQlVLWnowdEdMaVNkV3ozU0k4RzVRb3h2MnRS?=
 =?utf-8?B?Ny94Y3FsZHI0ajZ5M2VKOTdDZFZyZHNEUzZKN010aFpaQ2MreGNtdnZvTGN3?=
 =?utf-8?B?UkV2YmpoZmNpelpRL2ttZG16TStXMXhxaUxBMkN2d3lURmVZbG9jU05FZUJv?=
 =?utf-8?B?eC80VlRyOFVJODluZDVub2VZVGNCWm9yNWlpQm1iVld0SDhuZm56UUpiSk92?=
 =?utf-8?B?L1hNRUIxTHlGbGVwMjdJaDU2bHVPZFZIUzAxUkFhMEhkM1U5QWtMMlQxT1U3?=
 =?utf-8?B?OWNVVEhnSllqWXpJN3RGMWl6LzlWOU8rSGhiNzdyU3VUeW8yUnhWVDI0dWVK?=
 =?utf-8?B?UE4yRmdqSmZ4NnNydjBVSitmYUJMTXNoM3kyNDdtUXlNdk5qRFBYSTVlMUp5?=
 =?utf-8?B?SGtzMTBTZVYzcVJpYXY0N2ZWOTBnVUd3d011RFRsSVZkcmtOVU00YUpsZ1Rh?=
 =?utf-8?B?Wm1jbDhtVm1WTVhuRk91R1I3cDA1bjhYcHFha3kwRHNEQU56dkJVeW9Cam9j?=
 =?utf-8?B?di9YZlh6VUdBTzZxL1JmUk55cjhpMndGMklLR3c0NDdlWmR5NFhPQzhOZWxY?=
 =?utf-8?B?NzhKamYrNDc3cG5jeTFKeGdkQTlScVUvTkp5cy9WNVhJQlFwbkdFNW5TL25i?=
 =?utf-8?B?RXZCTDFqN1g0YnVYNEJ4YWlwSE4wTVBRVkkwNmEwc2VVclIzZmFNRkw4MzY4?=
 =?utf-8?B?RG1LR1QwZkJXSEhncE9lQ0UrZ1RQcmQxNGs2RkhRS0Z0VXhWWlBwSUIyOFRV?=
 =?utf-8?B?OGw4MUhyS0F1c1ZZR3VvSHJlemRnejFIQUhjanJnL2d4ZnVZZ21OckM0clhM?=
 =?utf-8?B?WXEwUVArTXFuTGJlZXdRQWJnK2tyMFIzN3N5RVRHNnlNdUhiM2p1d09aRElh?=
 =?utf-8?B?dkp4QjJUVWVWc3Zhc1h1elRpMUhTRUh4TXpXRHRVenNBZGIzRjRaL1V3b1hQ?=
 =?utf-8?Q?MgvDCSI3x07EQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5500.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199015)(26005)(41300700001)(71200400001)(6512007)(6506007)(4326008)(53546011)(6486002)(6636002)(54906003)(316002)(110136005)(66946007)(64756008)(66446008)(478600001)(8676002)(76116006)(91956017)(31696002)(122000001)(66556008)(66476007)(921005)(38100700002)(966005)(2616005)(186003)(86362001)(83380400001)(38070700005)(31686004)(2906002)(8936002)(7416002)(36756003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFF3cUlDRnc0ZWN6Y2Z6MzBLMk1TVHJCcjVPQVF3MVhESHVqWkJ0cEFONGVs?=
 =?utf-8?B?R0U4Mjk2VkE1RTdKYzJBS3BMWjFKRTl6VHd4V1ZnSm5BaStzWGlRY1FLdWkv?=
 =?utf-8?B?MW5IbzlYK0J4d25pVjFKbVNzTFFTZFNqSG5IZ3pibWhLVmNOK0RVekRjdFRw?=
 =?utf-8?B?SkhnUmZ3cVBBTGFEK25hNzRoMDdWRHNiejRMaWtJRWNJTUJFd1d2cHIxSm1L?=
 =?utf-8?B?SHFwMXlLNFlhR0xPMG4vYjNGV3FVQW9FcFlDTVY5cklwajhxU0JGRFE4d3k1?=
 =?utf-8?B?ZzkxcEk4OTVlejBOeGc2WkVKVU1iTXdYeVdTT0lydWR3VEtMY08zc3RzdlF6?=
 =?utf-8?B?RnFmV0I5c1o5RzdzUnNuNm5QaDR6SXpYNjY0Tjl6bTh2NlBuT29hMTloaGds?=
 =?utf-8?B?ZDdpNVpTVWo2RGR4amNHMlhGNDAvWEcveVlDNjRQSVpGU2VkbTNjUWxWYUM3?=
 =?utf-8?B?bVR6WTdyTjdzKzNJZVFocWRSeG5vZlQ0R0p2QWhKdW1qMnZUalROMHNFMW1G?=
 =?utf-8?B?QlZQcWZ0UnRwcFE1Q0ZPSWlKS1hlZTZCQ3J5WW8yeUpkRys3bnJubGY0TnB2?=
 =?utf-8?B?REhFTFdJcG1SSFFtRExGQU9vRHdDV000VW1ueDBkVHowNTZwdHJVbmc5R2RF?=
 =?utf-8?B?VVZYaUpBTU00UW10RDd3UnZUdGNnNkNRQ3huSEtSUVdxRXVUOE1jNDBOT3Rv?=
 =?utf-8?B?SERQY1AzTUxzdkJxNTF1cGtmNlp0aXhRV01NQS9OR0V5U1Nic1Jzb01mcENr?=
 =?utf-8?B?U2xwaWpZM3BiZHR1OWtpL2hLQUx1ZGliTTNwQ05LbmgwVzQ1M2V5Qnl3cUJF?=
 =?utf-8?B?TDZxUkVTSWhxdVUwc1JiS05IMmVXS3hIK3RXSWdMWXZMK0xXVmJQVEV5LzJQ?=
 =?utf-8?B?dm9NUmI1RGhoRGw4RlYyVmJFdUNzS0czYjlLbjRqL0RSZGs2TW5iTFViOTlU?=
 =?utf-8?B?ekdzK0hTZkVhcndrODdNTWdMSlBIcUF0M1BEcjVUdytxVzN3cHV1VVExTGZs?=
 =?utf-8?B?ckVQTGFlWFM1TXIvS3hmSWg5VUxKLy9wQnBMeDZxNWZjQmYwZlZ1SmpvaGQx?=
 =?utf-8?B?RXVrMUhFMldoZVIvRGdmNGVBdzczMlVwR1d1U0tkVUt3eDNWaWZML2tOYThO?=
 =?utf-8?B?SCtNUWhERnArbjMzUkNwYjJzQll0RkVOdmF1aFlkS0xLN1M5UWJwcnE3WFNS?=
 =?utf-8?B?cE44SWhFMzU0U3FhYys1ZjZjVzlFQW5LeEZMRW9HeHZHa09oT2kvLzVTRjBP?=
 =?utf-8?B?K3ZYU3ZReEFhczZXR2JaSE9vZTdLSEpmbEpJei9leWtaYllTZlp1ZUVGbVg4?=
 =?utf-8?B?SFl0MTJGVDlmR2VkL1dXWWZTU1NHc0VHa2I2MFdWd2lvaERNNTVvWHU4R3Vy?=
 =?utf-8?B?ZVllaWE2VGRhdktSZmxiamg4b0hTVUFBN3hoaVVOTW9JYTNBVFhMcFNqcExO?=
 =?utf-8?B?aTlHL0RKaFpZN0lKQzd4SHZSeTRxUHhhNzNTOU03K1VkclU5ODdpdlovOVY1?=
 =?utf-8?B?Y2tLeXBMdGUyMFJ2Y1lTR2wwTmQ4MlVmTGlzVWdrZHFvL0RrakhVZFc1WmRR?=
 =?utf-8?B?MVBnblh4UGw4ajFLV3JOSmFnbktqSmJ0bGNqOUlrQ1VIdWpsWnZ1aXdUdWpC?=
 =?utf-8?B?QUpXemJNK3ZzcEV6TFVCaGFocytnV2ljRVBGckNlbjUwNm85S3h3eEhvd2c5?=
 =?utf-8?B?ZWg4THhUVUdEVmlFSEpUWkRaa0Eyak5UdThiL3NnOUl2V0gySncrQ3Zzck42?=
 =?utf-8?B?a3pOSkw0QThaN25ZMlFFNlVFTjhLYklYRmhVeTI5Mm45OFQ4WTR1aWE1akxo?=
 =?utf-8?B?aVZYN3VBeExJeGJYZnNqOEYxZnFvb1JGWG5PaGVIMDg2MVJlQjU2OERyNElZ?=
 =?utf-8?B?MkxPQnk5MVFxUG92K2RZUU5ic2l3T1BTelZvaEVIbm4wc3k2YU1zSSswbHh4?=
 =?utf-8?B?M1p1dk55eDZVWVBRd3Z0LzNJWTN4U2MwS0hhMVZSdTlvWk12K1ZObXplMkZu?=
 =?utf-8?B?QnBxbDBuYk9KYmlackFwM3RWZVFDZWdlVklhUzYreUhLb0JjSG9sekZLSkhB?=
 =?utf-8?B?dFZyNm81MXJyeWl4d25TTGtLZTlic01xMyt2QkJsaTVCSzQzMGlycmloajh4?=
 =?utf-8?Q?XZZ8FJnqHQJ1kKJ2dWvjmNW2P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F774746E67645F4882C0A0F7BD815E6C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5500.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4d80c0-a7ee-478a-31df-08dac637ecf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 12:01:12.7183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: auDWC3v1w0w3Rl0mGmBDkI+PjmMuRr88047xkleOGtUw69US/mIvfzL0Bkj5mQ6J0uUszD0HZANLs0luNH/QGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5963
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDExLzExLzIyIDIyOjM2LCBKb24gSHVudGVyIHdyb3RlOg0KPiANCj4gT24gMTEvMTEv
MjAyMiAxMDoxNCwgV2F5bmUgQ2hhbmcgd3JvdGU6DQo+PiBhZGQgZGV2aWNlLXRyZWUgYmluZGlu
ZyBkb2N1bWVudGF0aW9uIGZvciBDeXByZXNzIGN5cGQ0MjI2IHR5cGUtQw0KPj4gY29udHJvbGxl
cidzIEkyQyBpbnRlcmZhY2UuIEl0IGlzIGEgc3RhbmRhcmQgSTJDIHNsYXZlIHdpdGggR1BJTw0K
Pj4gaW5wdXQgYXMgSVJRIGludGVyZmFjZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBD
aGFuZyA8d2F5bmVjQG52aWRpYS5jb20+DQo+PiAtLS0NCj4+IFYxIC0+IFYyOkJhc2VkIG9uIHRo
ZSByZXZpZXcgY29tbWVudHMuIEZpeCBzb21lIGFkZHJlc3NlZCBpc3N1ZXMgb24NCj4+IGRlc2Ny
aXB0aW9uLCBpbnRlcnJ1cHRzLCBjeXByZXNzLGZpcm13YXJlLWJ1aWxkLCBjb25uZWN0b3IsIGFu
ZA0KPj4gYWRkaXRpb25hbFByb3BlcnRpZXMgcHJvcGVydGllcy4gQW5kIGFsc28gcmVtb3ZlIHRo
ZSBzdGF0dXMgaW4gdGhlIA0KPj4gZXhhbXBsZS4NCj4+IMKgIC4uLi9iaW5kaW5ncy91c2IvY3lw
cmVzcyxjeXBkNDIyNi55YW1swqDCoMKgwqDCoMKgwqAgfCA4NiArKysrKysrKysrKysrKysrKysr
DQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKQ0KPj4gwqAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IA0KPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jeXBy
ZXNzLGN5cGQ0MjI2LnlhbWwNCj4+DQo+PiBkaWZmIC0tZ2l0IA0KPj4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2N5cHJlc3MsY3lwZDQyMjYueWFtbCANCj4+IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jeXByZXNzLGN5cGQ0MjI2LnlhbWwN
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjcwZGI5N2Uw
YWQzMQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3VzYi9jeXByZXNzLGN5cGQ0MjI2LnlhbWwNCj4+IEBAIC0wLDAgKzEsODYgQEAN
Cj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2Up
DQo+PiArJVlBTUwgMS4yDQo+PiArLS0tDQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy91c2IvY3lwcmVzcyxjeXBkNDIyNi55YW1sIw0KPj4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPj4gKw0KPj4gK3RpdGxlOiBD
eXByZXNzIGN5cGQ0MjI2IFVDU0kgSTJDIFR5cGUtQyBDb250cm9sbGVyDQo+PiArDQo+PiArbWFp
bnRhaW5lcnM6DQo+PiArwqAgLSBXYXluZSBDaGFuZyA8d2F5bmVjQG52aWRpYS5jb20+DQo+PiAr
DQo+PiArZGVzY3JpcHRpb246DQo+PiArwqAgVGhlIEN5cHJlc3MgY3lwZDQyMjYgVUNTSSBJMkMg
dHlwZS1DIGNvbnRyb2xsZXIgaXMgYSBJMkMgaW50ZXJmYWNlIA0KPj4gdHlwZS1DDQo+PiArwqAg
Y29udHJvbGxlci4NCj4+ICsNCj4+ICtwcm9wZXJ0aWVzOg0KPj4gK8KgIGNvbXBhdGlibGU6DQo+
PiArwqDCoMKgIGNvbnN0OiBjeXByZXNzLGN5cGQ0MjI2DQo+PiArDQo+PiArwqAgJyNhZGRyZXNz
LWNlbGxzJzoNCj4+ICvCoMKgwqAgY29uc3Q6IDENCj4+ICsNCj4+ICvCoCAnI3NpemUtY2VsbHMn
Og0KPj4gK8KgwqDCoCBjb25zdDogMA0KPj4gKw0KPj4gK8KgIHJlZzoNCj4+ICvCoMKgwqAgY29u
c3Q6IDB4MDgNCj4+ICsNCj4+ICvCoCBpbnRlcnJ1cHRzOg0KPj4gK8KgwqDCoCBpdGVtczoNCj4+
ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IGN5cGQ0MjI2IEkyQyBpbnRlcnJ1cHQNCj4+ICsN
Cj4+ICvCoCBjeXByZXNzLGZpcm13YXJlLWJ1aWxkOg0KPj4gK8KgwqDCoCBlbnVtOg0KPj4gK8Kg
wqDCoMKgwqAgLSBudmlkaWEsZ3B1DQo+PiArwqDCoMKgwqDCoCAtIG52aWRpYSxqZXRzb24tYWd4
LXhhdmllcg0KPj4gK8KgwqDCoCBkZXNjcmlwdGlvbjogfA0KPj4gK8KgwqDCoMKgwqAgdGhlIG5h
bWUgb2YgdGhlIENDR3ggZmlybXdhcmUgYnVpbHQgZm9yIHByb2R1Y3Qgc2VyaWVzLg0KPj4gK8Kg
wqDCoMKgwqAgc2hvdWxkIGJlIHNldCBvbmUgb2YgZm9sbG93aW5nOg0KPj4gK8KgwqDCoMKgwqAg
LSAibnZpZGlhLGdwdSIgZm9yIHRoZSBOVklESUEgUlRYIHByb2R1Y3Qgc2VyaWVzDQo+PiArwqDC
oMKgwqDCoCAtICJudmlkaWEsamV0c29uLWFneC14YXZpZXIiIGZvciB0aGUgTlZJRElBIEpldHNv
biBwcm9kdWN0IHNlcmllcw0KPj4gKw0KPj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOg0KPj4gK8KgICde
Y29ubmVjdG9yQFswLTFdKyQnOg0KPj4gK8KgwqDCoCAkcmVmOiAvc2NoZW1hcy9jb25uZWN0b3Iv
dXNiLWNvbm5lY3Rvci55YW1sIw0KPj4gK8KgwqDCoCBwcm9wZXJ0aWVzOg0KPj4gK8KgwqDCoMKg
wqAgcmVnOg0KPj4gK8KgwqDCoMKgwqDCoMKgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiArdW5ldmFs
dWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4gKw0KPj4gK3JlcXVpcmVkOg0KPj4gK8KgIC0gY29t
cGF0aWJsZQ0KPj4gK8KgIC0gcmVnDQo+PiArwqAgLSBpbnRlcnJ1cHRzDQo+PiArDQo+PiArZXhh
bXBsZXM6DQo+PiArwqAgLSB8DQo+PiArwqDCoMKgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlv
L3RlZ3JhMTk0LWdwaW8uaD4NCj4+ICvCoMKgwqAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4+ICvCoMKgwqAgaTJjIHsNCj4+ICvCoMKgwqDC
oMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4gK8KgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8
MD47DQo+PiArwqDCoMKgwqDCoCAjaW50ZXJydXB0LWNlbGxzID0gPDI+Ow0KPj4gKw0KPj4gK8Kg
wqDCoMKgwqAgdWNzaS1jY2dAOCB7DQo+PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJj
eXByZXNzLGN5cGQ0MjI2IjsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHQtcGFyZW50ID0g
PCZncGlvX2Fvbj47DQo+PiArwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDxURUdSQTE5NF9B
T05fR1BJTyhCQiwgMikgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZWcgPSA8MHgwOD47DQo+PiArwqDCoMKgwqDCoMKgwqAgY3lwcmVzcyxmaXJtd2FyZS1idWlsZCA9
ICJudmlkaWEsamV0c29uLWFneC14YXZpZXIiOw0KPj4gK8KgwqDCoMKgwqDCoMKgICNhZGRyZXNz
LWNlbGxzID0gPDE+Ow0KPj4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDA+Ow0KPj4g
K8KgwqDCoMKgwqDCoMKgIGNjZ190eXBlY19jb24wOiBjb25uZWN0b3JAMCB7DQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAidXNiLWMtY29ubmVjdG9yIjsNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqAgcmVnID0gPDA+Ow0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBsYWJlbCA9ICJV
U0ItQyI7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEtcm9sZSA9ICJkdWFsIjsNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqAgcG9ydCB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1Y3Np
X2NjZ19wMDogZW5kcG9pbnQgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlbW90
ZS1lbmRwb2ludCA9IDwmdXNiX3JvbGVfc3dpdGNoMD47DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Ow0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCB9Ow0KPj4gK8KgwqDCoMKgwqDCoMKgIH07
DQo+PiArwqDCoMKgwqDCoCB9Ow0KPj4gK8KgwqDCoCB9Ow0KPiANCj4gDQo+IEkgc2VlIHdhcm5p
bmdzIHdpdGggdGhpcyBjaGFuZ2UgLi4uDQo+IA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdXNiL2N5cHJlc3MsY3lwZDQyMjYueWFtbDogDQo+ICdhZGRpdGlvbmFsUHJvcGVy
dGllcycgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQ0KPiAgwqDCoMKgwqBoaW50OiBBIHNjaGVtYSB3
aXRob3V0IGEgIiRyZWYiIHRvIGFub3RoZXIgc2NoZW1hIG11c3QgZGVmaW5lIGFsbCANCj4gcHJv
cGVydGllcyBhbmQgdXNlICJhZGRpdGlvbmFsUHJvcGVydGllcyINCj4gIMKgwqDCoMKgZnJvbSBz
Y2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Jhc2UueWFtbCMN
Cj4gDQo+IA0KPiBMb29raW5nIGF0IFJvYidzIGNvbW1lbnRzIEkgYmVsaWV2ZSB3ZSBuZWVkIC4u
Lg0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvY3lwcmVzcyxjeXBkNDIyNi55YW1sIA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy91c2IvY3lwcmVzcyxjeXBkNDIyNi55YW1sDQo+IGluZGV4IDcwZGI5N2UwYWQzMS4u
OGZlYWZiYWY5ZTIwIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL2N5cHJlc3MsY3lwZDQyMjYueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL2N5cHJlc3MsY3lwZDQyMjYueWFtbA0KPiBAQCAtNDMsMTcg
KzQzLDE5IEBAIHByb3BlcnRpZXM6DQo+ICDCoHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiAgwqDCoCAn
XmNvbm5lY3RvckBbMC0xXSskJzoNCj4gIMKgwqDCoMKgICRyZWY6IC9zY2hlbWFzL2Nvbm5lY3Rv
ci91c2ItY29ubmVjdG9yLnlhbWwjDQo+ICvCoMKgwqAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZQ0KPiAgwqDCoMKgwqAgcHJvcGVydGllczoNCj4gIMKgwqDCoMKgwqDCoCByZWc6DQo+ICDC
oMKgwqDCoMKgwqDCoMKgIG1heEl0ZW1zOiAxDQo+IA0KPiAtdW5ldmFsdWF0ZWRQcm9wZXJ0aWVz
OiBmYWxzZQ0KPiANCj4gIMKgcmVxdWlyZWQ6DQo+ICDCoMKgIC0gY29tcGF0aWJsZQ0KPiAgwqDC
oCAtIHJlZw0KPiAgwqDCoCAtIGludGVycnVwdHMNCj4gDQo+ICthZGRpdGlvbmFsUHJvcGVydGll
czogZmFsc2UNCj4gKw0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KU29tZWhvdyBJIGRv
IG5vdCBnZXQgdGhlIHdhcm5pbmdzIGluIGxvY2FsIHRlc3QuDQpJJ2xsIGFwcGx5IHRoZSBjaGFu
Z2UgaW50byB0aGUgbmV4dCBwYXRjaCBzZXJpZXMuDQoNCnRoYW5rcywNCldheW5lLg==
