Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8684260C512
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 09:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbiJYH1H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 03:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbiJYH0u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 03:26:50 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF29D14EC52;
        Tue, 25 Oct 2022 00:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecrYiEFvyUxueikQk0o+Sm4LggGRpplx9VJ+ercswsNQ/i+Z+X2BLFf9aItvtYtj/QUL0AEv2egCr2ZjQZLT+DpVXH+sLODRVIL8BPLlJPHC//wEKBSxbpE6PjtWgtHSs5vPUPc/3wRpAW4ITtAZYTYQdaiOsTNQBxDcnqSdki/EicOvlTUxxXuDze4j9YUGbTJmKUcR66mk48Yia6PSEUoe4Wtvy7rNVkBx7X5ot5J/Ylf/SMR6TPPrx/oNID/e8U6UPN1XFGG08Muw4TCpbovJlQZhxQWVik7sFBu4Fy+UJLYDOK2E9kfAvKoEMsjKXWdZ9Oa7CTbMJ/+hMaZj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEJpvu6PxJJ9Jyi0WOYLzHM8EYqhpVjw+uYRV6xaTkc=;
 b=k51shaguM74vyzc04mK942ojipK9wHz7q3/odvVzGo4lIIr4VbkXRPQhpfDhvtutB4nHxsPBwqe3PdZHUemCa1dO5chomTHovTTOBYgVvZktO8u8oDcyCBbbRXoBruFsmHoGg4wZvCMxEKwHhR8OemTb6v2lr2LaCPvkWJjhQZgN0rY7FjD80VKXXtBGr4yQ7F8fivcg377S0aXETjRsyAaJFpXU7iKiEaaOCYph1dehvW6Mb9OmS+A1x2J/8amkT+z6nGHEwWvKadq4EVF2v1AdzWxlglT5a6yFJoSMRSmIy+PFGxtP5dEjI7saL4RYlDMIx1wWnmwIuKSh7I4cUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEJpvu6PxJJ9Jyi0WOYLzHM8EYqhpVjw+uYRV6xaTkc=;
 b=XVLxs1Y7y70d2EuvVWwLetsaGFJ6MHzq2GjJrvr2rW8q0TT3JCd6zHWCnQdUc3znp4GLy3kZM8rEf5Gq0tCR49/1s7DdLv8G9AqTK3MQ+/1kBeiiYl+Rll8evUik9uBBVnQbQNvX8sIDb19HYHvPKEjv2jYInyQlQRYEtxIg4umzA/K1wUvhNr6rCfpoS17YkZz3Naks3NaTH/PN568+9225zOeFD3hsU842lcExhwbdNTzuFwilV9w6ya6FnhO+eD+/NqRsjIVyghDPufyWwc2iyMIXqUDorThQtGmhhHWfTHx5qQ9LrS7dQCS4GWt13yaDKVrJ9gFiUIbVC7HxKA==
Received: from PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8)
 by PH0PR12MB5499.namprd12.prod.outlook.com (2603:10b6:510:d5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 07:26:45 +0000
Received: from PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::b482:3b7c:c503:9d11]) by PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::b482:3b7c:c503:9d11%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 07:26:45 +0000
From:   Wayne Chang <waynec@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Ajay Gupta <ajayg@nvidia.com>, "kishon@ti.com" <kishon@ti.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        Jui Chang Kuo <jckuo@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sing-Han Chen <singhanc@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 06/11] usb: typec: ucsi_ccg: Replace ccgx to well-known
 regex
Thread-Topic: [PATCH 06/11] usb: typec: ucsi_ccg: Replace ccgx to well-known
 regex
Thread-Index: AQHY53wgD8IboWOR1E+cH9zW1z3DA64dLr2AgAAHv4CAAAS4AIABfBcA
Date:   Tue, 25 Oct 2022 07:26:45 +0000
Message-ID: <0e00952e-fa54-bbca-7608-09fd08356513@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-7-waynec@nvidia.com>
 <Y1ZGZ2H0/ug3se6j@kuha.fi.intel.com> <87czaheiag.fsf@balbi.sh>
 <Y1ZQ3NyR7Suxdltu@kuha.fi.intel.com>
In-Reply-To: <Y1ZQ3NyR7Suxdltu@kuha.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5500:EE_|PH0PR12MB5499:EE_
x-ms-office365-filtering-correlation-id: c7dff19d-bb42-45fc-4070-08dab65a455c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RimNoRf87YSRv74h5siuexDZ/61VmfQnSd8yIZjhz3iOmC6AGyLLAFJv+xvssnE2kMSK9uXZDZY1OYHFQwKhbgOjLo+SMB5ts/M/bLJs8kLos3fg6o43eyU5AhzXyjVUd249JXq+QUnrO8bXSptqJP8Yj8AoOIi5tZDAchcYD8GXLDBP7/gytbx18LZGGPUVkgTQcxeamROuK/vGoSnqL150zIpGxJtsu0DL1I+fFsiqDjomW3fCotOgoqIlCwDLS0SR75AApEcIbMk3T0GE6MLERwXSzO5K46Co4R5JxBfWr5AO0ciPvNb6As5E86vzTohrp8MCXQqihM+b2l5hByeTosfbKGSK4ZaC4zhcGAa5156PZQ4psMkS+073A2aqLQ0OJc82kKCpj0Ome0rP2VnyobqOpceX0pSF1f/mPx1uoH0KOOBFeq+FafYK5gZ49q+wtZhZuQCxbFnDZ5VxZb0SO1xkrK6a8vK2YVPLJPN+nVPvZeZVLTXjZTaOuyvO0dO+MA3pHXwSpCRoPPsH5KimKvu+SL0uEUV+c3uUGHOTE89QGqnNRTaC8pQw0E7DTMOR/EAy4b6FQ3h+p+iMfTNZtL/X43Xy7AZTaNFYWVEjl85Fs7p1EPCY4X89IklZ2NtWDz8g1daANeR/kVirBZOrgKHbYKDQS02RS4ZBBAYx9fl9uhK1qtlPr5KREdBeRbOFS1+S9fLKzcTx8y4xu6x/ruN325CMInzcc+eLv1aXBRRRV4CTEIK9cKRkxCJSr4iIAZQoCCOjLNhCHTp2TA2CRGdhxWlvkZJ+QRu+xhAq69MH740aC4StbR+k2qyqy/lguLp7CUu0U0a5DrZWEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5500.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(451199015)(6506007)(66946007)(76116006)(64756008)(66476007)(66446008)(4326008)(66556008)(8676002)(31686004)(53546011)(7416002)(71200400001)(478600001)(5660300002)(2616005)(26005)(54906003)(86362001)(122000001)(110136005)(6512007)(41300700001)(36756003)(38070700005)(8936002)(186003)(38100700002)(2906002)(6486002)(91956017)(316002)(83380400001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkVLUnRmUU5sWXNka052TmhVRTQvNjd2MGxTZUxIZGd2NWUrZFFSQ0RmR2dp?=
 =?utf-8?B?YmtNckp5UUlSY0k1RWhrejllMmxuRDQ3NTZVa1hvY01BcjJXQ2VBbUtMZnli?=
 =?utf-8?B?Q0k1N2grSXo0d2RKWTVzZkJmRjRveExCdytjbUl3c3dmU0RMV2syWFFka21T?=
 =?utf-8?B?eHAvSS9nMldkNEtzdDZsVGhyOVFUMU4vNlNuUU5uZVloaWN2WlJraWQ3ZCtw?=
 =?utf-8?B?RVorYi9MQ3lmVzQrNVIwRzBoVnBUQVRzV0pEQVRnWm92K3FZOXNTZmwwbWJy?=
 =?utf-8?B?WHpRVXRrMFFIOVFxMzRHSEJtU3RhQVhtSTk4VDh4MzBnYkZSSHArekRhbUE5?=
 =?utf-8?B?OVhkUUpQdnFNb016by9OTnp2bHhNU25YeGhSV1JNSlJSMUttdEVSTGkrQW9m?=
 =?utf-8?B?Szhsa3l1c3JxaDFVZkpwdVZ1ekVUVXJXU3BSQ0l4V1ZVT1kzakduZVpKa1Rq?=
 =?utf-8?B?K3JLcUowYS92aEJ4NWVOeWNnRjhsdnVMWlVkY01mQjc1S1ViRFFSbGF1NWtK?=
 =?utf-8?B?d1VHOEVsN2E5QVl0a2RDWFV5dWN5NkhuL016UytsUmlYc0NSRHJvS3M1QTV0?=
 =?utf-8?B?Rmhtdk94czBJajhSd1M5U1dhSis3blN4RXZoL1p3Qk1UUmpVcmxUNlV6dGFO?=
 =?utf-8?B?ZzVxSnYrNi9qdkx3TjcreHdsQXpZTW0zMzlUTE9OTUxBVUlmb0JKRWVjaHo5?=
 =?utf-8?B?dW56eSs1dUlPOWJ2Q0JXQW14cThhbVhFZDFzeGtmVFJMenJ2TXdzelUrZ3c2?=
 =?utf-8?B?bldSWjhtMXBKYTlHZmVBeS9QWVE5Yi9Ud0Y1UDlvZTNwLzdmUDNFdUk3Uy9h?=
 =?utf-8?B?eENpblk5bGJuZlltU2xKb1ZOT2VzcXY5Z0JINTdaT3BuWnlXOEo3SUxtUito?=
 =?utf-8?B?Wk1TME1vZm5KVVVrc1NiZjFtckcvUWxwdVV0eHVCbmJNRHRHTFFUVmNXekZp?=
 =?utf-8?B?ZE5RUzljaWU2RUVUVmFoZUVEaXdPMnVMa0srN3UrczZ3QmNRSzNLRHpiZk9s?=
 =?utf-8?B?Tm1jMkFibWZpT1JxbTRHOGczc3M2eldBV2l6T1NjYTY2eUYxdUtBVzBaV0Z1?=
 =?utf-8?B?eXovMEFPaHBBSDJXakU2N013VlE3UDdxZVVRbS9JQk5YdHhULzZjN2RGcXZF?=
 =?utf-8?B?U05tVGs3VkxsQkV4Q3R4a09xUnp1bElYMmRNWTE5eVRnREtRalUyN3Q1ZUVL?=
 =?utf-8?B?M0ljS3JRT0dPdTVXWHk4RkJEc2Z2cE40emxIaGcrY2JqbzhnRmxtMW5qbnlv?=
 =?utf-8?B?MkpseTRzclpJSjg3Wkl0aktVbDZSTlJWcDBrWkdwbHNHZHU2ajdEWGZ6bVN3?=
 =?utf-8?B?NTRoRVlGZEN5OVpHNFlRS0huRlVwWmZsUGc2ZnoyaG1Ua0JLenpIUXREa3ZL?=
 =?utf-8?B?YnVtcXhtU0c2anE3ZVFYTFRpbXo2WmlwSWFoN3ZLczAybjRNZTVmNWcrZHJJ?=
 =?utf-8?B?bThObzMzdjJSUzBBZXlvcHpPMzRwL0VLNFloSFNpSG4wU1UzUXlXMlo3WXNr?=
 =?utf-8?B?Yi9FbGx3NWFKOUJSOG5FbnFzNndlaEt3Nnk1NFB4VXVWd0lJR2FlMGJubmp2?=
 =?utf-8?B?VlJiSDQ0cE1VblJ6SkNPMDU1SFN3T3JXQUNQR3BXYUJUcFMzaVFRcVZHWFJr?=
 =?utf-8?B?NjltSTh6OFhBU0loWFhZRmV3LzlLVlRHYlprOEt1QUtGSEZwcmx5SnBNaEFC?=
 =?utf-8?B?QzJjaHp1MzJMWVBkWW5DVUU1M3BVYnpDdzNnVDNhMEVST3lzdFZVK0xNT01p?=
 =?utf-8?B?K2lkalAzR3hjUUJsclh1bXIyakwvUEJ2aFdRdUpmZUN6UUFxMGR2bE9pcjBM?=
 =?utf-8?B?WWxDRVhTMzlRU0htQXZXckZwVnZoWUNYNTFwQWZLU1BxdTAxVkEySzZIdmMr?=
 =?utf-8?B?TlVGSkZLTFhMVGNLTkI3VHVuc2V1bTU4WTlNS1ZFdTdpdG5wMnMrOUxDOGN5?=
 =?utf-8?B?cEp1eGJ0OFFLQndvN2pTV0VubWhidDNxYStheHNLbWE1WlNONjMxak5jT0hQ?=
 =?utf-8?B?TVo3bUNWcTh5clJVMHFhZzU1dXJrTnFmOFRFL1ZMSnNFWmNNZlIzaFFIYzQv?=
 =?utf-8?B?b0pSc2wrcm5kRld3b21abmVaRlFvanRaQXpHbnpYcEo1dkdZRmxqU2FsSFF1?=
 =?utf-8?Q?fGQIodrAtoffSetjH3Cqvyjva?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70FC22EEB8123C4CA4AAC5677D5AEE78@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5500.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7dff19d-bb42-45fc-4070-08dab65a455c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 07:26:45.3019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PH8d5zA5dsfFox3jv4JFv54sJDvvjmQsC3RjILoBeiK4s+hBKCu4XDUfyDU4+b68KCwOcJ2+N3svsJQ9yPw61A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5499
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiAxMC8yNC8yMiAxNjo0NiwgSGVpa2tpIEtyb2dl
cnVzIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBv
ciBhdHRhY2htZW50cw0KPiANCj4gDQo+IE9uIE1vbiwgT2N0IDI0LCAyMDIyIGF0IDExOjI5OjI3
QU0gKzAzMDAsIEZlbGlwZSBCYWxiaSB3cm90ZToNCj4+IEhlaWtraSBLcm9nZXJ1cyA8aGVpa2tp
Lmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbT4gd3JpdGVzOg0KPj4NCj4+PiBPbiBNb24sIE9jdCAy
NCwgMjAyMiBhdCAwMzo0MToyM1BNICswODAwLCBXYXluZSBDaGFuZyB3cm90ZToNCj4+Pj4gY2Nn
eCBpcyByZWZlciB0byB0aGUgY3lwcmVzcyBjeXBkNDIyNiB0eXBlYyBjb250cm9sbGVyLg0KPj4+
PiBSZXBsYWNlIGNjZ3ggdG8gd2VsbC1rbm93biByZWdleCAiY3lwcmVzcyIuDQo+Pj4+DQo+Pj4+
IFNpZ25lZC1vZmYtYnk6IFdheW5lIENoYW5nIDx3YXluZWNAbnZpZGlhLmNvbT4NCj4+Pj4gLS0t
DQo+Pj4+ICAgZHJpdmVycy91c2IvdHlwZWMvdWNzaS91Y3NpX2NjZy5jIHwgMiArLQ0KPj4+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pg0KPj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvdHlwZWMvdWNzaS91Y3NpX2NjZy5jIGIvZHJpdmVy
cy91c2IvdHlwZWMvdWNzaS91Y3NpX2NjZy5jDQo+Pj4+IGluZGV4IDEzOTcwN2EyZjNkNi4uNWQz
MDk5ZTZlYjc3IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL3VzYi90eXBlYy91Y3NpL3Vjc2lf
Y2NnLmMNCj4+Pj4gKysrIGIvZHJpdmVycy91c2IvdHlwZWMvdWNzaS91Y3NpX2NjZy5jDQo+Pj4+
IEBAIC0xMzU4LDcgKzEzNTgsNyBAQCBzdGF0aWMgaW50IHVjc2lfY2NnX3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQsDQo+Pj4+ICAgICBJTklUX1dPUksoJnVjLT5wbV93b3JrLCBjY2df
cG1fd29ya2Fyb3VuZF93b3JrKTsNCj4+Pj4NCj4+Pj4gICAgIC8qIE9ubHkgZmFpbCBGVyBmbGFz
aGluZyB3aGVuIEZXIGJ1aWxkIGluZm9ybWF0aW9uIGlzIG5vdCBwcm92aWRlZCAqLw0KPj4+PiAt
ICBzdGF0dXMgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF91MTYoZGV2LCAiY2NneCxmaXJtd2FyZS1i
dWlsZCIsDQo+Pj4+ICsgIHN0YXR1cyA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX3UxNihkZXYsICJj
eXByZXNzLGZpcm13YXJlLWJ1aWxkIiwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmdWMtPmZ3X2J1aWxkKTsNCj4+Pj4gICAgIGlmIChzdGF0dXMpDQo+Pj4+ICAg
ICAgICAgICAgIGRldl9lcnIodWMtPmRldiwgImZhaWxlZCB0byBnZXQgRlcgYnVpbGQgaW5mb3Jt
YXRpb25cbiIpOw0KPj4+DQo+Pj4gVGhpcyB3aWxsIGJyZWFrIGJpc2VjdGFiaWxpdHkuIFlvdSBu
ZWVkIHRvIGZpcnN0IGFkZCB0aGF0DQo+Pj4gImN5cHByZXNzLGZpcm13YXJlLWJ1aWxkIiBpZGVu
dGlmaWVyIHdpdGhvdXQgcmVtb3ZpbmcgdGhlIG9sZA0KPj4+ICJjY2d4LGZpcm13YXJlLWJ1aWxk
IiBpZGVudGlmaWVyLCBhbmQgdGhlbiBpbnRyb2R1Y2UgYSBzZXBhcmF0ZQ0KPj4+IGNsZWFuLXVw
IHBhdGNoIHdoZXJlIHlvdSByZW1vdmUgaXQgd2hlbiBpdCdzIHNhZmUgdG8gcmVtb3ZlOg0KPj4+
DQo+Pj4gMS4gQWRkIG5ldyAtIFRoaXMgcGF0Y2guDQo+Pj4gMi4gTW9kaWZ5IHVzZXJzIC0gUEFU
Q0ggNy8xMS4NCj4+PiAzLiBSZW1vdmUgb2xkIC0gKm1pc3NpbmcqLg0KPj4NCg0KdGhhbmtzIGZv
ciB0aGUgZ3VpZGFuY2UuDQp3aWxsIHVwZGF0ZSB0aGUgY2hhbmdlcyBpbiB0aGUgbmV4dCBwYXRj
aHNldC4NCg0KdGhhbmtzLA0KV2F5bmUuDQoNCj4+IHdpbGwgaXQgZXZlciBiZSBzYWZlIHRvIHJl
bW92ZT8gV2hhdCBhYm91dCBwb3RlbnRpYWwgcHJvZHVjdHMgaW4gdGhlDQo+PiBtYXJrZXQgd2l0
aCBsaXR0bGUgdG8gbm8gdXBncmFkZSBwYXRoPyBUaGVyZSBhcmUgbGlrZWx5IHRvIGJlIHByb2R1
Y3RzDQo+PiB3aXRoIGEgRFRCIHRoYXQgd2lsbCBuZXZlciBiZSB1cGRhdGVkLCBubz8NCj4gDQo+
IE5vdCB0aGUgY2FzZSBoZXJlLiBPRiBzdXBwb3J0IGlzIG9ubHkganVzdCBhZGRlZCB0byB0aGlz
IGRyaXZlciBpbg0KPiB0aGlzIHNlcmllcy4gVGhhdCBvbGQgaWRlbnRpZmllciBoYXMgYmVlbiB1
c2VkIGFzIGEgYnVpbGQtaW4gcHJvcGVydHkNCj4gb25seS4NCj4gDQo+IHRoYW5rcywNCj4gDQo+
IC0tDQo+IGhlaWtraQ0KPiANCg0K
