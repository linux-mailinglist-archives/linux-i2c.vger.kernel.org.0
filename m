Return-Path: <linux-i2c+bounces-5332-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 301C2950356
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 13:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62D231C2238A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 11:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047361990CC;
	Tue, 13 Aug 2024 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBzg76gx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C3560EC4;
	Tue, 13 Aug 2024 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723547499; cv=none; b=HIFpxzagwo+Qx6ptDMvIOTPcZUEsX325mGclCmYjo0uE2UZ3+Yx+X3LMn9rOVph8KALkv7lGvqP7tP9j3/IsMsaHtrGSvgrYMyAMgxFJJeyCp2qv+tx1qJkJ+njwQqKL6ONvUIXDyA6scMXEwMyF4E35ruqxTJ+XqDvqFEZMh/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723547499; c=relaxed/simple;
	bh=9CYbKupifRahOwQ5D4eldN4XFRGyx70KQdl2CNH2QuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5GKIgJbGuQNMkPIaDWwkKN83qapAgb2na/NYeGZWkjnkw6DUX4TF1VdXT8h/uy6pOzGEDaavPf7j0H7MMotuZkQOSIFc2g6/mboCPHi7ppZq2BlPb+ve7dnxDHt0DWe25gs3SiqPj84KtmMG3GL54Oc8OUBIIdB5ivKzpbJ1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBzg76gx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723547498; x=1755083498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9CYbKupifRahOwQ5D4eldN4XFRGyx70KQdl2CNH2QuA=;
  b=ZBzg76gxjyXf9DRtaIbX1d9IRK+YIgUUmKj/vcNYj9wKLdvXqk64l6s4
   T7oD0S3OdaEWtT/TcsZgJ1JJpGbW7Q6Fkh76Vkiuus8tubXqvux3ILKD6
   h8oLdSyiKDUF2DKGCSys0NAFDzNSaYSOjuqVTMf1AhqJezNdti6JVvQ5M
   +7my1PTFoTU0L7Hni5e1oNoiB3YchkFeMiCT5XD2HFPpnqyqB/XRLMg6l
   nLwrbQfKbJF/jYdpn6Aedg708ZJWx39MO53VhoHHo658MVbryxokXmTjg
   Q3WOhstEY3WiLmwPoGnxQeLcxMzstCcfOKXfc5fg+BSbQ8VYVQUHdMyZg
   w==;
X-CSE-ConnectionGUID: qtZUNTs2T2mAkWKdIfJn8Q==
X-CSE-MsgGUID: 47O6I4ynTm+qfd3WAeSA7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21571766"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21571766"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:11:37 -0700
X-CSE-ConnectionGUID: ov+rmDnlQzOWIO73weRrvg==
X-CSE-MsgGUID: KwVgZ/FVRbe2ddxlyiPVaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="96167459"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:11:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdpR4-0000000Ehfz-1Xvv;
	Tue, 13 Aug 2024 14:11:30 +0300
Date: Tue, 13 Aug 2024 14:11:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 1/6] of: dynamic: Add of_changeset_update_prop_string
Message-ID: <Zrs_YijPxKBFQF0_@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-2-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 08, 2024 at 05:59:24PM +0800, Chen-Yu Tsai wrote:
> Add a helper function to add string property updates to an OF changeset.
> This is similar to of_changeset_add_prop_string(), but instead of adding
> the property (and failing if it exists), it will update the property.
> 
> This shall be used later in the DT hardware prober.

...

> +int of_changeset_update_prop_string(struct of_changeset *ocs,
> +				    struct device_node *np,
> +				    const char *prop_name, const char *str)
> +{
> +	struct property prop;
> +
> +	prop.name = (char *)prop_name;
> +	prop.length = strlen(str) + 1;
> +	prop.value = (void *)str;

Is it the existing style in the file? Otherwise I often see style like this

	struct property prop = {
		.name = (char *)prop_name;
		.length = strlen(str) + 1;
		.value = (void *)str;
	};

in the kernel (IRQ domain, platform core, ...).

> +	return of_changeset_update_prop_helper(ocs, np, &prop);
> +}

-- 
With Best Regards,
Andy Shevchenko



