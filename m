Return-Path: <linux-i2c+bounces-2260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB469875882
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 21:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C39B4B21FBE
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 20:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1111384A3;
	Thu,  7 Mar 2024 20:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdJlvFI/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C770213A87C
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 20:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709843638; cv=none; b=Qsz2fwLobQOKwmhMllb0141nUzk2IxhqZ+684pBuE4AdL3f1sioLid4rmf17zBM7O0sKO6Mihj1Wrjk61nsfpvEBIkwSBULO0lPXMCRxfzPxEN0tpi9JAFHOTTJmaZ6LHzwNIxuM3GKXwESqplVkT/1vOjdokt17qm68CsQDPic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709843638; c=relaxed/simple;
	bh=r+Uhct4BTkENAw1iQN7x3KauzU6yLMEYjYytfpU6gOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKBdaPIn14s/pBkT8DfwXl9wN2ZCR0zoi8rTBZjpaRMb2EjMSV+tEn4ip6aKef3AtD8QgxFi+/bZKz3hcEmOIJA2pypDo4RtVFbyoNi3a+fY4el1yn66og8Fp1zck6Q3NsESUpWCngA9zQwBPv3NN7Hyb4gF7JcuX7wcKG3LFp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdJlvFI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE529C433F1;
	Thu,  7 Mar 2024 20:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709843638;
	bh=r+Uhct4BTkENAw1iQN7x3KauzU6yLMEYjYytfpU6gOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdJlvFI/zglvdH1kqU0MHnscsgCG8LBjatsD62YCs3vLguhOlgPHE/ctavUIAPip6
	 7VIcbMjjs9ULeQQs0aXLfDB7hZiXE5TqN1fjL4jhcMA2XLCxBXRtBDAsFnPvk1rM1K
	 f9R1z/4+0AX2DiErGpBOH6hLLNFi/g/glqAkUIT5FH6RSoSbbB57nDe5yBcKlxk+jT
	 tAg4rbhc3OzGpZGWLpQ0/vnU8UPJEmBUVW90KQQ62NeqI81l1XwaKvXxPSUUz7G9R7
	 BlsiRzeG26ao6ecxedJSe9Jo+2mV+jD3r+cKcpNED2N8wHa7O/V3kJAYuGUWPA7UnP
	 K8OWP09p319NQ==
Date: Thu, 7 Mar 2024 21:33:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: exynos5: Revert "i2c: exynos5: Init data before
 registering interrupt handler"
Message-ID: <fmkncwjun5ohguuj55cnprehs5puxyzzjuis7hmttvqlx4z52l@k346bqj3edxf>
References: <20240307140427.1942235-1-andi.shyti@kernel.org>
 <3bd4acd3-630a-4315-bdaf-9ce0bc5eb6b4@linaro.org>
 <gffyfmg2eouelnqfjbnjrnfi5i26xrkfmukikhflsl7o2cdwz4@pbmre3dyhsd4>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gffyfmg2eouelnqfjbnjrnfi5i26xrkfmukikhflsl7o2cdwz4@pbmre3dyhsd4>

Hi,

...

> Can anyone please ack here?

OK, I have just removed this patch and force pushed the
i2c-host-fixes.

Andi

