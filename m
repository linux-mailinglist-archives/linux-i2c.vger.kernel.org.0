Return-Path: <linux-i2c+bounces-14179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A7C70FDE
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 21:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 0D8FE2BD8C
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 20:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE6B36214C;
	Wed, 19 Nov 2025 20:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVYvJxcC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FC1362143;
	Wed, 19 Nov 2025 20:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582726; cv=none; b=abVSDPt3jlmVuCfpvqFBRt6hRKEYtm+OrwjvQUVU+5auWXMnVOXpGU94agoUVd8btqbbBqT9WQbkXLhw58T1RwJ/jaAjx6S/IGQ/nx35Qety/uwZd2EILk47wB6s2I+q0e36eRQWk4BKU/4VBO/fFcJlSFJHxBI62f6hTTu/1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582726; c=relaxed/simple;
	bh=58JJAYBmhecOlIksKrVjKgMTdqA1OoMhJ2vhGxjvb8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/86OxomtttYtwwFhOlGxNJPT+oiH8cGzyAYEg/5mkO6F/f8U+HN2tU4c9h03/uvIDrCWyNSNedo7D9q3sREgT7CEK3ZkrVGMV2g/yHDVC+OuAJnlXvvHpydb5GOFNCV01Mv/98t6X3tVVEwDk/EMnk+frtI8ZheGPkGf4m2PRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVYvJxcC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763582723; x=1795118723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=58JJAYBmhecOlIksKrVjKgMTdqA1OoMhJ2vhGxjvb8M=;
  b=DVYvJxcCRa5e0IcxJzUzrYchgkV0qq/HJvv5Tiy9H8qUfHaXP8pJrL0g
   01IaPWek9+9sUSYk564lSTqBfYQA1cSBKoJ6bIJRttNaMxycjuEE34wIO
   tlOyxS8Yr/LEcyxOLcN5ij3hsElYNg0Go8S4ZUqWNlQXo3z0MTc2puwfD
   5KCUrvBeTf60H97cy6gvoDnkH3TRsWuXZgXM0Dvw5C7QwbHVaN5gD4yQ/
   LvrwBo4R6DetCZKn+d2C5sJbTNxO/gcA7zg/n1RODFmFR/5cQC1dBStrL
   u6UTflx+qb2oggUU9GxRgaFmvcfbzJVQCVUj8J48h/0enGGJMQjp1IYBV
   g==;
X-CSE-ConnectionGUID: Em3bm5CQS76txmG2tictwA==
X-CSE-MsgGUID: kkOqAqv0S0WW3OkM60V+sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76316298"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="76316298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:05:20 -0800
X-CSE-ConnectionGUID: 5SBGXruOTRuhCotE2+SCrw==
X-CSE-MsgGUID: CjKn2GOnS166hy9Ak2Y1SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191955972"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:05:16 -0800
Date: Wed, 19 Nov 2025 22:05:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 2/7] i2c: designware: Optimize flag reading in
 i2c_dw_read()
Message-ID: <aR4i-fnWPpnhBHaQ@smile.fi.intel.com>
References: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
 <20251119-i2c-dw-v3-2-bc4bc2a2cbac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119-i2c-dw-v3-2-bc4bc2a2cbac@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 04:05:31PM +0100, Benoît Monin wrote:
> Optimize the i2c_dw_read() function by reading the message flags only
> once per message, rather than for every byte.
> 
> The message flags are accessed both in the outer loop and the inner loop,
> so move the declaration of the local flags variable to the outer loop.
> 
> The message index is only modified by the outer loop, so reading the
> flags in the inner loop was always getting the same value.

OK.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


-- 
With Best Regards,
Andy Shevchenko



