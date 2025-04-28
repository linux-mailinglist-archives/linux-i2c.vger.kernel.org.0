Return-Path: <linux-i2c+bounces-10666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB19A9F987
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 21:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DF283ABD8D
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 19:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8614D15ECD7;
	Mon, 28 Apr 2025 19:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iC5te5aj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE142AA6
	for <linux-i2c@vger.kernel.org>; Mon, 28 Apr 2025 19:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868658; cv=none; b=OksnshOBXhzcsRYc+WZ1kohryyVOvUC3W18m8Zgzt7+7/ni4lW2EmACcy5p/5jhjW/KBWMoVQv+raQq4c0nYxvpsDHCA4I2vDE/WsCsOFZaScfIlxcWZBxLiond6kCVb6bEJU+WSfTIhJUCtojpx48DtIJTvNIFGboQxpahLC6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868658; c=relaxed/simple;
	bh=DJeR3ktAPtij/oM4F9bBTuZ8OWA82J5NoBOCrzdKfM0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAS+UZ6R7VKXewP5wDR+Gw/ODfYxCvBMtMGS/ujGSDqcYgvOQk7idnge2pDlqu+jc9XCKQ/9urIFbUfswlvv9Rk/hunHa59hVh9+pEZmb3DOh4b6eSE+RNGEKw5QP+ORKVGaNTp4iO7V0qG8uX1gf7d/+cdbMLART4oXxm+syfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iC5te5aj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32633C4CEE4
	for <linux-i2c@vger.kernel.org>; Mon, 28 Apr 2025 19:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745868658;
	bh=DJeR3ktAPtij/oM4F9bBTuZ8OWA82J5NoBOCrzdKfM0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=iC5te5ajOsf65jWRacULELAhVHvV5B7/6dBFRz4dUJjB0Evp4RBtnovc5m338CkWz
	 YYEnkPwlx9IfnAm7uejHBo+H5ZuooaSJX2Nz8r0rlrFDk3EeoPx1yBnLKAnfsQJhnt
	 leOU7eflVaCBYWUzgZVsyEw7rWFZ7bEXDvoD4y7NH+wfxPocSPY3fhtVUEkPHhKwXh
	 4obr361Uc4mhDpbwUGb7Ojnb7BhVnfjfGeFiJUcCgfXnvX0UhrByFVxB1Jse8nvLvi
	 kEvXYAOR5JtY2MVdUIQxNuq2nW7RMHXs80erNjEIysGtuKxxXSB5kcUIOgxayQBe+j
	 bNzaVChpzBDsg==
Date: Mon, 28 Apr 2025 21:30:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 00/10] Few improvements on the Broadcom iProc
Message-ID: <zw74krxgwsi6qjhlwb7l5bd7e4y2gdomwbdyrzmxborr7muovd@3wwzehqwmizk>
References: <20250418211635.2666234-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418211635.2666234-1-andi.shyti@kernel.org>

> Andi Shyti (10):
>   i2c: iproc: Drop unnecessary initialisation of 'ret'
>   i2c: iproc: Use dev_err_probe in probe
>   i2c: iproc: Use u32 instead of uint32_t
>   i2c: iproc: Fix alignment to match the open parenthesis
>   i2c: iproc: Remove stray blank line in slave ISR
>   i2c: iproc: Replace udelay() with usleep_range()
>   i2c: iproc: Fix indentation of bcm_iproc_i2c_slave_init()
>   i2c: iproc: Move function and avoid prototypes
>   i2c: iproc: When there's an error treat it as an error
>   i2c: iproc: Remove unnecessary double negation

merged to i2c/i2c-host.

Andi

