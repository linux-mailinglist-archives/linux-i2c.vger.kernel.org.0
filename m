Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29D3464AC9
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Dec 2021 10:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348294AbhLAJm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Dec 2021 04:42:57 -0500
Received: from mga05.intel.com ([192.55.52.43]:16702 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237675AbhLAJm4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Dec 2021 04:42:56 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="322669116"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="322669116"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 01:39:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; 
   d="scan'208";a="654702419"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2021 01:39:35 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 01:39:35 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 01:39:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 1 Dec 2021 01:39:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 1 Dec 2021 01:39:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3YW6FbHGRfAHiXaABZ/8yHKkbEQzGVzQD+u2RLj+S32SC2ZU5HGVdijkcxXlA+fnIlzNJqyAG45E2pmn6CpRoxrrr5HCamdEvnUjoc2KdoJsjHqpoZiNmKaVfYEGHCszZGfekGAYIA1EO7Mizr64I8wvdu7tA7jmISDcneiKABB9E2zA6E8gO6SZkiYTFDKCvjj5XS/LDRVc8C3cZfVDo8EYkFyLFdObf/2FV1l+X3D0YWBZabGF6tfqx78RCpoj6KnPjhk4T173EztEU9wGXNvnTxGDu7tt3rzbtxk2zTit/e54j/wE2gONAqu9dYWn81Tzkld86y1KeZSLlE5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNxTHwgyuOwELwW62YroofJttTTv+vaaF4zedxmb5aY=;
 b=VLgAjdTQnQBfcP2jatGVqBpOjPQHYhfLJjeGptbjRS0vVZ4qQm8yUTzCI3tT4wLMWI4MUnGB2OrNjMP5dYsvlGIswwB9V2rY6hNxsJorl6SzEKiuhogXO9HOymPtOhWijI4lp6nuAUfWiSpYt2nOfc7Z1UlIGtenOyRr0OhPRJaak7fH2ybF96La24oOt/UExAvwXoaTkemO3JEwJay8ipTI/3ZCBtK/Ezsn4PVxs1ZJAquG3Bi/zbMl/rLxn1OzF99163J4czfaN9VoNmfJBOrpkN/+DJR9eICWRCeaQFpiO35xyMj0GgBR1cMeJ8gxh3wCVC1wjy860M1DEWLnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNxTHwgyuOwELwW62YroofJttTTv+vaaF4zedxmb5aY=;
 b=miwRx0uP4U9F7VkWm60Y1vzz/lKcwFjoTBZVqy0TAtKmoJnALG9AhjM5oO3WHvzIIxxwzFRRPfS0lAroHkhhPnrYWLPOJCCuscTwhjIQzwXlbA5v8Y6LHOccj+BsNMdD7j+7aLSPVE6ZZKoFpP5T7NZOEAuU6Fc472ZGS9yOe4A=
Received: from DM6PR11MB3660.namprd11.prod.outlook.com (2603:10b6:5:13c::17)
 by DM5PR11MB1849.namprd11.prod.outlook.com (2603:10b6:3:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Wed, 1 Dec
 2021 09:39:31 +0000
Received: from DM6PR11MB3660.namprd11.prod.outlook.com
 ([fe80::b987:803c:b0b4:fd9e]) by DM6PR11MB3660.namprd11.prod.outlook.com
 ([fe80::b987:803c:b0b4:fd9e%6]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:39:31 +0000
From:   "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Senthil, Bala" <bala.senthil@intel.com>,
        "N, Pandith" <pandith.n@intel.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Subject: RE: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
 Plus and High Speed Mode
Thread-Topic: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
 Plus and High Speed Mode
Thread-Index: AQHX1VWadmPN2CWbpkS9Sg6fkPAU8awa2Y+AgAD5/wCAAW+RsIAAHbMAgAARsgCAABCqsA==
Date:   Wed, 1 Dec 2021 09:39:31 +0000
Message-ID: <DM6PR11MB366003BA82D2A65F60D3AF4BC4689@DM6PR11MB3660.namprd11.prod.outlook.com>
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <YaUGV3lEmW9qtP+3@kunai>
 <042d2c9f-4333-44b1-09c0-b0953a51c176@linux.intel.com>
 <DM6PR11MB36609A77B3F5D7730FA16A52C4689@DM6PR11MB3660.namprd11.prod.outlook.com>
 <4a420cc0-d18a-32db-ed58-f611336c99ec@linux.intel.com>
 <Yac0JgqrEdUJcfsf@ninjato>
In-Reply-To: <Yac0JgqrEdUJcfsf@ninjato>
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
x-ms-office365-filtering-correlation-id: 336b3f5b-4115-45c1-85fd-08d9b4ae79f8
x-ms-traffictypediagnostic: DM5PR11MB1849:
x-microsoft-antispam-prvs: <DM5PR11MB1849C3FCF37C4C73A203B308C4689@DM5PR11MB1849.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uUO7kP999ZUN3V2LFXkkMYwJLjE0MFXsul0iAEtWEgFIOAYavw5R8BdH3NH9m2aXJQofdu0o0c7JOJVttMcr0oYlPYjd098svhXL6MyjKFtJ625CIgkpbWAwNnHFUt5/giuH+hvODHE0tdXR4lRtUXeXR9/OPAAvJ3SaHo/2GEzAf7DWmiwtOIDlgS6JVr1MPCzuZGJk0z0C8IO6HIVb6VrXnQNO1bydZ0OtpU2SKQm4bQOBRlK/Z2QSVMFGIkH5lKKOgk7WZq2ROyMc3xMfrtGsqKnuCQc/eTo1fpoVMVnOEhi/U899QtrQQBTlvmEeAQf4B5Wy4TlLvBEWsmEyYNjapHvcQQO7+LynBnzi92toA30UdMy+6xoZ5Mchiz/FLDHLyIdr+xZdvP/T3NfxEJwaNijVh00yF+wXSZPGLwq5jGuhzyJ7DqsRf/WgwkXH7fL4yjWqAPEA5wvWyx4F4d7PyyP7+ZYumYjDXqw846gHRiHiHTU8EEsMmxxILuKpE+h5QsDCgjXzlqLpkElIzpj5yQJVqyuMnTc8WVuT0rjbc7+KRCCkSjM0fC/ABGIp3ua+T3PONvyFHg6vE3GOiVDE2qjL9SsjYGZrwAkjYL4qVlzYTPwmcrkNeTvdZoCSWUEesi31U8d3I9TftqJHIdEMZ2z4sC5nRxKhciu9wqJY8FRTtTt/Ifd2xeqrernOpHvEnw7tMJGm/Fyl5uZNKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(38070700005)(9686003)(66946007)(122000001)(110136005)(82960400001)(4326008)(8936002)(8676002)(54906003)(33656002)(86362001)(55016003)(26005)(38100700002)(83380400001)(66446008)(64756008)(7696005)(508600001)(76116006)(186003)(316002)(66476007)(6506007)(4744005)(5660300002)(66556008)(71200400001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?grmx+julM3egW8WXeS45AB7yaacQHWCAq/JDrvkWfHR4u/ZhxcarCPkdG2FU?=
 =?us-ascii?Q?mX0xORh/BYganjH/On63Q2wydpYyl8RsAG6om4ZEMafn0ydX2b05AUOV7Dee?=
 =?us-ascii?Q?kY0eyWX631XMw7M9SiGeZDSlDOk4GPtXVPZuLZvP5EuZ3uxFUaIebiBkgBaS?=
 =?us-ascii?Q?UY3mFTYKwJ7F1cgN783oIYMUtodXhnKOM8eOK+sj+ByShQrnGxvRpTvYDNIY?=
 =?us-ascii?Q?j2CxH7J3RCLsVONP1t4rYK23EMto/NwjROsxe6oyek21AczVVcKl057PK9Bn?=
 =?us-ascii?Q?g4dO2dRLEsNetKOB84HOtmd55WPWRibB/DrIeVfoZf5lvpJZv6tIO7/1DV+Y?=
 =?us-ascii?Q?4Smz5eEZqSZUUH5KdPrZvMEMZIutfo4f1am4FtWf1Lcs9vNP9iKV+EuJLXFN?=
 =?us-ascii?Q?bDw5DrM7qa6Cimx4LVg5sjxhmwDsCJh/GP5/Munhm4N64tSdNJ3U4egeJvtN?=
 =?us-ascii?Q?d46z/Vlh541lkTuUHqX+Tma/i9/pZgFIXnwlOd5xI//W1c7r7H5dXBqxm7QZ?=
 =?us-ascii?Q?ZpL9HZfasKlZ2mkGhI6cMdMdiAiSGH9tPJ6lEuVYqP2/zTPW/f/PGDNh22Zr?=
 =?us-ascii?Q?UmMFUPeG+pyBaKlFnjuq+TgVx3kaD1N0nkcf9FibHcaQHK+/5WuYbsQ9VSph?=
 =?us-ascii?Q?hOTejPSTXO4unQXUfJODp69tmuN/IdBP+56JFCwAEhFbZAlntJgwnT0h+OXa?=
 =?us-ascii?Q?/1xez/yE/oDu5GvOIbGEZL/dIvulEamXLrhcX2+q9bN4KU9UrjY2d3scqbZU?=
 =?us-ascii?Q?zu6ZJN1wV64C3jiaj52zgvHWQdb4Me1Y0PdpOeHdgDBWNLq1l9+tY3Hzbw1D?=
 =?us-ascii?Q?xl2TGLd6UpqiDiO0IZ7VScRSMo0uxr/mnrrTrOQ72mSN2g1X0Vf4ppIfl0Xb?=
 =?us-ascii?Q?+wwPPPkLPk+Bsnd9foCAXkDPcSYwMUg/fZMRagyHIZzdyq/4qZcVUA1lGYUk?=
 =?us-ascii?Q?1zfkY5O/g9dyF4YNZJOdu+XtQIdscEUKz6LFpIHF6fx9POhzWRfRrVKF5flu?=
 =?us-ascii?Q?cJVj+qcZNQA+kv7iMqgSnKxoU2B0BWNKv14gen2O46Y7F2iAcVqtrgF85ukH?=
 =?us-ascii?Q?QDfXMrmH7gv2nFaAnFEfGs6CGXa4JeWb8V1KDweYQb1prvEJDHHeKTag2v7r?=
 =?us-ascii?Q?69FaT3vXg8LJ1T9HU1cuoJpkw3/AiGfCPyliS/jPwRiCy2A2GgvdxTOff1/L?=
 =?us-ascii?Q?GiXiBu/Q9oMJsv1M9B09+5E9tYu0+CtrAOGx6Blc6JTIzOMzfhKUbmmoBA+1?=
 =?us-ascii?Q?wJkAu0GVwtPbe4XIMBkFpbeQRdKLAh4losTa3wsT+i1Q1Q53uk8N8w0mDCuQ?=
 =?us-ascii?Q?uByHTmwPu5azUgfPb9uD+smY0/j8k8q+WF3zce4O4o8BDaWbj6Lq4hPTIg1k?=
 =?us-ascii?Q?lHaiN7ptY8MS29KGNrQV/2qXqCX4TP4KiVoVaKSjkokbr3gi6/xvodqOG5q2?=
 =?us-ascii?Q?q/ThXOQvHdoaE0UOZhAGj6P7+Rhly1GY2uc0dqNb4X4yLFe5udQ2vRLv4eeL?=
 =?us-ascii?Q?ZBMUFmgGHvok1dcOJXGxLiDz9igOP/hP4yAvKOjlXnlwWMpsDx33TouP1ber?=
 =?us-ascii?Q?J7GYhOzUvzVC6qsMbkNH8d2shFjIA6oPMH9J6QWOnpk7wxFMBpneMIWIGZIf?=
 =?us-ascii?Q?mgx1fYiEYskBoc0umJW9Hel25jFNdIVMXRubZUR5fCQBPSTGPfINJqGSPLVy?=
 =?us-ascii?Q?Q6pqrQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336b3f5b-4115-45c1-85fd-08d9b4ae79f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 09:39:31.2545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EQbCxtph2uZpJrMqmoXhwn7GAvnFAJ6XPBYA06HQ7+kphNh2zfNBkfqzjTcOCec+Au8zXxsVAkk4L9p3EbzFS7ikQnK9ifQo8ctSLozpCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1849
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



>-----Original Message-----
>From: Wolfram Sang <wsa@kernel.org>
>Sent: Wednesday, December 1, 2021 2:07 PM
>To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>Cc: D, Lakshmi Sowjanya <lakshmi.sowjanya.d@intel.com>; linux-
>i2c@vger.kernel.org; linux-kernel@vger.kernel.org; Senthil, Bala
><bala.senthil@intel.com>; N, Pandith <pandith.n@intel.com>; Andy
>Shevchenko <andriy.shevchenko@linux.intel.com>; Saha, Tamal
><tamal.saha@intel.com>
>Subject: Re: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
>Plus and High Speed Mode
>
>
>> See the comments from Andy. Recent enough Elkhart Lake BIOS and his
>> patches from last year already provide the timing parameters. Feeling
>> embarrassed I forgot them :-(
>
>But the u16 conversion of the existing parameters is still useful?

Jarkko: I've seen the changes by Andy. These patches are no more required a=
s suggested. I'm following up on the same, regarding ACPI table entries.

I have the same query...is the u16 conversion of existing parameters still =
useful?

Regards
Lakshmi Sowjanya D





