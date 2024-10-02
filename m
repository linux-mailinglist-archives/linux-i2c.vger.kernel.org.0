Return-Path: <linux-i2c+bounces-7188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB998DC83
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 16:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20A4B1C22E56
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 14:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846451D151E;
	Wed,  2 Oct 2024 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/maeouu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46191D1518;
	Wed,  2 Oct 2024 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879746; cv=none; b=aGruK0i3/Sz1RUZ1NecvtuZhO7qPvQHxIkPHPtaYyIKUdMRkntntGl002alZnxFRcE8sJTCmt5/EdpBeoZHxrC5vjf3kGfPH/N6bSbdm4cZtWXhT0HhnvHigbcnVqtcG2o4C8+PBvZoM+sVPl2y05XWRP+LYiR3SDbsCGO12ZHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879746; c=relaxed/simple;
	bh=reX/HEz8p8JLCDKEMNA3o/Kp5RQsQN6emEVJh9u5XcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sj20uWXURKDijHdzXfvWZ51EiuRXGebuhG7v1woFmlHCUkF6oRfZFW6ofjXUzilWg+nuk702qvoFnIRtfs6yf6WSnrqLmQltIEriKwoaM5w9mg0r07femk/aI7Zf2FPlPnoOcZQn17iOdg2s79hz/KlAbVjPAIDZluSlP8gf9Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/maeouu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727879745; x=1759415745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=reX/HEz8p8JLCDKEMNA3o/Kp5RQsQN6emEVJh9u5XcE=;
  b=Y/maeouuNCF5tMLw4ktquCan768XQuzCHiDeTI5D4RXPcxYGE0D9gGvB
   tHBukfURTO46cY61bLX1ZLSlUd3yCBPPX1ZI4w9X94vZ1IrGX34immjH/
   SMckl5bAVPOus0liusI/ix/IxrnMv/98p5r3gu66VXo9ZIN/hYuohNJKw
   hzG/kO9o7TKQMoaugah0gT+6NDcQq5pfZXXkC2biMQtrRG1EH7u3MbN1m
   PlpbUGL5mJPVbMd2meQX4lCxdFtlyIbEWCgpeUQYDptAzdQT7p4koKkt4
   qu1IvfVyYwfmmhIYNzRsaJ1Oeblmy3nPYlNuMDqaRAplpxqAJSLR+xHv2
   A==;
X-CSE-ConnectionGUID: 2InvyAmeTAGfpG58o9eGOw==
X-CSE-MsgGUID: lqk38gURQbqgU8RIE9M9ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38179588"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="38179588"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:35:44 -0700
X-CSE-ConnectionGUID: +Yds6v1JQI6HXv66faUHeQ==
X-CSE-MsgGUID: AkbSVDKJSyaGbdwMNNJS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74262436"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:35:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sw0S1-0000000FhjB-1sj4;
	Wed, 02 Oct 2024 17:35:37 +0300
Date: Wed, 2 Oct 2024 17:35:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew@codeconstruct.com.au,
	p.zabel@pengutronix.de, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Message-ID: <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:
> This series add AST2600 i2cv2 new register set driver. The i2cv2 driver
> is new register set that have new clock divider option for more
> flexiable generation. And also have separate i2c master and slave register
> set for control, patch #2 is i2c master driver only, patch #3 is add
> i2c slave mode driver.
> 
> The legacy register layout is mix master/slave register control together.
> The following is add more detail description about new register layout.
> And new feature set add for register.
> 
> -Add new clock divider option for more flexible and accurate clock rate
> generation -Add tCKHighMin timing to guarantee SCL high pulse width.
> -Add support dual pool buffer mode, split 32 bytes pool buffer of each
> device into 2 x 16 bytes for Tx and Rx individually.
> -Increase DMA buffer size to 4096 bytes and support byte alignment.
> -Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
> -Re-define registers for separating master and slave mode control.
> -Support 4 individual DMA buffers for master Tx and Rx, slave Tx and Rx.
> 
> And following is new register set for package transfer sequence.
> -New Master operation mode:
>  S -> Aw -> P
>  S -> Aw -> TxD -> P
>  S -> Ar -> RxD -> P
>  S -> Aw -> RxD -> Sr -> Ar -> TxD -> P
> -Bus SDA lock auto-release capability for new master DMA command mode.
> -Bus auto timeout for new master/slave DMA mode.
> 
> The following is two versus register layout.
> Old:
> {I2CD00}: Function Control Register
> {I2CD04}: Clock and AC Timing Control Register
> {I2CD08}: Clock and AC Timing Control Register
> {I2CD0C}: Interrupt Control Register
> {I2CD10}: Interrupt Status Register
> {I2CD14}: Command/Status Register
> {I2CD18}: Slave Device Address Register
> {I2CD1C}: Pool Buffer Control Register
> {I2CD20}: Transmit/Receive Byte Buffer Register
> {I2CD24}: DMA Mode Buffer Address Register
> {I2CD28}: DMA Transfer Length Register
> {I2CD2C}: Original DMA Mode Buffer Address Setting
> {I2CD30}: Original DMA Transfer Length Setting and Final Status
> 
> New Register mode
> {I2CC00}: Master/Slave Function Control Register
> {I2CC04}: Master/Slave Clock and AC Timing Control Register
> {I2CC08}: Master/Slave Transmit/Receive Byte Buffer Register
> {I2CC0C}: Master/Slave Pool Buffer Control Register
> {I2CM10}: Master Interrupt Control Register
> {I2CM14}: Master Interrupt Status Register
> {I2CM18}: Master Command/Status Register
> {I2CM1C}: Master DMA Buffer Length Register
> {I2CS20}: Slave~ Interrupt Control Register
> {I2CS24}: Slave~ Interrupt Status Register
> {I2CS28}: Slave~ Command/Status Register
> {I2CS2C}: Slave~ DMA Buffer Length Register
> {I2CM30}: Master DMA Mode Tx Buffer Base Address
> {I2CM34}: Master DMA Mode Rx Buffer Base Address
> {I2CS38}: Slave~ DMA Mode Tx Buffer Base Address
> {I2CS3C}: Slave~ DMA Mode Rx Buffer Base Address
> {I2CS40}: Slave Device Address Register
> {I2CM48}: Master DMA Length Status Register
> {I2CS4C}: Slave  DMA Length Status Register
> {I2CC50}: Current DMA Operating Address Status
> {I2CC54}: Current DMA Operating Length  Status
> 
> aspeed,global-regs:
> This global register is needed, global register is setting for
> new clock divide control, and new register set control.
> 
> ASPEED SOC chip is server product, i2c bus may have fingerprint
> connect to another board. And also support hotplug.
> The following is board-specific design example.
> Board A                                         Board B
> -------------------------                       ------------------------
> |i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
> |i2c bus#2(master)-> tmp i2c device |          |                       |
> |i2c bus#3(master)-> adc i2c device |          |                       |
> -------------------------                       ------------------------
> 
> i2c-scl-clk-low-timeout-us:
> For example I2C controller as slave mode, and suddenly disconnected.
> Slave state machine will keep waiting for master clock in for rx/tx
> transmit. So it need timeout setting to enable timeout unlock controller
> state. And in another side. In Master side also need avoid suddenly
> slave miss(un-plug), Master will timeout and release the SDA/SCL.
> 
> aspeed,enable-dma:
> For example The bus#1 have trunk data needed for transfer,
> it can enable bus dma mode transfer, it can reduce cpu utilized.
> Others bus bus#2/3 use defautl buffer mode.

Is it possible to switch to new terminology wherever it's possible?
I.e. master --> controller, slave --> target. See, for example,
f872d28500bd ("i2c: uniphier-f: reword according to newest specification").

-- 
With Best Regards,
Andy Shevchenko



