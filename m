Return-Path: <linux-i2c+bounces-11570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E3AE64F3
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 14:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4A483B14D1
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 12:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96AA291C33;
	Tue, 24 Jun 2025 12:29:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB19628C86C;
	Tue, 24 Jun 2025 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768156; cv=none; b=X2zkQ69FAfFnyMQAw3UrOx85zeUDGL0NXpT68qX/mYD339P0XijVhnnB2cnYdjyfTsL5oUAH+bfu80N3T3TYgQmA5iWJzfqJ6fv26kEwRWJEM+WXlNJBsuSD6ZBjvUe0Y/+/hCJ71JIGHL5mzpPkoxfukl1ROLkTqdMziLSa7Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768156; c=relaxed/simple;
	bh=HlUi9YhdGknl6g85IsHv3eHpQvxK+OZD1d8vFZhqTJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZqnVVV0nwAyI3ytFMyBjFGo5kKOx+g/F/XxNSNVg5iKhQ27cgINp2jRcDp5xFa/jqPAC/7D3TKS7Rn4ERhGHHx6/Q0XNlVSdULkNO4LsaGVOvIk4EoXmwHZCYf7rznUhqaywRkAqLX+Ua4cIQRmuSEaKNiOtSzJPb5A2A/0zHr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.12.217] (g217.RadioFreeInternet.molgen.mpg.de [141.14.12.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B1C1E61E647A8;
	Tue, 24 Jun 2025 14:27:53 +0200 (CEST)
Message-ID: <7b1f0f17-197d-4c57-b1d2-a9d8ec6ff398@molgen.mpg.de>
Date: Tue, 24 Jun 2025 14:27:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] i2c: aspeed: change debug level in irq
 handler
To: Zhang Jian <zhangjian.3032@bytedance.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
 <63e740bf-cd0c-4671-9254-6846048b0366@molgen.mpg.de>
 <CA+J-oUvm-3G9GRCzjOd+j8K6iNs1piCFAKBNfwih49iFwiB4pA@mail.gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CA+J-oUvm-3G9GRCzjOd+j8K6iNs1piCFAKBNfwih49iFwiB4pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Jian,


Am 24.06.25 um 12:32 schrieb Zhang Jian:

> Thanks for your reply and sorry for the late reply, I was trying to
> figure out why this log occurred, it's quite hard to reproduce.

Thank you for your reply. So few days and over the weekend classifies as 
instant reply. ;-)

Were you able to find a reproducer, or just rebooting?

> I traced all the master and slave states, and eventually found that 
> the behavior matches the description in commit b4cc1cbba519. The
> issue has already been fixed in that commit it was caused by a state
> machine bug that led to the interrupt not being handled correctly.
> 
> see: https://github.com/torvalds/linux/commit/b4cc1cbba519

The commit you found is present in Linux since v6.7-rc7.

> (The state transitions between the master and slave here rely on
> interrupts. When the signal waveform is incomplete (such as during
> power off/on), it may cause state errors or brief unresponsiveness,
> resulting in some log prints.)

Thank you for getting to the bottom of this.

Now that you ran into this, and have a suggestion, how the logging or 
log messages could be improved, please share.


Kind regards,

Paul

