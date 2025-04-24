Return-Path: <linux-i2c+bounces-10612-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CF2A9A982
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 12:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B30E43B24A9
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 10:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100682206A4;
	Thu, 24 Apr 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAnRedN1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47A48634F;
	Thu, 24 Apr 2025 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489315; cv=none; b=pZGeeT+rJDdn5VFUE6fMVuVxOn1iyKn/xg5fTCrUK6ow8ndnkZpWoOqNWYwFfNaL7WTs6f0DG9sKeV2WPORGtnTv/70/RAAth7UkuDZWNuiLjGIH+YQd5NO+hZJlcit2Xtpok8oK2PDJbcLwJ9Z3wAymfNA1ICCvUUuvRMk7Oq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489315; c=relaxed/simple;
	bh=JdE54r9ZohrtmbJJkasp8N8gBU1hTyTPJPYQI4eC3wA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FZp39/2cPdqSks9bO3WObC4oOJborej9bwMU9DLpwZvTxoqNLZhFZOMIBN3JMKUZ5bAWjgtkxYQZambFexKeZyVZL5HXCsRhmk5Qa2HWHXmlcrBL2RDm1NLCxoDpIa5Ny9oNfCNuLRF4Er1mljbzHTSa42TfcFNstJJ4NcwaSPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAnRedN1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EBBC4CEE3;
	Thu, 24 Apr 2025 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745489315;
	bh=JdE54r9ZohrtmbJJkasp8N8gBU1hTyTPJPYQI4eC3wA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RAnRedN1IFIxNtMhsWKwTfx1I3v0hL3MARICqEfBr0P9MeEldiLRqdX3MkQnI2ilM
	 /gi1vx8JHRvQWd7gTv4jn4OzZNdKQ6acwn6ahHwlq8/KVm3ReUbs1SQuUT8ipqpHVr
	 seee57/gXOklgIu0MIOsBbp3TxDk3zYmQ8xcQjsMEs6dO8KfrTmNLctQDZe61zQqYu
	 kW7PwYOXjDEUWbnwVMEHbrcjeVigO1MU3K+SUwwvXF7GbSLrs2iLC7HVdsWoQ4gBzc
	 kZV9WFNEQq2nMyXHM7tR2U0zKbTLy3RWFHyDhS0uhT2o9UGna4V65PagL+SUOih3He
	 ZqfUcyLNdc9mg==
Date: Thu, 24 Apr 2025 12:08:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Linus Walleij <linus.walleij@linaro.org>, Rishi Gupta <gupt21@gmail.com>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
    Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/6] hid: use new GPIO setter callbacks
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
Message-ID: <p14r429s-2437-q342-1qro-oo2n163o3q88@xreary.bet>
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, Bartosz Golaszewski wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO drivers under drivers/hid/.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I've changed the shortlog prefix to 'HID:' to follow the usual subsystem 
style, and applied.

Thanks,

-- 
Jiri Kosina
SUSE Labs


