Return-Path: <linux-i2c+bounces-15229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B108D306A8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 12:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15572301D9F2
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 11:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D983624C0;
	Fri, 16 Jan 2026 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBsnbGzU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651B435F8CD
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563117; cv=none; b=DhocZjhx9+DTsbbBJE8Ec7LPfRvWdhLCim4wX2G82EMyQuojtBNskHT7A8YryUN1qnZu91Afob91G7/uAwcbfyhS/XGHtswV7QWqMK4opW2yVavRXXh98pJGdM5++bw2p9+Kqu9gRxE2uLcotylHP8wDHfDaijqNYsAESVUPL9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563117; c=relaxed/simple;
	bh=R9lZLajSMbJWA77KRJcCH4ZNqlwIE0hU836Al9rI4uU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qI8VXGb5RhuXbzwD+eH/uqy/rJFmrTjwsLT0HnDqgrZR+djhuKsZ95gyhzNyn6OYSMBJt3NtFYy8rF0hvXbkNmVuUenp+DzNko1VGbF4Iq1Rxza5Po3YhBFsIDZhTFa5q7QojlXx/d+JnEimEthbbbkr3NX2Ou8J4CUYZZdtONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBsnbGzU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB9DC2BC86
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 11:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768563117;
	bh=R9lZLajSMbJWA77KRJcCH4ZNqlwIE0hU836Al9rI4uU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=LBsnbGzUlVBb3rMZbbaR8Ny1GaAOA4UmMnSiuRcUjIdG/o8NeA8KbXAYRgyeAn3zR
	 UWHgeLl7XhuoxZjwSffDBiglthpeV2MLI8+ezlsffnor/7UMbLqa99sFxLl+1BFeDu
	 1P/sIovY7IUUkc+pNLgUVorbpQcVowC5QaCTGuarjKD+6LtkH4D1IgZfdgV9+M+8vI
	 N19pEClBTVS4AdH0dWMyhzNDPI5X5xMxcVmF4qXxXvC8oGRr+ndk6QHHgqBpEEbyrG
	 /c6SWrUXsCYG4AeqZhmQ2T4cyIWIxXIXug78TMA0Gv4M1kb+7VlYagtzp5+JLvkAHD
	 6uJ4Ey15m8frQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b6f04cae6so1989687e87.2
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 03:31:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtl4ak1YDK5Wu+uwiCbOR26rpjZI3AkM9u1DoBCSVi+IZ4unvjT7v5fhDEFY3dIkmf0UlslhIXDto=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaH/1pjSwTEgaWq7w4BXn9n3g606p/x97IOcW4/MgVjG55xtay
	ySjUWGhRsPfSU1wwwIPP4K7Q2ZxES/rG5ex5JBejoeHW6fEkjf9Tvlg1SD9CK9q74ZKVfg7+O0g
	bE+1DdXc/lSFpmoRgnnPP8O5AcEGcQBm+PSYNhKd0LQ==
X-Received: by 2002:a05:6512:3c8f:b0:59b:6f57:e3f9 with SMTP id
 2adb3069b0e04-59baeeff3b8mr839800e87.37.1768563115688; Fri, 16 Jan 2026
 03:31:55 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jan 2026 11:31:54 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Jan 2026 11:31:54 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aWkx4wa955UI5kKy@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
 <20251223-i2c-ada-dev-set-node-v1-3-2e36e0e785b4@oss.qualcomm.com> <aWkx4wa955UI5kKy@shikoro>
Date: Fri, 16 Jan 2026 11:31:54 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdqfKX1U=ePhNWT5LAsrYyAk-86uF=+OjrifG=+CAnRUQ@mail.gmail.com>
X-Gm-Features: AZwV_QhKZFE-Qm-qHpgZgIj_0ZljvjVWOOOHq-gipDI7-hYpixbZakgTnRh16Bw
Message-ID: <CAMRc=MdqfKX1U=ePhNWT5LAsrYyAk-86uF=+OjrifG=+CAnRUQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] i2c: gpio: use i2c_adapter_set_node()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Jan 2026 19:28:51 +0100, Wolfram Sang
<wsa+renesas@sang-engineering.com> said:
> On Tue, Dec 23, 2025 at 11:06:50AM +0100, Bartosz Golaszewski wrote:
>> Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
>> This allows us to hide the dereferencing of the embedded struct device.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> Applying this patch fails for me. What is your base? I don't have the
> commit referenced in the first patch series. I tried current top-of-tree
> and current -next.
>

It's v6.19-rc2:

$ git show 9448598b22c50c8a5bb77a9103e2d49f134c9578
commit 9448598b22c50c8a5bb77a9103e2d49f134c9578 (tag: v6.19-rc2)
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Dec 21 15:52:04 2025 -0800

    Linux 6.19-rc2

Bart

