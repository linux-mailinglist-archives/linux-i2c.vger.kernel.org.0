Return-Path: <linux-i2c+bounces-2217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D96FB873B26
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 16:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176731C2169D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 15:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E92134403;
	Wed,  6 Mar 2024 15:50:43 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 11.mo582.mail-out.ovh.net (11.mo582.mail-out.ovh.net [188.165.38.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DBC1350D2
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.38.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709740243; cv=none; b=ZB5btjOlYcvuY9NSgYHk9oPP3gMVzc87fXunRxwBojImhkZeSIIONpVdu2AO9l4KVyosxbWtkFEjTtD3h7OJzN2h/NEf1F1TC09E4Hms6OF7u59iJdk855arWmj1jZGAWGflLbNzdbcutiFraRiU6dndm2XJctRi9MTK81vR6i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709740243; c=relaxed/simple;
	bh=mOQMYrOjFL+BfYA9OZsNjIxxOcLbq6gJ3vaPs7tvY3E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lqGjnk/9OvUPHITImAMfxuYEgjCNO2u61yk7v9GSaVAq62eYsYRnCferI+o9F/u4yKltPdez87eDOTP+M3Rg6CBlXZN4ZBfhxyyJ9hKCO9kUtG2j7sAJMIX9yhqKDIMczrUebIjGCKowkl3cExv8dTGzPlmUSdb3I9fPRthlbOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.38.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.2.12])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TqcCh39FJz1FZJ
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 15:43:28 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-5vngl (unknown [10.110.96.50])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1E06F1FEDE;
	Wed,  6 Mar 2024 15:43:26 +0000 (UTC)
Received: from etezian.org ([37.59.142.102])
	by ghost-submission-6684bf9d7b-5vngl with ESMTPSA
	id dc+OAB6P6GXZFQIAO0zOww
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 15:43:26 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R0045dce9fec-5935-488d-8dc9-5f4c41f889d9,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
References: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH RFT 0/3] i2c: mpc: use proper binding for transfer
 timeouts
Message-Id: <170973980502.1763249.4893089217110620791.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 16:43:25 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 10313243148287740663
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth

Hi

On Thu, 29 Feb 2024 11:58:10 +0100, Wolfram Sang wrote:
> To clean up the confusing situation regarding I2C timeout bindings, here
> is the series to fix up the MPC driver which mixed up clock stretching
> timeout with transfer timeouts. Plus a minor cleanup while here.
> 
> Only build tested, so actual testing is welcome.
> 
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/3] dt-bindings: i2c: mpc: use proper binding for transfer timeouts
      commit: f9ccb4533bdcf31f1225a9a09805329b8020a4e3
[2/3] i2c: mpc: use proper binding for transfer timeouts
      commit: 401a8e9e3d697b75c2e237b9b405bb0f388dd7ed
[3/3] i2c: mpc: remove outdated macro
      commit: d0e944150446d8056a050049a8f0e98241ba6194


