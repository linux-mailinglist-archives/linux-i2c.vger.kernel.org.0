Return-Path: <linux-i2c+bounces-8141-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B49D5BE4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 10:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C2EE28388C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FC518B47B;
	Fri, 22 Nov 2024 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0pT/eDI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9CE188588;
	Fri, 22 Nov 2024 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732267565; cv=none; b=qXZgV7Czxs34vFAw8OOshEkVhhBYL+RASvM42Yk6hiL3KOjwre4AbLYsQTUs0PBw3ZbaymCQ7jHK3gW/EtjKujmkdC6aWA+RCOVSDH0uvoBcu9lb5ELgRKHE5KpQOj08oTpxX2nF5G26LgTwvVdpAj43cGOXjwCREmojlp5AfDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732267565; c=relaxed/simple;
	bh=ItK2ieHOD3jQaFeBtBu3mIhcXZKeSTp7iS6aSNZ58cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VU68UGSmRvZBnXWUOOLjPSJ9ZK5gBJA5l0ZFj4Erf1fLnCAyfQEAaPBCJIv9hysCS1lrWI6vQa5fyR09loDSB85bAEXHmTSVkjVgofS0U4h6Pa5+ff+/8ZsiuxtESWd00VuoWvf99vCO4A46J71bCCAlfBARR1DOqxh9cnsDQ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0pT/eDI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732267564; x=1763803564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ItK2ieHOD3jQaFeBtBu3mIhcXZKeSTp7iS6aSNZ58cA=;
  b=B0pT/eDILiRoNvMBobVtJcLGJ8SFAwMfpA+GKhZr0pjQG2PcWzW+degk
   SJSPyzIvPO98+nxJmNgxjNth+1I8irc0aWvMdP6CQwZBKpbETyRtChmxN
   kezR/17ssXFp0tuvsSMScNf7/Z5WY0QCfnz5FQwLsCt3VfSLM9UkBx6xZ
   wAPJnKyEstIjGR92v3hH9l7nWFfcbXQ6cCBIDLNqaTNcpS237QRhV2UCj
   ci5GP4cpN1O2zw3rOB0jxoKx1jAiwkOWpfnabx6qJEOzYYcEQcUlDzBVB
   NBfXOcDKTMhPU29AZtKURV5Oyx4x0YDPoqcUKPamQSbN8R1GPaWxMug4H
   Q==;
X-CSE-ConnectionGUID: MpeX0wOaTjyEAJNZiTDDCQ==
X-CSE-MsgGUID: 18DBjMQqQa+DasMATzgDqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43065134"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="43065134"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 01:26:04 -0800
X-CSE-ConnectionGUID: h15QkogKSUy8CGiWmktVWQ==
X-CSE-MsgGUID: wxlK1Wf6QxiUB1Z/22hjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="95317910"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 01:26:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tEPvK-0000000HMdE-1Zsh;
	Fri, 22 Nov 2024 11:25:58 +0200
Date: Fri, 22 Nov 2024 11:25:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: atr: Fix client detach
Message-ID: <Z0BOJpCV22nzZgHS@smile.fi.intel.com>
References: <20241122-i2c-atr-fixes-v1-0-62c51ce790be@ideasonboard.com>
 <20241122-i2c-atr-fixes-v1-3-62c51ce790be@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-i2c-atr-fixes-v1-3-62c51ce790be@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 22, 2024 at 09:51:40AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> i2c-atr catches the BUS_NOTIFY_DEL_DEVICE event on the bus and removes
> the translation by calling i2c_atr_detach_client().
> 
> However, BUS_NOTIFY_DEL_DEVICE happens when the device is about to be
> removed from this bus, i.e. before removal, and thus before calling
> .remove() on the driver. If the driver happens to do any i2c
> transactions in its remove(), they will fail.
> 
> Fix this by catching BUS_NOTIFY_REMOVED_DEVICE instead, thus removing
> the translation only after the device is actually removed.

...

> Fixes: a076a860acae ("media: i2c: add I2C Address Translator (ATR) support")

Fixes should lead the patch series, and other way around.

-- 
With Best Regards,
Andy Shevchenko



