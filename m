Return-Path: <linux-i2c+bounces-6298-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA3A96EB8B
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 09:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA43D1F2422C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 07:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE29C14C5B3;
	Fri,  6 Sep 2024 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJcbLG5F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA9814BFA3;
	Fri,  6 Sep 2024 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606358; cv=none; b=ZpYy3848cEJPHxhSE8Ot2HcxZ9ueklWEYpmqwdoSx0lgHv60C4CohPw8x+UCJa1anULF8JuCwLmsvCQFkR/aRLzISoGQlL+LPhce61W8h+zei1ZQIlpk8XPh3aRFokO61xrN7t1cY7BpAO5yRFnoJQiS2XCHNGEMx1U179C7ayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606358; c=relaxed/simple;
	bh=dVXlY2CQZjw3wovtTePsEe+RaE/DrnzfEWVzXNcqTrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+FXCbTOePs2w8MqS4IOYPZ+nrWKtt98DeQ+qFY6Z/7jvr7QzG0ZtHMoczcM8WSVZchwqXNWPMZgwlK9Ag3cVjn4N+uJZzSAipCXYXYYodKuricPEKss5jplrNS3ttMsTyeolR8px6ZdmBFnWF6LCNmdEKW7fnmoxYaR8e2Vctk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJcbLG5F; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725606357; x=1757142357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dVXlY2CQZjw3wovtTePsEe+RaE/DrnzfEWVzXNcqTrY=;
  b=TJcbLG5FbxKLAvOS2OrI6Ip8Z/dfQQWOdohyHpF0FO1ZT+E9MmgmgT7W
   1kEEe1itoUr1ULk3PlJOb27YgaDS9cBD8DoOF3h09ITIsbVwR7pfvtDsj
   UkIafJ3TMXLaEwcoNcntkCYITwRQY2cNm9nUh7yrQxQgr+DcstNz1Zzyu
   R3xNdubNvr6eCW1Donz0oLl3n75roMInVig/8C5itiB9YJrMOtovAsyfj
   G5hfG/2+jlT6+FBta/R7kXBPfIlAAmtXbCdmQiHQN4csX80ZCJ5gJAdW2
   5nMogDWM28nEyI8j6+nkNy8NOCGXu5ygYHlt8Dsrx4GJP2R13SeysrFb/
   Q==;
X-CSE-ConnectionGUID: 3xp9zEuwRum0ukRBz5ekfQ==
X-CSE-MsgGUID: /3JVYteQRR2hd7+3A8hh2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24549986"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="24549986"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 00:05:56 -0700
X-CSE-ConnectionGUID: BTvgY2x6RkmbCnHykW5HEA==
X-CSE-MsgGUID: Q5fBvMFBRrKiq0+9Sw80aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="66200177"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 06 Sep 2024 00:05:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 36E4A48D; Fri, 06 Sep 2024 10:05:53 +0300 (EEST)
Date: Fri, 6 Sep 2024 10:05:53 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <20240906070553.GD275077@black.fi.intel.com>
References: <20240906065449.2897-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240906065449.2897-1-kimriver.liu@siengine.com>

On Fri, Sep 06, 2024 at 02:54:49PM +0800, Kimriver Liu wrote:
> It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
> IC_ENABLE is already disabled.
> 
> Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
> holding SCL low. If ENABLE bit is disabled, the software need
> enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.
> 
> Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>
> 
> ---
> V4->V5: delete master idling checking

Hm, why did you do that? I suggested to consolidate the two into one
function (if possible) not drop it.

