Return-Path: <linux-i2c+bounces-7436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 988569A1509
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 23:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52DC52864F8
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 21:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE3D1D3584;
	Wed, 16 Oct 2024 21:41:59 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD971D2B2F;
	Wed, 16 Oct 2024 21:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729114919; cv=none; b=TcD3Pe+Mmx404JpX6gL8848w6M95GA3mlk0GeGmML9r8SE1tDzgg36QGT0F0ovSQw4sxHvXeWdpuRH/Q/UAmHqDhWOZisGL8FpEtLOa7GumLYWoF4RzEP9+UUvRnKsSrwiIPNeEyTb11n7rlRyJoFenJaGeFnWnhElaGq033Mx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729114919; c=relaxed/simple;
	bh=S3EfK2JVGZ3joMiaZUylXW+vGex1gp8GJngUZrzgF2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YVd+npUtg7Yh5JTpEd+B+jCiRkk3DSuH0ygYZ8bqHsyGVlM/YI4Xtk7b4uJ6myuFv4AfF+l8xurRJXkR2ZgsOPn/QXGELHi+wiGMCgj3tOVdjNFjHSy9f7sYJ8hHlZdvn7hXBvQnH2VK4mr+hiju3dHlvwfc5xsJBaYYNTCU5b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4ACC4CECD;
	Wed, 16 Oct 2024 21:41:58 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 46BE01060453; Wed, 16 Oct 2024 23:41:56 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, sre@kernel.org, 
 tsbogend@alpha.franken.de, markus.stockhausen@gmx.de, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-mips@vger.kernel.org
In-Reply-To: <20241015225948.3971924-1-chris.packham@alliedtelesis.co.nz>
References: <20241015225948.3971924-1-chris.packham@alliedtelesis.co.nz>
Subject: Re: (subset) [PATCH v6 0/6] RTL9300 support for reboot and i2c
Message-Id: <172911491628.630785.7202407720248115906.b4-ty@collabora.com>
Date: Wed, 16 Oct 2024 23:41:56 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 16 Oct 2024 11:59:42 +1300, Chris Packham wrote:
> As requested I've combined my two series into a single one to provide some
> better context for reviewers. I'm not sure which trees the patches should go in
> via. The first two are reasonably independent and could go in via linux-pm. I
> guess technically the last one could go via linux-i2c but it needs the and the
> bindings/dts updates which would probably make sense to come via linux-mips.
> 
> --
> 2.46.1
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: reset: syscon-reboot: Add reg property
      commit: e7af7d13316dc5e2293c4f777f71bd8331f5d7a5
[2/6] power: reset: syscon-reboot: Accept reg property
      commit: ce38cdc908557953604ffb0a91ef5ae3fbdf1c6b

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


