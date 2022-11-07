Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C95C61F2A2
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 13:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbiKGMMl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 07:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbiKGMMk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 07:12:40 -0500
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (mail-be0deu01on2094.outbound.protection.outlook.com [40.107.127.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE8B1119;
        Mon,  7 Nov 2022 04:12:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTYJKZTTWB8TjoytGtLUuhWTeM0RRMUaTzWmCCgTU7sXg6s4q2GjfPJumTb6ApdD/xMUeMMw7t4KMf06zAXdYP47qyaCRTJjAevAXIzxaL9wo+yhFxBoR5ZJUyOcP11yhDzlUHPlMCelx4BtQSujFWXNvbyunl7I4s35VmWUosEJgd8wS/3yUHuVO/6WTCq39SmD2mh47e5rbxaZsTHsCl1kdIYto98Q97qjEsuLrNOl55ZgSLBJctRvyA8ZZTMr2FX5DwgjurHDlJtqQUnfbIGxXhqGj0oXDeHVcwS7tzFAtsyJOpldGTiv1Ts6qjaDqyDG8I6xC7GqGIAAvVQAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDmYo/X3ZjkFVNaM/hAjeML9sSeeD6IcW/pXwRs5fx4=;
 b=HhbIHbabcK6h3E8rlReERn5Mp8PcsJAM1y67pNyE2kgV30gp0X5Q8nSVG/t/+y6POJBMr5M6c3/uY1juLDnkj+eGKghK72Teh3TD/sA1Xezw9l9C74yZc1sljMOX1vbyaIQfsQsUW3/qaaNgCWzS+KUC1n+lBdMHKUyeJ+/AGNclDd4ToXrigWfkYw3bdqZZpmqsGwRAlPAfW31WsTSv4lMy65y4ywC9A9+tgpXgXNKVCTgFghh8rOl9+5Q1+cqBHOOKYkd417pd3A/B2DbAgOk7p7Th77B8HnvkV+4dvgFPy47KhAPm7+6/020/uGovWqmXRonTstF8UOAM86xWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDmYo/X3ZjkFVNaM/hAjeML9sSeeD6IcW/pXwRs5fx4=;
 b=jO6Lc6nxej733ddtmaC/WbcvSKKaXLMKl0FW9tOuUnrNVRcelO1gaMAHSFf7Bx8tjlERplnbJHBoJibGmI1PBIM5AuA3huIJN8kEA/KgqHQmCJcloYuUxTZrxRNM9NjjGP88rHrEh5PFvTgDe7XJRRAF15usncCI7LUEGcvsVLU=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by FR0P281MB2668.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:57::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 12:12:29 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::33b1:3599:eb56:8fd2]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::33b1:3599:eb56:8fd2%5]) with mapi id 15.20.5791.025; Mon, 7 Nov 2022
 12:12:29 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v4 0/8] i2c-atr and FPDLink
Thread-Topic: [PATCH v4 0/8] i2c-atr and FPDLink
Thread-Index: AQHY7fTKrOgLFkwn6kaLMHWF/jZCsK4zYbkAgAAGxQA=
Date:   Mon, 7 Nov 2022 12:12:29 +0000
Message-ID: <8abbf9fd-8bcb-f82e-5632-0267e79c3850@fi.rohmeurope.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221107124814.19b12473@booty>
In-Reply-To: <20221107124814.19b12473@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2454:EE_|FR0P281MB2668:EE_
x-ms-office365-filtering-correlation-id: f9f44b56-ca81-4403-7b10-08dac0b95772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NrUrdVRGXoX7amOg0tLYBAzZl+tNnlYUqPhdVmcw2oPrrIBub/hQ/3EoE3onN0crrsJEposAISd28w+O3UWKK4zIRTLzd6Ek7v2GoSVlJJI8OQDX3N9AgFXPh0zae3N7mctd2ryV8WptAa+vuZnq+ZuDAaD04CBzXmurMQZGDWfl6evWX7xhF7K/L6tWvYA2wGyyfDUUD30T0sFeB8CEul/YNDUj1DkJr4PMmD422jv5TksHGRIkykywkgPBLr/ooxZht3OidTgTvZeW+zo+7rQFR3TkB8Tcaay9JBvDwAR42LNyttc4BWz9+0yGpF8+zAxZFm5XGJYQ1SEjxipDeOz3gYjjXs6hcl9/R8P7gbqbAh9GWoNV766/VvVvGPmwT+LSwYnbl9UBRP01cEyirYlXRGR6so5pbZTerWxE6hhtUW7OspQ3C3w/aeCAtHpKLXDHkrAzCN2FHnemKJbmtI73MU8BPBMGJSS/nfRJreIA032bjwJ1PFEOszAOfVo0WE7R0oC+tbZ7l1ohLeW66RWqaGs5zke3Uduf0BS1kJZFRg6kBZkLTZjNcEultF9DryGr2VOc97NhRz85TVqotwUFRUiQsnPq4rrXR/77PiiQscxtkyccqMuV/c6wj0Qn9pK3ByX8Q/K5BgKpm94HXwVSRFd9JQyBTypMgXbHAuuMCaU+Nf6IB/cbCjuWV65/fLiSDnThzggZ4QAH5Eosi46ITwPV4QaG8/yU8OtkeqsoRh17C61zqLilHaeGHwposWCIsZzs9Z1YwdcPAPYZ5HTYMCH3thICT9zkcCrmRAbXhAWA8CExa2u+phemDZrXVS4uUqA5p/aoNrobRXYzVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(366004)(39850400004)(451199015)(6486002)(478600001)(8936002)(5660300002)(7416002)(53546011)(2906002)(316002)(110136005)(54906003)(8676002)(66476007)(41300700001)(91956017)(76116006)(66946007)(64756008)(66556008)(66446008)(4326008)(38070700005)(71200400001)(122000001)(6506007)(31696002)(86362001)(6512007)(2616005)(38100700002)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yi9pZVpFMEhzVU5HSFNDaThET3JRUFdQODAyV1h4Zi9RTzQyVlJmSlQ3MWEy?=
 =?utf-8?B?cHU3S3JvN0x6R3NzNGVpWk9DdFpIcnZMTTZhamY0OVRiZGpVcE5LSUJQSWtU?=
 =?utf-8?B?Ny9GSTZwdS9UUWZnMEJuZ0xZaHl1MDdvMjFUd1RrOUVLTnJFOFFDRXZJQzU4?=
 =?utf-8?B?cHZSdDJBVEpIZngyWkVKS0szbkNFVFpQQWZjYS9qcjZ1K0ZzeExNMlBiMVBE?=
 =?utf-8?B?VjllTExlTXA3TUk5d0pONFZHSzdOZTY0elBjWXBQeWxSaGk3d1kyMVNVMzFB?=
 =?utf-8?B?cWkwUEpzRTA1SVU2dTBDODc3aUVHZzA2aXF1ODU5a29IamJ2M0hLYXd6YlVH?=
 =?utf-8?B?Wi9lS0VxSmxiRDN3aGJQaUJTcEVBUU1BNTJhZkVQM0RadmpBa3lnVXJ5emFZ?=
 =?utf-8?B?L2FWWUVISFV2cHJFaEJ3SXV6U3JvUUFBTHBUT3FndUJGU0t4YVlwMndkb0V6?=
 =?utf-8?B?UFhMUUF0cXRSUUpJaWh0QnFWZnNINm9tRU9xcEQ4QlJYVWs1SEY1VTltZURr?=
 =?utf-8?B?bVpwS0FGNExDOUhnQmNud0ROcjNyZGk3MDNCQ3hMUUVMcDIrZGRWWTZJa21R?=
 =?utf-8?B?QS9ia1ZrQmttTm5IWlo2SkMrdlkzMXVpSHU4NWRVdDJVcUxJaUVBYXhDa3ZX?=
 =?utf-8?B?UlZjR3A0dldqcDdZaTFFMnVuSmtZVGhBYzUxVHgvWXpZMGFEc1dRSkxPdTJr?=
 =?utf-8?B?ZlFqRk5aTnd0Tlh1SkNIcTB2OUE4U0J1UmdCbWNLY00yNHd2SkkvSXVkOFli?=
 =?utf-8?B?aDl0Y0FkM2czWW5FWkc5aThjL0JZeUpKN3VCazdPTUI0VEs2U0pqeVcxNVQ4?=
 =?utf-8?B?QnlEbWx3a0VOMTFybStaMHVCU0hnNGttRXdEbC9YODRDUjhVdldUVUkzc1Fs?=
 =?utf-8?B?N3ZCZHVvcXV4cklMZzFvQTlmR2ltR0M3ZDEwTkNONVJsajYvOHlaTUk3K2dW?=
 =?utf-8?B?eWtINkMrNlNiSmNiSGhob2JSVk02TjZzSEc2Y0RFaDB2SStVWVF1UWxaYUQw?=
 =?utf-8?B?ZCtyRW8zZ1hITHh5VUlseHZFd2EzZG1EVXJSZmtNWWovczBLSWFrQ0VzSm1z?=
 =?utf-8?B?NHJjOFkyVkZrS21UbjhPYTlUYzNjTDVXM2RuVG9Cc1h1VUpLNWQ3cHVEMFRz?=
 =?utf-8?B?NURja00rQ1hWZkZSL2tsWlJKWW5QdGNqVVQyWHN4STJEWndBWGQwMHcreXJQ?=
 =?utf-8?B?UEpnbmV3c3ZkOHNhKy8vRk91S2NVTk4rcjV2d2RVRTRFbCswWG1IVDd5Q1Uz?=
 =?utf-8?B?QkVKTHpXalI3cFFyU3kvT0VpenZRMGpKcURNSHRqQkFLM1BzbWVxdWVOWFVu?=
 =?utf-8?B?S3pXKzRwcytJVzVhUGxmRkNxbHRmd3JIcVJpOVl5b2ZFNDNFb005MG1Icm9x?=
 =?utf-8?B?aG9HMTJSSU5xRHNRaWtxTDJaTkJ3cm9QWjZGTXBTVmg2SUNoWXdZWHVGRnE1?=
 =?utf-8?B?bEpwVHJrdjB0ZkhheUpROEc5RGVVVjI3dWtsb0p4VVp1ejVmNFpGRy9IV2gy?=
 =?utf-8?B?MkdEMTlDOHNKOEM2cmpHd1NTTVh0TGJFRDFhR0xSS1djdFc5TkRXaTNjNHlE?=
 =?utf-8?B?U2d5MDNNSitkL2dHVFhlUVBkb0Q4VitSdDExOEp2ZnJTeURBT1d4a2JRS0gr?=
 =?utf-8?B?amRGWTI3ZVVESFFBdGY3K1pCYndqVUI3d2xHKzhEbHJ3NzVLOFdtbmJaSXY4?=
 =?utf-8?B?c2h3WUtQT2RjV2h6YUNzeVR0TlVSWGdMRVlmbjdjK3lzSEpLSTh0b0UrVUND?=
 =?utf-8?B?eHdrMjJFY1NmZ3g5UWNINmJEdy9DeGlVcHExdTFacVZZNjVZOUdFK0xxa2Mz?=
 =?utf-8?B?ejZxajdycGtwS3BUSmxsUDFIUXdpQWY5eTBMR1B3SWpqejNLWWloMUUwUEV1?=
 =?utf-8?B?ZVkwZ0ZDUUxhUG5yWGlyR043RHc3ZHU4Z3FyMGdzblBXNWdSLzE5bWhYd3Jy?=
 =?utf-8?B?QTZvem52cE05Zy9mSzhCUWRHOCtvZk1DdHpaaTdPUEEzVmd1YVhkSTljN3dn?=
 =?utf-8?B?N2VxdEdseEhkN1NlbVdaT1FUVVV4UDdjRitkaGExSnZabXF3WW1qTnFFUU5w?=
 =?utf-8?B?azFuVktvRE9vRHFQRFZqcDVpSjZKNElzRGNKdGRNUVVJSHR1N29zTTVSMTdC?=
 =?utf-8?B?TXJjSGlWTVZ1QjBOMzBqd294V0xmckowbjFYUURobTdhTzVZRDZWL1d4M0Na?=
 =?utf-8?Q?pm+HnEfyeojpL9gQpRbEZUQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8B6B39F46B89A4BA074F0ADEBD0329E@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f44b56-ca81-4403-7b10-08dac0b95772
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 12:12:29.4480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U2/93Nx/sxYfXGUHw6nQFVF5IBC/gLkfUw506AexC5yrAlJE6ChbgfKyYQlyECmnSK4kXBCxs/D7kwygEmEDUiSvT8O2+zmjeFT99bC/ANoNDBwo/FOb7vZLOaeY+srt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2668
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTEvNy8yMiAxMzo0OCwgTHVjYSBDZXJlc29saSB3cm90ZToNCj4gSGkgVG9taSwgQWxsLA0K
PiANCj4gT24gVHVlLCAgMSBOb3YgMjAyMiAxNToyMDoyNCArMDIwMA0KPiBUb21pIFZhbGtlaW5l
biA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6DQo+Pg0KPj4gMikNCj4+
IElmIEkgc3VnZ2VzdGVkIGFkZGluZyBhbiBpMmMtYnVzIGZ3bm9kZSBwYXJhbWV0ZXIgdG8NCj4+
IGkyY19tdXhfYWRkX2FkYXB0ZXIoKSwgYW5kIHRoZSBpMmMtYnVzIG1pZ2h0IGJlIHVuZGVyIHNv
bWUgb3RoZXIgZGV2aWNlLA0KPj4gSSB0aGluayB0aGUgcmVjZXB0aW9uIGNvdWxkIGJlIHF1aXRl
IG5lZ2F0aXZlIChhbmQgSSB3b3VsZCBhZ3JlZSkuIEZvcg0KPj4gdGhpcyByZWFzb24gSSdtIG5v
dCB2ZXJ5IGhhcHB5IHdpdGggdGhlIGkyYy1hdHIgYW5kIHVzaW5nIGl0IHdpdGgNCj4+IEZQRExp
bmsuDQo+Pg0KPj4gSW4gZmFjdCwgSSdtIHRoaW5raW5nIHRoYXQgaXQgbWlnaHQgYmUgYmV0dGVy
IHRvIGp1c3QgZHJvcCB0aGUgaTJjLWF0cg0KPj4gZHJpdmVyLCBhbmQgYWRkIHRoZSBzdXBwb3J0
IGRpcmVjdGx5IHRvIHRoZSBGUERsaW5rIGRyaXZlcnMuIEJ1dCB0aGF0DQo+PiBjb3VsZCBtZWFu
IHBvc3NpYmx5IGR1cGxpY2F0aW5nIHRoZSBzYW1lIGNvZGUgZm9yIG90aGVyIGRlc2VyL3Nlcg0K
Pj4gYXJjaGl0ZWN0dXJlcywgc28gSSBoYXZlIGtlcHQgdGhlIGkyYy1hdHIgZHJpdmVyIGZvciBu
b3cuDQo+IA0KPiBJbmRlZWQgSSB0aGluayB0aGUgUk9ITSBzZXJkZXMgY2hpcHMgZG8gaGF2ZSBh
biBhZGRyZXNzIHRyYW5zbGF0aW9uDQo+IGZlYXR1cmUgdGhhdCB3b3JrcyBwcmV0dHkgbXVjaCBs
aWtlIHRoZSBUSSBvbmVzLCBhbmQgdGhlIEFUUiBzaG91bGQgYmUNCj4gY2xlYW5seSByZXVzYWJs
ZSBhY3Jvc3MgdGhlIHR3byBicmFuZHMuIFRoZSBBVFIgY29kZSBtaWdodCBiZQ0KPiBzaW1wbGlm
aWVkIHRvIGp1c3QgcHJvdmlkZSBoZWxwZXJzIGZvciBjb21tb24gY29kZSBtYXliZSwgYnV0IEkn
ZA0KPiByYXRoZXIgYXZvaWQgY29kZSBkdXBsaWNhdGlvbi4NCg0KSSB0ZW5kIHRvIGFncmVlIHdp
dGggTHVjYSBvbiBrZWVwaW5nIHRoZSBJMkMtYXRyIGEgcmUtdXNhYmxlIGdlbmVyaWMgDQpjb2Rl
LiBUaGUgcmVhc29uIHdoeSBJIGRpZCBub3QgKHlldCkgYnJpbmcgdGhpcyAob3Igb3RoZXIgY29u
Y2VybnMpIHVwIA0KaXMgdGhhdCBjdXJyZW50bHkgSSBkb24ndCBoYXZlIGEgcGVybWlzc2lvbiB0
byB1cHN0cmVhbSBteSB3b3JrIGZvciBST0hNIA0KU2VyRGVzIExpbnV4IGRyaXZlcnMgOiggSSBz
dGlsbCBkbyBkaXNjdXNzIHRoZSBkZWNpc2lvbiBidXQgdG8gYmUgDQpob25lc3QsIEkgYmVsaWV2
ZSB0aGUgY2hhbmNlcyB0byBnZXQgbXkgZHJpdmVycyB1cHN0cmVhbSBhcmUgZ2V0dGluZyANCnNs
aW0uIEhlbmNlIEkgZGlkIG5vdCBzZWUgaXQgcmVhc29uYWJsZSB0byB0cnkgcHVzaGluZyBUb21p
J3MgLyBMdWNhJ3MgDQp3b3JrIHRvIGFueSBkaXJlY3Rpb24uDQoNCllldCwgYWZ0ZXIgdGhhdCBi
ZWluZyBzYWlkIC0gdGhlc2UgU2VyRGVzIGRldmljZXMgd2hpY2ggY2FuIGNvbWJpbmUgSTJDIA0K
YnVzZXMgZnJvbSBtdWx0aXBsZSByZW1vdGUgZGV2aWNlcyB0byBvbmUgbG9jYWwgSTJDIGNvbnRy
b2xsZXIgZG8gYnJpbmcgDQphIHJlYWwgbmVlZCBmb3IgYSBzb2x1dGlvbiBsaWtlIHRoZSBhZGRy
ZXNzIHRyYW5zbGF0aW9uLiBUaHVzLCBJIHdvdWxkIA0Kbm90IGJlIHN1cnByaXplZCBpZiB3ZSBz
YXcgbmV3IGRldmljZXMgd2l0aCB0aGlzIGtpbmQgb2YgZmVhdHVyZS4gDQpQb3RlbnRpYWxseSBh
bHNvIGZyb20gb3RoZXIgdmVuZG9ycy4gU28sIHJlZ2FyZGxlc3Mgd2hhdCBoYXBwZW5zIHdpdGgg
DQpST0hNIFNFUkRFU2VzIC0gSSAodG9vKSB0aGluayB3ZSBzaG91bGQga2VlcCB0aGUgQVRSIGFz
IGluZGVwZW5kZW50bHkgDQpyZXVzYWJsZSBjb21wb25lbnQuDQoNCllvdXJzLA0KCS0tIE1hdHRp
IFZhaXR0aW5lbg0KDQotLSANCk1hdHRpIFZhaXR0aW5lbg0KTGludXgga2VybmVsIGRldmVsb3Bl
ciBhdCBST0hNIFNlbWljb25kdWN0b3JzDQpPdWx1IEZpbmxhbmQNCg0Kfn4gV2hlbiB0aGluZ3Mg
Z28gdXR0ZXJseSB3cm9uZyB2aW0gdXNlcnMgY2FuIGFsd2F5cyB0eXBlIDpoZWxwISB+fg0KDQo=
