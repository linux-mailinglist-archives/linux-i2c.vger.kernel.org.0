Return-Path: <linux-i2c+bounces-8946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD395A0469A
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 17:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C28BF3A2A86
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 16:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAD71F63E1;
	Tue,  7 Jan 2025 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0B66FxK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3E1E7668;
	Tue,  7 Jan 2025 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267949; cv=none; b=PSjFl5Csjgzmhoa90gQwOz5goWhEnfK70xXHyPVBfxDALRRJDIa6sR6PN9bFlAqwz53zH/iVrGwUIC7fiy/WbF/c/WLxUaC3nH0xt4VumS+HawViEHjli5Fv6ipfpserJ1ZxsFzLeapReI411iR4Ys/zYdMKw+Nb+IipOHIFbVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267949; c=relaxed/simple;
	bh=TcLBH0oyHBtlA82Ehx2J7EdfZ1Kd+1oKJoAgXLeGMa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZOO4L4E8O+d+SPkDlMj2EgI9bj8mi+FDHZg6fkpXpMwmdzJ+ZUERNyJLWD/qYMSoVvL3LEJ0vwXHq8HZL2XJcxEHeJSWxUS0ktvYj8psE1bBvYEPDY+cub9p+ViEQG6f6O1D+aMYEt8oN/w23Ihkq5dkVHdZn4R77uT4MdO4otE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0B66FxK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F22C4CEE5;
	Tue,  7 Jan 2025 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267948;
	bh=TcLBH0oyHBtlA82Ehx2J7EdfZ1Kd+1oKJoAgXLeGMa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p0B66FxKfmPkL18ZJZuYe77nkEoKYdX2lzoYDCGv2femI6uB/q0eETcD2tnIbJf/v
	 7RxtVjliQgOwsaXulxB6lPT6SOYCJf4jttaOxBWh/AMDuKaT5wD61uEeahT2M7Vcj/
	 K8dVshOcjIW8BfQq21WjPd96xcXPXrwDjK783q0mroDToVZxs09gBBi1wAdqdCxY4w
	 5HEdZjYCv6MIceJ9oELYu8SMAiv9b6U0b7IBygat5VjNFgbzj3M7GfZTXgXbBJYa/3
	 ISkGJJG8I70JUKAMOrbJLb1RfvDJZ+HZMg6M3SjDXj/HYdVrDRy/WHTFAXCazw4gjb
	 Ip1v6CAkOrP1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] Add EEPROMs found in the camera sensors on Fairphone 5
Date: Tue,  7 Jan 2025 10:38:40 -0600
Message-ID: <173626793391.69400.1276032433619119584.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Jan 2025 12:11:56 +0100, Luca Weiss wrote:
> While out-of-tree already two of the three camera sensors are working on
> this smartphone, getting those upstream-ready will still take a while.
> 
> Until then already enable the EEPROMs found on those camera sensors
> which doesn't have a dependency to the sensor drivers and gets those out
> of the way.
> 
> [...]

Applied, thanks!

[4/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Prefix regulator-fixed label
      commit: f8cc045b9db0d571f1fbd27de5e84b92d4319255
[5/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable camera EEPROMs
      commit: 14b77dc81213b35a7028d2cb52389473665b6d48

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

