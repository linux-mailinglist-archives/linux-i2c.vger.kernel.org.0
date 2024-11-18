Return-Path: <linux-i2c+bounces-8029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F369D1B44
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 23:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1909AB22CAE
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 22:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72721E883A;
	Mon, 18 Nov 2024 22:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhL9jvVa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0F8183CD1;
	Mon, 18 Nov 2024 22:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731970421; cv=none; b=IYhyl800bvBhI3yD9gBc/1YFsLkUjhX75EqKqoKkYp3Q5u5QpX2EEDPT94I+YIAFSN0UsabeWaZlxA5fTdBQWrcdpct+t7V5Pwx0gk+Q+DPH/GLWiSOyI2jeEn++eN94G8CO4D12uXjD8+Jo6mVMuJjBMNIUNHtKwbdyyoIAZ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731970421; c=relaxed/simple;
	bh=LxeFH443P3XiwAdqwIJsULBSBIz9MnIhcq3bdOBUiPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLyZIU13/leKEen6CP0YpASRtrELVnrazOc/uotdx6JCjhY5e8OjGAOkjRzS+7cr8ikL4SunGHOHTBHlv8Knx8CsFdGvhKl76vfz4AVv50/qm4x/zS4FBY9ikk0LTwvAvtG7TiyeTpouVlm97UdOQOW7oLzOwcnuOnJW8OMEL7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhL9jvVa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34614C4CECF;
	Mon, 18 Nov 2024 22:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731970419;
	bh=LxeFH443P3XiwAdqwIJsULBSBIz9MnIhcq3bdOBUiPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bhL9jvVaANeQ/vLkvK0DUuESDQq227s/vNzZ6V+vBty07/+IFZzXThZhzDVLLFjCQ
	 w0IRBPe5jkcU3eoeb5k3CdbZ8KA9zCfoNH+MTFPPNoefvAB346qBBNrF0dNDxUcD+e
	 uWTkjubk4T9YZwLOpPDJIW3Hzh+jauButpqrECuqWwN9vZY0D+GNUSCvnJXbRLuZit
	 pvyU8Wm/v5k7mf+H2sNxk6MT49H9A9y09YnCJtjM46bmQcpvYda+QlHIYM7MI3fvP8
	 R2Z7MNP1pGT2O+94/nPyeaOtcI1lpsv9Ew91ajG2TM9GbkO1ZaHJwlkO6eTyf7+f7a
	 mzcRCPPxgRkSg==
Date: Mon, 18 Nov 2024 23:53:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
Message-ID: <h57xw6en4bb7gxsqq7qwq4z5yakavmn26jda36uh34r3ve4kbt@vj35tpjd7d2f>
References: <20241008160947.81045-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008160947.81045-1-brgl@bgdev.pl>

Hi Bartosz,

On Tue, Oct 08, 2024 at 06:09:47PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There's no reason for this driver to use OF-specific property helpers.
> Drop the last one in favor of the generic variant and no longer include
> of.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

this whole thread has gone off my radar, I'm sorry to have missed
this. Thanks Wolfram for bringing this to my attention.

Merged to i2c/i2c-host.

Andi

