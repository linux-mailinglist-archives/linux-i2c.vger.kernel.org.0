Return-Path: <linux-i2c+bounces-14987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42602D01156
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 06:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAD343083C7B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 05:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636AF2D9EF4;
	Thu,  8 Jan 2026 05:25:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F862D7DF3;
	Thu,  8 Jan 2026 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849917; cv=none; b=WinSMcsq6sQ6hsnRgORbAUe/nqjRUrkrXM+TYnP4n+mFAUBhXKQ5FK6gT3xsyoYfGSXtwE7z896T/+y1QppijD913bvTzlclqshEJwOHgZ/9k6/QspyMcS7XMjLdBdNfxNUxHRqzeMjABHK1L8agXbkrluWutyetKbr+aoi1I88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849917; c=relaxed/simple;
	bh=cUDJ/Jq0808hTirUXhDv4kOOAPo94VpL0FqcReG1YSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tMYZtBQgOUSkhRtfACz61I5cU+OKJK6y+8RynDmZ09UVbOBX2qpjnW5ngS9zpqKpDu0SmljiIlqz4TfHEEgsjeg+K+gnudfu19x3icAswJanZOaZi8frJ6pckILdkKeyEr0UJjp+ODJJUewxOGruaSx9gVlDjS9DL3lVF6DQGzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E62FE340F55;
	Thu, 08 Jan 2026 05:25:06 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Encrow Thorne <jyc0019@gmail.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Guodong Xu <guodong@riscstar.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] i2c: spacemit: add reset support
Date: Thu,  8 Jan 2026 13:24:37 +0800
Message-ID: <176784920500.341655.1244714161729055220.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Dec 2025 22:29:01 +0800, Encrow Thorne wrote:
> Add reset support for the K1 I2C driver. A reset ensures that the
> controller starts in a clean and known state.
> 
> Reset ensures that the I2C hardware is in a clean state. We cannot assume
> that no program used I2C before the kernel booted.
> 
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: add reset property
      https://github.com/spacemit-com/linux/commit/91c444d4285c07dbf2e6e4bf954d9a0282157f1f

Best regards,
-- 
Yixun Lan


