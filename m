Return-Path: <linux-i2c+bounces-8419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A304F9EB3BB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 15:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C6DB2836F2
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 14:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEA01B4240;
	Tue, 10 Dec 2024 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdycJRHp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD291B21A0;
	Tue, 10 Dec 2024 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841882; cv=none; b=qlbL4XzXr8ZLqr7VE2rdZILsU9QEQ4rM0zoM1/haxYiONrCwtwKC2wlknlCmR/SQ8sQ5AltVqxdmEVLUf8wuwOp8RX8c9Tszln/fTEkkEAHmsva7XvbE5vt5uwjbUizxDDt7lePTGZ2JavmFa+1LktFey3/zpJKaZKTUOr9kJcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841882; c=relaxed/simple;
	bh=AjRYZ2VJtejU80IlX2HxiaTlsxJUoltlGTFlVcLHpQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5P57hgIGOwOUoAGsk83lCUgaDzQoJDsP4Hi1wby5nauL2uvJhQmCvh9c0vrnYkZAmK4bZWjBMcjjMjqiv6CeXmkPujXA9y2hAbPskAF0X4SJzAokEOwsWx+oc9g06aRnin/yz0puYG4mEDyBVpKNFERrj5BkJPSe9yjTX3vf0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdycJRHp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E3CC4CEDE;
	Tue, 10 Dec 2024 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733841882;
	bh=AjRYZ2VJtejU80IlX2HxiaTlsxJUoltlGTFlVcLHpQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdycJRHp1JxyChM/BQlev4Jt+WBHegIK7bEUcG39jaon87VovhhZfa/K76f5iEHD/
	 ZOWrsTOWDqeRTuT2mWNol74xiRFYGh5AEK/c7j4ySQ2gn8o79hpbdDIEPZ9/X1i4II
	 LFn0p43zWscvsCjeVaztiEugjdzerFt80iIjosPMyYocq0YB2Ib7iCvd41GrIXu9PK
	 5iH1YogMWmlyR5170hJBn9edSi+FmxIg/8axpBf3+sO02QgOLODXPBD0hm3YucZgw0
	 814nbgIFjrUbl+eSK1rT5S4v1vaqlbsGyDnjhXiO5XqbLWvHiA2CyGTXx3oQ32cbMM
	 rLf+nJj+T5YFw==
Date: Tue, 10 Dec 2024 15:44:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Dhruv Menon <dhruvmenon1104@gmail.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, vigneshr@ti.com, 
	jmkrzyszt@gmail.com, tony@atomide.com, khilman@baylibre.com, rogerq@kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i2c: omap: Clean up coding style
Message-ID: <q35ohbg6k7ow25dkv44kodqmvaco76oytorlnlzzghy74nbzd7@thbdz25sjb3g>
References: <cover.1733217877.git.dhruvmenon1104@gmail.com>
 <cf8f6f85fd0279b8a77e3e89b0cb879494a40cd8.1733217877.git.dhruvmenon1104@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf8f6f85fd0279b8a77e3e89b0cb879494a40cd8.1733217877.git.dhruvmenon1104@gmail.com>

Hi Dhruv,

On Sat, Dec 07, 2024 at 06:12:02PM +0530, Dhruv Menon wrote:
> This commit addresses the coding style issues present in i2c-omap.c,
> identified by checkpatch.pl.
> 
> 1. BIT Macros utilization
> 2. Spelling correction
> 3. Alignment correction
> 4. Unnecessary blank lines removal

Do you mind making four different patches?

Thanks,
Andi

