Return-Path: <linux-i2c+bounces-2985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB088A7833
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 00:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2F99B212BE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 22:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105A91386BF;
	Tue, 16 Apr 2024 22:53:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 4.mo575.mail-out.ovh.net (4.mo575.mail-out.ovh.net [46.105.59.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BBE6EB4C
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 22:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.59.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713307992; cv=none; b=h33mQIWHk3NvUfYAM63RgGjHZZpG2YvbY2xvHgB+mqxJak8Qotg5gUyT19G6zd4I2aMceGRN8x06rDKO8e7huxG6Y6MWcd7G4EW75g7A/CW0oeoUklSfD8lddGRcSdFa7urliOdVZ3DUsQ7MJ/zKfhlJMJi4R3bcMsa+QXU0bKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713307992; c=relaxed/simple;
	bh=EW8jp+SOURsYTPLl+PnV7ZSN+FjJCWndNz+gCCwD2Iw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K8qpa3OOq9ClxxaYU3Dxnms0+Z1hrNo+1s2H8zEFH5atJF33YdCfg4dcf4z4D383BVK/2Xv2iFyP6eYjyjAx7Hz+s44EV55+1u93KBkS2k4UusvyEtDLBDKFBy5wOuaYhaEQkentYIEjMKvI7hiPPXiq0JZfTacUrVeRcAHQ23s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.59.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.2.23])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4VJzfX5BKCz1W46
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 22:46:12 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-tl4st (unknown [10.110.96.50])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B04DC1FD1E;
	Tue, 16 Apr 2024 22:46:10 +0000 (UTC)
Received: from etezian.org ([37.59.142.95])
	by ghost-submission-6684bf9d7b-tl4st with ESMTPSA
	id NUZPKbL/HmYJMQAAgyXpiA
	(envelope-from <andi@etezian.org>); Tue, 16 Apr 2024 22:46:10 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-95G001a22ffe43-1d0d-41f9-8b5e-b6b47462b279,
                    38C292890E232DD6F9946AE994780F0893807590) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: chris.packham@alliedtelesis.co.nz, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abhinav Jain <jain.abhinav177@gmail.com>
Cc: skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com, 
 Julia Lawall <julia.lawall@inria.fr>
In-Reply-To: <20240415161220.8347-1-jain.abhinav177@gmail.com>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Message-Id: <171330756789.1978363.15038881964177013027.b4-ty@kernel.org>
Date: Wed, 17 Apr 2024 00:46:07 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 18425351976007961206
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudejjedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth

Hi

On Mon, 15 Apr 2024 16:12:20 +0000, Abhinav Jain wrote:
> Remove of_node_put from node_ctrl and node struct device_nodes.
> Move the declaration to initialization for ensuring scope sanity.
> 
> 

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: mpc: Removal of of_node_put with __free for auto cleanup
      commit: 24e4a0d7c6b7a6491cc44781f3900129f56f447f


