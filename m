Return-Path: <linux-i2c+bounces-14180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80881C71023
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 21:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6DDB94E0510
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 20:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F99322547;
	Wed, 19 Nov 2025 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRvFhQOE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50C3148C8;
	Wed, 19 Nov 2025 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763583325; cv=none; b=kZ3/Aoc/2o3zFxuDtaibGki1W6tD/T9ilMeNUkN3UzRmPpsEKqvi1sRR+k6Q1tdkwHvDQLCQG1kWlsU7dOcZX4vJynzYq68EtfNA1atHxgePoxyTdUfJSvSt+9kiSxWYh19fDnhteC9rdw3g7+dIKXGP7aMPq384fHRbkKIDB7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763583325; c=relaxed/simple;
	bh=IcnEae0+EXWOtLcoJQcLINFUXnSfpO/JWRATVD8qBfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN/W9FjZtG64eqoJjTZcpBrL0lr9KqORuNvtzTewjCWlDK+cmD5SgE41x+AvNKIyVHiR3NpaCbJt3zr/ptSQ12ldTYrq2c2oJN0fh/b2nuwniT8+vH71plnMxKVJQzO7CY+thayLNDI8/Di4bvLMXfDB6ycZ7CyaMpWmwekihjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRvFhQOE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763583323; x=1795119323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IcnEae0+EXWOtLcoJQcLINFUXnSfpO/JWRATVD8qBfA=;
  b=QRvFhQOE7eDYrco2OtomTH9RBJT6Jyi/W3ZP+v0P5GIFX5miRS+UJtgw
   TdROQMFB/W3Ut1Oi7ui40nuDTUFM5di8tIsawjIYjnJTFOhQKXw/I3Zx/
   kRSUha1a+o4EajyEKK0+42mO0TWrIR8HB0qjBmhjYJIjCfsKH/6r3rtfS
   r1fE/98gUnAzDPEjt5csYZZGiizg8f3SefZkPRrCADiOLYwIwCUNENzCN
   JJOWd648M86zyOtrWOXSO0f9Zx8v75NL2MVLfwOVx/OsHkX4MZVyEWfRS
   aTeMf0wsiSigeSgCW2eJZDuVwqlcbH1kY+oG9hbMeumi3GP+1kcVsrG0s
   A==;
X-CSE-ConnectionGUID: 9qcTXR94RGaxJMO/67fejw==
X-CSE-MsgGUID: LHmtgOJ3R9+5o0Mhbr+L6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="64646016"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="64646016"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:15:22 -0800
X-CSE-ConnectionGUID: UotRSlToSJ+bNOfCRs/Muw==
X-CSE-MsgGUID: tHY77L/5RL+cPxxZurKOwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="190820471"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:15:18 -0800
Date: Wed, 19 Nov 2025 22:15:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 7/7] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Message-ID: <aR4lVB8FRzHLcXJT@smile.fi.intel.com>
References: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
 <20251119-i2c-dw-v3-7-bc4bc2a2cbac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119-i2c-dw-v3-7-bc4bc2a2cbac@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 04:05:36PM +0100, Benoît Monin wrote:
> If IC_EMPTYFIFO_HOLD_MASTER_EN parameter is 0, "Stop" and "Repeated Start"
> bits in command register does not exist, thus it is impossible to send
> several consecutive write messages in a single hardware batch. The
> existing implementation worked with such configuration incorrectly:
> all consecutive write messages are joined into a single message without
> any Start/Stop or Repeated Start conditions. For example, the following
> command:
> 
>     i2ctransfer -y 0 w1@0x55 0x00 w1@0x55 0x01
> 
> does the same as
> 
>     i2ctransfer -y 0 w2@0x55 0x00 0x01
> 
> In i2c_dw_msg_is_valid(), we ensure that we do not have such sequence
> of messages requiring a RESTART, aborting the transfer on controller
> that cannot emit them explicitly.
> 
> This behavior is activated by compatible entries because the state of
> the IC_EMPTYFIFO_HOLD_MASTER_EN parameter cannot be detected at runtime.
> Add the compatible entry for Mobileye SoCs needing the workaround.
> 
> There is another possible problem with this controller configuration:
> When the CPU is putting commands to the FIFO, this process must not be
> interrupted because if FIFO buffer gets empty, the controller finishes
> the I2C transaction and generates STOP condition on the bus.
> 
> If we continue writing the remainder of the message to the FIFO, the
> controller will start emitting a new transaction with those data. This
> turns a single a single message into multiple I2C transactions. To
> protect against FIFO underrun, two changes are done:
> 
> First we flag the interrupt with IRQF_NO_THREAD, to prevent it from
> running in a thread on PREEMPT-RT kernel. This ensures that we are not
> interrupted when filling the FIFO as it is very time-senstive. For
> example, being preempted after writing a single byte in the FIFO with
> a 1MHz bus gives us only 18µs before an underrun.
> 
> Second in i2c_dw_process_transfer(), we abort if a STOP is detected
> while a read or a write is in progress. This can occur when processing
> a message larger than the FIFO. In that case the message is processed in
> parts, and rely on the TX EMPTY interrupt to refill the FIFO when it gets
> below a threshold. If servicing this interrupt is delayed for too long,
> it can trigger a FIFO underrun, thus an unwanted STOP.

...

>  #define ACCESS_NO_IRQ_SUSPEND			BIT(1)
>  #define ARBITRATION_SEMAPHORE			BIT(2)
>  #define ACCESS_POLLING				BIT(3)
> +#define NO_EMPTYFIFO_HOLD_MASTER		BIT(4)

Can we name it

#define ACCESS_NO_EMPTYFIFO_HOLD_MASTER		BIT(4)

?

It will at least keep them under same namespace.

...

> i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs, size_t i

> +	/*
> +	 * Make sure we don't need explicit RESTART between two messages
> +	 * in the same direction for controllers that cannot emit them.
> +	 */
> +	if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER &&
> +	    (msgs[idx - 1].flags & I2C_M_RD) == (msgs[idx].flags & I2C_M_RD)) {
> +		dev_err(dev->dev, "cannot emit RESTART\n");
> +		return false;
> +	}

Ah, Now I see the point of checking the idx first, but can we rather call it
with idx >= 1 to begin with?

>  	return true;
>  }

...

> +	/*
> +	 * The first writing to TX FIFO buffer causes transmission start. If
> +	 * IC_EMPTYFIFO_HOLD_MASTER_EN is not set, when TX FIFO gets empty, I2C
> +	 * controller finishes the transaction. If writing to FIFO is

Make the lines more equal by length.

	 * The first writing to TX FIFO buffer causes transmission start.
	 * If IC_EMPTYFIFO_HOLD_MASTER_EN is not set, when TX FIFO gets empty,
	 * I2C controller finishes the transaction. If writing to FIFO is

> +	 * interrupted, FIFO can get empty and the transaction will be finished
> +	 * prematurely. FIFO buffer is filled in IRQ handler, but in PREEMPT_RT
> +	 * kernel IRQ handler by default is executed in thread that can be

> +	 * preempted with another higher priority thread or an interrupt. So,
> +	 * IRQF_NO_THREAD flag is required in order to prevent any preemption
> +	 * when filling the FIFO.

Similarly

	 * preempted with another higher priority thread or an interrupt.
	 * So, IRQF_NO_THREAD flag is required in order to prevent any
	 * preemption when filling the FIFO.


Dunno if the middle part needs to be rewrapped, perhaps so...

> +	 */

...

>  	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
> +	{ .compatible = "mobileye,eyeq6lplus-i2c", .data = (void *)NO_EMPTYFIFO_HOLD_MASTER },

Are you expecting more with this? I would rather use a compatible matching
instead of the flag,

>  	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
>  	{ .compatible = "snps,designware-i2c" },

-- 
With Best Regards,
Andy Shevchenko



