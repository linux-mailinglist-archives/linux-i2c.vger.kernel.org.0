Return-Path: <linux-i2c+bounces-14789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B52CDFDA8
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 15:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D8523010AA2
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 14:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9329731A7F4;
	Sat, 27 Dec 2025 14:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cU/xlPkR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D83F9E8;
	Sat, 27 Dec 2025 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845786; cv=none; b=K7aGZ+dGfVKgoziZ2h+o4CkudZ8g1EfYPU5QFJFEnERNyddKduH4dr51Qe2P8A/RO1ilcxIiJiPTBvDUnNZ2+NJ3oaMGsYAB01ku7YkEvnHUwdRIXTf0ftHdmylkf9TE6gl/niK1Nr2f8ZA0/M6b+T7sBTnhuh+N/MknyuhMFUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845786; c=relaxed/simple;
	bh=qBvvZUA/uc+vipih6SXmKDrluaeQLYJk8K7CdoywDo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANGDl2CCEgO5dIG2haanuB0sxfpDiSkxRTpkvpExJMUIRXLC4JQR7xzjYolxvWOwbEvoD5tYkmQUcb7sp9/FzNt8cMXDNCN30TCjgYRs9bsBiKNSbg77qvQzqjqTIbEPoPxb3qoFce0P7Y6G+XPzDss8J5OPASth9Vhk8uPX7C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cU/xlPkR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766845784; x=1798381784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qBvvZUA/uc+vipih6SXmKDrluaeQLYJk8K7CdoywDo0=;
  b=cU/xlPkRICbSub4oLTbWveG4Yt2wAuSpEO6RICQRAdVr0/P2eZ42lmAw
   QrKfIFsAM3PEoOQlS1i+wThPrrAL7MqWczpTukqlPLfxcqz583eH9KVwa
   kew4Bt50CG9J1awY21uH3u2OIWQy2SJrLNtOsxXCcBPYkEN3NPDVoqtR4
   yQxVdyDAvdV+XM72snlHV5gIUe5i6dQ2+QwBcqeX13NpP7byBeQEseOMy
   l9iHst/Uv56ltbSJTRSJ3w17HOFsfjsa515MVwYDVtb7OZKR9XW+6SZbd
   04QJxJmYXli0v7GVXBucIZGgTXoG3Cg8g1miTJUUXAolCBRmnENKqh4Ud
   Q==;
X-CSE-ConnectionGUID: wFChVSJdQCa8zHaiik0/vw==
X-CSE-MsgGUID: LPh1FcC7TSGvMgU9diol8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79177585"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79177585"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:29:43 -0800
X-CSE-ConnectionGUID: L4XnsXXHRDaOJ5mQNly/RQ==
X-CSE-MsgGUID: ZxfrGjWXRwm0EQm8/uLnrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="237963422"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.211])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:29:40 -0800
Date: Sat, 27 Dec 2025 16:29:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Message-ID: <aU_tUUSucAQsi5mq@smile.fi.intel.com>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
 <20251223-i2c-adapter-dev-wrapper-v1-4-bcf960a48fa9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-adapter-dev-wrapper-v1-4-bcf960a48fa9@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Dec 23, 2025 at 11:08:21AM +0100, Bartosz Golaszewski wrote:
> Use i2c_adapter_dev() where applicable in order to avoid direct
> dereferencing of struct device embedded within struct i2c_adapter.

...

> -	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> +	ACPI_COMPANION_SET(i2c_adapter_dev(adap), ACPI_COMPANION(&pdev->dev));
>  	adap->dev.of_node = pdev->dev.of_node;

Why not just replace these with i2c_dev_set_node()?


-- 
With Best Regards,
Andy Shevchenko



