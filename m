Return-Path: <linux-i2c+bounces-6657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E19772BB
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 22:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DB981C23E30
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA551BE857;
	Thu, 12 Sep 2024 20:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOiDMmpI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091013CFB7;
	Thu, 12 Sep 2024 20:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726173094; cv=none; b=Dcx7tw7bUKAjcLsghpqypgv+ErysInJco+JNkQkYPywkKmEuv7CAPGU9LTy4b9rINaVRux8H2Qf2YiRgdEqYCaAVYaOBUeunO/c7AdBJAgVkZsEUnXJRRjngi9k/PkOKXkW23SbgsD3yb73+J40YC8s5tDIih1eLPq5P5pyuEto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726173094; c=relaxed/simple;
	bh=T8U1b6wp7ibIw+njMfMHoCAqw5G8qqefpz2hppJxRUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNzCurUdSwp+thqo1NdN2Rgbh3B5m3JYQzSPWZGk4RXIs6fKGk1OYjeOad0zKgXsee8i0rtF5Mq0rBIpMmtlqbZylPc4q0omexbyrGEaIC+72r29+cHjmMgyxDZrrvy7uuo0hQ4Zfr/Bvh/Bf8iaLCUmar5gBuCwiNtR2EWbipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOiDMmpI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2B3C4CEC3;
	Thu, 12 Sep 2024 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726173094;
	bh=T8U1b6wp7ibIw+njMfMHoCAqw5G8qqefpz2hppJxRUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOiDMmpINwcXPW7ctic3yrgfkP+q6JH3vrPATY9CW5RefBK+soiEQrZ4Vd+aSmUzp
	 QiafSnqo0RF8HWEua4j+AOXHEYs4oQ299wU1ekXduP8xlyWNAYn6B8WdTkSV+35MtQ
	 uOc2eK+vs6ohAw1912wpw/NQUzCUASwL1nyu2q8lLqGBhr6VRNxa61dBHqFCrmvj/C
	 vcEiXeU6Mde9PU9gGXwIITxght+cKiELqyGn1yKUKM5sUDA5UoZq9zwzWi2H+vrsnb
	 YLkub8mMsQK2+GWxCTrzDCot4roQOjoYjXpYyuS0WpDSuWKt+mmGKInh4k2PTaZji1
	 3N4rNUn6ZMPig==
Date: Thu, 12 Sep 2024 15:31:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Saravana Kannan <saravanak@google.com>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Wolfram Sang <wsa@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 02/10] of: base: Add
 for_each_child_of_node_with_prefix()
Message-ID: <172617309153.737512.5462269215203973657.robh@kernel.org>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-3-wenst@chromium.org>


On Wed, 11 Sep 2024 15:27:40 +0800, Chen-Yu Tsai wrote:
> There are cases where drivers would go through child device nodes and
> operate on only the ones whose node name starts with a given prefix.
> 
> Provide a helper for these users. This will mainly be used in a
> subsequent patch that implements a hardware component prober for I2C
> busses.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v6:
> - Changed helper name to "for_each_child_of_node_with_prefix()"
> Changes since v5:
> - New patch
> ---
>  drivers/of/base.c  | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/of.h |  9 +++++++++
>  2 files changed, 44 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


