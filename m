Return-Path: <linux-i2c+bounces-2242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85987424A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 23:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F272B236E5
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 22:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5401B81E;
	Wed,  6 Mar 2024 22:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYKmPuYc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BFC18EAB;
	Wed,  6 Mar 2024 22:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709762420; cv=none; b=ExARuevngvxquzh8aigsapVI2uJvvVtRUGtvGIpYs1UzSOZm6LD4olbcabMb/yq+uF3a69YtD1CjEWzTve+Q3VDleEQSho3kYXo55faSXPChEksDqBzJyLmfjhr6wBLSb13Pv96q2KaGDwwYII5MooSmXz223y++0Bo9/f35ksc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709762420; c=relaxed/simple;
	bh=qmyA+76tawkU47ZsawPwDXn5EXrh6A6vzOTcfu0Eg9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8JKfLju51K7PooJycToCJrYqOjhpq9APfZHmZmgE2LDHN728NPpLfZSN70SMVOgFQYLelR8Pr0COzqZIxbcl2NANBLejuLZQtom6mJz0XXBSwskTJkrMUpFK2akVSxGSbLiDu+8UQ4yxs3BFNq4GkDRyD1Z7JAsoplQWZJFzVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYKmPuYc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4360AC433C7;
	Wed,  6 Mar 2024 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709762419;
	bh=qmyA+76tawkU47ZsawPwDXn5EXrh6A6vzOTcfu0Eg9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYKmPuYcr+ebuJBz+G9bT+S54Ftpj89JkiD5vpe5U80aNPwioK5UnujX+LFqyfRHq
	 jtj6xdyKgEeGTkZDj7JrLT2IXeIjbxlQ1jxfhg01aYW/tYWgvmbPzxIFeD304ZvBp2
	 FQEzm/SYDtogBAsgR1N606P6/casrzxaXvqmNfXEf/pSG2li+xszkPbmSt7yHIin0P
	 aMKftKRoIqQkaqG+QZYgHi6DPpkcGP4HTebkd7IDaLpfek9gZ2zuVYrv32Ro4A7AWI
	 QKfApfmlTZiLumb5Y+1ehAr8s5pBXxZjm9/MNez4Y1E0RB44nwZ6ZrAn4pFyuoPQXQ
	 kOse9f+pW47jQ==
Date: Wed, 6 Mar 2024 23:00:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Naveen Krishna Ch <ch.naveen@samsung.com>, 
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH v3] i2c: exynos5: Init data before registering interrupt
 handler
Message-ID: <aw7v5lu3ufutytrosjuzwnws7vg5uqlhs6bwinaibusl762ef4@5eeqvsxo3fp3>
References: <20240305-i2c_exynos5-v3-1-17a749688806@axis.com>
 <170972613133.1712532.6066452137196640811.b4-ty@kernel.org>
 <5a2d1071-5410-4c91-adfd-3d6384c74f94@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a2d1071-5410-4c91-adfd-3d6384c74f94@linaro.org>

Hi Krzysztof,

On Wed, Mar 06, 2024 at 04:14:30PM +0100, Krzysztof Kozlowski wrote:
> On 06/03/2024 12:55, Andi Shyti wrote:
> > Hi
> > 
> > On Tue, 05 Mar 2024 11:50:00 +0100, Jesper Nilsson wrote:
> >> devm_request_irq() is called before we initialize the "variant"
> >> member variable from of_device_get_match_data(), so if an interrupt
> >> is triggered inbetween, we can end up following a NULL pointer
> >> in the interrupt handler.
> >>
> >> This problem was exposed when the I2C controller in question was
> >> (mis)configured to be used in both secure world and Linux.
> >>
> >> [...]
> > 
> > Applied to i2c/i2c-host-fixes on
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> 
> If for any reason this is going to fixes, which marks its importance as
> fix, then it should go to stable as well. Please always cc-stable for
> such cases.

yes, thank you! I should have checked that, as well.

Andi

