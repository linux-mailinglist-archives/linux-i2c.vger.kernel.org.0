Return-Path: <linux-i2c+bounces-14814-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A6CE5B99
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 03:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF63D3003F83
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 02:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C571EB5E3;
	Mon, 29 Dec 2025 02:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="O12pKL+G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893908BEC;
	Mon, 29 Dec 2025 02:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766974003; cv=none; b=MRi9p1I5Lk2GFKdPazTQJ9/bpmnGM9I3gPEEtn0oMEatgaPwdFnDDzdJdD9XRqJidVMdWCYRZ/UvVyL061mZXku9TmCSayaTlim3PDFJZtszp/pSB9ZetyIZ1/bexAk5sSwgq5dgkGJUj39fZrRItHzTxOEUbWnMnxzXR+aNKnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766974003; c=relaxed/simple;
	bh=lC4wh1JEg5hhJd1Cm1U9iC2wKYREKH16HdqlMFxc5Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/NXgJB9SikQmZTF+pkQ3rDDLbiFPPpaWV9qCw9DfWUs13qi0h8w8+i/+avA44EWjvUBxCrcPduJJJkSHIkFcKzPeoU+8YRL3oDlqqoekuACLDJxBIEIi3dADdx7ml8GZI7TdN5fLKtXAMhDzVjsZJeHcOKnr0wCwRAGFqmTLzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=O12pKL+G; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766973842;
	bh=OqWMuLjdapot//N3NvuB4l+zklMrdOffEYwGgfD2C90=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=O12pKL+GYsdHKo5EWgLdpZaDQ3sxefz3x6lmXWSYCTuCewSTnpj0jw/kG+VhkComT
	 z8I5d75r2/6Ar7+57CX0CUea+UXYu3M5/gbPnfaNyB4XMAvukQNYYoUBieF6FzLWNq
	 XVE5Guxs9XAYQPWHLLZWddMjyLBYp+hzY4pozPPs=
X-QQ-mid: esmtpsz10t1766973833t9bb2683d
X-QQ-Originating-IP: S/Zy3Pu7yfoJ+ndNXakBGuGQdXCO8KvbiFwk2sGnHVQ=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 10:03:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17634020045709217909
EX-QQ-RecipientCnt: 11
Date: Mon, 29 Dec 2025 10:03:51 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/2] i2c: spacemit: introduce pio for k1
Message-ID: <68BEF1A67DD3F4D0+aVHhhzvaM49Mm-0d@kernel.org>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
 <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86c5e338-e630-4933-a123-cfa1201495ed@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OURTxbnUKnoogJPvoj13Ldped4AdrgCiqhWgyUFG+beu09Aa3dKauLyg
	7ot5VkX8jeDuaN3hTyrtilEEgprGAEwkCi71eIadFgm+R7PWYdr9KFOs5s1Ac7JeDYEkBOy
	oBp0mWigBuSVdCJU6NcbwyZu516r4rU+N80iR7ULwOj5O/ZKvg+9LdqlAdZL3Js96MBBF1C
	nQsD4rQB7FthZsSvoZgRiNK+QU7tVO0zA+RcBgEkZyRBiA7ynEzSseBPQIM3Zx6uH8Xk93g
	yH40/RVK3B3gUsdSBtsCvKGcfwZHsGqHT0bLvLVyuaKc43RHL2dsqLcmsRuBWTCX7rOKJGf
	BXUo2TAB9w9Vh2Zb0SyNfdBAuRxMI3d98XM0jXuD7WhtXHEKRTsqHn7EThzwr0DcxmDg93/
	iNU6FXXz+ATuJFKRTz3vLVqUF93fnrzyKbEb/BBd+bHzkS5v6kBqE7SbklchhsJRV72tu4H
	tCqbt7rfmWKGtvy0Tq+ZYfbivE8iOUlzpJ6puEbUeSt279hxivXtmdVyh+gzhvRxt9SnF8D
	9ZvIBqv+aSk5YIJuAl+KO8PiZNB8LqwrKec9IjvsjiGOho5Y2qakjvUNuqrv+jmDCd/u+uS
	yv1K5+F55AUgrq+RbpXO1WI2QQS1CO37fgDeMINpUxe1h5ONT/o54jYH4jEmBctn+u7q6nk
	sRLLR1LMyP2u4lZWJqwo65wJqeMKrf9lkj8VdMOtTyEzl7KyrYbUA04bShZVtAX9KJSJPv4
	kI6WG+ADmgP+qFpCShJ/cEA4/tuBjyfBzkYQICr2SVLzh8erm75CibMRRmNGZ1YuSIheJ7u
	8T6PfS2qfO9N6Yfd2BwOzKK+3v/KJdbLSwrOolyey0MAqKkDRMj4zIyO8lZfRdqjojeEVnr
	Kgh590EQJBuL7cJQPoX6dx5vtnGqYxeT/5aCxDzphfeCRNys9N9j0xqMODxjaqb8IhcGrTj
	VPQTwGVEIfyHfwTFaWBLHxD9Xcz5PUyUQB8DUaTO+gzcCILSup9fan6bm7IoBl8pSUV/aOJ
	12jgu1/ASBPY5WjTKnHphrKw0/FdOJaGqRBK5nZpTI4PrbxJXzRocAhfWaAGempX5e08LYo
	TQzLL5tEsTxDrDibZiFVvIJKn7HshmWeQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On Sun, Dec 28, 2025 at 05:24:26PM -0600, Alex Elder wrote:
> On 12/25/25 9:31 PM, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> > 
> > When i2c xfer_atomic is invoked, use_pio is set accordingly.
> > 
> > Since an atomic context is required, all interrupts are disabled when
> > operating in PIO mode. Even with interrupts disabled, the bits in the
> > ISR (Interrupt Status Register) will still be set, so error handling can
> > be performed by polling the relevant status bits in the ISR.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> This generally looks good and what I say below doesn't
> really ask for functional changes.
> 
> I have some suggestions on comments to improve readability
> of the code.  I still have a few questions related to delays
> and timeouts, and when you enable TX and RX interrupts.
> These are more about explaining/justifying what's going on,
> though in some cases they might imply an improvement that
> could be made.
> 
[...]
> > +		 *
> > +		 * For the tx empty interrupt, it will be enabled in the
> > +		 * i2c_start function.
> > +		 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
> 
> I don't think the TX FIFO empty interrupt is "erroneous" in
NO FIFO NOW. Data Byte Register(DBR).
But the comments below still suitable.

> > +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> > +{
> > +	u32 mask, msec = jiffies_to_msecs(i2c->adapt.timeout);
> > +	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
> > +	int ret;
> > +
> > +	mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
> > +
> > +	do {
> > +		i2c->status = readl(i2c->base + SPACEMIT_ISR);
> > +
> > +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> > +
> > +		if (!(i2c->status & mask)) {
> > +			udelay(10);
> 
> You are looking only for TX FIFO empty and RX FIFO full
> interrupts.  In this situation I *think* you have several
> possible interrupt conditions occurring.  Some questions:
> - Would observing one of the other possibly conditions
>   at this point be an error?
> - If so, is it OK to simply ignore (and acknowledge) these?
actualy, we can.
but I think it's better to check error here.
> - Why is the 10 microsecond delay required?
To ensure hardware stability, even in interrupt mode, the bit is set
first before the interrupt occurs.
> - Is it reasonable to delay if you see the RXHF condition?
The delay is only taken when none of the expected bits are observed.
> 
> > +			continue;
> > +		}
> > +
> > +		spacemit_i2c_handle_state(i2c);
> > +
> > +
> 
> Delete the extra blank lines here.
> 
> > +	} while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0);
> > +
> > +	if (i2c->unprocessed)
> > +		return 0;
> > +
> > +	if (i2c->read)
> > +		return 1;
> > +
> > +	/*
> > +	 * If this is the last byte to write of the current message,
> > +	 * we have to wait here. Otherwise, control will proceed directly
> > +	 * to start(), which would overwrite the current data.
> > +	 */
> > +	ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> > +					i2c->status, i2c->status & SPACEMIT_SR_ITE,
> > +					30, 1000);
> 
> Why is 1000 microseconds the correct timeout period here?
1000us is sufficient for the hardware to respond; if it still doesn't
work by then, it's considered a hardware timeout.
> 
> > +	if (ret)
> > +		return 0;
> > +
> > +	/*
> > +	 * For writes: in interrupt mode, an ITE (write-empty) interrupt is triggered
> > +	 * after the last byte, and the MSD-related handling takes place there.
> > +	 * In PIO mode, however, we need to explicitly call err_check() to emulate this
> > +	 * step, otherwise the next transfer will fail.
> > +	 */
> > +	if (i2c->msg_idx == i2c->msg_num - 1) {
> > +		mask = SPACEMIT_SR_MSD | SPACEMIT_SR_ERR;
> > +		/*
> > +		 * In some cases, MSD may not arrive immediately;
> > +		 * wait here to handle that.
> > +		 */
> > +		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
> > +						i2c->status, i2c->status & mask,
> > +						30, 1000);
> 
> Same question in this case.  Also, symbolic constants for
> timeouts are often better.
See above. Thanks. I'll define it.

                    - Troy

