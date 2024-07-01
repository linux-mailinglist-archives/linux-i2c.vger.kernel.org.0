Return-Path: <linux-i2c+bounces-4560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 749BC91E6CE
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 19:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A880E1C22361
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EACC16EB6F;
	Mon,  1 Jul 2024 17:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFFaeB79"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47E42A1D3;
	Mon,  1 Jul 2024 17:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719855749; cv=none; b=mn/EA+J2WkkOPbaFQXO2oixrIo08jRtaJi5vqfqaNjp/JGdUcsoVSLQb3OHMlBZYwX3+wM0RkSzJ8YZC93pBVLMEGlmjHzTHxuB/b6tHXYeOwVfmuvj1x/wIYnvOfVeh/JCiJpMR+sKXYql4FN5TYTz9sRQG6IpvtoSCBld6R7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719855749; c=relaxed/simple;
	bh=kGobKE6YPSAtDU0yZCkJD4Zf1Y01NAAOF9patzKGseU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thZNyhgR5MZwIHZ2RZVEK5Vym2USUhKLMvfJI89F+Bq4+jYsE0W7Mekie6bVvb6yVNzYdZpE0bOzF5nl+HOTWWUvYQ0XIKXw6t09lTyEzvldDw0QYosTDvCoxQma0wHRF0ND8CI3i8iFPgWk3L8kxsWlalGSJtb9zgRPmiId34Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFFaeB79; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CAAC116B1;
	Mon,  1 Jul 2024 17:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719855749;
	bh=kGobKE6YPSAtDU0yZCkJD4Zf1Y01NAAOF9patzKGseU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFFaeB79x4Q5Q6wP8OEQ2Rhg9iZ1DipWUjM31+Yj65NCxeB9wAVT2uicuJWmyrzLQ
	 LzQsDHTX63fzuRnmEqLNe/IsiSE2fR+tJTb1P4H5WM/x74eEf/QkXcDDGK4zL+LwTp
	 +7HHZyW7CKY+xVBX83r/9j4rVGQOgNRHguEQB8IHKA3u8K+eLPGRZ0Dwd8gV5WI8nn
	 BXBSUC6W3ajSXick61nAnMFpnFNxZYkA2Q7F9KBnZFNdFhI9ubGYN7SE1cvctNn5tb
	 lY4rWyOM0OIqTK6OxWbhkt4HUm0ZbK2ioTpU9SQ8gHMrVCauI5CphSFdmDv0+ihJWJ
	 CYUYOL116LLxg==
Date: Mon, 1 Jul 2024 11:42:27 -0600
From: Rob Herring <robh@kernel.org>
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org,
	adrian.hunter@intel.com, digetx@gmail.com, ldewangan@nvidia.com,
	mkumard@nvidia.com
Subject: Re: [RFC PATCH V2 04/12] dt-bindings: misc: tegra-i2c: config
 settings
Message-ID: <20240701174227.GA148633-robh@kernel.org>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
 <20240701151231.29425-5-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701151231.29425-5-kyarlagadda@nvidia.com>

On Mon, Jul 01, 2024 at 08:42:22PM +0530, Krishna Yarlagadda wrote:
> I2C interface timing registers are configured using config setting
> framework. List available field properties for Tegra I2C controllers.

How is I2C bus timing parameters specific to NVIDIA? Just because you 
have more controls? No. That's no reason to invent a whole new way to 
specify parameters. Extend what's already there and make it work for 
anyone.

Rob

