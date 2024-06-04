Return-Path: <linux-i2c+bounces-3762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E938FA754
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 03:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03FF7B22DD2
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 01:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E96B8C09;
	Tue,  4 Jun 2024 01:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVUt2EMZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84968494
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 01:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717463560; cv=none; b=urffQnkjFpdNc3LDIoFaOub0YdmeGKl1LPR4QqSlElBBqrz+VEBEoumdI+yw+yhgxNcf8168REe9JkgC3o2KRgAwsgMcx6PQ9N5cd+/a/KJdV8vGtTlijZfWVVS5R6kyGjFTDPXFLIOxrSuqDpwLJjW+1hs6Ktn6VA79mjUpmy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717463560; c=relaxed/simple;
	bh=dJpYpLdHbQQIAWDUNvHrTUvxxzWRBkzdVQoZSyPdjJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJqpP+qeptqQe0YjfMYxPSrcKO+7gMJ6R2M5cp+OO1O57yEyuFee8veLEH7GiB0rLMgvKxFU+FOFa2Psa7G+2jjglLMhWAhpPuhUS01tnkLbm92ZOOZq8ZR51wnYebWFUheh9O0ukAfARqq83WOr76K2g6y9aPnrglqJrt7KPI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVUt2EMZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037FAC2BD10;
	Tue,  4 Jun 2024 01:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717463560;
	bh=dJpYpLdHbQQIAWDUNvHrTUvxxzWRBkzdVQoZSyPdjJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVUt2EMZugl+xM2fG7YI4SVmySgLFo5KV/ev6cVuYyglyGtWnJiXNiaEFyjuG3IBL
	 1OO6B6ub0V3we/4MSMzPBenqJipRJtCFcQohFHWZW6F0v3fpeZ0wGPrcXWkE7jX0NE
	 /bNYvocq/8IeTKEqUU3lAGUoSCv63G/AG7jedbVM8a4VUO6Chqs6L60PhleQlSHt1/
	 ZmWBiAg49r7zqWsKAvo8qCjmKzgfp8LI0IVZqtNZKCt/6GrG8smo7R3va+hfTwhAfz
	 sPsjnrb0BAF8t4/kZge8UdD2qUYjinRS96KqfObSpzB6yGp4FLUYkLoP0u9O62DXfa
	 Gw3xpAyUU5Lpw==
Date: Tue, 4 Jun 2024 02:12:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: dev: Check for I2C_FUNC_I2C before calling
 i2c_transfer
Message-ID: <lwmdtysg42bw5a2bz6kssiolsvj22vylqribzbexvvwbsl4ny6@plrwglgsr2xt>
References: <20240531113407.4df71f5a@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531113407.4df71f5a@endymion.delvare>

Hi Jean,

On Fri, May 31, 2024 at 11:34:07AM +0200, Jean Delvare wrote:
> It is good practice to check that the underlying adapter supports
> I2C transfers before attempting them. The i2c core would eventually
> return an error, but it's more efficient to fail early.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Looks good to me:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

