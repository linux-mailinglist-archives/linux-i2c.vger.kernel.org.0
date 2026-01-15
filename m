Return-Path: <linux-i2c+bounces-15199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF64D26B06
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 18:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDE9B309E2D9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 17:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0B33C1FD7;
	Thu, 15 Jan 2026 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdF/kW1+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD823D1CB7;
	Thu, 15 Jan 2026 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498480; cv=none; b=Dc/HBYV1hLEegMpSUmem89ZP8J0blE9VwyKEYwF+3k5lw/WVejhbwkkVvTvwxBYGTJ3TW+NLpoHmyar9CXn1kBs5RVF4lNVeH3qTL+YW18MOUjQcgLpk/qdMLDiCQjSI7D6N6bDx1mHUlnCCYB6tVqYaOzTIG8KM8pF6K4m2qkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498480; c=relaxed/simple;
	bh=eqKsQEXKvXAkgeJ5/QYcEZonOiGylfwzqxf2ohwLn24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qr8wGdg5V6tMPthtJjNi7tKjQR2eeqmKTfH5jonEPSoZyoEIPQMSDMbujh18xjohxpKnsVQVWIiVsKjLfy8lG70i4VWmF/QJO9AkZ2bKiySY1jj+4l3R/lhkRMAxM8Hr2sWrWt5Iw/45XCiiedXfC2ac/n7hB/J5c+UDXCUAPPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdF/kW1+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86598C19422;
	Thu, 15 Jan 2026 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768498480;
	bh=eqKsQEXKvXAkgeJ5/QYcEZonOiGylfwzqxf2ohwLn24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdF/kW1+qTZxXgjWWufctpM/hbjovmoes7u90qtsI7JMOT0VVVFPfgDj8LGerP6m7
	 Ygvs4lNqxocVb3PL07WDHxHPYt2jAYwbdSnJejo0bTV+t+tvhUz2YrkdMITa55tAYU
	 uLKUPDzPPaCP0Z0Zdw2RnpGYkrLLn4n8EnP+be3x2QtYzAGNnoXfih4Cu+D4WUATNo
	 D7hN/MHZwd5frZTFlMAC9+M9RFLj+4wChPtOF4Kg1sIwKxcPsXF9ZrSFTSpn3h8M6E
	 jucDtfT/2l+x3iTwqdNQWBoF+vzLT5qK3Ka40hFyOIVerCuP0W8idDiLgkBCYYdXA2
	 Vd9IKV1CwtWEw==
Date: Thu, 15 Jan 2026 18:34:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-i2c@vger.kernel.org, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] i2c: rtl9300: two cleanups
Message-ID: <aWklFS04l-_L_yrR@zenone.zhora.eu>
References: <20251217063027.37987-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217063027.37987-1-rosenp@gmail.com>

Hi Rosen,

On Tue, Dec 16, 2025 at 10:30:25PM -0800, Rosen Penev wrote:
> Rosen Penev (2):
>   i2c: rtl9300: remove const cast
>   i2c: rtl9300: use of instead of fwnode

merged to i2c/i2c-host.

Thanks,
Andi

