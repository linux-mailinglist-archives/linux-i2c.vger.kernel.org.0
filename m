Return-Path: <linux-i2c+bounces-1627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 065CC848BCA
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Feb 2024 08:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BEE0B23ED3
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Feb 2024 07:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B278F77;
	Sun,  4 Feb 2024 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idjGtks3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDE18BFC;
	Sun,  4 Feb 2024 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707031117; cv=none; b=k5RQAbRMcCySjQ98f5+dAOpWlKxnUXugyt7d0USKvODuiux4wNb3jmq14mxHV4WJp8FaY2EgpLupXNi961YKmUxUjoPX71GJT5ra33VuueHgwSP0DuU9mVCFr6Ia+i2HkJVS6G0Vvp4sg8fNOl74BqAGdMqapBO6gM3V26/2x1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707031117; c=relaxed/simple;
	bh=zdL3nDnn3SKJmnK1W8bQYR2kWzpOdm/djkUpabKoNMI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hSfoCZzCaq/7fqAlRx+OJqGK5T/HzEqBSjTUeTKP+3d4wxN3mEdByJiEtcuAfldc/ovvwvBnF4JsUpjFgeUNkBOA6GxTkOmra2LDiHnK/ntBQf9JNrYh9QcMdJ9Rqmpie0bkLWIeEuZsaEnf8GLd0HIQldt+l7c0lt4aqTDyLxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idjGtks3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6D85C433C7;
	Sun,  4 Feb 2024 07:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707031116;
	bh=zdL3nDnn3SKJmnK1W8bQYR2kWzpOdm/djkUpabKoNMI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=idjGtks3vs04nwTgZ5DRY6IORpDT57ZRTCs2vx2RR41c+F2jPdFg73403hS03ZaIG
	 Rqu8+tYf9kmSqXeeVnw10z2d1QTuXzHOg6fvVvJabodT8dn7Ns0M/Gk3gyHchz7Lml
	 QawLdztrE4ffx0jrElhKqmrn/R2FlsIN9Xjg9Psm2g8qgB3Rgnc0H0UteZ3y4yVsHg
	 1HJh9VbI+kXqLvQHyhQmkUM3irRhuf1ZppK2vWNt0Yfmxq6FGjuhyju9YFvwKF18PC
	 pB6sU/Ywes2LdO93ettEnW4gMilcmjs88hLzsG15nR6ko9jtfojsG30LQ6Apkq1ia4
	 7V6lFhwdZ/7EA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4C00C595CE;
	Sun,  4 Feb 2024 07:18:36 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.8-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zb6hL2HnnifdTgd-@shikoro>
References: <Zb6hL2HnnifdTgd-@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zb6hL2HnnifdTgd-@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc3
X-PR-Tracked-Commit-Id: 957bd221ac7b2b56cbdf56739e3a94d4f479209e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdda52cc664caaf030fdaf51dd715ef5d1f14a26
Message-Id: <170703111673.23816.13132643535535583889.pr-tracker-bot@kernel.org>
Date: Sun, 04 Feb 2024 07:18:36 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 Feb 2024 21:25:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.8-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdda52cc664caaf030fdaf51dd715ef5d1f14a26

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

