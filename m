Return-Path: <linux-i2c+bounces-14385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D73ECA1985
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 21:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EE503003845
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 20:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005292C0284;
	Wed,  3 Dec 2025 20:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5FzEliY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B853255E43;
	Wed,  3 Dec 2025 20:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764795136; cv=none; b=s8jIz2t+uyhK/9k7qhEZQ/WN30xGxPChLSA2HDwnbLjVP5MXugehAbUSuLmAtOmUo9E0S07MyM3LLL1URBR5x/AJI2qfz/iU18bv90RvcipBUTY77+qmRYTYSau6ynql4iw2mBrtfYbgNmjjSkRkTX9Iumoq//XZAB9j/bkkuYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764795136; c=relaxed/simple;
	bh=LnTu2ji+l83YsTdTn49ZGpJGygUyH5/D5vXQPwCH8cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EckgjJrARqG7T8OUjns6PRty5iczXS4AgVOiqUhdKiyi+6WanrqJhdIH5qzBbLgnpM3X0WXxpWOYmFT9EmufMA3BuhH35bcGIJY5y4auqv3GEsUk75pTDoNABXfl8DShm0iq3W3jjxV6CYjpCDbuOzz/Rx6fOIuLZOVli3+4M5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5FzEliY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D13C4CEF5;
	Wed,  3 Dec 2025 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764795136;
	bh=LnTu2ji+l83YsTdTn49ZGpJGygUyH5/D5vXQPwCH8cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P5FzEliYaQeTKpmHr7tPUkJeMGKnfEhFYJVfZmjTjejQfbmuNemHtZbhwaxvTNAMv
	 8HvV1MS5yc/YRoBWDdKMcSxGw2+1rDP7NamYpTXND6dXZBmFIPim5No2cfcDGxXER7
	 mQppJMmI6XKE04E09v0h8yW/mSOWTivdnGxVZe9XBzzS5oudNTTWajzMCiiSW0VDwP
	 /Bl6hSAX2ezXMiK/TqmlN71YAA48znyZi9L5byg1GQdCnyZ+RsicQgZET/mlGRCHFP
	 d8pnY3M0Q23OPjs8y6SKEJCP3OAXJ3znUVI8AXpkmifBYOSpy5CkHvC50nh+qcEs+6
	 EndF4EFb4Zi/Q==
Date: Wed, 3 Dec 2025 21:52:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	jeyaprakash.soundrapandian@oss.qualcomm.com, Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH 1/7] dt-bindings: i2c: qcom-cci: Document SM8750
 compatible
Message-ID: <saeejuf7gglmjgphx6ugw2a2f2he3rkypf52makk6r7z6lxnok@25cxdnw2kctl>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-1-646fee2eb720@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-1-646fee2eb720@oss.qualcomm.com>

Hi Hangxiang,

On Wed, Nov 26, 2025 at 01:38:34AM -0800, Hangxiang Ma wrote:
> Add SM8750 compatible consistent with CAMSS CCI interfaces.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Just this patch merged to i2c/i2c-host.

Thanks,
Andi

