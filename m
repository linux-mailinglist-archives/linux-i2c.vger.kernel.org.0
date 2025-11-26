Return-Path: <linux-i2c+bounces-14293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D18AC8B709
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 19:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B6C93354AF3
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 18:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD583126BC;
	Wed, 26 Nov 2025 18:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7yAZw2v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3613112B0;
	Wed, 26 Nov 2025 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181647; cv=none; b=Sm5s1J8iNQd/H/eXAtjmL6j40Ly0quaL9lA3vZhm532oHkDALG6dYtgLrOqxWfmvFRJtQsb2DZn+iP1moWIUAIUdEIARkkcZUVFcdy7jvBRUFkcsrG++EAPte2JVIhMq+H8Uc27YgvfEKmbQgx4q+ELUQPmK9itWrHKn5VKizAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181647; c=relaxed/simple;
	bh=FfVPogj/1+lHyheAXCCRrc4m0Rfk76hSvQ0OfFi555A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8EIdjmlrCzyHrf6C+DezzHFGrC1V1DmDVOnjHijJcyKnSfqgMqZ/+fIyW3drCXML/wXGIjdO0UdiVPduhFR3WI/mlM/1wMO8oKIDZfBrX55kvQmKDzy7loCqzCe4m2OaJo+iMoFQFLbwsRLEFmkxQk5pepH3AYScKEVIAH4pkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7yAZw2v; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764181646; x=1795717646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FfVPogj/1+lHyheAXCCRrc4m0Rfk76hSvQ0OfFi555A=;
  b=A7yAZw2v9/sxp67i8dDk+Gec+lJuYIrozps5gXydQkM2M19zl9vAdrO0
   iwlQW7N4aVr1IERp4ki0x6dgGFa42AIW6MqCaa4qNRqOxqFvB2to45wt8
   ToZnbPSnS1wEEdXpisgjSUg1IwX1F+7rxKIrM9PZhrteCIFe48seAMrL+
   qZVczUG6N9+cB1cklXcvrfM7FOaxfUwwYQ4/ad1rWRSooeeR97mRkxbd6
   JVGTnEJKqV1trhTfqv/GN+L37dzmWKP7Ik9xU7yUi6gzoQjRzlEmCoRcO
   EsevAmT4za39iYmKOvKhj4BQBwEPTf+eKw/4gQClvLW8V4MgkpJ72ttFi
   A==;
X-CSE-ConnectionGUID: sUtExrQMRS+62126qS4aUw==
X-CSE-MsgGUID: rWkdzx1QQpSuDvm+jqcsGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83835086"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="83835086"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:27:25 -0800
X-CSE-ConnectionGUID: 8Y+NjFOuSImZ3AeHOnT0hw==
X-CSE-MsgGUID: tLHv/rGMRZW44+dbWp2h9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192913605"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:27:21 -0800
Date: Wed, 26 Nov 2025 20:27:19 +0200
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
Subject: Re: [PATCH v12 2/3] HID: cp2112: Fwnode Support
Message-ID: <aSdGh3i_KYocE3L3@smile.fi.intel.com>
References: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
 <20251126-cp2112-dt-v12-2-2cdba6481db3@plexus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-cp2112-dt-v12-2-2cdba6481db3@plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 11:05:25AM -0600, Danny Kaehn wrote:
> Support describing the CP2112's I2C and GPIO interfaces in firmware.
> 
> Bindings between the firmware nodes and the functions of the device
> are distinct between ACPI and DeviceTree.
> 
> For ACPI, the i2c_adapter will use the child with _ADR Zero and the
> gpio_chip will use the child with _ADR One. For DeviceTree, the
> i2c_adapter will use the child with name "i2c", but the gpio_chip
> will share a firmware node with the CP2112.

Hmm... Is there any explanation why DT decided to go that way?

...

> +	if (is_acpi_device_node(hdev->dev.fwnode)) {

Please, do not dereference fwnode, use dev_fwnode() or other APIs for that
(actually the same applies to OF node, but people too much neglect that).

> +		device_for_each_child_node(&hdev->dev, child) {
> +			ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> +			if (ret)
> +				continue;
> +
> +			switch (addr) {
> +			case CP2112_I2C_ADR:
> +				device_set_node(&dev->adap.dev, child);
> +				break;
> +			case CP2112_GPIO_ADR:
> +				dev->gc.fwnode = child;
> +				break;

If by any chance we have malformed table and there are more devices with
the same address? Maybe we don't need to address this right now, just
asking... (I believe ACPI compiler won't allow that, but table can be
crafted directly in the binary format.)

> +			}
> +		}
> +	} else {
> +		device_set_node(&dev->adap.dev,
> +			device_get_named_child_node(&hdev->dev, "i2c"));

Here we bump the reference count, where is it going to be dropped?

Note, in the other branch (ACPI) the reference count is not bumped in
the current code.

> +	}

-- 
With Best Regards,
Andy Shevchenko



