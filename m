Return-Path: <linux-i2c+bounces-14320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B1C8DA5D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CDDF4E569A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B65324B3A;
	Thu, 27 Nov 2025 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwnixsvY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49BD2FE56B;
	Thu, 27 Nov 2025 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764237281; cv=none; b=IQIhEXneDM5PfoVx6ch5zETGnoxQ5AhmphYB2lxreB5MNaumQslawmji7o8Y+NotRLMmRTAJVfiy5VsDnpJzd93KnJRSAqljOgeIzL4lWRsQm9skVIBmb+0rKU911aj5ggvDLo4207J/1R9NG4HjdVDOP86r/3YPHDlDu4/3zZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764237281; c=relaxed/simple;
	bh=72p0+1ozWpWQxM5yfcS7NEq4OSQKSeKc5vmq2m0TLeE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hGLiC/bQhzU9bDBB46nePmX6SVDk2ENhZO2z6tAhz6bhE8BQNXUoVOtbOOUFx+8xBVDaNKNIF7U2BdEyJyDZRbB4vaALJWgq+7N7TtMR8MFolOwC9zXgce4Gi6cf5YJVoDOID5yaDhiJL+iR6S3R+pOYjYxuwU4cbNEM7pqrUVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwnixsvY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764237279; x=1795773279;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=72p0+1ozWpWQxM5yfcS7NEq4OSQKSeKc5vmq2m0TLeE=;
  b=FwnixsvY8AABgvdwHibtenvqE0rdTuJe8A2Ua+7k63tHbMPt5xIc/4Ox
   T78PynasFAiMQlxOvTeYodJ5oPrqe3wb3aKjpKAu9oXKQO7lmnD/G28NJ
   wb4D2rg744CJmE13Bg+Itpfxv46DRxQQEyHMkS+2WmUiosc5r+YDo4Idl
   xcqntHZZGLQFmB35Vo62yeF28IvYC13wM176xvQLsNnj2hv4jW4gTDAOt
   tuismHGL2J6Be6X/O9XDyncaBtF+WpfcUh/YfkpdD4crpla2JqGhfLkkW
   bQw64Oy3+I54eIIuuIMkeCYFR55DmPKWy1wt42ASZHDWpOk4VK1J6OT1A
   w==;
X-CSE-ConnectionGUID: kW+maYsPSRK61D6d9MsAUQ==
X-CSE-MsgGUID: OaU2mBLWTjOuxs5xnTKe3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65468191"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="65468191"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:54:39 -0800
X-CSE-ConnectionGUID: y9dTzj9+SLmDaedhckz5eQ==
X-CSE-MsgGUID: L8wk49+BQ7WlhSndlQ+AxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="194002280"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.42])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 01:54:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 27 Nov 2025 11:54:32 +0200 (EET)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Baojun Xu <baojun.xu@ti.com>, linux-i2c@vger.kernel.org, 
    linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, 
    Wolfram Sang <wsa+renesas@sang-engineering.com>, 
    Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v1 2/2] platform/x86: serial-multi-instantiate: Remove
 duplicate check
In-Reply-To: <20251125094249.1627498-3-andriy.shevchenko@linux.intel.com>
Message-ID: <71904f34-8f91-0443-00c0-318519840aca@linux.intel.com>
References: <20251125094249.1627498-1-andriy.shevchenko@linux.intel.com> <20251125094249.1627498-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1790419283-1764237225=:8713"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1790419283-1764237225=:8713
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 25 Nov 2025, Andy Shevchenko wrote:

> Since i2c_acpi_client_count() stopped returning 0 and instead
> uses -ENOENT, remove the duplicated check in smi_i2c_probe().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/serial-multi-instantiate.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/pl=
atform/x86/serial-multi-instantiate.c
> index db030b0f176a..3f6f5d51442c 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -198,9 +198,6 @@ static int smi_i2c_probe(struct platform_device *pdev=
, struct smi *smi,
>  =09ret =3D i2c_acpi_client_count(adev);
>  =09if (ret < 0)
>  =09=09return ret;
> -=09if (!ret)
> -=09=09return -ENOENT;
> -
>  =09count =3D ret;
> =20
>  =09smi->i2c_devs =3D devm_kcalloc(dev, count, sizeof(*smi->i2c_devs), GF=
P_KERNEL);
>=20

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1790419283-1764237225=:8713--

