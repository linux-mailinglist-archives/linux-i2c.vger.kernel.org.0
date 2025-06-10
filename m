Return-Path: <linux-i2c+bounces-11326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 969ACAD30BB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 10:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89EB17A444C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 08:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D031027FD48;
	Tue, 10 Jun 2025 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/xC8ZUW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D810E1DD9D3;
	Tue, 10 Jun 2025 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544930; cv=none; b=iWvJGwZ+A9gZ+PYK9ozJyiF8Vtc3mmOjbcwXjKcyU0kQI1SWhCp+szyneBhSGPgYboCjraNviLBiV5jV5JjY3HGbNesXQ+d9ywiZb34+7Ehal3xJoomSJEJyE5bTWgzd7kpXEb33w4VUHrG/alnGCicqEC37yLkdZaC17zY630Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544930; c=relaxed/simple;
	bh=dAlJNlsK6HDm/D1KHUUl3OpVGkaXaRLFMW/O78c4LlY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QSWXWy6GOxMlCnsNEVZhVVBYv1FKstX+3gpGaEoCZaId67LLHBvpEUANrLCVCQVU6B1qvtM4+ufQm6L5YeOgP1r0IsMDq7SvTEF8d90Rd6F6OVoaUFd4BOoFxU/A2Xh1lBUhHrBlzE8NgC1GEDsiftsS4IET5evZkOorzTz8u20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/xC8ZUW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749544929; x=1781080929;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=dAlJNlsK6HDm/D1KHUUl3OpVGkaXaRLFMW/O78c4LlY=;
  b=I/xC8ZUWpNzwrrwSoX2YNiC9zuK9Mzjk2sel8Duxt1jGxdOdBcB66DOD
   odY9odY9XfnrCX9u7Fxl4h8uRD5H04He+8Ec7DfHOIQN+M22/zmSaBNF5
   el//dZgYjAkTLFiidCXQo3gi6OUHIO3T9eanw+SXHZE7fcQEdxgSkDHTH
   V375MRIuQTTGTQSwGO3SDuIv8uFZe7SqSbNisG9yF/RDA9f+Q3USD+Dqr
   N8nrbjoj9LrkRCuksSFqmUDV6Xg5m0KhPzLbgapfbTkSOWuxE6QJPvPa2
   GzMAnDY9g1SXOh0uX/z+XH8lDo0Miw2GGdNfVvKqgx0cV7M27yCARbov6
   w==;
X-CSE-ConnectionGUID: RPbpti/KS3+mMRja48HXuw==
X-CSE-MsgGUID: aKzwq676SFKUMYCtsroEpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55308750"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="55308750"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 01:42:08 -0700
X-CSE-ConnectionGUID: JFC3cMuxS1G3qXqWLPFTug==
X-CSE-MsgGUID: Zb/qwyA9SGyQcbJThwcLsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151643988"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 01:42:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Jun 2025 11:42:00 +0300 (EEST)
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org
cc: rdunlap@infradead.org, Hans de Goede <hdegoede@redhat.com>, 
    sfr@canb.auug.org.au, linux-next@vger.kernel.org, 
    linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
    gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v4 3/3] platform/x86: Use i2c adapter name to fix build
 errors
In-Reply-To: <20250609155601.1477055-4-pratap.nirujogi@amd.com>
Message-ID: <570c7765-b3bc-77cd-dddb-d19e85611114@linux.intel.com>
References: <20250609155601.1477055-1-pratap.nirujogi@amd.com> <20250609155601.1477055-4-pratap.nirujogi@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1148617004-1749544828=:949"
Content-ID: <92a34faa-5ba6-b7d3-0b6a-8f83386c5e09@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1148617004-1749544828=:949
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0ae36a1b-f8b2-5a24-6972-ccc973c34d05@linux.intel.com>

On Mon, 9 Jun 2025, Pratap Nirujogi wrote:

> Use adapater->name inplace of adapter->owner->name to fix
> build issues when CONFIG_MODULES is not defined.
>=20
> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C=
10")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@in=
fradead.org
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
>  drivers/platform/x86/amd/amd_isp4.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/a=
md/amd_isp4.c
> index 0cc01441bcbb..9f291aeb35f1 100644
> --- a/drivers/platform/x86/amd/amd_isp4.c
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -11,6 +11,7 @@
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/soc/amd/isp4_misc.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/units.h>
> @@ -151,7 +152,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> =20
>  static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>  {
> -=09return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> +=09return !strcmp(adap->name, AMDISP_I2C_ADAP_NAME);
>  }
> =20
>  static void instantiate_isp_i2c_client(struct amdisp_platform *isp4_plat=
form,

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

Andi, do you want to take this fix series through i2c tree or do you=20
prefer me to take them through pdx86 tree?


--
 i.
--8323328-1148617004-1749544828=:949--

