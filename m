Return-Path: <linux-i2c+bounces-4506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE8E91CE1E
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 18:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AA5B1F21FBF
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 16:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7A81304AD;
	Sat, 29 Jun 2024 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAqKQL/R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97A112EBE8;
	Sat, 29 Jun 2024 16:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719678663; cv=none; b=JY+8kH+//rODLZToBWah5lCaHNnBw3+Qmwr9+a9IU2ttYC/ZSq1MbTrzgb74rYjHKnZRooQA7iILEFnT+DLMXuJfy57p08pN2azL5RiTpd+PxKUCHp1AAqAy4U7V/njcCfzfJXuuywKX40xcynjN9mVTp4PjNugDbL3hdJi9nfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719678663; c=relaxed/simple;
	bh=F1RblAIDWskTtX+giv7lqiwEsWdp+5GoIdviXqERTmc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cFTYw7JaXtu82vFINdZuPeSHEgGQlSqBOQALnMZLPWkdgOd/nTAx0HdkOeWlG9cihPP1qyHOJuX1h/MNiW/iYAudP3Wdd5KO+I5TD8mtuqdvfkhgGjPBTJ2fBzFFzYlIsnR76GIML0goj3SP7bSumoX/efAa45nE2XeBtJe1cDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAqKQL/R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 991A5C32789;
	Sat, 29 Jun 2024 16:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719678663;
	bh=F1RblAIDWskTtX+giv7lqiwEsWdp+5GoIdviXqERTmc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uAqKQL/RCnhULxrn7egUiotJBEAXbPLV25Vvv4KR/tj1RzEdQRLcJSTSclOXE6Nx4
	 UksmrbNuUdFms6b+TeBGqMO/0Etj+NC5pB3GVXcXehpMkSC+BwAGJNZXbzg4xE00MR
	 OPQtKZMy2SYomUl0u4/CLASHm/YfneJDyO5uxBmhQ15XnbpyW32H7qDN90ZDyelv9o
	 azbuFWz3Sk6SBDRuOZfcMsqQDWCU8J6O4Nsnk+2tYK+FBr2PfIM10bofDs2ymNIlDa
	 Cjea+ilZDmpK1j+GKskZOITNzQFCk9dy9Xmi+hpbiUrx5ByWXVc7UHbQUB9i7IGbfC
	 ZNa5/7eDBu09A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 905F9C433A2;
	Sat, 29 Jun 2024 16:31:03 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.10-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZoAOIATcp1T_89x2@shikoro>
References: <ZoAOIATcp1T_89x2@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZoAOIATcp1T_89x2@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc6
X-PR-Tracked-Commit-Id: c116deafd1a5cc1e9739099eb32114e90623209c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ebe70b3acee99dd15ca58288b17b007849ddfbad
Message-Id: <171967866358.13026.2733958236725168245.pr-tracker-bot@kernel.org>
Date: Sat, 29 Jun 2024 16:31:03 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 29 Jun 2024 15:37:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.10-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ebe70b3acee99dd15ca58288b17b007849ddfbad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

