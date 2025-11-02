Return-Path: <linux-i2c+bounces-13941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BCFC28F54
	for <lists+linux-i2c@lfdr.de>; Sun, 02 Nov 2025 13:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7BB53B08D3
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Nov 2025 12:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3259AD2C;
	Sun,  2 Nov 2025 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ve76RgEc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BB0288AD
	for <linux-i2c@vger.kernel.org>; Sun,  2 Nov 2025 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762087520; cv=none; b=bqRFD7dlD2KBUXiDbP7p/MfK3rkXi4Ji25OwM9X/pnC1SbqRhzU9KABtnqqGaW1WKqoHS6OcTsM1dpt/XaWQGr570AUfUlT+BxGkFZB9DKK0U423DrX2u4zX/hdIPJBt0SshcFaP+HrKHOfhogd7hNSLcWRL3zyrxmxIrLDQxPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762087520; c=relaxed/simple;
	bh=euCEru8BO4CHIcsm23jyEQNI/kz6h2zU4wzyd9HwpEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMg8BO+gYgeEwKRiV7RgMmiBfYMfngLCZ2QXrVTtKS2ws9B+2fQ8K8KdvKIRMxtbNcXKXvWFQr0oVpil43Odyv0w/xglijyWzF2RQK/jdqCwr4qsj9E5aX9wnHmvU+T+rvKrnrq+Nb+VssOWosS+HvNvNBz0Kob1tWgscxawgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ve76RgEc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9FCX
	eGRB5nwxiHZNvSW8WJ8QeL6xegUsGs8BFEFXEO0=; b=Ve76RgEcDwnLKktwUX3T
	OAtGPvhlFVyJXHg0cgbwe2S/D7souSPU13JEXuh1fSZ+i1uZoTNF/a+Y5iKbgAQW
	Z28MghY0ND5OnVxsdJgu3WNhdzt/QrJkd+sYz1bAdfpEmoGa0K55hSLpuUSC7+xc
	TTM6IIYbfumIjbsWTfpFS5q2e9WuQ7o/7O41C7cbgSKrL6ScXXHHTy39pDwCdzUL
	3aF4NaMRWPJi1WH468ktyV6v/cUMDdppEpDxBfEgn4EBOmfMRxDeRb4TDMfEYRjm
	jmW/ydifulRLB5MjU4+ecRha0OKb+64iT+8cCuPhanSxnkT1M1BUPt/s6wLGYqEn
	0w==
Received: (qmail 1814717 invoked from network); 2 Nov 2025 13:45:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Nov 2025 13:45:10 +0100
X-UD-Smtp-Session: l3s3148p1@BTge+JtC/NAujnv0
Date: Sun, 2 Nov 2025 13:45:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Wojciech Siudy <wojciech.siudy@nokia.com>,
	linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
	daniel@makrotopia.org
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with
 i2c-mux on i2c2)
Message-ID: <aQdSVcazPQl-shR6@shikoro>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de>


> 
> I'm sure that i had tested with them already reverted, but maybe powercycle
> was not complete.
> Git bisect pointed also to "i2c: muxes: pca954x: Use reset controller only".

Can you try enabling CONFIG_RESET_GPIO please? It is probably that this
driver is missing. The core relies on that driver for the fallback the
above patch makes use of. Sadly, I couldn't convince the reset
maintainers of a way to automatically select the driver for existing
users :(


