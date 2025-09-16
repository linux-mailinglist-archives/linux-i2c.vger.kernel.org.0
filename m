Return-Path: <linux-i2c+bounces-12998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BF4B59E97
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 19:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC0146170B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 16:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259F2313D78;
	Tue, 16 Sep 2025 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ngku2T5P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF25313D66;
	Tue, 16 Sep 2025 16:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041910; cv=none; b=bz5E7JlndTfmRss0L93TFT4ouo46UCzuAPwai6YW2aG6FosLIY2AAEoHvEvf4HrIL5h7ytoHyqJzxkU4BQRwShvuqA/eCUo+bB37hecom3N+fN2wq1YQqlUJgXa87B6e5r1BATUZ0y0JqEOZBV6yssrTuxrcY5EVz5GUBVWMZZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041910; c=relaxed/simple;
	bh=bKHcHuor+4bFUIlsOLdnuePweUwd6K2Id97nKLmzew4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WlmORczAbgEqakZiWZKcd+eC2nRT20ZWQHRKhH+dgrzLEES8MZxI6yCbTc79dpCzKkzHcQZ1SKA5/S+8/opiWgSQxFU0JMwUyRom3F/nugcHl+LrCDq3mbXOOq2fpsqNbLUcaBeohfcwlHNF+NMTd3LeaYBLnb000pZpuG32laY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ngku2T5P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB79AC4AF09;
	Tue, 16 Sep 2025 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041910;
	bh=bKHcHuor+4bFUIlsOLdnuePweUwd6K2Id97nKLmzew4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ngku2T5PvAFs0MFTlqGT5N5hb9KLToKKyMDIxKqXeNeVL12CLI4316IFJjubpJizn
	 3ZDxSkI8OpqKHJT0JPis3I2UnaTTVN+d5L93houVtdoY+/Slav+WHqO2bzCkvp4K0O
	 gDDBKiDJJ4vzuV+yP5WBUn7EGfTrs1JGbNwBwCBgoMjIhRIVubt20GXz/+WfzU2Mdk
	 rjIRM2n5i2L/OisXo2b+iowL0gKYdkNSBUHRR6OnQCovoC9EvMCNfSIaf1z1W0Y67B
	 OemCpkKUwTALrXq8sdcpbL6TtshH6tXmWlp38YvekcEySXq+JtvAk4QtBhV5LeCttc
	 CR9EZdBWdac9w==
From: Bjorn Andersson <andersson@kernel.org>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
Date: Tue, 16 Sep 2025 11:58:14 -0500
Message-ID: <175804189858.3983789.17257692199206822662.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911212102.470886-1-loic.poulain@oss.qualcomm.com>
References: <20250911212102.470886-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Sep 2025 23:21:01 +0200, Loic Poulain wrote:
> The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
> It requires only two clocks.
> 
> 

Applied, thanks!

[1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
      (no commit info)
[2/2] arm64: dts: qcom: qcm2290: Add CCI node
      commit: e645096d1f6dadcead09c722a3fbc6c44a45fece

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

