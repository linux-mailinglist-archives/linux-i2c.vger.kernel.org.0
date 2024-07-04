Return-Path: <linux-i2c+bounces-4622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2904926F83
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 08:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F5F82841C3
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 06:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2101A01CA;
	Thu,  4 Jul 2024 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPmjUgRV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875C125BA;
	Thu,  4 Jul 2024 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720074469; cv=none; b=UD0lsZI9NPraZd4slCBfA60jvX663fWqsBs8tWYZ8XsegSRKLie3UolzpuKY/1t/RpJxn2qOVvo3PSCOwal0KLy/lnwMUj6w5ESaGN+/4h7TPCZNCouO+3o1DSDxi5cqZpSGQJyfiqQNWfY4vjlxBVjBIcpc0gMAN3E2PvrxeRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720074469; c=relaxed/simple;
	bh=kYDgXeZNcIv/y/+dAymkJ0jj3epStVF3HQNyZJiwDDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCkANLOq+IiKWozVTfQ9jzHTASL66yoQhiZA2TPPsfnVrXbqtgtk0XPWQIG/W6K9S8T7MTVtDotyIEUv8MtCZ9eSHu6L3J4j1pPzkFKgscHhf9dp33cZFXE7zkX8ZO2SY2F12oncAtW1HQJzJR4tFxT6BJk0AlsE21kUbHk2OwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPmjUgRV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722C9C3277B;
	Thu,  4 Jul 2024 06:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720074469;
	bh=kYDgXeZNcIv/y/+dAymkJ0jj3epStVF3HQNyZJiwDDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPmjUgRVIzuNKxCFth1CGJ+Vllf09iWcGiP6WZ7Wb/k45M8UKgOBVhqRDf4YEgSYF
	 fK3uBjriycXJ8caXHN+nVfWsiGlZNpfYGOhdSGg7JlZiS5BjLszvz5dtXNOWPcGuaq
	 S7W4e1scUfQ/TBwWGSUoT4+SywhY6I3BhhmWQrfVfHz5CnsXdRlIcoee81Ay8uVASf
	 krvGsgTUq8RSfO/Vf81eL/2KnQjaSblpxfb3KD4YEoB3KNWQ/5mGKYEfEo1a+ppgN2
	 44tqo6HWYLN5jcNmWqwDQJXocmnv3vZS926dFTLNdduRRtNVfYjRNTxwll/Lx7yRk8
	 ucbxTG3uvnuTQ==
Date: Thu, 4 Jul 2024 08:27:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: marc.ferland@gmail.com
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marc Ferland <marc.ferland@sonatest.com>
Subject: Re: [PATCH v2] i2c: xiic: improve error message when transfer fails
 to start
Message-ID: <j4yli5bhj3rxzx4selo66mutjooe24eaqanr4srrus4ognwhrs@575agkscdbel>
References: <20240513160324.3761564-1-marc.ferland@sonatest.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513160324.3761564-1-marc.ferland@sonatest.com>

Hi Marc,

On Mon, May 13, 2024 at 12:03:24PM GMT, marc.ferland@gmail.com wrote:
> From: Marc Ferland <marc.ferland@sonatest.com>
> 
> xiic_start_xfer can fail for different reasons:
> 
> - EBUSY: bus is busy or i2c messages still in tx_msg or rx_msg
> - ETIMEDOUT: timed-out trying to clear the RX fifo
> - EINVAL: wrong clock settings
> 
> Both EINVAL and ETIMEDOUT will currently print a specific error
> message followed by a generic one, for example:
> 
>     Failed to clear rx fifo
>     Error xiic_start_xfer
> 
> however EBUSY will simply output the generic message:
> 
>     Error xiic_start_xfer
> 
> which is not really helpful.
> 
> This commit adds a new error message when a busy condition is detected
> and also removes the generic message since it does not provide any
> relevant information to the user.
> 
> Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
> ---
> Changes in v2:
>  - add a message where the error actually occurs (suggested by
>    Andi Shyti)
>  - remove the generic message completely (Andi Shyti)

Thanks! Pushed to i2c/i2c-host.

Thanks,
Andi

