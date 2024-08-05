Return-Path: <linux-i2c+bounces-5149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D5F948041
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 19:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AF841F237DD
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 17:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D5E15E5D4;
	Mon,  5 Aug 2024 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVXfZGpp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA9F155749
	for <linux-i2c@vger.kernel.org>; Mon,  5 Aug 2024 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722878821; cv=none; b=Tzl26ilyD/tykmeK/Kwh8nqLvGGx/FVxzEsX01Xidt+rerMarwnJEUGqSV0p8uw7cAj7bqmRADBfZVlU1M2Jw/qOijqNWqDHtQJtLBU6qKUM0Y6xdwLfQi5pKOie0Hvn6UboHk3wIAGCvPQ4t+ggxfpTvrFFmyQqOx1HinYN6NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722878821; c=relaxed/simple;
	bh=R8pY9uKDDXH8zkXVp9+e0JSJIq12yqlhpoH5XPl+GBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anfim6tp/Mvc13RNaFn75loBuyrtfirxrTb9eUDbRr/+a3vHJcbHxvJ3mUQkf6A20UbmIhpV7f2ZKt6DUz8bOfx0Zbz7tIMODvX1xgIGmEheAEw87euvI8xknuL/MTptO1lEAsOPlayr2FgTJnW11CE5U5QVKMXYut07pJWALy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVXfZGpp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1A6C32782;
	Mon,  5 Aug 2024 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722878821;
	bh=R8pY9uKDDXH8zkXVp9+e0JSJIq12yqlhpoH5XPl+GBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVXfZGppkqTrM3ht1xTNQ5j8MqpDWwS4bVIZ9IRBmRk4ePPkIXh6JjbGFBExuhbW3
	 hZ5QHsmk2awMYFjogqRR1pILUPRKR7VI5yh+xs7BwlxEtKY6CCzpeX8TInqRQHjmlV
	 FWtAmHtX3wYQtxzHRHgWamNH7i7qkVL7S0uR+yuU+PvW3ObGPC8MhWbn48XZXbSiSm
	 CZ5T+gs/Iav+6tu2IuesrHxHdY8AcU7eJdac007I1nNpfqKe6hZauFfHSdeKlBOjw+
	 /9xniQcqRXlr38RUOXTSWWVq19IFC9R/tBgJ4xS2UwqFrpI5FXddoPQM4vNkHfUh8G
	 nPKp8GN5oYEQw==
Date: Mon, 5 Aug 2024 19:26:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Adrian Huang <adrianhuang0701@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, Adrian Huang <ahuang12@lenovo.com>, 
	Dong Wang <wangdong28@lenovo.com>
Subject: Re: [PATCH v2 1/1] i2c: designware: Fix wrong setting for
 {ss,fs,hs}_{h,l}cnt registers
Message-ID: <di6c5rvbjapddcndjs7jzqia3nki2qzmzrsmutldi4q55wile7@yyo6be3s57zj>
References: <20240802130143.26908-1-ahuang12@lenovo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802130143.26908-1-ahuang12@lenovo.com>

Hi Adrian,

> Link: https://lore.kernel.org/linux-i2c/8295cbe1-a7c5-4a35-a189-5d0bff51ede6@linux.intel.com/
> Suggested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
> Reported-by: Dong Wang <wangdong28@lenovo.com>
> Tested-by: Dong Wang <wangdong28@lenovo.com>

At first I thought that we need a Fixes tag, but on a second
thought I judged this more as a behavioural fix. Please, let me
konw if you think we want to have the Fixes tag here.

Meantime, I'm going to re-arrange the tag section. It's common to
sort the tags in a chronological order:

Reported-by: (it first gets reported)
Suggested-by: (then someone suggested the fix)
Signed-off-by: (then someone implemented the fix)
Tested-by: (finally someone tested it)
Link: (as reference)

I will also appreciate that the Reviewed-by and Tested-by and
Acked-by happen transparently and openly in the mailing list
rather behind the curtains.

Said that, thanks for your patch, I merged it into i2c/i2c-host.

Andi

