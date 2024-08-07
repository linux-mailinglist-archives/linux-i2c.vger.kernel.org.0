Return-Path: <linux-i2c+bounces-5181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55250949CB2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 02:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 140D8285495
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 00:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52B910E6;
	Wed,  7 Aug 2024 00:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UidWjxB+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4E2383;
	Wed,  7 Aug 2024 00:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722989690; cv=none; b=GdUfFz/6J2BMJ/BCmqxGcpHbpsQ6IZVqPTZKAsUlqRzJR3rFulqF+3NX0uUBT6vr/WPOBAha+51hfU190D4RuLmnDwaXle3OzmVKmkz3j7MWKxMBK9vU+5SF3TUV4TvFbDb83EoerNRpgqKQrK86bswOhP9yv43A6M2I5pWRC/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722989690; c=relaxed/simple;
	bh=1ljpXDyDB1RItJPMBZSMFbCJnzE3Uombm6fzwivOYq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gn4a6660Gen1SB6OU2Um2m4gXJhb1UUVOYFSw/wPw2vR7Noy9FsvGyGWq8HJ1v0ryyXf0y5Ck2LC6sObDAU8rDRDnPTBWYsAea60vOLc7YAj0G3nr9B5PfqRH+FsQ89E96J9xl6Zi4J+nK+mm8F1jyNsu203gP4TQCa4dWPNfiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UidWjxB+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6C4C32786;
	Wed,  7 Aug 2024 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722989689;
	bh=1ljpXDyDB1RItJPMBZSMFbCJnzE3Uombm6fzwivOYq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UidWjxB+PMscPCWgAza7YOyHAPpl6n0iDotjoOvi/VJPVNcQcpxv8Dz7UjxjuGtPf
	 ng+YDBtzja6tMsCZphRFYQ8tBiJE+aT/2sPfJ1LCXijRyUbx5JrLlUv/rPEyvjGN4X
	 ZgtJTPFqXlbjDJRVU7O/BizIUcAVq7rGcDiYSXBymOLASqPZHwLoHMdJuSyX0H7UKU
	 5H5ODrSjWAsum3xO6mCZFEWflJcsac1JSqiwUO/0SBOsnn+Taz2FefVTmJvw30UEto
	 TDKhZ5ckJ8xEHGrSYfHwaQRE5od3zj8slQD7g/7V/Z4YIp4U2Wfzjr3m+A7/IOC8ws
	 ay79/HNHj33AQ==
Date: Wed, 7 Aug 2024 01:14:43 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: mka@chromium.org, akashast@codeaurora.org, andersson@kernel.org, 
	wsa@kernel.org, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH -next] i2c: qcom-geni: Add missing geni_icc_disable in
 geni_i2c_runtime_resume
Message-ID: <cu4bkeyoegz4tdfrvhhdyv3er3oiyuxbwkwfm7z5twbqydc6r4@j2z3ak5arbd4>
References: <20240806125331.3170546-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806125331.3170546-1-cuigaosheng1@huawei.com>

Hi Gaosheng,

On Tue, Aug 06, 2024 at 08:53:31PM GMT, Gaosheng Cui wrote:
> Add the missing geni_icc_disable() before return in
> geni_i2c_runtime_resume().
> 
> Fixes: bf225ed357c6 ("i2c: i2c-qcom-geni: Add interconnect support")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

merged in i2c/i2c-host-fixes.

Next time, for fixes patches, please do Cc also the stable
mailing list <stable@vger.kernel.org>.

Andi

