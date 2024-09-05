Return-Path: <linux-i2c+bounces-6287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB1396E5A2
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 00:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB6FE1F240A5
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 22:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350281A726E;
	Thu,  5 Sep 2024 22:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhW8F7vN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CE414B95F;
	Thu,  5 Sep 2024 22:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725574201; cv=none; b=sGnigD4OBdBSTtvXYX/W+SUZMnIBvFl3CGhwwwZjgzgP/R5S+ne5hB/omGEafbO/mumWiLe8r3yYEH5VYnFhpDP1KEAYEnb1/C8VFmDVgN7y7a8IGwAmgxLIt9TKsT0tUQBa7bbY46gdlm6cSO4/hwHtXw6OLtDf2kt+AMkR0/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725574201; c=relaxed/simple;
	bh=vHaiXF8jFJgRzwoyRWonjyeyJm3/gmc7FeB29SMdR7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxW3Ue4k3NPrktcH54l8sSIswWldoAoYw3CuXp4jKt6B5CcaFimU5Ir+avjQonZrxkLbgWFXhATGrfopXyLvF0SQIzgwYpMPXPBiWYmjuUvS+BswAKOsen3e+0eNKO6djm0hXxDE1mxgEeN1cnZTnAmbrv0DpoC0OYU/48H9io8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhW8F7vN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27C0C4CEC3;
	Thu,  5 Sep 2024 22:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725574200;
	bh=vHaiXF8jFJgRzwoyRWonjyeyJm3/gmc7FeB29SMdR7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhW8F7vNyvRDrKI/dAIAIoBP1jOvx4sViDSPJogt8bsc/Ji/rY1ABi+nFaLXcXO1G
	 sIntLcRMsSDqj6iBxEKBLhy7wWqcZj26TDBIH+z9iMAQ+dtzh5IGngCN84bYJeiHI5
	 hlqIRbEjLOWYYDMhxwuHXskEk8EBq6v4WjzfGkZlzeLY5JPNE4tJxaNCRpRGzSa1hC
	 VP9GrGlavPYAyO/MY4TAPACnsSNLI6r43igZ8BR/MEdjEghXPpCNEBESwxZr/c1Ot5
	 i5vpO9vpJ0RO9ZbXjFq+C3Cn3sYb8/57qqi28yC8zRNGH9OAS3CyxL47e3K96l9QDZ
	 GAvesbmXO1hoA==
Date: Fri, 6 Sep 2024 00:09:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] i2c: imx-lpi2c: add target mode support
Message-ID: <qcoguhxtkwn2aowtccfybutn6xgzrqvhdob4tzericerpfntfh@q6f5upgegba7>
References: <20240829105444.2885653-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829105444.2885653-1-carlos.song@nxp.com>

Hi Carlos,

Looks good, just few little comments.

On Thu, Aug 29, 2024 at 06:54:44PM GMT, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add target mode support for LPI2C.

Can you please be a bit more descriptive? What is this mode
doing, how it works, what are you adding, etc. etc. etc.

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
> Change for V2:
> - remove unused variable ‘lpi2c_imx’ in lpi2c_suspend_noirq.

this was part of a 5 patches series. Is that series superseded?

(please, next time when you send a series with more than one
patch, include a cover letter).

...

> +#define SCR_SEN		BIT(0)
> +#define SCR_RST		BIT(1)
> +#define SCR_FILTEN	BIT(4)
> +#define SCR_RTF		BIT(8)
> +#define SCR_RRF		BIT(9)
> +#define SCFGR1_RXSTALL	BIT(1)
> +#define SCFGR1_TXDSTALL	BIT(2)
> +#define SCFGR2_FILTSDA_SHIFT	24
> +#define SCFGR2_FILTSCL_SHIFT	16
> +#define SCFGR2_CLKHOLD(x)	(x)
> +#define SCFGR2_FILTSDA(x)	((x) << SCFGR2_FILTSDA_SHIFT)
> +#define SCFGR2_FILTSCL(x)	((x) << SCFGR2_FILTSCL_SHIFT)
> +#define SSR_TDF		BIT(0)
> +#define SSR_RDF		BIT(1)
> +#define SSR_AVF		BIT(2)
> +#define SSR_TAF		BIT(3)
> +#define SSR_RSF		BIT(8)
> +#define SSR_SDF		BIT(9)
> +#define SSR_BEF		BIT(10)
> +#define SSR_FEF		BIT(11)
> +#define SSR_SBF		BIT(24)
> +#define SSR_BBF		BIT(25)
> +#define SSR_CLEAR_BITS	(SSR_RSF | SSR_SDF | SSR_BEF | SSR_FEF)
> +#define SIER_TDIE	BIT(0)
> +#define SIER_RDIE	BIT(1)
> +#define SIER_AVIE	BIT(2)
> +#define SIER_TAIE	BIT(3)
> +#define SIER_RSIE	BIT(8)
> +#define SIER_SDIE	BIT(9)
> +#define SIER_BEIE	BIT(10)
> +#define SIER_FEIE	BIT(11)
> +#define SIER_AM0F	BIT(12)
> +#define SASR_READ_REQ	0x1
> +#define SLAVE_INT_FLAG	(SIER_TDIE | SIER_RDIE | SIER_AVIE | \
> +						SIER_SDIE | SIER_BEIE)

I'm not happy about the alignment here, can we have the columns
well aligned, please?

> +
>  #define I2C_CLK_RATIO	2
>  #define CHUNK_DATA	256

...

> +	if (sier_filter & SSR_SDF) {
> +		/* STOP */
> +		i2c_slave_event(lpi2c_imx->target, I2C_SLAVE_STOP, &value);
> +	}

nit: no need for brackets here.

...

> +static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
> +{
> +	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
> +	u32 ssr, sier_filter;
> +	unsigned int scr;

why is ssr unsigned int and not u32?

Can we define ssr, sier_filter and scr in the innermost section?
i.e. inside the "if () { ... }"

> +
> +	if (lpi2c_imx->target) {
> +		scr = readl(lpi2c_imx->base + LPI2C_SCR);
> +		ssr = readl(lpi2c_imx->base + LPI2C_SSR);
> +		sier_filter = ssr & readl(lpi2c_imx->base + LPI2C_SIER);
> +		if ((scr & SCR_SEN) && sier_filter)
> +			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);
> +		else
> +			return lpi2c_imx_master_isr(lpi2c_imx);
> +	} else {
> +		return lpi2c_imx_master_isr(lpi2c_imx);
> +	}

this can be simplified a bit:

	if (...) {
		scr = ...
		ssr = ...
		sier_filter = ...

		/* a nice comment */
		if (...)
			return lpi2c_imx_target_isr(...)
	}

	return lpi2c_imx_master_isr(lpi2c_imx);

Not a binding comment. Your choice.

> +}
> +
> +static void lpi2c_imx_target_init(struct lpi2c_imx_struct *lpi2c_imx)
> +{
> +	int temp;

u32?

Thanks,
Andi

