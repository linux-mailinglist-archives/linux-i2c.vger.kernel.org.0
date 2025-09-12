Return-Path: <linux-i2c+bounces-12919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D14B54D62
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 14:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E7F817BCFD
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 12:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166CB30B531;
	Fri, 12 Sep 2025 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8FxDA3b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356CB305077;
	Fri, 12 Sep 2025 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678987; cv=none; b=PKGMi9IXQVaw1XaK195gTlia329SQZpwIidJ2GYKMEq0e2AcI5ugw2ElHtMklPOzlMwzZcwErYX+QZJhj/dH/mM9nLy31MFe2jcdaMyhANOWpV8YOPVrTb+O1WnpZFG3soBA0sp3RFuTeGnWyqrZZ9sHSVJiM2DgxAHOIuFRESY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678987; c=relaxed/simple;
	bh=4Lk4cMBKRbPdswOwm0SI6sabxZ3fYPsctB9YRqZn2Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVim1ekQ5U3+ppsKPdStg5XEBxRZu5w/kVB/DWI6DFYhqojn9kEKMQEypkXu8ofuwMjiTvqf7aA8Q6LGKYL5RIBjKLeiemgfIWUkAA6052iKuRxuXXzLn9Zokl2Q7lHxZK7qoLgm7GeEykzruTJQEKuG7YOe/GS57/UXB6O2vqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8FxDA3b; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757678986; x=1789214986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Lk4cMBKRbPdswOwm0SI6sabxZ3fYPsctB9YRqZn2Zo=;
  b=O8FxDA3baI+c23UjW5eURY98OzXSffWvoUFlbIbLDvd1I6AT5Q07uVZx
   fENkrSIhcF+2CXdsEN2f1QKZvgdny1tWvIAgKRWE5K5/oSh0ccALqvNcG
   e4ugA2qWA+NctgYGWrRVVgSLL3RHoRrel10Lvn5lLt3MUc3Yy/SpcgU8I
   FtSmcNFEaK1qv13QJkWmV3HsUW3Z9Ll8S3qpi2ISqx3xXDCXFK8PFlcP+
   iN4ij9wh2jRVNCrEQP+8Af/kNbHIEHbcH3HWxV0coc2MlllhcGgQQDVIk
   CSTQZld7gA6RTHP3Iydu8wmCwxAmnBQ40iDVifUh9tZi2/IlHCfpZM8LJ
   w==;
X-CSE-ConnectionGUID: vgjOAQ40QT6kQNjSp3Znig==
X-CSE-MsgGUID: El0QwyBFQBOAbyWQHYmkUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60132348"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="60132348"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 05:09:46 -0700
X-CSE-ConnectionGUID: B+sW/CnzRoeebkyqBeVwMw==
X-CSE-MsgGUID: DyJnN4UHSXacKqnwmFv9Hw==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.159])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 05:09:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 248E311F785;
	Fri, 12 Sep 2025 15:09:40 +0300 (EEST)
Date: Fri, 12 Sep 2025 15:09:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 0/3] usb/gpio/i2c: Add Intel USBIO USB IO-expander
 drivers
Message-ID: <aMQNhGRlxDdE5MQu@kekkonen.localdomain>
References: <20250911181343.77398-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911181343.77398-1-hansg@kernel.org>

Hi Hans,

On Thu, Sep 11, 2025 at 08:13:40PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v6 of the patch series to add support for the Intel USBIO USB
> IO-expander used by the MIPI cameras on various new (Meteor Lake and later)
> Intel laptops.

For the set:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

