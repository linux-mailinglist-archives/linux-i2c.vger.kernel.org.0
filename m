Return-Path: <linux-i2c+bounces-11287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF0AD1AC9
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 11:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09F2216365C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 09:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D851AE877;
	Mon,  9 Jun 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ev4jiEc/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5531A9B4A;
	Mon,  9 Jun 2025 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461938; cv=none; b=MHPJ8enjpMTRykhYQelcPotuWbuRmwsm6lrt0l1108UGJ59PjFFrMuF8rU+eiCMRbLIghIOtFcrOP1Tojnt543f8dRenx2Xn0HRMgBEoIpjS1cxeKJu4CHXl9cwtJM2F54CpTk2MvDh2W3h72bjX6INwSf5Q+fuNLmUNugRb1ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461938; c=relaxed/simple;
	bh=zbvV33JMZvTvWDfJU5HDNM9KGa+BZqS9I2y7gEHZzFI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HxDg6MencqAjjAQ7WrTOLaLYJrtyD7R/RGkSZHA3VsCnIZQyf6W1OvVsUBUJmRqaAtktBaGwOrFxUTLB78+hcpfs5kSvUgudQPCUfYa6FpbzLT4/aFKIZUdR02z3Qc8AjpsAGrV6JC+7KcNJgdH0Wh9ZUD04j8t7I2iKOuZVlxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ev4jiEc/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749461937; x=1780997937;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zbvV33JMZvTvWDfJU5HDNM9KGa+BZqS9I2y7gEHZzFI=;
  b=Ev4jiEc/+eLgZJMFvLbH++d4saClr1oHMojBdVbCeh+luG6DTn3/+t1c
   Q6zcILKaQTY2onrOjQzDPOO/9FtY1wLYaeAoM+Wjoo/IsNPOk+3LmalkJ
   trgva7LhT4nq+hkaENZYug/W+ZxKyNxfYpT6hZULbmI+EpZoNvF9Vwmgu
   FYXtHBDnqUX9xVa7FyU38qMDS1o7Ga0Pku+V90kOo2tMegGJ1zJRinZGO
   fsiWy0zJZRnHLLdX2B/3xkZl/AZO45vdcQZG8QeMOrUn5hvrEGnZPWM4m
   Fc3CFqefTjQ6+rp+5pqDaZdZKjWf46eO2+hP2ttudlEl7O0bv4MzSZLsA
   g==;
X-CSE-ConnectionGUID: uWSDG2F8QG2FtUhdprGLOA==
X-CSE-MsgGUID: bVUbWsLLT82tNR1GTXxglw==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51237776"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51237776"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:38:57 -0700
X-CSE-ConnectionGUID: ZrfCtFc8TBS7QNAQGIRSzA==
X-CSE-MsgGUID: jgRA0eSYSkGSZHNDtfIAIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="151457547"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:38:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Jun 2025 12:38:47 +0300 (EEST)
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
cc: andi.shyti@kernel.org, rdunlap@infradead.org, 
    Hans de Goede <hdegoede@redhat.com>, sfr@canb.auug.org.au, 
    linux-next@vger.kernel.org, linux-i2c@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com, 
    king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v3 2/3] i2c: amd-isp: Initialize unique adpater name
In-Reply-To: <6136cfca-45ca-5832-cf5b-f49e16f6ed5e@linux.intel.com>
Message-ID: <69495068-fbee-f123-27f2-226eda8684b8@linux.intel.com>
References: <20250606213446.1145099-1-pratap.nirujogi@amd.com> <20250606213446.1145099-3-pratap.nirujogi@amd.com> <6136cfca-45ca-5832-cf5b-f49e16f6ed5e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2116048114-1749461927=:948"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2116048114-1749461927=:948
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 9 Jun 2025, Ilpo J=E4rvinen wrote:

> On Fri, 6 Jun 2025, Pratap Nirujogi wrote:

You also have a typo in the subject, adpater -> adapter.

> > Initialize unique name for amdisp i2c adapter, which is used
> > in the platform driver to detect the matching adapter for
> > i2c_client creation.
> >=20
> > Add definition of amdisp i2c adapter name in a new header file
> > (include/linux/soc/amd/isp4_misc.h) as it is referred in different
> > driver modules.
> >=20
> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > ---
> >  drivers/i2c/busses/i2c-designware-amdisp.c |  2 ++
> >  include/linux/soc/amd/isp4_misc.h          | 12 ++++++++++++
>=20
> You forgot to add this new file into MAINTAINERS file.
>=20
> >  2 files changed, 14 insertions(+)
> >  create mode 100644 include/linux/soc/amd/isp4_misc.h
> >=20
> > diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/b=
usses/i2c-designware-amdisp.c
> > index ad6f08338124..450793d5f839 100644
> > --- a/drivers/i2c/busses/i2c-designware-amdisp.c
> > +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/soc/amd/isp4_misc.h>
> > =20
> >  #include "i2c-designware-core.h"
> > =20
> > @@ -62,6 +63,7 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_=
device *pdev)
> > =20
> >  =09adap =3D &isp_i2c_dev->adapter;
> >  =09adap->owner =3D THIS_MODULE;
> > +=09scnprintf(adap->name, sizeof(adap->name), AMDISP_I2C_ADAP_NAME);
> >  =09ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> >  =09adap->dev.of_node =3D pdev->dev.of_node;
> >  =09/* use dynamically allocated adapter id */
> > diff --git a/include/linux/soc/amd/isp4_misc.h b/include/linux/soc/amd/=
isp4_misc.h
> > new file mode 100644
> > index 000000000000..6738796986a7
> > --- /dev/null
> > +++ b/include/linux/soc/amd/isp4_misc.h
> > @@ -0,0 +1,12 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> > + */
> > +
> > +#ifndef __SOC_ISP4_MISC_H
> > +#define __SOC_ISP4_MISC_H
> > +
> > +#define AMDISP_I2C_ADAP_NAME "AMDISP DesignWare I2C adapter"
> > +
> > +#endif
> >=20
>=20
>=20

--=20
 i.

--8323328-2116048114-1749461927=:948--

