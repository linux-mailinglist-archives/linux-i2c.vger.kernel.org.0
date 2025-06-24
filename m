Return-Path: <linux-i2c+bounces-11569-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018EAE643B
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 14:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4520C3BA3F1
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 12:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0198D28D8CB;
	Tue, 24 Jun 2025 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+7wp1OM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DEC25BEE4;
	Tue, 24 Jun 2025 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766846; cv=none; b=sdFDamhivUXE1ujgcdftzi/zHKqFSqbLP/acVh4zzwBsDnkkqyfxZ51MynIw5drAz95jbwqbLebc3rzemPBzW9GYjETQkOm6YGCpv4Ky3wPRKWKXkSuo/Y4u5dyPIw0tdvYnSDytb0vBeHZIGBEUYfY/zgJtbHw1W74pKoDZ1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766846; c=relaxed/simple;
	bh=Hhc9+eEwxLWNcOtSwz+89PdUqpx628Ulqc2CV7BV51I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iftDhOe7H73rBtSt67wzWgoN9mwMnw9HdiRz86z0O3Fz08qzNoya7PKR0j9xZuNS6xtjnChgSALaPzAXl+pHincSPl1uuRBCVh3aSNl/q5ggKvzlh7zlLHfhmEtGNgPiqcZNMDvjK57uoK4D3Q5Dy1MEIz6EAkR3WPUn3nCAMag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+7wp1OM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750766845; x=1782302845;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Hhc9+eEwxLWNcOtSwz+89PdUqpx628Ulqc2CV7BV51I=;
  b=j+7wp1OM7oTSBZvbW/he+lDq0GahwNS7TQnfP78BtHLmvnj1WVhxZTuQ
   dNoqd+ZmESub8b/PvQD3CDBA0zqMnsYhsljm8vMdkuqOFp8aOnH91osHa
   1jZXh+GuJj+kxtzheRD90gR5mCaMT3yf2Uo4IKZf4a5tRVN7E7Z8FosbE
   SgDGpqfIKAv88vlJQgoSO3/qe+rQq7CY+g/o5Wx2CX0L4i0GsRITEEdK8
   6WMocYI2GS6VIRYZs5zBTwikC++3XaDwqfiHSrHS2vlqEjcbt+63Wf4UI
   y39DC18LHKTKSLioeLMuPKmc3ZktuR0yfl5RX7VWw2mvzRjLKydJeizvh
   w==;
X-CSE-ConnectionGUID: AkgeqjvXTpSJPqCXlxmthA==
X-CSE-MsgGUID: 4Prz/HDgRUKBDL4nV9Fx1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63604102"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="63604102"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 05:07:24 -0700
X-CSE-ConnectionGUID: WIGBv54MQ/CqmccVAA5cdw==
X-CSE-MsgGUID: YezupBD2Sf+Z/OYkyyxvtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151641624"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 05:07:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Jun 2025 15:07:16 +0300 (EEST)
To: andi.shyti@kernel.org
cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org, 
    rdunlap@infradead.org, Hans de Goede <hdegoede@redhat.com>, 
    sfr@canb.auug.org.au, linux-next@vger.kernel.org, 
    linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
    gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v4 3/3] platform/x86: Use i2c adapter name to fix build
 errors
In-Reply-To: <570c7765-b3bc-77cd-dddb-d19e85611114@linux.intel.com>
Message-ID: <2a74c711-0d9c-8013-dc92-82ffd0d7d416@linux.intel.com>
References: <20250609155601.1477055-1-pratap.nirujogi@amd.com> <20250609155601.1477055-4-pratap.nirujogi@amd.com> <570c7765-b3bc-77cd-dddb-d19e85611114@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-586974884-1750766836=:943"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-586974884-1750766836=:943
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi Andi,

(ping)

It seems by now people are starting to send workaround fixes (build only=20
with =3Dm) as this series is still pending and compile is breaking because=
=20
of it.

I'm fine with you taking the entire series through i2c, or just let me=20
know if you want me to take it through pdx86 tree instead.

On Tue, 10 Jun 2025, Ilpo J=E4rvinen wrote:
> On Mon, 9 Jun 2025, Pratap Nirujogi wrote:
>=20
> > Use adapater->name inplace of adapter->owner->name to fix
> > build issues when CONFIG_MODULES is not defined.
> >=20
> > Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV0=
5C10")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@=
infradead.org
> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > ---
> >  drivers/platform/x86/amd/amd_isp4.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86=
/amd/amd_isp4.c
> > index 0cc01441bcbb..9f291aeb35f1 100644
> > --- a/drivers/platform/x86/amd/amd_isp4.c
> > +++ b/drivers/platform/x86/amd/amd_isp4.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/property.h>
> > +#include <linux/soc/amd/isp4_misc.h>
> >  #include <linux/string.h>
> >  #include <linux/types.h>
> >  #include <linux/units.h>
> > @@ -151,7 +152,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> > =20
> >  static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
> >  {
> > -=09return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> > +=09return !strcmp(adap->name, AMDISP_I2C_ADAP_NAME);
> >  }
> > =20
> >  static void instantiate_isp_i2c_client(struct amdisp_platform *isp4_pl=
atform,
>=20
> Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>=20
> Andi, do you want to take this fix series through i2c tree or do you=20
> prefer me to take them through pdx86 tree?


--=20
 i.

--8323328-586974884-1750766836=:943--

