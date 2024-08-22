Return-Path: <linux-i2c+bounces-5669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BA995B6E1
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 15:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BEFD1F2568A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 13:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6451CBE8C;
	Thu, 22 Aug 2024 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxqQ3Kqe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F2C1CBE87;
	Thu, 22 Aug 2024 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333576; cv=none; b=W6jYOmOLaB4Zs0mASLlsuehpEQFlmf/LaieIdFtBaDo0RfWdrUeIvOLyacv7qXgh3SpX+m1Vag8HuyB/R9xl+SpCjgUHn7RaG0C8U+j/Quhtv3ifIax+CJ1BB42ag64/7q+IBNdcTeoOAttLmHIlGsvSZZ5bDGV3rCV5y7lKG04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333576; c=relaxed/simple;
	bh=Ey9GWCaehbSnTHtTO44xwcZKYcD9SIp9LLt318G94E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0xggtoV9HYcpbelXe2qn2PKMMMW8Cx6fMBIdJ8MztMmhwJ/UYjm+t2hhzgJrB0fSU3lkTdeQ4Cb2mKtZShGYzcwyHldKApQx7lJX6lDPrHPm2EFt+mU+jPcFyovWrAY/hRyWjwgn/3zdTggONpervGsQuHq2BlLXQ+bZTz/Lm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxqQ3Kqe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724333576; x=1755869576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ey9GWCaehbSnTHtTO44xwcZKYcD9SIp9LLt318G94E4=;
  b=WxqQ3KqeIwQSIWhMGF66o6eHnCA34E6dRnYD6b2nqnlz1Kfj66763KSC
   62i7JiQ9rtlt0SoNxalDDrZj7I4TbPBL91uh38FfzPq2boRr+oxq2X0rG
   IptahSLVYc8CvXSO0/lurOqIsAkvpGaXZQWAU6MUymW3HmiYxsYKAoI5a
   wHh3RvdAjh+uRSSgG4Ukvhv3/2DrkxVcPmcKwGgRBMFI5CWxaHwsT7Cvv
   RzYzh8GHPi1KvBVMg1LbGDJNKa+f6mtt9YWVt4HL9ECWBygzAbYDVvDUF
   QyS7T2Y3URYU7MFyjWGwmAKoua4paaT065zp1o8lJxmpnTg59wDcCaAz4
   w==;
X-CSE-ConnectionGUID: 5rWpenhZTNe6QrrtjfoBog==
X-CSE-MsgGUID: +SPm/M6ITFSu0+qKQORqlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34128586"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="34128586"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:32:55 -0700
X-CSE-ConnectionGUID: 6EKnKbPLSVqplxDBOPNGlQ==
X-CSE-MsgGUID: ZnLsCKtgSW+HwUkAsDZXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61468279"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:32:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh7vh-00000000St9-3oX7;
	Thu, 22 Aug 2024 16:32:45 +0300
Date: Thu, 22 Aug 2024 16:32:45 +0300
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
Message-ID: <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:

...

> > > > > +	/* Check 0x14's SDA and SCL status */
> > > > > +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > > > > +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state &
> > > > AST2600_I2CC_SCL_LINE_STS)) {
> > > > > +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base
> > +
> > > > AST2600_I2CM_CMD_STS);
> > > > > +		r = wait_for_completion_timeout(&i2c_bus->cmd_complete,
> > > > i2c_bus->adap.timeout);
> > > > > +		if (r == 0) {
> > > > > +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > > > > +			ret = -ETIMEDOUT;
> > > > > +		} else {
> > > > > +			if (i2c_bus->cmd_err) {
> > > > > +				dev_dbg(i2c_bus->dev, "recovery error\n");
> > > > > +				ret = -EPROTO;
> > > > > +			}
> > > > > +		}
> > > > > +	}
> > > >
> > > > ret is set but maybe overridden.
> > >
> > > If will modify by following.
> > > 		if (r == 0) {
> > > 			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > > 			ret = -ETIMEDOUT;
> > > 		} else if (i2c_bus->cmd_err) {
> > > 			dev_dbg(i2c_bus->dev, "recovery error\n");
> > > 			ret = -EPROTO;
> > > 		}
> > > If no error keep ret = 0;
> > 
> > It doesn't change the behaviour. Still ret can be overridden below...
> 
> Yes, it is expectable, previous is issue recovery command out then the
> following is double confirm the bus status.
> If bus still busy, the function still return recovery fail.
> 
> Or should I modify by following?
> 	/* Check 0x14's SDA and SCL status */
> 	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> 	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE_STS)) {
> 		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> 		r = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
> 		if (r == 0) {
> 			dev_dbg(i2c_bus->dev, "recovery timed out\n");

> 			ret = -ETIMEDOUT;

This assignment doesn't make sense.

> 		} else if (i2c_bus->cmd_err) {
> 				dev_dbg(i2c_bus->dev, "recovery error\n");
> 				ret = -EPROTO;
> 		}
> 		/* check bus status */
> 		state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> 		if (state & AST2600_I2CC_BUS_BUSY_STS) {
> 			dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> 			ret = -EPROTO;
> 		}
> 	}

> > > > > +	/* Recovery done */
> > > >
> > > > Even if it fails above?
> > >
> > > This will keep check the bus status, if bus busy, will give ret =
> > > -EPROTO;
> > >
> > > > > +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > > > > +	if (state & AST2600_I2CC_BUS_BUSY_STS) {
> > > > > +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> > > > > +		ret = -EPROTO;
> > 
> > ...here.

See above.

> > > > > +	}
> > > > > +
> > > > > +	/* restore original master/slave setting */
> > > > > +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > > > > +	return ret;

...

> > > > > +		i2c_bus->master_dma_addr =
> > > > > +			dma_map_single(i2c_bus->dev, i2c_bus->master_safe_buf,
> > > > > +				       msg->len, DMA_TO_DEVICE);
> > > >
> > > > > +		if (dma_mapping_error(i2c_bus->dev,
> > i2c_bus->master_dma_addr))
> > > > {
> > > > > +			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf,
> > msg,
> > > > false);
> > > > > +			i2c_bus->master_safe_buf = NULL;
> > > >
> > > > > +			return -ENOMEM;
> > > >
> > > > Why is the dma_mapping_error() returned error code shadowed?
> > >
> > > Sorry, please point me why you are think it is shadowed?
> > > As I know dma_mapping_error() will return 0 or -ENOMEM. So I check if it
> > is !=0.
> > > Than return -ENOMEM.
> > 
> > First of all, it is a bad style to rely on the implementation details where it's not
> > crucial. Second, today it may return only ENOMEM, tomorrow it can return a
> > different code or codes. And in general, one should not shadow an error code
> > without justification.
> > 
> Understood, The following is better, am I right? (if yest, those will update in driver)

Yes.

> 		Int ret;
> 		.....
> 		ret = dma_mapping_error(i2c_bus->dev, i2c_bus->master_dma_addr)
> 		if (ret) {
> 			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg, false);
> 			i2c_bus->master_safe_buf = NULL;
> 			return ret;
> 		}
> 
> > > > > +		}

...

> > > > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > > > +		i2c_bus->buf_base =
> > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > +			i2c_bus->buf_size = resource_size(res) / 2;
> > > > > +		else
> > > > > +			i2c_bus->mode = BYTE_MODE;
> > > >
> > > > What's wrong with positive conditional? And is it even possible to
> > > > have NULL here?
> > > >
> > > Yes, if dtsi fill not following yaml example have reg 1, that will failure at buffer
> > mode.
> > > And I can swith to byte mode.
> > >
> > > reg = <0x80 0x80>, <0xc00 0x20>;
> > 
> > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
> I will update to following.
> 		if (IS_ERR(i2c_bus->buf_base))
> 			i2c_bus->mode = BYTE_MODE;
> 		else
> 			i2c_bus->buf_size = resource_size(res) / 2;
> 
> > 2) Why _NULL?
> 	If dtsi file is claim only 1 reg offset. reg = <0x80 0x80>; that will goto byte mode.
> 	reg = <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> 	due to 2nd is buffer register offset.

I have asked why IS_ERR_OR_NULL() and not IS_ERR().

> > > > > +	}

-- 
With Best Regards,
Andy Shevchenko



