Return-Path: <linux-i2c+bounces-14379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E475CA0598
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 18:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BC7E30012C2
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 17:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4208328261;
	Wed,  3 Dec 2025 17:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPIUE0VS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E38231691D;
	Wed,  3 Dec 2025 17:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781634; cv=none; b=oQcnJVvHxK2zmT5iaw8pOB9z+rC7MD+n9UYpERK7xY6/vu2GlFq0dF5lw7NdJV6v+3iSsNpqHosCfXD73W4piNh9GAodUDWDpEzSUizlYssDd03ixvkfDL+VVHAFxK44isj7x06Wx5ucInjEM75nQrcVbrCL/3fV6o67AGX5j2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781634; c=relaxed/simple;
	bh=IK2aXYtTNUhwvftN4T/CQnGOt2OyoxBjlX4nNeQr6ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/nLWRhpKdnJNYyK0C4d8VE1dgIodc9uyM5W7G1YcR4Kk8uQU2HJUxMIWfC22MvSZunj7PXXbnbGVc03XQ81mjArjpxGRFz5SkY6LYHA3usU3qytOKy7VTmBImA+1BeyVJuuINP6avZoNSw92tc+6A+kFOUT28QUsp2lC/tQhRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPIUE0VS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6A2C4CEF5;
	Wed,  3 Dec 2025 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764781634;
	bh=IK2aXYtTNUhwvftN4T/CQnGOt2OyoxBjlX4nNeQr6ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPIUE0VSFKGrlERbJqNPkYlVpeUT/qRSXb6APi+dSm3DpPmO85fOc+ica0g662Ynj
	 HloHzRWQfXqAW7Zk9ee3bB0nG13WMN7KaRXAsmFfr8J7mF170SCHHoefUTc9bYuj1u
	 LpceRJAUxYLPuTEHOHVgJef90Y2dWzx9eDy1SJLUNwc0LTaR5Q9tQYQKvdJr1YtOh2
	 xDtlThuiT3vMxTpS0Jv1EREQ3MCacPaMqWs3Q+aENwXcA4FPpv775gtKnRliyiiPyH
	 qjFReCt3hz7mwWqz6o8ezsIu12O2HLHD6tCem3LwSKgrstswHGaZ2TSQZ7x2LCEEqR
	 PwB3/+JLrjcsg==
Date: Wed, 3 Dec 2025 18:07:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Eddie James <eajames@linux.ibm.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 04/12] i2c: fsi: Drop assigning fsi bus
Message-ID: <x4y4m7bclxs3rbb6ptqt6chlg7iaual4wjz2lma5ugdhfp2mr6@phsjcud6vfax>
References: <cover.1764434226.git.ukleinek@kernel.org>
 <ef38106b5099e92395d5cc84d1bf0b806b53d1dc.1764434226.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef38106b5099e92395d5cc84d1bf0b806b53d1dc.1764434226.git.ukleinek@kernel.org>

Hi Uwe,

On Sat, Nov 29, 2025 at 05:57:40PM +0100, Uwe Kleine-König wrote:
> Since commit FIXME ("fsi: Assign driver's bus in fsi_driver_register()")

whoever is going to apply the series needs to remember to replace
this FIXME.

> module_fsi_driver() cares about assigning the driver's bus member. Drop the
> explicit driver specific assignment.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

