Return-Path: <linux-i2c+bounces-5623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F97959B0A
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 14:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EE511C229D0
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 12:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7D4185E6E;
	Wed, 21 Aug 2024 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9uPqKBH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B4349659;
	Wed, 21 Aug 2024 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724241245; cv=none; b=qRmogQLmLiLxDfeTLqTaa9IPe4Fmm26sw1r7/a6BWUtpXSWHNkhQWcOe4ASgY/TFA7SPwUHq+nrN0IyZVo9E35pq2W6UkW1hVBLyNQyGIifYWJknxhJM39s8gSfiTFRkf5T7ccnRzN+if0LRb/l1RfbNNT+1YLOaFiLr7N7HDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724241245; c=relaxed/simple;
	bh=sjdPydC3mw3cQ0ag9TWeR/G//kheaveQbBW+JwadEik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reFYocWIxUKEFf/7KW6xYzfL8ntTD2eM1sQ63rjuHaJN/B6pepQ+pbtP0IPytTxBemWJgFasY87WE2s/QD5BAlEP0F5T2xWftdKuUDVEkaxlZj4ADo7pTLiLXzvixXZM5Zr2F9T9jprc9CJhJXHYAMaUpxWPEno++la+MJlBra0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9uPqKBH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724241243; x=1755777243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sjdPydC3mw3cQ0ag9TWeR/G//kheaveQbBW+JwadEik=;
  b=C9uPqKBHtXVihomT9gL7MqUZaeK6YlmrAjQiu0OJ5akZejmu2k9xKZ8S
   6YA7sPcm9N6UhLWx2JedCvwPLVf0crNEgHKSxpwqrb4SQvLqUveRYd6Ju
   zPLRC0Elq0ZwNkmSb8nf95YVOF7hZQebkgSs/ABRmxs6+grx/X6JVRGzH
   AVu+c4nrVcckldH7VGeDj2jH7kZvrRB9I5H2gKK3Y/iXR3hZclDbJ7PMH
   TgwakbuLbjg/sr7eM4VeblaCriqQosI9Z6ZUuSmw92BHK68OpM8oQdxZa
   j5W8JqtJWb5Mi2ZqtBeC5QAObTS9BJv2tt3+l2SzbvJfdmAHUEVrarW4d
   A==;
X-CSE-ConnectionGUID: sS0pt5NFSeip2SopXkUQ1Q==
X-CSE-MsgGUID: 2FuzKtExQ8GOR40iUj4MUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22757630"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22757630"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 04:54:03 -0700
X-CSE-ConnectionGUID: za5Q+RdERouf6WLiIWTu2w==
X-CSE-MsgGUID: UG05ftq5TpqZ4AU0mZJdtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61047373"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 04:53:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sgjuW-000000003L9-03HD;
	Wed, 21 Aug 2024 14:53:56 +0300
Date: Wed, 21 Aug 2024 14:53:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:

...

> > > +	/* Check 0x14's SDA and SCL status */
> > > +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > > +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state &
> > AST2600_I2CC_SCL_LINE_STS)) {
> > > +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base +
> > AST2600_I2CM_CMD_STS);
> > > +		r = wait_for_completion_timeout(&i2c_bus->cmd_complete,
> > i2c_bus->adap.timeout);
> > > +		if (r == 0) {
> > > +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > > +			ret = -ETIMEDOUT;
> > > +		} else {
> > > +			if (i2c_bus->cmd_err) {
> > > +				dev_dbg(i2c_bus->dev, "recovery error\n");
> > > +				ret = -EPROTO;
> > > +			}
> > > +		}
> > > +	}
> > 
> > ret is set but maybe overridden.
> 
> If will modify by following.
> 		if (r == 0) {
> 			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> 			ret = -ETIMEDOUT;
> 		} else if (i2c_bus->cmd_err) {
> 			dev_dbg(i2c_bus->dev, "recovery error\n");
> 			ret = -EPROTO;
> 		}
> If no error keep ret = 0;

It doesn't change the behaviour. Still ret can be overridden below...

> > > +	/* Recovery done */
> > 
> > Even if it fails above?
> 
> This will keep check the bus status, if bus busy, will give ret = -EPROTO;
> 
> > > +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > > +	if (state & AST2600_I2CC_BUS_BUSY_STS) {
> > > +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> > > +		ret = -EPROTO;

...here.

> > > +	}
> > > +
> > > +	/* restore original master/slave setting */
> > > +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > > +	return ret;

...


> > > +		i2c_bus->master_dma_addr =
> > > +			dma_map_single(i2c_bus->dev, i2c_bus->master_safe_buf,
> > > +				       msg->len, DMA_TO_DEVICE);
> > 
> > > +		if (dma_mapping_error(i2c_bus->dev, i2c_bus->master_dma_addr))
> > {
> > > +			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg,
> > false);
> > > +			i2c_bus->master_safe_buf = NULL;
> > 
> > > +			return -ENOMEM;
> > 
> > Why is the dma_mapping_error() returned error code shadowed?
> 
> Sorry, please point me why you are think it is shadowed?
> As I know dma_mapping_error() will return 0 or -ENOMEM. So I check if it is !=0.
> Than return -ENOMEM. 

First of all, it is a bad style to rely on the implementation details where
it's not crucial. Second, today it may return only ENOMEM, tomorrow it can
return a different code or codes. And in general, one should not shadow an
error code without justification.

> > > +		}

...

> > > +MODULE_DEVICE_TABLE(of, ast2600_i2c_bus_of_table);
> > 
> > Why do you need this table before _probe()? Isn't the only user is below?
> 
> It is for next generation table list. Do you suggest remove it?

My question was regarding to the location of this table in the code, that's it,
no other implications.

...

> > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > +		i2c_bus->buf_base =
> > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > +			i2c_bus->buf_size = resource_size(res) / 2;
> > > +		else
> > > +			i2c_bus->mode = BYTE_MODE;
> > 
> > What's wrong with positive conditional? And is it even possible to have NULL
> > here?
> > 
> Yes, if dtsi fill not following yaml example have reg 1, that will failure at buffer mode.
> And I can swith to byte mode. 
> 
> reg = <0x80 0x80>, <0xc00 0x20>;

I was asking about if (!IS_ERR_OR_NULL(...)) line:
1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
2) Why _NULL?

> > > +	}

...

> > > +	strscpy(i2c_bus->adap.name, pdev->name, sizeof(i2c_bus->adap.name));
> > 
> > Use 2-argument strscpy().
> Do you mean strscpy(i2c_bus->adap.name, pdev->name); is acceptable?

Yes. And not only acceptable but robust for the copying to the [string] arrays.

...

> > > +	i2c_bus->alert_enable = device_property_read_bool(dev, "smbus-alert");
> > > +	if (i2c_bus->alert_enable) {
> > > +		i2c_bus->ara = i2c_new_smbus_alert_device(&i2c_bus->adap,
> > &i2c_bus->alert_data);
> > > +		if (!i2c_bus->ara)
> > > +			dev_warn(dev, "Failed to register ARA client\n");
> > > +
> > > +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER
> > | AST2600_I2CM_SMBUS_ALT,
> > > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > > +	} else {
> > > +		i2c_bus->alert_enable = false;
> > > +		/* Set interrupt generation of I2C master controller */
> > > +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> > > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > > +	}
> > 
> > I2C core calls i2c_setup_smbus_alert() when registering the adapter. Why do
> > you need to have something special here?
> The ast2600 i2c support smbus alert, and according my reference.
> If enable alert, that will need i2c_new_smbus_alert_device for alert handler.
> When interrupt coming driver can use this hander to up use i2c_handle_smbus_alert
> And update layer will handle alert.
> Does I mis-understand. If yes, I will remove this in next.

Have you seen i2c_new_smbus_alert_device() ?

-- 
With Best Regards,
Andy Shevchenko



