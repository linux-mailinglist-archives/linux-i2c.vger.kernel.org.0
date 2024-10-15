Return-Path: <linux-i2c+bounces-7406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7C399F4C8
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 20:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A1281C2222C
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 18:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77C61F76D9;
	Tue, 15 Oct 2024 18:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9s6aWqE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16428691;
	Tue, 15 Oct 2024 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015460; cv=none; b=rYA5XawIENX2Vin+NulNXlToV1LGffI5/q1HV1DbTZVQQSFbBEXAIFMvRNjlXJ8cT0ML2vHf0Zz054S8+UG6jgM+KauXHNBveG/xfTpyd4shRqIN4dfDU0o3k67HwLjebZSy0cTfp0UUDNxooqUSXLPQCa/lRm7dH9gIHaSiYl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015460; c=relaxed/simple;
	bh=6d/cMzHxJYfxTVbJFM7CFUuaoh2hWWe4To4Wt5P9CNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuEk7Sr3ZTYJFVd0LqwKOQE+pdgyuVGFyZn3GGGaG6nqC/pZxoRDIO9Nb+ieTQux31MhBkrqbURII+Vm25DTgZPG0qUCS27BagvBLiS+moWpq09Z2cXov9rrryZil49Q7tsXq7tmopHHnqGjPj5nFK8h8AhkeURNgw5zQPPykj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9s6aWqE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729015459; x=1760551459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6d/cMzHxJYfxTVbJFM7CFUuaoh2hWWe4To4Wt5P9CNI=;
  b=c9s6aWqEAlCFpu/IF6U2Q5QKAhENo4Uq74P1be3Bd0QzTxxEDOGROGfP
   uzai7G7vKXnTqgijRgdjjC2m31zzR8JGQUh95Om/bJfwZGOyvMhvdyqfB
   E1L+oKeCjSlMLDXaYXuFiH5ie9cHTZ7W648B21AwkHkyTEki/OapakFMW
   JZV8CluTFljsvPwECSqql2CwJcBhPFw4xkVvqnzx6TFTEZVO1sZ0dnkVz
   G7cL8RQn5WRZVNkwvioQ3cZKzoPVmxkKLKVcx7h3Cqai0vLA7QVPcYuFP
   3LLYQ6vR+O1c4T/pMhnQTFmjIjBICdgzhgqMFUY/HZCdgUv+ElzERB8Ov
   g==;
X-CSE-ConnectionGUID: SN4KkAtkRKCoDh7BXIE+pg==
X-CSE-MsgGUID: 7h/xyCwFQmuxUQwjHYVoJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="16049546"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="16049546"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:04:16 -0700
X-CSE-ConnectionGUID: is6Ub5LHStGlZsxZl094aw==
X-CSE-MsgGUID: kLe7S2OPTkeUNN/dAT6Xxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="78318785"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:04:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0ltx-00000003Tfo-2pDg;
	Tue, 15 Oct 2024 21:04:09 +0300
Date: Tue, 15 Oct 2024 21:04:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 5/8] i2c: of-prober: Add simple helpers for regulator
 support
Message-ID: <Zw6umeIp3l-pfMSb@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-6-wenst@chromium.org>
 <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 15, 2024 at 10:58:41AM -0700, Doug Anderson wrote:
> On Tue, Oct 8, 2024 at 12:35 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > +/**
> > + * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
> > + * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
> > + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> > + *
> > + * * If a regulator supply was found, disable that regulator and release it.
> 
> nit: was the double "*" starting the line above intentional?

I think so. This is documented in the kernel doc syntax. This gives proper
lists in the rendered document.

-- 
With Best Regards,
Andy Shevchenko



