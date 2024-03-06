Return-Path: <linux-i2c+bounces-2215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CA8873B02
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 16:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 576ADB242B4
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 15:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6DB137768;
	Wed,  6 Mar 2024 15:43:34 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 16.mo550.mail-out.ovh.net (16.mo550.mail-out.ovh.net [178.33.104.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3023E136652
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.104.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709739814; cv=none; b=FE+97CeliRT4Z934KJANjsg8Np5Wr0KviVVVnB6HAlGzz3TukRwSxAQ+MIZZUJjFs+p0UjGN8hqiAyzN6F09DE53mB3INNKZL0WmXA1wClsQjfLySPrUAQjKNNEsQxF2idbUJBJOiyKmnU0agYa0FO8wqEkMOHiwBKq7OQIN5Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709739814; c=relaxed/simple;
	bh=ddVEZ/hCRRIaQR+Zd4qHp55qWobjMRKrD1xXYor6Njs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UyQfsWyUOIItngmmZf2zV5zWi6LUHqMbYkIcrQH/vyEZlp0KbsPOTf9dorNYDE3dScMDYEi9w++xDE7J+xltSPJ97DB03lf+0/w0fQ3Pp+lstBqfW2V7a3ifmjnxCtdSj/6yH0OtQ0l1Lp87vcnE+8wMqAeFz8uLgKXEwMRxs00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.104.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.17.189])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4TqcCk0Jssz1KlB
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 15:43:30 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgt6x (unknown [10.110.113.115])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 523151FFCE;
	Wed,  6 Mar 2024 15:43:29 +0000 (UTC)
Received: from etezian.org ([37.59.142.109])
	by ghost-submission-6684bf9d7b-zgt6x with ESMTPSA
	id mCmqCiGP6GXMAwEAjxLk1w
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 15:43:29 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S003b68dbd3f-2314-40a5-abca-d04c75d496b3,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Michal Simek <michal.simek@amd.com>, 
 Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240119013326.3405484-1-jisheng.teoh@starfivetech.com>
References: <20240119013326.3405484-1-jisheng.teoh@starfivetech.com>
Subject: Re: [PATCH v2 RESEND] i2c: cadence: Add system suspend and resume
 PM support
Message-Id: <170973980846.1763249.4872045565378143580.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 16:43:28 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 10313524625080715995
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth

Hi

On Fri, 19 Jan 2024 09:33:26 +0800, Ji Sheng Teoh wrote:
> Enable device system suspend and resume PM support, and mark the device
> state as suspended during system suspend to reject any data transfer.
> 
> 

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: cadence: Add system suspend and resume PM support
      commit: 747bdf912e22732e8de9bd04a2d3e387055604a8


