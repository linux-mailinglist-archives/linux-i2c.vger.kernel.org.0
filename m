Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D91D16C6398
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 10:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjCWJaJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 05:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbjCWJ3o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 05:29:44 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE5538EBE;
        Thu, 23 Mar 2023 02:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iffQFx5zSZoPJByI80NXywhCeiDzTQ9ykMfXj2uHZBswC4z2DVe/+Z8SgAWWCLZrHppbGNQ1BvemddBLYld4HLx6dulRGYREWckQpLLNfXBgHt5W+XoiU3llGzPfxpT/7Px2vFBlSyds1DuQ4hv9WS9Y/DpzeHgCYpOIwC64sLyUPhRj0Aids9mrduzIwp4b0hLyJlP0iCDw+oYJ0Kybw9WN1BBtByvtYSrQGD9QdpxWVVBOEKM7ahkAklICjHDW6f4W5FlxZvPKZPX4nPtLotzMFn7CVabxsneGMcQvDAAFaUebQktZc3emk+IUoUc1BMTtxE+sevBM8AHa9wRE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fIwdGi+lbgQTrnsVH8f2OjxVoD/Pj4i1uK5W7St0fQ=;
 b=hXEw0YBiLe002ixCLvB0Xc1XNLxsFNrJVD2dI+uYDaLvEB30cdKEFNZbCEtmW5NTtAoyQbqynWdj0+uk9U6fcN4jHOhr1HlZ11Kmx7bb1oZGZT3Kku9+Qarjyu774Dsww+1CdpNhp6pKHcajvIP77UnJk6foiw/nL9ak13dEu+yDoQ1t8vfx6opgWWVJe6MU3yk383T4TPMuEoYNebkMZeMBvnLE+nuURYMcKgKhowhj7vPC/4OWCuXleqr2pAv/g6H3Ed2jmqzGToN7qt3ILMwJkAldzHJSe3glyjusTB7FtCFNcu9xHYGVX98I+H95fJgH37UvX/TtIbab63WrZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fIwdGi+lbgQTrnsVH8f2OjxVoD/Pj4i1uK5W7St0fQ=;
 b=DBdm7I0RC1inPT6yakarb/99aHeth8DlQ6CjXNGUYX1G4Ia1febJb8WkJmTLM0bDaHw3SEGmKtr77iqwftsxfdxL3ZOrC4csJGp007oNnPlzmTt+Zf6Za3BR6b3+XFW44+unDNihIPZtAdI/au86MKD+ZCOtBMwwwzM/mraN/ojsxClT5P3gYg2AyHMfxIhxy8Z++eZrPEmkgxff+ra0CSYLJbtYkLedudovD+9vlQaBERaENvO6x2DtRAREIX2qMIM7+bi0WeE5OuVYo0iS+zo87moYZGlJ9yBHMbdxIlu+80ifcwGY1hCEWgtqmMycAFjTKGLtABcnr30PBeev4A==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 09:26:00 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::2328:92c1:425b:1ce5]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::2328:92c1:425b:1ce5%8]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 09:26:00 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Thread-Topic: [PATCH v3] i2c: tegra: Share same DMA channel for RX and TX
Thread-Index: AQHZXKiO0wuILl0TEke/Rc5CABJgTK8Go5mAgAALdQCAAB/hgIABSYMg
Date:   Thu, 23 Mar 2023 09:26:00 +0000
Message-ID: <SJ1PR12MB63395F16F399E67733EED69BC0879@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20230322102413.52886-1-akhilrajeev@nvidia.com>
 <db870e74-9d97-740a-9829-5fafc0bb0559@nvidia.com>
 <SJ1PR12MB6339FC0B9BB57D1D2300D46CC0869@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <b9235dfc-10dc-1ed0-1510-fd98902491e3@nvidia.com>
In-Reply-To: <b9235dfc-10dc-1ed0-1510-fd98902491e3@nvidia.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|IA1PR12MB7519:EE_
x-ms-office365-filtering-correlation-id: ef7652c3-d852-4b10-2669-08db2b809db5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZF5nWbyixs2Xz5otiNomjSh5CbxjKpelUIVVni8af6c0xQhPWS1Gu4BrsIby8zBJmvcq90+2HbMBFLviKB7NUd9DaZWYvS/UuS39qZXCsyk/da1nnprImoAS+sSy/3Y2uQueErI6v7QvXMDuScfIiIea3W5jQlWW6sVrVpdBMvvdGF7sEZAiUlSq/rqe+y0hkm8GWB9JYgsvHeIfyv5xEA+jXlhI5iPuJM+OXPH1+Fc1uf+HKxmy6uBYvTCvk4sGF89vWypQg2JxWxjbIDKpVv39C0DpKEhJ4oDsLMPVg0B03zWC1nohRDoFQftmDj3FGSY3md+BzTLGcR9BK1rqpe5k6+C2kvbDkbLf3ckaoTlaPqPdkmmVk4HiwyluxMok+SuqiCiQWQnuq/QO8GPo786Wp2tN6qKB7kdmmd+q9Mqi2xzHMhMbHweyoFQH6rsYQPeZ/j/Bn0YY/IJ/eYn/12UFOx4bMBDcJ1ytmXD4N8a0GfkkPsZpCl2ZIKUdVkUYMcxqsXmCX6h0/jvlYGO/B9VWlTFRfOg26syD686ZRFEsobdQVu8q5OohKIxjLPRjx6OTaJ3TsedEtDKc5CeBDPzClOUx6nazLZHL1zlAuDTBpNNDX+kobjLryWmlzd4ykC22bkA/bkNqw/atdM8fgnEBDG5NrvLR3X5lTtEa1kvSwkgK9xu2ZxaiEkPl7KXqNr0cfDL44maJgBUXMIMuT7awZoYePsdqV4EOoTNzUiQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(86362001)(33656002)(921005)(38070700005)(122000001)(38100700002)(2906002)(41300700001)(66556008)(66446008)(8676002)(66476007)(64756008)(52536014)(5660300002)(8936002)(55016003)(186003)(55236004)(53546011)(9686003)(83380400001)(66946007)(6506007)(110136005)(478600001)(76116006)(316002)(26005)(7696005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azRoM1Bab2ozUXE1R2txWWg1OGZOS0plZzJYTmdNanh4MjI1RVBjTDNCZ1JO?=
 =?utf-8?B?VVZveDNYbVBBQW9yQXRSZUg1S3VyalRLVVFLYW81aENWNHo4Nnk0YnVtSkdy?=
 =?utf-8?B?T1Q0MnJoaVVsOVRDN0F1eVloZzFwTkJ1VWZLd2F3WjU2cXB0T3hSQXR1c1NQ?=
 =?utf-8?B?azBZYnYxa1BqZDRXSjd4NkVGWjVWTG40bWVhT0xlNUxwbzB0VkdKdmNIbUxM?=
 =?utf-8?B?WTZCOWU0REVRUkRDK05zUk4yQnNySUhza0NnVXdySklZV1VFUjR4dzVqYmQ5?=
 =?utf-8?B?QzJXZVVQZzVkUVlueDNZMG15VkdyZ0FiUWFEN1hUaDFPZHMxMlB4bUNTdGVG?=
 =?utf-8?B?T2xtcGU4eDJIZjNveDNKNmNEN1dkb2w3dmx6T3AvYUc4dU0rWWR5TytUSkta?=
 =?utf-8?B?UFRRZ2JCOVZoZXdBSGViZy9kM2o2QjNBTzhtZEwwdGQ3QUU5U29XTTNHclc3?=
 =?utf-8?B?Qjh2OU84MlpHZVpnM0YzNDBVZG9EbnlWTWd3dm9DSGk3RS9XWFh5NVRwK2Rs?=
 =?utf-8?B?N0VBZlpwamRkL3hnTDRNMFlWbHBUdUpBTnRjcnVOcEJudHhBSkVrZGs5RTBF?=
 =?utf-8?B?bVQ3b3N1dlZPUGtpZklkNmVkMEdoaXVaMG9pSjIrbmVGenJUN2szM1ltQ0VI?=
 =?utf-8?B?YzJmWE5mVHgrZ2tudHpMUjA5Qkg1U1ltczNJOXp3Szh2bmFZRlA4QnNOYmhI?=
 =?utf-8?B?b2EvMTlER1lPWmo0OStWblpZaDNOL2N1ajBnN1lYRzVDSUF0ZWlWTVV6VHlz?=
 =?utf-8?B?SWNCeHNuaXU2ZGdmTWN5L3IxWUluWEg1MjBvVjR2VnVCN2poTmhjQXJwMGtF?=
 =?utf-8?B?S1BBWUFWWEMxcFVkMHV0UUZtanRJbHIzQTh3ZXphc2Z4TDgxUXZUamZQaEZ1?=
 =?utf-8?B?bGxuYjVVQ25KT3RnWmkwYzhTUGZQblR1bko0U0Zac3ppSDNmQTg2WmM0WWR4?=
 =?utf-8?B?M3poNVlxRWs0cEVCM2VCUHF3MW9NUDZGQVp1dzg4RUFXck9hd0xrVzhlZWRy?=
 =?utf-8?B?dnRXbnh3N1d4d2xOWUhiS0NpOGFtV3VlaC9XQnJUeERpa3Vwd2tJa0Z0MG80?=
 =?utf-8?B?azdqbmsvYjFhVnBmMmNvemNxSEd3UEJUZzMyNVdsRzY4KzFHNURaUHNpNVp5?=
 =?utf-8?B?QTNNb2JEdUFxMUdodjdLWlJiOXFGc1Q0R2tJdDQydGlZMW13K3Baa1ZkK2Y0?=
 =?utf-8?B?WVVKbzlnYmN1Zm1zTlJxaTl5RUY0WmpXcXVBeHZSWFVaYjdmT0tRSE9xK0NL?=
 =?utf-8?B?bTI2U0YxQ3ZsbGRHUllvTnQydlgxMkJkMlpiSlB2aE95UERGaEtVWXM0STdQ?=
 =?utf-8?B?cFZ1eHc4OFpGb05PZkkwUEhkSkRhbDVaR1I5dWxOSkp2WDlHSnNHMGg3RE9y?=
 =?utf-8?B?T28vNlMvcGwwbkxVKzYvdXo1ZDNOeEttZDd2VmdtQ3VBQjNQZ0RybDAxQ0Rj?=
 =?utf-8?B?REZKMkVNNEtIY3hBSzY4N0E3dGg5Q1NjY0tFbjBzQ01RajRDTnd2Nm9CeHdX?=
 =?utf-8?B?YWZmMWttVndPNzVkZFJFNTlBWUlNeU1kUGhhWDVwY3Zkc0NCUkh5U2lDQk5k?=
 =?utf-8?B?bXB5a012Zk5WZFpRTC82U2JsK2pDNTBCbnJvQmN1SkpGRFBIU2puVW5SMm93?=
 =?utf-8?B?YUwxUFo5Q0ZDdVZvSkV0bmVuT25yUXdYRXFRWDJnRWdHVlRERWYxWVFMOWhF?=
 =?utf-8?B?ZFI3MXd2Mjd5Umh6bTRYVEp5QWRXT0xWUUpIenFmMHIyUXBsMDA3anhSb1RB?=
 =?utf-8?B?d1pYY1o2U3NhbFFzM0thcUdGZktzU0RzV2o2QzRxL0JSMEJjd0M0TS8rcGtm?=
 =?utf-8?B?eFBlTkNRR0N1UXg5YkhPRWdlM21MU2VzLy94M200RlRrTlZYWnhUTHJ2OWlV?=
 =?utf-8?B?eExkZlFmYThGUzc1UXN5QzVzbFBWMGJMb1o3dlc5eW1wWTN1Umtsd2JxVVBQ?=
 =?utf-8?B?OWNzSGlNeC9IYjFWejdwUWZBZFhpWFZJZ0VPcmt3MVpsMC94K2g1bEVObGZV?=
 =?utf-8?B?K1hGOXNVdDZta21wY3dUREdsK1pEeGUycnNjVjVuL01xMHFoODRzTHhMUmNn?=
 =?utf-8?B?YXYwZnVDV1JYRmRKRnAzWmJnN08yYXUwcXA1K1E0MHpQQWFuNXcvdUpTaFBY?=
 =?utf-8?Q?fRGb8qB8/vv8XPtWbyKepeCan?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7652c3-d852-4b10-2669-08db2b809db5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 09:26:00.4447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FEeqzJ2uZ+QxHyRGfPcphHwUHukgLnvAJk2gfayIIx+rFFUmts6CJJ2Ug4gMXI/MHIEWP6FyubXOe62qLYnAJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiAyMi8wMy8yMDIzIDEyOjAwLCBBa2hpbCBSIHdyb3RlOg0KPiA+PiBPbiAyMi8wMy8yMDIz
IDEwOjI0LCBBa2hpbCBSIHdyb3RlOg0KPiA+Pj4gQWxsb2NhdGUgb25seSBvbmUgRE1BIGNoYW5u
ZWwgZm9yIEkyQyBhbmQgc2hhcmUgaXQgZm9yIGJvdGggVFggYW5kIFJYDQo+ID4+PiBpbnN0ZWFk
IG9mIHVzaW5nIHR3byBkaWZmZXJlbnQgRE1BIGhhcmR3YXJlIGNoYW5uZWxzIHdpdGggdGhlIHNh
bWUNCj4gPj4+IHNsYXZlIElELiBTaW5jZSBJMkMgc3VwcG9ydHMgb25seSBoYWxmIGR1cGxleCwg
dGhlcmUgaXMgbm8gaW1wYWN0IG9uDQo+ID4+PiBwZXJmIHdpdGggdGhpcy4NCj4gPj4+DQo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hpbHJhamVldkBudmlkaWEuY29tPg0KPiA+Pg0K
PiA+PiBKdXN0IHRvIGNvbmZpcm0uIFRoaXMgaW1wYWN0cyBhbGwgVGVncmEgZGV2aWNlcyBmcm9t
IFRlZ3JhMjAgdG8gdGhlDQo+ID4+IGxhdGVzdC4gRG9lcyB0aGlzIHdvcmsgZm9yIGFsbCBUZWdy
YSBhbmQgdGhlIGRpZmZlcmVudCBETUEgY29udHJvbGxlcnMNCj4gPj4gdGhhdCB0aGV5IGhhdmU/
DQo+ID4+DQo+ID4gWWVzLCBJdCBzaG91bGQuIEkgY291bGQgc2VlIGluIHRoZSBBUEIgRE1BIGRy
aXZlciB0aGF0IHRoZSBzYW1lIGNoYW5uZWwNCj4gPiBjb3VsZCBiZSB1c2VkIGZvciBUWCBhbmQg
UlggYW5kIHRoZSBkaXJlY3Rpb24gaXMgY29uZmlndXJlZCBvbmx5IGR1cmluZw0KPiA+IGRtYV9w
cmVwXyooKSBjYWxscy4NCj4gPiBJIGRpZCBub3QgdGVzdCBpdCBvbiBhIFRlZ3JhIHdpdGggQVBC
IERNQSwgYnV0IHNpbmNlIGl0IHdvcmtzIHZlcnkgc2ltaWxhcg0KPiA+IHRvIEdQQyBETUEgdGhl
cmUgc2hvdWxkIG5vdCBiZSBhbnkgaW1wYWN0Lg0KPiANCj4gDQo+IE9LLiBCVFcsIHRoaXMgZG9l
cyBub3QgYXBwbHkgY2xlYW5seSBvbiB0b3Agb2YgLW5leHQuIEl0IGFwcGVhcnMgdGhhdA0KPiB0
aGlzIGlzIGJhc2VkIG9uIHRvcCAiaTJjOiB0ZWdyYTogRml4IFBFQyBzdXBwb3J0IGZvciBTTUJV
UyBibG9jayByZWFkIg0KPiBhbmQgdGhhdCBvbmUgbmVlZHMgdG8gYmUgYXBwbGllZCBmaXJzdC4g
VGhpcyBjYW4gYmUgYXZvaWRlZCBpZiB5b3Ugc2VuZA0KPiBhcyBhIHNlcmllcy4NCj4gDQpPaC4g
T2theS4gSSB1c2VkICdnaXQgYW0gLS0zd2F5JyB3aGVuIEkgdHJpZWQsIGFuZCB0aGUgY29uZmxp
Y3Qgd2VudCB1bm5vdGljZWQuDQpTaGFsbCBJIHNlbmQgYSBuZXcgdmVyc2lvbiBvbiB0b3Agb2Yg
LW5leHQ/DQpUaGUgdHdvIHBhdGNoZXMgd2VyZSBhZGRlZCBpbiBkaWZmZXJlbnQgY29udGV4dHMg
YW5kIHRoYXTigJlzIHdoeSBJIGRpZCBub3QNCmNvbWJpbmUgdGhlbSBhcyBhIHNlcmllcy4NCg0K
UmVnYXJkcywNCkFraGlsDQo=
