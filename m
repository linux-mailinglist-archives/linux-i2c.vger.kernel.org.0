Return-Path: <linux-i2c+bounces-11537-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D65B0AE142E
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 08:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ADB7189662C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 06:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B302248AA;
	Fri, 20 Jun 2025 06:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/EN3rAP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07822222D2;
	Fri, 20 Jun 2025 06:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402115; cv=none; b=E46WxlMm81NoXL3sTc8hysNBFPqntbUhllry1GcaiZ0+EYr0SaHvaN0QS0q6LyP8afMbRqBihwrpuBQa1cRfD/9DGrSakeAWrNzP0TGAkukyyjgH8TXrY7RdYkmG7y/Eo0whe2UQDmmdgh3QnqBrSY3dHT4M8PChc+dUpWP0zK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402115; c=relaxed/simple;
	bh=s20YvBqSFHG/ffmbK7H93MHNtVb1omg0JAoJo9GA+gs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SGKOfZPb9OgLxb0WRbHFDMOR4q2urx7dvpccboh44RaFjwhRIgwrhpq8rdjFx69KVV9DnSvlnLZbqty4jE1WCxbpOQrGw68grIWobXWXsyIot4nAl+q4Ht3XG8I0O6b2mRky3y24+HZcsOpbw1NvfJt3Wbwmzv3fZaDxxaJvxk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/EN3rAP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DB7C4CEE3;
	Fri, 20 Jun 2025 06:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750402115;
	bh=s20YvBqSFHG/ffmbK7H93MHNtVb1omg0JAoJo9GA+gs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b/EN3rAPq21ruaYgE0o5BVdxWtC19uqvFNQ1hm4AtPRM2TPgEq9vgolOLd0hGkNxo
	 grxXmUhoiKgDHAcGbff8sidEEy55rUvE8Fx7mh66jJQCACRvsUqsbgCSvmERZ03z8H
	 ULoaSh7v+JljyjQbg2AsSj2YDCAjx+1k9/94/1xAi+GzUpGwk0+y9ETtORzIiZtmBR
	 79LUtStRG3qA0MSeMeabkT1nkEPZAYuNiblluoPgRFrwCvvXI/VTjEz+ApHkb+A7Ao
	 W1o8EjszEaRVgSqLjlZ9Bp7IZeWtr4F+Xh8zDOB2q5BwtS/TCHMyQsuL8K2A7J+iIP
	 CJpUnnAVS7u2Q==
Date: Fri, 20 Jun 2025 08:48:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Heiko Schocher <hs@denx.de>
cc: linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    Rishi Gupta <gupt21@gmail.com>, linux-i2c@vger.kernel.org, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: mcp2221: set gpio pin mode
In-Reply-To: <20250608163315.24842-1-hs@denx.de>
Message-ID: <p1p1759q-s35n-647s-n694-01o1r5q95131@xreary.bet>
References: <20250608163315.24842-1-hs@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 8 Jun 2025, Heiko Schocher wrote:

> in case we have GPIOLIB enabled the gpio pins are used
> from the current driver as gpio pins. But may the gpio
> functions of this pins are not enabled in the flash
> of the chip and so gpio access fails.
> 
> In case CONFIG_IIO is not enabled we can prevent this
> issue of the driver simply by enabling the gpio mode
> for all pins.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>

Now applied to hid.git#for-6.17/mcp2221. Thanks,

-- 
Jiri Kosina
SUSE Labs


