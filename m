Return-Path: <linux-i2c+bounces-4058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1490790AD80
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 13:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A79F62864A4
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8E31953B2;
	Mon, 17 Jun 2024 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STvlKhCs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152541953A0;
	Mon, 17 Jun 2024 11:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718625490; cv=none; b=X2XkOnux1T4mae9NALHmCaHx1TJOTzyYSb8kjxPDWmOog09mWLNhOmVHMKZAx33wD2XnIH9KKSz9TE6a/2ZxTi9CHyxUkGeS6RCXOipa9tSC4L56mKebekZo18gSSkVVVC0/uHoZByIoRTNAmJTtSoBZt7DxHpCxevCqepnkdog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718625490; c=relaxed/simple;
	bh=UVjuIfIPKEA9G9EFbnMBUpKmPmVR/D3hyqD2TIEVKmo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8yTt3roHOSD9/2pNwlwP97Ogbnav571/Pa+XUxUNddy5R33QpRGt4fsarG48XRa8uqKc94J9LAJGmxJpt8uPu9BBkudvrhNEz1sMRxzZvYM4+mJ00+g2a31PgX66ngYu8yZi8bEsgTEBTFEwPSFYEwJjDu0lS2RGFnJMfFnWwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STvlKhCs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0B0C4AF1D;
	Mon, 17 Jun 2024 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718625489;
	bh=UVjuIfIPKEA9G9EFbnMBUpKmPmVR/D3hyqD2TIEVKmo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=STvlKhCs7HGc815VSOA+wcWFy0E04ZmSRn/A2Jvg9zmmEB6qaV1VOt244LQt6uiM2
	 t8YaRCOw63ob7XC03nX63kxzdmPquITse6mbUQRHdCIarcGDKBSOHTKDTRXqDSaUZB
	 mh2xnxnUOG+0rLZQBETEI6C3kR7YSL23QpYfpXeeMfoEI56v6mRMB9+lIJ/jHkZqGO
	 CZhR1bZIwuDHuXqji8NqU4Bg6WayrfV6x3jDCHm2fCYsuIxyuzKHRvE1HnvWZqmng6
	 PzAPbwCNp6k6osi6icrDyuO2Xhv+Qp7aRJe8+SSDhR8zzfBPOEU/BQjlzNOTHFyzmf
	 gpdlS2FWfOiqw==
Date: Mon, 17 Jun 2024 13:58:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] docs: i2c: summary: document 'local' and 'remote'
 targets
Message-ID: <y34k2k25xdr5z4v7oejp4da237s4o5qym5npihyydwlbsdh75c@vhmfl7sw3pbm>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-13-wsa+renesas@sang-engineering.com>
 <4zxr4rlqnjqbqh3oxmd2ufqi6uk4pxa3tniuya5pgjtqi6tswc@utq4r2zt6z6b>
 <ed75fyc2xcsnwubq42eposf6ayt5aj2jmqz6mthugk6vm2zpi4@qqwlmuwayoo5>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed75fyc2xcsnwubq42eposf6ayt5aj2jmqz6mthugk6vm2zpi4@qqwlmuwayoo5>

Hi Wolfram,

On Sun, Jun 16, 2024 at 09:14:40PM GMT, Wolfram Sang wrote:
> > I am not a big fan of the use of the word client. It's not used
> > anywhere in the documentation and it's too generic as a name for
> > giving it a specific meaning.
> > 
> > I've seen already some confusion amongst reviewers and
> > maintainers when Easwar sent the patch in drm.
> > 
> > If it depends on me, I would stick to the only controller/target
> > and render obsolet the use of the word "client" in the i2c
> > context.
> 
> Have you read the paragraph "Synonyms" from patch 6? I don't think we
> can obsolete client because:
> 
> $ git grep 'struct i2c_client \*client' | wc -l
> 6100

yes, I know, but I would be happy if we start changing i2c_client
with i2c_target and at least saying that "target" is the
preferred name for what was called "client" until now.

I think we should start somewhere from using the new naming
provided by the documentation.

Other than that, I'm not blocking the patch, it's a great
improvement! I'm just trying use this chance to discuss and bring
up new opinions.

Thanks,
Andi

