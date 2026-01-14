Return-Path: <linux-i2c+bounces-15153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E13D1E95A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 12:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4C453098460
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 11:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB9A396D02;
	Wed, 14 Jan 2026 11:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+FSn0eo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EDE396B86;
	Wed, 14 Jan 2026 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768391446; cv=none; b=P7ZRYVd4NwBavFrqVi7ITLOohkmxCxPDSONV2ki+V+tYo6+1ODJK6sKjJuf0JwZGtqcCNfMsKggxuU+khmJTuooVFXrxWhJN5c9yejkYKjZkG6izRf92cEMph34IASp7cCJUA0Y2Gex5Vm1Y1FF5YEHigTDpUVzToU7sIkJQHRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768391446; c=relaxed/simple;
	bh=GBlMuggDGXTGPhYF2Q2+FoyQujeKfhWC3g97GdQy/lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buJDMFXlGroxNmKYN9HgrD82iHucuz24BpTcQ0zY8zM+3JUBg6DWfUGSGBTTaIjqALJG4j8Gt3CEHoEZ9yeGj09xUC520W4lisXYpleJoviA6o/SCi170C6rhDOkKEFj59xWgxHjdOO0h/pz7KTpNimOTpeMknNT+QBnlpPvW3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+FSn0eo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768391445; x=1799927445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GBlMuggDGXTGPhYF2Q2+FoyQujeKfhWC3g97GdQy/lo=;
  b=H+FSn0eoTX91TghmOsE2AjPnOcIL5QHr5mPMpF7b6DvwwlkU36rHdbgO
   8lD8cCXdUTg4Gqhim84zENsIg0wFyhI9pRrAAd+7DlHPkBNTzc4lIl4b/
   gsblLSlPKFa3iq17AOfG7DrVw1BGhbjudy7D7HBJPQOQJ5BQdzXYk2z+8
   zn/BX7jD++ymUkhD67harcp7Fa+VGi9VYZxLamzxqo1NrCcj1xJTBWB84
   GDJ3JVvwQf4vXC5Yz42s7SEMcVMdIKkcGB6lTHmHvOvSA2GmeJqXWRrhD
   D56SP7e/pCDKlr5p/fgRVriTRf5WLSPP4jpgCss81U8z/Mbac/4M10ZxZ
   g==;
X-CSE-ConnectionGUID: rSybX7mzS7aZp4s+6kY3kQ==
X-CSE-MsgGUID: llp7y/DkQPqoht1RPLn/pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68695418"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="68695418"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 03:50:44 -0800
X-CSE-ConnectionGUID: pXjaaUf/SyuuUewDl9IT8g==
X-CSE-MsgGUID: B/Z3HUYPStmf60lczegGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204938772"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jan 2026 03:50:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DC39798; Wed, 14 Jan 2026 12:50:41 +0100 (CET)
Date: Wed, 14 Jan 2026 12:50:41 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 1/2] i2c: designware: Remove not-going-to-be-supported
 code for Baikal SoC
Message-ID: <20260114115041.GB2275908@black.igk.intel.com>
References: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
 <20260114081954.252160-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114081954.252160-2-andriy.shevchenko@linux.intel.com>

On Wed, Jan 14, 2026 at 09:17:50AM +0100, Andy Shevchenko wrote:
> As noticed in the discussion [1] the Baikal SoC and platforms
> are not going to be finalized, hence remove stale code.
> 
> Link: https://lore.kernel.org/lkml/22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org/ [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

