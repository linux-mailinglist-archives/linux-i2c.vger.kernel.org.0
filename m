Return-Path: <linux-i2c+bounces-3076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2DA8AE9C2
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 16:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132E31F23ED7
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 14:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9B784FC5;
	Tue, 23 Apr 2024 14:44:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 19.mo581.mail-out.ovh.net (19.mo581.mail-out.ovh.net [178.33.251.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE519470
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.251.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713883446; cv=none; b=m2k1lVcbttWy84oloxM8pWSnnc7bjoYb9PxCTMsTAvD3yUAtI2ZVa/4eQn/pRkB1PWqRryFUg3R0h90v2rUB1/D7AVSGK1X+eJFElpNlsYYSMToLomm670rDUR+Ya0TuuHewZ/7VLaTJoAK0jGsNyMFpTkenn+R5lCR0ljCzECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713883446; c=relaxed/simple;
	bh=AwUAUzpHBOsc1lMca4BINuz9URPqQhgCUVu2azAuauE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Oc9i4sgG+tEgwoSWVFSr+wSckRV/U/UAMCILzNOC98f8zyDooZGlwMuVahwMnenSaf0RwJfgoAo3otEGw5ajtAWGdqlIPxCgjDzFCQ36nrzG/v4NrCqgwKFLo2BFQB8XrJayMDZ+tGOeipsmqKEmFla5OkTnlhwV7iv8IPhHPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.251.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.25.136])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4VP4QJ6fDmz1K7w
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 14:34:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bhrm4 (unknown [10.110.113.89])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 407C11FEC9;
	Tue, 23 Apr 2024 14:34:48 +0000 (UTC)
Received: from etezian.org ([37.59.142.97])
	by ghost-submission-6684bf9d7b-bhrm4 with ESMTPSA
	id Bgz7CQjHJ2bTTwEAbTVA8Q
	(envelope-from <andi@etezian.org>); Tue, 23 Apr 2024 14:34:48 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G002eebf7df8-33da-4965-bbcb-682bf0db39b3,
                    C447AC6F663E29B5B072953094682C3B23667ADA) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Piyush Malgujar <pmalgujar@marvell.com>
Cc: sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
In-Reply-To: <20240423074618.3278609-1-pmalgujar@marvell.com>
References: <20240423074618.3278609-1-pmalgujar@marvell.com>
Subject: Re: [PATCH v7 0/5] i2c: thunderx: Marvell thunderx i2c changes
Message-Id: <171388288720.439949.15428292378589168497.b4-ty@kernel.org>
Date: Tue, 23 Apr 2024 16:34:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 14341713015152839280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudeluddgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth

Hi

On Tue, 23 Apr 2024 00:46:03 -0700, Piyush Malgujar wrote:
> The changes are for Marvell OcteonTX2 SOC family:
> 
> - Handling clock divisor logic using subsytem ID
> - Support for high speed mode
> - Handle watchdog timeout
> - Added ioclk support
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/5] i2c: thunderx: Clock divisor logic changes
      commit: 1e82de6368238dfcca306fc66dc6c3f8c21e1b4b
[2/5] i2c: thunderx: Support for High speed mode
      commit: 305b1350c49993bbc879270764aa59e8de00a904
[3/5] i2c: octeon: Add platform prefix to macros
      commit: 8c82edccf99ad4395cf943dad48c47b44a1c920a
[4/5] i2c: octeon: Handle watchdog timeout
      commit: b6ea602a1100c6241c47a8b4326a050ff3379c4d
[5/5] i2c: thunderx: Adding ioclk support
      commit: 8d49135d177dbfee92bd84fef32b47d656e6b314


