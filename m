Return-Path: <linux-i2c+bounces-13754-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85318C0157E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 15:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8793ADE32
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 13:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDA32C325B;
	Thu, 23 Oct 2025 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOtZYF1G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B33C30C345;
	Thu, 23 Oct 2025 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225839; cv=none; b=rh1nTi33SXuthuEIYI2qSoaAbqQVmTPysoQRJyk6a3VFGgtfRGI23k8CACFUz6d3JawbIUNuKOTOPwnpNp+KpaDzclCMg3VDWsNnaON1HkvdcsQDfBd8LfrTPIyFpRbm18wKX0lL2ptWQ01udUe2fe9WTh1Ao8ilN+TQDKt2uKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225839; c=relaxed/simple;
	bh=E2NYm+oSSuwPTCB3C9XH+GdhQrkEeq50J+FLYikuL/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaJ+6aL4PYYZRnKxtZ52/ezGE6XHhHyAlBAHmM+g3L8ORHpRfEhwYNS+4MwgTIAPcfr18NffT4w9PNhN86AUnd+xndV9/MMsnaI/sDlhkEC2mwaTJ9w4yxUB9vWnOSA8DHpM31Uh7Y/B8miIIQIT8V+CxgfVDzbFbZavivG+z80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOtZYF1G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E317BC4CEE7;
	Thu, 23 Oct 2025 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761225839;
	bh=E2NYm+oSSuwPTCB3C9XH+GdhQrkEeq50J+FLYikuL/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aOtZYF1GY5GWvvxzGHRUxvVLCcHwxGokZYS536ED1OoOhLhDYLOmqNpRNsPZzuKB/
	 HXGkUUaF+n7aaShBmffJH1ZtqZc6cYY5Ba3beNkRALcd9dDEdJiBzvMIQQ7d81SsWQ
	 ykABnTlsfmVI9wTD1StnOi2g4yG1LnMVWR8mJjBKGJvgGFSH3fbZtEyeyorXnqjFEO
	 Gaant/5HDkUM7ZYuqOcLyGcp21BDcYnJmh97H4LQK1/dO273E5etDlwPyuEY3n278g
	 T+TxtjPXbptRXLzZS9Z+pZK+B4kRwP858i7XZUUMWhjhQPDWHbEYHd8sckgCHyK1Px
	 Ri0tsYVAs5d8A==
Date: Thu, 23 Oct 2025 15:23:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jinhui Guo <guojinhui.liam@bytedance.com>
Cc: mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	jsd@semihalf.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/1] i2c: designware: Fix SMBUS Master interrupts
 storms
Message-ID: <aop4kgp5vrp5rzvn4z7laa65rzqjev467eoeyzpssglzdttulz@xrwvbzljtmx2>
References: <20251021075714.3712-1-guojinhui.liam@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021075714.3712-1-guojinhui.liam@bytedance.com>

Hi Jinhui,

> Jinhui Guo (1):
>   i2c: designware: Disable SMBus interrupts to prevent storms from
>     mis-configured firmware

merged to i2c/i2c-host. Next time for a single patch you don't
need a cover letter.

Thank you,
Andi

