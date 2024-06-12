Return-Path: <linux-i2c+bounces-4005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 378239062D2
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 05:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5E5B1F22B52
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 03:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960A812F385;
	Thu, 13 Jun 2024 03:42:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 8.mo583.mail-out.ovh.net (8.mo583.mail-out.ovh.net [178.32.116.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843F2F34
	for <linux-i2c@vger.kernel.org>; Thu, 13 Jun 2024 03:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.116.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718250121; cv=none; b=HedssyNfyrgiMepAIuY8kkw/nc9mfbTbD68Jz+Sx8FJz4MWyFMPYCRRZePh2QRL+qzrugmBW7tQz5rRFPd+ykHvXsxuSD3jcnbhlwI0+7j4/qlZh8E3WZ9TkHqIeXYGtTUyP7C+/qD3P5wecVyUYqpLkY0zzahocs8Of7RYUuMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718250121; c=relaxed/simple;
	bh=UJssIwYvsX0H9E2rEXL3e9sBkElEh1qtz8ifV3CBYBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=usXrlsNlA5Kvx9prhSfEswdTfNpRGsH5Us5cCNZcH53NQUp+m38elZSf679LNuT0oFPfstX4pz8lmvh8140uAjXRG0bRLFLQziRv9QPRVeAvjttZU6IJswRRICQ3AZBbYGTM9wa2nSIuxQto34SsoQZbzTWWIDNlM97i60uuDn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.116.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.148.29])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4W017C03kVz1RND
	for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2024 22:53:58 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-42xdj (unknown [10.110.96.132])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B1ADC1FD41;
	Wed, 12 Jun 2024 22:53:57 +0000 (UTC)
Received: from etezian.org ([37.59.142.101])
	by ghost-submission-6684bf9d7b-42xdj with ESMTPSA
	id rVO8HwUnamZidwMAztydPw
	(envelope-from <andi@etezian.org>); Wed, 12 Jun 2024 22:53:57 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-101G00423866b92-96da-4828-b612-fb906ac8bf37,
                    DA170D98FC4D5E4E6D17746280F9905ED5007368) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c@vger.kernel.org, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>
In-Reply-To: <20240610101801.453785-1-jarkko.nikula@linux.intel.com>
References: <20240610101801.453785-1-jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Arrow Lake-H
Message-Id: <171823282436.404205.16601835343853795493.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 00:53:44 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 2811935019797973648
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfeduhedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht

Hi

On Mon, 10 Jun 2024 13:18:01 +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Arrow Lake-H.
> 
> 

Applied to i2c/i2c-host-next on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/1] i2c: i801: Add support for Intel Arrow Lake-H
      commit: be0c4627af021026190c61440f729a2b67f7c785


