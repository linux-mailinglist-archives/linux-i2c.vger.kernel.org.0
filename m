Return-Path: <linux-i2c+bounces-1674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 301BE84EE76
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 01:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C18571F27BB7
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 00:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBE5EA4;
	Fri,  9 Feb 2024 00:58:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 11.mo584.mail-out.ovh.net (11.mo584.mail-out.ovh.net [46.105.34.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4BE7FA
	for <linux-i2c@vger.kernel.org>; Fri,  9 Feb 2024 00:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.34.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707440321; cv=none; b=iwS8yh1LbKUmK8u3SZHNwYX56KYysTVzMMESW7FYmpCvMiCsQybzBDwneQcgRSKqJx4kYuxIPOCLr1rKFZv7ZK5sKVhPkS7hrx5s7m6WQvsw7kIaVNfjI0+rRdB+e3Em+ualXfWdtBKvjImUyYjjGuYoyi6cK7xXhHp5Pjhok24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707440321; c=relaxed/simple;
	bh=R6IbuRmxrjD2p+zLk0wbj++wWsIATVzSPAzNREhnuSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FStUMTSd7x0HQTfuky44K8omZDzwGXy54c43NyZpO99HX8Sl3p8k3lvmIMlugOQUvZ1/gecN5B3pCWvAIySNYbwlGqvDmM7sP5M77xaGHkABSQxbMCsJqSgw7IYwqRhRIDaaf12MVYgZk14OXmtaB8UcNVH2BeoYAeOE9vQrxRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.34.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.9.29])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4TWBZl216tz1FCT
	for <linux-i2c@vger.kernel.org>; Thu,  8 Feb 2024 22:33:03 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ch25r (unknown [10.110.96.132])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E19671FD44;
	Thu,  8 Feb 2024 22:33:02 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
	by ghost-submission-6684bf9d7b-ch25r with ESMTPSA
	id 8zHbMp5WxWVyOwMAdC8Bjw
	(envelope-from <andi@etezian.org>); Thu, 08 Feb 2024 22:33:02 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0037a45f94c-79e0-42c0-947a-98c0c5ccc99f,
                    CE8A3A4DEFB0CFFDE53FB4F2802355151463B16D) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
References: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
Subject: Re: [PATCH v3 0/5] i2c: i801: collection of further improvements /
 refactorings
Message-Id: <170743158182.4001012.5524436852553494148.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 23:33:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-Ovh-Tracer-Id: 6241707610038930025
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrtdeggdduheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht

Hi

On Fri, 02 Feb 2024 08:00:46 +0100, Heiner Kallweit wrote:
> This series contains further improvements and refactorings.
> 
> v2:
> - omit patches 1 and 2 as they have been applied already
> - remove patch 3 for now
> - patch 4 in new series: add comments
> v3
> - fix comment style in patch 4
> 
> [...]

Applied to i2c/i2c-host-next on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/5] i2c: i801: Define FEATURES_ICH5 as an extension of FEATURES_ICH4
      commit: ea4f32970b69aa0eb3c74ae23662f97366bf6968
[2/5] i2c: i801: Add helper i801_check_and_clear_pec_error
      commit: 03f9863b1afa37779e82b18999a5e16aa759a397
[3/5] i2c: i801: Split i801_block_transaction
      commit: 6ff9d46cd36fbd004b1cd7c9173af5cdfbcd1df1
[4/5] i2c: i801: Add SMBUS_LEN_SENTINEL
      commit: 29dae4572efb676e4831eee68bc423b9f32c05d0
[5/5] i2c: i801: Add helper i801_get_block_len
      commit: 857cc04cdf508d043a062fff3aea8ca01303b731


