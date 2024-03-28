Return-Path: <linux-i2c+bounces-2645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F4588FA08
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 09:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B83582988A2
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 08:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A7344C67;
	Thu, 28 Mar 2024 08:32:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 11.mo561.mail-out.ovh.net (11.mo561.mail-out.ovh.net [87.98.184.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264654F8AB
	for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.184.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711614733; cv=none; b=meYoDksFJY7AQFENm9BUkHBe+gd53qQz3/AWLIfpiMp0vNtHQwrsX3jGNxM2JL5G9IeC2PcGuZINfcNFZr/YPdtkRFErh6jxHR09hA8mP4qO8VQGElp0AWV7poxU5EE0fjYG0OrnQqu1A0SyfpxxfZnpOiYoGoHEz7Wm/wG65Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711614733; c=relaxed/simple;
	bh=5jdL0NZakDKqF9gplUSDQhdeYmYZL6yIF2/zBxh1+kM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KUMx4hjckKY2TK2dkC53Ma6sU+Tgvh3AXfVLAI4hE48sCed60IpcFv9cZeht6S9wd2s0XcjTy+OexUrDgTEjICdRyNAce3sX1fnrM6yUm7WUyHoq/Jt07erCn+KigPLvlMT1GiDmkbw+AsVItbGznhq6hCwwv4YHKYqAfRG0I6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=87.98.184.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.25.131])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4V4wMs13Twz1D7V
	for <linux-i2c@vger.kernel.org>; Thu, 28 Mar 2024 07:36:41 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-t7l5r (unknown [10.108.42.33])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 665B41FEC4;
	Thu, 28 Mar 2024 07:36:40 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
	by ghost-submission-6684bf9d7b-t7l5r with ESMTPSA
	id 5CxFEAgeBWYTJAAAWKMMFQ
	(envelope-from <andi@etezian.org>); Thu, 28 Mar 2024 07:36:40 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R002260416bf-d1f0-4904-9a61-cd2b2c3983f5,
                    6D693167F0AB1D8A9C15294DA3267AC24BED3ACC) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240327174705.519535-1-krzysztof.kozlowski@linaro.org>
References: <20240327174705.519535-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] i2c: viperboard: drop driver owner assignment
Message-Id: <171161139848.2698925.1593259780081719609.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 08:36:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 2164261096738392600
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledruddukedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfgjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeelkefhieeljeejffdtvddthfffleffueekkefgieelveejjedtudettdeghfdutdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth

Hi

On Wed, 27 Mar 2024 18:47:05 +0100, Krzysztof Kozlowski wrote:
> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.
> 
> 

Applied to i2c/i2c-host-next on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/1] i2c: viperboard: drop driver owner assignment
      commit: bfced8e642d8e221a765b4d97ce7705cfa63b9a6


