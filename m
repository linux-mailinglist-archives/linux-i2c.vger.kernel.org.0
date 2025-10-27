Return-Path: <linux-i2c+bounces-13841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A24A7C11D3D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 23:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2EEE4FE890
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 22:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B70348890;
	Mon, 27 Oct 2025 22:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmDHD8rC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E1D32E134;
	Mon, 27 Oct 2025 22:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604526; cv=none; b=ga53DCCt0qQYc1+vjBIEhWnpUYphKX54atCjpAQ8njA2wHMT9VE4ozcnvGU39HgHur6US91NZNVm/gj0Et8/sTegyzIi9hMJ7JWSUzbf1LtwKRpwXD6R8kZsiHlhAKj0RrY3eGVvSn+xROi1Jr/IVQYCoXf3PvydjGiVN3eSgS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604526; c=relaxed/simple;
	bh=Q92vmvJ7bn9umLd0wdQHt9IJaPI7kxdY4IXiOXZ/naM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G648Z0An58iIzsMftIBvoT5Oqpne3z5Pzjgfa1Qll9uubgKeDgCWeuIAwcSsFBm9HwKpd7Rvmel7djgwttcZt0fMsExTRJRk+oHocMLHI/ogb40/c6YIKEnL127m+vB8UZFYNpQu+qHmyH4zMitbWGyyJwc13l92+PZ6jo8rPAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmDHD8rC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1BDC116C6;
	Mon, 27 Oct 2025 22:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604526;
	bh=Q92vmvJ7bn9umLd0wdQHt9IJaPI7kxdY4IXiOXZ/naM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kmDHD8rC+AHB78En2yTg/SZgXypg6DNphE9BV8z+Wepc2eSjmbZnhbRgqgrkxQT3M
	 jDuiyRlSYelq81r+1kBCjAPDbGEYq+nQ+wvuPZO5N6RoHqfbb33JxuqEpRDsRObk/6
	 J1bn5Q68AFH2b811n9EbCzuhMx6frQ8rsLK6ThROyJX3nxlmoU8DJUG6rPvYi8Mqw6
	 bDbg7PeVsoXX2gVXXNwQ47s2cQA1NaUV44kOUmpXWMQy+mBgUXArC+whDp4rP4ST/v
	 6D2eg4dW6PT8Icb9v1eeA+NHa2L4ZJTx6JG8l6djBsiKapdEDIYMbhZ5yoFC6uNCUJ
	 FHwdJ/u4q2MMw==
From: Bjorn Andersson <andersson@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	bryan.odonoghue@linaro.org,
	vladimir.zapolskiy@linaro.org,
	todor.too@gmail.com,
	Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] Add CCI and imx577 sensor support for lemans evk
Date: Mon, 27 Oct 2025 17:37:19 -0500
Message-ID: <176160465166.73268.2713478395223102200.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 Aug 2025 15:07:16 +0800, Wenmeng Liu wrote:
> This series adds cci definition and imx577 sensor enablement
> via cci1 on lemans evk.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl -d /dev/media0 --reset
> media-ctl -d /dev/media0 -V '"imx577 0-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: sa8775p: Add CCI definitions
      (no commit info)
[3/3] arm64: dts: qcom: lemans-evk-camera: Add DT overlay
      commit: fe9829de17d3c01072cb45ef564b33101c62f58b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

