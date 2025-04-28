Return-Path: <linux-i2c+bounces-10667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CDBA9FD38
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 00:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96E1A1A87ABD
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 22:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992FF212FBE;
	Mon, 28 Apr 2025 22:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qKGA7d4I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFFF1DF988;
	Mon, 28 Apr 2025 22:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880317; cv=none; b=Ps2Iqdj53byfkfprnQKl/MpVqX8fO3v3Y09QCY1RozbvMfWWCJw5ft5h/fuY5EcNcqgbzwg4wGKkCowdQUahD5bpZ5bDsXvUCI3A99YCysYaaGgUOB7K4sWlWhQ5dlOJvfhQZqZYACSCihRH2FaWGn1D5iy8fgE45wfuidG09ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880317; c=relaxed/simple;
	bh=iEgcLTkDkFJOT7HlI3aSWIUb6zLNar111Rw+B+KVd0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMUd9a018oGnlQgHmEdOLpxFIiBzBEcxJsUNVTqUezeQVALVCuw9rgKNeVNPsX2xElyopL+JGZXF6949F+NZQoMF6ZINn99AJmxbg62Av2M6UXdKPs4gY5b4MoD3nPA0b+oaYV/xKWJHkiuga/i7QP4XBytkMs1sXCQQ9rkUML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qKGA7d4I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986C3C4CEE4;
	Mon, 28 Apr 2025 22:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880316;
	bh=iEgcLTkDkFJOT7HlI3aSWIUb6zLNar111Rw+B+KVd0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKGA7d4I1Xv4lnO2QEvAFptiF/Bk8yCyZlzREFkxc8/ZbydV/Io4cKBOfsFiepgbx
	 faoR2VNi7zkUBoJk10MO/Cy+DPlgiJf7FQnBHCd9GwRokCO6HNBXQbFFhr65FUiFmc
	 Ipt4egabLR2vqhIJpvijiGY3y+5zCOUMlvVDnL2w8K1EyM6OSneipar6rwIBIpfLoh
	 35ITA8fTL4cG8OcFr5r1VIiZArG0GO2mf8LM1FVUQBBaql/FwO029E5PPjrIARsiUD
	 Rz990rOVpRtTaZxytBdzAqS8q3wpYYuBhgM+LS8juAwbkU0X1hvbS00qrq3xI/G00c
	 BPha6HbRhfIKg==
Date: Tue, 29 Apr 2025 00:45:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Apple/PASemi i2c error recovery fixes
Message-ID: <enap4curtpjaiazxpcsw3sk64aq2i7wqi3iwm6l2pfph5qduwj@gkagpeazcumg>
References: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>

Hi Sven,

> Hector Martin (3):
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Log bus reset causes
> 
> Sven Peter (1):
>       i2c: pasemi: Improve timeout handling

merged to i2c/i2c-host.

Thanks,
Andi

