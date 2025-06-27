Return-Path: <linux-i2c+bounces-11634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AED8AEAF78
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 09:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 087594A7885
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 07:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9407021CFEF;
	Fri, 27 Jun 2025 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Stm5HhYk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DBB215783;
	Fri, 27 Jun 2025 07:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007611; cv=none; b=uOSV/2BnbiZKjswA6lRMzidA5JLpk5qSzhTly+W4Qp1vrk3eGWy9pe17jrUX6I3JOesdkcNJxO1cYpBCc3GkRlTWbJseZsmX7pjY0SyeSqq5RICvjF+EhUg51TssQlwelwbFIf9tQ22Z4JenrfgYWUOcGtI08Ov6m0JsOc+GIbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007611; c=relaxed/simple;
	bh=bDYAcTGKsVDb6IWccLRj1xVKwNT7RPiW70T7zFFjHYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THgSGpctvL6ukRo3I4O+gjd2IqYz5/c6rw7GmaTcY71vp7SbVr38ZYSU252G+wuvyKmzMt2255qbZ+XprKF/hknnxGjBF1gCpeYtbftuIVNxHCM0HEeg8rwPfeX5WMour8999utUEWkiVJu0Oab4uKXeXkPKI8tAGALWlSwQGgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Stm5HhYk; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 382824EF92;
	Fri, 27 Jun 2025 09:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751007608;
	bh=bDYAcTGKsVDb6IWccLRj1xVKwNT7RPiW70T7zFFjHYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Stm5HhYkUu3h6SLUQiusZ3SjfNQAz1CfbfJUUJZ2Oj0lu3dfUOi42iU3ElQW57su2
	 SQnGE9nJsxg4OuuM0Tj1trCZ7J23KRbeipebbfLsdGQcHeV00lmUvs1eOuDCz0ff5X
	 yKXJZkDuxx7+I9hJOBlDlaKVR6EH5WAAch7bvuTLJIcWWICusFh48YSqOFLgjtqy0k
	 tmPO3UDurTb0UUOpN+m7w1TfNJvAA1zT4y9A8qeICYGzybB9nlSGMsnZ3W6xMWljwf
	 dfyt3ELUTaiTvKOH1p8OzjzVvV2FLT3pnKhhgYmcEWBE4JczYMRuX/7GETCdX+PZ7E
	 0vW4syJXZl9yg==
Date: Fri, 27 Jun 2025 09:00:07 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-input@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/11] iommu/apple-dart: Drop default ARCH_APPLE in
 Kconfig
Message-ID: <aF5Bdx-vmQeufdpk@8bytes.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-7-0e6f9cb512c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-7-0e6f9cb512c1@kernel.org>

On Thu, Jun 12, 2025 at 09:11:31PM +0000, Sven Peter wrote:
>  drivers/iommu/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks Sven.

