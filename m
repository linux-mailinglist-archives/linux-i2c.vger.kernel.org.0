Return-Path: <linux-i2c+bounces-2019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A678685C4
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 02:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5730CB22261
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 01:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DF64C89;
	Tue, 27 Feb 2024 01:28:50 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net [46.105.63.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0190A4C7C
	for <linux-i2c@vger.kernel.org>; Tue, 27 Feb 2024 01:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.63.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708997330; cv=none; b=SZ1r79sDZQOJOvebahyOqGtPkhHsxOL5xWkZf3WbW/MS7C3k7TwwiDi/i9HpQQW0k4GpCqJ4FO/+53Qeg5X3IO4GD2l7oLEIKwtREl+nZE2PXotPpKZDPZ+HFqW05NJUk4HYGmovtkHpUEiXVJQvxDyPrCU5q9yjLmn0qW4LQPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708997330; c=relaxed/simple;
	bh=9maIj3scRE3rvmOZnTWx6mL+LNJKZlpMtlaikbatFF0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GEVBr5Vc4AH2+7gYQqUVgK9E8ahtiTNcX7qz3Ud/tHyBi1vljfBy7JHOqm246N9eYKDN/iJ+aiQNij9LxAy+T7mnaoRyaDpR9m4heKP71Xsn0+NWgvml1BVHnGMvWovl0zKeU+RKbFSUopfaBZ0m3HnTrjv/0ywLdiBafdqspHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.63.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.2.115])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4TkKTH1BRqz1S7j
	for <linux-i2c@vger.kernel.org>; Tue, 27 Feb 2024 01:21:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-lwnjp (unknown [10.110.96.65])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 90F361FD2D;
	Tue, 27 Feb 2024 01:21:53 +0000 (UTC)
Received: from etezian.org ([37.59.142.96])
	by ghost-submission-6684bf9d7b-lwnjp with ESMTPSA
	id iD0THTE53WUzjAAAMhl46g
	(envelope-from <andi@etezian.org>); Tue, 27 Feb 2024 01:21:53 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R001a1306533-5422-4a00-a40e-cbb557c37a92,
                    9285090D84508773EC2C25A4099646E261C64314) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c@vger.kernel.org, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>, 
 Sanket Goswami <Sanket.Goswami@amd.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, michael.j.ruhl@intel.com
In-Reply-To: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
References: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v3 0/6] i2c: designware: Generic polling mode code
Message-Id: <170899691236.412407.7251512012317912593.b4-ty@kernel.org>
Date: Tue, 27 Feb 2024 02:21:52 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 4121638084982999631
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrgeefgdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht

Hi

On Tue, 13 Feb 2024 14:48:41 +0200, Jarkko Nikula wrote:
> I hope you could give a quick test to this patchset to see it won't cause
> regression on your HW. This is mostly the same than the first version what
> Jiawen tested earlier but in this 3rd version I decided to drop semphore
> touching code patches from v2 due they being out of scope and fix a few
> things noted by Andy.
> 
> Changes are in the patch 3/6 with two minor fixes to comments while moving
> them and the patch 6/6 where i2c_dw_wait_transfer() is slightly modified
> by Andy's suggestion plus I decided to remove one comment which became
> unclear after this patch.
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/6] i2c: designware: Uniform initialization flow for polling mode
      commit: 535677e44d57a31e1363529b5ecddb92653d7136
[2/6] i2c: designware: Do not enable interrupts shortly in polling mode
      commit: 64b6426a6e97a95c044fd2fff3f0adf7c1edb60c
[3/6] i2c: designware: Use accessors to DW_IC_INTR_MASK register
      commit: 04c71da4a9f4eef94bec153ed667d105dacffda3
[4/6] i2c: designware: Move interrupt handling functions before i2c_dw_xfer()
      commit: bd002efaa16e4cfffc25db2d9c4669aaa2b43646
[5/6] i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
      commit: c94612a72ac87b0337a0d85b9263266776ed4190
[6/6] i2c: designware: Implement generic polling mode code for Wangxun 10Gb NIC
      commit: 197ecadad842855437a36ffc161648418ae02a97


