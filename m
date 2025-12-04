Return-Path: <linux-i2c+bounces-14399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84268CA388B
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 13:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E152B303751A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 12:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9311E33D6F0;
	Thu,  4 Dec 2025 12:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IX47SdZ4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0B22EFDAF;
	Thu,  4 Dec 2025 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849883; cv=none; b=iOpsBTvtXpC/RCt7FMbEUlaa+GAsKT0lsoDzV4ItzYcbKkKPhR7V0TnG4CUlgNPJKzmsBQ67Cfi/kXy2kCd20fjOdnaQIqW6fqkcvjzR14HA1drcQAV0S4qy9Ma1Ffije3mMCv7Sk2L4YsQfGLdBQndS5NXaoR+v9fD/6omWgnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849883; c=relaxed/simple;
	bh=gahuY5j4rl/CtnfZX+Oxd0AZSKt23iPZjS1LKaxOyig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivc7+9SSRFJrSshrKkOSKEYfPkLWj8TLEqfOI/ZjMWcoJoV6BNzjICyyTbs6o1r+6CstVHH2oxU+am63liOGB90xh6KgMMx46qD3R4+vRi8/Ngp+c4bPqoOGufM6mzOPQgMoM+49/bf0fqajIWrtJx3FWOr3XXbMa+eLbMtRaUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IX47SdZ4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764849882; x=1796385882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gahuY5j4rl/CtnfZX+Oxd0AZSKt23iPZjS1LKaxOyig=;
  b=IX47SdZ4skGCKIIKzo9cPGloHmGv44xpb2txMWJ+IjhywGOU6Ye4QXKK
   KDdlyW+3xhQEn/9hqN5YatMfWlL1yAuxVqpqJSq/qGZt5k3i/+LNbMkkZ
   d5906be8tAV1djtEZLDKF9LsljnmUtpGOd53yhhoRg9aMcInD74vrmcod
   iS72cwV9fDcIiFrYcmeRUkkh+VC1q0EUOXMT44acjYhK1jeoAsO147JeP
   7wkKT8+UzfDYhlfoSa4NDfeZHxCxuq9MSBy1MP4m+ju6AU01aGgpudf+3
   8OIrhXOh6/BRbA8R89SvCz3Hc4Pd+Z9pfPCrrOLoVoBfJXoJ3+/rRzSnz
   A==;
X-CSE-ConnectionGUID: UxducDefRS2Mm1lqYtJC/g==
X-CSE-MsgGUID: qzoMTSYbS4Goz3uNuBZcjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66941073"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="66941073"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:04:41 -0800
X-CSE-ConnectionGUID: XZTvr8laRxiwi8TbSrRJzg==
X-CSE-MsgGUID: mLq186wHTMKddEFlXQFHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195777812"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:04:36 -0800
Date: Thu, 4 Dec 2025 14:04:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <aTF40eLT2YTB8OoO@smile.fi.intel.com>
References: <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com>
 <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
 <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
 <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com>
 <20251202102619.5cd971cc@bootlin.com>
 <088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com>
 <20251202175836.747593c0@bootlin.com>
 <dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com>
 <20251204083839.4fb8a4b1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204083839.4fb8a4b1@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 04, 2025 at 08:38:39AM +0100, Herve Codina wrote:
> On Wed, 3 Dec 2025 12:11:45 +0200
> Kalle Niemi <kaleposti@gmail.com> wrote:

...

> Saravana's email (Saravana Kannan <saravanak@google.com>) seems incorrect.
> Got emails delivery failure with this email address.

According to the Git history his last activity was in August 2025 with
adding (surprise) his name to one of the MAINTAINERS records.

And according to lore, his last message was in October 2025, so I dunno
what's going on there.

-- 
With Best Regards,
Andy Shevchenko



