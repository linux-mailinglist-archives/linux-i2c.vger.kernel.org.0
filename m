Return-Path: <linux-i2c+bounces-13442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1071BCE3C7
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 20:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AA7F3A1CCB
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 18:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964A52FE04F;
	Fri, 10 Oct 2025 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnddcaed"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B6239E63;
	Fri, 10 Oct 2025 18:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760120774; cv=none; b=PoDY2MLYSlHhXLAFP0l8tyOl4b1F+UakcNVxSyCOajkIDyRjxGxLlQfUvHU/16IyprBdY2fEZ/ASBR+ns9SPWmC1O9qHlZdGhpHZ59OI1/msJ0lJNsBG6zHQXSNdqDWjsBQ6VOLOu7XP+QZALsDVE389DJ/+bdJC1RH7mciFRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760120774; c=relaxed/simple;
	bh=y6kUv3p09z4tnY6OYe2kejxG1n9JFKVSGTJOFpW3/4Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IUlo0PcX6Tw8XAuE37IvLhSDIYtkW+oJn/VsVUpRRRKAn8nfVsZ/KI7UdApeiombJSTlTtDCbgT2KAQyQCohn9dwPyFnrXb7FlXSykhYwTqmTAxH964DU5gh2psS7K5jXs8WXnSW8lmTmMOFS31JcjsLunHqZFMtfiHv4A+sjas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnddcaed; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BC6C19424;
	Fri, 10 Oct 2025 18:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760120774;
	bh=y6kUv3p09z4tnY6OYe2kejxG1n9JFKVSGTJOFpW3/4Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pnddcaed0N1me+vFI0JixHliGKmAb33pYoK3RTSmYCjzaSAn+72BCSLe8A+ouv7gj
	 kkITH2Fsap2djwNlxqToS/OkxlAC2b06bfVvVF08lRRI9AaOfs4/JGNidWIb7zYiTf
	 ninJ4Ygx4yX7ri4881DBySAwLDEi+tCvNA0Glz2O/pcm5vmKKo5JlAEK3oG0jdYJjQ
	 tQdDRkaKF1u4rJbBK50tjAFsbxDHMyo8a2AUY1m0mV5SfmK2KEo5EcHkwNfwtP1Paw
	 uk3NdDkZAuMly3TIxlna51HorhYf2bI424Pg5MaxOOBZPg5ZCznCsfUGi2ZjjOI9o3
	 MTlLAvqCSYv0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 714133809A00;
	Fri, 10 Oct 2025 18:26:02 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.18-rc1-part2
From: pr-tracker-bot@kernel.org
In-Reply-To: <aOjDQhhcanB_Vgbh@shikoro>
References: <aOjDQhhcanB_Vgbh@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <aOjDQhhcanB_Vgbh@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc1-part2
X-PR-Tracked-Commit-Id: eb4faf6343889fcd7edba3deeae49fc5a06531fd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aac31903329ba73ef24674df78252b6610cc9d60
Message-Id: <176012076090.1074429.3492319535346079890.pr-tracker-bot@kernel.org>
Date: Fri, 10 Oct 2025 18:26:00 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 10 Oct 2025 10:26:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.18-rc1-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aac31903329ba73ef24674df78252b6610cc9d60

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

