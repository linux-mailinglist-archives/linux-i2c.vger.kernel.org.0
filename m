Return-Path: <linux-i2c+bounces-14178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D44C70FD2
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 21:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 7B73C2A9F8
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 20:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92C03A1CED;
	Wed, 19 Nov 2025 20:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gj/Wmohu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21563A1CE5;
	Wed, 19 Nov 2025 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582680; cv=none; b=minR8UkT9CaIFxLSbhP8IEGbl5LAqEOakbeAdAMz7K5FU7l/NDtsSF6Hny36lY0aw3IAgJgCrbSHrsZ190o5NTnLT7pfHu4eMH+Nhn3LJFiz2rRNv8IbkRvQXbIJThq0fbwIWRMc+G5VsLlncDYsRtghRwnluF2mVolZf5jukHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582680; c=relaxed/simple;
	bh=WEbxpjKbtWe72oTqr6LGeatDqi6rM5YZifIOfTQecHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQCRGhbM/yJVNzBBwwOKz+q2Z/LOFvOvxmJfPYb2d/4rNJqzUXLmA0hByU6NaY6czedPB/0X69HySmX3X5hU8AdM/TS4/6Y5oqMswX9t32825b8dvjCJQlt7seHzNn/BHCpoj2DZPu4KysUuM3JVLMhXZuYKn4d1uPkLvMyLZdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gj/Wmohu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763582677; x=1795118677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WEbxpjKbtWe72oTqr6LGeatDqi6rM5YZifIOfTQecHs=;
  b=gj/WmohuRl1uU8oy326suoo83lTQYCDPCTILrjCgd1xVuOWNHpd5y/0h
   Ae4SqXhX1Wb96m4/nFVi5KWcnTdg8sU/crDe0uXx6EzSabRPG7NtFbV0w
   Tf/cRqcr52xSQ25Li0zqjAdYco7lIn1qdjt5K+7tCP4cGXzqafU0iptPn
   Ljmdl7gdOwYYRMGiaxXx8BjPJRgWcC5U1KEu4r3nb5jwXiZxuucBCl2ut
   feKIKZZADQWwk8SNHnQ8uqz7UEW7urq6bptDggy7wmVn6kQAmb+ZChs8Y
   LJsgcNyGePxfqeQpeihoWPJDPAZ/Gl3JbrxwU64QJUeWKsRnOOo1MdTSm
   Q==;
X-CSE-ConnectionGUID: KoV4FoxiSH6dyjYJCmQFWQ==
X-CSE-MsgGUID: Jv/zS8FnRoS32lLWGg8JzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69506708"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="69506708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:04:33 -0800
X-CSE-ConnectionGUID: 46sVf+ZwRzygMA7t4+tk+g==
X-CSE-MsgGUID: bMx3Heb2RFOuwS1Ceg9x7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="190410040"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:04:27 -0800
Date: Wed, 19 Nov 2025 22:04:25 +0200
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
Subject: Re: [PATCH v3 5/7] i2c: designware: Add dedicated algorithm for AMD
 NAVI
Message-ID: <aR4iyWZwX5Q5IiT1@smile.fi.intel.com>
References: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
 <20251119-i2c-dw-v3-5-bc4bc2a2cbac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119-i2c-dw-v3-5-bc4bc2a2cbac@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 04:05:34PM +0100, Benoît Monin wrote:
> Apart from runtime PM, there is nothing in common between i2c_dw_xfer()
> and amd_i2c_dw_xfer_quirk(), so give AMD NAVI controller its own algorithm
> instead of calling the quirk from i2c_dw_xfer().
> 
> Add runtime PM handling to amd_i2c_dw_xfer_quirk() and a dedicated
> i2c_algorithm for AMD NAVI controllers. The adapter algorithm is set
> during probe based on the device model.
> 
> This way we avoid checking for the device model at the start of every
> transfer.

Makes sense
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



