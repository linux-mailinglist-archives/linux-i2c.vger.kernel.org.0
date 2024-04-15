Return-Path: <linux-i2c+bounces-2952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D0B8A5D00
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 23:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 699F728494D
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 21:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D705E157468;
	Mon, 15 Apr 2024 21:36:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo561.mail-out.ovh.net (7.mo561.mail-out.ovh.net [46.105.57.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3036823CE
	for <linux-i2c@vger.kernel.org>; Mon, 15 Apr 2024 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.57.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713216991; cv=none; b=GaBpXaiRT93YdZeL4oBAkYArd6NVo73+kFdbjjp6G82LUE2iAqlj1ao/6HSSWay/Nv/RpOmV86LfkU3w1C94CClLJtwj6BRkIpnjztD/eH1cZavWCgDwJOURBF8cDvkqVaIVkfuZxiYbatJUkmF9Vz3/5cA5jusRDKvPJo8dtqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713216991; c=relaxed/simple;
	bh=XybDZ2MMTdcokpPlkBJhrClPjnxT/2fqLvH9KOzHy64=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rt6ygH8YH0NQuR+QyxF/bHlXjSErs/ntj4b0m5ldKV2bDip9wAIZBA06g6KJvNRPGdo/+fatuqhIvFMCCcBz075t6gfv5hSrPFRwhDPhGgUTVShIp+ClLcC0hwij+nq3fa4vUI6erGdygXiExNqzL7YDKQiewrRi3lhtcYprbT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.57.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.25.15])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4VJKLX3HQqz1Rwx
	for <linux-i2c@vger.kernel.org>; Mon, 15 Apr 2024 21:00:04 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-w7sh2 (unknown [10.110.178.131])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CBAA21FE93;
	Mon, 15 Apr 2024 21:00:01 +0000 (UTC)
Received: from etezian.org ([37.59.142.106])
	by ghost-submission-6684bf9d7b-w7sh2 with ESMTPSA
	id 3/PYLVGVHWaUHQMArYzXgA
	(envelope-from <andi@etezian.org>); Mon, 15 Apr 2024 21:00:01 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-106R0069717fa12-e9f8-4f4c-974d-fc8acd2e533f,
                    1C060BB0AFB71ED4B605930205BB25055C08B83D) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: wsa@kernel.org, Loic Poulain <loic.poulain@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240412-linux-next-24-04-11-sc8280xp-cci-compat-string-fix-v1-1-7dbafff36932@linaro.org>
References: <20240412-linux-next-24-04-11-sc8280xp-cci-compat-string-fix-v1-1-7dbafff36932@linaro.org>
Subject: Re: [PATCH] dt-bindings: i2c: qcom-cci: Document sc8280xp
 compatible
Message-Id: <171321479967.1758400.4418500996463350127.b4-ty@kernel.org>
Date: Mon, 15 Apr 2024 22:59:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 10760225412810082960
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudejvddgudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth

Hi

On Fri, 12 Apr 2024 14:53:25 +0100, Bryan O'Donoghue wrote:
> Add sc8280xp compatible consistent with recent CAMSS CCI interfaces.
> 
> sc8280xp has the following clock list and so requires its own compat
> string and sc8280xp specific clock definition in the yaml.
> 
> - const: camnoc_axi
> - const: slow_ahb_src
> - const: cpas_ahb
> - const: cci
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] dt-bindings: i2c: qcom-cci: Document sc8280xp compatible
      commit: 32204e57f3fbe8863dc17ba59bdf3f5dd573896d


