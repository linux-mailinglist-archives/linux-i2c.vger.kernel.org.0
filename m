Return-Path: <linux-i2c+bounces-8812-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A03699FE1B7
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 03:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EC4916195F
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 02:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC68A7E765;
	Mon, 30 Dec 2024 02:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHPlrbn7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556493C30;
	Mon, 30 Dec 2024 02:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735524242; cv=none; b=rRbiEoQDjINCCGHVOVns/LxdPNUhKZVyQT1Dbuu2QZR8djj903SatKpANuQUpWnIeR9rsBQ3chLTrfYmApqDYPVXyHM6hVddQcwA/FHGpjPCn6ztoGsXPyDK3sf64xvvT2axQ0LHN/76J/8BLmoy+LWpX9m1XkFBCptvKZv6oNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735524242; c=relaxed/simple;
	bh=akOrPjt3XdoM5akY0esxKzrsROwQ7JK2XuafowoF/Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5dOsl8VUuQ66s7zPMPEugPEv0Dr/lPYR2D+9m7Sfm3FwOJNpaGZPPvHFsMcjX77xwbzoZK0lViEFs6JBm4pQl6mD+oS6EyH/HVGCyluOHSoiGy8IWPQ0cg1OlSsUJU21xvepHYkKJDtMVYVM9PXJK8aOYbzYdd9Dse+asj5ee4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHPlrbn7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF45C4CED1;
	Mon, 30 Dec 2024 02:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735524241;
	bh=akOrPjt3XdoM5akY0esxKzrsROwQ7JK2XuafowoF/Fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHPlrbn7mO8242IRDpg5lLlWWEcNnR5Aky7XRYk3BifO4LxLFE5jo8lnVTqNSuLyp
	 vsjlZ9FkNq9xFVXmwQZybxjB0x0MmOrOaI9qxhgE6N7Rtfw042M8l0xJ6vkJA0r5ka
	 MOg1g+xmGu0nsSKTKY65CqH6MyGX5BoiuBLf6chpkcyFkNW6odee+ZCe0imL3PPjJl
	 XVe2fzzzYOa7niTMoeBlX7q4i0iOEIkPubiq7DxidhO48SkLRr3g503sNXTPy4GWBZ
	 h22j60OJPjIE0Qepw3LpL83pW3jjpiKaBamoU8Ex0JN/EMXsqkqf5lApllP1L5zRuA
	 SdisoHDhlv6ag==
Date: Mon, 30 Dec 2024 03:03:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document x1e80100
 compatible
Message-ID: <5jj2ptvqcp7x44nsj2kdmbpqi5nz4yqgu6wcb3oytp2uox6ddu@sjzugevhprsm>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-1-06fdd5a7d5bb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-1-06fdd5a7d5bb@linaro.org>

hi Bryan,

On Fri, Dec 27, 2024 at 01:11:34PM +0000, Bryan O'Donoghue wrote:
> Add the x1e80100 CCI device string compatible.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Just this patch number 1: merged to i2c/i2c-host.

Thanks,
Andi

