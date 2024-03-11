Return-Path: <linux-i2c+bounces-2329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 333558781AA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 15:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7151F21F2A
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 14:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB5041206;
	Mon, 11 Mar 2024 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv9JtL+Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E8D3FBBE;
	Mon, 11 Mar 2024 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710167445; cv=none; b=OWUadEBQy7RumhRL3eBPVulUMSy2gpL0QGEoQMQr4e9+eyYfHYM8ErAgF1nCaAQGmsBRBVwI8AMmWuXijn3iWtPNKRoh+twTaU9rv4kpaRAUFFXqI5r3QXrieDeNLJ2gjpENMIO3EynKQ9jT9VM4jPzQxH8PFS/TV/gTbKnhnHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710167445; c=relaxed/simple;
	bh=hVXJdxqJSsA7gX3BDf3K3h+DRCwx4KPLoviEbd581Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enxKgHhwqb9+aQI7VMh6UwzOamm9hB3iutYcK00LOfCT/7auTgrYaL0bijC9omGoVYsLYud0tKoeWw998PeMqeFPyySjU7XgS3LN3vSKY18gFfdrzBPoDbDzHBgTgR+fA58pxGp1B0BsU3o7yKUxxjG51FyHkWbNR2b4qZGMJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv9JtL+Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41050C433F1;
	Mon, 11 Mar 2024 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710167444;
	bh=hVXJdxqJSsA7gX3BDf3K3h+DRCwx4KPLoviEbd581Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bv9JtL+YvYXeE+8CaMbuSp5htMHugyKed+LHghEr9CPGrSBgjdQm84RnBSj+xcOqh
	 3pUZc+rbymwGDATozaQEMfAcSQbtppXIaMQBEy0+9boe3ArGblJy/QOb0ZPd93XXAr
	 dsNk4Wp6mQyFezixs7sN57jFFHUP+I77tVnTz8iUiXXo1z2HF8/IFgzLxomQ/ABgsF
	 QLqfJelHVeP+TcVb39Wm5O0IqLrTRK5bja2Ch1uneqjfdRUOS4rAMDzAN8NFvz0B9X
	 37qC7+VirR/l0yVEfeBo4FahpExPuiDI3GB6FNomV54ARrbMJQl3JwpulKNOWzTwbj
	 f87+XHxsDscNQ==
Date: Mon, 11 Mar 2024 15:30:41 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Hans Hu <HansHu-oc@zhaoxin.com>
Subject: Re: [GIT PULL] i2c-host changes for v6.9 - part 2 (i2c zhaoxin)
Message-ID: <dzcks5y3aqf4w3eq54ifpdefxace5xgvw3xrw57thfe55p2y25@s2moasyanbhp>
References: <sxe4w2iwfkaoowaqssz2lbig7tlnoasseod5atval23saqigee@tzz7qwy4fhaq>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sxe4w2iwfkaoowaqssz2lbig7tlnoasseod5atval23saqigee@tzz7qwy4fhaq>

Hi Wolfram,

> The following changes since commit b3b00cea6378475f972eb49c068062627ff3a14d:
> 
>   Merge branch 'i2c/i2c-host' into i2c/i2c-host-next (2024-03-08 23:30:28 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.9-pt.2-zhaoxin
> 
> for you to fetch changes up to 391ead8dc4e49b6de96ffdd1f6b1d89fa2282e40:
> 
>   i2c: add zhaoxin i2c controller driver (2024-03-08 23:30:50 +0100)

Let's drop this pull request. Hans has found an issue here and I
think the best to do is to postpone the Xhaoxin i2c controller to
the next merge window.

Thanks Hans for your understanding.

Andi

