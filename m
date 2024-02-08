Return-Path: <linux-i2c+bounces-1671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 604C884EABC
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 22:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CE6728B929
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 21:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343864F88F;
	Thu,  8 Feb 2024 21:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uqd7Wbt+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E292C4F885;
	Thu,  8 Feb 2024 21:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707428395; cv=none; b=RUUvN9IOG5ESqgXgpn9kzmkfHTDW3kYJtq0IRo4h4yVXObqeM8H+KQoCwwrS/D4ThbCcpGIIGoYB8F3FbWxqV7MWze2BHB8Qjqsr+47Xh6MoR1PM22eIKnXbb6Rwv5L6mtmPoRSoBk4gFb8bTtd8s918dYYmWoPFk4Mv7h9dDSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707428395; c=relaxed/simple;
	bh=/aw+OvxLLTVrblqFPrs+AjTLWWx0BYBW3kgeuGH6yIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+BSE9We/PRPaKCtnlJFe9M4cHUrfy5EV3vb4M574WLlU5c+0fyZmHjD/HWVbpk/BSSEH4HBy4sGFI9mN6q1NKu3RA0hmqrNU1FXQdGzAgNCi2jicf5tDvjpfcDdxHS/wSAyU4VQ+FQ8wb3u6pWJVVBiu+MijfbAVCcMml0ikpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uqd7Wbt+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6223C433F1;
	Thu,  8 Feb 2024 21:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707428394;
	bh=/aw+OvxLLTVrblqFPrs+AjTLWWx0BYBW3kgeuGH6yIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uqd7Wbt++yu1UHH0ylOuLD0orQWN+xEj69kGWsbf0aC58vEMSQzKNOK/YbFtZSWcr
	 FCYPbUZ31FWJ9OvtE1kqBiTGwtZymjPGz7TB1rhdoOD9wKKqElp5WuR9be3Dj9dA2g
	 wGIMdM1+I/TlFZBE+qOFLrclqScqXIfFuXoTBcfWn6LLa3Xl4dStNTpUk/VNHzQwy5
	 ZRFVlhdWmh1nD5px35vJ9VVkY/GSYxApI5ThGv6oeAn10lkNoOkMe7tY1Sim8HMEC9
	 kHmYXjBS6khUAd6Qoi9VE35JQqnHkkiRJrJGsijQm0I9HjKcmh9n8T2bLlKvpCB+pB
	 wqk5YNqlSuzlQ==
Date: Thu, 8 Feb 2024 22:39:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v3 2/4] i2c: thunderx: Add support for High speed mode
Message-ID: <iyrnzksbtt22hjocxkl3j4exge2rnv6tm6quw5utpwumjsuk3u@qv36zs3sestr>
References: <20240206114349.32197-1-pmalgujar@marvell.com>
 <20240206114349.32197-3-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206114349.32197-3-pmalgujar@marvell.com>

On Tue, Feb 06, 2024 at 03:43:47AM -0800, Piyush Malgujar wrote:
> From: Suneel Garapati <sgarapati@marvell.com>
> 
> Support High speed mode clock setup for OcteonTX2 platforms.

How are you supporting the high speed mode clock setup? Can you
please give more details on the patch?

We don't have the specs and would love to understand more :-)

Thanks,
Andi

