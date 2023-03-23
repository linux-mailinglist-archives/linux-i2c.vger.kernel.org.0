Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E9E6C67F6
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 13:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbjCWMRj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 08:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbjCWMRV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 08:17:21 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2085.outbound.protection.outlook.com [40.107.102.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397DD28221;
        Thu, 23 Mar 2023 05:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mya6kkJ0OQpJn0RqppZSJnI61wZ7eqHuywQc0XD0R3LJAfBYoFhvrAm1C/EN13ccMGLwSsGUNkTK+MMul0B7KODCEU6C4Uogp4Fh0J8KqZIFzxByLEYFVTjUf+TCt3k1A/SURGX3ijOX1gkxymMQZDsByhVL3gGYhzH02KuHDD1U15Yq7ytlpIBI0xCPE1q2CpwNe3kjN0r1b88ZviRf/HYrTFBF36FTFp4PbQzP/bPJWkKFEJvLV095+SdEnjWnTZCPs3vrPNDsgHTJcey7gjcQzVW3YNsuCk/zIWJPFdxdXdPLnjiseEkrlClXuiQwxV6AvAQ9MLI3PwxtC6yGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBXBK3ycrV5FM05PXWNhbrUafBnI09R70SbV8POLmms=;
 b=IxDXSDAN54Hkg04+rIR/IXW35v4U6Kpb/3Rudv6yCtiyY4QGARuJ2im1DUBM5MGYeyesLGozersSk3p3+mtq4FHmlSc3DkeiY+jl3pCoTF20NsRkyzexwpoYvHytJFHX0+1nTI35vc/A6GWpNIf+1+qtBKQYtkSos8FQ9EG4v1S8UK3Y5mrENak7q4JC6Q07afl3p0B5huhQ2ooiiTcIQHvd8G27LHqD7CbPWgmT9lVjFpxq2OjF9vZWu54biSRvaOSwq/3DUSjlp5hV5NTXN2wtXJ4GF6wsJ8gGJDLy7FAiY9TuyQbWWCDAxILt7CkGDQJ1XN3gFtojVefYKR0YVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBXBK3ycrV5FM05PXWNhbrUafBnI09R70SbV8POLmms=;
 b=mj6/ROdSXr8gcQ/UvvxmJNVXP856DElb/0X2fEoZqO9/CfFzW4u/0Rt5p5aXRm4oCoKcoKKz+uQztHN3dt4mllLsNnAVycvaZjijZm9rFOGs8/wf3lod8L1MoUbw1ECsIMGG0lUaqXWgCJRAspwf7VrrQV3GM+h8bVWQwZUcWJaSoHjHn/AHcgbzILctTbsOwpor/i6TZzr1MQh1gqWB5VtSR12KDthhZntCM4q2MlX3Iyf6wbmkaEE2wQZZHWISRnXAD7wG/M/gt+B4tJu7lPZspiQ6BwK0d5XCbStVZ7L3bHmDoRmlrfsdwfPpPb07quh0kBgX+3EkyMYrE+L1ew==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by BL1PR12MB5897.namprd12.prod.outlook.com (2603:10b6:208:395::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 12:16:23 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::2328:92c1:425b:1ce5]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::2328:92c1:425b:1ce5%8]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 12:16:23 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Jonathan Hunter <jonathanh@nvidia.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Thread-Topic: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Thread-Index: AQHZXKiO0wuILl0TEke/Rc5CABJgTK8Go5mAgAALdQCAAB/hgIABSYMggAAH+4CAACgRkA==
Date:   Thu, 23 Mar 2023 12:16:23 +0000
Message-ID: <SJ1PR12MB63391B10B3F73DE89A214486C0879@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20230322102413.52886-1-akhilrajeev@nvidia.com>
 <db870e74-9d97-740a-9829-5fafc0bb0559@nvidia.com>
 <SJ1PR12MB6339FC0B9BB57D1D2300D46CC0869@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <b9235dfc-10dc-1ed0-1510-fd98902491e3@nvidia.com>
 <SJ1PR12MB63395F16F399E67733EED69BC0879@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <ZBwg2Rnc6d5EQ3pu@orome>
In-Reply-To: <ZBwg2Rnc6d5EQ3pu@orome>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|BL1PR12MB5897:EE_
x-ms-office365-filtering-correlation-id: f6b26387-5d8a-441b-fb1b-08db2b986af4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8WWFftkEsX+R0WUnTsvuOMvMIIkVg3T1A3lrcLEbNBfVEggk9QYNy0XjoaCB4YuG3kZRm+BM4LzHU5xgscCRR32HFXLELdCn6+GmX61xrbO/yF1quqICDFkY87RXWyw8ldR0QO59vCVN8/b8B6UqeZcUNldmtQ8qA1iYliSQ1LMoCFtZHRim3p4kSK75dmyxGE4CGFKesFrpUlhpufB829zYaaB7mUU0MqdFlynyeqwuz6gkxyQwXB82+VtIlpDsZ+qfbijLueZNtXig5oGWpebnNecdN1foZtK0eu6vBea8M76pnNG6TN5r/ss0R5WvQevtv5Rl8MhopRKuCcuUbor77CkOhClB76KmyoeEbDgK54qA8fJwjEWgHT1cmwJG3/cfhU4NbsPqPX8Bhaj4nClQxjwhPrXCaGm+ZYh0B+TFr3M7PZbiYsQGdcEhvd8hOPYIS8qtqRVcNuvf9DOj7YewGxFSAx7QcENyPUS9Waf7c/QI/jAZWhO1OfDURrPORSnhUbmSwzCy8bjcfOhQ/ox/ZJqPWNOjAhiyNAMxwLxQV8tp7aQ4eL1PyC7IcTyaUo+eCLjxEplLds1VOV2kgsVcV70+32y0tHuWSL7w942GxHwGWoz5UYqaccoQWOZ/2Yia1Vd9Ip7bjdzhI5NMpzWGPPvRDtOzpMz07poFeQyw7djGjE7JhsD+pMB+XGyVGvONKpEPkidjHFHmqLrTuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199018)(4326008)(66556008)(76116006)(66946007)(66476007)(6916009)(8676002)(316002)(66446008)(64756008)(478600001)(54906003)(38100700002)(2906002)(8936002)(5660300002)(52536014)(122000001)(86362001)(38070700005)(33656002)(41300700001)(55016003)(186003)(53546011)(6506007)(26005)(9686003)(55236004)(71200400001)(83380400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWl6QnFkdnpKWWR2dzJYdmp4Z09UZnViZ0wydEl6aTZlQ254RFEvSGw3RnYw?=
 =?utf-8?B?S0g3Zm90eHdmSDJlRFhrVnA5aGljZmRSdUc4bzh4THBKcFM0NTJ4VkdFQllw?=
 =?utf-8?B?SzczSEZYeVlvWktnK1Z5Mm9aL0xKMnlHeDVteHJzcU9pSmhRaXloOXBrU2t1?=
 =?utf-8?B?b1Jwd3hNbURTNHJEeCtvUWQ1aU0vMTlIamFERkpJdklNWGI2VVVVa0dxYVpz?=
 =?utf-8?B?Z3pCMEVLNnNxM0tUWWc2aUxCUHI0d1NGN2dGZ2R6cGc0Z00zbU9qQno0TU5V?=
 =?utf-8?B?a2hobDE0UjZJOUFEZVBoQ2QxOGxsbWVmbnpCUkVqaXZtQWM2K0hJQkM1TGhK?=
 =?utf-8?B?NmhMaVZMNTVLSXpTd1UyVU5YWkVnaDZDSVU4WURMazJiOFZwK0JuVklPR0xL?=
 =?utf-8?B?OUZhR0MrUFg1MXg1aUtHazFCSUFXUzRDM2NPVHBuc0lPSGlSeHhnSUFxNndk?=
 =?utf-8?B?cURDaEcxaXJIQlR0V3EvUnJTai95czd0WGVpWFpmS1BQYml1USsrbDBrNXhm?=
 =?utf-8?B?bXBkYmNXK0M1UXBZbzAzT1lDRFA1WEFGeEYxU2Vra3AzUWgvYXRkMVN4c0Jo?=
 =?utf-8?B?eEdvaWFTbFoyQnF2Zm1jWG1Wei8wTlIzV3lteFlyQ0o3b3VvTWVNREZtUlFC?=
 =?utf-8?B?aUpXTDFvZUE5bWdreXl4em5hdmZkUFRSWkZGYXJ0aGxHNzJ2NjF4eFhLcjlo?=
 =?utf-8?B?STVIY09adFgrNlUrOHhXdk4wbW8yVzZjYjBWa2V0NU5hRENoU2d2VmtYU25D?=
 =?utf-8?B?S2JZU2pDclVsVXZ0S2JQQ05BaXlzMmZGRFdpTmNhbmVCTjZINHhQTzFkUzJt?=
 =?utf-8?B?enBIOVB2N3Ivb3cvZzhmYkp5dE1kM0Y5Zk05ckNIdVdGWWNyOUFicGxZTEc1?=
 =?utf-8?B?OGZ3clFka0gzYUlqMmEwOHVlNk5oQU9sckJWSUR6YlV0bHMxQURsdmRuTGtO?=
 =?utf-8?B?aVhCNVJKK1IxRHZ5c2kzeS9EZk45VXN1M1ZRWWw5d3R6TFpjaytaRHhqdUtw?=
 =?utf-8?B?dFhlektNUnhWam5RTFhhSm9tQ1lUZEcyV01CaHp0dzQrd0hGL3lMM1BxUHl4?=
 =?utf-8?B?TXEzSWlQSDFUMjhOVDFRSzRHQ1hSWTlPa2thZzVDRU0yS0dWbm1iSXRrdC9j?=
 =?utf-8?B?MncrbmdMcWhhdjRlMUVEb2p4UlhPaS80MmVkSnZjN2RhK1RKU3lYMDFkdHUw?=
 =?utf-8?B?THJ3Qno2bUVyUENPYkdvL01XT0xKR0tzOHoxRFdEemw4b1N2NmVJTTRNU3Ja?=
 =?utf-8?B?ak9Sc1ZibW94dWpOK2h6VWMzcC9pRXIvQ3cxSVJYWjZVS3N6bG9LeUNOQ0R2?=
 =?utf-8?B?ekdEcUozWTRoaTZwV3ZTYkUvZTBIWUgvS0NpTjIrTVQwSkZmdFdFa3FXdnFE?=
 =?utf-8?B?SE1OUU9Gd2ZnWFJ0MWtibTNDaUZrZ2JuSEVpVHFzYlhzTkpEWEpmMDZaNGFM?=
 =?utf-8?B?cnZRanAwK2JDMzJoZTh4QVZoODB4ZmxmSVZrZXl4aVAvNG5uV0x4b1VvellW?=
 =?utf-8?B?ZytmeHByLzE1TFBWaW1aZXJ3cTFsWWFCQ3YvTnRBb0xJcXpXdkFVVDQvamlr?=
 =?utf-8?B?eFFXK3U4Z2RtU2pHVU5qZHF5bDNBTXFtQ3cwZ3Z6VkFiRFdHTUwyYW1TV09a?=
 =?utf-8?B?dlJsbkhCNXd5QlFWc1JreEVZUzZQRzM5N3F5Z1o4Z3QvUzltRDFPRXI4bkZx?=
 =?utf-8?B?eUZnTndUd1B1N3FSSUtVWm1IN1BrWnZGTzlWSU5aLzhzWlB4VE5OditNVEVo?=
 =?utf-8?B?V0NXUUdPM1cyaFVtZndKVTc2eXUwTnIrOVJFb1VDUm8xYmZDZlZtMnQwV2tX?=
 =?utf-8?B?c1orSGIyNDl2UlQ1MHJ3UlhMenZ4TWZGTlcxcFQ0QnBSbng4b2l0NmdnSHZw?=
 =?utf-8?B?V1BxUmhteUYwRTVpWUZ4NW4zSGtCSWJiZGVhaHRJNDh2ZjZucXFHTnZPOVVB?=
 =?utf-8?B?VkVndWk4aDl0cnZDQ0tDYTFUczR4NDZKN3NIOTBpYzM5ZUFhSE1sMmdjaUNU?=
 =?utf-8?B?RlhDWjVSSmhwcEwvNXBHUldMOXBKUURDaWE5MjZwWlhMOUtkZFBMNG5lRTU1?=
 =?utf-8?B?Ky8waVMrdW9MVVVGb0c1Z1A1ai8rTlJrcnlyRXZpRzZwdWNYTlJyNmllVG81?=
 =?utf-8?Q?rsKQicpqYbjRijEymEBUwWs+Z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b26387-5d8a-441b-fb1b-08db2b986af4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 12:16:23.2051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trSt97nEnsxTn6i9xbMq0OYW4pSZ2+2oPXFOom680WKVmdpZEV7BXwkwW2UrxmzkpTqCqbxvqVoNcLMNslnRqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5897
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

LCBNYXIgMjMsIDIwMjMgYXQgMDk6MjY6MDBBTSArMDAwMCwgQWtoaWwgUiB3cm90ZToNCj4gPiA+
IE9uIDIyLzAzLzIwMjMgMTI6MDAsIEFraGlsIFIgd3JvdGU6DQo+ID4gPiA+PiBPbiAyMi8wMy8y
MDIzIDEwOjI0LCBBa2hpbCBSIHdyb3RlOg0KPiA+ID4gPj4+IEFsbG9jYXRlIG9ubHkgb25lIERN
QSBjaGFubmVsIGZvciBJMkMgYW5kIHNoYXJlIGl0IGZvciBib3RoIFRYIGFuZA0KPiBSWA0KPiA+
ID4gPj4+IGluc3RlYWQgb2YgdXNpbmcgdHdvIGRpZmZlcmVudCBETUEgaGFyZHdhcmUgY2hhbm5l
bHMgd2l0aCB0aGUNCj4gc2FtZQ0KPiA+ID4gPj4+IHNsYXZlIElELiBTaW5jZSBJMkMgc3VwcG9y
dHMgb25seSBoYWxmIGR1cGxleCwgdGhlcmUgaXMgbm8gaW1wYWN0IG9uDQo+ID4gPiA+Pj4gcGVy
ZiB3aXRoIHRoaXMuDQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBBa2hpbCBS
IDxha2hpbHJhamVldkBudmlkaWEuY29tPg0KPiA+ID4gPj4NCj4gPiA+ID4+IEp1c3QgdG8gY29u
ZmlybS4gVGhpcyBpbXBhY3RzIGFsbCBUZWdyYSBkZXZpY2VzIGZyb20gVGVncmEyMCB0byB0aGUN
Cj4gPiA+ID4+IGxhdGVzdC4gRG9lcyB0aGlzIHdvcmsgZm9yIGFsbCBUZWdyYSBhbmQgdGhlIGRp
ZmZlcmVudCBETUEgY29udHJvbGxlcnMNCj4gPiA+ID4+IHRoYXQgdGhleSBoYXZlPw0KPiA+ID4g
Pj4NCj4gPiA+ID4gWWVzLCBJdCBzaG91bGQuIEkgY291bGQgc2VlIGluIHRoZSBBUEIgRE1BIGRy
aXZlciB0aGF0IHRoZSBzYW1lIGNoYW5uZWwNCj4gPiA+ID4gY291bGQgYmUgdXNlZCBmb3IgVFgg
YW5kIFJYIGFuZCB0aGUgZGlyZWN0aW9uIGlzIGNvbmZpZ3VyZWQgb25seSBkdXJpbmcNCj4gPiA+
ID4gZG1hX3ByZXBfKigpIGNhbGxzLg0KPiA+ID4gPiBJIGRpZCBub3QgdGVzdCBpdCBvbiBhIFRl
Z3JhIHdpdGggQVBCIERNQSwgYnV0IHNpbmNlIGl0IHdvcmtzIHZlcnkNCj4gc2ltaWxhcg0KPiA+
ID4gPiB0byBHUEMgRE1BIHRoZXJlIHNob3VsZCBub3QgYmUgYW55IGltcGFjdC4NCj4gPiA+DQo+
ID4gPg0KPiA+ID4gT0suIEJUVywgdGhpcyBkb2VzIG5vdCBhcHBseSBjbGVhbmx5IG9uIHRvcCBv
ZiAtbmV4dC4gSXQgYXBwZWFycyB0aGF0DQo+ID4gPiB0aGlzIGlzIGJhc2VkIG9uIHRvcCAiaTJj
OiB0ZWdyYTogRml4IFBFQyBzdXBwb3J0IGZvciBTTUJVUyBibG9jayByZWFkIg0KPiA+ID4gYW5k
IHRoYXQgb25lIG5lZWRzIHRvIGJlIGFwcGxpZWQgZmlyc3QuIFRoaXMgY2FuIGJlIGF2b2lkZWQg
aWYgeW91IHNlbmQNCj4gPiA+IGFzIGEgc2VyaWVzLg0KPiA+ID4NCj4gPiBPaC4gT2theS4gSSB1
c2VkICdnaXQgYW0gLS0zd2F5JyB3aGVuIEkgdHJpZWQsIGFuZCB0aGUgY29uZmxpY3Qgd2VudA0K
PiB1bm5vdGljZWQuDQo+ID4gU2hhbGwgSSBzZW5kIGEgbmV3IHZlcnNpb24gb24gdG9wIG9mIC1u
ZXh0Pw0KPiA+IFRoZSB0d28gcGF0Y2hlcyB3ZXJlIGFkZGVkIGluIGRpZmZlcmVudCBjb250ZXh0
cyBhbmQgdGhhdOKAmXMgd2h5IEkgZGlkIG5vdA0KPiA+IGNvbWJpbmUgdGhlbSBhcyBhIHNlcmll
cy4NCj4gDQo+IEl0J3MgdXN1YWxseSBiZXN0IHRvIGNvbWJpbmUgdGhlbSBpbiBhIHNlcmllcyBl
dmVuIGlmIHRoZXkgYXJlIGluDQo+IHNsaWdodGx5IGRpZmZlcmVudCBjb250ZXh0cy4gVGhpcyBp
cyBlc3BlY2lhbGx5IHRydWUgaWYgdGhleSBjYXVzZQ0KPiBjb25mbGljdHMgYmV0d2VlbiBvbmUg
YW5vdGhlci4gSWYgeW91IHNlbmQgdGhlbSBhcyBhIHNlcmllcywgeW91IGNhbg0KPiByZXNvbHZl
IHRoZSBjb25mbGljdHMgeW91cnNlbGYgKHlvdSBtYXkgbm90IGV2ZW4gaGF2ZSBjb25mbGljdHMg
bG9jYWxseQ0KPiBpZiB5b3UgY3JlYXRlIHRoZSBwYXRjaGVzIGluIHRoZSBzYW1lIGJyYW5jaCks
IGJ1dCBpZiB5b3Ugc2VuZCB0aGVtDQo+IHNlcGFyYXRlbHkgdGhlIG1haW50YWluZXIgd2lsbCBl
bmQgdXAgaGF2aW5nIHRvIHJlc29sdmUgdGhlIGNvbmZsaWN0cw0KPiAob3IgYXBwbHkgaW4gdGhl
IHJpZ2h0IG9yZGVyKS4NCj4gDQo+IEl0J3MgYmVzdCBpZiB5b3UgcmVzb2x2ZSB0aGUgY29uZmxp
Y3RzIGJlY2F1c2UgeW91IGtub3cgYmV0dGVyIHRoYW4gdGhlDQo+IG1haW50YWluZXIgKHVzdWFs
bHkpIG9yIHNwZWNpZnkgYW55IGRlcGVuZGVuY2llcyB0byBtYWtlIGl0IGVhc2llciBmb3INCj4g
dGhlIG1haW50YWluZXIgdG8gZG8gdGhlIHJpZ2h0IHRoaW5nLg0KPiANCj4gQnV0IGFnYWluLCBp
biB0aGUgdmFzdCBtYWpvcml0eSBvZiBjYXNlcywgaXQncyBiZXN0IHRvIGNvbWJpbmUgYWxsIHRo
ZQ0KPiB3b3JrIG9uIG9uZSBkcml2ZXIgaW4gYSBzaW5nbGUgc2VyaWVzIGJlZm9yZSBzZW5kaW5n
IG91dC4NCj4gDQpPa2F5LiBHb3QgaXQuIEkgc2hhbGwgc2VuZCBhIG5ldyBwYXRjaHNldCB3aXRo
IGJvdGggdGhlIHBhdGNoZXMuIA0KQ2FuIEkgcHV0IHRoZSBwYXRjaHNldCBhcyB2MSBvciBkb2Vz
IGl0IGhhdmUgdG8gYmUgc29tZXRoaW5nIGRpZmZlcmVudD8NCkJlY2F1c2UgdGhpcyBwYXRjaCBp
cyBpbiB2MyBhbmQgImkyYzogdGVncmE6IEZpeCBQRUMgc3VwcG9ydCBmb3IgU01CVVMgDQpibG9j
ayByZWFkIiBpcyB2MiBub3cuDQoNClJlZ2FyZHMsDQpBa2hpbA0K
