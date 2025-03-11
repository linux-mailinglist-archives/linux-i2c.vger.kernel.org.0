Return-Path: <linux-i2c+bounces-9792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF28A5D2BB
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D25FA1894103
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 22:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8E12248B4;
	Tue, 11 Mar 2025 22:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejFSraxY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBD1E573F;
	Tue, 11 Mar 2025 22:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741733581; cv=none; b=SHsXNosXfDhEoodtoyCvZGjj3UXpyzpAWeis64Ba8wJ+94txCrVKhtHm+Z7Z0gsMLrHpJhjgABSDWU+9V9QkogbzG948KVI1JlIstGQsapzhTk1mBEELcnHjkpnbcFFBqWuEZcbV976W0xj73PcgZI70gp5mBPD5LR099gcjmiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741733581; c=relaxed/simple;
	bh=KEX5faxsQsWkg721kkVxKxCrx0PVeG7B3p7zEqzbq3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BH56Wd7rj/+NU5xVYfX0ZCQNVvbZ1axFo57Zrgn4bsXC1yawQdFDYMML41nf+ZGisFzvV38lcGxw/M3IbwYrHUze2/apuMfo7OHWmfnErLXXj++p6ApJm709aEeCNzdnkgi21soeLQZlE9B6my1Av3jVbtBt/h94A1B+aKq3wIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejFSraxY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3CCC4CEE9;
	Tue, 11 Mar 2025 22:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741733580;
	bh=KEX5faxsQsWkg721kkVxKxCrx0PVeG7B3p7zEqzbq3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejFSraxYqzOg9hmkx8gLlKzXz6jGLZ1YUSeP5ZVQX6fCbug+BDTzAUIdtIg3ayxPv
	 FJT8PfdUEfkSJZRLJ8qI6HC6JCjd2dB/MrNo3fSVhvWJA5HScaMJIZVmFgVI1P1EVe
	 JGhBlRrHu1DvXSSO8TUfNpv0VSxpFjUhi89G9ukQRmX2u9+zRk7C3cyrEPFWl8v347
	 4YksuuG7U/IQnXn8a0x/jWvlKyWpmJ7mHbe9ZdzvZ5cQjn/ZaduQnWbCJylATeUluf
	 QIXqNj8QGh7QEjTq88CAbhvbmP7XK3lMpzk0ArUfT35v/yZKjFRB/1CKpxNfwgYMMw
	 qKFzG5QL61icQ==
Date: Tue, 11 Mar 2025 23:52:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Michal Simek <michal.simek@amd.com>, 
	Harini Katakam <harinik@xilinx.com>, Wolfram Sang <wsa@kernel.org>, 
	Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>, 
	Alexey Khoroshilov <khoroshilov@ispras.ru>, Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org
Subject: Re: [PATCH] i2c: cadence: fix call balance of id->clk handling
 routines
Message-ID: <rbn5jxvmcl76n3grg3fzc3z5vqgmieixmrq3rkhbpdremlbeze@quqxmsszknfe>
References: <20250303140805.644143-1-mordan@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303140805.644143-1-mordan@ispras.ru>

Hi Vitalii,

On Mon, Mar 03, 2025 at 05:08:05PM +0300, Vitalii Mordan wrote:
> If the clock id->clk was not enabled in cdns_i2c_probe(), it should not be
> disabled in any execution path. If the clock was not enabled, the probe
> function should return an error code.
> 
> Use the devm_clk_get_enabled() helper function to ensure proper call
> balance for id->clk.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: df8eb5691c48 ("i2c: Add driver for Cadence I2C controller")
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>

Thanks for this patch, but it was already sent previously by
Michal and Manikanta.

Thanks,
Andi

