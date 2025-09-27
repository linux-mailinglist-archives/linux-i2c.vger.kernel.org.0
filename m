Return-Path: <linux-i2c+bounces-13253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C2EBA6425
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 00:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49EE738086B
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 22:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21581239085;
	Sat, 27 Sep 2025 22:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jIpGYNmE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BB11D7E4A
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 22:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759012103; cv=none; b=f9YxRpBRIrfRGpmVtADYc1eQBuw6Kb6a4b7J7hOW4c56JojSjzeU83k9GCkQrgUreLYNPgluzkqWHjPFnWAZQ8loeY7QZNl1EvfUqxyK6RZimMU1S3jP0HIN5L5PyxhLAvYpm2mNk+MnbHQM/MeVQVWl39dxh28nHd5jw7x9qr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759012103; c=relaxed/simple;
	bh=5OLTzPxIdYsUVeiOoZUF189rauKtei7+nmPm7dDIojY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bx7aAd36bZcPPhcE2Eatm6WSjToE5gWjzNDQLAmwxGF09w5uL/LcHyZtNsUHI4xGSw5R+PdXy2/5bVZsJqBZxyKyp9ccQskwKhnXmtD+TpZgkqCGRdSsKIksiyn//QsKa29JMnWU7I8+K0eSybPAO0Oi5a+qCth6BeMDbU1wNmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jIpGYNmE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=briJ
	+qeic7cY6iPJ4hQ23iKjWHUKZaedrPOQzDcbuvM=; b=jIpGYNmEmhKy6dAwDw2x
	lZhl4atgdndfmdjjy8/8VtkJ3TrSnWiZmGFxnb9dN4yfV7tn0puEq8KJYld+NrAD
	5vlL8ymHOmS69l7lVXtKNNC//K9onlqgdBMsq0O4oP6kkySY2w5PzfzU94JzqVtf
	P8VDxiCVD27mbtaJ7MdaxkXacrVDHThoxLfsNiYlYJhQBIksTJ2FN/8lF1zPHb4Q
	MQz2iSS6Ym7nckR2jeJUd4dohOG7XR5+//uiSa/q44Uejev9v+HEs7Mciocsav41
	Ptqv1MoHv6I4dc/FP1ZpRxkCvJH1Z+l4g7db3UTFut6Vuj2RxwfXUpX2xfAZqoip
	/Q==
Received: (qmail 2702438 invoked from network); 28 Sep 2025 00:28:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2025 00:28:19 +0200
X-UD-Smtp-Session: l3s3148p1@9ZdY688/Bowujnsw
Date: Sun, 28 Sep 2025 00:28:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sven Eckelmann <sven@narfation.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Simon Wunderlich <sw@simonwunderlich.de>, stable@vger.kernel.org
Subject: Re: [PATCH i2c-host-fixes i2c-host v7 1/2] i2c: rtl9300: Drop
 unsupported I2C_FUNC_SMBUS_BLOCK_DATA
Message-ID: <aNhlAyxlUR27eERC@shikoro>
References: <20250927-i2c-rtl9300-multi-byte-v7-0-c0fd0e78b818@narfation.org>
 <20250927-i2c-rtl9300-multi-byte-v7-1-c0fd0e78b818@narfation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927-i2c-rtl9300-multi-byte-v7-1-c0fd0e78b818@narfation.org>

On Sat, Sep 27, 2025 at 11:52:16AM +0200, Sven Eckelmann wrote:
> While applying the patch for commit ede965fd555a ("i2c: rtl9300: remove
> broken SMBus Quick operation support"), a conflict was incorrectly solved
> by adding the I2C_FUNC_SMBUS_I2C_BLOCK feature flag. But the code to handle
> I2C_SMBUS_I2C_BLOCK_DATA requests will be added by a separate commit.
> 
> Fixes: ede965fd555a ("i2c: rtl9300: remove broken SMBus Quick operation support")
> Cc: stable@vger.kernel.org # v6.13+
> Signed-off-by: Sven Eckelmann <sven@narfation.org>

Applied to for-current with $subject fixed to match the correct FUNC
flag, thanks!


