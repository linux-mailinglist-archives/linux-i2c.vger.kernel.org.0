Return-Path: <linux-i2c+bounces-8213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D891B9D900B
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 02:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4452827CD
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 01:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49DBC2ED;
	Tue, 26 Nov 2024 01:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmHKxKto"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63431440C;
	Tue, 26 Nov 2024 01:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732585217; cv=none; b=avQWD4m762qfbBLqykNHm7p24qyOzDy1hrHZ7b1+wiHUm4JyjDAZBK6s80ZAwDCXZaEe1EjuQy2uCGhFwi52pywcg9BI90Y/pfwBIcFDfwoL4CfnbqMh2YKmDNySu05ZXkMfM5X/FZrnfrVMbJOz5yptW2wF+4/Pfaq+pE+4wpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732585217; c=relaxed/simple;
	bh=eWjUOE5B6xfVkG5pJZqhBiVNxT+saSmG0z5ktoSfMAc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=B1TYL4HV/B+vtIjsO9ecDVIdrgc+I1AcAMHfE6mICk2VdGdKvvsr7zTJ02n6gTTqwtdhkrQ3L0qNqRgE8PQmAlv/8aQ0gWcKy9c+iTCICr4s+KMis55QUjJ8/mUkSyV0DRdhnF6QDE+qAhhZfM3qlMJCDZbjjsJfQ2nHTHq4zBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmHKxKto; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4B2C4CECE;
	Tue, 26 Nov 2024 01:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732585217;
	bh=eWjUOE5B6xfVkG5pJZqhBiVNxT+saSmG0z5ktoSfMAc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mmHKxKtobBuqElASkr7JC+V1FUkB6h58nNqY0xUl5sJNuN+DvZC+mV2J7N6CtL+Dk
	 j/QDqiw1FBMtzarLDgK11IJ4Yr6xJQ1ePA9M91cUtFKpiPWOYmSWcX08pdCxkrbm21
	 R+kFXTLOOXSFlFRJ/Cc3LqQOumYnH5Wo4fI843xEYo64kCJPEd1NwD0PIK7+z3ay6U
	 VlguwtrueMCkuEebaQ/Jt9Y6k9muuPIkqelD1925yK5Yn0jyDuXE9kfPiHIJHGMmFF
	 RpCErGBhDm8GpNKPHUL361t5uDH7wXxEkAzaIAtjva4/5ypAtiI/EsbyhTi+/xkmHp
	 saJhg1eshbeXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FA53809A00;
	Tue, 26 Nov 2024 01:40:31 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.13-part2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z0NJRyAhq2B0Sgtb@ninjato>
References: <Z0NJRyAhq2B0Sgtb@ninjato>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z0NJRyAhq2B0Sgtb@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-part2
X-PR-Tracked-Commit-Id: 16470f60666618830cb9f0b8dfafd34a838c6dbd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70dbb12e95ec7585c68cb3ceae971688915021e3
Message-Id: <173258522981.4103683.16940716520002371858.pr-tracker-bot@kernel.org>
Date: Tue, 26 Nov 2024 01:40:29 +0000
To: Wolfram Sang <wsa@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 24 Nov 2024 16:41:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.13-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70dbb12e95ec7585c68cb3ceae971688915021e3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

