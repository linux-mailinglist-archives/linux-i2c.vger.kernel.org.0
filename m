Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16DDB617B0E
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 11:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiKCKrT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 06:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbiKCKrP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 06:47:15 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F374010577;
        Thu,  3 Nov 2022 03:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epTj5WrWcgmntWeTjsqB9WqKkwwIxeGRe+rb+nJEAtZQ3qI4smRur67tr0+Rkz1tt6bf+W7rEBvtZoghKdM0POjWUL0imU+ZTcDGUMQG/FQDSM91imX6dGjT5izuujxxtSBKdcACh58L+WmA7zJuQqqfJwhDk+1Pbg5CVbT45HVW1Qu6ItRxl2Oy9vDsEqwkoDEvXhsXflFcqanjz9ZbMx4eSoQuvGJuc7uZnms1dsuTkLcA0BJYqNFWU4lLJMbvpbpIba5amyPnS0Wt42vd68dDIo0q2J+PhJAm3rgejwio6aLV5n3j6uFuHIshm/1D4k9WEqRcouFULKcUb6lKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rC3h5WIqb8cL09CB65hE2jL+WCOhrHA4o3HzdQtO/48=;
 b=FlwwVntM5vAk7O3wYV9NHKb7GEmiqkvL3ZLfBfz8Pz7Zwn9Do3XOG13ohq1nH9FBfv+/MOWKSO3ZqSK2mvnA+4tBs9gh8ODsYYIpkCbhxt+SpYFaPdN7MdsaBsmigYWK63nOq5cme+1Vn08QODmF1BsyuXCjj2YEhjPGwMWKRgkGBdUd7NexIAxMiyNCCjNEZQaPE6nsPAP0IbjsOPS9LUUNFFxlUNVT8+yoVohJXnJU9qY2iz2iHjtVcqsr9QY+llYU19RjihbtOgCogWpITULHgOll0y8wxzZTCus7ufFHlXSHj0rdFouRHMY5M+Ym/3PRnDm8OJEvK81ykSgnSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rC3h5WIqb8cL09CB65hE2jL+WCOhrHA4o3HzdQtO/48=;
 b=sJ/NLjBfeISvLr8jRKQCbRVXaUjzw+jNtbEGKh2HSfLrGRyUpICB3Nsd6vkOm+YuURg4PDPLmpjrXZ+Sa67NZDVMd/nOqEy3NtZNj5R7MdvHr2BjHPbAAtVG20gEC2BosyeddvmjekBMwBseJD7KXXtThAvc2yecqX3Baxr/sxIfd0m45vv678Wb7tkqFSDfxvREglPsxq7sgun9cDpggfA48CyVcOhKFuVUIbhCMHVV3ORQDy3/kE9ByBOmii1vMIAXdiabLZx+Re80Ir+dfTmA+YtAnqHuRmaHHha0O6Fs4YT7pDhxjPkffOXlU5mWjQXCUWULw3PhWHbyHBj/1g==
Received: from PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8)
 by CY5PR12MB6480.namprd12.prod.outlook.com (2603:10b6:930:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 10:47:11 +0000
Received: from PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0]) by PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0%2]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 10:47:11 +0000
From:   Wayne Chang <waynec@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Thierry Reding <treding@nvidia.com>,
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
Subject: Re: [PATCH 03/11] dt-bindings: usb: Add binding for Cypress cypd4226
 I2C driver
Thread-Topic: [PATCH 03/11] dt-bindings: usb: Add binding for Cypress cypd4226
 I2C driver
Thread-Index: AQHY53wc4Wuwt5Vi/E64/Mw7R9FUF64gRg6AgAN9YYCAAAMcAIAAF7gAgAk2BAA=
Date:   Thu, 3 Nov 2022 10:47:11 +0000
Message-ID: <3edaa3c8-f0fb-3b87-4f33-324d5b964aea@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-4-waynec@nvidia.com>
 <f8eeeebc-e635-9c97-b97b-46df38f06002@nvidia.com> <Y1vLoT+/dgOgrxjD@orome>
 <7a1c4943-4ae2-cde4-221b-fa972c2baab2@nvidia.com> <Y1viIsL+Nxthc97j@orome>
In-Reply-To: <Y1viIsL+Nxthc97j@orome>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5500:EE_|CY5PR12MB6480:EE_
x-ms-office365-filtering-correlation-id: 8fada1ae-60ac-457b-7412-08dabd88c334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?L0RQNUZiNXovcDU5akF4dmtIclNQRS92WjVTZlRMaG41aVRKYWsrZTlTNXd4?=
 =?utf-8?B?OEZLQisxbU52N2oxeXhIYWJFQk9sbkh5eENYZ1dzaUpQVGFuNGFmQjZBQWxr?=
 =?utf-8?B?eUZtUjVaNHlDVDZ6K2MrSmN5Wmg2MzlIZnJCaEZsMkhEZzIvK1RBYmJNUE11?=
 =?utf-8?B?aFVvNEdFY0IzNDNSV3o0YWRNK0VOaFFLVDNmb2lqRFJ4VlBJSWtZK3BHVmIr?=
 =?utf-8?B?N0RmQUdMd2xDME0wSE1lVW1GNDdDcklwVUk1aHdsZ2VaL3dXUE9uWktma1Vw?=
 =?utf-8?B?akVGdWVZTTNYMSt3cmlGQndqaS91dVJ6Q21wd0E1M05hdlZjMndZSXg4REtQ?=
 =?utf-8?B?MFhjQkowUW5LOXA3c3FYbnNLZExoYjFtanJ0RlFaTmlRU1VSazFaeld2YU11?=
 =?utf-8?B?VjNWR3d3cFdCY05GM3N4ZUxEeXFSOW1DUzNsUmtGRWkwOGZscFNSRmMzU0hF?=
 =?utf-8?B?QWt0aFRqWGNBem9TMVloVGFTNkpQcy9hcDN2YzFyV3QxNWorSnBXWkV2OFhE?=
 =?utf-8?B?QjhqbmE3RUltUnk2RXppbzd4RnpLeHdxbm5sSWpRSkhqS2tKWHhNNFh3U21r?=
 =?utf-8?B?Z0x0T2ZKdlZRZjNsMEhML01jVWlXbDlueStaZE1zSFdVeWRyODBObGJxL1BH?=
 =?utf-8?B?VjFSYWN6ODdPRytGc3dsVUg0SzJPQVJFeEhZY0NsclNSSXRnbDRJb0hZWk5q?=
 =?utf-8?B?ZVBpMU40SU9sdHdnNTdaaWFUdGJJUUlkNGl6WlB4SWFsYXI2MjVIUjJiRm9i?=
 =?utf-8?B?dmdtR05VbFhDRHJaVGVlYS9QTzh5d01oa2Z4VDNZaGN2aUdBL1Q0UGNacENB?=
 =?utf-8?B?OERGNk4xNXg3T1lkb2RvN1A4MnpuOHNsVWN1SHp3Mm1QYWYwczdDdlpJVXlr?=
 =?utf-8?B?dUdwc0FKQXRlV1dIa1B3eEUxanJqcDZVT0lMdnRJbGlqWGJ3cldBeGx3aU1O?=
 =?utf-8?B?MTI2WW93WFplVjhZelg4OTJKbWYzRUxyNDhnanZzTEpIM3k2bnd3SDFSeDZj?=
 =?utf-8?B?VU1wRGNaY2pBMVhZSUgrS0tCbEh0VVVtaE9QaEh3QXhtUVA5M1l3dHR2NENo?=
 =?utf-8?B?Q3lCRTdPOExuY2ZBWW9Pc2lsenJTdlJGYkFLL0VsUE5adEpXNCtQQmVEb0lp?=
 =?utf-8?B?YWEweVdqYkVZTmVja3J3TnloK3VKelBKTFZTR0ZTc01NSGpHRWdoSUV2d05m?=
 =?utf-8?B?aG82M0t4NmdvcTY2N0Y3RFlhMEQvdmc4KzNXbHdmZkwxNTBJKzhZYTEvVkcv?=
 =?utf-8?B?MENVWUhKYldGZ215ZWxCdW9DR0hzRVI1OUNXcVluQStVREJhdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5500.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199015)(31686004)(36756003)(66899015)(86362001)(31696002)(2906002)(38100700002)(122000001)(83380400001)(186003)(38070700005)(8676002)(6512007)(4326008)(26005)(53546011)(76116006)(91956017)(478600001)(6506007)(2616005)(6636002)(54906003)(110136005)(66476007)(66556008)(64756008)(66446008)(66946007)(71200400001)(316002)(8936002)(41300700001)(7416002)(5660300002)(966005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGVsclBEZWUrd3FFZDkvVTljOEMyQTRWUjFQNDhHOWg0c3hIRm1YOFpVa1hF?=
 =?utf-8?B?ZGV1RjhVdEovOTh3Y0tOcXcyKzl3bWlxL0I2eGpaZ2VPSmVBdWNGbXVrSWxh?=
 =?utf-8?B?bDJqaDN1bUplWktiZjZ4bU90MlRKdk9XdVpndGVjbGFEd0ZNaG9hTnpjUVhI?=
 =?utf-8?B?VU90QjM2eUdRaUthSTJaeFFYWWlDNTlpYldIVUlnc0d4UDQ2NkNFaDNzL2Rn?=
 =?utf-8?B?WUxBMDN0Q2NNVzczV3BHcmNKNFhLVjlEdmxVeWRPQUZMQ3pJUklsa2xBbG52?=
 =?utf-8?B?MGZkN29HSWthYXQvRHh6OEgreGNDd3k3ZFRlRUs4NEx3S1dhRXpyd2hld0Fx?=
 =?utf-8?B?djJTbUdCQXBLUFJqTVBDM0JuL1lPRHU4RTkzaWJzT2pMaFZoU090SUFDd2pv?=
 =?utf-8?B?VWROM0RWY1VQc25XU1RWSld5d1FSR09adko5ZUdCRTMreURPVlAwM2RaYWFB?=
 =?utf-8?B?Q0FFUXNSQThrWFVTK3MrRHVkTUJ4SnJISHp4TWhNaExxY2wzbUR4TDBpeDJ1?=
 =?utf-8?B?MldhSWFMMG5KNVRUdzJGejFUVXgvMFBrcEV5TkdvMXZKMUpwR0p5Ti9wVnF4?=
 =?utf-8?B?WGtGd1hvMm4vVVZ3VldOdm9VZUFHRktrQkpycDFXYWZVV0ZIRzlwTEZBa2sz?=
 =?utf-8?B?Q3BNUGVzQXFVZVYzemZ4RWNwVWRRTGlNajB6aEV5Z2QvWVFGSThYbGwwRmU5?=
 =?utf-8?B?RURwRGtFYlQyY3VVTlRPMzFZSm5WZlZFRU53cTNVZVlUNGtWeFNoMCt5Mkcx?=
 =?utf-8?B?NTJjc0xkejEyMVlRM2VlNytZbTlCcXZEbkFuUGxmeWppZVVOREUzaVRtL0tR?=
 =?utf-8?B?aHVaZm5nTElETnJVVVF2YU05SmRkTy95SEMwYk5wZ1Z6V3FlYTNkNzRUckkx?=
 =?utf-8?B?RXJVV3VyOVZiTmJaZWR3bE53S0Yzdm9Jdkc0TDZ3Nzd3cDZEQXVrUjM4RVNI?=
 =?utf-8?B?T0FRMTV0V0krSkpnaWR6ZEl4cmhvU3VEYmhyMktFcWIxZGUwbUd3S3ZYcVY3?=
 =?utf-8?B?QTNuSXpiK2pzMTV0Z0tPZjRVMDRVNW1KaWNxMFZYUWlFb0RhRVVKNmlucDds?=
 =?utf-8?B?MHdxT1RyRXNFRWl2SFRBTVFjbkhFRThWMm40V21lOTljUE9UWGFkdEF5YnJn?=
 =?utf-8?B?c2c2ekVhNms0TlVFTHBGNDhHTkFXajhEMlc3THZmeDZIYW1CaERnUSthd083?=
 =?utf-8?B?M0lrUjRGY2JVcFRJSjYzWGxnMjdhWGQrclpJZXd1ZWN5UDRmbnJwUXJORUhh?=
 =?utf-8?B?S1BMZS9HVDV4dmtQTnJ2N1ZsUGpla1RISEx4TVRoTlozR0gxVEJGNnNmSDNz?=
 =?utf-8?B?Y2VIeGJseXdKNXpIbW91cDlYL296S0dDY2pETDlkQnBZckQ3dkVHWnhCRUpm?=
 =?utf-8?B?a3V6MFBsai9EanVOUlFWbzBlUHl0Y1VIN2hkdmdqbjlEcFhxY0tpOEkvRDRK?=
 =?utf-8?B?dXhLYU9jSUxpbmlzOGVIYjJ2OFE1c2I4UXMrRDg4Qm9Jc0M4SFQ2OVVOMlJ1?=
 =?utf-8?B?R2laSmt5SHdzZWUwNENDeVFyWTNQTGV6R0JOcGszMVJWVTM0dFhzNFdmbE1p?=
 =?utf-8?B?Z2xqRjI2dE5YeWdjSG9PNkJJK3hVK3pNaU9WVnFsb3MybzNtWFRCRUtiK2Zj?=
 =?utf-8?B?VTZrT3dPNDlqTXRMZi9YZFh2aGpJemxOUHIrY2padzNsVTFQYy9lOEdQbWhT?=
 =?utf-8?B?eG5sVDFZMVdsTWxleXVWa2ZZZk9ZUm93aTR0R21DejgxZ0NERi9EK2pqNi9W?=
 =?utf-8?B?OStsSWUzTDlCMDJPVXVXRUpHS1MvU0dDaWNBRVRtcDA1bVZKSzRLU3ZCSWNY?=
 =?utf-8?B?bjlnSHI2TStMR0ZKaHRNcmhnWUFLWEFuMzNMSlVjUkhtN0JlWitBUWVpZmVB?=
 =?utf-8?B?TzVlbnZ3dUZBc21SbkdJOVJYVGwvSXBRY1BBc1gwMHhJUTg0NlJ4M3UzOGxB?=
 =?utf-8?B?OUVKZncyaWJxRUMwdlBmL05VOHM3WndMbkVtSUZIK2hLSzZSdFl1cDFWTVR1?=
 =?utf-8?B?anVTQzd5UTJ1MUxvS09oSTA2UVdPclM4OTczdUNCVEltWURlS0FjU0FwdndT?=
 =?utf-8?B?d2dwU3hZNkZKa0xLUTJTSUVUcEsyd3lJcmlkdmVJblhKVHhDeGRBY042QkFJ?=
 =?utf-8?Q?KOfyuYjwuu+O66HcZwX4f6LqW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D44EC524B60EF14CAF4C2A7BB301572B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5500.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fada1ae-60ac-457b-7412-08dabd88c334
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 10:47:11.3761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Of0RhBCj9Aal31YtzJZBt44F8nW5/AO0f2hxxwAaXm1KMxg7/BMnMBtt54WtvY1Ri8jVz7EDYz0IMpqvu1QqaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6480
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDEwLzI4LzIyIDIyOjA3LCBUaGllcnJ5IFJlZGluZyB3cm90ZToNCj4gT24gRnJpLCBP
Y3QgMjgsIDIwMjIgYXQgMDE6NDI6MzZQTSArMDEwMCwgSm9uIEh1bnRlciB3cm90ZToNCj4+IE9u
IDI4LzEwLzIwMjIgMTM6MzEsIFRoaWVycnkgUmVkaW5nIHdyb3RlOg0KPj4+IE9uIFdlZCwgT2N0
IDI2LCAyMDIyIGF0IDA4OjEzOjU3QU0gKzAxMDAsIEpvbiBIdW50ZXIgd3JvdGU6DQo+Pj4+IE9u
IDI0LzEwLzIwMjIgMDg6NDEsIFdheW5lIENoYW5nIHdyb3RlOg0KPj4+Pj4gYWRkIGRldmljZS10
cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgQ3lwcmVzcyBjeXBkNDIyNiB0eXBlLUMNCj4+
Pj4+IGNvbnRyb2xsZXIncyBJMkMgaW50ZXJmYWNlLiBJdCBpcyBhIHN0YW5kYXJkIGkyYyBzbGF2
ZSB3aXRoIEdQSU8NCj4+Pj4+IGlucHV0IGFzIElSUSBpbnRlcmZhY2UuDQo+Pj4+Pg0KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogV2F5bmUgQ2hhbmc8d2F5bmVjQG52aWRpYS5jb20+DQo+Pj4+PiAtLS0N
Cj4+Pj4+ICAgICAuLi4vYmluZGluZ3MvdXNiL2N5cHJlc3MsY3lwZDQyMjYueWFtbCAgICAgICAg
fCA4NiArKysrKysrKysrKysrKysrKysrDQo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDg2IGlu
c2VydGlvbnMoKykNCj4+Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jeXByZXNzLGN5cGQ0MjI2LnlhbWwNCj4+Pj4+DQo+Pj4+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9jeXBy
ZXNzLGN5cGQ0MjI2LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2N5cHJlc3MsY3lwZDQyMjYueWFtbA0KPj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4+
IGluZGV4IDAwMDAwMDAwMDAwMC4uNWFjMjhhYjRlN2ExDQo+Pj4+PiAtLS0gL2Rldi9udWxsDQo+
Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2N5cHJlc3Ms
Y3lwZDQyMjYueWFtbA0KPj4+Pj4gQEAgLTAsMCArMSw4NiBAQA0KPj4+Pj4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCj4+Pj4+ICslWUFNTCAx
LjINCj4+Pj4+ICstLS0NCj4+Pj4+ICskaWQ6aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
dXNiL2N5cHJlc3MsY3lwZDQyMjYueWFtbCMNCj4+Pj4+ICskc2NoZW1hOmh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPj4+Pj4gKw0KPj4+Pj4gK3RpdGxlOiBD
eXByZXNzIGN5cGQ0MjI2IFVDU0kgSTJDIFR5cGUtQyBDb250cm9sbGVyDQo+Pj4+PiArDQo+Pj4+
PiArbWFpbnRhaW5lcnM6DQo+Pj4+PiArICAtIFdheW5lIENoYW5nPHdheW5lY0BudmlkaWEuY29t
Pg0KPj4+Pj4gKw0KPj4+Pj4gK2Rlc2NyaXB0aW9uOiB8DQo+Pj4+PiArICBUaGUgQ3lwcmVzcyBj
eXBkNDIyNiBVQ1NJIEkyQyB0eXBlLUMgY29udHJvbGxlciBpcyBhIEkyQyBpbnRlcmZhY2UgdHlw
ZS1DDQo+Pj4+PiArICBjb250cm9sbGVyLg0KPj4+Pj4gKw0KPj4+Pj4gK3Byb3BlcnRpZXM6DQo+
Pj4+PiArICBjb21wYXRpYmxlOg0KPj4+Pj4gKyAgICBjb25zdDogY3lwcmVzcyxjeXBkNDIyNg0K
Pj4+Pj4gKw0KPj4+Pj4gKyAgJyNhZGRyZXNzLWNlbGxzJzoNCj4+Pj4+ICsgICAgY29uc3Q6IDEN
Cj4+Pj4+ICsNCj4+Pj4+ICsgICcjc2l6ZS1jZWxscyc6DQo+Pj4+PiArICAgIGNvbnN0OiAwDQo+
Pj4+PiArDQo+Pj4+PiArICByZWc6DQo+Pj4+PiArICAgIGNvbnN0OiAweDA4DQo+Pj4+PiArDQo+
Pj4+PiArICBpbnRlcnJ1cHRzOg0KPj4+Pj4gKyAgICBtYXhJdGVtczogMQ0KPj4+Pj4gKw0KPj4+
Pj4gKyAgY3lwcmVzcyxmaXJtd2FyZS1idWlsZDoNCj4+Pj4+ICsgICAgZW51bToNCj4+Pj4+ICsg
ICAgICAtIG52DQo+Pj4+PiArICAgICAgLSBnbg0KPj4+Pj4gKyAgICBkZXNjcmlwdGlvbjogfA0K
Pj4+Pj4gKyAgICAgIHRoZSBuYW1lIG9mIHRoZSBDQ0d4IGZpcm13YXJlIGJ1aWx0IGZvciBwcm9k
dWN0IHNlcmllcy4NCj4+Pj4+ICsgICAgICBzaG91bGQgYmUgc2V0IG9uZSBvZiBmb2xsb3dpbmc6
DQo+Pj4+PiArICAgICAgLSAibnYiIGZvciB0aGUgUlRYIHByb2R1Y3Qgc2VyaWVzDQo+Pj4+IFBs
ZWFzZSBhZGQgJ05WSURJQScgc28gdGhhdCBpdCBpcyAnZm9yIHRoZSBOVklESUEgUlRYIHByb2R1
Y3Qgc2VyaWVzJw0KPj4+Pg0KPj4+Pj4gKyAgICAgIC0gImduIiBmb3IgdGhlIEpldHNvbiBwcm9k
dWN0IHNlcmllcw0KPj4+PiBTYW1lIGhlcmUgcGxlYXNlIGFkZCAnTlZJRElBJyBzbyB0aGF0IGl0
IGlzICdmb3IgdGhlIE5WSURJQSBKZXRzb24gcHJvZHVjdA0KPj4+PiBzZXJpZXMnLg0KPj4+Pg0K
Pj4+PiBSb2IsIGFueSBjb25jZXJucyBhYm91dCB0aGlzIHByb3BlcnR5IGluIGdlbmVyYWw/IFVu
Zm9ydHVuYXRlbHksIEFDUEkgY2hvb3NlDQo+Pj4+IGEgMTYtYml0IHR5cGUgZm9yIHRoaXMgYW5k
IHVzZWQgJ252JyBmb3IgdGhlIFJUWCBwcm9kdWN0LiBJIGRvbid0IGZpbmQgJ2duJw0KPj4+PiBm
b3IgSmV0c29uIHZlcnkgZGVzY3JpcHRpdmUgYnV0IHdlIG5lZWQgYSB3YXkgdG8gZGlmZmVyZW50
aWF0ZSBmcm9tIFJUWC4NCj4+Pj4NCj4+Pj4gVGhpcyBpcyBuZWVkZWQgaW4gdGhlIEN5cHJlc3Mg
Q0NHWCBkcml2ZXIgZm9yIHRoZSBmb2xsb3dpbmcgLi4uDQo+Pj4+DQo+Pj4+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAyMjA5MjgxNTA4NDAuMzgwNDMxMy0xLXdheW5lY0BudmlkaWEu
Y29tLw0KPj4+Pg0KPj4+PiBJZGVhbGx5LCB0aGlzIHNob3VsZCBoYXZlIGJlZW4gaW5jbHVkZWQg
aW4gdGhpcyBzZXJpZXMgYnV0IHdhcyBzZW50IGJlZm9yZS4NCj4+Pj4gV2UgY2FuIGFsd2F5cyBy
ZS13b3JrL3VwZGF0ZSB0aGUgYWJvdmUgcGF0Y2ggZXZlbiB0aG91Z2ggaXQgaGFzIGJlZW4gcXVl
dWVkDQo+Pj4+IHVwIG5vdy4NCj4+PiBUaGUgZHJpdmVyIHNlZW1zIHRvIHVzZSB0aGlzIDE2LWJp
dCB2YWx1ZSBvbmx5IHRvIGNvbXBhcmUgd2l0aCBhDQo+Pj4gY29ycmVzcG9uZGluZyBmaWVsZCBp
biB0aGUgZmlybXdhcmUgaGVhZGVycy4gSG93IGV4YWN0bHkgd2Ugb2J0YWluIHRoaXMNCj4+PiB2
YWx1ZSBpcyB0aGVyZWZvcmUgbm90IGltcG9ydGFudC4gSG93ZXZlciwgc2luY2UgdGhpcyAxNi1i
aXQgdmFsdWUgaXMNCj4+PiBlbWJlZGRlZCBpbiBmaXJtd2FyZSBpbWFnZXMsIHdlIGFsc28gY2Fu
bm90IHN1YnN0aXR1dGUgdGhlbSB3aXRoDQo+Pj4gc29tZXRoaW5nIG1vcmUgc2Vuc2libGUuDQo+
PiBJIGFtIGFjdHVhbGx5IHdvbmRlcmluZyBpZiB0aGlzIGlzIGFjdHVhbGx5IGVtYmVkZGVkIGlu
IGFueSBpbWFnZXMgYmVjYXVzZSBJDQo+PiBzZWUgaXQgcG9wdWxhdGVkIGJ5IHRoZSBpMmMtbnZp
ZGlhLWdwdS5jIGRyaXZlciBbMF0uIFNvIEkgYW0gd29uZGVyaW5nIGlmIHdlDQo+PiBjYW4gdXNl
IFBST1BFUlRZX0VOVFJZX1NUUklORygpIGZvciB0aGlzIGRyaXZlciBpbnN0ZWFkIGFuZCBoYXZl
IGEgbW9yZQ0KPj4gZGVzY3JpcHRpdmUgbmFtZSBzdWNoIGFzICdudmlkaWEscnR4Jz8NCj4gV2hh
dCBJIG1lYW4gYnkgImVtYmVkZGVkIGluIGZpcm13YXJlIGltYWdlcyIgaXMgdGhhdCB0aGUgdmFs
dWUgcmVhZCBmcm9tDQo+IHRoZSBwcm9wZXJ0eSBpcyBjb21wYXJlZCB0byB2YWx1ZXMgcmVhZCBm
cm9tIGEgZmlybXdhcmUgYmxvYiAoZWl0aGVyIG9uZQ0KPiByZWFkIGJhY2sgZnJvbSB0aGUgY2hp
cCBvciBvbmUgbG9hZGVkIHVzaW5nIHJlcXVlc3RfZmlybXdhcmUoKSkuIFNlZSBmb3INCj4gZXhh
bXBsZSBjY2dfY2hlY2tfdmVuZG9yX3ZlcnNpb24oKSBhbmQgY2NnX2NoZWNrX2Z3X3ZlcnNpb24o
KS4NCj4gDQo+IFNvIHRoZSB3YXkgdGhhdCB0aGlzIDE2LWJpdCBudW1iZXIgaXMgdXNlZCBpcyB0
byBkZWZpbmUgd2hhdCB0eXBlIG9mDQo+IHZlbmRvciBmaXJtd2FyZSB3ZSBzdXBwb3J0LiBTbyB0
aGlzIGlzIGFsc28gdXNlZCB0byBhdm9pZCB0cnlpbmcgdG8gbG9hZA0KPiBhIFRlZ3JhIGZpcm13
YXJlIG9uIGEgR1BVIGFuZCB2aWNlIHZlcnNhLg0KPiANCj4gU28geWVzLCB3ZSBjb3VsZCBwb3Rl
bnRpYWxseSBzdGlsbCBtYWtlIHRoZSBpMmMtbnZpZGlhLWdwdS5jIGRyaXZlciBhZGQNCj4gYSAi
bnZpZGlhLHJ0eCIgc3RyaW5nIHRvIG1ha2UgaXQgbW9yZSBkZXNjcmlwdGl2ZSBsaWtlIERULCBi
dXQgdGhlbiB3ZSdkDQo+IHN0aWxsIG5lZWQgdG8gc29tZWhvdyByZXNvbHZlIHRoYXQgdG8gdGhl
ICJudiIgc3RyaW5nIGZvciB0aGUgYXNzaWdubWVudA0KPiB0byB1Yy0+ZndfYnVpbGQuDQo+IA0K
PiBOb3Qgc3VyZSBhYm91dCBob3cgdGhhdCB3b3VsZCBpbXBhY3QgdGhlIEFNRCBiaXRzLiBBbm90
aGVyIG9mIHRob3NlIENDR1gNCj4gVUNTSSBkZXZpY2VzIGlzIHJlZ2lzdGVyZWQgYnkgdGhlIGky
Yy1kZXNpZ253YXJlLXBjaWRydi5jIGRyaXZlciwgYnV0IGl0DQo+IGRvZXNuJ3QgcGFzcyBhIHNv
ZnR3YXJlIG5vZGUuIEZyb20gd2hhdCBJIGNhbiB0ZWxsIHRoYXQgc2ltcGx5IG1lYW5zIGFsbA0K
PiBvZiB0aG9zZSBjaGVja3Mgd2lsbCB3b3JrIHdpdGggZndfYnVpbGQgPT0gMHgwMC4gUHJpbWFy
aWx5IEkgdGhpbmsgdGhhdA0KPiB3aWxsIGNhdXNlIGZsYXNoaW5nIG9mIHRoZSBmaXJtd2FyZSBu
b3QgdG8gYmUgc3VwcG9ydGVkLg0KPiANCj4gU28geWVhaCwgaGF2aW5nIHRoYXQgc3RyaW5nIGJl
IHNvbWV0aGluZyBlbHNlIChpLmUuIG1vcmUgZGVzY3JpcHRpdmUpDQo+IGFuZCB0aGVuIG1hdGNo
IG9uIHRoYXQgaW5zdGVhZCB3b3VsZCBkZWZpbml0ZWx5IHdvcmsuIEFmdGVyIGxvb2tpbmcgYXQN
Cj4gdGhpcyBzb21lIG1vcmUsIHVzaW5nIGV4aXN0aW5nIGRyaXZlci1tYXRjaGluZyBtYXkgbm90
IHdvcmsgYWZ0ZXIgYWxsDQo+IGJlY2F1c2Ugd2hpbGUgdGhlcmUncyBBQ1BJIG1hdGNoaW5nIGFu
ZCB3aXRoIHRoaXMgc2VyaWVzIERUIG1hdGNoaW5nLA0KPiB0aGUgdmFyaW91cyBHUFUgSTJDIGlu
c3RhbnRpYXRpb25zIGFyZSBwdXJlbHkgZG9uZSBpbiBzb2Z0d2FyZSwgc28gdGhleQ0KPiBoYXZl
IG5laXRoZXIgYW5kIHRoZXJlZm9yZSB3b3VsZCBuZWVkIGEgc2Vjb25kYXJ5IGxvb2t1cCBtZWNo
YW5pc20uIFdlDQo+IG1heSBiZSBzdHVjayB3aXRoIHRoYXQgY2NneCxmaXJtd2FyZS1idWlsZCBw
cm9wZXJ0eSwgYnV0IGFzIHlvdSBzYWlkIGl0DQo+IHNob3VsZCBiZSBwb3NzaWJsZSB0byBhdCBs
ZWFzdCBzYW5pdGl6ZSBpdC4NCj4gDQoNCk9LLiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIEknbGwg
bWFrZSB0aGUgY2hhbmdlIHRvIGV4dGVuZCB0aGUgcHJvcGVydHkgDQppbnRvIHN0cmluZyBpbiB0
aGUgbmV4dCBwYXRjaCBzZXJpZXMuDQoNCnRoYW5rcywNCldheW5lLg0KDQoNCj4gVGhpZXJyeQ0K
PiANCj4+IEpvbg0KPj4NCj4+IFswXWh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtbnZpZGlhLWdwdS5jI24yNjENCj4+IC0tIA0KPj4gbnZwdWJsaWM=
