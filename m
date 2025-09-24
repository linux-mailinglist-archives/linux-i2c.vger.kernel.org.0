Return-Path: <linux-i2c+bounces-13131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A18B9C8EE
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 01:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED9113A8F15
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Sep 2025 23:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0198296BC4;
	Wed, 24 Sep 2025 23:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bleJ9iDL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8986C17B418;
	Wed, 24 Sep 2025 23:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756505; cv=none; b=A5hdbcPB9KBYAI70LaoIjnB93qerw4QRnhD+mPLMf9Q8bRm3RS19jy2/zGoPOW5L2RLnbP/wOakI9VI/w+o4o9AuK3luB8iBXjYfORvaM++1PAJ/tm83xCZ1qM/8dBYuGu2K5lbHiNwAe2lHm+yxET044qKdXDnYDbnyjN68w+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756505; c=relaxed/simple;
	bh=SuoB9sZhksbewmGXecNjDA+OjKmrNNui2aAeVmieggE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbKLY6ruMTZuRDO2FVuSh/RZy/metD2P68sgmJOGKAOyF7gNKSUDTSB7d1Y1Df7dtGp+zflVuvK4ek3W0XXWQ/DBe+PuBzBQ2r5Y4BDPjZa4fac9iNa/8Tc9v+224okN+RcLs9vZy5wByo6I7bpPbKR88pzmlQf5hfcTBMEqehc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bleJ9iDL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38963C4CEE7;
	Wed, 24 Sep 2025 23:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758756505;
	bh=SuoB9sZhksbewmGXecNjDA+OjKmrNNui2aAeVmieggE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bleJ9iDLYM+J0S+ycta0qXg6EIrysrTMakzFjjnT3JboXKQU6VnkWqZc1WQiTe5EH
	 NRoLW5xsiRvjScnxtlRD2GkVaa0ryFVIspQ4fbohDTb+k3JeKXNFAbgDxzDVQq6NqX
	 PgA3yGMUq3QmUUlkxNzFj+5ViHdC7FCYvPLUaQg7N+iRjQczjFqGKTS0CZsU2bGULL
	 yyledXuJ9S2/rRWHEuS7g1toAVGhNciqJ7H3yWsYQm99c72/e5HgsHYxlEoF0h2n+A
	 sJAvgPH5d0sLvjJpllNR0fN9jYgR4jz+yewLhJLqy1QaG0CFO2viwi6rNd7xax4q5u
	 ZTjIkzBgIsx3Q==
Date: Thu, 25 Sep 2025 01:28:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v7 RESEND 0/2] i2c: i2c-qcom-geni: Add Block event
 interrupt support
Message-ID: <eobfxgtssuiom2cuc2zlsvc2hhyi2jk7qb7zydgo4k5wwvxjlz@nksb3x6p5ums>
References: <20250923073752.1425802-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923073752.1425802-1-quic_jseerapu@quicinc.com>

Hi Jyothi,

I'm sorry, but this is not a resend, but this is a v8. Other
than:

1. commit log in patch 1: removed duplicate sentence
2. use proper types when calling geni_i2c_gpi_unmap() inside
   geni_i2c_gpi_multi_desc_unmap()

is there anything else?

Please, next increase the version even for tiny changes.

> Jyothi Kumar Seerapu (2):
>   dmaengine: qcom: gpi: Add GPI Block event interrupt support

We still need Vinod's comments here...

>   i2c: i2c-qcom-geni: Add Block event interrupt support

... and Mukesh and Viken's ack here.

Thanks,
Andi

