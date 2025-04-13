Return-Path: <linux-i2c+bounces-10294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48493A873BF
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91671188D761
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 20:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2140D1F3FDC;
	Sun, 13 Apr 2025 20:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJSjaxJM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E91F3B87;
	Sun, 13 Apr 2025 20:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744574468; cv=none; b=Lx5RV588OgAT2IJGwcZKSwtQV7OOmhcKuMvGSC2lsWRgYUx16sXGISVCoJvoK4L4TIHQVMLHwA65LLiQXo496zMl8WYMzbHw6LFY0MMKoHw21/ZhbqrADdVDpYFfD+bWrbs/Ode1lotEnQ5Of3G932XIE9Dh5heloKfqA01AoEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744574468; c=relaxed/simple;
	bh=mBFfUee3RE/ORcogTSmYi0S8W7Std6PnRpce5lpwtgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEHkgFomfH+yseMAyghs9Hk2CBcu+OlDKRRqN/rgKzRoPXfexxrv9+zBzythhipF2WzYcxcm19lUYkVvQwLt6Mjf38jtyCmGuvK8pvs8IKuHvTIJZJ8ny29xKcPQONUFD5NylFsbLEx6qXU0v5tXMrZQMr0pDZMzNSOIu5aqoXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJSjaxJM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C246C4CEDD;
	Sun, 13 Apr 2025 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744574468;
	bh=mBFfUee3RE/ORcogTSmYi0S8W7Std6PnRpce5lpwtgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJSjaxJM4QqCUxleHQ5qGPjrnyRDnJ9NOWy1OiDGoaBA7PUry14TZHm7qm7nvc1XG
	 IOXC8rrPvrbh+Y7COhTRoNdD12cAXduQqoDY1hNHtXP+uVM0KTscPJaQXjpM7CK0EM
	 dlQ7SZWfXhQFln9VYaEXQrXoiO8IJJYW2afClJUPBAdg4UkppTntLNX9ctUJsD39IZ
	 Xx/g7SUBdIaww/K07eV2qMkenTjVYWiuuKURsUIl/Mp87iJtfcmZ5E4pyDGh1nDPH2
	 3o49EY6Cf3v6SSJLM+afWRNfzDgOc/4d5Gkak7+0454of6DVNIwyqXHXiFOBjqqPAa
	 PPwCPVgelqrQg==
Date: Sun, 13 Apr 2025 22:01:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>, 
	Vincent Palatin <vpalatin@chromium.org>, Simon Glass <sjg@chromium.org>, Lee Jones <lee@kernel.org>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH] i2c: cros-ec-tunnel: defer probe if parent EC is not
 present
Message-ID: <yh2uau644cq22qw5wnj7cypg6wf5aoef7a7z7smbvkva56jtle@dxzs6etk7cb6>
References: <20250407-null-ec-parent-v1-1-f7dda62d3110@igalia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-null-ec-parent-v1-1-f7dda62d3110@igalia.com>

Hi,

On Mon, Apr 07, 2025 at 05:33:34PM -0300, Thadeu Lima de Souza Cascardo wrote:
> When i2c-cros-ec-tunnel and the EC driver are built-in, the EC parent
> device will not be found, leading to NULL pointer dereference.
> 
> That can also be reproduced by unbinding the controller driver and then
> loading i2c-cros-ec-tunnel module (or binding the device).

...

> Returning -EPROBE_DEFER will allow the device to be bound once the
> controller is bound, in the case of built-in drivers.
> 
> Fixes: 9d230c9e4f4e ("i2c: ChromeOS EC tunnel driver")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

merged in i2c/i2c-host-fixes.

Thanks,
Andi

