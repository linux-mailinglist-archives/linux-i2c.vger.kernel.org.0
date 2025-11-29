Return-Path: <linux-i2c+bounces-14339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B62CDC93D95
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Nov 2025 13:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CDA72347283
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Nov 2025 12:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FCF30E837;
	Sat, 29 Nov 2025 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RQQO5PzT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97252221FB4
	for <linux-i2c@vger.kernel.org>; Sat, 29 Nov 2025 12:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764420020; cv=none; b=nBNWmRmfCeiwxt2ONAxmz5F1kEiBwQvwtEK1wBzZ7KX6CL+13L+c/zF145ttpFNH0qcEHoJ4AuFqdVwaIduZSjCvyE40S3t7c2JVggiKR0MV0vFTKUVsJkQdWZgRtBpPkyn4UiLsBoMYfM9q0ALW4n7YF1xw13vIqWKQlYxZiDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764420020; c=relaxed/simple;
	bh=UslvBf8OQFDqZ971JiPLW+YGWsvBA60efPSkATHyLUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdls9klnFMWCCEpGEWx8TcVLMJZeaElnUuuv/+QJKeT5EeoAAjYJzKSNnuU/xyVMzdqs37Z0PxgM/igRxzlbV/YdmF0s71egFO1zyuvsfh8qiqVVqsAF9uMhKWYsOhev9HIjQ9ZnLgcyPqhNkX9Lxf1BybvBiTo7xFfhYw8EroI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RQQO5PzT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EX5c
	PsxnsUWhdeELFkdGGiHVu3Gfh3SHP/Sov6K+um8=; b=RQQO5PzTHxwIFq3Oi1wZ
	PzXmbU+NogiswCWtHQy5F/ke8VJ2qrj91FX+3BzvtnTJZsWnZXya5p2hsZFJASXe
	5k5cUmC0E5SRzqfMzuUoQvqTHUiplUo4K78CklYWBKgPFZeTcUW9WS86sx5A8oGN
	AhloRmj6Q1o7QDIbQHqLPHfWok3rVRV2ge00ZUM5klWmfkhRNUEIHf31VXtAWdLb
	Tj81lBELw2GfDdiJ5VNYzAm9plETQszyVCZdl6AEmc7ZZuEyO8VrHt0r2OElHHrK
	1cTerrVOSrVuM0GZJdKe2ZFmIb7mMH0k2GizabmuMXRNhBitNXrXAfEC/88Z2rYR
	Ew==
Received: (qmail 4021506 invoked from network); 29 Nov 2025 13:40:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Nov 2025 13:40:10 +0100
X-UD-Smtp-Session: l3s3148p1@MKbRC7tEI/Ld+uUy
Date: Sat, 29 Nov 2025 21:40:07 +0900
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i2c.h: fix a bad kernel-doc line
Message-ID: <aSrpp1l2BQkakfF2@shikoro>
References: <20251125022808.3168059-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125022808.3168059-1-rdunlap@infradead.org>

On Mon, Nov 24, 2025 at 06:28:08PM -0800, Randy Dunlap wrote:
> Change an empty line into a blank kernel-doc line to prevent
> a kernel-doc warning:
> 
> Warning: ../include/uapi/linux/i2c.h:38 bad line: 
> 
> Fixes: bfb3939c51d5 ("i2c: refactor documentation of struct i2c_msg")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied to for-next, thanks!


