Return-Path: <linux-i2c+bounces-14871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CDACE94A8
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 11:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A58B23002952
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 10:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFED2BEC3A;
	Tue, 30 Dec 2025 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZFB13AF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2654D221275;
	Tue, 30 Dec 2025 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089003; cv=none; b=K3f5ZHIadFahuEVBwmC1+K3NpdgEZ7Ogpwbfy3B3jC9Xw+E1FCC0as5KO65XvAxRKOdSO7xJr348jTQVIoa0gjk6lNJDxMnmJZ/C0nJjWwJSYgQTa1v/UPHzInVTMuNsvQJrm6qgqck86vo3ZrO12uKxhXzdHH11IKSYu1n90/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089003; c=relaxed/simple;
	bh=dbrLnoCos2KhTQeGaNfzmtYkGs2Kc8xdJO2ZxVlPHbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpw9QRxcmEotkRnGexmJRB/p4UHUOwq+y7vRVaGs6cvRxRXXmGWthkEo22aPjLHQ2mLmwpa6BDiSM+z+MZDyAIh1ztVMQqfSUT+LpiMUjSE2tkPzo+UNzJRpwcU9gXwWWh5ikN38qkHpk6xWO6LKPsLf79u/ITkOuKwUdb/82hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZFB13AF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767089002; x=1798625002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dbrLnoCos2KhTQeGaNfzmtYkGs2Kc8xdJO2ZxVlPHbM=;
  b=dZFB13AF2X9j3XVFeDNOqT4dqp5qJ9nBAHPlwKk81AEb9MQL/TMMeEyf
   cFRArGEXsfWqKGK6Cr58SJd/V7PG+YFNqfXAT7xhMwy4VqZ9Vn8yo6XVs
   Xt7GetX34imePRc2jAZ0RVGYOoh12QVYUkEop2mKZUPS8KCebFbfK9HNj
   76RIbXGAE8cXQ38pZUNIDGgrBnRUAwg7yOBkkN+I/IlRNaiGgafx8d4Lh
   7w48KDpJJuTJL3jD7rZz0mw2bvzKrUIhxNgxgK2MvCBqpXHd43KbQhfb9
   7oIPBe4/L+SGhPKuEaHYRwJjT98aGnfihokeXePl4DZc9s5lmCv1fNPb/
   g==;
X-CSE-ConnectionGUID: UAD7tmiOSX+HtQt8FPlTzA==
X-CSE-MsgGUID: CjCIM2bqQKyJXoe0ZiRJWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94146484"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94146484"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:03:21 -0800
X-CSE-ConnectionGUID: Vl+V0eMOTDOD7telRYCN6w==
X-CSE-MsgGUID: JMk0PRSfRhi+zlUnyAqXWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="200937916"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:03:17 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DCAF8121D81;
	Tue, 30 Dec 2025 12:03:24 +0200 (EET)
Date: Tue, 30 Dec 2025 12:03:24 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/7] i2c: ljca: use i2c_adapter_set_node()
Message-ID: <aVOjbKkQwhY1Ec4k@kekkonen.localdomain>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
 <20251223-i2c-ada-dev-set-node-v1-4-2e36e0e785b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-4-2e36e0e785b4@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 11:06:51AM +0100, Bartosz Golaszewski wrote:
> Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
> This allows us to hide the dereferencing of the embedded struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

