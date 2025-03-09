Return-Path: <linux-i2c+bounces-9762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3600DA587EE
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 20:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05A7C3A475F
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 19:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C30216617;
	Sun,  9 Mar 2025 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="XdEDtKem"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D892165F9;
	Sun,  9 Mar 2025 19:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741549666; cv=none; b=ukzjqyEY97QB1wgP76AIwEphHC7otUAcN4j12y6bsAvi9RhS7dMJSwzexciGZxXSmb8ToBZUiM9xu5SOTNdrDNzVLEdxT1NZTK8QeWd1WQBnYJLXjnAOp8ycK8OJl+UuQfzhtm/5a9KyH8gx6WFn72vSAHBO92cnsbD+2a4hMmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741549666; c=relaxed/simple;
	bh=ggVdP5WB7dmKeqoWnaYejxWiD8uyj1cRmz9hIWSjxgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MX3BUkg2u4BPRdP2UyPi/8ePzfT97BmSRBtEcXOdgEpte58KmBgmzPdHY4HZMMU748bvz3H+5c2yyN8xsIuiSN0Zafaqs/nLBmDvaGYAYP6jKwlg5qL24iCNedvnVwjX4prmwtvK4NhZWvT/1zC7wcasVOLzCNF7lxQ23yUM6Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=XdEDtKem; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ggVdP5WB7dmKeqoWnaYejxWiD8uyj1cRmz9hIWSjxgI=; b=XdEDtKemwiyOxfou/xXkzu2wSA
	uKIzI70rg8yVmSfOgB8RBcPiosdXczqgBH73d1ahIJBBvkP+/1JjO/qyqGMAydwIU7lr4mg5G+9Il
	3y7wuWg3MwoRAJE3XVTeIFK8nTEBcArjAd3iKTPPZCeg4h7sKH9S9C5p4+uq4NkwQLdCX7eSQWvky
	MT5WgaV7NViv5skVp5OzZ02U9I5Ybm5BZ96WzfM5fZVJwolqfTS1M+h928y8hBhuTuouXUyRblC2p
	ErII2wchfWP4o17/z3iLG/tO2L6LM/AwEH2t5br5+Hc35gI/F5ppGqGsRMgdWG7RfE5qUSulXjFNQ
	0Vb3YEeg==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1trMcP-0003bO-AZ; Sun, 09 Mar 2025 20:47:25 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, Yao Zi <ziyao@disroot.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string for RK3528
Date: Sun, 09 Mar 2025 20:47:24 +0100
Message-ID: <1914308.tdWV9SEqCh@diego>
In-Reply-To: <20250309070603.35254-2-ziyao@disroot.org>
References:
 <20250309070603.35254-1-ziyao@disroot.org>
 <20250309070603.35254-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 9. M=C3=A4rz 2025, 08:06:01 MEZ schrieb Yao Zi:
> Document I2C controllers integrated in RK3528, which are compatible with
> the RK3399 variant.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



