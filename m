Return-Path: <linux-i2c+bounces-1607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BF18464EF
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 01:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46B761C23FBC
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 00:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20DA15AB;
	Fri,  2 Feb 2024 00:12:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 5.mo584.mail-out.ovh.net (5.mo584.mail-out.ovh.net [188.165.44.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1B415A5
	for <linux-i2c@vger.kernel.org>; Fri,  2 Feb 2024 00:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.44.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706832778; cv=none; b=M95y7N3uxznjnXY2K8CN/6hQx7SG0QhJ+uOODQLH2VEU8oYCVakRmoA5/E1/L0NjRAGBeQye1Ygu5nwkPpeJZecsIq4aDd29pf/Mgzzynqqq2MWma/WYmV9Gp6BiXufubUvFEbAfS+u/t1DNt3N9550r2FVcNp1zOyqcL0bVy64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706832778; c=relaxed/simple;
	bh=ja821KrifeOtFVHPJ+9i5EO0qr674NBfKKBH97DNeNE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PrhqRNr8kGPaudVKi5nlLE/xXuPuMcgHAV03WLjYAu7dyswhOY277V/Cvo9T5Rf+0V/x3cAFpWyOwa7vYscu7XZd0KybEhr9Z+KsJC5Y3BagxK7wEHgEt/wS8KRt09QvYwJqTl3MTMan7GM4ik4AVJ/27frX0IUKFUyJS34CUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.44.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.2.55])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id C292528B4A
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 23:33:38 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-2gdsq (unknown [10.108.42.63])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BAF401FE52;
	Thu,  1 Feb 2024 23:33:36 +0000 (UTC)
Received: from etezian.org ([37.59.142.106])
	by ghost-submission-6684bf9d7b-2gdsq with ESMTPSA
	id yX9DG1AqvGVeIQAA5wC6tQ
	(envelope-from <andi@etezian.org>); Thu, 01 Feb 2024 23:33:36 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-106R0063d639488-3c4d-442d-b4bc-ee04ceb04c76,
                    16159D31D4BC2DC989EAC12674B0EBCF52923421) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Devyn Liu <liudingyuan@huawei.com>
Cc: yangyicong@hisilicon.com, f.fangjian@huawei.com, 
 jonathan.cameron@huawei.com, linux-i2c@vger.kernel.org
In-Reply-To: <20240201061345.3111600-1-liudingyuan@huawei.com>
References: <20240201061345.3111600-1-liudingyuan@huawei.com>
Subject: Re: [PATCH v2 0/2] i2c: hisi: Clear the interrupt status and
 optimize writing limitation
Message-Id: <170683041545.3022989.8699813586542251748.b4-ty@kernel.org>
Date: Fri, 02 Feb 2024 00:33:35 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-Ovh-Tracer-Id: 3049499900862466574
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfeduvddgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghnughisegvthgviihirghnrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth

Hi

On Thu, 01 Feb 2024 14:13:43 +0800, Devyn Liu wrote:
> Devyn Liu (2):
>   i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth
>     - 1
>   i2c: hisi: Add clearing tx aempty interrupt operation
> 
> drivers/i2c/busses/i2c-hisi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/2] i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth - 1
      commit: 69dc3880100288972fe341c2c59c40fdecf511f5
[2/2] i2c: hisi: Add clearing tx aempty interrupt operation
      commit: 2f9af34c79ffd97858649822e1730ead2a31f6c6


