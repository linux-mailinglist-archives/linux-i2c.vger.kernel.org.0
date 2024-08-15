Return-Path: <linux-i2c+bounces-5438-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 543E0953C10
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 22:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A37D1F26E3A
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 20:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B461741F0;
	Thu, 15 Aug 2024 20:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2owGvP2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14471741D0;
	Thu, 15 Aug 2024 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754503; cv=none; b=BXDXz5+y7Z2xgE86saUYA9I6rewrRjwhA5/BeQWKEUX4VsvqBQjUl6bmCFuYNCBbQrE/P/3LNenl6IGZOWIAFUM3Dqp+nZuRtpj5RNl9DXSmoGd0KDhO8bceCrwhxwx0GuTayOFe3XkSfFaYpChibbyRWWx39fy6F0alHznlqeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754503; c=relaxed/simple;
	bh=NZ2V1WtsDziTIoL1ct/qhjfiqhmcFfVQMHmeqZP9t+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=khjjd1hkVptSdaqOGWaslmzLQbY9d48Ya4R/8yigfpQk87bLaQ00PmE+C3jAVduCc+5uiMk+n9TpjCyDbAsJomt3oseoGC/OE+nFVzxO0WWlDQAuMziAk0vfJi5pIdjVB80JACbjH0ZGAc7sJ6Ty34xi1v0TV51fax0MeZAiT5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2owGvP2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC12DC32786;
	Thu, 15 Aug 2024 20:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754502;
	bh=NZ2V1WtsDziTIoL1ct/qhjfiqhmcFfVQMHmeqZP9t+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h2owGvP2VkKH53A7RnPt60O8eTfKVZxXjhHnHKy/1INbK8spfukxcACa3jIvQK9Tm
	 jAFzOVVlfXK1eHZ/Nf8Rh331AxUsEaU1WzFVSK5Mh0C/wB2yloul0VSIh8rIFrU5J3
	 NSPuZa5vd1/S9dhe++4r7LIX0oqqjUp4JvN7VJLPiYg6SCo6b+iJoLa7DIB1e3ezUw
	 dBWLUt3iremhquoBAhQe/W2BGYa2zdHnQORNY93xyiRGhd76uMc4mRzxWkG1sm1Udg
	 pbl3tlGtrtHiBBaTe2Q++m3924MSQte1YnZH/Z4//4QMbLots0gN/68ANONZFxw1/7
	 9Y6xkI6lyHNvw==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: qcom: add description of CCI controllers for sm8550 and sm8650
Date: Thu, 15 Aug 2024 15:40:52 -0500
Message-ID: <172375444797.1011236.744701243478190815.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612215835.1149199-1-vladimir.zapolskiy@linaro.org>
References: <20240612215835.1149199-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Jun 2024 00:58:31 +0300, Vladimir Zapolskiy wrote:
> The changeset adds description of camera control interface controllers found
> on Qualcomm SM8550 and SM8650 SoCs.
> 
> Previous version of the change is found as a single patch for SM8650 SoC:
> 
>     https://lore.kernel.org/all/20240410074951.447898-1-vladimir.zapolskiy@linaro.org/
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: sm8550: add description of CCI controllers
      commit: 4f33e6432f0859a19bb119248d0a8d20c29b9213
[4/4] arm64: dts: qcom: sm8650: add description of CCI controllers
      commit: 9e2ebc5817c94badf0ea716cad85f16ae05ff120

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

