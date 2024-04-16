Return-Path: <linux-i2c+bounces-2984-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D58718A7820
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 00:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 130061C21DC1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 22:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3830913AD38;
	Tue, 16 Apr 2024 22:46:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 4.mo575.mail-out.ovh.net (4.mo575.mail-out.ovh.net [46.105.59.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E1913AD2F
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 22:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.59.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713307587; cv=none; b=QOk/sT45Gj907r5FFFAqHX5P8mxvrTNmJnwrH3g7oaHaD8mAfkgANvn/D+MyVvQR3cdDdpDmBb/qHsRLUTFhE7UPbSp2uJW924cc8+kjYQb1lkMFnKtGV6qBgFaSKOKtYlRMWwh1IveVfGZ8S+dlAyTk/CCdojPxfj1jmdJma5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713307587; c=relaxed/simple;
	bh=h3uo6l1//7OEjWkIE1XUEjdaQjX+wASqlaqJMt7R78A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OaWFx8Y3iGdh9w46qgpiEZqQrXkTUEOyzS9J0QwMFO0osH2UsHUAW3L47b3jr4dKw7bgZTtIMEXt/8QGo7BaKrzieqvp1iSZMkut47rE0QGEhPvippA1vnszU8pZKCVXXXX64L9aGrzuDYsYZAEktvN30jsli5NRrSjwmTNFaQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.59.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.17.234])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4VJzfk24DWz1WCP
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 22:46:22 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-cwzjm (unknown [10.110.168.204])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 44BE01FDFF;
	Tue, 16 Apr 2024 22:46:20 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
	by ghost-submission-6684bf9d7b-cwzjm with ESMTPSA
	id oV4ZOrz/HmZqMQAAXNgG0A
	(envelope-from <andi@etezian.org>); Tue, 16 Apr 2024 22:46:20 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S003f5198866-139b-45c7-b3bb-350fab71a196,
                    38C292890E232DD6F9946AE994780F0893807590) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org
In-Reply-To: <41efcfe2-7e05-4a11-bd02-40d9e525c415@gmail.com>
References: <41efcfe2-7e05-4a11-bd02-40d9e525c415@gmail.com>
Subject: Re: [PATCH] i2c: i801: Annotate apanel_addr as __ro_after_init
Message-Id: <171330757984.1978363.14103159711969518419.b4-ty@kernel.org>
Date: Wed, 17 Apr 2024 00:46:19 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 18428166729492466320
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudejjedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht

Hi

On Fri, 12 Apr 2024 12:21:58 +0200, Heiner Kallweit wrote:
> Annotate this variable as __ro_after_init to protect it from being
> overwritten later.
> 
> 

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: i801: Annotate apanel_addr as __ro_after_init
      commit: 08944c074592041873f1cb3e5be5fc3fd4cdc3ad


