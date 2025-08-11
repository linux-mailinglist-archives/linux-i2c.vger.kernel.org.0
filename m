Return-Path: <linux-i2c+bounces-12234-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE27EB20405
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 11:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3B4D189CBC8
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 09:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6922E2DCF71;
	Mon, 11 Aug 2025 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4MQjfAK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8029F1F4E59;
	Mon, 11 Aug 2025 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754905409; cv=none; b=syYXrp34HTqnbUbVr+dIYogW4XocFpdmcsSxgblUdbHrg6U8oCAlJ3DpHhTuneOm5M7xW+99UyHJslz13S3D9uYgnVJgD8M6vF0y4ZFiUukrQcoXc1wpVC26ro1CnaM46v+qPXW8nWTY9nW/nRlNFPnDyo3AArabYd57Ursiaeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754905409; c=relaxed/simple;
	bh=nQaHPoU6il1UcY7BDXGw5z/KwhU7gGs5uVYmNDNlRt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyzgF85MnEoRspKf+EqUbhGAOaYeunupRDc5Yqeyca1g+oz6d3gofUafNN/VaX7R2WH3b6+zsSFd40Ci7H4Zonq+XB3Y5qzTr4cdJUohqp2h5IDraAHQaw3HzmlbwR5FL47bSlMgRvr+VV90MYolvcjtyvAMLbmAADG/jorPG9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4MQjfAK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754905407; x=1786441407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nQaHPoU6il1UcY7BDXGw5z/KwhU7gGs5uVYmNDNlRt0=;
  b=b4MQjfAKN8JDQ7QUg+/sTKf3bsejvc6hHvaD1SE5GiE6Br93FodIPgL6
   NxBNDTL2dyQxSbBb+9QBSrQy42ABfKs6kny2O0mfE7zkdOpjm2w75tapC
   8hPxZ4314o+cBCarE/KbtP7uH0Yw350olmH9XRtpdU/f0BMDSUAV8vSdH
   G/2PtMpzxAjviRXD7qcHooNI2FITcZL4HsEBQV/rMAeY26uE/wIGPvMwK
   rVcqXEreg0TFjEPWcPIEQsaNRtvvWA4X+HZXjPWNCUlWWdQbhZGbLCpp9
   CxgyPbkl/Ji/HPiE8y07YEYT/o5IcTcO4fYwq9peMD+RnErSnjbPTzZL5
   A==;
X-CSE-ConnectionGUID: 34IRmuWFT+Glw1FbHdMo5w==
X-CSE-MsgGUID: a1C5CgaPR8yUUM0OufegcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="60998188"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60998188"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:43:27 -0700
X-CSE-ConnectionGUID: CHtzQZP/Tviy9AgmRgr9Jg==
X-CSE-MsgGUID: LFcUpoi5S3WYNVCgKVbHSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165519637"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:43:24 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D864111FC37;
	Mon, 11 Aug 2025 12:43:21 +0300 (EEST)
Date: Mon, 11 Aug 2025 09:43:21 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3] gpio: Add Intel USBIO GPIO driver
Message-ID: <aJm7OZCitvpkiD06@kekkonen.localdomain>
References: <20250809102326.6032-1-hansg@kernel.org>
 <20250809102326.6032-3-hansg@kernel.org>
 <aJmWyMP77X7j78Yi@kekkonen.localdomain>
 <3620126f-b6eb-42d7-bb40-f574e3c132dc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3620126f-b6eb-42d7-bb40-f574e3c132dc@kernel.org>

Hi Hans,

On Mon, Aug 11, 2025 at 11:23:50AM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> Thank you for your review, note this
> is not a full reply.
> 
> On 11-Aug-25 9:07 AM, Sakari Ailus wrote:
> 
> ...
> 
> >> +static int usbio_gpio_probe(struct auxiliary_device *adev,
> >> +		const struct auxiliary_device_id *adev_id)
> >> +{
> >> +	struct usbio_gpio_bank_desc *bank_desc;
> >> +	struct device *dev = &adev->dev;
> >> +	struct usbio_gpio *gpio;
> >> +	int bank, ret;
> >> +
> >> +	bank_desc = dev_get_platdata(dev);
> >> +	if (!bank_desc)
> >> +		return -EINVAL;
> >> +
> >> +	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> >> +	if (!gpio)
> >> +		return -ENOMEM;
> > 
> > All devm-allocated memory is released once the device is gone but you may
> > still have users. Could you release this in the adev's release callback
> > instead?
> 
> All GPIO users go through gpio_descriptors which are seperately
> refcounted. The GPIO core can handle GPIO controllers being
> hot-unplugged since the end of 2023 and guarantees that no
> calls will be made to the gpiochip driver after calling
> gpiochip_remove().

Thanks, I wasn't aware of that. This simplifies the client driver
implementation nicely.

-- 
Regards,

Sakari Ailus

