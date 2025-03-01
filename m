Return-Path: <linux-i2c+bounces-9669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A0AA4AE10
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 22:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C28AF16765A
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 21:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757DF1E98FF;
	Sat,  1 Mar 2025 21:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vhhydm+N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3312C1B0F33;
	Sat,  1 Mar 2025 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740865661; cv=none; b=W76ElFE7C/aJEweThvoeaksjJjwuDHF7AX5+TGFYGSTIcmJR6Keyj9XXwxCbUXhcuRAsP+vUIpT1Q92VtewjuEis3XUC0QK2iH5vCIdmBZMlDLZTaCECKonUsu6gA7upX1sStPa+oufZN/zJoYEBP/QExeAEOpACDaUdOkg+dW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740865661; c=relaxed/simple;
	bh=M9dexXCJtbVRn0YCtzcpNf2w7iXguRU2kv+Yh+Cu2xs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=byDPHhr42w6qeaoZRRQVhjG+BXXFy8Mon4GKR1cz4cKVxaja2XL2k8n4A0CCQtfq8kOVAqJQ0bczk6M/BIRkfzZL2SRp39+7xdyfPQOkz8EO3KfXLexqs5GNwl3jP/Q+GoMX4FVt+HWNrDzt7t0lSzIejBRRRJuJ7H2j+NJ3ms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vhhydm+N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9383BC4CEDD;
	Sat,  1 Mar 2025 21:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740865659;
	bh=M9dexXCJtbVRn0YCtzcpNf2w7iXguRU2kv+Yh+Cu2xs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Vhhydm+NP8L3CHJE/BYKW5xBmFDZe9mMwHMrf/sgGH1a9Mq4CAj4Kpquz3ACkZnzn
	 Lgq/1J2PutKXHuPpYCd+NQV3BPzh5MwHAmdvMLNN+tOvMnYDQVHEutft3INXzBQ++Y
	 S/+Eto0w04qRXe1wTgcr5sUhbpbVokBwNA6iVUAWuiX3RUzbhqww2t/s+sTU7qRGdw
	 bMhIxc/+cT3fCYq8ITwoPTrNDP8vr8Z4Btg+fVenCjoIswN1vBE9Cc1eFSiBfVzlIV
	 b7HGbR8LJILd+VOpexdFNyXzyqGiVTxKJiOdyozNZqPpghsBTZqoIEP7akAuAQeE9g
	 RhghDDySmMwhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FCF380AACF;
	Sat,  1 Mar 2025 21:48:13 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.14-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z8NigAMM76-HMpin@ninjato>
References: <Z8NigAMM76-HMpin@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z8NigAMM76-HMpin@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc5
X-PR-Tracked-Commit-Id: 911c288f9e662458fad969ea64ed1a206ca7229f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b4b215cf3333bef6a95c84efb38580217e86a2d2
Message-Id: <174086569177.2508762.2641941417683948911.pr-tracker-bot@kernel.org>
Date: Sat, 01 Mar 2025 21:48:11 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 1 Mar 2025 20:39:44 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.14-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b4b215cf3333bef6a95c84efb38580217e86a2d2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

