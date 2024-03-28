Return-Path: <linux-i2c+bounces-2644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BA988F9E5
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 09:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A9BF1C2C9C1
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 08:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C8554792;
	Thu, 28 Mar 2024 08:16:28 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 12.mo561.mail-out.ovh.net (12.mo561.mail-out.ovh.net [188.165.41.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2111BF58
	for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.41.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613787; cv=none; b=XGYhVBwPr7DySaLg23DJ3elJMj4LJ/xZLAni8mkEzF2TIMHKoy4yyT6TkeQEW8/fcq6TLcuJuGIxfA5HbeYLRHnd+OsyUa0O2vbKArk9uk8BWK4dM8IywJGsKmqW1IyVXM60lb1ZQVnUAFnKzhENT83nLL6Ei2DkgX/XHhDyodM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613787; c=relaxed/simple;
	bh=FoK+TTnkZBEIxAuqwtZNUFYhYqEUw8/IIA5uwrrKnQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g3WB5vsC1LEv+/cY6sSNMfJdFlWXEa/0SZdk9T6N0xM41+w22YMdyAoZwmOkS9vLcEuZKij/6z0320NXTK+YxN/EYYF7CTeQEEJeQT6ncUnlFji8feNKen9uCv2q0DO78Mh0f7xJHNpXr+6PsQ4YR9F1XrzNF9xsgvQhDaIK5EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=188.165.41.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.2.211])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4V4wMy0P9Bz1CqM
	for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 07:36:46 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ldk78 (unknown [10.110.96.65])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 92A881FEE9;
	Thu, 28 Mar 2024 07:36:43 +0000 (UTC)
Received: from etezian.org ([37.59.142.99])
	by ghost-submission-6684bf9d7b-ldk78 with ESMTPSA
	id irrGGgseBWbkIwAANZbBaA
	(envelope-from <andi@etezian.org>); Thu, 28 Mar 2024 07:36:43 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G00369bef739-e97a-4666-95b7-831df257c96e,
                    6D693167F0AB1D8A9C15294DA3267AC24BED3ACC) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org, 
 wsa@kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: quic_vdadhani@quicinc.com, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c
 GSI mode
Message-Id: <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 08:36:41 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 2165386998096661243
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledruddukedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht

Hi

On Wed, 13 Mar 2024 10:56:39 +0530, Mukesh Kumar Savaliya wrote:
> I2C driver currently reports "DMA txn failed" error even though it's
> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> on the bus instead of generic transfer failure which doesn't give any
> specific clue.
> 
> Make Changes inside i2c driver callback handler function
> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> stores the error status during error interrupt.
> 
> [...]

Applied to i2c/i2c-host-next on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/1] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
      commit: 394b3e3ead0d9fdcc1ef53bb893fdbe7bf1db3ac


