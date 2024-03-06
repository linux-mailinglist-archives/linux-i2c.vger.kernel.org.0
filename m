Return-Path: <linux-i2c+bounces-2213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3E28738DD
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 15:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E24121F24EEB
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 14:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20A0132483;
	Wed,  6 Mar 2024 14:23:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 11.mo581.mail-out.ovh.net (11.mo581.mail-out.ovh.net [87.98.173.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F9B130E40
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.173.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709734987; cv=none; b=ZF+nRT3J0uT9E88jTWK75Nlk5WRdntOCmYBTgUkvJWoYeyZxwrvQH5lEzVnnW4hclAxXSfQDBuBNCKO/xl2M1wj5O+DsmvJ4TqQPb8kjUP3d0sU28ggxr0GacRgctXOgQ+T38WrWVcUvJIijtetaLnkl/QrLK0z9zewn4OeYspM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709734987; c=relaxed/simple;
	bh=GScJtoRBAe4lkdk7YCQcaJqSxf7aTWrzfVxXIXxEmMM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Bt6UHl1525AV/XwYEtpVK/V9NXf2KjHIgCdqnUc9Bu0KneB1fl8mUNBmIhf8Lv66LCbBzTYHQccpbI+NLy/I251Oenqe5fPtuAY4DZK5IBrinY8C7S9ryZuMbMX89gHB7oqfkf/o/i9PwVK41RJ/uAw1hwicvgMeMv/X72cq69A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=87.98.173.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.25.111])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4TqW926DgQz1FgY
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 11:55:50 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-7smw2 (unknown [10.111.182.47])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AC5801FF06;
	Wed,  6 Mar 2024 11:55:44 +0000 (UTC)
Received: from etezian.org ([37.59.142.101])
	by ghost-submission-6684bf9d7b-7smw2 with ESMTPSA
	id sAEZNcBZ6GXmNgEA++KPQQ
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 11:55:44 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-101G0043716780f-fe81-4286-987a-6a321cced5bc,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au, 
 andrew@codeconstruct.com.au, jae.hyun.yoo@linux.intel.com, wsa@kernel.org, 
 Tommy Huang <tommy_huang@aspeedtech.com>
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
In-Reply-To: <20240305011906.2745639-1-tommy_huang@aspeedtech.com>
References: <20240305011906.2745639-1-tommy_huang@aspeedtech.com>
Subject: Re: [PATCH v2] i2c: aspeed: Fix the dummy irq expected print
Message-Id: <170972614153.1712532.8035778125665215281.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 12:55:41 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 6468857915411270185
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth

Hi

On Tue, 05 Mar 2024 09:19:06 +0800, Tommy Huang wrote:
> When the i2c error condition occurred and master state was not
> idle, the master irq function will goto complete state without any
> other interrupt handling. It would cause dummy irq expected print.
> Under this condition, assign the irq_status into irq_handle.
> 
> For example, when the abnormal start / stop occurred (bit 5) with
> normal stop status (bit 4) at same time. Then the normal stop status
> would not be handled and it would cause irq expected print in
> the aspeed_i2c_bus_irq.
> 
> [...]

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: aspeed: Fix the dummy irq expected print
      commit: 94e889260a5bae7d4c06de90f1724aeb8b1175c6


