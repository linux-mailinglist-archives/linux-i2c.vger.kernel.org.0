Return-Path: <linux-i2c+bounces-8320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868AD9E3CE4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 15:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5A1E284407
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 14:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEF920A5E7;
	Wed,  4 Dec 2024 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="peACJXDp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F56D20899C;
	Wed,  4 Dec 2024 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733322934; cv=none; b=HX2p31R8d6URQmPY2D8Ef6j7wuiXBfFUOF9MabbkHaAaQmUjzUCi4goGxN2riGteHP5DNRIQYlhM8JnH9JGn6aLZYIxX/RK/Wz7xTGc11P5CNsbFPHS/UAYH1dGpznUq5NrU3cjwSfJwhaawFArH0+p4MzIbvlBeSqmVunBFW7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733322934; c=relaxed/simple;
	bh=F2smxZWyr0/EIfcKu7b4h+VrKo0qmCw2IDJihZE1uBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8BKuuGKL/wS2BsUC8pkf/eq9fa2il2311XK5aS5fEiVCV+WXVIqCxcMz2VdhGmJ8McBI/NMAEHSfW3AP+VsGvgNBY4kZv5VCOQ2dVzbJzCuozWtFaVkkqGLgOx+7v8p03KmNlLDuj1jHviBzPRPnWfhDbXoVtOs/v7F5DPSqQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=peACJXDp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6023FC4CECD;
	Wed,  4 Dec 2024 14:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733322934;
	bh=F2smxZWyr0/EIfcKu7b4h+VrKo0qmCw2IDJihZE1uBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peACJXDpsmGkEFCaMw9buw+22RXIKEtLixThUQmHKYW/51y06hR9KFIvEk93bOya0
	 OftgXIcXcC6PlwvH4ymjEhFwZ7Z9HhWmm/OKj3Ns2zmgMhrBeeUeKwQs4oqlh1KgkI
	 k0oiRN3AKQYCL0FIA3q/txH0vmBVNwPnsTwNXvoNv2DOXtOJvFU/La0cK4d/cQcsxd
	 2qGdgL/Kl9XiKGVEf2+Z7fIqaWlv/cuBYyiY73fhjyOXY3fCCmrf0r8jhm08m+Kbm5
	 7u+Ho0KNeusE3JvVxHVfZclUzAYDlhVdD986Fy6w7I6mzBwQ0t+nAYrDYg+YdE8ort
	 /YcrxsZdMn9Tg==
Date: Wed, 4 Dec 2024 15:35:28 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: keba: drop check because i2c_unregister_device() is
 NULL safe
Message-ID: <srqatdqnnb3ltlkovpm7mnrae3y3ml6x77uglovt3ipgx7pzms@elxdkswt74cq>
References: <20241202082658.9673-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202082658.9673-1-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Mon, Dec 02, 2024 at 09:26:58AM +0100, Wolfram Sang wrote:
> No need to check the argument of i2c_unregister_device() because the
> function itself does it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

merged to i2c/i2c-host.

Thanks,
Andi

