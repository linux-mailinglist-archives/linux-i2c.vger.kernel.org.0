Return-Path: <linux-i2c+bounces-11572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD7AE6712
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 15:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 953411888BF2
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 13:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8533E2D12ED;
	Tue, 24 Jun 2025 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="ASSplS6Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A782C15B6;
	Tue, 24 Jun 2025 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773044; cv=pass; b=J2aeMxAZ0dztvuS0Q9y+jkGCHyZHnnsUMUMSn54FI7ZhGNuE2+QqwlCkG0kiN/pmdWTFogrLKg7tdhUpPcDl/ilJA8Z2ekLFc5nMBZ2bqKuMBtLKT3sAgG240pulB4aG14WmR5LuqRQNADKKFJAwfNzjLw5qqDs1ElzQxvXvfgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773044; c=relaxed/simple;
	bh=3LDQcD87Wri+XCeuQushsbc9uN7RNaVkwTY6s9v+ves=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fpGd2NuBrgIHx6V0Ly6aLANR/BZ1Ea3cLXM3vW3372H0dCAsEtoFG1miVaKaHu3lLtVF3KrVhjg3Es3TfSNRq3w5JCnIbzhnC77cQegtO0rVHk/Fh9z8EDmI8LXenuXEtUz68+6ao051QdCZZUK6aVDG/S/JE6FNd/aUtjlJXmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=ASSplS6Q; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1750772999; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HLWWqkzJBSCO02jmpwtlHthMZkWiBpHDnf9cvDr3XP5JhIgB6ehWRY6etS5qQ3U2jqmFx34awjXzhso7eJFhX5EOhiqfJ5ZHmGnnra78heE07TXhd/wG+BEhJe5hzhKDNHPt3riYBEsBLtGJ9QZMfxmv2RLtAzE4AYibe1ZdM74=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750772999; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3LDQcD87Wri+XCeuQushsbc9uN7RNaVkwTY6s9v+ves=; 
	b=HXugNEJocg/1EDbe7DPsj2aiYUr7PPRE9V/OktHI8VLRCLiHt6ulZqwUXlKgCvC40ROmSVEekb39878ixPgRwXvU+XRpAIVHfoJvEIMHdQl6WcD5OnlNkPkT1alb0WVDbMFLkubaEO9/YPBiBnnPXE/Vm0m1kFZfB4xDIa4hIAg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750772999;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=3LDQcD87Wri+XCeuQushsbc9uN7RNaVkwTY6s9v+ves=;
	b=ASSplS6QQZVezYgDHp0gixP86wG7iGU3qlgQy9LSg316kfeJOzDAHHmJ77C+IPG4
	avXEF0Po3g0xyJmam+yzmlcU/Vu6RfmZYxRd9o41SfeVhbpRrHWzGSJj3E/eistQYDT
	y/I66yC7rRH7qlu2Zui/copKRLnoQL2WGKqCNH1k=
Received: by mx.zohomail.com with SMTPS id 175077299645558.67407326984835;
	Tue, 24 Jun 2025 06:49:56 -0700 (PDT)
Message-ID: <52bcdfcfe84db4be9eeb7b7ebe926e990e460c03.camel@collabora.com>
Subject: Re: [PATCH 0/3] Add MT8196 compatibles to bindings
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	devicetree@vger.kernel.org
Cc: qii.wang@mediatek.com, andi.shyti@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 daniel.lezcano@linaro.org,  tglx@linutronix.de, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  linux-serial@vger.kernel.org,
 kernel@collabora.com
Date: Tue, 24 Jun 2025 09:49:24 -0400
In-Reply-To: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
References: 
	<20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Wed, 2025-06-11 at 13:07 +0200, AngeloGioacchino Del Regno wrote:
> This series adds compatibles for MT8196 (Chromebooks) and MT6991
> (Smartphones) for HW that is fully compatible with older SoCs.
>=20
> AngeloGioacchino Del Regno (3):
> =C2=A0 dt-bindings: timer: mediatek,timer: Add MediaTek MT8196 compatible
> =C2=A0 dt-bindings: serial: mediatek,uart: Add compatible for MT8196
> =C2=A0 dt-bindings: i2c: i2c-mt65xx: Add MediaTek MT8196/6991 compatibles

For the whole series,

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas

