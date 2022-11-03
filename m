Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68519617BAD
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 12:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbiKCLhG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 07:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbiKCLg6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 07:36:58 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2048.outbound.protection.outlook.com [40.107.212.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A742611C27;
        Thu,  3 Nov 2022 04:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B13IRtmiNliZ8Zyjgh8hFaEVQdXQ7mK85hJ+fqCr+q9WVsUH9TvOVkxXAXXCkSJCe3S+KN/N86TgcryiBkFLGxK1slbbqGd9uWYjKOlnvDTfujx5jEp12Wtj14DwfDj1kmM2TTXvV3tYRXkeVNI58DxXj6dkYADQ+S4f0JWPCrMI4WATsH9S48drObJSyeJgJcHaw+GjxiTnoG4w83iJJrjJdkxiSpFkmw44SUczUYsaahrUkle0BqbEFpi8FAtgJmGbwi1LQ2MwO+qZggz/sqY66hsNOKSGUG06oezF1iVXAAjOt5Q3mf2YDp+L4OiyrFYjtNwD20oDmysL96rzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJQJzRrYBSjR4GEVS0HozYu0vxuzZWB1zPTck2pXI4U=;
 b=R3gn9hNATcCiBP0WYQJP54eUSG2h4WIClCjgMxnDqd0o2tJ4a2ccAyXRk7xF8qJ0a30b9uuNa5HeLCE/HozPkeBbFbK9iW7R/6cp936D3zDPpbB0xiYW9bvj8Rr2JI2a/cSGO4RmLaI0gnaHEYAAHIY6tKGx4g78j26pri8gY5jGdwNNwbCITqUFz2HmIt/IS6O3Fj4aQtaY+T2+F1ZvNGe+jlaQ7k7i4VNvAV1gl5BirTwxcN2m0oqZrHBPYSqyOOAQ2UT5uV7xmDUdOIDHyOWmV7qf5L+JVWcIfBs2KeFShLzDzHrQETdldgKjJvpj1O1aYCOHZXHkUw29AWR1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJQJzRrYBSjR4GEVS0HozYu0vxuzZWB1zPTck2pXI4U=;
 b=WbGrdPQIIQjv/eOR4DGIlGYS06KgGaxXbMrTDUu1taw6VSHwxQEulTjp/MU1Z/b9VUNwvtCzPZYo8SgHtcdXLoVgNfuBAhpZN3JmDlprpsnPX8E5jJoHAtTzS5Xv9jlTeZd3yJaBB3R2+EdKkSgpBQYvMaOTN0cj3JZY2KJ/Ou+ZTrU6tsOmb/k7UBxPfLachgPlvPAzmBHULgiy6fmNKvdI//3r+N+XN9Tuy/pWaFRsDrvQgq57Viz39t2aQWosTfY+1vN3is8jwQDyPIe4WgLWrbja5Y7XWjaVusfXsu/e+kjL72m0pcvlLVTKteYgyL8/sre5f8lbTT2IKO5dTw==
Received: from PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8)
 by CH0PR12MB5073.namprd12.prod.outlook.com (2603:10b6:610:e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 11:36:56 +0000
Received: from PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0]) by PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0%2]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 11:36:55 +0000
From:   Wayne Chang <waynec@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, "kishon@ti.com" <kishon@ti.com>,
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
Subject: Re: [PATCH 07/11] i2c: nvidia-gpu: Replace ccgx to well-known regex
Thread-Topic: [PATCH 07/11] i2c: nvidia-gpu: Replace ccgx to well-known regex
Thread-Index: AQHY53wgKMOxCJrUkESak1lh1EOTwa4qOGMAgALpyQA=
Date:   Thu, 3 Nov 2022 11:36:55 +0000
Message-ID: <6b7aa45f-15da-2948-0472-259d446a6039@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-8-waynec@nvidia.com>
 <e63e9d49-318f-93ae-178f-93a7023538c1@nvidia.com>
In-Reply-To: <e63e9d49-318f-93ae-178f-93a7023538c1@nvidia.com>
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
x-ms-office365-filtering-correlation-id: f6a00c9b-96b4-44a2-c7e4-08dabd8fb5fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nzAxPFzk0rCIEfk2L5DumsqKLlTRRb7+bWgB5k/dHh1oJG8aQHlSSXQiOCQ4Qa5kK24uC9y3aMZ7+Emk3Vmb2+F+XB9lrW8Xuorxp0Y4iq/AEY6aAtENayeD3Y3x5LWlrn8AOPjSdXbOnEkj03w0x9rVJBtnKk/VgsZV6w1Gqi0/Kmo1PCBP5kM+/xPOVaOSCQ05ZrL7zLb3cAZWnZKoQ1trBFjU3mTgDF3wEoEvLYKL//ilXyGce7nC7jEeEeS/2T2Mmyxdz2SVBpuK1BOb3fvJtwU1Wzp0E8GJq0I1yvfkN5+0FEWKsFC9NWi0rTIOF5+hQmuHZirQaC4v2YsCx5nlcQ9FseVv19B3tQQB/jIAwcEsecJ31utJJ26cB6PlKbv7IORZUar74bKpgyVhOUvHgRbh2C0VYkN36rSidphZjB4hP4vcFOr0MOgYHQiFV5YHOYcSMLxc6UDr4jXQJ93t1S/uz/A9Ufd13w0bRVw4803JcEOsd7PbwlZvbOe9hw12TrnrIOoc28xig0nnp8PbFBy+jxW9wd9oDwyvIacXU5APF1gbPJosQLWRrWXjONyjwc2qAHEhFRJocGz435cGbF2gC49Xz+XVuL/J1R2TIwTyRa1UPlNXOOQQvZn+j+rFF1TsLthCmeHLm/IcLaMVzYQEMwdvNMrQ9oQ+73sY2yIPx+PZTe57dWxCGaPHt1aKHAb0qFUgVC1V4l2ReKVhbexwW5dpN5x3AXL+qk47a1AFtZwmww618Z9x65OMyvuE5STQtyG8Ro88uUL5lAjYl68k/1VeM3K/CRHPjFtZsZ+uBREHrDdgDL9gpm4H2NLVqeVjxsmzNlXJbpGo9E2/Fr6NK1tiggPW2OwlOlA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5500.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199015)(921005)(38070700005)(26005)(36756003)(86362001)(31696002)(41300700001)(8676002)(64756008)(66446008)(6512007)(66556008)(4326008)(66476007)(76116006)(66946007)(186003)(8936002)(91956017)(5660300002)(2616005)(7416002)(6506007)(478600001)(6486002)(71200400001)(53546011)(110136005)(54906003)(6636002)(316002)(122000001)(38100700002)(2906002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rjl5NkU3Vy85UlFsVE1hdDBaampGdDVZRk5YUVRKTlhWMVZSaTNLZURRcjlx?=
 =?utf-8?B?RzFudmI0NHl5U0xwZXlKZFFXOEpLaGJhRnZMN1c5N1dSeExtNFZJRzFCaEds?=
 =?utf-8?B?SUNVODd5dXVYVTBGdUg4QUdieEMvdC9wOVVrWFNIV3VKRTRjVTlETE5lR0I5?=
 =?utf-8?B?d05UeWhObUJKUXVmVU1oc1J0TWp0VWNTK21zUk84TjRrSk1jbnRkL2VJVlUw?=
 =?utf-8?B?amxtcVprb3NKaWIyNTNYam9FR2xJRGdIdkZCWXdHMlE4Uy9GVFJZZzBVeE1I?=
 =?utf-8?B?WjU0ZSsxQ3c3djVEUEp2ZlE1eW5ja0lSV0podVhYTXRxbDVxaUpFVnFlRm9X?=
 =?utf-8?B?bzlCYm5BMlVhZFVLOEJ0UWV5eU1oSFBXVDEyRGtTd0pxNnpRZzU3T0c5M2o3?=
 =?utf-8?B?dkFtQk9GSTVRdkNWeWJ3OEl2a1MvQVdWMldDNndXcCttTzhQN1dVZ0FCc2s4?=
 =?utf-8?B?WGtKU21OajVvd2tJZ01IOVdQZEI0K1BqL2N4WXBpTTNabWNKMjlkRWlVWTBu?=
 =?utf-8?B?Tk9iclFFekpha1JEVk9uL0tlMHp4RHVqb215SC9FVk5MdDd4Zml6RnVkSEZl?=
 =?utf-8?B?QXlFWTZoMVJzb0FRSFp6aHFNNGNkR3YzQ2xNRnE0WStMb3VJZVdqWWIxRmhF?=
 =?utf-8?B?eXNNc2liTk55N2NUeDV5MWlyeENNL0drbnRBZ3ZOc0l0aFBGYUZUVGpFa0xj?=
 =?utf-8?B?SFVHRHAwZ29ORTZkTUVCdG1tN05rajJ5VUU2a3FWajdLeGs1VVJDM3NYcjFK?=
 =?utf-8?B?cGVzaFRnVElkN2VadjBwcG1vb3VBNzJCZUQrMXQzbEk4aUMvKzA4SHZ3VU94?=
 =?utf-8?B?aFpVTUhOZkNuRTJFVjhpcVdhM3Q5QjlXS20xR2cxb3MwZTExNkRzY3NMS2J6?=
 =?utf-8?B?cmF1V2EyaEw4Y3ZOazQ5eUJuVXM3VW5Cc1NFZlo2NXMvTDQvNnExUTVBcitT?=
 =?utf-8?B?SXhhLytoMlpZcWVxUmxSVlJTZE1lNXp2ZlFuYzJROTRLTGZBRmVOd3M2TEVq?=
 =?utf-8?B?aHBzQ0hyUG9UMldUQTVMUUpuVlZXbnpLdS9yaW1yTzl5TmZLTXZqbzA1a2Vo?=
 =?utf-8?B?MHNmVEg4TGoxVHRwTzg1eVBYdVNnRFg1ZlB5NFlhYmRmRisyWFhjNi9FdnZ6?=
 =?utf-8?B?MFNlaDZ1NHFRV1NvOU9SeW5EeTlNUDFiZUU4aGJZcTJhRmdIOEYvUjJXcVU1?=
 =?utf-8?B?dDZVUEtoNzh3SktERC9MNjdpWXNKKzVwNEx4eCthWGovbC8zemVHdUd0SjZG?=
 =?utf-8?B?UlpEL0plUWZWaHJTS2dmc0lsUFpYQlZ0Yk1wWEIzYnhSa0h2bi8rVCtGM1g2?=
 =?utf-8?B?Tkp3cVBVVnNwZVVTZXFBTVVMT2dnd2t6QmNuWXFwWjV0cHVsZFJuZFhmNlhB?=
 =?utf-8?B?OXQ5ZFhZL3NGYWI3TmZva0hjcVVRVTRYck5jQ2hzdWg2d0JRMGtlWjFZZGl6?=
 =?utf-8?B?SG45Q0pkYjRwVVAzcEFTRjFDeUpaYW1UVm5xck5EWWpEWDczWDBCaVVmTTE4?=
 =?utf-8?B?YUtTbzEyd2RnTDIxRXdJWDdaRzg3S2tPV0xOclRTVmp2TXlaN1Z1Ukt0c3ZQ?=
 =?utf-8?B?TG1TQm1ZMXBSRE4xekhEYlNJblBtcE5CTi9MV0N5U2d2VVk1NlVQb2JhTTRz?=
 =?utf-8?B?cFE1QWhjVnpDd2xCMURBRDRSak96ekV5R01KR1RPeHBnNFcxTjcxbUk3WklP?=
 =?utf-8?B?YUY4dEFJT2hEN3ZjRi9BSkh3ejZjTXN1RzZCUFRDTDB2THVQREFVaEdYMmtj?=
 =?utf-8?B?MmZFWjlRcDN0QVMxMU5zeC84UnYwbDR2blc0b0NBMmJ5VXJ2dm1taW1lK3Qz?=
 =?utf-8?B?U05DNGNyS3hUMmtaSmRKSEtyNnBqVHh5TjVPVVFla3FCdS9hekg5YzFUelpm?=
 =?utf-8?B?dW1pZ0I3c0hFV0FCeG1pV21NUlBKLzVNRkd2SUdadEFvdEZncUVKS0RoSlVx?=
 =?utf-8?B?b1JNNldhbTNzVkUyaXBCSEhPR3hlRjlzZTMvVi9tOFpWTUdwWGViMkk4V2R1?=
 =?utf-8?B?YU9DK25oSEtoNHJoNWRCTnRZK2JBRTRsZ1Z1S3ZMSUhWRGcrQXJDTC9YMEY1?=
 =?utf-8?B?aHo2SmUzTisxNFN2R29ERlcxMC9PcFZPVFpVQUUzQmpDRkNhK3VtbmlvTE1G?=
 =?utf-8?Q?LGP+vmZ7JFh0RbiFGTTGgCeKx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <469B083AE88EAC40A95C93A9731BF943@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5500.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a00c9b-96b4-44a2-c7e4-08dabd8fb5fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 11:36:55.6805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2lA509l2Nn/7s2uSmqBpmxU63VcON5bCcOIZ+2uUEdIomoyvFC2H/CczhgDL+cnLch7Yam8xx/NkEOycUSnXag==
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

DQoNCk9uIDExLzEvMjIgMjM6MDcsIEpvbiBIdW50ZXIgd3JvdGU6DQo+IA0KPiBPbiAyNC8xMC8y
MDIyIDA4OjQxLCBXYXluZSBDaGFuZyB3cm90ZToNCj4+IGNjZ3ggaXMgcmVmZXIgdG8gdGhlIGN5
cHJlc3MgY3lwZDQyMjYgdHlwZWMgY29udHJvbGxlci4NCj4+IFJlcGxhY2UgY2NneCB0byB3ZWxs
LWtub3duIHJlZ2V4ICJjeXByZXNzIi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBDaGFu
ZyA8d2F5bmVjQG52aWRpYS5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtbnZpZGlhLWdwdS5jIHwgMiArLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbnZpZGlhLWdwdS5jIA0KPj4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW52aWRpYS1n
cHUuYw0KPj4gaW5kZXggMTJlMzMwY2Q3NjM1Li4wOTM0ZjhhZDdmNDkgMTAwNjQ0DQo+PiAtLS0g
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW52aWRpYS1ncHUuYw0KPj4gKysrIGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1udmlkaWEtZ3B1LmMNCj4+IEBAIC0yNjAsNyArMjYwLDcgQEAgTU9EVUxF
X0RFVklDRV9UQUJMRShwY2ksIGdwdV9pMmNfaWRzKTsNCj4+IMKgIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcHJvcGVydHlfZW50cnkgY2NneF9wcm9wc1tdID0gew0KPj4gwqDCoMKgwqDCoCAvKiBVc2Ug
RlcgYnVpbHQgZm9yIE5WSURJQSAobnYpIG9ubHkgKi8NCj4+IC3CoMKgwqAgUFJPUEVSVFlfRU5U
UllfVTE2KCJjY2d4LGZpcm13YXJlLWJ1aWxkIiwgKCduJyA8PCA4KSB8ICd2JyksDQo+PiArwqDC
oMKgIFBST1BFUlRZX0VOVFJZX1UxNigiY3lwcmVzcyxmaXJtd2FyZS1idWlsZCIsICgnbicgPDwg
OCkgfCAndicpLA0KPj4gwqDCoMKgwqDCoCB7IH0NCj4+IMKgIH07DQo+IA0KPiANCj4gQ291bGQg
d2UgY2hhbmdlIHRoaXMgdG8gYmUgUFJPUEVSVFlfRU5UUllfU1RSSU5HIGluc3RlYWQgb2YgDQo+
IFBST1BFUlRZX0VOVFJZX1UxNj8gVGhlIGJlbmVmaXQgb2YgdGhpcyB3b3VsZCBiZSB0byBhbGxv
dyB1cyB0byB1c2UgYSANCj4gcHJvcGVyIHN0cmluZyBpZGVudGlmaWVyIGluIGRldmljZS10cmVl
IGZvciB0aGUgVGVncmEgZGV2aWNlcyB3aGljaCBpcyANCj4gbW9yZSBmbGV4aWJsZSBhbmQgZGVz
Y3JpcHRpdmUuDQo+IA0KPiBTbyBnaXZlbiB0aGF0IHRoaXMgaXMgZm9yIE5WSURJQSBHUFVzLCB3
ZSBjb3VsZCBzaW1wbHkgbWFrZSB0aGlzIC4uLg0KPiANCj4gIMKgUFJPUEVSVFlfRU5UUllfU1RS
SU5HKCJjeXByZXNzLGZpcm13YXJlLWJ1aWxkIiwgIm52aWRpYSxncHUiKSwNCj4gDQo+IFRoZW4g
aW4gdGhlIHVjc2lfY2NnLmMgZHJpdmVyLCB3aGVuIHdlIHJlYWQgdGhlIGRldmljZSBwcm9wZXJ0
eSANCj4gImN5cHJlc3MsZmlybXdhcmUtYnVpbGQiLCBpZiBpdCBpcyAnbnZpZGlhLGdwdScgdGhl
biB3ZSBzZXQgdGhlIA0KPiB1Yy0+ZndfYnVpbGQgdmFyaWFibGUgdG8gQ0NHX0ZXX0JVSUxEX05W
SURJQS4NCj4gDQoNClllcywgaXQgc2hvdWxkIGJlIG5pY2UgdG8gaGF2ZSB0aGUgY2hhbmdlLg0K
VGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KSSdsbCBtYWtlIHRoZSBjaGFuZ2VzIGFuZCB1c2luZyBz
dHJpbmcgaW5zdGVhZCBvZiB1MTYgaW4gdGhlIG5leHQgcGF0Y2ggDQpzZXJpZXMuDQoNCnRoYW5r
cywNCldheW5lLg0KDQoNCj4gSm9uDQo+IA==
