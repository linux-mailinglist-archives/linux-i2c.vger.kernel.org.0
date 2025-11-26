Return-Path: <linux-i2c+bounces-14294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E5C8B71A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 19:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C0F9035A2AE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 18:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB141313E0A;
	Wed, 26 Nov 2025 18:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQ3dkFer"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58B727CB0A;
	Wed, 26 Nov 2025 18:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181706; cv=none; b=YwpwOd4CRvhNWCnkFpAo5CKKPmch01x0sD3p2rHNJvTOTxiWIf1K5Mw3G1J+JnFit15VCdM3xR6p5gt30WeJUd+08HMrm8q5yZ42Q9bnmENn21Zwbrl5avfZQd0P0wNSRkT3l6QfuNLxZQL6uLg7KqqN27LyQfuTnW3CAA1nF4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181706; c=relaxed/simple;
	bh=9PaOuOjuYEuXxRzPfpKCOkThJNqxqVNddLBj7jZPYwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHnfEOyFMQcU8ghNjo/mAdXvlGAe79JtbG0oUu5RF9nZnPnNjanWPQugr/pV1DJg4TBe+1cbKZZuPo7ECCv0s8+gMP74GPfu13h9SfOUUPcF76CM5pN0voDyP6zyrsWNoi7U0TXiicIRHBK2z/IHE7VR25/hIhmas2gCkdGt/T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQ3dkFer; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764181705; x=1795717705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9PaOuOjuYEuXxRzPfpKCOkThJNqxqVNddLBj7jZPYwE=;
  b=dQ3dkFerTucdRWOdjcbTyJUHhsC8cxTMGi1Do7s7EOcGxh9BHT/7sNwf
   ki8STWBQQM7qPUevU4lhOatIqzsJpuS6jWko6qWLgobFp4LaxfsblfK0U
   J+tXd6oXg4Y166qWBSePTujcJvUVOucvriBK2r3T7QQG6xCBLZhGk9JN+
   jiq7QTVJl6JsqE7d0mdpnplQYL8uQdD0kfKkT6ZlTipQ+E87j4efboC1b
   KWRWOMODNot3BVGJ0UnJ2XFciXGXjiAQxzqNIZkOuH1ab98C/H/WyIQRT
   cCuNvWN8k291SzroO15HIOpTbkuxdvtFzxDCmKpqtCGHWXzi3hfO6ddtR
   g==;
X-CSE-ConnectionGUID: 7emhnJhURVGvgBkarQEFow==
X-CSE-MsgGUID: CtS5FIbRRI6T/pz+H4iMKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76913871"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76913871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:28:24 -0800
X-CSE-ConnectionGUID: DRzNXZ40Rp61PBq0Mk/ChA==
X-CSE-MsgGUID: s70HQRf5QDuy4Jh5L6V/EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="223720315"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:28:20 -0800
Date: Wed, 26 Nov 2025 20:28:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Ethan Twardy <ethan.twardy@plexus.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Leo Huang <leohu@nvidia.com>,
	Arun D Patil <arundp@nvidia.com>, Willie Thai <wthai@nvidia.com>,
	Ting-Kai Chen <tingkaic@nvidia.com>
Subject: Re: [PATCH v12 3/3] HID: cp2112: Configure I2C Bus Speed from
 Firmware
Message-ID: <aSdGwZz8E6CRd8uv@smile.fi.intel.com>
References: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
 <20251126-cp2112-dt-v12-3-2cdba6481db3@plexus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-cp2112-dt-v12-3-2cdba6481db3@plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 11:05:26AM -0600, Danny Kaehn wrote:
> Now that the I2C adapter on the CP2112 can have an associated firmware
> node, set the bus speed based on firmware configuration

Missed period at the end.

With that being addressed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



