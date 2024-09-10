Return-Path: <linux-i2c+bounces-6481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED597388C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC0BE1F224C8
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 13:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374B918EFE2;
	Tue, 10 Sep 2024 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pW/ek4/f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9556137772;
	Tue, 10 Sep 2024 13:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725974690; cv=none; b=SHucpV64kEEBMAkHiC1EKwJt4NNhZd1P1BS62jbDdVeEDPLsoudclvlmgfLBU7i7o6qv6YWr/PGjuofLZ70jzAybtvnDldGoEg+u13XU/Cxh4OY0mWGbOFlZa0WsxoKvWMsR8GXjFqcu47KlXO+8H/lc/SC5jalOB7SfWjeLQ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725974690; c=relaxed/simple;
	bh=7CMlGVnnxLN2+kBnRR70VGSZMdJx4h17GVQDJYYv86g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBQYZzVnYQKp1FqTZFgd0LnPG2f0aykAzezDVC+sZIvvRUpKrl4dzpBiPUlsc5AwKAadSk9oa1Sj825TycFXDCa3qPKRZjCb1lqM52WB4/crwSDqL7iHXjRPoZcWjICdzyz0tqYk5cjrE/krt1ZuZd3NfxZPUqK03O+4gIobKWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pW/ek4/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADACC4CEC3;
	Tue, 10 Sep 2024 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725974689;
	bh=7CMlGVnnxLN2+kBnRR70VGSZMdJx4h17GVQDJYYv86g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW/ek4/fqnv3tw2TohBzpckvPpu6WwG0VUh1wmzf5ImtLHiHjkoXmFu8ZKnwPcMjm
	 DNPlgBKVtTakO1pB5vqaIdSQjb8hB6F4mmNlO/YD8YtVvAEaJugBMK5UuFhnM/jQc3
	 g1wULD7XGy/4tcMml/YYPH4/i0YbCCixjLs39RLBGSr+sZ6IKU8hxQJ/JwxlJE49dR
	 LMsIYlao3eD1njTWzEn4EFckeNoePz1aRiH1GsOJ/nMdHZOind/Ut88azKRtBEAb6R
	 6RcOtoChqHGoUFehf0vgAAv7Okr4hjUrSMN1nXE7dfZd5+ryEhvqsYYimXVqBN+ktj
	 nk/xNb+XeudJw==
Date: Tue, 10 Sep 2024 15:24:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@amd.com, 
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com, 
	manion05gk@gmail.com
Subject: Re: [PATCH 1/3] i2c: cadence: Relocate cdns_i2c_runtime_suspend and
 cdns_i2c_runtime_resume to facilitate atomic mode
Message-ID: <tdajuroqqqaijoonexauhudqku2kpusumigcongkxbknmjse4t@xmi64zz4j37s>
References: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
 <20240801094408.2004460-2-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801094408.2004460-2-manikanta.guntupalli@amd.com>

Hi Manikanta,

On Thu, Aug 01, 2024 at 03:14:06PM GMT, Manikanta Guntupalli wrote:
> Relocate cdns_i2c_runtime_suspend, cdns_i2c_runtime_resume and
> cdns_i2c_init functions to avoid prototype statement in atomic
> mode changes.
> 
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

