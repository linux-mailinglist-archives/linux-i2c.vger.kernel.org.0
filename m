Return-Path: <linux-i2c+bounces-7163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7047398CECD
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 10:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1F561C2117C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 08:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B6C195385;
	Wed,  2 Oct 2024 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWGoUsRC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E821420D0;
	Wed,  2 Oct 2024 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727858086; cv=none; b=FpEYNKnI4vq8bITALf/OFXoz1XP8tB0dBO4Unl1X7RaJXQbovN2XNU6RjUABUdU4HNuc57YASLGI/f1h0BpwGcZRtTbWi8Bc9+0rPai8mQ9XFVTRyj472ZtRUY8ZRuXtsXaP15uqmtmdCOfFi2RHPU3W3lD6tg9rPp8ogJDqZdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727858086; c=relaxed/simple;
	bh=ZLWnJaCsiLvFSACdpMHMHipnkZ7K293HKDrkz3uZ8Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8FPMPT6t7URJoYtKcMpWttWOwH6C+3XV6WW5g+RNv+CbO8P2jt9hOvGbMpa6Ld3boEkNPAi4NpErUr7nxeN0kII3pOzghyLWKespiyqSgd0eq7IfPMwQeculZrN5frrLAypnpIvGv+19nkCa420xZeW7pGA82FPyKBGPIq3hsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWGoUsRC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FC8C4CEC5;
	Wed,  2 Oct 2024 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727858086;
	bh=ZLWnJaCsiLvFSACdpMHMHipnkZ7K293HKDrkz3uZ8Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cWGoUsRCvDGtIasFiD0dNE5RSMOqb6Mc7vIZgDU/Hlw99i28s11fG95+2NeMYF9tz
	 0l1xLsAlpqBFIkC3s578H9kkXs144uHAkhqM9p5oNVvdteRah/zqpziv1czggAmK1O
	 Zj9zfxCBOJctAqtMYZ+k1/tOR9FxG++IbiQXZJwGQC6cEgBh5MSFLaGbAGBk3VbumI
	 pT64aQzI+jP2UAjh0X+hjiUgDXbYffiarl9zheMGOdaELloVuQDGnYe/L22ys8ZJk+
	 v5pitAHWjh6YWoswGtmGgB5Lo/QZx/o3u4Hayqeh0SzGwI4TMZM4aaEfiW651bIu92
	 dRmxzQZbVJtnA==
Date: Wed, 2 Oct 2024 10:34:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] i2c: npcm: read/write operation, checkpatch
Message-ID: <k5ifxaqtm76aorvxur6kl7j3pnfc7qmvua7mq64pobg3tiabvu@h2ygjs7ieidh>
References: <20241001062855.6928-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>

Hi Tyrone,

> Tyrone Ting (5):
>   i2c: npcm: correct the read/write operation procedure
>   i2c: npcm: use a software flag to indicate a BER condition

I merged just these two patches to i2c/i2c-host.

Thanks,
Andi

>   i2c: npcm: Modify timeout evaluation mechanism
>   i2c: npcm: Modify the client address assignment
>   i2c: npcm: use i2c frequency table

