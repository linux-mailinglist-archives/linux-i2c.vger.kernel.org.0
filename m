Return-Path: <linux-i2c+bounces-2589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E313688BB79
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 08:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979F51F3746F
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 07:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0F3132C04;
	Tue, 26 Mar 2024 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nujfpUs0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915613280F;
	Tue, 26 Mar 2024 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711438798; cv=none; b=ZV1611txFaHmvHxJQt6IfJ4oNaJPaqSrnDv9rsC9+7umgWboMtok+D1G/n27P8xNKe3GOdWhz8trpAxeLjHcTvKWx5hXsLS74onVitUtUNpejhuwxSub8VPbj7d73DwAYiB+42VxxTZezHLL7oaMEODVoBSprYDbxg+wBfpEkyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711438798; c=relaxed/simple;
	bh=pgwFamyFeHFUIj+JYpvS+mKDX2A3H6iz8GDwro8OhT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6b/4a5P965KoaJv9YomqyQvU0JDpAtVA+FcQRo1zYZK4WuNTdV4T6XQ4h0S0d9+SbdnTBmFAtBC1RCRJ49CFVdVX7mnCjk56ldEt1pecFwEuB1FW5zXjLgKDJfXux1AaL6MzrsENUsMrt2OKqrGdQrPgq8ivnbKbKPLAIJRa3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nujfpUs0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAECC43390;
	Tue, 26 Mar 2024 07:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711438798;
	bh=pgwFamyFeHFUIj+JYpvS+mKDX2A3H6iz8GDwro8OhT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nujfpUs0QdwbIorjqf+cCedd5W7lmZ/hQZzUJa2SFw9xPqIOXlc9t0TW3gG/dUtnt
	 CqeXb2suHfdT6wsi1i/0IYzLiNg9eZnXqBQGcuXpeEF9uYOa7Qgifl1yiIj9a15Mw9
	 4ID3OEuNSljt9CJr26Sq2W/ZfGX0rseuq4Y9fUgFE9xmxgSdY21PKgfSg6mJNhDlRN
	 VzdiJMaYetA81WW6+ZsuNWmE6i4dH9ChfpIjlJPhxJDsSShUx45g0nLSq/7DDLNE2p
	 5kBcjkyIfoQuQoUU5hpEy6a7iFUBbkzDtgZ9nP5LkW4WdZUQ2i3T4mrkmey0/xT9XA
	 PqFox/+Aja9Tg==
Date: Tue, 26 Mar 2024 08:39:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/64] i2c: bcm-kona: reword according to newest
 specification
Message-ID: <n6oj3xiwuhx7uanrawm5v5s5odtgc323jpsflr7v6gjjltrd45@tav356e5ikk3>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-9-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-9-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:25:01PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

