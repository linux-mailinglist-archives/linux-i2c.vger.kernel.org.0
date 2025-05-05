Return-Path: <linux-i2c+bounces-10778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA21AA9D5B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 22:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1DB17A618A
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 20:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF442701A0;
	Mon,  5 May 2025 20:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ncz+Tbkt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF8B2561DC;
	Mon,  5 May 2025 20:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477533; cv=none; b=JWtnhUazSz09aYJFeRycfLyfK3aUkHIs+S3MQ53yBUe3JhEgwRqc2CpL9+dcKaiBx+PDvfjzPrB9YD1q4cg1E7GQwkA9tqQrqLBv2hVwlzMwY+eSCzg0Wba/zZxaTQVPSQ3toUMg95zhwQ1S7Y8nmMAavMiVA80QZPgpeezDwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477533; c=relaxed/simple;
	bh=Nwkb4533cnkgEOovGIY8bmWIMqTqCYeGxbR5tYw46QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4FTEzdz8Ba7ZyK3/p4s7Zz3G+/OQSzQCtXOvppeK089d7Bw7/SICpuxNyUnMv/4yh3BxJjU3qkMsacznnlyW8W6/RAzCxTDzNWH5yLP+ui80saV/r9mlkN/9c2FM7u3LmbHTdgccEmcLckUjaZkiYu7JUuBq241oEveiVsqq4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ncz+Tbkt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90450C4CEE4;
	Mon,  5 May 2025 20:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746477533;
	bh=Nwkb4533cnkgEOovGIY8bmWIMqTqCYeGxbR5tYw46QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ncz+TbktmSTf07F89Z3vST5L7x2VI2HxQppVQkwLJzo1Tld2luiXvdmYLiVhp//7f
	 rHxPilqU3LgSPxmaihCPbJTwjLX9+U5MT0+kO8a6kFg3NPdb/9CsNlSKE41+g4eQ1F
	 xRM//DI4BFJbgc5mNMEAOwOQgHdopU21C6wR/oidwHe2uVl9uArPKLojdt2yWypt0l
	 Neo0CXkyscsTr+HTeF1Ek+ceEs+wHrPndwf/4ogYSKQMr/HUbwi/vH34hCBhErsno+
	 W+YBwvax50EmWl4iV+9iLMcf3I0mplgMw3KWh4u2UI9vF30g2uyDqOdFzQil+88kBB
	 x/zDDalYyAwvA==
Date: Mon, 5 May 2025 22:38:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Alexey Charkov <alchark@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: i2c-wmt: Convert to YAML
Message-ID: <7oxuyl2d6zcv4ucqrny5bytodiqmxdxgcxovdere3cier53mlb@tuuw4ooldnvv>
References: <20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42@gmail.com>
 <202505011756.SZDFqCew-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505011756.SZDFqCew-lkp@intel.com>

Hi Alexey,

> >> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/i2c-wmt.txt

please send a v3 with the MAINTAINERS file updated.

Thanks,
Andi

