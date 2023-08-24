Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAF39786F00
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 14:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbjHXM1P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 08:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234671AbjHXM1E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 08:27:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF0510EF
        for <linux-i2c@vger.kernel.org>; Thu, 24 Aug 2023 05:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692880022; x=1724416022;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zKwVFfbIKVW53a59FYTCEvVMEmtDmt45a6DB/lKycjk=;
  b=X9Bjk6EaQIP6xpfXUvqj76xbtWOK2YVSpHWQUxoj49sg/FggD0bTFJpw
   DfFeblzu1Hoay4mhSu7O3rIS1dJQOgxOXTqWaVU5K1PAhIz+8AOsG6xyY
   UjOazsztxkB1H1KuXcMaQmtelCmowOO08fg6RF9564MksCBWSyA37xRxL
   QJDeE0i+LGBHVpc1QD9xJAb/IXxBo0lioyPO1TahHCHUkgyemq8ejAv/I
   jysmctBlkn1WV7yq2nEkVw/g/wkKp9ea2Db5yR3lEf6GeuGuapECHLDMd
   Tiv4L7aCX3gq7P4ocIokQV1bpspOsnoKsMxQNcd9OdsK8I4lQInEV4fCQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378178451"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="378178451"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 05:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802525437"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="802525437"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP; 24 Aug 2023 05:26:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 05:26:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 05:26:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 05:26:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 05:26:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxUjvP+n6uLTm2OInMZ/dCYjEQ8M2BwgC+bOnVOwl0T/hQgDr/Bk3jwl8Cy//GEyhMCK3Gv2ELLlHu1FBkzhmejjAZVK7rUOsRbLB70SXenbzv2nXueont38fwkaDrFtoqGh5Iwzp5UuiELDWaEDxbucAA9vW1OT2dA9QrrJUjHHCRDaWT2Fnv7SGYmVTOeFoMiwnB202mMrhdHMzeJCckpxAgOd4Xm26oB6lVARFowDUH0utb4ViSbJ3jpXQtPQuNgB46E/IvR7OBN+Ku+XEpS6N1+MdN1b+FGlVTgIj2p3C7Re+hMhn6T4IV1FyVTxxN3/WSVemyw4AuIpIzVwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKwVFfbIKVW53a59FYTCEvVMEmtDmt45a6DB/lKycjk=;
 b=T0djmYm8KyO+046nrU4RYmVhOumnt87vY7tDqhjEWWzqidldpGiq1NtVgkmSupHCQnnSLXbvIFjZNHb0BaPjHgEAWjylN2KtwJHEHMKWnQ/fH00auv32MIs7Z+f79A1Pk08/Pbk+XUFMSaHuCwg9dfLsb5OL3a72PRyc+gKo0PDAXAQBO1bcXGamdVQVKEo7luKtHGM5fjkfeV3gNDbNqva7+4BWj8RN5FO4PR8w9sP8VLZXZxvhhAINEeHnRqAPXAIgzDOycinwMMlGGZyq9wWQuDDFKD8WgQb/9w6VVbFDpYJQ+BC6GRuEFJkYBxbH0WwbIA7PkHxOBW3R0w6xbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Thu, 24 Aug
 2023 12:26:51 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 12:26:51 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v10] i2c: Add support for Intel LJCA USB I2C driver
Thread-Topic: [PATCH v10] i2c: Add support for Intel LJCA USB I2C driver
Thread-Index: AQHZ1cLiCHEZWkubHkO2ZnBje9oA96/5PP4AgAAiDYA=
Date:   Thu, 24 Aug 2023 12:26:51 +0000
Message-ID: <DM6PR11MB43165C6708ABCE34227340DB8D1DA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1692796047-9614-1-git-send-email-wentong.wu@intel.com>
 <ZOcuWN8wHf2xNvLC@ashyti-mobl2.lan>
In-Reply-To: <ZOcuWN8wHf2xNvLC@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|MW3PR11MB4602:EE_
x-ms-office365-filtering-correlation-id: 3fb8e853-889d-4dc8-5105-08dba49d653b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oMAudB6wFedeLPGDJuIi0gFmWTpgbPxmp+9HSHkYouvDbrGVdtleUJO+0F6PCPMAHY2Z3NguVKleB+LOdQGrdb8rQw6ilh4BQ379pg2Pntp1sr70EuNsbGofDRbpisdbWhjtZ5JR+Bskkx+OkcmZ7AQogCHrAiuoD1DImxVqEhP3LfrjdYWcc0WsXJc/zxRRwFgO98FK94NCuEnnO3CR4AhNQx8890zA4ZvB5gUGsNl0gdxYgbDZTYDTGmrQ9pTSoV9GqZF/bVqiq7mHtJ+ZnO34nKYXGMovotlYA6HrFRIVU0uZfGgQq5hHnnn1T8JrHTggbEVkN5onpN9dCNtWYMBtSkeLRrHNFHBlaegiar98cSFQjD8SGyXvsls305hY5y6aeOImo9i4fMVlSuUx5fdVgT6Y7l45lVOoJroUFbnP7n9SNFyeT9eViH/GF0zMeTdlKYNeKe3z5cw4lb5oFtWABhr39VzlKGQPoB9TZ5BTvkNXfjfLZevAjW3+yOrNyWUnZEEfyu6yd/RaY9bQLyylUnslTpGMKYbfBB4+zRsG7u4pc9cUFisPzb2kTRWB5P9kQFnv9pZKp/xd8dzsRwxfX1HzasFNYngLhqW0vdo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39860400002)(1800799009)(186009)(451199024)(5660300002)(33656002)(83380400001)(4744005)(2906002)(122000001)(38070700005)(38100700002)(82960400001)(86362001)(55016003)(9686003)(66556008)(41300700001)(66476007)(54906003)(66946007)(66446008)(64756008)(76116006)(52536014)(6506007)(7696005)(6916009)(316002)(4326008)(8936002)(8676002)(478600001)(71200400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ntVvh14GvKz32YvPawjPiJ54YU34Spf41VL9pRIaTKfor5LcYi1m5Xx3/0q9?=
 =?us-ascii?Q?rCcJUV1Pwo0TYaUgDbL8IiDs3fFPJRwhGxHFBWxN6qHabkqK/T0xr66J3lok?=
 =?us-ascii?Q?5rKMONA4EJPG7z3LPc2bf0ejzoAEFsily6lWmJ+MLIfVywg7QR12RgALxO2L?=
 =?us-ascii?Q?fBBoCcQ7IPEPVaf1KwODH7a02Xu3f+2AgoGi4Vk7yVYB1RlgZR4F8R3vLRud?=
 =?us-ascii?Q?faIUyR1cwNWnUchtfgqapLheYgs2c3sHEeSLnMw1jygPZvr6Hz4m+KZs4Ue4?=
 =?us-ascii?Q?+f6xdypuZIl/G352PE5cjO2R6A+uV/DnZUYp8SAayQ+yarlUwL/TWasD0Eyb?=
 =?us-ascii?Q?gQOD7rkLUTgNSNp6Z8vTzSUYHwxJPINCF2XgtCpH8UnZbZ38FqoMV/M422U9?=
 =?us-ascii?Q?qM83b0W9vbZd8L+GGW/5DxAVAAtRcNY5BM52Vq6tIGJl7nsZ/59pdIaozQgp?=
 =?us-ascii?Q?Xxqb2HpbQVkh7pPFRrGfpIrwHAuaU7VfVop6dW//AWFJKOfjORa0ExmLOt+I?=
 =?us-ascii?Q?eFlyRXEWDauy+JWBs4g2Gwy8ldIPHXrUWagf8MmqPgTUWH5ZgHo5Gy/UYMEf?=
 =?us-ascii?Q?aDUq8HxRvJS+jJffIQAxy4GyHJsJpEfcgCyIGShTzjs9ABwNgmkE0E+XBolc?=
 =?us-ascii?Q?htLVfdVMEkYHsK4PQYXhlp49kKByqNQiRDx3vulGE4AjSOpmL3ShbEJozrGy?=
 =?us-ascii?Q?1BflNUsBe8oaOLfmtU8WtlGtIDvLgICz9SZ4sJ9QpVCcH8nlriV7jUpfsC2M?=
 =?us-ascii?Q?k12enolminxAzdaRLoH4cngqGSvWf1KNyCg2zgI4OUd2aPHD2CdXCZsAzw0v?=
 =?us-ascii?Q?HKBdVlHArvFpqJkloWmAq400nn20l4ZHrtwmD2zfHop0JO46vpdI5daNbTKV?=
 =?us-ascii?Q?lKgOUUAf1jcCJp+6Lqdvfk1uAUv1ECHLQ/lWKOV4zfWYKewrwmTiJWM+0N6q?=
 =?us-ascii?Q?m3TY+lZX8lEJm44lD93KcC7t1IsggLuyv7LIXPXJupCrpNs135v4wZCY3w5j?=
 =?us-ascii?Q?4YEL2SHw97A5D2wshN2h5XhPRlHIfQuyTwbv7UtNpFR0AhpU2Go8ejm8WcHv?=
 =?us-ascii?Q?yQhleRKTo4xprBbDTLEq9NKICKXzBrtQPUHGKCo7a9wWWEy3z3GgqYiiCM2F?=
 =?us-ascii?Q?iY0SsDoS/uU881hOO+5+XYoiWya1BNb1q7VUkEVG/aslgSUTTm74M5wfNXkE?=
 =?us-ascii?Q?7g+r8AoEf+9VIYyzI52zuDg6BvLdgFSnpEkHFP84QYoDlTejz4MhsAsKM1Yj?=
 =?us-ascii?Q?elKfZD5at9RjKSjHpWMe8SEd1zij6UcxwaLn0dyxwfrKU53vv9tK7yij5nEz?=
 =?us-ascii?Q?nIaz/v/lgxxHpCOR7rgMjz9t4PCPXuI1BE0/EhQ3cYjdX7adkMYCcgPjU4Z6?=
 =?us-ascii?Q?pqW2jVOX13+3bosqJkEnPnLdi7L47dMQvM3dpI4xG6zF/vqf21hie2mw164a?=
 =?us-ascii?Q?oLPXiLbjuLyt0NCkBXF1ijgt2mFYewRVdZ3p09soZvWqUJnUos0E7VtTFZ2M?=
 =?us-ascii?Q?/3ch6Scj63z0TjfSvegkI0rQBvv9tywt0OlCmUf3D/CvjQ+oddkubVVqjWBP?=
 =?us-ascii?Q?tcaQUlPRx8eTyeoOFo89K71gG2EZH2hVM/fsc0Oj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb8e853-889d-4dc8-5105-08dba49d653b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 12:26:51.7787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DNwWJgVVmt5rmp6/psLKDutkhl562c4c5VRV19YSgxcvseplFm5E36TsP8Iw8d1fNPmIFcY3rd4RpacFIMaIhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

> From: Andi Shyti <andi.shyti@linux.intel.com>
>=20
> Hi Wentong,
>=20
> On Wed, Aug 23, 2023 at 09:07:27PM +0800, Wentong Wu wrote:
> > Implements the I2C function of Intel USB-I2C/GPIO/SPI adapter device
> > named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA I2C
> > module with specific protocol through interfaces exported by LJCA USB
> > driver.
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>=20
> I confirm my review here... patch looks good,=20

Thanks for your review

> but I need to know what happened to the other patches.

GPIO patch has been acked by Linus, but there is no review comment for
SPI and USB patch yet, so I just updated I2C patch to address your comments
first.

BR,
Wentong

>=20
> Thanks,
> Andi
