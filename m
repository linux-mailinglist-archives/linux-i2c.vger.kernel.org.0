Return-Path: <linux-i2c+bounces-1107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A35823EB4
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 10:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E25D1F250A9
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jan 2024 09:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BB5208B7;
	Thu,  4 Jan 2024 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xh3IQYRJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MRqTjz27"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3714E208A3;
	Thu,  4 Jan 2024 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4T5LxX19dsz9sbW;
	Thu,  4 Jan 2024 10:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1704360816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B70DhyM+XHlKDKnZ8jGXOAYbR3zpWvPHTzWDUxdkCs=;
	b=xh3IQYRJJXnYTZOzmAPrrldYe7aa+2aio2m6JfHmLx0NrdjvS+2xcKxp+PX7htQBh2lcaz
	QbDjFz0PoWGvj1ShXlt3tC1G7s77i+kKe4E7Zkx3Nx71xqxuu2oFho9zx1xooWrgKYqF8L
	Oe4ypVCbCnuPKfdNySZuP0VHmic1do1iGc3SbqJLGoHK+EPuKiw0XnPZDW+S+isbK2XkVw
	BJz2DS0J1QLfSMOsu3aGu1tGzjxaNdKwt6YKIcdItt1nK5fFJvUT29JycgfrlaYTfmw/qH
	iVcLf/Ru2G9crI4K2ss3ZtwaxigWoP7phQzwIQR0ZdDjpdgvUQ70ObXpGZU9yA==
Message-ID: <7f483c9d-54cd-4c2f-9e7d-9fdb3fd4bbd3@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1704360814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B70DhyM+XHlKDKnZ8jGXOAYbR3zpWvPHTzWDUxdkCs=;
	b=MRqTjz27baddQA03NM97tD9DwmFwdJRENj2qfAZb3w2PSv8+ix9fDwkkkXrpjjZ+W8p/wJ
	GtCSPk8Ur74r4RL2sNiMXunNsPm5E1t1Pa/pJ3d9yq+aMQdN3MjdrKnm+OzTezP1Zz31sw
	8SEMtwlMp7qFBTbCGHbbDOVjKUPLrM8ydfbcckhcO8p1OIbUdfjcUZFFkXn9ys9UB6e17s
	XPHsmpwlY19Cj3/pfXjcdtJQMt/2XEUbRHmAFaq8RAs1H9HSjasnXPz4xMRHuQteXdVn8y
	+NUetXyBoJnT9nclGWmzlaLFWdvI6DjOnG1S+sIO/BOCc2NOWaOdkSdYqAl35Q==
Date: Thu, 4 Jan 2024 10:33:24 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] i2c: core: Fix atomic xfer check for non-preempt config
To: Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Lee Jones <lee@kernel.org>, Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: peterz@infradead.org, mwalle@kernel.org,
 Erhard Furtner <erhard_f@mailbox.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Benjamin Bara <benjamin.bara@skidata.com>,
 stable@vger.kernel.org
References: <20240104-i2c-atomic-v1-1-a3a186f21c36@skidata.com>
Content-Language: en-US
From: Tor Vic <torvic9@mailbox.org>
In-Reply-To: <20240104-i2c-atomic-v1-1-a3a186f21c36@skidata.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 39f56c071403599b82f
X-MBO-RS-META: j5fuf5o34z1y46q48ku5atw3w5cbgsyi



On 1/4/24 09:17, Benjamin Bara wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> Since commit aa49c90894d0 ("i2c: core: Run atomic i2c xfer when
> !preemptible"), the whole reboot/power off sequence on non-preempt kernels
> is using atomic i2c xfer, as !preemptible() always results to 1.
> 
> During device_shutdown(), the i2c might be used a lot and not all busses
> have implemented an atomic xfer handler. This results in a lot of
> avoidable noise, like:
> 
> [   12.687169] No atomic I2C transfer handler for 'i2c-0'
> [   12.692313] WARNING: CPU: 6 PID: 275 at drivers/i2c/i2c-core.h:40 i2c_smbus_xfer+0x100/0x118
> ...
> 
> Fix this by allowing non-atomic xfer when the interrupts are enabled, as
> it was before.
> 
> Fixes: aa49c90894d0 ("i2c: core: Run atomic i2c xfer when !preemptible")
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>

On x86_64 and 6.7-rc8 with voluntary preemption:

Tested-by: Tor Vic <torvic9@mailbox.org>

Thanks for the fix!

> 
> Best regards,

