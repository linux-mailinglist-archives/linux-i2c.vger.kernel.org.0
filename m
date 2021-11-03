Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D6E443CFE
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 07:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbhKCGUt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 02:20:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:60647 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230152AbhKCGUs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Nov 2021 02:20:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218346178"
X-IronPort-AV: E=Sophos;i="5.87,204,1631602800"; 
   d="scan'208";a="218346178"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 23:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,204,1631602800"; 
   d="scan'208";a="500913078"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 02 Nov 2021 23:18:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 23:18:11 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 23:18:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 2 Nov 2021 23:18:10 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 2 Nov 2021 23:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nN9oWj1kQuY+FsD6CNSKhhwrNbocg0F1kJLOC6Tp0sMjZgi9ChJPdzAGhGW9rSusma0HNYwWbY4ENGVUTm3QIZBNbH9jzg6YYbQ3R+tDmL4wFhGzQC4/YW5Vfe2gWessM/MOcXTg+d3yDBHzIM4fAKWmbDisKDKQ0ck+zNBs6CwGN7uu9LaXY7yi7UXyylKsaPqJkB0zOHvmZjS8ttvzhbTGAgiUDF3bpTkqtxzaS1av9+Rkyejq/rJXoy8uiUGuzu8yvuOLqeHi8cpQF7+Qj6ez4B2TMAbYQ+BdLlcBn6e3czx+AMw21JlFJK+MReS8qS5wuQssisdmm3S2gW6yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7dOIuGskGEW+HTNDj92xZBhnZPl1lFhUZ0PPVEOr5U=;
 b=ddlBtn7SgKkP6ZExFsZLFngHc9Dm49qgvY36CIj6u7oWrKrgu2IMGQngG1d4TLoYMXQLjBQ5KKRRY/Ss8hw47/zXaxxFGW2QXCc7QxdzxC2OcWjwte4ePuRrpKH21gaZ83T6hYQCkUkX1bru60XP0sDhT/F0BYymUCqk+cttiJ+slnPYJzPbdmJ1WGGBFjNq4qDaK8m2kNwve+DjYnUE931c4vJZqJm0mzdOuqw/xnkgIHFcn8L2oz6k1SP5hewp67DIQZPYFd2c2goS20T1c6Fj24FHYwh+eSSGefCZi6bY5yMGUjO79so9q3O4ptl1kHIattX7Xj9knx+6Ntg+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7dOIuGskGEW+HTNDj92xZBhnZPl1lFhUZ0PPVEOr5U=;
 b=EvHpWsofOjqG9r3Op4NuggJ7tV+Bd6T+tXAAlmSPqC4EgKvE7lV9A4Kigj5wPSRwtjPqKC0DpTvrVm60sslsAQxvEXVCOM726fN67xqGF2vslGM4YHFmOow2WALVLmqQ0yvHv6eu893lTl2NxO5q05FW5Jx7FebbLKaDnn0d/ps=
Received: from MWHPR11MB0030.namprd11.prod.outlook.com (2603:10b6:301:65::23)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 06:18:06 +0000
Received: from MWHPR11MB0030.namprd11.prod.outlook.com
 ([fe80::1daa:d1d1:1ddb:1a7d]) by MWHPR11MB0030.namprd11.prod.outlook.com
 ([fe80::1daa:d1d1:1ddb:1a7d%6]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 06:18:06 +0000
From:   "Chen, Conghui" <conghui.chen@intel.com>
To:     "Deng, Jie" <jie.deng@intel.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>
CC:     Viresh Kumar <viresh.kumar@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: RE: [PATCH 1/2] i2c: virtio: disable timeout handling
Thread-Topic: [PATCH 1/2] i2c: virtio: disable timeout handling
Thread-Index: AQHXzuCtMAL6ZG+ZFk6y8t+4kqEzUqvxVtSg
Date:   Wed, 3 Nov 2021 06:18:05 +0000
Message-ID: <MWHPR11MB0030C3489F38FF2AAF7C3D0A908C9@MWHPR11MB0030.namprd11.prod.outlook.com>
References: <20211019143748.wrpqopj2hmpvblh4@vireshk-i7>
 <YW8LFTcBuN1bB3PD@ninjato> <94aa39ab-4ed6-daee-0402-f58bfed0cadd@intel.com>
 <YW+q1yQ8MuhHINAs@kroah.com> <8e182ea8-5016-fa78-3d77-eefba7d58612@intel.com>
 <20211020064128.y2bjsbdmpojn7pjo@vireshk-i7>
 <01d9c992-28cc-6644-1e82-929fc46f91b4@intel.com>
 <20211020105554.GB9985@axis.com> <20211020110316.4x7tnxonswjuuoiw@vireshk-i7>
 <df7e6127-05fb-6aad-3896-fc810f213a54@intel.com>
 <20211029122450.GB24060@axis.com>
 <8592a48d-0131-86bf-586a-d33e7989e523@intel.com>
In-Reply-To: <8592a48d-0131-86bf-586a-d33e7989e523@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7314ee3-a64b-4797-7c1e-08d99e91b317
x-ms-traffictypediagnostic: MW3PR11MB4572:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MW3PR11MB4572CF2A309D4DCCF68A4F31908C9@MW3PR11MB4572.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JnPJHQIOgPOKr5uWiXz8w0clHURpa/o+0gZgyARXPk1e2/WEk4NR3MelVj00Cc/D3Jf5FjjcREjILj+Tz/xWGCZ8Bz290S4iPjZcRNvPDNW/V60VFOp/3ydIS8QgT1rxz5gJ3NFCPP7alhsbf4ovTG7UsUOMPSwJDXjWtQ+nlVvIJJ+tWSaG21BBv0MRNeWG+0G1XO0LVAzp9qLaFiaXgnfkMI0YTNLQ27JuyeZtb8wmnA1iiff/8mxCG3+NbRr/ZFkaPq9MX5j4xYECsG2r85zmVLZDoJQgp60UUJrKD6HBbXwhdByiWThYqJ3+0Mf6KU/gXE51Bh4rafmY0n5h3mHpy0xLVBXuvmVx9Yz3D1WoCLMdrD6NkRuwPOk5244vpLBHkh/liGTreRrLbGP/ip5yj7G6TG1zbaXRqMXtnUTvn73T6mSyyAa7e/qA4s7ZSk2u0oLQqwa5HzOmrOL2nlSSDH3JJ5/vQnOHXcUgUJvVSbUtdjCj3fBQwAU50pgQ7guBb7m9Da/qge14J5jA0fbgsz9XZr3oDsQsODuKoSZ5CkahbF21FvusGo+A8fjDbQvR+vWr4senQeqEnLWvJ6OVxy7XlgrfUMBH0UXTnM2/wu/Mt00Rkd1ZnChewGt+OB19+pAumkNkGI4EZSDtvYLeu06bNSsB9I6QLqVovcuaPTi1ltimogHm2nLWqYINAIbpyIiwMjMfrG5fUb+RBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB0030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(71200400001)(83380400001)(7696005)(86362001)(508600001)(4326008)(76116006)(66476007)(5660300002)(66556008)(4744005)(66446008)(64756008)(82960400001)(8676002)(66946007)(122000001)(2906002)(38100700002)(8936002)(55016002)(26005)(186003)(316002)(9686003)(54906003)(110136005)(38070700005)(33656002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlF2NEFNMHdpekJRTDRSNlJDVFJ1NEhzY2RTS0NjTW9VOFhrQ2NIZlltalVl?=
 =?utf-8?B?Zm1HcU5PaFNwaytlV0ZiUk9ZRWZhNWdkWjJNSEJwY0FaU3hoMzVTS0FNdGxw?=
 =?utf-8?B?Vm53Z25NN1JJakJWR0FTcFcrWHJ1UjdXWXFoRFpaOXlvS1dnZm12TGRFeEdL?=
 =?utf-8?B?ekpFejV3dHFzTlUrOXM0Z2N6UGxCVlorNStGRHZFZ0NZRVBucmpRNklVUSs5?=
 =?utf-8?B?N3RyTmZtbm1jdlh5UGZHSFd5VjczaFloZ2xLNVhnWldFSjB6Tm4vMmg3bkVB?=
 =?utf-8?B?b3IyNE9ZUXZSa2kvNUVIWWU3V20vN2IybWJnRTBEdWpnOStxU2tIL1FUanhX?=
 =?utf-8?B?c0dabEUxU0ZyUGh1VGZYSzkwM3JSUnZ1dGh0cVg4aStxM0RocDl3UW41T1hM?=
 =?utf-8?B?U2NhdnF6L0FHSDFaSlhOd2JKVnB0NDQzTEhINGVZd2E2djBVdHdybkFNK1Vw?=
 =?utf-8?B?emxwYXpsaXFHSG8wQm93eVZxS2dmKy9tcEJDZFRNUjNDTnowQWZoWkRIdlU1?=
 =?utf-8?B?SktGSmZ1cGtzeElQdE5iQzZQWXgrMzdGYXhIVkx4ZUM5UVBIMXI3YVd3T3J4?=
 =?utf-8?B?MmdxS1RvQndBUzJkcVJKdjAvS1l1eDBsWUR6Zm5SS2lPOFUyaldxMUM3aG9T?=
 =?utf-8?B?dmJ1Z3hpTmUwVFVBNmxaUHIvS1BQTUhpV3Y3OTNiUWRQenVjQUpsdUJGN0NB?=
 =?utf-8?B?eVh4RHZsR2Z2NWtYR1c3eCtSanNCNGZjZmhrdTBWWTFyaFNpdHFlR3Q0RHV5?=
 =?utf-8?B?TFFvSVIvL1BobEhnZmJ4K0gzakpHZFpJeklYWC81ZGhmWk9BNlIvR3Z3TVdh?=
 =?utf-8?B?Zzd4MnB4MFYyN2hYa2RvSEhPckcxS05BSkViNlprKzNiaXNIK0RQb2VDcmFN?=
 =?utf-8?B?QmVOYmIwa3NqcTFOaVhReE9Nbk1GWW5QMWlndXVxQzE0MWEzMDN1WUNyOGxu?=
 =?utf-8?B?dnZJeUo4TmFTd0haSVN5UEx5aU1sZ1dpeWI1MHp3R0U1N1NpVkI5MGFCODBO?=
 =?utf-8?B?c3QzZWFMenk0T0VOd3N0cTdzV3VVZGY2UkZmZnNJZzJreURVeTJTZEZnWGVP?=
 =?utf-8?B?Q2ZiNkVKemRZTnFJTFZMOWxDQ1RsTXRzZ2JFMjNhL1BvdkVsUW1NdHNDSWNE?=
 =?utf-8?B?NTRlQ2dKTCt4UmZjUkZLZTJpNGpjZVhPTVF4OXh4OFVhYVdOemdiVU5KaE9n?=
 =?utf-8?B?VFRvNC85YnpoOEEwR0cweVBSdHFNbXN4Skd6cFFvZ1A2M1Z2L1c0MUd2N1NZ?=
 =?utf-8?B?aE1VZGtHY1lNcFVhOTRTK3l2eFdoZi82WmhDdEtPUWxIZ3dZWDVEalp4RHZC?=
 =?utf-8?B?amtRV0t0Q3lPdnJCRkx1ODFST0laM09UNlYyU0pmSklUYzl5VTJtZ3A4T3A1?=
 =?utf-8?B?b2dNMFBCcXZ5ZUM4ejJCelZYVjE1cUtwK0VadWx4cHZqSmxyWkhPZTRFYzNr?=
 =?utf-8?B?LzFzZEFJUndqRGFvOGllSW1BKzAwUjBHejZ3djg0eWNXZUNnb09HbEx4UFFU?=
 =?utf-8?B?VjhOVDd5L1hjOHU1TVA5YWZJdGFIbDJTeEFrSWw0YnB2UDkzbkxHS1psOTZM?=
 =?utf-8?B?bFNvV01xL0pxb0VqMGdZWlc1UVBYS05YY3Q2MnVEd1V5OCtjUzVKVGZ6U3Nz?=
 =?utf-8?B?UTBqc3h4UDZyeUtHVis0R0tlQzlPQTVLUmZVUE9wbHJsUjYrUG1xd1QzODVk?=
 =?utf-8?B?akt3TDZ4dWNWWm9rNGl6WWFkMlBldCswNlJIWmcvMnEyRFpZczcvOVBjZGc0?=
 =?utf-8?B?SUgyV0FjV3p3SzA3Q08vRklVNDcxYlM3QVlSVHpwdnBEWW4wMEZxdVNaOWEz?=
 =?utf-8?B?amdZTEVOcjlUbHBvaWk0Y2tzT3FXR0pFWVVHanFYYjhGSEFqQVlVRDYvSzRz?=
 =?utf-8?B?K2FGclJnZStGc1BUZlRxeUlyTy8xYlZHRXJQa1NFZFVpdlQxNVhGaHFSNVdS?=
 =?utf-8?B?eWlsWUh3WmF3MHlUOFBFWWk0REZINHpreTJ4OWp2RG9aUTEwOGtmYlpNSmxl?=
 =?utf-8?B?b1JYL1NCRXlYbjMybzFmK1R2T0VyeUdrMWlKNDdwNmtqRjkvTnpXMkZlRXN5?=
 =?utf-8?B?TGxVOGZrVkpZcm1DMUFRTDE3ZGZJYmZQeFlhbHAxbWZsRVdCNzhOdXYydmho?=
 =?utf-8?B?Wk5VWHVQV3dsZU5BUHM3RHd2dzVsWHQ4dk9QMHFSMUpuM3dVUWpIKy96Nk5y?=
 =?utf-8?Q?Zov9DxaRsyWVKl4MtQddz6o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7314ee3-a64b-4797-7c1e-08d99e91b317
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 06:18:05.9981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLaB6mB0MyEdJkvIS0ZDNbon/M0iIaGYziq5OyzzA6Sm7XC1lI3uKVw9ZIYu384h1tt7ZqrLlgSVAuQCfbFc7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Pj4+IE92ZXIgdGhlIGxvbmcgdGVybSwgSSB0aGluayB0aGUgYmFja2VuZCBzaG91bGQgcHJvdmlk
ZSB0aGF0IHRpbWVvdXQNCj4+PiB2YWx1ZSBhbmQgZ3VhcmFudGVlIHRoYXQgaXRzIHByb2Nlc3Np
bmcgdGltZSBzaG91bGQgbm90IGV4Y2VlZCB0aGF0DQo+Pj4gdmFsdWUuDQo+PiBJZiB5b3UgbWVh
biB0aGF0IHRoZSBzcGVjIHNob3VsZCBiZSBjaGFuZ2VkIHRvIGFsbG93IHRoZSB2aXJ0aW8gZHJp
dmVyDQo+PiB0byBiZSBhYmxlIHRvIHByb2dyYW0gYSBjZXJ0YWluIHRpbWVvdXQgZm9yIEkyQyB0
cmFuc2FjdGlvbnMgaW4gdGhlDQo+PiB2aXJ0aW8gZGV2aWNlLCB5ZXMsIHRoYXQgZG9lcyBzb3Vu
ZCByZWFzb25hYmxlLg0KPg0KPg0KPkR1ZSB0byBjaGFuZ2VzIGluIG15IHdvcmssIEkgd2lsbCBw
YXNzIG15IHZpcnRpby1pMmMgbWFpbnRlbmFuY2UgdG8gQ29uZ2h1aS4NCj4NCj5TaGUgbWF5IHdv
cmsgb24gdGhpcyBpbiB0aGUgZnV0dXJlLg0KPg0KDQpJJ2xsIHRyeSB0byB1cGRhdGUgdGhlIHNw
ZWMgZmlyc3QuDQoNCi0gQ29uZ2h1aQ0KDQo=
