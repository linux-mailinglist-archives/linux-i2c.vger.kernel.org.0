Return-Path: <linux-i2c+bounces-9597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F288A46E37
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 23:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38C367A3F3E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 22:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E2A26BDB9;
	Wed, 26 Feb 2025 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6QsClUc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9427426BD86;
	Wed, 26 Feb 2025 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607885; cv=none; b=acjkB7N4QAOILq8Ts0Sc1rukzjuQS7YmB7UCis2dm5OxTgm8KsArcT+xXObCG5uNldXCn/IHdggctIE2eo4lBbRdESndz2Nq5u1JHqc+Dh8hlurx2WdzMOgwcV4Xmm3uUM/FLbZlN8/Uo5BZ4iVLFHFQS/J8FAtjQpvhfRcwSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607885; c=relaxed/simple;
	bh=MOKIFSZgoUNKCofZ/c+V5IfPV1kAx0kHqbFI5F+m1W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ab0lhBmGB4PYPiAHKbVavTRLHFZ3jaJPeC8rPkBG1T/vJAQDiaAObuNmv99MiHRV94a/kz1fzE8zq7QTQwuX/gpVhQUyAJD32iBHOQ+U4RrhDsievwo08mBS5ng+PbnSxVwJha1zitP1Hi79klmfpl3chv9+O+kxcspE05Jm64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6QsClUc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA05C4CED6;
	Wed, 26 Feb 2025 22:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740607885;
	bh=MOKIFSZgoUNKCofZ/c+V5IfPV1kAx0kHqbFI5F+m1W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6QsClUcEkZgfd8BOiDBQVyd/oHTHKKkB4d5j0+BAmQUZBoHqZFmblijlO5og9Tym
	 IGdw6OtHQexNXuBZtkEwl4TJY8nB1G/B8DAclnjtbXxaoSF02mq6Tgyb9Ae26H2yp+
	 ggpCiuMz7YHPfeNFUkzlIlUDPPizIH30KMkefpQar6sTbzPP37q4jIMGML1uASciEe
	 m+SPD1kxP5IMjI4R6PU0bFD/044WBfCmzVvOmOifwvtAP3tUDxE4X9UuzRzeRziuzH
	 gtpDJMZfJglVKUvgyvKmNYKMLPUTDTntc1W+OS2F2KOuDYiRrCPAsqRdppvY5fuvOm
	 Ig+Hfds1l4kdg==
Date: Wed, 26 Feb 2025 23:11:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] i2c: qup: Allow scaling power domains and
 interconnect
Message-ID: <73kkvjpufwdt4fh63jyw3w2pksvfqz3dqo2wlos7ammlfray4f@6miusqrdxtok>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>

Hi Stephen,

On Tue, Nov 28, 2023 at 10:48:34AM +0100, Stephan Gerhold wrote:
> Make it possible to scale performance states of the power domain and
> interconnect of the I2C QUP controller.
> 
> This is necessary to guarantee performance with power management
> enabled. Otherwise these resources might run at minimal performance
> state which is not sufficient for certain workloads.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

merged to i2c/i2c-host.

Thanks,
Andi

