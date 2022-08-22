Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8A6C59BD93
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 12:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbiHVK3k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 06:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232445AbiHVK3j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 06:29:39 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817182ED53;
        Mon, 22 Aug 2022 03:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOOrKKbARZOgF1A5WBNjpJs8jKLel7XJpGj9lTelAg9+pQ7cCooVHqRpC+9uf6O0Ya+0z7R1avN6NEdNOhoQoBpHRzjhYHB4HM6GpDaeHMy+gJ3pjTfOxc0C5BJOpaO9UUhjhJ5UStyYcLf64GDSGQ245PvAntv6AOs/eWvA+oMi8gjqY152nr2A260DOKz3fEnwDZPP7/5Q91UeOwmXsGhJFMeCxjXEVj+AVL1u/aAOk3K3wAU6itTlSRRdnCyDRrqdSZ1DEYhVh3sweh5wH1GLByCX81pdMs6k+dNzjtku+goKySGzPmKymM21TlFEnALxELBz9s3SRMcFitSh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=As1IGX50hxBYhzwZlkAr/tpRwXTG65uaUg0nT8+AXLw=;
 b=VFW4Xrq5/91hf/Few3MTnqQbHtLHbc1wefevE1BpjxX81b7NhzQ3zM6zvJsJu86lfa+lVXBRKBvCnOEjALBrqgHHlpzbmMQqbLIPX+zAeJ4SRFIG0rxOOG2cg4SUrkYy8FF+mvYFkjW1cxR2v4JlQZqIqXEmc8Tu3OjFH3/6+V51mbJ8YUo7m3hDfD9VueuvHC/o5pgZ2HSaJZ1sca99eyy1UZY/BveMzH2cJqYnNdMe4TwUprHD4limQSLeWaGRDrhW20Pcv5WcIewcm+kV/TrPUBZl5Cs5xe2cQwdm2nvdnQJFAOTGYrktsZI/2JD84ETQC2/bYJi/mWonMLuqvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=As1IGX50hxBYhzwZlkAr/tpRwXTG65uaUg0nT8+AXLw=;
 b=Wcb3ShgPF6/ECWLPsFrBTHMsfft9xgIZabFt/VJr0l+rRBnUAj+tVE7+zeNN9mrKFBHg4Tyk81jcqaZULJ2J0mCOcaYU/tt9i/tAiSTt+mtCGzXfi4DjjHuQWmpkvwT5t0UyfdtTepYc5aObXR0kKqlHaXJkZTp8yhT0fSr9ml26Lcrx1vWWVCXM52xTcF6RUUY5IlLrU3ppHfwYi3HYv+BCudtXfW1WMVJovvcXyHMe8DTp+mQKZ98Ik62gQ5qL3pmTLm8R5jncX6t6KOwru3EpR5EtpaAuJLJU91cCEp0S4FrZ+tC1M3f3or43A51/OspG6pYCopZ7AoqxT0wUTQ==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by DM5PR12MB1244.namprd12.prod.outlook.com (2603:10b6:3:73::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 10:29:36 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::24cb:46cd:5176:aa13]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::24cb:46cd:5176:aa13%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 10:29:36 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Dmitry Osipenko <digetx@gmail.com>,
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
Thread-Index: AQHYs8aKp+OlLQycOkO470/UfA2RzK22VXAAgAADTwCABBngUIAAPbIAgAAHnMA=
Date:   Mon, 22 Aug 2022 10:29:36 +0000
Message-ID: <SJ1PR12MB63396DC508F63807F1CE9901C0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20220819122313.40445-1-akhilrajeev@nvidia.com>
 <20220819122313.40445-2-akhilrajeev@nvidia.com>
 <20281ca7-e597-7030-4861-5f9a3594726d@gmail.com>
 <89a746fd-a98e-3147-7811-33c5051c2b6d@gmail.com>
 <SJ1PR12MB6339FC1F82EB1BB7417E533BC0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <ebb0764f-db92-d69d-49ac-151f4e3e0b8a@collabora.com>
In-Reply-To: <ebb0764f-db92-d69d-49ac-151f4e3e0b8a@collabora.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c17b7cd1-c058-4683-e9f1-08da8429362a
x-ms-traffictypediagnostic: DM5PR12MB1244:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0k/xMoKhf66lh5DCqEPkIVzFD1f5eRJUfGzRDPxvgwYBxtx+TtxmcCQgQr4D2+pOJ3e1UuV10a5+KE1fUCxJNtkgnqYKkCGXWr6YC6kjdux+XCFS095ZtXeEDITAAD9q6xzDOfhSC7bKdxkB/qwSmii+CEAUbcDIY+gnr4n2tmAAUOxf1QO5TqBs1g8shh/ZslBZcv0RdZysVrLPSM5lB3r8vWpblGpyuFZLMqOhH361OmXSMEZ0ix8idbPJP24ZSc4YAKwHy2Te6am0Bh+Sa0I/uNK7n7ctcZL1oOKw3Jqmltdk8Tb1LmlwJnLiBU33+jLtQXsoJ5H3b19weKtgOjwA2WksZYukt02421OXtPcn01X6CzD+8zNd07FGfnmMKKehpUi1/yGHXqE0D9iv/v5c5kALddATz1Q8xPYgrx6E08kXeOT5gCUTK1zTNQ6K/ykNhhmQ3trYPGYPaoEkcVvjrxp0NU65CdNj99W5pbMnbqz0s+8/YIsP9lqcPioKzOKxTjBqF1Q/MzOWgSSgys5Xgx/wrfwSRmtaYdbGuOT4wXwQLBUOA3X9K6kcyiawIqVZcLNPffIMkV9ezFpuKiD63Q8ZvCb/5mWamSt/1w9LeaaSXvajMSW3o4ki6J1pPE6NMNfYV4YJROZyStoB2n2pbmb+v/oITr+x2qQ6vUgWiX9EMxxGLR++LV36E7y7KNzoXawO0n5tYDHtTVSV3O0cBTrfbBtzlqolO8J9HrrTyemx0vXP7e1hIRwaBUoxbrK4V+MJXm5oOdzcXuXU1m/n8VbsvwHDWbczw/lUVcw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(71200400001)(478600001)(83380400001)(316002)(26005)(9686003)(55016003)(110136005)(33656002)(186003)(38070700005)(38100700002)(66946007)(122000001)(64756008)(8676002)(66556008)(66476007)(66446008)(76116006)(7416002)(2906002)(53546011)(41300700001)(6506007)(7696005)(86362001)(921005)(52536014)(5660300002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlB3bFUxRGgraDJTWHdOUkZjblR0Nm9XcXI4N01TeFo0OU5lSkpGbHlzVW9u?=
 =?utf-8?B?VWl3eGNPZTlvQ1lYdHppcThSUEVSeHErbVFiMGp4NngxVzdIaXlhQTZCWDVL?=
 =?utf-8?B?eEVEa0NGd1JwU0paNzJlN0h4UHVzWXh2RTBoeDhHaDhMZ2JBV3dmakVtR1hN?=
 =?utf-8?B?MnAzSFdmTUpqUUZGSzVDQjlDWG9jVWQrZGwxR1hwL1NSbnVNSnFsQ0dtemJs?=
 =?utf-8?B?VFJyVDhJR08zQjdDQUI4ZVorWW16N2F2cXlRSVRUNVRzdis3WHhwMCtNNThG?=
 =?utf-8?B?Q2d6bEhPdGluUG9xZk9OcHdORE41NjF2ZVBIQ0xJUGI5bTBZejBpcUtEamJ3?=
 =?utf-8?B?SUh4NVl1RzQ0L3MwdXpBSUpnV05tTEE3b0cyYUhEQzFrS0h0QTFHdlZvZ0c4?=
 =?utf-8?B?T1FOY3lTQzdVTk5JUlVJWnZkSWkvbmlick9EV2FJeUFzU3Z1L3MxZDdMcUdh?=
 =?utf-8?B?Q2RNR0dHVjBEcGY0ZXNCdVpXVjhyb0VwajVxZUNZbURaYlI2QUo2KzJBR1BK?=
 =?utf-8?B?YU1EOHRoUFY5cWYrbnYzNXZwVTRVckpCb2Jhd1R6dDlPSnpidUxVcGJ1Unlx?=
 =?utf-8?B?d1JmSTI0eTV3MmtJN3BObzQ0Mno3bE5NRXhSWjlFdS9vRUp4YlVpVTVZSzJl?=
 =?utf-8?B?OGlWTW5MckJRMHhOOVMzdEJOVHFjdXJ4RG9obHV6UHozQWJVNHBzNXZ5TG1P?=
 =?utf-8?B?emJNK2I2NEpDakdFOHBnbldieWo1SEgwV042R3NMUU1yUlprRnVuNFR0ZFFu?=
 =?utf-8?B?dW1SUWxjL04rWHg0WjNiMUpya3F2T3creE1obUY2N0VOcG1uU0lzd3c4Wm1B?=
 =?utf-8?B?N3NaNHUvVnhURm1JSktjcm43ck1WejVGNWNGMnB3clNJZE1MK2hYTktrVEhC?=
 =?utf-8?B?SUx2NDlVSFVXM25US0VnZ3FNUE13WTdKTkVhV0YzSGRjV0ZqYUdIT2RqTmR0?=
 =?utf-8?B?VWtCektwQlBNd3RUVTdRSjQ0S1VxUXJlWHc5MTBJRjhPaW5yRFlGOEFoUEVR?=
 =?utf-8?B?SG52N1dhNUo3Unc3enlQSnkwL01nQVFSbEFXZklVdHQ1aEt5U3RTMlJMem0v?=
 =?utf-8?B?bE0vRExjbDVoOEw0eXA2cVcyYkhORkdVY3FoM2RTS1kvUUYvcU1WeFJHc0Iv?=
 =?utf-8?B?SjZ0VStlK3BvMXVtZ21uQXNDMkhpNEg2REVWa096NUI0L2dRMnpMMUM1MnJY?=
 =?utf-8?B?dVcwZ0h6bStwb2s4aERscTdPZFJjZFRTWEgxUEdLYWtHMTI3S2RvRGVaK2pa?=
 =?utf-8?B?L0ZSNklVejRQUXZTeE8vYkxOa0ZrZWQrY055K25tbzRJRnZHc0hKcGx2TElC?=
 =?utf-8?B?YzlMUHREeS9WMmN1WFdEN01TV2dyOWtrM1RxM0Z5ekhXRVpJcVNFYmpsVVZo?=
 =?utf-8?B?dWM5NWxhRStEQjRXOUZ5ekFaRTJ0RzQ2WitoMkl0cHRyVW5oaFkzbFRVQmMx?=
 =?utf-8?B?bDJmbkFKenhkZ0RHMXQxT0ZjUVBhVG83ZDJzRHhYODBLd00xc0lNTlB4dWRn?=
 =?utf-8?B?amZLUEh6RnRZSDFxQjVjTW5BbFhlcDRjc1p5ei9keUNJRnV0T0hPdG1xZWNK?=
 =?utf-8?B?M0gvQ0tZYjc0S1BDYkJFd0lKRVdWUkFadm5YY211cHl2eHVhM0lheDlBNTMy?=
 =?utf-8?B?SjhMblQySmw4Qit4QTdqdXB4NklSS0djaGlVZXhaTDJGQkJ5WWsvbVpnTnMz?=
 =?utf-8?B?NHFPaFk5TU5BUGMrbTIyWnl0c2gzejBEOW8vVVEvcm5SbEMzQWlma3VqN1lC?=
 =?utf-8?B?b0wxUi9EWGIvY2hXREV3Tjhwd1Y3VGVDYURwU0lINm1qc25IejhmL2JUcW81?=
 =?utf-8?B?OGJWdFNjVFk4SEtkeVlKcTE4QVYvSUdwOG1RdXJQV2xYRlhzd1lBTTc5bmhl?=
 =?utf-8?B?c0RXMmd3NDJKR212dUY3MTdiVThCNGtmajJSb3dBRVV5TVFRd0JLTGt6VXZo?=
 =?utf-8?B?VTduVjg3K2JETm5BdXh3UXhHZy80eFg0T01sNlIxWTViMWNLN1NvTFY4Mm9m?=
 =?utf-8?B?Sm54ZWtQRm9tM2ppVkhaS1VkTk9ZYVcxZXVhVlBUR2QrYk1lMTBKdVdoQStB?=
 =?utf-8?B?Z3pvSldHbHhwS0hyVTRnd3k1V0VUMjFKN2ZqZk96Z3JiTEJpckFkNWhJVi8x?=
 =?utf-8?Q?GfXrMcXAdei+S2LjLHDcVaOR5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17b7cd1-c058-4683-e9f1-08da8429362a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 10:29:36.3184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGeRnWM9f8+8+UUTUTJtQ20cxCVn7wUVy5nvMWLh7ikBO5mep8F1rn0fUTYzYl791nR2cOzRh7rcbY55ogwZ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1244
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiA4LzIyLzIyIDA5OjU2LCBBa2hpbCBSIHdyb3RlOg0KPiA+PiAxOS4wOC4yMDIyIDE4OjE1
LCBEbWl0cnkgT3NpcGVua28g0L/QuNGI0LXRgjoNCj4gPj4+IDE5LjA4LjIwMjIgMTU6MjMsIEFr
aGlsIFIg0L/QuNGI0LXRgjoNCj4gPj4+PiAgICAgIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJs
ZShucCwgIm52aWRpYSx0ZWdyYTIxMC1pMmMtdmkiKSkNCj4gPj4+PiAgICAgICAgICAgICAgaTJj
X2Rldi0+aXNfdmkgPSB0cnVlOw0KPiA+Pj4+ICsgICAgZWxzZQ0KPiA+Pj4+ICsgICAgICAgICAg
ICBpMmNfZGV2LT5kbWFfc3VwcG9ydCA9ICEhKG9mX2ZpbmRfcHJvcGVydHkobnAsICJkbWFzIiwN
Cj4gPj4+PiArIE5VTEwpKTsNCj4gPj4+DQo+ID4+PiAxLiBZb3UgbGVhayB0aGUgbnAgcmV0dXJu
ZWQgYnkgb2ZfZmluZF9wcm9wZXJ0eSgpLg0KPiA+Pj4NCj4gPj4+IDIuIFRoZXJlIGlzIGRldmlj
ZV9wcm9wZXJ0eV9yZWFkX2Jvb2woKSBmb3IgdGhpcyBraW5kIG9mDQo+ID4+PiBwcm9wZXJ0eS1l
eGlzdHMgY2hlY2tzLg0KPiA+IE9rYXkuIEkgd2VudCBieSB0aGUgaW1wbGVtZW50YXRpb24gaW4g
b2ZfZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCgpIHRvDQo+ID4gY2hlY2sgJ2RtYXMnLg0KPiA+
DQo+ID4+Pg0KPiA+Pj4gMy4gSWYgImRtYXMiIGlzIG1pc3NpbmcgaW4gRFQsIHRoZW4gZG1hX3Jl
cXVlc3RfY2hhbigpIHNob3VsZCByZXR1cm4NCj4gPj4+IE5VTEwgYW5kIGV2ZXJ5dGhpbmcgd2ls
bCB3b3JrIGZpbmUuIEkgc3VwcG9zZSB5b3UgaGF2ZW4ndCB0cmllZCB0bw0KPiA+Pj4gdGVzdCB0
aGlzIGNvZGUuDQo+ID4+DQo+ID4+IEFsdGhvdWdoLCBuby4gSXQgc2hvdWxkIHJldHVybiBFUlJf
UFRSKC1FTk9ERVYpIGFuZCB0aGVuIHlvdSBzaG91bGQgY2hlY2sNCj4gPj4gdGhlIHJldHVybiBj
b2RlLg0KPiA+IFllcy4gQWdyZWUgdGhhdCBpdCBpcyBtb3JlIGFnbm9zdGljIHRvIGNoZWNrIGZv
ciBFUlJfUFRSKC1FTk9ERVYpLiBCdXQgc2luY2UgSQ0KPiA+IGNhbGwgdGVncmFfaW5pdF9kbWEo
KSBmb3IgZXZlcnkgbGFyZ2UgdHJhbnNmZXIgdW50aWwgRE1BIGlzIGluaXRpYWxpemVkLCB3b3Vs
ZG4ndA0KPiA+IGl0IGJlIGJldHRlciB0byBoYXZlIGEgZmxhZyBpbnNpZGUgdGhlIGRyaXZlciBz
byB0aGF0IHdlIGRvIG5vdCBoYXZlIHRvIGdvDQo+IHRocm91Z2gNCj4gPiBzbyBtYW55IGZ1bmN0
aW9ucyBmb3IgZXZlcnkgYXR0ZW1wdGVkIERNQSB0cmFuc2FjdGlvbiB0byBmaW5kIG91dCB0aGF0
IHRoZQ0KPiBEVA0KPiA+IHByb3BlcnRpZXMgZG9uJ3QgZXhpc3Q/DQo+ID4NCj4gPiBTaGFsbCBJ
IGp1c3QgcHV0IGkyY19kZXYtPmRtYV9zdXBwb3J0ID0gdHJ1ZSBoZXJlIHNpbmNlIERNQSBpcyBz
dXBwb3J0ZWQgYnkNCj4gPiBoYXJkd2FyZT8gSXQgd291bGQgdHVybiBmYWxzZSBpZiBkbWFfcmVx
dWVzdF9jaGFuKCkgcmV0dXJucyBzb21ldGhpbmcgb3RoZXINCj4gPiB0aGFuIC1FUFJPQkVfREVG
RVIuDQo+ID4NCj4gPiAgICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJudmlk
aWEsdGVncmEyMTAtaTJjLXZpIikpDQo+ID4gICAgICAgICAgICAgICBpMmNfZGV2LT5pc192aSA9
IHRydWU7DQo+ID4gICsgICAgZWxzZQ0KPiA+ICArICAgICAgICAgICAgaTJjX2Rldi0+ZG1hX3N1
cHBvcnQgPSB0cnVlOw0KPiANCj4gVGhlIGNvZGUgYWxyZWFkeSBoYXMgZG1hX21vZGUgZm9yIHRo
YXQuIEkgZG9uJ3Qgc2VlIHdoeSBhbm90aGVyIHZhcmlhYmxlDQo+IGlzIG5lZWRlZC4NCj4gDQo+
IEVpdGhlciBhZGQgbmV3IGdlbmVyaWMgZG1hX3JlcXVlc3RfY2hhbl9vcHRpb25hbCgpIHRoYXQg
d2lsbCByZXR1cm4gTlVMTA0KPiBpZiBjaGFubmVsIGlzIG5vdCBhdmFpbGFibGUgYW5kIG1ha2Ug
VGVncmEgSTJDIGRyaXZlciB0byB1c2UgaXQsIG9yDQo+IGhhbmRsZSB0aGUgZXJyb3IgY29kZSBy
ZXR1cm5lZCBieSBkbWFfcmVxdWVzdF9jaGFuKCkuDQoNCkxldCBtZSBlbGFib3JhdGUgbXkgdGhv
dWdodHMuIA0KDQpUaGUgZnVuY3Rpb24gdGVncmFfaTJjX2luaXRfZG1hKCkgaXMgYWxzbyBjYWxs
ZWQgaW5zaWRlIHRlZ3JhX2kyY194ZmVyX21zZygpIGlmDQpETUEgaXMgbm90IGluaXRpYWxpemVk
IGJlZm9yZSwgaS5lLiBpZiAoIWkyY19kZXYtPmRtYV9idWYpLg0KU28sIGlmIHN1cHBvc2UgdGhl
cmUgaXMgbm8gRFQgZW50cnkgZm9yIGRtYXMsIHRoZSBkcml2ZXIgd291bGQgaGF2ZSB0byBnbyB0
YWtlIHRoZQ0KcGF0aCB0ZWdyYV9pMmNfaW5pdF9kbWEoKSAtPiBkbWFfcmVxdWVzdF9jaGFuKCkg
LT4gb2ZfKigpIGFwaXMgLT4gLi4uIGFuZCB0aGVuIGZpZ3VyZQ0Kb3V0IHRoYXQgRE1BIGlzIG5v
dCBzdXBwb3J0ZWQuIFRoaXMgd291bGQgaGFwcGVuIGZvciBlYWNoIHRyYW5zZmVyIG9mIHNpemUg
bGFyZ2VyIHRoYW4NCkkyQ19QSU9fTU9ERV9QUkVGRVJSRURfTEVOLg0KDQpUbyBhdm9pZCB0aGlz
LCBJIGFtIGxvb2tpbmcgZm9yIGEgdmFyaWFibGUvZmxhZyB3aGljaCBjYW4gaW5kaWNhdGUgaWYg
dGhlIGRyaXZlciBzaG91bGQgYXR0ZW1wdA0KdG8gY29uZmlndXJlIERNQSBvciBub3QuIEkgZGlk
bid0IHF1aXRlIGdldCB0aGUgaWRlYSBpZiBkbWFfbW9kZSBjYW4gYmUgZXh0ZW5kZWQgdG8gc3Vw
cG9ydA0KdGhpcywgYmVjYXVzZSBpdCBpcyB1cGRhdGVkIGJhc2VkIG9uIHhmZXJfc2l6ZSBvbiBl
YWNoIHRyYW5zZmVyLiBNeSBpZGVhIG9mIGkyY19kZXYtPmRtYV9zdXBwb3J0DQppcyB0aGF0IGl0
IHdpbGwgYmUgY29uc3RhbnQgYWZ0ZXIgdGhlIHByb2JlKCkuDQoNClJlZ2FyZHMsDQpBa2hpbA0K
DQoNCg0K
