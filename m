Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020A1443CFB
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 07:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbhKCGSk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 02:18:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:45667 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230152AbhKCGSk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Nov 2021 02:18:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="230159351"
X-IronPort-AV: E=Sophos;i="5.87,204,1631602800"; 
   d="scan'208";a="230159351"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 23:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,204,1631602800"; 
   d="scan'208";a="449672661"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2021 23:16:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Nov 2021 23:16:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 2 Nov 2021 23:16:02 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 2 Nov 2021 23:16:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fu0dxON59jNVYTUzPuz8dYvlZS5WJykb1831aGsClU07Sw/rUr8fUINAlbdmtrUkuttSWpLPQ0/UM9znT9cdsEppxB5+iHE7aoHgPRurTMY4Tjr85pLPiMaG/Lylh6JUlUZ1LsDjiPxCIpR0RhKd86LhW7Bb6SMuNaV6QkmF6Bvc3NudSx1r72e0Kpx62kwzs9Hv9lfg0nqXY/fdK/aGlqIpc5ZjgmZN2kVyQhMSXxSi0fKiJXbuzuWEbQFQeREPxhH9EmZeYRSGjCjegLUOjUvNib/I7rZ+B+1g0fxe+3UyYsil7Z39TP8kkeONsjrjOUgJh76WFCaCELpuRnG+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqFzAUO0LykLkiw8MF4dto4XtlLIkOpVxRRnz1vqaYA=;
 b=YDgvDYqBcZrXDmno1i+yr8ofhE3WdV1z0REyZDTzlKaWN2JrPRwMoqVhkYhvRkNl8e3chDXZtA3srKaSUvCAmaBnzxWbvIJqbApcbJLEonG/pTFCugts+nUVepC9ZU41bwrMCO25FwL0kOnjOtcbNx/O6xID1+fuSrcAo3ZHtlpKu+YYjxd9UJn5LDBkkzz+3v5WMEmWEpdv5JKDnWbj1mcb7sAFtiEZ2pqbEpRyFM/gxnHOTkNKa8kcOVBbL8yONW5B5MaDIMATaJvp4nig7bVo+QeOpyjzgYiubyK8cDa05vuRgURU1kAWiY9QVbTt5QdA92ULqH1Obtp1aV31CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqFzAUO0LykLkiw8MF4dto4XtlLIkOpVxRRnz1vqaYA=;
 b=QJzKf+rzf6H7d8v4xaz77+S9/LHKTwEEf1WiwATjhoCHSSegbZSt2mFydj5MCyOYt9OlPnD5eukENIwC/QtpjdNDIwQ0umCxiksPbHn1tX0GSmcV60DQAHGnTJ+5imfmfhYhF923QJH25G+2PNHCsV+j+hl8aFfnt1xoV2Z+xTA=
Received: from MWHPR11MB0030.namprd11.prod.outlook.com (2603:10b6:301:65::23)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 06:15:57 +0000
Received: from MWHPR11MB0030.namprd11.prod.outlook.com
 ([fe80::1daa:d1d1:1ddb:1a7d]) by MWHPR11MB0030.namprd11.prod.outlook.com
 ([fe80::1daa:d1d1:1ddb:1a7d%6]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 06:15:57 +0000
From:   "Chen, Conghui" <conghui.chen@intel.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        "Deng, Jie" <jie.deng@intel.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
        "jiedeng@alumni.sjtu.edu.cn" <jiedeng@alumni.sjtu.edu.cn>,
        "vincent.whitchurch@axis.com" <vincent.whitchurch@axis.com>
Subject: RE: [PATCH] i2c: virtio: update the maintainer to Conghui
Thread-Topic: [PATCH] i2c: virtio: update the maintainer to Conghui
Thread-Index: AQHXzuEupiLtWmd/V06uMv54cwHjIKvuUZYAgALLPEA=
Date:   Wed, 3 Nov 2021 06:15:57 +0000
Message-ID: <MWHPR11MB0030EA63DDB200974685ADD0908C9@MWHPR11MB0030.namprd11.prod.outlook.com>
References: <00fadb64713aebd752dca3156e37c8f01c5ac184.1635736816.git.jie.deng@intel.com>
 <20211101040814-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211101040814-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2d10a41-27b0-4c9b-8c4e-08d99e916691
x-ms-traffictypediagnostic: MW3PR11MB4572:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MW3PR11MB457249FE366A52130CEB703E908C9@MW3PR11MB4572.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nJFUnJp8qn4zw3q9SEsPN7k125ZWdZzG9qg09OJg/Q3koaHwR9KsNB/F3NOvbEWWdQTMMDi+wYlUgQcibTfeHTHZUaLLWVGT2h1zdqyr/FxvQ8e1go+4aXca/Fn5CVnCzOqPS1sjGaAMGirtfehv9NYoabjMBUbtw61JamvT6OhLEjtUoEewg63MHS159FndgIk7CevVoud8j896puGJhEpwzLM2YE8cjlyWplJtDwMzI9tZG1bQdkXU2QabnE0oBjFzl28VZFdSHd8hLDtBUdYgBpt9jpvMqyX8wUWe4xndYo0SFme+33mM8tPgzrvA3S0ce25kHzwrCdtH5e22PlKeqDxQVIX5Fqu8lbppbJi3SokQTKT61gIorWP7u8vMm8cmBYujnRg3y+gzTvXNG6D+lHx/EAn21aZeGnCke0Vu1f/mCMM6u6sQeewQY0M6udWBQy41UYSfGVZEdWRqCfA2TiYbIANdSaR9C1MDuCfBQGL+ZwsDuBK6PIpxSKeSY+S2SSOVxA0TXMKJHd/9qhv44/Hv9l7a16cyu2p1D3QyFEBK53vj3lht0wZSdn6l2u8nehA1zrEZYObDzYwSEQyUwWo2VaudqEsUKsf+eARjWqLVOPorAxBY2wvSchZhQJ0Rt3umlT+8ursRkrCsqVLAE4M1U139jQE+lY6Buopg5aDF/B3LqbqGi7RGsy44LdBfjZxTNV+RzvbNcRN34A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB0030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(38100700002)(8936002)(6636002)(26005)(55016002)(316002)(52536014)(33656002)(54906003)(110136005)(9686003)(38070700005)(86362001)(508600001)(4326008)(83380400001)(6506007)(71200400001)(7696005)(66946007)(2906002)(122000001)(66476007)(5660300002)(66556008)(76116006)(4744005)(66446008)(82960400001)(8676002)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UKJEaFpPfNefgUQx/m3mVLligh3m1FIqe7RFFt0ucMscHQX/KFLDEv2ig8eN?=
 =?us-ascii?Q?/HtO905Vtc+hSpArXghFALnFh4LXc7KGN+fByQ1oo1S2XdievtnAorPDHbwJ?=
 =?us-ascii?Q?UsrM12gLAdA2CIrqm6qgYkxwoluj/yTNUCeBmbuKP5c4qmX0rRWzEF1OOD7L?=
 =?us-ascii?Q?81vjAnJvOjtgmRuVpQvzGcLjin0kFmeuJDLaEgFB/4Vpz4IIorjIpOemTuTP?=
 =?us-ascii?Q?eOYHkQaVCPZTAb70kUTXO2TohMfXm0uVy75Y/1GcuzEiHgz7myomgb1gMI1E?=
 =?us-ascii?Q?S8G92xIhDUu2BHll5gElL7kljHq6PFzxY5s5till1aUgqaL70dmEdNKmhYmo?=
 =?us-ascii?Q?enrs+cmLy3koSeydECu/AzzIe6UwcsuANsMVgsgM70SwZUIzFBFKcLZst0Wc?=
 =?us-ascii?Q?jJ9CPwGGP0QuolvDZIhYw2zga1FwcrYBq7S4b8oqj8io4mmR0hidxD6zt2Ws?=
 =?us-ascii?Q?GIowdr33+IgonuSVIXrDok+Z3I6FXxfIOYTaRS5j/CtKDI4llYVl186hWYcf?=
 =?us-ascii?Q?z56WzIDfd7PRCLkuWMOpwFTVkxHcJEMUd58uVL6+mTHcBizvY5MVMr9/qTEg?=
 =?us-ascii?Q?Z4OpvGY4HCEPcq5zxl0ic2kVCrZUrNwVDCOQ8iJuhAZwCEZ4DINU1a+7l17e?=
 =?us-ascii?Q?X6cDiu+vzqYAY00D94kmfdHtXQGtXecGUeg1Lt5DIS1kQtyRoPO0ItXxyCwk?=
 =?us-ascii?Q?/oFc5SlyLXykaCHAw3mDvOGqx41hJAr4WdrjAVJy7Pzvykmf4+vKItQAU2zz?=
 =?us-ascii?Q?JzeIbA16dtkG2I5tJzE7NUU2cpMiyEFcTyo98RD0KPFr89gyy8pHAN3Sy6Be?=
 =?us-ascii?Q?ASLyLQLxZNUrUvdrY6YkgOZ9UJuJyDbXDGKArz0fHqTPYa1ZtOEpFjeD5mdm?=
 =?us-ascii?Q?r1eYhODjlXWY2TXwtOgARtVJBOExfoUf2ZSj0QzYPPb4K3Oh1dwtLuoWUVIH?=
 =?us-ascii?Q?2etZHWX1zGfdom825q2DsGcaPJtdWZemHCCHkdcn1l9zzOOOKBXAkbtmQHGh?=
 =?us-ascii?Q?KIHLwD+UeeDaN/rZfkel+6QK4BRxlLAXH4XTk9YpzjF1bTxD2L1FCBJfzRx6?=
 =?us-ascii?Q?XhGf3dP90S59jaQE++ow/KDzJoomEi6+TH8DjGtPrQM0qteHMbPJw7uwliXD?=
 =?us-ascii?Q?Gb1fWDh6k1BMYG8KhvnYCGsJ+4HwZ53NvKz8pGmfpvSaouyg1ql+CzD52Qjm?=
 =?us-ascii?Q?bEgDVosbJJEsnuh0Sj/RH9ZiPu6sJjYci7UZPG+aL/LRIytsLDkzkUZ7xs9+?=
 =?us-ascii?Q?DCrv4LsXkXVSFYnZwJovqj02vsxolo5Ir4SM3asx9V+gLhebgajKtSy7w4bq?=
 =?us-ascii?Q?L848dhhAtbWBIUVGnxFJ6JgKk3lLx1q3alOMueOTLeAX35bwMAlHMJpUhnK6?=
 =?us-ascii?Q?a9BSScGjQCJ25ZC5TE6ueWen4MTeO6EK7MAlUnhDfYOL2Vt4GOIQUmbRWP4K?=
 =?us-ascii?Q?tEFHUuoDH49/DaD1TQ04WUP+ln/9AV9p8KTknRMKk+aqr68K7mZe7scr+Sxy?=
 =?us-ascii?Q?B2RgNM4UIUc9EYbOZK7cFo+cqrEbcLvtS6NEGn7so8vcsYhRxw2hz1u4v9cu?=
 =?us-ascii?Q?5HEyQcRES5O5XgjN3N7OTo8XbTYT8Q6uHfIRXpwLGkcsM0uajuI2kQYbC41p?=
 =?us-ascii?Q?OQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d10a41-27b0-4c9b-8c4e-08d99e916691
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 06:15:57.6933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qh+xouYFkurmBgORFmKKARd3X3Z3x5cLVLu3CVGRQyrMf7I9bNS5O1YVdgosEi3UblW0T7GFUC9Cd7hEJ3Tcbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for Jie's introduction, I'm very happy to have such chance to take t=
he responsibility.

>On Mon, Nov 01, 2021 at 01:24:50PM +0800, Jie Deng wrote:
>> Due to changes in my work, I'm passing the virtio-i2c driver
>> maintenance to Conghui.
>>
>> Signed-off-by: Jie Deng <jie.deng@intel.com>
>
>Seeing as Conghui co-developed the driver, seems reasonable.
>
>Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
>> ---
>>  MAINTAINERS | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3b79fd4..8c9a677 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19944,7 +19944,7 @@ F:	include/uapi/linux/virtio_snd.h
>>  F:	sound/virtio/*
>>
>>  VIRTIO I2C DRIVER
>> -M:	Jie Deng <jie.deng@intel.com>
>> +M:	Conghui Chen <conghui.chen@intel.com>
>>  M:	Viresh Kumar <viresh.kumar@linaro.org>
>>  L:	linux-i2c@vger.kernel.org
>>  L:	virtualization@lists.linux-foundation.org
>> --
>> 2.7.4

