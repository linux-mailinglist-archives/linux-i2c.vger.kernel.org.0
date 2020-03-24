Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95105191BD1
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 22:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgCXVQz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 17:16:55 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:17068 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgCXVQz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 17:16:55 -0400
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7a78c30000>; Wed, 25 Mar 2020 05:16:51 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Tue, 24 Mar 2020 14:16:51 -0700
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Tue, 24 Mar 2020 14:16:51 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 21:16:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 24 Mar 2020 21:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaUJVRmzp9UFaWYf+JJpTlI28PLkiZuNmJmaXL9YfS0uJxdIJau1GaTxKwHxDSpc6L8MjtdZ68F3K7MKdqll8dhWGFyPpsf/QC1YXONGZbe3jJSxJaGZpz+pJ8CM5FrKt1jc/CNAHQVarDemjuiQCH+CUL45zddAES3Pyruqj2qPhFoUwPmJYOnrXJbFfDFZk1BL6fMphZ2SAO2t4yb7ZzfKMcc0zej6B47GmpSRE4sVgzLl8sELUXLo7tiFsjHgKYtaQArcuoGg3wbQ7gEhF824gz2DZdirjLWrHMJQmTU6H1cnrTm7VG8J2gbK0Aj4r89u4o8yyxmmwfeNXufQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRw0FUGHFYsjF7oAP9rfK9gzgQJCnop2lz9zpmh+XMU=;
 b=F+8nlxvYT6gdCYKVa30Qg2oIM4i8UltfJBXju/5c7l9zNTJqcfq3eKbZ5r7tl8NMlJtmOOiaux4qNoMBHiwg7JkcbAYH3yo8oRTxQEjDS9sTQWUfa5+GK8b+aVasI7g0cc90Us5dmbjjZXIiAW4QDE0KmPKtjcXVG/wp4pvhscYvxdUu1bP8BHQWuz1uRpMg/So+LFkYZJVG0v835IQgA4WCjB1Xkhm2iRrim7denXICQCGsTss8KfxhUCqHj3w6ujsDJ/g6A8IcBXB+eDwfJqhbuKY31hfhuhIPtPSiagPEPj9KAqkENrcErl5RCK3bUWRsjT2s3CGkMbf5RhGShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22)
 by BYAPR12MB3127.namprd12.prod.outlook.com (2603:10b6:a03:d8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Tue, 24 Mar
 2020 21:16:49 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::b874:508d:247f:e4f6]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::b874:508d:247f:e4f6%4]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 21:16:49 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU" 
        <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
Thread-Topic: [PATCH v3] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
Thread-Index: AQHWAfDf1C4RyDml4kyU7NYI0950xahYOcmAgAAFXxA=
Date:   Tue, 24 Mar 2020 21:16:49 +0000
Message-ID: <BYAPR12MB27273959932290518B68800ADCF10@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20200324152812.20231-1-kai.heng.feng@canonical.com>
 <20200324205731.GA7641@ninjato>
In-Reply-To: <20200324205731.GA7641@ninjato>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-03-24T21:16:44.6258364Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=253631b6-43f8-47ef-b12b-90441870679e;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [2601:647:5500:817:e4cd:8d36:b72a:5b9e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edffe047-f922-4fcd-0ce6-08d7d038aa78
x-ms-traffictypediagnostic: BYAPR12MB3127:
x-microsoft-antispam-prvs: <BYAPR12MB312742246B1893C21E758E79DCF10@BYAPR12MB3127.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(39860400002)(366004)(136003)(346002)(55016002)(9686003)(186003)(478600001)(4326008)(8936002)(6506007)(53546011)(66446008)(2906002)(64756008)(66476007)(66556008)(33656002)(52536014)(7696005)(76116006)(110136005)(5660300002)(54906003)(66946007)(8676002)(81166006)(81156014)(86362001)(316002)(71200400001)(70780200001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3127;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zLOE0hdP4cjS6oBkGzt0TPgaV3L22OXCuPsOMXyrIi5euOJ1N+hFFg5u6jsp3ZUmINgxDUUP/aumJyvsCT0ZRPXn5LrRD0soi0TQ6d5OB6YkOZlVrtUHf18s3q5/Uj5Fqy1f5hneaWMU9SzwEIgSqDFmAEoaSxXdur1Hae3uWDWj3DnDX7CYvdn+9B2EHeA9sFwwiF5tsj8iNpQ2PhJOlDuKy0uXGX938klyIn8mU2if01EZ/HQ37pWp24JjbBrjbjMorRtqOz51lHH5QhKJRcUbwON1/Qmw9Ujy2sj+fPjE19aulq8DAo78cc2sBwlGf3joD25gSKEc57lMireKidh4Xx51Of7BnVLM/G4KcvSTRuqPzZ2vC/ZZxOk5ycECWaoMvYF782T67EYDJQUT1TGLefj7lFrNdicpIk/0tXn2WN3eN3ixeSpJRpJ6DuggG4P/FkownImCbgKKXbn5Zpj7KI878Ylfuu8ByjltnfYEQUhyXNNyrOve9yMoWsK6
x-ms-exchange-antispam-messagedata: +zSe5/iEpRk5kYaB94eycy+lijKAd5mi+HHEXfibfeh5NyoVyaOgC9lKQeXQhmukcGA2vJWgRqX+bgrw7VVX6sTsF/kgAqvJj/oUI9rvARJ4mS6Huw+RK/tyaSRyg/zd/XtgWfQ7Jm0vJxDKBiuWcAbFkTv2ZZsaz3YCIl+gNy6YZBQBABMcAYQOTiRxrS+mGBtchbYTn+2GE0g788jKRw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: edffe047-f922-4fcd-0ce6-08d7d038aa78
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 21:16:49.0586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0tOiuWd0BPeR4xHOuX2AuC3hlO0h0rSVQ5mXXlMNQYSnJYL/Nl62bcaqJA0P8yIPEZgIaAkxiHApYGtNeH3ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3127
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585084611; bh=DRw0FUGHFYsjF7oAP9rfK9gzgQJCnop2lz9zpmh+XMU=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:
         x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=o6PEDXLkacWRGPz7P4/c1aS00oThP/J4F88VcR6j9/ZVA1uQLytSWh2xz73GTAv0V
         WqQxLSwkcH02B+Ut1osFNVl2XEP2KF2Y0DBheHY0lgjNxlSJQOe6zSfhPgrfkmrCzO
         ErbdiQ79xyH+ouZYN+UIJfmrrwFFu+CvhXnGhbGqkicNR0vtMEYuprKLtj/BQRWU02
         Z3iS9LdxMXGfXRiSkI4lLKGaJWHx70rIf2jm+RG7qmJlUIPca4NuY0RhNwJMYxgF/7
         9zeE6WUIHuGA506Ooj8ds0bZ1r3iXh5V3oq4cdn6O4UQt+0ZrBol3NvpuaSiuZ6bsM
         RLl/IORMDVYAQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: Tuesday, March 24, 2020 1:58 PM
> To: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Cc: Ajay Gupta <ajayg@nvidia.com>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; open list:I2C CONTROLLER DRIVER
> FOR NVIDIA GPU <linux-i2c@vger.kernel.org>; open list <linux-
> kernel@vger.kernel.org>
> Subject: Re: [PATCH v3] i2c: nvidia-gpu: Handle timeout correctly in
> gpu_i2c_check_status()
>=20
> On Tue, Mar 24, 2020 at 11:28:11PM +0800, Kai-Heng Feng wrote:
> > Nvidia card may come with a "phantom" UCSI device, and its driver gets
> > stuck in probe routine, prevents any system PM operations like suspend.
> >
> > There's an unaccounted case that the target time can equal to jiffies
> > in gpu_i2c_check_status(), let's solve that by using
> > readl_poll_timeout() instead of jiffies comparison functions.
> >
> > Fixes: c71bcdcb42a7 ("i2c: add i2c bus driver for NVIDIA GPU")
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>=20
> Looks good to me, thanks Andy for the suggestion!
>=20
> Waiting for the Rev-by from Ajay (driver maintainer).
Reviewed-by: Ajay Gupta <ajayg@nvidia.com>
Tested-by: Ajay Gupta <ajayg@nvidia.com>=20

Thanks
Ajay
> nvpublic

