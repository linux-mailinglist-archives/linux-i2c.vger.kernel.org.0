Return-Path: <linux-i2c+bounces-5003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FBC932FEA
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 20:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFE271F230D5
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 18:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7961C19F48C;
	Tue, 16 Jul 2024 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nt9Jiin8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5671C6B7;
	Tue, 16 Jul 2024 18:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721154414; cv=none; b=jHAhiptL84F7QjGMvLL7w2N41fLaH9MLpjLiMj16kNM4v3aSg8rgysvDn1ja3H6R7mI/h6+hzVfYGaDUQLoHofjRJ1zy9b+la13VNMpm7rppxk9QMMC9BZAlDJRQjDt3bMqTiGXRu9tue4l+3lOtnWaCPys0FK+vl/X8rGA1sgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721154414; c=relaxed/simple;
	bh=tlOGeycUnPqaxZJFZ2oWy0gztTZXn9im8D/9UvMg+FQ=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=rSuEDAmikMcqrlwKfh4ESeT/lECInnIXGjCgTL6RHv4ALwXBYBF95VpK6OqP9z7Gxs7q4Ui2k9fywiu/1D+oxTpZWjPGUOPkDLnCv8C6b67XdYx10ES0jUqezLZsvspVo685kNCjw1Yn7nvAXDXwJ0HOGaxFwQ9vb3p366qR0ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nt9Jiin8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D4BC116B1;
	Tue, 16 Jul 2024 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721154413;
	bh=tlOGeycUnPqaxZJFZ2oWy0gztTZXn9im8D/9UvMg+FQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nt9Jiin8YBEVHys5vt7DZU9pK5IYWVTSdrWgSxBVJHZT2glpIj0y6NLgZ7Sikm7e0
	 yZEVOb10fDPEg8H/uUN5at8NJk914PVAEjAtB4ojKpLBP4ZG/TeB19xqmRHCSVXRrL
	 livzMRIvYjVvDo8VRXCMnKPdZBuUEAEw/jVaUfLnXLqkfhwNREroTRD3ZAm0pdRcg8
	 RqUe21h1Xs/GebE7Ef8MzKnBlooga1Re0FYTjBBWp+O+avSrwwps5MYZA66fdq0W7E
	 zHa1JGGWBRb7ePth6GmMYy5AIWgIBwx9rB2IlQI6ewX9T6HQYODMkWu9mjOjc5O/sP
	 jUhVT0MVE3xQA==
Message-ID: <4edc5e10f4407c281960dad69d7f463b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a9ada686e1f1c6f496e423deaf108f1bcfd94d7d.1721123679.git.geert+renesas@glider.be>
References: <a9ada686e1f1c6f496e423deaf108f1bcfd94d7d.1721123679.git.geert+renesas@glider.be>
Subject: Re: [PATCH] of/platform: Fix inverted check in of_platform_notify()
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
Date: Tue, 16 Jul 2024 11:26:51 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-07-16 02:57:25)
> The check for of_node_check_flag() was accidentally inverted, causing
> i2c-demux-pinctrl to fail on the Koelsch development board:
>=20
>     i2c-demux-pinctrl i2c-mux1: failed to setup demux-adapter 0 (-19)
>     i2c-demux-pinctrl i2c-mux2: failed to setup demux-adapter 0 (-19)
>     i2c-demux-pinctrl i2c-mux3: failed to setup demux-adapter 0 (-19)
>     i2c-demux-pinctrl i2c-mux2: Failed to create device link (0x180) with=
 e6ef0000.video
>     i2c-demux-pinctrl i2c-mux2: Failed to create device link (0x180) with=
 e6ef1000.video
>     i2c-demux-pinctrl i2c-mux2: Failed to create device link (0x180) with=
 hdmi-in
>     i2c-demux-pinctrl i2c-mux2: Failed to create device link (0x180) with=
 hdmi-out
>=20
> and anything relying on I2C connected to these muxes fails, too.
>=20
> Also, loading the 25LC040 DT overlay on Ebisu using the out-of-tree
> of-configfs now fails, too.
>=20
> Fixes: 98290f295fbcf18f ("of/platform: Allow overlays to create platform =
devices from the root node")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Thanks. I'm going to fold this into the patch and resend the series.

