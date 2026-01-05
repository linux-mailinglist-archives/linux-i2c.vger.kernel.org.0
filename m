Return-Path: <linux-i2c+bounces-14905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42630CF5B2B
	for <lists+linux-i2c@lfdr.de>; Mon, 05 Jan 2026 22:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7D0C300CF33
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jan 2026 21:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FF6310764;
	Mon,  5 Jan 2026 21:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXTjXGWc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52532C11D1;
	Mon,  5 Jan 2026 21:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767649354; cv=none; b=h4Z/Q+D6BBqlWgYVzOZ6ntE5QUvXg1j6ddT6zDv8eE7eLUFjmeywxZdLcpSQRrnlk7BHE2KBL17wL4Clj0iIZGddwJwqQ9UopgUTF/IbK2ZwjE4JH74vn9kXZFEHs+DIYaw6gTj2IPuCNe3xnAGKIMNZ6KZXL03x8bA8wyZ0Jg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767649354; c=relaxed/simple;
	bh=aGTmcUYnP7dwKyNq7lgFI7sB9SI3ndPZ7vij+ljaSDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FffEFQ61D1i/1zqKN5zabA0natl0WxO41AbR9Gd9qOcvie4GLncj4Hwzuej39Yufyxhq/d8zk4PsyqZGvqs1IsuEuvN3F3wJIomO7anVjixGXXJesxyaFCH1fPPDRdcDmVFRbdpZRMMtmqHEvckQYwzDObWLKQuePHN9SUjI8t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXTjXGWc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767649352; x=1799185352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aGTmcUYnP7dwKyNq7lgFI7sB9SI3ndPZ7vij+ljaSDY=;
  b=BXTjXGWcYjdS7UpgHAjy/2IJD5BIKnzXSQeJv97v3MOO/FaHerEvCu8J
   DOMNFvWSmBXF4xEs5TQlIu6FgEVH4cax2HGva+rJDyw8u9zt03uIniIEq
   FUuP9yzUoDJ59aD4b4a40ZxEo4jyOAVGVsSFcRym5x8KlFp5WaLFppgFu
   j3IkugRgEsQ5GDZWSY3ut7bs0zCi4AAUa3FlR86QvAWqa+XOO3nsFyleq
   6XtYRRbneoczc/gO/nxYyl/IrIN7IcJ2ZXewB87sd5lndR8m3VvclL8lB
   SSIeaeGAoiukbwlWigBCepiyUktOi6aUMW2uusQcC9hO5KGJI3f+uZ1FT
   g==;
X-CSE-ConnectionGUID: B0DdllNDRMWeeonV8yrN5Q==
X-CSE-MsgGUID: 9bonlexcRsCrwRstJMrdjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="94491611"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="94491611"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 13:42:31 -0800
X-CSE-ConnectionGUID: epN9FTcfQPSvwCvrW2s19g==
X-CSE-MsgGUID: Hi4MbcP5RZ+6O/4NG/6sWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202387117"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.215])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 13:42:29 -0800
Date: Mon, 5 Jan 2026 23:42:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Hans Hu <hanshu@zhaoxin.com>, Bartosz Golaszewski <brgl@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] i2c: designware-amdisp: use i2c_adapter_dev()
Message-ID: <aVwwQpgaj0fYm1F3@smile.fi.intel.com>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
 <20251223-i2c-adapter-dev-wrapper-v1-4-bcf960a48fa9@oss.qualcomm.com>
 <1622683f-6afa-4743-8a93-ba49b38c6f95@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622683f-6afa-4743-8a93-ba49b38c6f95@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 05, 2026 at 02:26:06PM -0500, Nirujogi, Pratap wrote:
> On 12/23/2025 5:08 AM, Bartosz Golaszewski wrote:

> > Use i2c_adapter_dev() where applicable in order to avoid direct
> > dereferencing of struct device embedded within struct i2c_adapter.
> > 
> > Signed-off-by: Bartosz Golaszewski<bartosz.golaszewski@oss.qualcomm.com>
> 
> Acked-by: Pratap Nirujogi<pratap.nirujogi@amd.com>
> 
> (I'm assuming Andy's suggestion to use i2c_adapter_set_node() will be covered
> in the other patch series)

With that done, this patch won't be needed at all.

-- 
With Best Regards,
Andy Shevchenko



