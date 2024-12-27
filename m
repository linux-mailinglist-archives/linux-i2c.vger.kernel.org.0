Return-Path: <linux-i2c+bounces-8734-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E46229FCF44
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 01:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C020163967
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 00:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F859460;
	Fri, 27 Dec 2024 00:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmiUHS6T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08A3184F;
	Fri, 27 Dec 2024 00:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735259660; cv=none; b=k3e3bG20R+5qiqFwXrcnJ+cOrsHcICW9v3tID6j/tuVAiPXNWGgrSmIhr//gJbKl4cepwAa+C5LUn/BOo1kEoT51zw3qrjOqJMDCcpbtefKnrdmPMjMtgdQnzDzrD+bd+uySyEw6p8L+ibEgG67nG/I7J/m4XJ5udcRj85xaCS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735259660; c=relaxed/simple;
	bh=b+gm1WSzwJE9pv5g6KUpAQXcbNCHd04L3jmCW0zzBRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Awq1S5VAIZgnSN49nD25SBXOg9C0YpfsOP+Eq7yizu9TmDPzmgfqI/YC/Lo/UbRatiyudvZDPt81fPv0Xb0cTSO1+wEG3HoeXNsfojOu2KYx/bgfDzimaki3u+/0u8W/T6ezb4o7/oFWMovQpLuw3q3QSVjzZ0iP/6OLNlq9XWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmiUHS6T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE37BC4CED1;
	Fri, 27 Dec 2024 00:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735259659;
	bh=b+gm1WSzwJE9pv5g6KUpAQXcbNCHd04L3jmCW0zzBRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmiUHS6TySLMGKePlezMOxMkxAatvmMvvPHB/EjLta1hWsADt4Q4SzpUiJKctCK77
	 R1Wu+SuMXoi++HZgO0r+DXJUCHF6t/GaBGZU4sdYIo72ytCzsAZXYcqUNyROZ9Del9
	 /1/6csmTfZkNZkuBtg3u2/iPhCaeAW+6H/El4qeQuwYR9mxNRZ/mdw9MXNMjlOdZpZ
	 muq/CW5ikFl/2PaUavau9+6l66ea8hUpoJNraIqr96+LcPmy6xcuv+A+XmWOlqhpnP
	 1+CEcJS2mEXuSKQ7zTJMPbY9p7EHTir5YUqkwkvyUcnYvqf3TJSbPjccw+679fT6EE
	 NINe52RhA+l5g==
Date: Fri, 27 Dec 2024 01:34:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] i2c: imx-lpi2c: add target mode support
Message-ID: <vfesmhe47tj5cwib4dl5zxxy7sn5g4swjg7tozcv2otcqgsjpd@sjj35a7c5fhu>
References: <20241125143140.1613282-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125143140.1613282-1-carlos.song@nxp.com>

Hi Carlos,

...

> +static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
> +{
> +	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
> +
> +	if (lpi2c_imx->target) {
> +		u32 scr = readl(lpi2c_imx->base + LPI2C_SCR);
> +		u32 ssr = readl(lpi2c_imx->base + LPI2C_SSR);
> +		u32 sier_filter = ssr & readl(lpi2c_imx->base + LPI2C_SIER);
> +
> +		/*
> +		 * The target is enabled and an interrupt has been triggered.
> +		 * Enter the target's irq handler.
> +		 */
> +		if ((scr & SCR_SEN) && sier_filter)
> +			return lpi2c_imx_target_isr(lpi2c_imx, ssr, sier_filter);

you have answered my question here and thanks for that.

I was trying to apply this patch but it didn't apply. Do you mind
resending it?

Thanks,
Andi

