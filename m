Return-Path: <linux-i2c+bounces-13868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D10C163AC
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 18:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707AB1C27090
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7FB34B1A7;
	Tue, 28 Oct 2025 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIgtTH8d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFB7285C91;
	Tue, 28 Oct 2025 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761673167; cv=none; b=nJ5P6dO4GkotGE6jd2NW9ChzC+PFPFXbNDvOWv3SVbrRVoJhKzamvdjMXMy7qAMOAqtK6ZGYRKuLxaLPimq95yj+qVnMmqDAfiK4ixypRM6dXDk/yvqBLmEr44gMgG5x8X/jiH/Xkl7wA2UITNYnXzWp1Ifzk4XcjpnJdthVrmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761673167; c=relaxed/simple;
	bh=xq9VxiMQLPeJ+RT7e9O8/XDnUlQtV2b2hxOpIV+/rs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtqAoWMjDH9/x0tpUVgiKp3yJRqq+6r6vZoivASaUQGCeUFCzyGY+bMdyRb9LJ3vbfM6EX+/PNlVRrt6N7nnbEwIfsH25Aw9s32rU7iQA5grbnoXDFXiwEqEUbG3aq14MbiOoT00fSqKla8wXxRvg2UwXeeP8qnaRcm0iEshKc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIgtTH8d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9C3C4CEE7;
	Tue, 28 Oct 2025 17:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761673167;
	bh=xq9VxiMQLPeJ+RT7e9O8/XDnUlQtV2b2hxOpIV+/rs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIgtTH8d2Q9Oj04YBov4xi127Y7quQHPl6t7F/ehh97+sGCYF8lgaHDwCbBY4U03H
	 zKnN8JUuBYZIWr1arqPKDqcohRcYZemnTSXlogXVD9ryb4SbSsZdBdJUVzjGX/6bEf
	 F2VZ6l0uJ8MKZu8ymi4pzmmO6Y7WQVLE29bQ25g0u5AfbBNgIpBkBU1SZFscQHXlqZ
	 YmrK6Sz+gT1IQFFKJd+SAX/Et0It1VGkPyQTnmacQJDOgG/cljZ/pt4jNmzyWt04gl
	 k7esl8NwXnEfjVQXPWRcbLWVP4aJ9PmY4WSxogVrq+MG2/ud0iodtiyKfykzhc/w22
	 46Hd+M3aO5tIw==
Date: Tue, 28 Oct 2025 18:39:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/3] Improve usage of 'ret' variable and make
 pcf_doAdress() void
Message-ID: <hvj7eqd4uuk6hmqci5xki5xu5b2em7d4law3uyxkzdi4l27v5t@4jj4cymd66ti>
References: <20251023120043.8661-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023120043.8661-1-chiru.cezar.89@gmail.com>

Hi Cezar,

> Cezar Chiru (3):
>   i2c: pcf8584: Move 'ret' variable inside for loop, goto out if ret <
>     0.
>   i2c: pcf8584: Make pcf_doAddress() function void
>   i2c: pcf8584: Change pcf_doAdress() to pcf_send_address()

merged to i2c/i2c-host.

Thanks,
Andi

