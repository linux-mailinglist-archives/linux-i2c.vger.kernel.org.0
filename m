Return-Path: <linux-i2c+bounces-2687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27637892E21
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Mar 2024 01:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5F22B21729
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Mar 2024 00:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A0F65C;
	Sun, 31 Mar 2024 00:27:38 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 3.mo576.mail-out.ovh.net (3.mo576.mail-out.ovh.net [188.165.52.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC2628
	for <linux-i2c@vger.kernel.org>; Sun, 31 Mar 2024 00:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.52.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711844858; cv=none; b=hHBax0OZQLo0W0zE8m6CXxXl1dbZ1ePiduvq1rX7xe1i8891bzHpgFmM6Hx51RI2KcAXOVXep/ADcvLsscQO8Z+Px0yvEIZ+t8pOf9lNoXl+g+xp9md5E8nkgmoDp9n3m6qwsCVK9dkHwqaED78WtKN5aCNZRcYdAsemBMoCHBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711844858; c=relaxed/simple;
	bh=ECCo7RMLpeYUhpHIYa+A158zhqXbbkXV4/OmnD2t3ZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m9vs6LJ1QQo0cUcFagrv3WIn550TGJ2e9EQeSY550CJEZVlhItrjwzt6kAiHPklam+6dUbHmQAR8zQFrQ4jBwCkMwMVzQlg4J6uMFE0J4/netGkh4GmKZGdaoBI4ZFfVmzcM28o0Njgwneheyl57QCzbtR4J5ziMuVUSi1E1a7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.52.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.25.63])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4V6ZjC51RZz1WVy
	for <linux-i2c@vger.kernel.org>; Sun, 31 Mar 2024 00:27:27 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-b8q8f (unknown [10.110.168.195])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1E5821FDF3;
	Sun, 31 Mar 2024 00:27:26 +0000 (UTC)
Received: from etezian.org ([37.59.142.99])
	by ghost-submission-6684bf9d7b-b8q8f with ESMTPSA
	id OVINEe6tCGYlXAkAi3EkCw
	(envelope-from <andi@etezian.org>); Sun, 31 Mar 2024 00:27:26 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G0030d2e3f9a-9e3f-4d42-a5f9-380ee953418c,
                    3C51A916EC97189076D74FE9F96E37BFEF4240FA) smtp.auth=andi@etezian.org
X-OVh-ClientIp:83.57.198.208
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org
In-Reply-To: <f9df04f6-9dc2-4874-bc6c-473dc3d692b9@gmail.com>
References: <f9df04f6-9dc2-4874-bc6c-473dc3d692b9@gmail.com>
Subject: Re: [PATCH] i2c: i801: Call i2c_register_spd for muxed child
 segments
Message-Id: <171184484323.16458.16364948555678328368.b4-ty@kernel.org>
Date: Sun, 31 Mar 2024 01:27:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 12533236290606205492
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledruddviedgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekfedrheejrdduleekrddvtdekpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht

Hi

On Tue, 26 Mar 2024 21:42:44 +0100, Heiner Kallweit wrote:
> Once the gpio mux driver binds to the "i2c-mux-gpio" platform device,
> this creates the i2c adapters for the muxed child segments.
> We can use the bus notifier mechanism to check for creation of the
> child i2d adapters, and call i2c_register_spd() for them. This allows
> to detect all DIMM's on systems with more than 8 memory slots.
> 
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: i801: Call i2c_register_spd for muxed child segments
      commit: d33bd3b707f476efcb907a7fd3ba3352f49775ed


