Return-Path: <linux-i2c+bounces-10887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE84AAF5B2
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 10:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A21E44C1BCE
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 08:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B1021D5B5;
	Thu,  8 May 2025 08:30:50 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn [139.219.146.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08742222CC;
	Thu,  8 May 2025 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693050; cv=fail; b=NwH/ttntDq2zzNRYucZp9+wh0/IF768avyaTQyAahRDqGKbpE2Dz1TuHz3mco+MZB6EiyondB7CTbPt7uULA8cw159D3q5ySuUZJ0SvSOZ4oBjKY+0R4XX8o+fpNQ3W5hqc/3ck/Ll4A5i4O7g5nlcyijM6IAQgHjaqoS0OKza0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693050; c=relaxed/simple;
	bh=xWIH2wYfRtYSFvNXwcOhMGDJrwqXMBw8fL9MGXNWPsw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fJbIgVIBNhJf0HSeYJvj0w/SpBwkK8aHbQDHR2ph4byEWtFiJVHgRu1fxxpZwRcoI/DYO26vWMe83WaPh6f7p+G9vkfdIXvOOy/n5PFwjssgWIyEjg8wnQEo2mGbDb5XR8m4VduhGI0d4hVv3wHcQP9YtTJnmCBL62Eb1NnJO8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCk7TUXjb/8IcXhVNopoyJDt4OC5sHdCCvYw6sjis+N67yetIWavo4nJFEYWVuCGhQnI1nz2xgJwWsFLImd8P906M4Ok8mNxxv+6H6QUQMPxDqjknHCsMjhC/1yH63ME7CsR51LmNOKGZk0idjgLhzf4596UjL6B5xCTTxj0mdAbjyteQ1E+xzGcwOkoZqtyHdtKuup8BC104REqgMGVBkWxI+02uaiWA6PX5DM5IyH4gno9wpHUI6GRLOc9rBEM4EYH9bOq6FxkYN37vDL6OWGgZfJs8SxOlRHi28eZMXSRF9wzimx0oqwz8XE4PamKWnmJM9i7e2qqZh81cFEneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nhpy9w0VogWJGQoPNq4P3KtHrFL7EUKf8OM84ulLXoQ=;
 b=asgYDJh/VGPLx/jRBxllJCG0jAK1Qv87InW1PYbNwNYoPP+1Mw4eJZiK5p1zKUQAs7yqSiwh3euSSkHHWDZfXG77ffCwjnUL6VHkhNbQlHi90vPnambqhqLVpwku/Z1CrB/Te7cxSx49JwrX/RsuxKRorXugwfthhz535Y8wSMEYjSmQj0UAr66CCa9lDeQGE/6Z2JlMFk6uc6WdIE5MSS+oC6hXDAXIdQ1/DSS0dgunx1bViCqkrwR3c5leZmv0UUC5tcmuVcs6geQ90MIfRo5dp5Rn0SC0XBuQSKKIc53Phk53ESGmMUAZJV9FWtk/qQBYS8fCqraQR1Eo+XRdIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7) by NTZPR01MB1131.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.40; Thu, 8 May
 2025 08:30:27 +0000
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5]) by NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5%5]) with mapi id 15.20.8678.039; Thu, 8 May 2025
 08:30:27 +0000
From: EnDe Tan <ende.tan@starfivetech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"jsd@semihalf.com" <jsd@semihalf.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	"endeneer@gmail.com" <endeneer@gmail.com>
Subject: RE: [1/1] i2c: designware: Ensure runtime suspend is invoked during
 rapid slave unregistration and registration
Thread-Topic: [1/1] i2c: designware: Ensure runtime suspend is invoked during
 rapid slave unregistration and registration
Thread-Index: AQHbq1NZxeBeZwmSbU+ZT1PgQ+QN37OkxeGAgAciiECAE2SWgIAFa0GAgAPVa5A=
Date: Thu, 8 May 2025 08:30:27 +0000
Message-ID:
 <NTZPR01MB1018FD0E9913437D4B34E751F88B2@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
References: <20250412023303.378600-1-ende.tan@starfivetech.com>
 <6e155241-3403-49df-8f0d-5aa63e2e74ab@linux.intel.com>
 <NTZPR01MB10182E9F6E50D679A6EAC3B4F8B92@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
 <6a3b756f-6fbd-4ee5-b511-c5a32e4a6a34@linux.intel.com>
 <2l2tpeictfp3o2kcq5fquqkm3nyjijq65ejanafrshh7icc5c4@guynosug2ve7>
In-Reply-To: <2l2tpeictfp3o2kcq5fquqkm3nyjijq65ejanafrshh7icc5c4@guynosug2ve7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB1018:EE_|NTZPR01MB1131:EE_
x-ms-office365-filtering-correlation-id: 18ddaf1b-8ba6-47ae-da3d-08dd8e0a95f8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 gkann0DeqNZvgsRHH9DOWGeus4CMag3hJH+RSQkH4i+23+LT1WYh0/w0nzmf16DE3bkaFSf2yDBy04TcbFw+gqrPj+2Fo6YItqJn4+8521Ej8pnIIgO3RDjWEn2JiFCOTStuxVIJ4eE9htKviThQ5GyffqIGH2Aw18De+ITiYtoDyDORI/8c3h2EBAZ8mUMocEG0OJzR/vbjkgdTMZJA9xoIMIT6Bb1mD9Z9FhTrWTKY1/uIRvxZwajI2k4jCqkMZ79mpQa9dBPDXI3D/Vg4oDJ3rRxaPiO+4FMywqMZSWZSjgGihGrZqds7F1HAR2Xq6d+OJqW7lc1h1qTcFaqv4xrM1dFFZ+rLOJ+IV4e/HctLpyfzWGgrM3ki4IzkfCEwXFADndhr0L+N5aTApLnWHz3ckeGCmMorU2k6iCD1osWH9VQs3KWNqXevzlul3mKHBW0h23sLdIXJcf5O1txeWa3FWEX8j+zhYjWqcQYXzLNjMVJXfl9vz8MyeOWJ22zqe+SJhUohvzprfxon3+ojE7PO4YnLglF3bKNa0A8vrJutduaehoaz/2lY99HbVdgSdmp2mf0cceWICmH9JxZYLSiqy7e5qnc60m+hGaUuRkQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?agNdEySI9UoUTRbKBedLgewFHFVPxCoS4xz1WAwTGOdSBKGmJCFBa/tndjDe?=
 =?us-ascii?Q?zZZ6mXnE9E8qyh6C+UmSxXYS6biGSLRMZkFBoQHMaeqECdQOALVi3QF8eKDB?=
 =?us-ascii?Q?St2egcebAqYk7Ld2fuWJ6sKm30eGNJnI5zNRlXL3NRx1rwQc3IV6uV0KF/zJ?=
 =?us-ascii?Q?de/DXf4o6ZozxnsaCI+X3W1F/bOGLq/OW+OezouqGb+3ectuqD8uGXfIo7I9?=
 =?us-ascii?Q?zd2QiwfzDnqBe2IPGKi7hxCyCpLJN12FnY+4HBXXxTvim77EfB6hxoQQFyWl?=
 =?us-ascii?Q?xRAAnOunFGhJe65tpB6DJqLH8fRne4G+sSxKSy5Y9oakGaOvkmuNZStN7vaV?=
 =?us-ascii?Q?2uDdYhgjbJVPjE6HdWsZxX4yqKjoxk/+YyLvZXIr6Kpear2BYODMeC96GS83?=
 =?us-ascii?Q?pYsvzMx2vJGRox9jE9kSKI/Ft93XA9KhWC6nZoLQwhO492+slgJQlIusGyxU?=
 =?us-ascii?Q?1Qm4/XLwBXyKBcfhLY+Zk1619G23tKB03kqWZSfaGTlMT061EmYeWasAQBGx?=
 =?us-ascii?Q?CWEk2siqT/0Imay/4hY4Wg3f/GNBcm0vm62SRqIFe1om2Ze4BJihOqsk84Av?=
 =?us-ascii?Q?0mmPdROGZ+n7gDq/n/fOSH6dy3zMhtFgffQvOQUVg/qj2lblRPkwolnSZQAC?=
 =?us-ascii?Q?96KFlZF6LCltKGzygqDffg4WvFX7/Hj/h69ALmfiscw32C+Npb601+l34wns?=
 =?us-ascii?Q?hwxo5gr6ZqgCRFogu3fyrTa9+VKGM6z0B7sT1AeGOVeD+x5CTuuh9vkLZmQN?=
 =?us-ascii?Q?Bs6p23CGMLvSduzS3WYP+cod4bSg+qjre6paBYzT09D4qJJ3sTS8Z6577WSN?=
 =?us-ascii?Q?YFZzh+WEtIKLM9iBzURwZUqtues9VaSVPY6Z37y+sWuP776YBLvw07qFwJov?=
 =?us-ascii?Q?d8aNcDJV219WMLok6AvMYrgpt47PdWdHNk843zXCZkHlqOyKrXA+E2Kc80EL?=
 =?us-ascii?Q?zn9RFpR7iC+evJCNLTcKmRLpbU/3GGJZfiMM/XgNMHbwL1U96/gYDpqYYs4M?=
 =?us-ascii?Q?A7xdzy8k7qE+OgCI8C34ydt/MowRTsAYu2h0VrtNbfDKYmKBRlwbtYEzWqRp?=
 =?us-ascii?Q?UsrLruLC6V3CDrZLpLwT941prvCR5Z040RSnyGOv9HeYr/JfZDfQhea3uhgr?=
 =?us-ascii?Q?p8ahthw9EByUYNmcrPfM+c2S/aVv7J2s4d9hzWUQQcYP/yzFgdkvrPSy/XxI?=
 =?us-ascii?Q?bEb31Gha9p2B8RjXgkqk21Y+oKm7m0mNwTAc9GIW2jDQF+q49r0Kg7kP9dwE?=
 =?us-ascii?Q?O3RiKi0pLi7mkdobacJs6wa0nULwtxNxGU6FAR6xpccPEFRk3iSec/uaAxq2?=
 =?us-ascii?Q?iQ/4DAdqU9N4HpzalyRbib/h6lai2qhe/DjIFHCnh9VsCQ4w9UPPigQokQrQ?=
 =?us-ascii?Q?TpvXFaVoPxBv1Jok58GFUu56Htr5yaxO8OhxTttm/EVT5n94SkZQUeP77MDm?=
 =?us-ascii?Q?mdaETCXNpNzhvXsv0Rj+5REoe7kOfPxOmQiwhvHdhUSCCZ9/AvZDGPioeCiF?=
 =?us-ascii?Q?d1GiwHyOkdLrzSACcU6wXh7WufxevhYhYQVfEM4A8V7peZhunAMBHKFOZB/9?=
 =?us-ascii?Q?N8gfISz0qbXLTH/QuJo7ihtvEesT2isbRKcMZHMJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ddaf1b-8ba6-47ae-da3d-08dd8e0a95f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 08:30:27.2820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vKEtUm0BEu+/K7m5n0CP7tQx/E2s+igfnKprTYzKchcKMgtkdeCCptY5+7OPz+cLwKFAmBiYrho/cwh82RTAAeyNEhCE2OxhFHVSiU5dii4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1131

Hi Andi and Jarkko, thank you for the feedback.

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Tuesday, 6 May, 2025 5:49 AM
> To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: EnDe Tan <ende.tan@starfivetech.com>; linux-i2c@vger.kernel.org;
...
> > Good explanation and could you add it the commit log together with the
> > example?
>=20
> If you want you can paste the new commit log as reply to this e-mail.

Here is the new commit log, feel free to let me know if further changes are=
 required:

Replaced pm_runtime_put() with pm_runtime_put_sync_suspend() to ensure
the runtime suspend is invoked immediately when unregistering a slave.
This prevents a race condition where suspend was skipped when
unregistering and registering slave in quick succession.

For example, consider the rapid sequence of
`delete_device -> new_device -> delete_device -> new_device`.
In this sequence, it is observed that the dw_i2c_plat_runtime_suspend() mig=
ht
not be invoked after `delete_device` operation.

This is because after `delete_device` operation, when the
pm_runtime_put() is about to trigger suspend, the following `new_device`
operation might race and cancel the suspend.

If that happens, during the `new_device` operation,
dw_i2c_plat_runtime_resume() is skipped (since there was no suspend), which
means `i_dev->init()`, i.e. i2c_dw_init_slave(), is skipped.
Since i2c_dw_init_slave() is skipped, i2c_dw_configure_fifo_slave() is
skipped too, which leaves `DW_IC_INTR_MASK` unconfigured. If we inspect
the interrupt mask register using devmem, it will show as zero.

Example shell script to reproduce the issue:
```
  #!/bin/sh

  SLAVE_LADDR=3D0x1010
  SLAVE_BUS=3D13
  NEW_DEVICE=3D/sys/bus/i2c/devices/i2c-$SLAVE_BUS/new_device
  DELETE_DEVICE=3D/sys/bus/i2c/devices/i2c-$SLAVE_BUS/delete_device

  # Create initial device
  echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
  sleep 2

  # Rapid sequence of
  # delete_device -> new_device -> delete_device -> new_device
  echo $SLAVE_LADDR > $DELETE_DEVICE
  echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
  echo $SLAVE_LADDR > $DELETE_DEVICE
  echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE

  # Using devmem to inspect IC_INTR_MASK will show as zero
```

