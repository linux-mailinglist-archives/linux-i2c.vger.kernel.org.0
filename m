Return-Path: <linux-i2c+bounces-3763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F4B8FA76C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 03:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 022152894B3
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 01:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AF58494;
	Tue,  4 Jun 2024 01:16:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo576.mail-out.ovh.net (7.mo576.mail-out.ovh.net [46.105.50.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23068F45
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 01:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.50.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717463814; cv=none; b=rwxFs2JOf2uZMO7XB2WMPUYT706hL09hlBQqMtTszHVy1TyrB4O3MziatdzvxkYvuT6A/eUC8fU5NJfd3o1q6ERKHQZDai4zMzkiGzx775t9cbJwD9v2+fIVjwTAZyp+Aqkp2JfHSlBxuFDKRcIt5OferXNlOA7qTKtdUWHJBuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717463814; c=relaxed/simple;
	bh=zbupZxnOt+JwuMeb7qPV83HUERgYTYr+cTS6+xxTHQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SClKWa/mFwa6OybclV833ZD8KVjGNg+qaxNDNrqzyCQvYpCDxoyrBW+oMemqTJ77KZOkGGSElNksLGVTD+i6YURnJgiTtBgGueLYUnZFj001NR8ufjvNVypaazmaQbNsufSy/7H6rGegRc+3BIUDYah4LbdbDyqeVSQWni9CEsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.50.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.9.71])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4VtXZl3v4Zz1k9L
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 01:10:23 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kd7dz (unknown [10.110.96.102])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 161C51FE07;
	Tue,  4 Jun 2024 01:10:21 +0000 (UTC)
Received: from etezian.org ([37.59.142.105])
	by ghost-submission-6684bf9d7b-kd7dz with ESMTPSA
	id M/nSOH1pXmZXsRgARY42cQ
	(envelope-from <andi@etezian.org>); Tue, 04 Jun 2024 01:10:21 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-105G0068250c7b1-fd9d-4e3e-b30c-b9e5b8d8dc9c,
                    0128271CB94951378F9AAB743D4D9DD493E1C1D0) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Linux I2C <linux-i2c@vger.kernel.org>, Jean Delvare <jdelvare@suse.de>
Cc: Luis Oliveira <lolivei@synopsys.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>
In-Reply-To: <20240531111748.441a85b6@endymion.delvare>
References: <20240531111748.441a85b6@endymion.delvare>
Subject: Re: [PATCH] i2c: designware: Fix the functionality flags of the
 slave-only interface
Message-Id: <171746341851.238712.12338315556365264797.b4-ty@kernel.org>
Date: Tue, 04 Jun 2024 02:10:18 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 7601794696830913216
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdelfedggedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht

Hi

On Fri, 31 May 2024 11:17:48 +0200, Jean Delvare wrote:
> When an I2C adapter acts only as a slave, it should not claim to
> support I2C master capabilities.
> 
> 

Applied to i2c/i2c-host-next on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/1] i2c: designware: Fix the functionality flags of the slave-only interface
      commit: 9224b8546453758f73210256597f60f897f8dafe


