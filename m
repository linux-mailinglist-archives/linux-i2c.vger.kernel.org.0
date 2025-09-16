Return-Path: <linux-i2c+bounces-12999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C9EB59E99
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 19:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1A1A461169
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 16:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F0A323F55;
	Tue, 16 Sep 2025 16:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgzQwGrC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB2323F4B;
	Tue, 16 Sep 2025 16:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041912; cv=none; b=lk9uutVayjy2q0nFAv8hZ6bghP81ff4LIv6i5htjA5tsn3zJ9OU1ay2A9UdHb5g87mY1WMvdonh4DTAYIn0pXCbdM5Xnr4+GzWP8bnpyie5WHe6XCUbXa4PCdvZGC0EyYjbqvOGTlSs1giEWDogtXNFdp7AElk2tOKOAQtt17TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041912; c=relaxed/simple;
	bh=YX81yBwofBnUjCFbXN5GKx3BH6qjUP4Z7bwt8rP5+jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MeiIALhqOwDhyzX25z1gnjeyFRA2E7nAFoBM/5qS8T1/8Vt5mTHetEUhPonZA2hStI9qr7H8ycpU+pYx8nNWqxHgokt9Gj9EoEBIbbpjNxmAnUqBnjTCeHDwz9Wy1C2nE8EoiV0ArZMGTVaXJi6KMKAp1S2qtw01LQfz3f4yRFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgzQwGrC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E220CC4CEFE;
	Tue, 16 Sep 2025 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041911;
	bh=YX81yBwofBnUjCFbXN5GKx3BH6qjUP4Z7bwt8rP5+jo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FgzQwGrCQ9Ae1MGugHl4edlXSPgt3pAMB303jA+uEf4qVNAyv8CVtPoTIkhOz2qFx
	 9jFNz0DAV3WXrco6DyXtWSetKJoH/tRiAYaWyVr8VQXdL4aJVnHepIhfFctRHavRNG
	 2aUuuWRAmyyssUY446HN7H5/7veUDkcHHiJliTH2GfHriKjc4cDPdH7fN3Hnn7aZf4
	 btyUQWcQUS7oc3TT/YunwzOW+TT5393e8+Kxj7Wg4SCJxIgtvytwmu3Ow8lgG147tS
	 uOWn/ol0epquwtJXHQmKn2J9fhVDxd9dmqI1le089Bc+CLF2cYSqC2wq27pvmBfV+a
	 P3wnLf2j5vpDA==
From: Bjorn Andersson <andersson@kernel.org>
To: rfoss@kernel.org,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v5 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
Date: Tue, 16 Sep 2025 11:58:15 -0500
Message-ID: <175804189838.3983789.14033268201753573404.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250519094745.32511-1-loic.poulain@oss.qualcomm.com>
References: <20250519094745.32511-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 19 May 2025 11:47:44 +0200, Loic Poulain wrote:
> The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
> It requires only two clocks.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: qcm2290: Add CCI node
      commit: e645096d1f6dadcead09c722a3fbc6c44a45fece

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

