Return-Path: <linux-i2c+bounces-1908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8748185F118
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 06:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 414A1282B7B
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 05:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC03111B2;
	Thu, 22 Feb 2024 05:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFoCPecI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4A212B70;
	Thu, 22 Feb 2024 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708580779; cv=none; b=jHq0pBK318MQRvJmT7+NmGewmSMY8SOewJK6qJGFrMkcC/uZmGfrWZLL5xaFmRTCwVSWWBquTqBNC4X5Hhx3whE5wwBjj9Y52aVLs5Rr0ZTHVeDKGgQl2TKlwEvMY5G2rfwVFbvAUWS6d1eztZaVv7HhkLFhGcdwa0NpuM7vawE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708580779; c=relaxed/simple;
	bh=rEo0owgvvOA+g8GumezPSzk2nZFNTPpvIw/utFsAdhk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=tiuwIYVfkrYxM60MsT70D9Prj1lP5ax4uTk/bxgaIdqI9WKNMWHJljTbf2ox9bPmZKHTNEEvaqarGz9u/LMX+VP2NXRnS2r95x5Y8J0apXF8H96t1FxGN9YzvmZSVYpK3qtIhJe0TSv79gcZQek6MclGXRpAJuQnpvWXO1sP98Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFoCPecI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B11C433F1;
	Thu, 22 Feb 2024 05:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708580779;
	bh=rEo0owgvvOA+g8GumezPSzk2nZFNTPpvIw/utFsAdhk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EFoCPecIWiE31P8q54+6r7EzV1y2GyHTafjJJno1Px4l+5MYXHYRMMg4bod/skQya
	 FohIGPemeLgd0fGD7qsnefVoNrEaqHG+R8oMl4gyiQy4yk3Ix9+osXmMdcs1zwZXBR
	 OBFl/Dmu+T0vdcY3B5hul2goM/I71C2e4Xr6i3EMDxYdh/42oURIu1MXYAzLN//ak/
	 XQTtS5enm6WNT8fJ65geGaSenfXrIBMmQI7VJK+uaqEmKDTeMnV/9+o1hsHvcrVvpN
	 wBHNs4cRK9Q3gUtOsgFXviWTmfrgq9M3EjXiqvkvRA2vZaKAd6QvXtkSRGIvMFUucu
	 w9ug53PcP9OOA==
Message-ID: <637b5d6b3fd2e4aaff3813f11c0e3800.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240215220759.976998-3-eajames@linux.ibm.com>
References: <20240215220759.976998-1-eajames@linux.ibm.com> <20240215220759.976998-3-eajames@linux.ibm.com>
Subject: Re: [PATCH 02/33] clk: ast2600: Add FSI parent clock with correct rate
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au, jk@ozlabs.org, mturquette@baylibre.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Date: Wed, 21 Feb 2024 21:46:17 -0800
User-Agent: alot/0.10

Quoting Eddie James (2024-02-15 14:07:28)
> In order to calculate correct FSI bus clocks, the FSI clock must
> correctly calculate the rate from the parent (APLL / 4).
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---

Applied to clk-next

