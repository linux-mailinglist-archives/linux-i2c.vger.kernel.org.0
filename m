Return-Path: <linux-i2c+bounces-6889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BE797D345
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 11:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E55CF281E13
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 09:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E870558B7;
	Fri, 20 Sep 2024 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjA93GLd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4133A26ADD;
	Fri, 20 Sep 2024 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726822990; cv=none; b=fM45kFmc+jmKgpH5QoaxnnEq6bK52lGCUeIUSljyFFmPrudKe3X1ytFRlaipU4j/2QnPOVOrv6nggIBEJXuSqo1FntyJCTU6Vx35r4eIO9VRljzIJuG7W5Qg+ribPAf7UnElRbC/ySfR76nZ6vhuQSyik/PU2TVQnvT3IpJ6OAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726822990; c=relaxed/simple;
	bh=T9rfR01McZkPyR8+9RiFb/Mr0S/GZzf/+jc4afE/C4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxPbg6lR+QSsR73/kW9yL7fnfZreuF0n917KmLKWz3lEM6hXxJajUwQBy+d+I8inek6V9XMgC8bMcaY/5+gUgDmB3qNFhEiu6bXN7euTHU5OZuaqT8NtGt06YOEgFkS+OICtVt2EyDvCLkfua39gntfbdCgoRciLSO/loRPmkCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjA93GLd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58BBAC4CEC3;
	Fri, 20 Sep 2024 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726822989;
	bh=T9rfR01McZkPyR8+9RiFb/Mr0S/GZzf/+jc4afE/C4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjA93GLdvV6KVPbUEI2XtRST31VQKW5MVVJH+bP9e5yF+mjFcViPAj4wAjvjFwzW6
	 +dhNuDPi9wgMU+icgKmOZPbLX/VPtwASnKMT94FMWVp05+MhvPKcEqjMsnY5BvyPCP
	 mqNqFck/LpJRq7Uf9o77+BqiQ9ieEsTbgLqskO9EcVmUBjkPkQ8TasiT0hJqcgqg3d
	 oICGcI8AgnlAECPos9j/CIq1s3zTkGAXf9wzVo7JI6THPcw1fnsaY0F8DL8ocebYXb
	 nQOzS0APZ8G/K2jxHx+u3YkWL23Ghlb5MOIPGCbgBqkV/i4V3FD9vleTSYBdDPR6Sz
	 Qii3TaMlBi/1w==
Date: Fri, 20 Sep 2024 11:03:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-i2c@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	stable@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] i2c/synquacer: Deal with optional PCLK correctly
Message-ID: <dmwsrw6mwt3zsksxxb35qokhtf3setobeybhd34w52typxx4ld@zbjvamsqwfxt>
References: <20240912104630.1868285-2-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912104630.1868285-2-ardb+git@google.com>

Hi Ard,

On Thu, Sep 12, 2024 at 12:46:31PM GMT, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> ACPI boot does not provide clocks and regulators, but instead, provides
> the PCLK rate directly, and enables the clock in firmware. So deal
> gracefully with this.
> 
> Fixes: 55750148e559 ("i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()")
> Cc: <stable@vger.kernel.org>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

I'm sorry for the delay, but I needed to wait for the previous
batch of fixes to be merged.

Merged to i2c/i2c-host-next.

Thanks,
Andi

