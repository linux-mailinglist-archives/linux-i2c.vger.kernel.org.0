Return-Path: <linux-i2c+bounces-10783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E27AA9DE3
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 23:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 349933BE655
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 21:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5891E1DE2;
	Mon,  5 May 2025 21:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivLOxa1P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350E7A32;
	Mon,  5 May 2025 21:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479737; cv=none; b=SvJ6qyvMfrwYnISANApnQVffnfbqoJM8cEjCjdsiWF2t6DZcX4+prhx4Cydm/RzjBgBw0CnGbNxWbA11NYxMgRsSvRQw4dB3qTDfwUJh+16dGyjAk608ifVnFqyWDs2TbHa+5tsRx0+F8KALFxAQZ6NwC9xanoC+8pKJKTM3XIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479737; c=relaxed/simple;
	bh=bC2rt61Zb2ctmnWbeinCpK12Ybj4VVtOuX9hqkSsohc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGfv3EygCiVpQKN1L2m8DSQOS6tVoAkB1VGeX5PWscmPXyiIERl+4IFpa5p1rBYL8AksXP31EwhNjlzZjZTwp2nQgUZ/8nTn//5b141uDRQmAAjvnt4ubKRGDsoL0zk5Ba1QZzaGns/l6Hc+S9C8kPj7nC4/0guJfB29RSVwpKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivLOxa1P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FDDC4CEE4;
	Mon,  5 May 2025 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746479736;
	bh=bC2rt61Zb2ctmnWbeinCpK12Ybj4VVtOuX9hqkSsohc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivLOxa1P5oj/FN5tqsml2Mta07iSEMct5uNhn5JZcVesqvpih6+/va9RzMFXhvLba
	 380sHDSXmlsH9OP9xGSEuK691G5BsnE1cNYQiSEPRrGYTu1rIK99BlO171J5RacIOr
	 41ooZzm7Viuvhnse9gVNn3RfC4JyPwn57DkI8eH5LTP10GaVBu4HAFRvdPJ4l9GLry
	 7ZHUO+q0RlYkXyUTWotD/QjSLFDM+Qq+wH/Bj2ZK8VH3LrJBFJguPl3X2lXxsJ6lRD
	 MsmCIuasfTWpkTW63Mfb1FN8h48g0jwHG6GVqkh5snX7LqvCH0D20ffbJR7cxLE7YG
	 08MplxlBTK3sA==
Date: Mon, 5 May 2025 23:15:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: davinci: add I2C_FUNC_PROTOCOL_MANGLING to feature
 list
Message-ID: <y4awvwoqshcyvbdlu7ibg5t3vu4rnsthnb2srrug6qjcfw3mq4@5uzqb4tkox5o>
References: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>

Hi Marcus,

On Wed, Mar 26, 2025 at 03:39:47PM +0100, Marcus Folkesson wrote:
> The driver do support I2C_M_IGNORE_NAK, so add
> I2C_FUNC_PROTOCOL_MANGLING to the feature list.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

merged to i2c/i2c-host.

Thanks,
Andi

