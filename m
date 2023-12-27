Return-Path: <linux-i2c+bounces-1020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9214181EFFE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 17:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3CD21C21959
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 16:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9281A46441;
	Wed, 27 Dec 2023 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foh7IH6s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECF245C06;
	Wed, 27 Dec 2023 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703692909; x=1735228909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qIi6/FGG1XhIsYOH+tdaJ+Cr8i/oTUD6GGfo2SnNl+w=;
  b=foh7IH6sUAdPK/7HQUTa+ZATl0wbkaH0hNlnLWM/mrHpnUOt6y8gzDcI
   Zvc2ZkfrjbdoTVzLSYy1ULKMpTZXwU6UqD77GCdCDa3ZRJEA9mvZoWrgK
   2WeM28kqsVQIkJmq7iagS9g+yJ9frFFvqD3Q5zCWmjaxXizomr3BDjaRL
   Y6a6+RLHVGzGKiW0ltbS4J3ADbIsFf7wtlubDDOo8V19Whaz/fbFHO7Cd
   f4g37rLKVPiL18jMyG8fzS0o6K+iL63YCMnzvovtLQzqLVLnue8JAklkG
   p8pXqV8uk55BAQUp2JgZjzK0kL4Km+tIrW1AkmihYULMfjUWb6PgwtUv4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3745327"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="3745327"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 08:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="951530427"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="951530427"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 08:01:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rIWLk-00000009SPM-3mSN;
	Wed, 27 Dec 2023 18:01:40 +0200
Date: Wed, 27 Dec 2023 18:01:40 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/22] Improve IRQ wake capability reporting and
 update the cros_ec driver to use it
Message-ID: <ZYxKZD4IMJH_QjQW@smile.fi.intel.com>
References: <20231220235459.2965548-1-markhas@chromium.org>
 <ZYRAuY1LGdD8_u5K@smile.fi.intel.com>
 <CANg-bXDw+bYNTu-HFaNAPb4e+_oKt2ExR6PehWR_==vpboKGaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANg-bXDw+bYNTu-HFaNAPb4e+_oKt2ExR6PehWR_==vpboKGaw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 22, 2023 at 03:30:43PM -0700, Mark Hasemeyer wrote:
> > Just wondering if you used --histogram diff algo when preparing patches.
> 
> Not knowingly. I use patman which uses 'git format-patch' under the
> covers with some added options:
> https://github.com/siemens/u-boot/blob/master/tools/patman/gitutil.py#L308

Add a configuration into your ~/.gitconfig (or local for the project),
it really makes the difference.

-- 
With Best Regards,
Andy Shevchenko



