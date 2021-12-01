Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C574646E9
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Dec 2021 06:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346833AbhLAFzb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Dec 2021 00:55:31 -0500
Received: from mga06.intel.com ([134.134.136.31]:37773 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346834AbhLAFzV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Dec 2021 00:55:21 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="297193185"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="297193185"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 21:52:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="500102604"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga007.jf.intel.com with ESMTP; 30 Nov 2021 21:52:00 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 21:52:00 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 21:51:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 30 Nov 2021 21:51:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 30 Nov 2021 21:51:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyF7EDL1tAF2IIsE4JpoU370K2mEbKFFsKJPZCT9C7A26np+2KAKZqQIMecJs2xeqioLH/PA1F2iQxRhXSZS1fa7pD7Rk0BtRrk9+gKX92aLz+wBdtB6Tj6C8eF3HL9sNaskqB2uf9aZ9jG+OUZ4hyM9BVtq7bva/OViOtPLtL9u+6Ischz+B4DMM5k+a8pJ9CyK6qIC5UiiabCl5uTtPm5xgObfHsIPI8B4OgKcTnKyP7CpDhBmFxnpt4OdxjEcfwNRZCUwp5OSYJZDrucdOkEmPyszBr868fwSv51toXvRzBLHv4/gqeeRGzJ0jIAlWb0Q/xTk0UONqR++pB6t2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLTOnCosdIrY8v+Ck9Eg2vFErZ+ssY9D+BqJWjJkF+Y=;
 b=KbsbaI8Z4XRR75k5kUbPMZIRq2dPNXvRDba/7kibEatPa9DetlppEzjlitldnh+nVI4KnXTQxJcggBXo+8ELYE+NZNsSMpZ4u0eS2mQMEsUYXA5NDD9WzbxczA6l4vbWKofJh9mwGqF/XnYk2ku5e3cALvbDKd0tLCV+qSsau5xlUvewpbda3abmii0s7vuUMYxjZtgFzGSexLREFk0LOFRZfW3fH3pa1OjGwrPzsvCFjanIMdqa3SXyFvQg5YP0QKO0poBXzLLY94PVKpOKdrRCgN7XL+05dJipqILpQVmzJdY6zFoDeQ3hu4kE9inMkn0dLaR51dWcg0TAigHzkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLTOnCosdIrY8v+Ck9Eg2vFErZ+ssY9D+BqJWjJkF+Y=;
 b=eT3m9hU4ChwsdKXd2jWfWsjaSESA05cglRXr2Ab9MTMqu26BbggH4t3kh3askixw3uDQBJwih6Zf0IpoKKoEdfmCh5I/pegBv9jZQ3utaNVYhKMfmufcZnbSTdd3QEATIIAmBhDO4gTcCCGs0lM2ez0GyFMtpDkrJBEx2lET0ag=
Received: from DM6PR11MB3660.namprd11.prod.outlook.com (2603:10b6:5:13c::17)
 by DM6PR11MB3244.namprd11.prod.outlook.com (2603:10b6:5:8::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.27; Wed, 1 Dec 2021 05:51:58 +0000
Received: from DM6PR11MB3660.namprd11.prod.outlook.com
 ([fe80::b987:803c:b0b4:fd9e]) by DM6PR11MB3660.namprd11.prod.outlook.com
 ([fe80::b987:803c:b0b4:fd9e%6]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 05:51:58 +0000
From:   "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Senthil, Bala" <bala.senthil@intel.com>,
        "N, Pandith" <pandith.n@intel.com>
CC:     "Saha, Tamal" <tamal.saha@intel.com>
Subject: RE: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
 Plus and High Speed Mode
Thread-Topic: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
 Plus and High Speed Mode
Thread-Index: AQHX1VWadmPN2CWbpkS9Sg6fkPAU8awa2Y+AgAD5/wCAAW+RsA==
Date:   Wed, 1 Dec 2021 05:51:58 +0000
Message-ID: <DM6PR11MB36609A77B3F5D7730FA16A52C4689@DM6PR11MB3660.namprd11.prod.outlook.com>
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <YaUGV3lEmW9qtP+3@kunai>
 <042d2c9f-4333-44b1-09c0-b0953a51c176@linux.intel.com>
In-Reply-To: <042d2c9f-4333-44b1-09c0-b0953a51c176@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c5c119a-d270-454b-665d-08d9b48eb07c
x-ms-traffictypediagnostic: DM6PR11MB3244:
x-microsoft-antispam-prvs: <DM6PR11MB32440D41A764038693B18749C4689@DM6PR11MB3244.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ywf7HMfHunf7tTmZyBaPhPVYj2HC8m7fNaS/TiCfkZQOn5ZJQyTf/cQmNfQTDaIJ0HBaia7/+bedQMeaUTSZTH8UdnXkN0O6CJA2xoLjMvwOk1/29EKU2rNIE/dgAHLNEdDkMYtgAPFQb/yew+QxfVaysQ/3ySKpf/c0JL1xtKJ6uTOozjONPS2v2S4D8Bl1/PSlhRhoiuCC1/tRrse4u+lcGqliF4mHjx/q1OB9S8+GNXmzzd2xiHmJUkKRH3aXPtcCBQZXlrZGvmxpAc0+mjbQYeZljbrsu1B2PAIQD3dKUGQODPR79+esPdYZ7RsybvxQ56qxI22HbmpcC+TtDobE7qPasQpi5fPIP2/VYcgNw5XotOZYJ4fbgesdN5T/2ZWpZGxxIFGNvXBot9iIn/ACsboOLiyb3KyBOdPOVjtugnYqawwc8E2GaVq3Ff+/QOTuJun8aYx/K4iwyX594T0MQdbcmmS7+TvM7CvPbFfS7qc6PUWNN21FxcG3/dtn8igoprPuOtuetkWjylyE1d2lXV1dMoV5Qtc7V2mqlA/K8KW1auIJY3yssBWQKyNgcK+VGHz424ovDSqYAZ67D80eK6dZgz8e2pWYmNl/t+TnS87VhpL4t+qfJNyGjlGhXmt7U6+mZOdL56yxZmzvmqyHsusn/fTpiwNZZG9xqZYapR9FQYReWr4skVI1EK0NAD/nH+5jOVwL+JkUAPutzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(82960400001)(5660300002)(8676002)(64756008)(83380400001)(508600001)(186003)(122000001)(8936002)(55016003)(316002)(76116006)(6506007)(66946007)(7696005)(9686003)(33656002)(26005)(71200400001)(66476007)(66446008)(4326008)(38070700005)(52536014)(6636002)(66556008)(38100700002)(86362001)(110136005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QJu+RrzgogxL7nQ6MHJBehzbHZ+8OkRxYiNg/VzQx7vHAGz7eCwxXM9iujfH?=
 =?us-ascii?Q?KoAVRPbb0RgiM9rLHa/qpWhVTlxt3pfI/P+KAzEI0dPk1ez1xxFmO5PqtdB/?=
 =?us-ascii?Q?J/ct7CFR/sO63pLNQLNVvcZDPsbVtN33fl7il2WVNIwZTIs6BH6POqy6U+CR?=
 =?us-ascii?Q?Y47tbHlSnj6ZlTwq5X2XnMBg+fKJMtxn9O1R2FFYRqika5Z7mtKArxOdCpY5?=
 =?us-ascii?Q?Qnpa7GgKA9gMBVWopuRXyOCgDp+KKHqOAqD2CekqXmUIIrj2CGr8GDfiEVY+?=
 =?us-ascii?Q?mrnALHcLX5Ef1Q5W60WM1BHyfjhDC6SSJKf6aCf7TPZnZVxfM5lcwiC8VZHl?=
 =?us-ascii?Q?xQ60TFwqQkmwxXGHMFnFMh/mv87lgcHrOneTDsSYDGLlcpI4nM/VXSVVy7+x?=
 =?us-ascii?Q?+sh/20AZqw8lufE1EihSCgFgxOXfXsQ9FNLwomkV7m0imbEImWyu2mfD82J2?=
 =?us-ascii?Q?UmxAEp9fvhqZA7C1bQZ+mSJlB6/7GRRn8GeuKBsdrqiVUXWhNCeLZRruwe+Y?=
 =?us-ascii?Q?9tcYwackBRcLhIMmTp9R/s7veDzPL64Vcedmu3G0HZ2jejO3oOsB/LRUWego?=
 =?us-ascii?Q?QDOB8zlUDF4Kcx/eh7GPObWjcXFOCuFUxcY3wHC+dy0U9pR25RtGOvMbR13D?=
 =?us-ascii?Q?b0h+8Chta8/BJiFiLQyfW83HGup96dH9blIsQRmVJPBSRizGVxd3cny2s0q/?=
 =?us-ascii?Q?RvsV9moH22OBQDZoj1g/nykEVjP7FXu8uV5t3Mm9XaT4cJRJnpdMQ3PWnWlp?=
 =?us-ascii?Q?C42z+QzRXf2FQzlzle5TYH8D+phb/bM44mUvbOrvOL3A/kB+ErcoP2TLu4S2?=
 =?us-ascii?Q?wwrteRHksVuCUIEY5u3Etx3PFHrOIJqS+IBJWEFFQZvhKWe6VpCL6kpTkK8/?=
 =?us-ascii?Q?kHJjiUEexnzqkRvXI05SWk5Qoo7xUJXPvGveFxJ2lDjuaXgKuWn4J4R7L6OO?=
 =?us-ascii?Q?Q3DHARoCua1UQ5gZRsyz62+O5zoinwzl56xX1TmKgMjWAyw10YNwHx/K5Qo8?=
 =?us-ascii?Q?OM+6XUZWozpfC0PrEpIKge96mui6btT7tDh03T2RY2gxzwP5ZsqaAie6weLo?=
 =?us-ascii?Q?cO+/+iEiLx1cUtAFf063bGphGy7743pIo/bJHLUfCr1VBN3+y93dTUrSQRiF?=
 =?us-ascii?Q?7XgSLTeeGPisyL1SuysyHWa74/sK/lGP41KsqX/0kmxiX+iUlJ9jnmFQ9Tiw?=
 =?us-ascii?Q?RPAvQpW+1pzZ1FERQn1lEke5T6uKNjijV4d5OE9aFaoa+nxmEiWmn6wkBb4a?=
 =?us-ascii?Q?wnlEWFAEf4t8iaT9lTUdGBq3TI9WkVMpFC+XnHkPRY3xA0mYEaqOPrPRqyd2?=
 =?us-ascii?Q?2BqmAmxan55NhxmokU18IdQz6AtqKPPEeYlXJdTRK/qkjzEDMohlwOYqklSp?=
 =?us-ascii?Q?Oee5anb/qEltXObVjrAqc/Ltk9QdQz8yxkhOIPeToFoFElJmWHm4rN+HMwee?=
 =?us-ascii?Q?A6wGveYiUtP7/2oEsPqfsijTPCkVDuzqowktM0zmpUUO/xxaL+VWupNf1zkD?=
 =?us-ascii?Q?MlCsMSSQD1yBb24Q78wQ7afHS5gOf/lJJlw7vZHUGTwypo7QIZdS9hQi5TKq?=
 =?us-ascii?Q?Np8LSHQl8UTjC7K4ATmSa7ywFuQwd9u61m18QruUOtGV2hRmH0JuCR80brOR?=
 =?us-ascii?Q?0ryytLafDVLaZ6ugbwoh9EubpEOFL9GOJt6t2FM+p6YtiSuuuIhdHUtrSqHx?=
 =?us-ascii?Q?B4Cs6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5c119a-d270-454b-665d-08d9b48eb07c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 05:51:58.8134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LdPhbtPDxiv42utl3Kk1y18dgCEPIOF8ZPp9FhBvh8YDi3Y6kEEpFFEVS5KNOry2pC9zNW+FhOIJ6iv6hug/3LGTajrRd2uaMjep9CH5SVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3244
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



>-----Original Message-----
>From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>Sent: Tuesday, November 30, 2021 1:22 PM
>To: Wolfram Sang <wsa@kernel.org>; D, Lakshmi Sowjanya
><lakshmi.sowjanya.d@intel.com>; linux-i2c@vger.kernel.org; linux-
>kernel@vger.kernel.org; Senthil, Bala <bala.senthil@intel.com>; N, Pandith
><pandith.n@intel.com>
>Subject: Re: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
>Plus and High Speed Mode
>
>On 11/29/21 6:56 PM, Wolfram Sang wrote:
>> On Tue, Nov 09, 2021 at 04:05:51PM +0530, lakshmi.sowjanya.d@intel.com
>wrote:
>>> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>>>
>>> Add support to configure HCNT, LCNT values for Fast Mode Plus and
>>> High Speed Mode.
>>>
>>> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>>
>> Applied to for-next, thanks!
>>
>>> +	u32 fp_lcnt;
>>> +	u32 hs_lcnt;
>>>   	u32 sda_hold;
>>
>> Short question unrelated to this patch. Why are all these u32...
>>
>>>   		dev->ss_hcnt =3D cfg->ss_hcnt;
>>>   		dev->fs_hcnt =3D cfg->fs_hcnt;
>>
>> ... and the ones in dev are u16? Wouldn't it be easier if they all had
>> the same type?
>>
>True, only sda_hold(_time) is u32 and other timing parameters are u16.
>
>Lakshmi: Would you like to send a patch fixing this and get more contribut=
ions
>to the driver :-)

Thanks Wolfram and Jarkko,

Sure. I will send a patch fixing it.

Thanks,
Lakshmi
>
>Originally this discrepancy was introduced 2014 by the commit 8efd1e9ee3bd
>("i2c: designware-pci: set ideal HCNT, LCNT and SDA hold time value").
>
>Jarkko
