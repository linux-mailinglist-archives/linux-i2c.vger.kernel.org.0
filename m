Return-Path: <linux-i2c+bounces-13105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F19B93BE6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 02:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB743480479
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 00:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7EA169AD2;
	Tue, 23 Sep 2025 00:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="wM916CfY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211A2BD11;
	Tue, 23 Sep 2025 00:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758588475; cv=none; b=eg8s2t5kwnJPqVQhA7EXlB1AZxmiTJ2Q1RkoTetwoI4Zi2G0Ov3gvaAFHUWCfhAfYjvWRD/1EKgbsLY7ZdmeLRFABbtjpiiP/Mcp//MakQTzXTSKAoPdDbeqFHckNO4zYYImbz9QJpSkvSPXTT5WeOHeDBwm+ffpG2IK86hAC8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758588475; c=relaxed/simple;
	bh=z5AzEguEuCwaqnZyXq1XxQzta0qN2LrUWeZP9U3kmGU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLMrwNUL7kPvwrLxvdOmGBRd/OmctbYGOacHmiVi3COo8GpSfNoJsMLMg1NZI0CsBpcEDANBPYU8B24+koab20MUMHsgH7BU9CjKCNdyQRnppPNms94Xsd1y7YKB8jBQRLDvSi3ye2gWvZWa6+nvgANgBzc+Lv7xzsBVg9A5As8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=wM916CfY; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758588408;
	bh=vyq768TpcuHCWLWVeWA9tpt7e/09ldUMjTg7yQFYVEk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=wM916CfY+Dj8foZAOqKPwAO5+c5/L8KzjWHc8xoyTuki6zZPerb2n91MjvpUn546o
	 8lSX6hIzBU3kGlup9yDps94LSM+vVCxEPdyVsH9VtE+VikqelS7G3neDE8MpBrBoz9
	 0oaT5Z3fK5BDQD45vH/RmBF7qKeo/l+Z4EgmfyBc=
X-QQ-mid: zesmtpgz9t1758588400t469a4b4b
X-QQ-Originating-IP: inQR45J5NRXSrpE8Z+cozC30AKSXeaxWY9PkMpheo7w=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 08:46:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8785729495860131616
EX-QQ-RecipientCnt: 9
Date: Tue, 23 Sep 2025 08:46:39 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 3/6] i2c: spacemit: disable SDA glitch fix to avoid
 restart delay
Message-ID: <BE3EEC385331D80D+aNHt7_J7uUMzkhrq@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <20250827-k1-i2c-atomic-v1-3-e59bea02d680@linux.spacemit.com>
 <aNG34K6V-sFhX-g1@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNG34K6V-sFhX-g1@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M8e5kblytUZRkuwONNRPMFZWiXSKVZ8jEzXlNDve2/R8c8+lryDyipY/
	fawBy8d77XUN2m2uojwhcBk0b4yt58XG+m+WeBzG2eivTxxNVa1dauz2n66LtUWYAVerFPF
	ui01QA7HVV6AeGyihIGZQSytDAugXwYJuYcYqQ/VedqzpGCSmHNWlfPikkm2lBoj49oa9Oe
	WTtUSRdf4v/omWnxTG2fQpHA7dOntLLaC3r7+aDU/8Q7nED60y9kh3tAoPyTBKJZ9dW+9xz
	iobzRfRerkDwEYaJ2U1a+xTxuvAcvG1+Vj6P5Bof05TSpncUOkyOK5vbbdiR4+Mn63u449M
	c7OS+JhG8nwdJxKYu6BK1l1R07B6/qCdqGM+1G+6LjWoil0CmPIzLXlRUdpiHlYlrdxArJZ
	w/g1WBkTOoM+77FWtADfgKojmAbMTzrFuBf9YZDXi2hZYxseXmx4dOIa6GXao1YT9iy8Wee
	SmXyEgwyu/lbmuXNUl0YARVZFuNVMobrKPnncueRWvCfOpdNoELMouMNW8T1SC5739f8H4e
	9YENgcP9RdOikiSHvWobNIZwO61v/gNare7bEZN6IjLGQHIXWRM+DNwR9fTIIpFPULDETwT
	n9zVbdRViXEZemjvyxo3q8uMJ6rksqvXMmJmr1lX648HSz7FitTre8IIOuQS6UlOhKNEH2Q
	QdknSL2xuayV7Sbnvbq/G1cwIU4VDQaDN6ZTarFNcl83PtlVOkSUvueCBMV7ZAdqdWfWqM9
	qDy2yfRiAEDiNIFLTdSx2sEBwNJUys1klRfTtF8M4yz4mfPhP0wu7HXJF+MDqAD/mQBWT4R
	4AzJVFQIKJLuh4vM9rhAa8gbfZP4jswZWkYGoHefcJI69sz7ajOl8K3Yoq2oi8D7IvJ3wRD
	kNcwBX1raB4bEjCZtrXluoODDsktnVnJJ4whYMGzsI1Qugq1ZLKKGkhqS4dCQb5o+iVEgOe
	4YIYAkbjW1H9Otr/ZIdwRdl9CtgHoPFKA7I06pslaDxZs6hoHEk8OCTsghHeecstVk8wRDf
	qKe9iXCCPg8j306O9T5F+5XGSk91ANqx3sd29XCPaO9EOWgnIc0ovfif6RzVMpLSYxvEen2
	QM/Ko7+cB6Q
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On Mon, Sep 22, 2025 at 10:56:00PM +0200, Aurelien Jarno wrote:
> On 2025-08-27 15:39, Troy Mitchell wrote:
> > The K1 I2C controller has an SDA glitch fix that introduces a small
> > delay on restart signals. While this feature can suppress glitches
> > on SDA when SCL = 0, it also delays the restart signal, which may
> > cause unexpected behavior in some transfers.
> > 
> > The glitch itself does not affect normal I2C operation, because
> > the I2C specification allows SDA to change while SCL is low.
> > 
> > To ensure correct transmission for every message, we disable the
> > SDA glitch fix by setting the RCR.SDA_GLITCH_NOFIX bit during
> > initialization.
> > 
> > This guarantees that restarts are issued promptly without
> > unintended delays.
> > 
> > Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index d342752030d077953adf84a2886211de96e843c4..c1656b78f1681729ccc2ebca6e290259d14889d9 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -14,6 +14,7 @@
> >  #define SPACEMIT_ICR		 0x0		/* Control register */
> >  #define SPACEMIT_ISR		 0x4		/* Status register */
> >  #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> > +#define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
> >  #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
> >  
> >  /* SPACEMIT_ICR register fields */
> > @@ -76,6 +77,8 @@
> >  					SPACEMIT_SR_GCAD | SPACEMIT_SR_IRF | SPACEMIT_SR_ITE | \
> >  					SPACEMIT_SR_ALD)
> >  
> > +#define SPACEMIT_RCR_SDA_GLITCH_NOFIX		BIT(7)		/* bypass the SDA glitch fix */
> > +
> 
> The datasheet seems to use FIX_BYPASS instead of NOFIX, but maybe you 
> have chosen the later because it's shorter.
Yes, it is shorter so I chosen that one.

> 
> >  /* SPACEMIT_IBMR register fields */
> >  #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
> >  #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
> > @@ -237,6 +240,14 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >  	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
> >  
> >  	writel(val, i2c->base + SPACEMIT_ICR);
> > +
> > +	/*
> > +	 * The glitch fix in the K1 I2C controller introduces a delay
> > +	 * on restart signals, so we disable the fix here.
> > +	 */
> > +	val = readl(i2c->base + SPACEMIT_IRCR);
> > +	val |= SPACEMIT_RCR_SDA_GLITCH_NOFIX;
> > +	writel(val, i2c->base + SPACEMIT_IRCR);
> >  }
> >  
> >  static inline void
> 
> I trust you on the waveform captures, with that:
Tnx!
                - Troy
> 
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 

