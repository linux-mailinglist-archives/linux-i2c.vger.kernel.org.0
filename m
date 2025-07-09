Return-Path: <linux-i2c+bounces-11880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F55AAFEBEB
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 16:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 816E61693C9
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 14:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051D02E1C58;
	Wed,  9 Jul 2025 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NamG7SQz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12CB292900;
	Wed,  9 Jul 2025 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070952; cv=none; b=WU+Aua635kR6v4Jl7x3Gq3S5TooZvs9q9h5FimqyrgSFPFx4Qbl4svzHYsxVuf92ncf7iIERUWT4bjMqGsd1cPnIks1Ri995nq/MNF+MoiXtor/GkFPW2wxSfAvP3zC19SO39KjwEgbnQJzITgs0qvNWc9DGTF2e/ksmG0QlESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070952; c=relaxed/simple;
	bh=RuYtf+o/prZlkiX+R1ATPE24ug38zrQkLBU6YbtB9gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9zk87HtSuVoPOsbDKzbBBm0qpzqHlTDVslQbbIm6ysmFpvaCsRBisc1oa4bx1xTXj2JCqVo6af1nQBgVlbAV9o9bHBmQ++/FjGZwqvCjhpGgNV/S5bonYofS0a9o6HhAEDB16uJVpvFNlxKg8dL8vqnIo56HX9ijPD0KRHNz4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NamG7SQz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6623FC4CEEF;
	Wed,  9 Jul 2025 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752070952;
	bh=RuYtf+o/prZlkiX+R1ATPE24ug38zrQkLBU6YbtB9gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NamG7SQzyQWJ5KWdWWQHeVwsQhVqWV9f1070NVbepNAVaJWziLWvw4WxtupUVj5AY
	 nuKJgYBWeMXoAm/HtGW1fkcZLHjaGk6CQsHImC0C5QwSHqsmT/sknOo5FNWalDWTl4
	 RoIWCU5yClKHjTKMGDEfc4wzk6g+wccEpjZe4+bz0dsQeolEG7j3eZioyxg9MPKdZm
	 9vAPQZ6b0De2Rp/z8XNoJe6moCn5k7qm+d72v7Zl3yIKew+sB6/nEvwPefnoC3jmBi
	 xwwD6e2JbKdag1hgELjSnKJd6l/L+HPlswWndrbN71xXbznIqSyMhHFdlp5tRoZH/a
	 wh0WrBv/dDi3Q==
Date: Wed, 9 Jul 2025 16:22:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
	linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 0/3] Fix STM32 I2C dma operations
Message-ID: <2o7ptcsi2akaphtofm57ok7te7qdxrchygpeqmdjaiushfjffs@5k47ncrcrgxk>
References: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>

Hi Clement,

Thanks for following up on the reviews.

> Clément Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer

I applied the two above in i2c/i2c-host-fixes. I'm not sure we
need the "Fixes:" tag in the first patch, though, as we are not
fixing a real bug. But I'm keeping it there for the time being.

>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

This one depends on the previous two to be appliex, so that for
now I added it in i2c/i2c-host-next. I will place it in the
proper branch after the weekly pull request.

Thanks,
Andi

