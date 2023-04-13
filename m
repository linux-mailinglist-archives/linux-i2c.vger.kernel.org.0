Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976FC6E0FAA
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 16:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbjDMOH3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 10:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231781AbjDMOHV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 10:07:21 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D762394;
        Thu, 13 Apr 2023 07:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYL21vKRqjKv6ra6qHAmGU1dfHZuvXgnS77no3ncOVv3V/PTIyGlQVXMWTKJPcGkgngsPOebV8CStZFjndEvEfPqPA6rt/8Mxdj17GaUaoO5cHGc4EtKWpHC6pnRYvoetHzXuQYHcjF96QqzPTcUIVjDKbgb8OxOa6Le5EdP31yXfUyFMYtAebjld4bDOmzEyTu16YdBubGSFwmhC+dYXDJWC63fQ/Kc9erL51bcEjaNuRQf5LMF2AC7iubHB+gnjTiYFDiB1ukZhEU8Rb/sBOF+sgyCL5bNpUWLxZSPOFiqLl4acd089AymZqZSAjHsVBu3z9eEekKsB163x9eI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/C0u8SVP3nb/NJ6zPmIn+/IBbotcOEL3QqmSClS70V8=;
 b=M7E4DVFmp6EDuVW7RGf28FLvGjSWsB0Z+kQ7kV/i7R7YQ6C5lwVXQ12iy2ik9CBd6QvHxn96Glk+h4lPIThLSnXweXA2HjA+WwPydKXiQ5o1Nje1GmqcUwkh9lfHCXecOlSzYvdZ/MCgWOhttrQJbtfYuBY4k2fXtFzD0oe35sBdQg+sBK/8cN2rSwmTkaap0/NPr2MIn86W0H9qP2ESoP6CPycN3awNwt8KHtmvJKtu2fRuQOFK0PN17CXYyyAoCGGsDJkr+HhrJEIASI3yoz5kpujQqz7J7Wv0WqUHkL0uDvdI11nTvbUzeO7kn0wkP/aTNfU9h/t6gtnIQjWodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C0u8SVP3nb/NJ6zPmIn+/IBbotcOEL3QqmSClS70V8=;
 b=EhMfXMq01ZIeZ4fUYiQfHFCLaaWb/fry/Xpxx9Pfs51wcKmuOnSAsUh8y7f/D2QpbANZEXHrCt3UxnCgbzPmAdH4mVUbwjKzLIEg7ERdfFxWjTLcCrV0MXskb4L7/coQQMvydFY1yZyxn5xDxxKd6TvU/RorwRCUxAAZr3F1wMaKZd6NzAZZToqQessZLCOSngY9duE3Q37UXKxK6gr7OKRC05aoYZkheUqaoAXlpRPaNMX7rHstKy1XLaStvptlCK2F2ExGscldxLXUG8CC3ZR8pRHrKcA8NJfU4Qv5q6tA68C6IuidXSTVV56tiuSxxrQ6dZi1yL7/Azlhk321RA==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 14:07:17 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::1183:1168:f0fb:40d7]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::1183:1168:f0fb:40d7%6]) with mapi id 15.20.6277.035; Thu, 13 Apr 2023
 14:07:17 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH v5 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Thread-Topic: [PATCH v5 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Thread-Index: AQHZbgk/4cutGcLXH0Kic5v7h3WGUK8pREGAgAACABA=
Date:   Thu, 13 Apr 2023 14:07:17 +0000
Message-ID: <SJ1PR12MB6339EDD711E6B2E9D1E44C1FC0989@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20230413130849.2894-1-akhilrajeev@nvidia.com>
 <20230413130849.2894-2-akhilrajeev@nvidia.com>
 <5492c5cc-c93a-fde3-cd77-a598b2b67af5@collabora.com>
In-Reply-To: <5492c5cc-c93a-fde3-cd77-a598b2b67af5@collabora.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|DM4PR12MB7669:EE_
x-ms-office365-filtering-correlation-id: 695d5134-e859-44d0-1878-08db3c2863a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: orjsy++f9h6zn4aO2rPfNkB115Bb8lr56a4E8dHCfWJ6g9ELVnQBSCDdFPn8xQojgMO1gjnbX+dRV+eCyOY3xnZM5ty5k1vvyLG96Z1REmZSLhaMohemNQiglf7eo1/iTjIq6ePqouXGkqVcQutaK7E9uMhB2cIACY8zn12rxDNHZr+DFzMINnayIp1s7VYUMWRvNIAqKcdFSelmNgtcqWa3Hbb4dHTX+n2D0i4w4NDodZeHf25HKinpGKJdOVH2K+5N4+CwGQe10+kOaDdmllXibdebsEhL5oheNmA2hLaP7oC1mxzKepEy8dAPinD+xprLZgn1tnISZ+WLUFIepNXdfP3snZjAd94K2E+eWdOiOKHJdnUECKmkWyc3MTt/HOuOtYj0OXpungqiBRc+VX69dDWu0W7+fMbijekf1pgoARUJCoqSe8IeSuOZW42QnVc/aUCxJFhh51jPPjBr87H7PsgcQBNDDE459Z9wp2aV0L6bW7A3j3s7PgetHCmehyW/yKqW8obUfolnZ8N+ckXHmpBdj/XtrtrSbDEwz27gATePtwM8lxTLgfeF7AGoQS0MNjURKPTfpSFJ7ArlbUH46zjnRqeuxPLPhHDDMySJp2o7zxZxK7LV1d3bd7fBtm8x2HipnJT6AFCSS5UzfA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(558084003)(76116006)(66946007)(66476007)(66446008)(64756008)(66556008)(86362001)(478600001)(316002)(71200400001)(7696005)(55016003)(110136005)(5660300002)(52536014)(8936002)(8676002)(122000001)(83380400001)(2906002)(921005)(38100700002)(9686003)(38070700005)(26005)(6506007)(41300700001)(186003)(53546011)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEFPejVqbDRpRG1YUUpyYlFKS3lrWUVuOWY2Y0ZmSnR6Zm5BWWIrb0dXYmF3?=
 =?utf-8?B?VUdwR09GR3dBTDlVUEw3WkdZbXhMUWJUc0Vib0ltVXJ0dUYxc20vTDRlOE40?=
 =?utf-8?B?WmRVVWIvMVFuWFdKYkRvUFJlVGhXZWxNdkZnK3hJa2MzMzJmTVp3U0tES09m?=
 =?utf-8?B?dFYxd1BkZEpxMUFxZUtVR1c3SE9sZHh0aWtEQjdXUURsbnZPbzFDV0JTN21a?=
 =?utf-8?B?cWJkVndBV1Yxd0J6TEwxVlA2aU5hR0NVeWJlMnZTQ0VtU01VdUlrdG02RW43?=
 =?utf-8?B?ZDZDREYyVFpsaGhwN0JrRWNldnFjQ0R5a1JJQlllU2QzSGVGZGcwUmJmZTZ1?=
 =?utf-8?B?cS9TaXFOS1RXbFZlYjlhZEt0L0wyQ1JXY0xNeUp4M2xlV2MvNVpWWmoxWkpa?=
 =?utf-8?B?K1IzVW9ML2NTaWFNVzlRQzQ5T1V4R2dadUZhVnpVbnRxN0pqT0pJa1JKTlI0?=
 =?utf-8?B?UHlNM085cWtDR2JCTHIwaFlnTndIODFnTVltQ0FzRDJHY3ZNYUcxL3JrUzV2?=
 =?utf-8?B?ZzJ1ZFVtYnc5WGl1OE1PMURQN3NEcENYUnFneFQ5YzZUWWFlTDdEM0dDdEtF?=
 =?utf-8?B?WXZrb1MxbGxQQmh3TTg4eVkxZVNmNGVaUEVzQWdoQ0VWOUFtejZtdlhIaHpo?=
 =?utf-8?B?Q2FMaGp3VzM2SkxEVDNCUUlHRThVaU9vOWpicHpRODc3c2hQYm9HdU1LR1l6?=
 =?utf-8?B?d2RrbDhxL1daWDBVU3lEWlNGcHZ0aDRqanVBUENwT2xCS1FnOTZYdW9EWHhV?=
 =?utf-8?B?UlN5UDJydW1ZNTJ0L0dOU3NndnJReURSZzd0aUk0cHhNclVBWHBSRUhDUHRB?=
 =?utf-8?B?REJNWWtWb3E3UmJhbGZoR1Z6NDdvMGJBRE9mWlAyMHdPZUhFbjRIY3VJR0ww?=
 =?utf-8?B?UVpQWTVzMHFudnVHcHY1NkRrbWU5WjN6QnkzTmU5a3RpdFdJU3FVSHJDaHNl?=
 =?utf-8?B?eHoyd252MmRsQmxTdTJqVldvZlduK3luWEdFd2g2a3FvLzFIWm1JMm5SRlps?=
 =?utf-8?B?dUhSUWViVUgxczRxL1ZuVWV1VmFra1h0U3lCSWcwRzlDVWpjbXdOcG5zeW4v?=
 =?utf-8?B?Mlo3bC8ycHhMVWhEOC9vK2tuc0hCUERLT2ZQcFFFWS9zNjhNTXZ0QWI0SGw5?=
 =?utf-8?B?U1ZWRk53SkUyM000U2h6cnRDOEdzZmFvek5nTjNwdVdhejlyT0xxQzdQVU1D?=
 =?utf-8?B?TjBwb0Y5K1M5S0xTb0Q0bVA2a0wwMm1hM2Q3cWhrZzNScElLWktCbW5UdEE4?=
 =?utf-8?B?cGVqdXptK0hIK1VvdjVQQ0dLbjJPUkY3eWQyMFp1cnAybW9teFU2L0szZlhp?=
 =?utf-8?B?TWlnQXJsYUdLRktoL2djeWU2WWxQdzlTTVdGSWdUM09ReVIvZzM2T0JDNVVs?=
 =?utf-8?B?UWgwRFErWDdWd1VGaWJ0N3cxTXRielR2ZEtXSHhNUEZaTjgrSnl0OUcwdWdV?=
 =?utf-8?B?M0t3TTAvcUlpRElQMDg4WVVkajhYK2hIRkFTVldxbUJ2NnZYaC9ySVlpdzZG?=
 =?utf-8?B?dm5sRTI5cWNiTVN2VTNMaXE0cGdkWUlWVFRYSDVFVVhmU2QrczBVWnByeUVu?=
 =?utf-8?B?aC8yWU9KdjFVVlBldVBraUh6d1Zld2FDdHFFc0VYU3owdW1sSDlDcmRKQWhr?=
 =?utf-8?B?dUhIdzZVNXdyVGpJeDZPNVdRcGpFa1NxL2pzd3dmbUIxcWY2aHRvUU10c2s0?=
 =?utf-8?B?MTdRYjhscXltbUpjU2QzQ3B6dXJKMW1oT2dINFBnUmprZStMNHhORTdRUXJJ?=
 =?utf-8?B?R3VDTVRKdlhFVEdjSVFvMWlSY1doWTRMNEtpS1FjKzZSN3BuYUdqNXBVOXdE?=
 =?utf-8?B?bjBVc2ZXODUwOTZjbnpHc21pejFDOVlJTDkvMEt0MlNiUXhyMTNLY2dPS0xa?=
 =?utf-8?B?YTNxeTZycXJjRkdCcEpPdzhmajc4SGdSampLSERiazhoU2Z0YllRTVl3M0w0?=
 =?utf-8?B?NDY1NW5MdWlnamFkSTNZWCtBYm5BbjA2cEVhVmZrVVRKci9mT0FRNEhrKytq?=
 =?utf-8?B?WG95VDFYQU5NRDBWODlQaURsVFZOQWhHYVErUmNQYjc0ZUhnZnZPL0JIdmFK?=
 =?utf-8?B?aHVIbWhNM1gwcmJ1ZXBCTmV4TDBxd041ZGNHcmU3bCtFbS9hajUwc1o3NzY1?=
 =?utf-8?Q?1d5EwFP00G5VNt6axveLN7s8v?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695d5134-e859-44d0-1878-08db3c2863a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 14:07:17.0453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LnRRvLuI7FYeqj/0b9pVe5eExpO/M2MF0wMjWiKvHE5AqqxPH8ak4i2BwpM+11izNgNTuEiAdDy2h41n4jpHGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiA0LzEzLzIzIDE2OjA4LCBBa2hpbCBSIHdyb3RlOg0KPiA+IEBAIC0yNzksNiArMjgwLDcg
QEAgc3RydWN0IHRlZ3JhX2kyY19kZXYgew0KPiA+ICAgICAgIHNpemVfdCBtc2dfYnVmX3JlbWFp
bmluZzsNCj4gPiAgICAgICBpbnQgbXNnX2VycjsNCj4gPiAgICAgICB1OCAqbXNnX2J1ZjsNCj4g
PiArICAgICBfX3UxNiBtc2dfbGVuOw0KPiANCj4gSXQncyBzdGlsbCBfX3UxNg0KT2guIEkgdG90
YWxseSBtaXNzZWQgdGhhdCBjb21tZW50LiBXaWxsIHVwZGF0ZS4NCg0KVGhhbmtzLA0KQWtoaWwN
Cg==
