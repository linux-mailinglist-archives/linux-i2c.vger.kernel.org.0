Return-Path: <linux-i2c+bounces-6780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87099979F7C
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0D631C22C1E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 10:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57751509A5;
	Mon, 16 Sep 2024 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xymqpmxo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5EC14E2ED;
	Mon, 16 Sep 2024 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726482983; cv=none; b=E/DzdtJKCLt2CseRH4tWZR+FcrvX4V4Yd43wPFMBBhELj0WmRSP6pZ1VfXo50COJ1mFQ4mhGhUsrtI4USk7HRkBi+FRNfQDjCnx7QeUz1yZh26mfh5NVRklfIm9g0RzoBfiR6/3fWcWzo5XyQr5iXafvZXfVIYWnfdJVCRfJ54o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726482983; c=relaxed/simple;
	bh=CDjA3xr2GeuvVu3jehLI18ppg/zZIc4QJHB1ZO9jvZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0NYXIJalhwCZeCX9pXsjaYp1ELTQheqcKhobU0F0sHWtvo90xpdbOnI9EJGlDzb3NWDJUSmWJEsu1zRQLhyCiOE3c+zrqQBdokjWCD5vIEZ0kjKxnEvo4gI/lNJbCvNCwMRP8I9KatjNlpQuC9JKFJ18JVkhbeZeMnjEjy88Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xymqpmxo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726482982; x=1758018982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CDjA3xr2GeuvVu3jehLI18ppg/zZIc4QJHB1ZO9jvZ0=;
  b=Xymqpmxo//PiSLZ5VBRtnHDewsWSMmDJ9mz0Ce+XOSH8DTUrnf2Ip5cL
   JDEsU1mBxEtCJ9FeXER1jPQix0O7u5j9y9e1Vel4hu8j5TkLVQ7vSFC5V
   VGl4QoCuRDTNRBjbhaCKWQoqISgR0NaBQ2tcr+y/otw4wJ8koDB0Z32wn
   FkcRprzWr3EJ2wR0LAsG9z6l4owx7b8DK8ls8EufNvcJ/W7Rv5OIOUX0U
   eI1KCJ3DvYl5TCRN1zAInjnIfs1b/IwFK2FAzxpITE8P2F5y6F4V4qoPQ
   hzHz6CYmoRNJmaXFEKxaRzW1+vZGj3jhuSl5TV9bYJomm8bZdGL6/LLun
   w==;
X-CSE-ConnectionGUID: 0RSTf24gT8CbtaufSq0yCw==
X-CSE-MsgGUID: xqGXweKORMGy6zg2E63u/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24787279"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24787279"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:36:21 -0700
X-CSE-ConnectionGUID: Sr8ud2DJTkqIdiezt0xDVQ==
X-CSE-MsgGUID: ogisOK5yTAGgv4HbGLc7xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68445987"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:36:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sq95a-00000009QO4-3oxK;
	Mon, 16 Sep 2024 13:36:14 +0300
Date: Mon, 16 Sep 2024 13:36:14 +0300
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
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
Message-ID: <ZugKHrzs5BWoDr1c@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-7-wenst@chromium.org>
 <ZuQTFTNTBLCziD05@smile.fi.intel.com>
 <CAGXv+5HgkCZ=vdHGgvCW1U-nid=cQrVaxC+V+H2Gknf2pnTbYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HgkCZ=vdHGgvCW1U-nid=cQrVaxC+V+H2Gknf2pnTbYA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Sep 15, 2024 at 12:44:13PM +0200, Chen-Yu Tsai wrote:
> On Fri, Sep 13, 2024 at 12:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Sep 11, 2024 at 03:27:44PM +0800, Chen-Yu Tsai wrote:

...

> > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx)
> > > +{
> > > +     const struct i2c_of_probe_ops *ops;
> > > +     const char *type;
> > > +     struct device_node *i2c_node;
> > > +     struct i2c_adapter *i2c;
> > > +     int ret;
> > > +
> > > +     if (!cfg)
> > > +             return -EINVAL;
> > > +
> > > +     ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
> > > +     type = cfg->type;
> > > +
> > > +     i2c_node = i2c_of_probe_get_i2c_node(dev, type);
> >
> >
> >         struct device_node *i2c_node __free(of_node_put) =
> >                 i2c_...;
> 
> cleanup.h says to not mix the two styles (scoped vs goto). I was trying
> to follow that, though I realize now that with the scoped loops it
> probably doesn't help.
> 
> I'll revert back to having __free().
> 
> > > +     if (IS_ERR(i2c_node))
> > > +             return PTR_ERR(i2c_node);
> > > +
> > > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > > +             if (!of_device_is_available(node))
> > > +                     continue;
> > > +
> > > +             /*
> > > +              * Device tree has component already enabled. Either the
> > > +              * device tree isn't supported or we already probed once.
> > > +              */
> > > +             ret = 0;
> >
> > Shouldn't you drop reference count for "node"? (See also below)
> 
> This for-each loop the "scoped". It just doesn't have the prefix anymore.
> I believe you asked if the prefix could be dropped and then Rob agreed.

Hmm... I have looked into the implementation and I haven't found the evidence
that this is anyhow scoped. Can you point out what I have missed?

> > > +             goto out_put_i2c_node;
> > > +     }
> > > +
> > > +     i2c = of_get_i2c_adapter_by_node(i2c_node);
> > > +     if (!i2c) {
> > > +             ret = dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
> > > +             goto out_put_i2c_node;
> > > +     }
> > > +
> > > +     /* Grab resources */
> > > +     ret = 0;
> > > +     if (ops->get_resources)
> > > +             ret = ops->get_resources(dev, i2c_node, ctx);
> > > +     if (ret)
> > > +             goto out_put_i2c_adapter;
> > > +
> > > +     /* Enable resources */
> > > +     if (ops->enable)
> > > +             ret = ops->enable(dev, ctx);
> > > +     if (ret)
> > > +             goto out_release_resources;
> > > +
> > > +     ret = 0;
> > > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > > +             union i2c_smbus_data data;
> > > +             u32 addr;
> > > +
> > > +             if (of_property_read_u32(node, "reg", &addr))
> > > +                     continue;
> > > +             if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &data) < 0)
> > > +                     continue;
> > > +
> > > +             /* Found a device that is responding */
> > > +             if (ops->free_resources_early)
> > > +                     ops->free_resources_early(ctx);
> > > +             ret = i2c_of_probe_enable_node(dev, node);
> >
> > Hmm... Is "node" reference count left bumped up for a reason?
> 
> Same as above.

Same as above.

> > > +             break;
> > > +     }
> > > +
> > > +     if (ops->cleanup)
> > > +             ops->cleanup(dev, ctx);
> > > +out_release_resources:
> > > +     if (ops->free_resources_late)
> > > +             ops->free_resources_late(ctx);
> > > +out_put_i2c_adapter:
> > > +     i2c_put_adapter(i2c);
> > > +out_put_i2c_node:
> > > +     of_node_put(i2c_node);
> > > +
> > > +     return ret;
> > > +}

-- 
With Best Regards,
Andy Shevchenko



