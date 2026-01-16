Return-Path: <linux-i2c+bounces-15230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F23D312CC
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 13:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76FF3300FEFE
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 12:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5C42163B2;
	Fri, 16 Jan 2026 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgJ1VVet"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA3C1C3BEB;
	Fri, 16 Jan 2026 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768567004; cv=none; b=ZsG+0Q76PBk+T+BHy+T7r4uNpJVut0KEJ//wOghzcbU+6/QO8Pn/12iTw2Wj88P9Cwmj3xYBfHrxdR7Bae9bDaMgmFsqTZKKpjYAsOr2Z6SS7oxE+SwUM0tgA9/RGt/QvM5bbjoTdCkFthbluWXMvsZ4A4kSDu2+fKKSo8iS19M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768567004; c=relaxed/simple;
	bh=hcAovDiVqYbJBPJqcxeru0ecxEMs1UaBo05POzzeyGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWnDVuZwUn5yDyZNR344es+pRssXSrJOEsDQNIjMA7dPz90W6X1/zqbEj0Qp6zyGpLengsMGzHDWHuTr8MS1kWcLvCxlzpGqaxi6nTgY66QLBYgwWeF59PYFLXMaW/kiVN3s/Xwdi4BKEjNXF3+bJ9TiiZZgP6iChlVAU3ZG/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgJ1VVet; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83246C116C6;
	Fri, 16 Jan 2026 12:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768567004;
	bh=hcAovDiVqYbJBPJqcxeru0ecxEMs1UaBo05POzzeyGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgJ1VVetkwUdjA3hIL5DV1VVg6+qB/4WV31MVSl/mKVbiwmOhEYj5C/C2IQun79Zx
	 qpKrXssZkZVXyWcrf09ycvMCjsaCrgobRiee2RUN4eYy4v8+sWL/7htWDiDBUcLgZA
	 H7iOMska7APkZ6+O/S8dgDDyJjOEDKaKzi2bRSgypBTljUtNYEl1i84l2e6TEOF84B
	 xfGVd0wcgGE7iEWnWZuI/ethPjqBX1gOHDG7RGb7NAN+yG9UR1b3EGtweYqfg3Gbli
	 qILPiZeMKeGiHwaGGvPdYJjoTKoQczqwexUnsIwxraRyPHqQJftT84P/wsRySWRIeO
	 5KR6Z3yzaGj/Q==
Date: Fri, 16 Jan 2026 13:36:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v4 5/7] i2c: designware: Implement I2C_M_STOP support
Message-ID: <aWoFLngIi5ZTtYzz@zenone.zhora.eu>
References: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
 <20251126-i2c-dw-v4-5-b0654598e7c5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-i2c-dw-v4-5-b0654598e7c5@bootlin.com>

Hi Benoit,

the patch looks good, just a couple of nits.

...

> @@ -805,18 +792,15 @@ static int i2c_dw_wait_transfer(struct dw_i2c_dev *dev)
>  }
>  
>  /*
> - * Prepare controller for a transaction and call i2c_dw_xfer_msg.
> + * Prepare controller for a transaction, start the transfer of the msgs
> + * and wait for completion, either a STOP or a error.
> + * Return the number of messages transferred or a negative error code.

we are ignoring the number of messages returned, though. Do we
really need it?

>   */
>  static int
> -i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> +__i2c_dw_xfer_one_part(struct dw_i2c_dev *dev, struct i2c_msg *msgs, size_t num)
>  {
> -	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
>  	int ret;
>  
> -	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
> -
> -	pm_runtime_get_sync(dev->dev);
> -
>  	reinit_completion(&dev->cmd_complete);
>  	dev->msgs = msgs;
>  	dev->msgs_num = num;

...

> +/*
> + * Verify that the message at index @idx can be processed as part
> + * of a single transaction. The @msgs array contains the messages
> + * of the transaction. The message is checked against its predecessor
> + * to ensure that it respects the limitation of the controller.
> + */
> +static inline bool

why does this need to be explicitely declared as inline? I don't
think it's necessary.

Thanks,
Andi

> +i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs, size_t idx)
> +{

