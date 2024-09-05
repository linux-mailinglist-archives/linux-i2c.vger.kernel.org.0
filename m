Return-Path: <linux-i2c+bounces-6268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F68C96E124
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 19:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D309A288086
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 17:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E42F19DFA5;
	Thu,  5 Sep 2024 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Do0Wup3R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06B743AD7
	for <linux-i2c@vger.kernel.org>; Thu,  5 Sep 2024 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557641; cv=none; b=aaG3/uKDOHzBPosc+UKK5qZnBcf90da3URvTVBocugIcWhDZPrfbinsbKrmmfoednF/xZ8TnszMX0VcZdQq6ZD8nkbba7GIbUcuQ8WVT02H3i2JP6z7HkdiCUS4ftKBpRtjb2Ry10wD4O0hsghXTrHK58WDc9uAMTSYerenfB+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557641; c=relaxed/simple;
	bh=IAOyvLlFZVAIqeWmwTqNvZ65KodDTtxH324k6zG/azc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIY4dVpHy907OlpeZ0nOcVb+LedZadb861SacxIojZKWZD80nYAdv92J592mXmCRSGN3MnmGH2qh2B29KAnIDUUJgunv/eizdlPZTCWYulqWrB7JdBXzGsvROHE9ZAmsCqsOhb0daFcqmRXoZYGKVVHHlZ8Q0ycxJcMJRWNhseA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Do0Wup3R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E338AC4CEC3;
	Thu,  5 Sep 2024 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725557641;
	bh=IAOyvLlFZVAIqeWmwTqNvZ65KodDTtxH324k6zG/azc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Do0Wup3RguTNNl+Xxpk8hxineFq14Sh73P0822a9xJvqJfBM3uV43AaIhYATfliEd
	 xSTdCvRs2Rwxnh4IglaO/LLdek30/xy+2dGEBuc/M18NaxiUrDXy6gOPLXDOiAEg1M
	 QarC7CdmT8Wb+lQ+2Nadgg6qD5Gq9jAqLa/FCoeQdW+UgU/BPUxQzo5Wr0OkUVa23x
	 FenBtvJlEs1+5fvsNkdGlmG4DIKGJDhskT/S14cp2oxpdY60ecX9AEiO9r7AKm87vD
	 ldX5COCu3LmzfpPcVodmfmDRlq1+TsAj6DTOXAf9dv5RI/sifIrU/byBUavGzqqfHX
	 tJwBAAMgb/00g==
Date: Thu, 5 Sep 2024 19:33:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: chris.packham@alliedtelesis.co.nz, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: mpc: Use devm_clk_get_optional_enabled() to
 simplify code
Message-ID: <t47hyog4e4kf5hwfwnh5iehuj3pv5kow7aclpnfgc7ndyre6ej@3u4k7ssnkryw>
References: <20240904122226.85377-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904122226.85377-1-zhangzekun11@huawei.com>

Hi Zhang,

On Wed, Sep 04, 2024 at 08:22:26PM GMT, Zhang Zekun wrote:
> devm_clk_get_optional() and clk_prepare_enable() can be replaced by helper
> function devm_clk_get_optional_enabled(). Let's simplify code with use of
> devm_clk_get_optional_enabled() and avoid calling clk_disable_unprepare().
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>

Merged to i2c/i2c-host, with some minimum grammatical fixes in
the commit log

Thanks,
Andi

