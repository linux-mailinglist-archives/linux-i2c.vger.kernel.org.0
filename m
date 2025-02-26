Return-Path: <linux-i2c+bounces-9598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB08A46E5D
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 23:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94290169480
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 22:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDCF25BACE;
	Wed, 26 Feb 2025 22:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDOkHq1L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A34625BAD1;
	Wed, 26 Feb 2025 22:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608324; cv=none; b=rIAet46XRrULp/p7zvwsYpxmQfcnuqN7/oqg1u6Y8HfhYs/hYn43JSt78k4w4jDJcc6/9nlcRxaVs9nw5N63K82/DBbfuzbwliQvH/tVwnEdwPw47RsQaGjpm57Zzp52osjAa5A+8WogcOjMI0XP1qEe/WuAbKDo3R7f/pf+Zbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608324; c=relaxed/simple;
	bh=cLP2PJ3efgcI4MlJm4t+DzhLwIjEdO/2/L9titqg9gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATLoPv6CztKvkBtTZqiFnpmPZcXYtSuQ0yrEoj38D2qH+gIuUOl1g2498kVn5W71viQIg2daiQoraSOEvEf35u/A8E9ZbnF5iJUbfnpLgYtQwxkF0KrL6WbC+BYJ2P9V2UUmI6txJcVa4IAZB/FlhNgsSwNouzqdvbwxAnVT09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDOkHq1L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06700C4CED6;
	Wed, 26 Feb 2025 22:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740608323;
	bh=cLP2PJ3efgcI4MlJm4t+DzhLwIjEdO/2/L9titqg9gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDOkHq1LSz8+rDhpPeKIDjaUTYNumfgRX5ZOU1iXaXruj+N/vdG+yCiSCpSd9OZ71
	 mrqhf0NF188mNe2Ui+t8PgXAGxnORkAOzirbifapyAT1RC151lXbSdVwRkLhriHOzm
	 1VZL/o9OJinE/GJatkq76y/6AYyXI7LzwN9V0iy3Q6poeUeJDeHk1zh7ICREaQOsCl
	 RLFEFK9RN91sY+Tsx0xHJ4JC4Dvvbx5rJ8wVheA2HOCDOMA6+RtCEEGACNC3EuO7HI
	 rOaENGjy3wCFo+6we2UgpnTF0eGOmiaVSgkX+kQl3+XUdLdWIA5TUt30a5F3lYOKXs
	 91DptvU/Dxp8g==
Date: Wed, 26 Feb 2025 23:18:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: npcm: disable interrupt enable bit before
 devm_request_irq
Message-ID: <nantj66w7l7bmk2sz6i2akyaw7cievmeuuvpl3622wj5xmdmtm@g4rcuwxghxdp>
References: <20250220040029.27596-1-kfting@nuvoton.com>
 <20250220040029.27596-2-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220040029.27596-2-kfting@nuvoton.com>

Hi Tyrone,

On Thu, Feb 20, 2025 at 12:00:29PM +0800, Tyrone Ting wrote:
> The customer reports that there is a soft lockup issue related to
> the i2c driver. After checking, the i2c module was doing a tx transfer
> and the bmc machine reboots in the middle of the i2c transaction, the i2c
> module keeps the status without being reset.

...

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

I guess we also need:

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Cc: <stable@vger.kernel.org> # v5.8+

I'm now applying the patch to the i2c/i2c-host-fixes with these
tags

Please, let me know if you think that's not the case.

Thanks,
Andi

