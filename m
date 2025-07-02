Return-Path: <linux-i2c+bounces-11776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA55AF60B5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59DA64A1189
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C16F309A6E;
	Wed,  2 Jul 2025 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL6mpdgQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17C2F3C39;
	Wed,  2 Jul 2025 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751479328; cv=none; b=pFdceHySH4oNC2xVrRh/CgCrATO9jLm19GwCSV/ktJSsHNUsV7zV3tyM4wt7vhniZyksPAbi3hyHoZQVcKwXurj0EaJ3MdPAD02VVxSWu9kMz7MPk4W8K28NX2lyVknbYzLLJ1K7xlGM1ZjkY+qI7vUgh9Oy6xxk9kEiPXgJ4Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751479328; c=relaxed/simple;
	bh=K3EF5y1XYtVlfOzcfxLVUR0k5e39PRhXTE+YAgxFBYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOkeUbjfWb7oXPEl4slg5wUm2AgRpLhvT3T+D1koSGWh9WRtDAPdApSfmlouWLq43Lb167GuX5fnKdpU6bMkLPCrpkng/u26tDmMoe1gVb4O/1IYuMg1ObFxXjgnCAUMP+OCfxhOFpg+kV9FCLp7RcSOQWN4JzJoYyjbQTh0kCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL6mpdgQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2733C4CEE7;
	Wed,  2 Jul 2025 18:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751479327;
	bh=K3EF5y1XYtVlfOzcfxLVUR0k5e39PRhXTE+YAgxFBYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hL6mpdgQ2HYzV2GXO2ZHGcmSnT8ChOtZfsMbwC4ve6NViO53XZzFHGb90wrbafD3K
	 hhfeuBxtJUrneoQW5t6RhotwxUVcNqTnSgfrxG2jk7j91NCvlBY15yIQRXX+aOXszQ
	 ENgGAetPLNhNM7woQu7qa554fWwR9EqK5DY/qk4Ww9f6sqpzXrmA2nhYL9/pE2pw2l
	 WQQQTCyDJHQMrnyR83XYUOtAD/Wljb0HnLR6GK6JyCr67GyLEEqbl5+w2U7ZQXHd7w
	 p4nHZ0OSGzJKAvDyuzpBtXA5RGvtRKfd2ugnixmoTiCcg1CB0ZzkoMZqfZCktgYhKU
	 gBozKpcN3W+Qg==
Date: Wed, 2 Jul 2025 20:02:02 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, johan+linaro@kernel.org, dianders@chromium.org, 
	agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v5 3/5] i2c: qcom-geni: Load i2c qup Firmware from linux
 side
Message-ID: <bapt7lht2jegc4ri7oh5t3zjlaeeedwjhrov6yqlty6pjed2fi@whmconfbfwl5>
References: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
 <20250624095102.1587580-4-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624095102.1587580-4-viken.dadhaniya@oss.qualcomm.com>

Hi Viken,

> Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

