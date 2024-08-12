Return-Path: <linux-i2c+bounces-5314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B6A94F5AC
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 19:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 476EA1C211D1
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 17:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33E9187874;
	Mon, 12 Aug 2024 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PghSwiun"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F2318784F
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723482795; cv=none; b=P+U0gGIUKzwAGMOgvu7JDtxkllEmnJCC78PaBNt9/qXOUKrDJ6YA3dstFL5ePK5H+XefUdfc/FdaVUu0ViORyd3eFRdZUq4EHuQlDTw/TcbJ4uRRQXtNnhDm6xdRmGFz4TApPK3n2cP0QCgfQNSofcw10nEBH1wydz6CY1z5dA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723482795; c=relaxed/simple;
	bh=RsABGeDtuPGyoFhCf7GJz2J9HzEmeJ8H1I5hvJLzGNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cb8NDJA8c3s62HjgHbwkSIoWvx36eCRqkmevYG2vkHnbjMGo7fJ79YM1gWyCdq8MwDE4TgaM6VBsUElWuGgwAe7LsDb54U2p2AZyHtAYI/E8cyXeoxvTb9+gv1/KhanLKEKkuqEsa893P9k18YHcYgyrqPlso9xYlPUjInudc3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PghSwiun; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723482794; x=1755018794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RsABGeDtuPGyoFhCf7GJz2J9HzEmeJ8H1I5hvJLzGNY=;
  b=PghSwiunpZzSmiDNf7HFNOQWewmkVEfg+TafyzVU8Zl5N7k9xUdv1z+u
   FlCqYHlDvBcXssQzaUUPPmC+mTpgGI+l/JkpqkvmSkoMkhzugLRO66IR7
   lBXW+QlFIo0YikVLbMLpkwOSRlKkpI8N5DEibJnTPusIIg3JFE4Dsj9QG
   5H3P8hLoGwDen/MrNl+Dqu9gD4c87baUqtwUZJ+F9GXsUkuKQ+aZOBmH7
   JEFMkNH4I+DCzlpTIYBati7nZ5EybnDHSURVcIQcdYZ1MVjdsB7QHpEvr
   Ohqhds3hQ2m51PdJpoUCJfeNJuHebIx59nZej6ZB1I7TsHL2mb6D//v0+
   w==;
X-CSE-ConnectionGUID: TBg/eYr7Q9yM/tnaff/oog==
X-CSE-MsgGUID: 4SNMBddqTmG96Am+BH46Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="33009027"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="33009027"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:13:13 -0700
X-CSE-ConnectionGUID: gPTw32NqSoKCLFChiMJr0g==
X-CSE-MsgGUID: OyxgvOmlRPCSeTMV88VMMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58277440"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:13:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdYbU-0000000EQNS-1d1e;
	Mon, 12 Aug 2024 20:13:08 +0300
Date: Mon, 12 Aug 2024 20:13:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Adrian Huang <adrianhuang0701@gmail.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	Adrian Huang <ahuang12@lenovo.com>,
	Dong Wang <wangdong28@lenovo.com>
Subject: Re: [PATCH v2 1/1] i2c: designware: Fix wrong setting for
 {ss,fs,hs}_{h,l}cnt registers
Message-ID: <ZrpCpLYzCBTx0Mz6@smile.fi.intel.com>
References: <20240802130143.26908-1-ahuang12@lenovo.com>
 <di6c5rvbjapddcndjs7jzqia3nki2qzmzrsmutldi4q55wile7@yyo6be3s57zj>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <di6c5rvbjapddcndjs7jzqia3nki2qzmzrsmutldi4q55wile7@yyo6be3s57zj>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 05, 2024 at 07:26:55PM +0200, Andi Shyti wrote:
> Hi Adrian,
> 
> > Link: https://lore.kernel.org/linux-i2c/8295cbe1-a7c5-4a35-a189-5d0bff51ede6@linux.intel.com/
> > Suggested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
> > Reported-by: Dong Wang <wangdong28@lenovo.com>
> > Tested-by: Dong Wang <wangdong28@lenovo.com>
> 
> At first I thought that we need a Fixes tag, but on a second
> thought I judged this more as a behavioural fix. Please, let me
> konw if you think we want to have the Fixes tag here.
> 
> Meantime, I'm going to re-arrange the tag section. It's common to
> sort the tags in a chronological order:
> 
> Reported-by: (it first gets reported)
> Suggested-by: (then someone suggested the fix)
> Signed-off-by: (then someone implemented the fix)
> Tested-by: (finally someone tested it)
> Link: (as reference)

If you use `b4`, you may configure it to do this automatically and keep nice
with contributors :-)

-- 
With Best Regards,
Andy Shevchenko



