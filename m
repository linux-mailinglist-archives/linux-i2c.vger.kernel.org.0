Return-Path: <linux-i2c+bounces-13591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C8ABE41A0
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 17:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40E6D542FED
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 15:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF64A3469E2;
	Thu, 16 Oct 2025 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErPrdLI2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0FB343D86;
	Thu, 16 Oct 2025 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626941; cv=none; b=MnSp+YeY0tHyGh9hKkd9meAxxBQzmw5U+YepK2UgPQ5wH366wlLRXiATmGSf/su/lB6euod1raAiBTsSHMYX7hXlZmvXqwL4a23F5S5UOKpeHyRiZDeffvWFT97JXwBSp+iJvSAfXyda8lBF/KN0R25OsLJtgECo2l/rWSY466s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626941; c=relaxed/simple;
	bh=3MjSfBabHCFIL4MA29+pKYeNe3+EeynLYY5TahB4N/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X5scMmmhdv1kjQW3G745FOfH0c88mUTNWziPNL4aTrKZiRiO6R8woMw3SAhw5Wm68VIP4PEHJUO2QLOn2Yw185AlKUdm8fu5aqZ04z2rQIMhPLsoPjqiMvaBqKxj5LHGPBCgQDiqqby0sMDE72a5UCvJkxhVM4sYolY50AstYyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErPrdLI2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593C5C4CEF1;
	Thu, 16 Oct 2025 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760626940;
	bh=3MjSfBabHCFIL4MA29+pKYeNe3+EeynLYY5TahB4N/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ErPrdLI2oJ05RaUfi+JG94NUkNTrjhFzYjwB5HNFEIbBnwC8FRmafgMScIUIFZRrj
	 ERdL/p/OQJXkTPOeh6Vanil0/l6H9hUlGYHALYNctGKLPsADsuDB3mu3w2QUgx784w
	 IyutRJ5RBuYu1OeNIIkjLKWK8SOlBTfgbtY0hZFNrQgemUX/vWJPrISGu+oNrY1gls
	 aX6VDDeWW8y4iRQEbzB80phLm5zCqHIjsPBWmNv4+dyxRLmmG0ePsoKyznQ3f9YGGb
	 hHzXfj1UpplcfLOX82o9mqpInT5zorAU2EVzki3L/LqSjgFEjJwrgWpzigeUK1bdkF
	 tC2dFn+7qu8YA==
From: Vinod Koul <vkoul@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
 Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
In-Reply-To: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-Id: <176062693701.525215.15119814964609949547.b4-ty@kernel.org>
Date: Thu, 16 Oct 2025 20:32:17 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 25 Sep 2025 17:30:33 +0530, Jyothi Kumar Seerapu wrote:
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> [...]

Applied, thanks!

[1/2] dmaengine: qcom: gpi: Add GPI Block event interrupt support
      commit: 4e8331317e73902e8b2663352c8766227e633901
[2/2] i2c: i2c-qcom-geni: Add Block event interrupt support
      commit: 398035178503bf662281bbffb4bebce1460a4bc5

Best regards,
-- 
~Vinod



