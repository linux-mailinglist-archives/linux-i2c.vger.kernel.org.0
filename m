Return-Path: <linux-i2c+bounces-12859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56932B53160
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC06D16725A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 11:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878022E7BB2;
	Thu, 11 Sep 2025 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqU0Rtfx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA282356C7;
	Thu, 11 Sep 2025 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757591328; cv=none; b=RcrhEzmFCYlL7xZU/iNwLYBsf90m/yD/1iPlekosiAAHei4zXvtpbMAO/YLm0lstY99Xrw/++q8i3FnCBkTp9Yv6OS/rnjJusq9J1cVof2k1INN3mkt3qyphdxdyn/pDrZDY9CeZ2Whwym7C9yPF60lxpv/jj3HHiyajC3MgrJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757591328; c=relaxed/simple;
	bh=cGE5k+kFKKQS6S9eVsIFsd8HWI3xBL9EZbWqUSFBAH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCDaLSyFu2sRZaCgaIPNsUfbJfUaHrerzMNgs42t8fOqXQYbfjZUDWV4+hvstzTzRmen5XCVSOnZjsAJxVG6ZdUVxdmEq2xEkcRcGCnzVptiMUz2du/6TYWJS4wxW4D8B0Z3K8KpX+BzPSA21sKk4rq1NsOzcUjFOEheyFAl9xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqU0Rtfx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530DAC4CEF0;
	Thu, 11 Sep 2025 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757591326;
	bh=cGE5k+kFKKQS6S9eVsIFsd8HWI3xBL9EZbWqUSFBAH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XqU0RtfxG0TTerds6PYDH+8dIAJedn9CzY0KZ+7H+7MzffhCroODbphc6fNkVhwZe
	 KA+GTFVs9Rn/GHekjQAB/jKiC8Esoogx055r7+qNNY1StCcT0a+6482ySecCmBxG6r
	 y1xGt1YLane7YS3iV1gr1d/bXEy84PKn3mPhGtdOp3awA0t0cYUa4jfR5dAXKFJXB7
	 M4QZeXbCwmGxrh7p3iK/F/56l7xM/cWNstwjLYEJtk79ztmZhrmIzv9mBG7hyd2Zct
	 uJmJWmaBUE8MFajZwNUXkEWDqnU29ljSGPvPExj7hi9Ho5+39pR1rKCLxScHormCsQ
	 M/TZsD0CVfp6Q==
Message-ID: <4e2f79bc-2827-4db9-bb2b-4a330cd14f2d@kernel.org>
Date: Thu, 11 Sep 2025 13:48:42 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] i2c: Add Intel USBIO I2C driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Richard Hughes <rhughes@redhat.com>,
 linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250910133958.224921-1-hansg@kernel.org>
 <20250910133958.224921-4-hansg@kernel.org> <aMHznOCa_9vtW6_1@shikoro>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aMHznOCa_9vtW6_1@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Wolfram,

Thank you for the review.

On 10-Sep-25 11:54 PM, Wolfram Sang wrote:
> Hi Hans,
> 
>> +out_log:
>> +	dev_dbg(adap->dev.parent, "RD[%d]:%*phN\n", msg->len, msg->len, msg->buf);
> 
> I think this...
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int usbio_i2c_write(struct i2c_adapter *adap, struct i2c_msg *msg)
>> +{
>> +	struct usbio_i2c *i2c = i2c_get_adapdata(adap);
>> +	u16 txchunk = i2c->txbuf_len - I2C_RW_OVERHEAD;
>> +	struct usbio_i2c_rw *wbuf = i2c->rwbuf;
>> +	int ret;
>> +
>> +	dev_dbg(adap->dev.parent, "WR[%d]:%*phN\n", msg->len, msg->len, msg->buf);
> 
> ... and this dbg can go. The tracepoints we have should do?

Ack, I've dropped both for the upcoming v5.

>> +static u32 usbio_i2c_func(struct i2c_adapter *adap)
>> +{
>> +	return I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR | I2C_FUNC_SMBUS_EMUL;
>> +}
> 
> How did you test 10 bit addresses? I have never seen them in the wild?

I did not test 10 bit addresses. This was there in the original code
from Intel.

> Did you also check SMBUS_QUICK? 'i2cdetect' uses it by default.

I just tested this and this indeed does not work, when doing
a 0 byte write then waiting for the chip to respond times-out and
further i2c transfers after that also fail until the chip is
power-cycled.

> Does the underlying USBIO driver use usb_control_msg? If so, we need to
> disable zero length read messages. See [1] for a reference.

No it uses bulk messages.

Still based on the no support for writing 0 byte messages, I've tried
a 0 byte read, since the 0 byte write was not liked much and doing
i2ctransfer ... r0@0x10 results in the same problem.

So I'll add I2C_AQ_NO_ZERO_LEN to the quirks.

Regards,

Hans


