Return-Path: <linux-i2c+bounces-14402-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D19AECA3924
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 13:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B00973038992
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 12:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3DF337100;
	Thu,  4 Dec 2025 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbHE4R6L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D7D2C11D9;
	Thu,  4 Dec 2025 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764850365; cv=none; b=h9prbazaLNEpCZugv/r07YTph8Nm1mXW/gSAyidKpZSvWsKxDhHW0oKKm1E0lmJcvuDt8TTqNQAndfkSESQ30L7Ze4RZidAb2oSTOWRGPZGqTj5su7t6sOaSsj4Qj3oHwpOMtLwj+ftG1DsESKK9XRCP2fawrpnVWbBbtiK6KN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764850365; c=relaxed/simple;
	bh=MnAsG6ePRRJOpRDDMoEq6lV+mx4w7j/CGerPufzXvZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sg+4YXoz3wTGasPb45VOY8WS1j/XtnLo6n27L83900MqRUhfIqIW3WmCOglEAvUFzb8F1a4S7uIRteIWsqFsf4j+Jb5INQZrSUfmviC2Flqq/3z8wKdd/lOT1Hao1kBjS/6IEaodcwY15UJJyRWJ5JF4ArcM6TF4bg0peWw7smA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbHE4R6L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764850364; x=1796386364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MnAsG6ePRRJOpRDDMoEq6lV+mx4w7j/CGerPufzXvZA=;
  b=FbHE4R6LeWW4TLXDo7290ZVISR5a6kfzqJDwL8voNqyv2uXh2+dh7Ntd
   7OSzL149jxS/Xi6BnmYAHQr6GWkn2XlO8vLofD4DVbeqrCX1eEd9Ww/BO
   crynXA2sUWZ0oj4o6yhBLDBj5lsRGpWo1n61SLBEBWbX42g/sEJfte4NF
   cUc6hXNJn6FVSSH1KTm2/oC4BEZXI496Zy94BV+mzn/DAq411VVw1VNyL
   S3Knr+vcGEXjZOJNMxco+ZLdHe8WpjP/JZd2zYcndLFotPQcgTfBG31H2
   0NWiN/rie+Ur1WtINTVPULU1ow0J7J6lXC/dxfwL3RkqY4mRZ7xskrA7j
   g==;
X-CSE-ConnectionGUID: YIlCGe0hThS3hc7Vq6TIoA==
X-CSE-MsgGUID: BqfBKswHQ3mT3IW2lt5C4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84261679"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="84261679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:12:44 -0800
X-CSE-ConnectionGUID: VysdT0kbQQe6IHi8h7qaqw==
X-CSE-MsgGUID: rWTkQb1lTL2tkwP3FKwIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="218321466"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2025 04:12:42 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F01F2A9; Thu, 04 Dec 2025 13:12:40 +0100 (CET)
Date: Thu, 4 Dec 2025 13:12:40 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Replace magic numbers with named
 constants
Message-ID: <20251204121240.GD1613537@black.igk.intel.com>
References: <20251106110935.2563071-1-a.shimko.dev@gmail.com>
 <20251204114129.607200-1-a.shimko.dev@gmail.com>
 <20251204120036.GC1613537@black.igk.intel.com>
 <CAOPX747Y9Dbzdn2PfSU3wqce5iFx_XfJJa+Zoq30iEsgJCRdPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOPX747Y9Dbzdn2PfSU3wqce5iFx_XfJJa+Zoq30iEsgJCRdPQ@mail.gmail.com>

On Thu, Dec 04, 2025 at 03:07:55PM +0300, Artem Shimko wrote:
> Hi Mika,
> 
> Sorry about that, I'm a newbie and might make mistakes.
> 
> Yes, I'm confused about the versions myself, and yes, there is a v3.
> 
> Am I right? Even though I already sent it in response to the kernel
> robot report, would it be better to forward v3 to a separate thread?

Just send the next version (whatever it is, v4?) as a separate thread with
proper explanations what was changed under the '---' line.

