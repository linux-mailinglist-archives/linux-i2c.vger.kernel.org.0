Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2398759E73F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 18:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243840AbiHWQ2e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 12:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242911AbiHWQ2Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 12:28:16 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074F411BB1E;
        Tue, 23 Aug 2022 05:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3c0aHIo5tkl6xN9rwZPOXulxpjYtDpDzAi9sFGpZsEexWJH3e5nLJrASwoGJJIMd7HQ7v02BEeaVtAV1qvZuaEI+cNFmYpPZmpYksQJUhj+gZz7xbtrsTK1yrhNwI5OZj4tCjCUT0XVtpEAz7PdgaUaMwhjtrmwyHSpVdc668A+00RjDGvNnUDWz0Y4j9xZLwqeq72bGWPy7sqDuvqODW00z12ZQNqdqs4ZxRI4aW3VyL4LnEtyyBWVCzegioOFLOc9IVPMWnLHzp4CIscw85RepuzR6ufKEnpX0VrQncA8X+LgsO2m4YsyMG1QFX5un5TylFhOJ18NPXyZ5kgBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzLwc7NO7ErizYfXCQnuLV74yPreFoETSmQSwbu/VLQ=;
 b=O+pSlfam/BQoBf59FpPih2Z2CW7PX8mT18W04sonbC7iblX1YrPsWkdTWeneAnb+4nCXhyNl9/9LC9fA06owNY7KHtg5v5NRJMFUHz/ZAfYEZdrihsDhaqRXyn8AGVAQjyJZzqTnStm+NnW8m+2AG/hST2jb6sKe9KpIvlfwiJzDjc4+muoaJIgqV+nl5GJ3euRB9LDV5fiCFFOPuSK1u1JqycI357TBgb9tiVJbEooN0uZ4s+CTILtGYBl+F9mgn8BBHdJkhA6w1kHtJUlGv/e1fuZX13/j+zyO6S0RIpPAb3u5eoJG36uldr0GOONbQJ8tq/xLMLailCa0aDsbtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzLwc7NO7ErizYfXCQnuLV74yPreFoETSmQSwbu/VLQ=;
 b=nDT3F99RqzbMp1SioGMQrvoQkPb4iM9HFJLIA/qFK5Sley1J9lHW7ZiIPFqicY7r/98bhrG3UaQc9ilEmb1IrqPp9ROyw0u7mt6R6eks+fqD3c03skjilMy0dkAeXc4GzoulQiEPE9MPwXfXa33otCBdQkyXJejj8D8r31e7DAlAzbtRcSmyurHarPw/X81qqYTFIDbYsQWtQUn3DspCzyDrbvtdTfiWYGCxxOxGAsBi4+DGa+XEDnDbRGiPhiRc6GtikSIiGCcbPfR2XttEimbom6D0uSvIFBattjksy5enyRCKUfRjcQGQ87SP2iY+/04twdf9l48W+7PX2qHMzg==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by DM4PR12MB5939.namprd12.prod.outlook.com (2603:10b6:8:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 12:55:36 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::24cb:46cd:5176:aa13]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::24cb:46cd:5176:aa13%9]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 12:55:36 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "Kartik ." <kkartik@nvidia.com>
Subject: RE: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Thread-Topic: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Thread-Index: AQHYs8aKp+OlLQycOkO470/UfA2RzK22VXAAgAADTwCABBngUIAAPbIAgAAHnMCAAK1egIAACdIAgAB/C4CAAEIiAIAAAWsAgAA0KUA=
Date:   Tue, 23 Aug 2022 12:55:36 +0000
Message-ID: <SJ1PR12MB63393F51E29BA1F85AD249DBC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20220819122313.40445-1-akhilrajeev@nvidia.com>
 <20220819122313.40445-2-akhilrajeev@nvidia.com>
 <20281ca7-e597-7030-4861-5f9a3594726d@gmail.com>
 <89a746fd-a98e-3147-7811-33c5051c2b6d@gmail.com>
 <SJ1PR12MB6339FC1F82EB1BB7417E533BC0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <ebb0764f-db92-d69d-49ac-151f4e3e0b8a@collabora.com>
 <SJ1PR12MB63396DC508F63807F1CE9901C0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <fac10841-1682-845f-3e4a-5668f59caed0@gmail.com>
 <cd0374f1-2c05-7e61-7187-cfc9c42edf63@gmail.com>
 <SJ1PR12MB63397BBD4EF314A742680F2CC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <a7ba27c4-992b-28d1-f6c2-3937b4f275ce@collabora.com>
 <c9ba2629-fc81-cefd-0d6d-991084781ec3@collabora.com>
In-Reply-To: <c9ba2629-fc81-cefd-0d6d-991084781ec3@collabora.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 512dc53c-7ec2-413b-df01-08da8506c5cc
x-ms-traffictypediagnostic: DM4PR12MB5939:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UejlhF1DCcJtEzpu9UnmeEZLPnVgF81lIrvlwCflWWxclqGUbgrmSzxy1o5WrOrBF2ypReKmzUd1aUb0iQjcc2yD4lVm4UlT5YnEc1/z+HAs8JVm97kmod5OcxinyP7wcTD/svIxt6dtcGdgDzZHTiQvZYzjJMugTAnlBEMhOie6gWKkUKQguSJtXkcIwwLDLgBmLVlhOzuG7E13Ce6bMUrMk7WwgDgPY/SxTJc5iCyVCuBsJbjixXJ0R/faLAcF0zGMElCgmYaYuBTwefu1aS6QTnNDw0jlIx5Ckvc7q9MsB/V9rzcCo2J4thihdGyN+M1djlShHF5gB+ySecp3+TBmF11vX+6y3V7GyjW3mvna5ETgO6BOtDPYdnHpFymsZ0lvS0efDLHQ1NNOvuEKPRJvWFNhGXnDUyW+czFocsTlix65G4gl+lC/z/JMvZUyqok8kdfbYjca6RWyDC2Lf0kIS2KzqKuk3TMzCwHqfV7Q4eHBpHPjHvEMI8mvktRfZFg7TRrdpW9Y0n2cpG59+ZbO+LRs0+GKzMmIkPiFib3LpnZiTj6aG+dU1bEK3o2kyif0nWEXIc4a42IsANpMdIPUqdBInHkz++ta2PRfC/id44blUKI6qwirz5VzyTSDn9+brnvx5dm5Y8OdhYwgrSGSDBkzTM0QFqSwRZE0C6yMz99A9TjUGdW0AnKFP4W/iV5sncuKW1rhu0yoXcyqDqRCiRpqSLyQ7cBRLtOXYL/OE+Ypdjm+5H8kIuFCwe39vnI2tH3PfBcKoFIrBQImc8rY36OpAuU6V1fUsUL0QEYM7znbFTOmN7vtj3bTq1Hb9aQMmHVAwWh9aae3c9Snm4n+qHvn+z8IjqPvJ58dm+k0O2BS7Qilafn3h6ci9kA1K/RhsoUrVgUUj57kOW89VQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(86362001)(6506007)(53546011)(55236004)(26005)(9686003)(33656002)(966005)(7696005)(5660300002)(41300700001)(7416002)(478600001)(8936002)(52536014)(107886003)(186003)(2906002)(122000001)(83380400001)(38070700005)(55016003)(38100700002)(316002)(4326008)(66946007)(66556008)(8676002)(66446008)(76116006)(84970400001)(64756008)(110136005)(66476007)(54906003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3JVaWprcG1lL0dBajRqbDNCMzN2QmtJMWxSYUQ4QWcwb3ZKdVllaU1FS3NI?=
 =?utf-8?B?cjVxM05xQk9EUlRkRWhVVllOdFNyWHAzVG9TSFNUNGVmR0UrWkFjZkFOaWhz?=
 =?utf-8?B?Q3Uza1dyTVo2eE4vMlozNXo5ME9Jc1hqdmJVdnJ0MkJNeHNrT3Z2RG4ydkdq?=
 =?utf-8?B?M3ZrMktkWEszT0Q5aTlzVUxVZmNaWVNXdFp4OHRkU3YwU0p2aXdQczVmdmpR?=
 =?utf-8?B?bHJFb0JqQzNLbWJQNHRoTXRmbDBrS2RVTzNvTDFmRGZORHVDSXlIYUd4MWFO?=
 =?utf-8?B?MXROSE9wbmRxZktBVTd5dTFKQnhFeFdQZzRkNHQ4d0Z2enMzMEQxeTJZR2pM?=
 =?utf-8?B?VVFncHVxMWVuSGphdVpEd25seGNySW1TYWkvc2twSUMyM1hEQmF2S2JSOEVP?=
 =?utf-8?B?YU5ST3grNE45MFFleDRwcm81WG0rdU94Sk5vTnAveGpSdFEwRlVUREpFNldH?=
 =?utf-8?B?ckxSMTB0MEl2VXBGU2V3dllDNCtUdTdNTnkwRHk1T0hHK1N2YWRCUytmTEN3?=
 =?utf-8?B?Y2htUWdkN0JOc3ZLaXpoNlNCWFRYRlhNR3krcUZLcnQySHYyNStjMHVVYi91?=
 =?utf-8?B?NFFhbnFqK0hoMkgvdDg0bGYxYlBsdFRTdjA5OGRUVE1qV3FGcmdoU0xSS3Bv?=
 =?utf-8?B?aTJzV0EzaTlzTVcvcnZYRHAvVWVSeTFudXgwd3dhWHFUR1YyVmNnNC9jMXVv?=
 =?utf-8?B?eTluOHlUUDlVZXYvSzJMT3VGOGppYnNvdmtCVitWT3M0RGxNeHUxZTZ2aVQv?=
 =?utf-8?B?MkZZSnZTRkFnK1F1NnhRUFNjeC9Vdzh3TnVWRGFVUDN3QlU0dG1TZnRiQTBw?=
 =?utf-8?B?NXpzY3FTMHhMc04vNkdCSHk2K2lvdWgxQ0pJTnh6WVlJa3VaUyt5c2Z2SUo4?=
 =?utf-8?B?T2E1dGJvVzNyTTRENjRtSkFZSnMvZWxmY05jM0VQZ1crRFdiWmlWc05qS3BD?=
 =?utf-8?B?N05QSjhmTm9zdWZxcEI5SDNKdHlVSFd3dEgwY0ovR0ZjcDFuclNqYkYxSita?=
 =?utf-8?B?aVhyOVR4MkxPdXNudmZUV1F3STNNdkRwZEpkcTMwNFE4bzZyTWhRalJZdzBN?=
 =?utf-8?B?MXV4YWJScjV3WXpveloyNFRQUGFJcHhMc0wzSG45ZFlOcXBnM0MreWhhL3ln?=
 =?utf-8?B?YlFqY0cxV3MrcGUzazh0c01hSkJ1b0NQMWpBT2E1ekpxeTVFOTRWb2IrV2hh?=
 =?utf-8?B?aURZWkkzc2RqTFpqTEpBalk0cXhWai9vSWRtSm56YWNiQWtNOTNTemJ3MzF1?=
 =?utf-8?B?M3AxOFB2cGhkNjNOaE1oUThxcDFnQWkvZ1dpU1lGb2tFMGlzd0FsdXhzUlVV?=
 =?utf-8?B?RUhuNEM0bkkrcFZJNHJKSFM3TVJ1ZGdlWEJieUFmODBWVit6QjY5b3FBczBl?=
 =?utf-8?B?VW0yZ2U3QTFqZGlkc0N1VVdMRTRVUHQrUlFndE5DdWRYcEViOUs5SUxVWnJk?=
 =?utf-8?B?NEdkaVFwNkVjSXd6MFc5emNxWFp4REdqQVpiOE1UM2JSOFFsNm9kK1crSEZU?=
 =?utf-8?B?anpUcGpuVmJUMUV4MytTd09vSGtjN0pnVTIvT1dDLzhsS2xYa2UxVlFna0Qw?=
 =?utf-8?B?aGJQZWlIOHh6OGFDdVlMM2VHdXpDYmpyeUdvckQvekNaZUtOQ25wMENkWllt?=
 =?utf-8?B?TFR5Nmk1WkVSMzdyN1N3RU95YTNLMUMwc2tuUG9KWUdsVlBRa1Q3SDJQcHk5?=
 =?utf-8?B?cTY3Vk1PU2xPYmRJTmNyc2pnb3d5WitBWmdaL0VITlNsTnFpUzAyYzJ2UnR4?=
 =?utf-8?B?ZERWb2xqMXZHVDJuQWs5dXFOMFZOVVMzZDMvQTdLdk5sL01GNkZPbnRJV09m?=
 =?utf-8?B?KzdDcGt2WEdNZWpydUpXNTIrTHFvTkhrUzQ4NmVYQUVkUHRWOXh1ZHBWeDZo?=
 =?utf-8?B?c05rSnQ1U1pXb3IxTEdnLy91dzNIekllemxYL1MyeUFTSnJXa0t3WXRKY0Uz?=
 =?utf-8?B?cTRCWWcxanVHVUNpM3JSc09raFp2QXA3Wk9aWHlZbHB3cVlBN3dRMTNkNTFM?=
 =?utf-8?B?NUMwWXYvSnZkQ3NpWGRkSm0vU3dUOUVCMVdCNWgyam5vQlp3WUZqaXlOSmZ2?=
 =?utf-8?B?RHZhZGhEczRnREo4SEV2aFlxNDZoNGFDNldHSjNYb1hmK1FidmN4aDhRUE03?=
 =?utf-8?Q?tUD10la1/7Q4GsoWYPhLYYBSB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512dc53c-7ec2-413b-df01-08da8506c5cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 12:55:36.0713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3uKaFZ4wMSDi2XaG24fT0NBD9xOvE/Z44viS5QB5XGCxxTN9cNOb/CzkIVpMluiTrKAg6/b6jYIGob1PFbaeJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5939
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiA4LzIzLzIyIDExOjM5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6DQo+ID4gT24gOC8yMy8y
MiAwODoxNywgQWtoaWwgUiB3cm90ZToNCj4gPj4+IDIyLjA4LjIwMjIgMjM6MzMsIERtaXRyeSBP
c2lwZW5rbyDQv9C40YjQtdGCOg0KPiA+Pj4+IDIyLjA4LjIwMjIgMTM6MjksIEFraGlsIFIg0L/Q
uNGI0LXRgjoNCj4gPj4+Pj4+IE9uIDgvMjIvMjIgMDk6NTYsIEFraGlsIFIgd3JvdGU6DQo+ID4+
Pj4+Pj4+IDE5LjA4LjIwMjIgMTg6MTUsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOg0KPiA+
Pj4+Pj4+Pj4gMTkuMDguMjAyMiAxNToyMywgQWtoaWwgUiDQv9C40YjQtdGCOg0KPiA+Pj4+Pj4+
Pj4+ICAgICAgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAibnZpZGlhLHRlZ3JhMjEw
LWkyYy12aSIpKQ0KPiA+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICBpMmNfZGV2LT5pc192aSA9IHRy
dWU7DQo+ID4+Pj4+Pj4+Pj4gKyAgICBlbHNlDQo+ID4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgIGky
Y19kZXYtPmRtYV9zdXBwb3J0ID0gISEob2ZfZmluZF9wcm9wZXJ0eShucCwgImRtYXMiLA0KPiA+
Pj4+Pj4+Pj4+ICsgTlVMTCkpOw0KPiA+Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+IDEuIFlvdSBsZWFr
IHRoZSBucCByZXR1cm5lZCBieSBvZl9maW5kX3Byb3BlcnR5KCkuDQo+ID4+Pj4+Pj4+Pg0KPiA+
Pj4+Pj4+Pj4gMi4gVGhlcmUgaXMgZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbCgpIGZvciB0aGlz
IGtpbmQgb2YNCj4gPj4+Pj4+Pj4+IHByb3BlcnR5LWV4aXN0cyBjaGVja3MuDQo+ID4+Pj4+Pj4g
T2theS4gSSB3ZW50IGJ5IHRoZSBpbXBsZW1lbnRhdGlvbiBpbg0KPiBvZl9kbWFfcmVxdWVzdF9z
bGF2ZV9jaGFubmVsKCkgdG8NCj4gPj4+Pj4+PiBjaGVjayAnZG1hcycuDQo+ID4+Pj4+Pj4NCj4g
Pj4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+PiAzLiBJZiAiZG1hcyIgaXMgbWlzc2luZyBpbiBEVCwgdGhl
biBkbWFfcmVxdWVzdF9jaGFuKCkgc2hvdWxkIHJldHVybg0KPiA+Pj4+Pj4+Pj4gTlVMTCBhbmQg
ZXZlcnl0aGluZyB3aWxsIHdvcmsgZmluZS4gSSBzdXBwb3NlIHlvdSBoYXZlbid0IHRyaWVkIHRv
DQo+ID4+Pj4+Pj4+PiB0ZXN0IHRoaXMgY29kZS4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gQWx0
aG91Z2gsIG5vLiBJdCBzaG91bGQgcmV0dXJuIEVSUl9QVFIoLUVOT0RFVikgYW5kIHRoZW4geW91
DQo+IHNob3VsZA0KPiA+Pj4gY2hlY2sNCj4gPj4+Pj4+Pj4gdGhlIHJldHVybiBjb2RlLg0KPiA+
Pj4+Pj4+IFllcy4gQWdyZWUgdGhhdCBpdCBpcyBtb3JlIGFnbm9zdGljIHRvIGNoZWNrIGZvciBF
UlJfUFRSKC1FTk9ERVYpLg0KPiBCdXQNCj4gPj4+IHNpbmNlIEkNCj4gPj4+Pj4+PiBjYWxsIHRl
Z3JhX2luaXRfZG1hKCkgZm9yIGV2ZXJ5IGxhcmdlIHRyYW5zZmVyIHVudGlsIERNQSBpcyBpbml0
aWFsaXplZCwNCj4gPj4+IHdvdWxkbid0DQo+ID4+Pj4+Pj4gaXQgYmUgYmV0dGVyIHRvIGhhdmUg
YSBmbGFnIGluc2lkZSB0aGUgZHJpdmVyIHNvIHRoYXQgd2UgZG8gbm90IGhhdmUgdG8gZ28NCj4g
Pj4+Pj4+IHRocm91Z2gNCj4gPj4+Pj4+PiBzbyBtYW55IGZ1bmN0aW9ucyBmb3IgZXZlcnkgYXR0
ZW1wdGVkIERNQSB0cmFuc2FjdGlvbiB0byBmaW5kIG91dA0KPiB0aGF0DQo+ID4+PiB0aGUNCj4g
Pj4+Pj4+IERUDQo+ID4+Pj4+Pj4gcHJvcGVydGllcyBkb24ndCBleGlzdD8NCj4gPj4+Pj4+Pg0K
PiA+Pj4+Pj4+IFNoYWxsIEkganVzdCBwdXQgaTJjX2Rldi0+ZG1hX3N1cHBvcnQgPSB0cnVlIGhl
cmUgc2luY2UgRE1BIGlzDQo+IHN1cHBvcnRlZA0KPiA+Pj4gYnkNCj4gPj4+Pj4+PiBoYXJkd2Fy
ZT8gSXQgd291bGQgdHVybiBmYWxzZSBpZiBkbWFfcmVxdWVzdF9jaGFuKCkgcmV0dXJucyBzb21l
dGhpbmcNCj4gPj4+IG90aGVyDQo+ID4+Pj4+Pj4gdGhhbiAtRVBST0JFX0RFRkVSLg0KPiA+Pj4+
Pj4+DQo+ID4+Pj4+Pj4gICAgICAgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAibnZp
ZGlhLHRlZ3JhMjEwLWkyYy12aSIpKQ0KPiA+Pj4+Pj4+ICAgICAgICAgICAgICAgaTJjX2Rldi0+
aXNfdmkgPSB0cnVlOw0KPiA+Pj4+Pj4+ICArICAgIGVsc2UNCj4gPj4+Pj4+PiAgKyAgICAgICAg
ICAgIGkyY19kZXYtPmRtYV9zdXBwb3J0ID0gdHJ1ZTsNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBUaGUg
Y29kZSBhbHJlYWR5IGhhcyBkbWFfbW9kZSBmb3IgdGhhdC4gSSBkb24ndCBzZWUgd2h5IGFub3Ro
ZXINCj4gdmFyaWFibGUNCj4gPj4+Pj4+IGlzIG5lZWRlZC4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBF
aXRoZXIgYWRkIG5ldyBnZW5lcmljIGRtYV9yZXF1ZXN0X2NoYW5fb3B0aW9uYWwoKSB0aGF0IHdp
bGwgcmV0dXJuDQo+IE5VTEwNCj4gPj4+Pj4+IGlmIGNoYW5uZWwgaXMgbm90IGF2YWlsYWJsZSBh
bmQgbWFrZSBUZWdyYSBJMkMgZHJpdmVyIHRvIHVzZSBpdCwgb3INCj4gPj4+Pj4+IGhhbmRsZSB0
aGUgZXJyb3IgY29kZSByZXR1cm5lZCBieSBkbWFfcmVxdWVzdF9jaGFuKCkuDQo+ID4+Pj4+DQo+
ID4+Pj4+IExldCBtZSBlbGFib3JhdGUgbXkgdGhvdWdodHMuDQo+ID4+Pj4+DQo+ID4+Pj4+IFRo
ZSBmdW5jdGlvbiB0ZWdyYV9pMmNfaW5pdF9kbWEoKSBpcyBhbHNvIGNhbGxlZCBpbnNpZGUNCj4g
dGVncmFfaTJjX3hmZXJfbXNnKCkgaWYNCj4gPj4+Pj4gRE1BIGlzIG5vdCBpbml0aWFsaXplZCBi
ZWZvcmUsIGkuZS4gaWYgKCFpMmNfZGV2LT5kbWFfYnVmKS4NCj4gPj4+Pg0KPiA+Pj4+IFRoaXMg
aXMgbm90IHRydWUNCj4gPj4+Pg0KPiA+Pj4+IGkyY19kZXYtPmRtYV9tb2RlPWZhbHNlIGlmICFp
MmNfZGV2LT5kbWFfYnVmIGFuZCB0aGF0J3MgaXQNCj4gPj4+Pg0KPiA+Pj4+IGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjAtcmMyL3NvdXJjZS9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLQ0KPiA+Pj4gdGVncmEuYyNMMTI1Mw0KPiA+Pj4+DQo+ID4+Pj4gdGVncmFfaTJjX2luaXRf
ZG1hKCkgaXMgaW52b2tlZCBvbmx5IGR1cmluZyBwcm9iZQ0KPiA+Pj4+DQo+ID4+Pj4+IFNvLCBp
ZiBzdXBwb3NlIHRoZXJlIGlzIG5vIERUIGVudHJ5IGZvciBkbWFzLCB0aGUgZHJpdmVyIHdvdWxk
IGhhdmUgdG8gZ28NCj4gdGFrZQ0KPiA+Pj4gdGhlDQo+ID4+Pj4+IHBhdGggdGVncmFfaTJjX2lu
aXRfZG1hKCkgLT4gZG1hX3JlcXVlc3RfY2hhbigpIC0+IG9mXyooKSBhcGlzIC0+IC4uLiBhbmQN
Cj4gPj4+IHRoZW4gZmlndXJlDQo+ID4+Pj4+IG91dCB0aGF0IERNQSBpcyBub3Qgc3VwcG9ydGVk
LiBUaGlzIHdvdWxkIGhhcHBlbiBmb3IgZWFjaCB0cmFuc2ZlciBvZg0KPiBzaXplDQo+ID4+PiBs
YXJnZXIgdGhhbg0KPiA+Pj4+PiBJMkNfUElPX01PREVfUFJFRkVSUkVEX0xFTi4NCj4gPj4+Pj4N
Cj4gPj4+Pj4gVG8gYXZvaWQgdGhpcywgSSBhbSBsb29raW5nIGZvciBhIHZhcmlhYmxlL2ZsYWcg
d2hpY2ggY2FuIGluZGljYXRlIGlmIHRoZQ0KPiBkcml2ZXINCj4gPj4+IHNob3VsZCBhdHRlbXB0
DQo+ID4+Pj4+IHRvIGNvbmZpZ3VyZSBETUEgb3Igbm90LiBJIGRpZG4ndCBxdWl0ZSBnZXQgdGhl
IGlkZWEgaWYgZG1hX21vZGUgY2FuIGJlDQo+ID4+PiBleHRlbmRlZCB0byBzdXBwb3J0DQo+ID4+
Pj4+IHRoaXMsIGJlY2F1c2UgaXQgaXMgdXBkYXRlZCBiYXNlZCBvbiB4ZmVyX3NpemUgb24gZWFj
aCB0cmFuc2Zlci4gTXkgaWRlYSBvZg0KPiA+Pj4gaTJjX2Rldi0+ZG1hX3N1cHBvcnQNCj4gPj4+
Pj4gaXMgdGhhdCBpdCB3aWxsIGJlIGNvbnN0YW50IGFmdGVyIHRoZSBwcm9iZSgpLg0KPiA+Pj4N
Cj4gPj4+IEkgc2VlIG5vdyB0aGF0IGl0J3MgeW91IGFkZGVkIHRlZ3JhX2kyY19pbml0X2RtYSgp
IHRvDQo+ID4+PiB0ZWdyYV9pMmNfeGZlcl9tc2coKS4gQW5kIHRlZ3JhX2kyY19pbml0X2RtYSgp
IGFscmVhZHkgZmFsbHMgYmFjayB0byBQSU8NCj4gPj4+IGlmIERNQSBpcyB1bmF2YWlsYWJsZS4N
Cj4gPj4+DQo+ID4+PiBJIGRvbid0IHJlbWVtYmVyIHdoeSAhSVNfRU5BQkxFRChDT05GSUdfVEVH
UkEyMF9BUEJfRE1BKSB3YXMNCj4gYWRkZWQNCj4gPj4+IHRvDQo+ID4+PiB0ZWdyYV9pMmNfaW5p
dF9kbWEoKSwgYnV0IGlmIGRtYV9yZXF1ZXN0X2NoYW4oKSByZXR1cm5zIC1FUFJPQkVfREVGRVIN
Cj4gPj4+IHdoZW4gdGhlcmUgaXMgbm8gRE1BIGNoYW5uZWwgYXZhaWxhYmxlIGF0IGFsbCwgdGhl
biB5b3Ugc2hvdWxkIGZpeCBpdC4NCj4gPj4+DQo+ID4+PiBUcnlpbmcgdG8gaW5pdGlhbGl6ZSBE
TUEgZHVyaW5nIHRyYW5zZmVyIGlmIGl0IGZhaWxlZCB0byBpbml0aWFsaXplDQo+ID4+PiBkdXJp
bmcgcHJvYmUgaXMgYSB3cm9uZyBhcHByb2FjaC4gRE1BIG11c3QgYmUgaW5pdGlhbGl6ZWQgb25s
eSBvbmNlDQo+ID4+PiBkdXJpbmcgcHJvYmUuIFBsZWFzZSBtYWtlIHRoZSBwcm9iZSB0byB3b3Jr
IHByb3Blcmx5Lg0KPiA+Pg0KPiA+PiBXaGF0IEkgYW0gdHJ5aW5nIGZvciBpcyB0byBoYXZlIGEg
bWVjaGFuaXNtIHRoYXQgZG9lc24ndCBoYWx0IHRoZSBpMmMNCj4gdHJhbnNmZXJzDQo+ID4+IHRp
bGwgRE1BIGlzIGF2YWlsYWJsZS4gQWxzbywgSSBkbyBub3Qgd2FudCB0byBkcm9wIERNQSBiZWNh
dXNlIGl0IHdhcw0KPiB1bmF2YWlsYWJsZQ0KPiA+PiBkdXJpbmcgcHJvYmUoKS4NCj4gPg0KPiA+
IFdoeSBpcyBpdCB1bmF2YWlsYWJsZT8gU291bmRzIGxpa2UgeW91J3JlIG5vdCBwYWNrYWdpbmcg
a2VybmVsIHByb3Blcmx5Lg0KVW5hdmFpbGFibGUgdW50aWwgaW5pdHJhbWZzIG9yIHN5c3RlbWQg
aXMgc3RhcnRlZCBzaW5jZSB0aGUgbW9kdWxlIGhhcyB0byBiZQ0KbG9hZGVkIGZyb20gZWl0aGVy
IG9mIGl0Lg0KDQo+ID4NCj4gPj4gVGhpcyBzaXR1YXRpb24gaXMgc3VyZSB0byBoaXQgaWYgd2Ug
aGF2ZSBJMkMgZHJpdmVyIGFzIGJ1aWx0IGluIGFuZCBETUEgZHJpdmVyIGFzIGENCj4gPj4gbW9k
dWxlLiBJbiBzdWNoIGNhc2VzLCBJMkMgd2lsbCBuZXZlciBiZSBhYmxlIHRvIHVzZSB0aGUgRE1B
Lg0KPiA+DQo+ID4gRm9yIFRlZ3JhIEkyQyBidWlsdC1pbiArIERNQSBkcml2ZXIgbW9kdWxlIHlv
dSBzaG91bGQgYWRkIHRoZSBkbWEua28gdG8NCj4gPiBpbml0cmFtZnMgYW5kIHRoZW4gaXQgd2ls
bCB3b3JrLiBUaGlzIGlzIGEgY29tbW9uIHByYWN0aWNlIGZvciBtYW55DQo+ID4ga2VybmVsIGRy
aXZlcnMuDQo+ID4NCj4gPiBJdCdzIGFsc28gc2ltaWxhciB0byBhIHByb2JsZW0gd2l0aCBmaXJt
d2FyZSBmaWxlcyB0aGF0IG11c3QgYmUNCj4gPiBhdmFpbGFibGUgdG8gZHJpdmVycyBkdXJpbmcg
Ym9vdCwNCg0KSXNuJ3QgdGhlIGluaXRyYW1mcyBsb2FkZWQgYWZ0ZXIgdGhlIGRyaXZlciBpbml0
Y2FsbHM/IFdhc24ndCB2ZXJ5IG11Y2ggY2xlYXIgZm9yIG1lDQpmcm9tIHRoZSBjb2RlIGFuZCBk
b2NzLiBXZSBkaWQgdHJ5IGFkZGluZyB0aGUgbW9kdWxlIGluIGluaXRyYW1mcyBpbml0aWFsbHks
IGJ1dA0KY291bGRuJ3QgZmluZCBtdWNoIG9mIGEgZGlmZmVyZW5jZSBmcm9tIHdoZW4gaXQgaXMg
bG9hZGVkIGJ5IHN5c3RlbWQgaW4gcm9vdGZzLg0KV2lsbCBleHBsb3JlIG1vcmUgb24gdGhpcyBp
ZiB0aGlzIHJlYWxseSBoZWxwcy4NCg0KPiA+DQo+ID4+IEFub3RoZXIgb3B0aW9uIEkgdGhvdWdo
dCBhYm91dCB3YXMgdG8gcmVxdWVzdCBhbmQgZnJlZSBETUEgY2hhbm5lbCBmb3INCj4gZWFjaA0K
PiA+PiB0cmFuc2Zlciwgd2hpY2ggbWFueSBzZXJpYWwgZHJpdmVycyBhbHJlYWR5IGRvLiBCdXQg
SSBhbSBhIGJpdCBhbnhpb3VzIGlmIHRoYXQNCj4gd2lsbA0KPiA+PiBpbmNyZWFzZSB0aGUgbGF0
ZW5jeSBvZiB0cmFuc2Zlci4NCj4gPg0KPiA+IFBlcmhhcHMgYWxsIHlvdSBuZWVkIHRvIGRvIGlz
IHRvIGFkZCBNT0RVTEVfU09GVERFUCB0byBUZWdyYSBJMkMgZHJpdmVyDQo+ID4gbGlrZSB3ZSBk
aWQgaXQgZm9yIHRoZSBFTUMgZHJpdmVyIFsxXS4NCj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtDQo+IG5l
eHQuZ2l0L2NvbW1pdC8/aWQ9MTRiNDNjMjBjMjgzZGUzNjEzMWRhMGNiNDRmMzE3MGI5ZmZhNzYz
MA0KPiA+DQo+IA0KPiBBbHRob3VnaCwgcHJvYmFibHkgTU9EVUxFX1NPRlRERVAgd29uJ3Qgd29y
ayBmb3IgYSBidWlsdC1pbiBkcml2ZXIuIEluDQo+IHRoYXQgY2FzZSwgY2hhbmdlIFRlZ3JhIEky
QyBrY29uZmlnIHRvIGRlcGVuZCBvbiB0aGUgRE1BIGRyaXZlci4NCg0KU2luY2UgSTJDIGNhbiB3
b3JrIHdpdGhvdXQgRE1BLCB3b3VsZG4ndCBpdCBsaW1pdCB0aGUgZmxleGliaWxpdHkgb2YgSTJD
IGRyaXZlci4NCg0KUmVnYXJkcywNCkFraGlsDQoNCg0KDQoNCg==
