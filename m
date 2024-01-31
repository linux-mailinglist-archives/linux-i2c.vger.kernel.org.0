Return-Path: <linux-i2c+bounces-1563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA3844D1A
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 00:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EE111F299D8
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 23:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD493A8DA;
	Wed, 31 Jan 2024 23:32:38 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo576.mail-out.ovh.net (7.mo576.mail-out.ovh.net [46.105.50.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF55F3A8D5
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 23:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.50.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706743958; cv=none; b=C/GSwk94pgbgaSB0lqYf16ARpNzsOru++oTOh/zi26bUPdwnKXtLMbrQN4cbTNwGSKzI24VIVIG8yXkmCHEyzpv2ZTX2kwnSLrAzhXr4mPulFE6WZYyUz3IoD8wYSi4+grt1tsxv+T7AwGM4Rf0DZ2NTgJTZOQRM+AvGHJvB80g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706743958; c=relaxed/simple;
	bh=SJyruhk8di3+s0IFG1DaDJLPgvRj9rA6PUe5z5vSynI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hOPF6u3h7TeDqjAaaFNyQ3Q2ki3NRqNOEZyxtuhC4rLtIv4cLNpASmAoSvA7vbk07fPTVTkpfWO7l6hnNokhhRjnwZfqF7ESsZ5dEScIC3crfVcFh7/Zeh9kuuxewm+6i5vU4qdWQ8snx6My5ROmGFw4qZQy/pPl1a16TM5/vug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.50.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.17.160])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 8025B34156
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 22:55:58 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-qnxlc (unknown [10.110.178.109])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E62891FDEA;
	Wed, 31 Jan 2024 22:55:57 +0000 (UTC)
Received: from etezian.org ([37.59.142.103])
	by ghost-submission-6684bf9d7b-qnxlc with ESMTPSA
	id a6okHf3PumWafAAALVocug
	(envelope-from <andi@etezian.org>); Wed, 31 Jan 2024 22:55:57 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-103G00550b5628a-d37b-4c62-bb6d-ee46a59a6475,
                    F33A5955C440BB32736DBBB85AFDD5E0974CF895) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-sh@vger.kernel.org
In-Reply-To: <93f3b97c20164510ed80928500a8d443d7e23adb.1706717315.git.geert+renesas@glider.be>
References: <93f3b97c20164510ed80928500a8d443d7e23adb.1706717315.git.geert+renesas@glider.be>
Subject: Re: [PATCH v2] i2c: sh_mobile: Switch R-Mobile A1/APE6 and
 SH-Mobile AG5 to new frequency calculation
Message-Id: <170674175669.3296177.3403969696614918570.b4-ty@kernel.org>
Date: Wed, 31 Jan 2024 23:55:56 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-Ovh-Tracer-Id: 14987416613218880247
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfedutddgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth

Hi

On Wed, 31 Jan 2024 17:09:30 +0100, Geert Uytterhoeven wrote:
> Switch the R-Mobile A1, R-Mobile APE6, and SH-Mobile AG5 SoCs to the new
> frequency calculation formula, to (a) avoid running the I2C bus too fast,
> and (b) bring the low/high ratio closer to the recommended ratio 5/4.
> 
> As this makes fast_clock_dt_config and v2_freq_calc_dt_config identical,
> merge them into a single fast_clock_dt_config.
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: sh_mobile: Switch R-Mobile A1/APE6 and SH-Mobile AG5 to new frequency calculation
      commit: 5266be22421c9419ec239486c7f38bf997739fce


