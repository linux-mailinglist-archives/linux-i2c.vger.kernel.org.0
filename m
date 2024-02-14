Return-Path: <linux-i2c+bounces-1714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E5F855482
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 22:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 282552816EC
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 21:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E01B13DBBF;
	Wed, 14 Feb 2024 21:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cy0cA1dm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E187941C71;
	Wed, 14 Feb 2024 21:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707945168; cv=none; b=k62J2/aKUTn0PmizdQI1x1JZW5SOPt8A0mgZE0ofaN/6LlAux5BDcvWHnQPnixQVZW78TrXHjt7aPLdvJf+d1w09QpLa0mAspjZUsBPJ3u65v1bOpm0v9ekW799qTa3IVfgGg3r0zXZUU0w48QGlr9SWDD5qtXQtJx8w6fmzQ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707945168; c=relaxed/simple;
	bh=QHlUn7j+whCcTjU2YSEiwH0wkOJ1VRvYJdLbQbKERwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1kDqZ/Ezdq9/GGxlYBYfcdlbhgeZuLqwXyRmiavTrVqDw49xqSGu4FTHdZ30J271omu5FaU3katR58w/Jdl1XAYDLXTO2/iokSlm8FvqZJ+z6YqfX0HjtQtdIyLGnWAANW1cG8uuZrQcYZ5gh6ryHLidr72+hUU7hug773sc9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cy0cA1dm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97A6C433F1;
	Wed, 14 Feb 2024 21:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707945167;
	bh=QHlUn7j+whCcTjU2YSEiwH0wkOJ1VRvYJdLbQbKERwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cy0cA1dm/w3fJYblgoSIz2DUc/m8dwso+8pd3s9Bsyt8i1CGableenwz5zBIaU567
	 OsBXw1kjmiKS6fGS9Y337KXaQBCEkwyFLq4lxkRe26zsYBILb5/nSjBvTvTkNVktMU
	 VhIjjxIUTEIGnrzx1FvfOvuUGsV+/hVIUdgQXG9fFLEidhj46vGHNT4zM8NKnA0sDa
	 CL1fAkzvruDp/rmSCNtMAB3vIjWJOMid9Eso32W/cQllEUGDx2YlfJ34SWT6a40Cby
	 zTSEooISGX4glir10A0h79MEOzqbuAnER2YPv5MLpiisEsM1aBot8ATtAAJxJwwChz
	 G3VfujpmZYtBA==
Date: Wed, 14 Feb 2024 22:12:43 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mazziesaccount@gmail.com, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add custom properties
 for MAX7357
Message-ID: <6wpmx3ivbp5wihdm6nbul6sjxvbkh4oe3sdthdikm4ikofgsiq@vnviyphamouu>
References: <20240213142228.2146218-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213142228.2146218-1-naresh.solanki@9elements.com>

Hi Naresh,

On Tue, Feb 13, 2024 at 07:52:26PM +0530, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Maxim Max7357 has a configuration register to enable additional
> features. These features aren't enabled by default & its up to
> board designer to enable the same as it may have unexpected side effects.
> 
> These should be validated for proper functioning & detection of devices
> in secondary bus as sometimes it can cause secondary bus being disabled.
> 
> Add booleans for:
>  - maxim,isolate-stuck-channel
>  - maxim,send-flush-out-sequence
>  - maxim,preconnection-wiggle-test-enable
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

this series was already applied and I sent the notification.
Didn't you receive it?

You can check here[*] (branch i2c/i2c-host).

Thanks,
Andi

[*] https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git/log/?h=i2c/i2c-host

