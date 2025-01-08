Return-Path: <linux-i2c+bounces-8958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 731CBA05234
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 05:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E9D216298C
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 04:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3247B1A0BED;
	Wed,  8 Jan 2025 04:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ztf+TQ/N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF101A073F;
	Wed,  8 Jan 2025 04:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311432; cv=none; b=jHYCvWU3ny3SYsWnFCPEHUqO/2RgVD6new0mdXbKtvk66TZPdYzB9ZYzDGusOIaOnXZ6QwPI3YLZ/nlj9uL2Jobfft3rzSYJ3thPYOKWwGLppyCGcqZkmjRleUbynQW35WdZ8VDcO7uErjFiSAD60+qtgVvfdFPQq47R1FtEeNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311432; c=relaxed/simple;
	bh=zrGJQoH0dvmgH6dxRLPUvDFMlfzgZDDrLwRLJDURHgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qd/QXFdkXNaC19yzSE7TFZmI4h6+nF+Z0wOXlKjejZRe0jISx5J+A1oSZUlb5+UZ4bcpjRIzn81t1GDOTUSRIXaannDN90mQ9p1HScPB/vuOge5pk3GRs2IlcccS9eleiTg22Yp1TUka+uszEINz2N0KWpi4vr/vgL6lv42jSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ztf+TQ/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E25C4CEE1;
	Wed,  8 Jan 2025 04:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311431;
	bh=zrGJQoH0dvmgH6dxRLPUvDFMlfzgZDDrLwRLJDURHgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ztf+TQ/NSW3qERHePdqPJ+t7YSLT0uOMUCaTKLqSYHFwjkBKm9M5ZehtVOkMO5qQQ
	 UGpSPwnXuGhgRUZQ9ipQXL1vblHnWxvIAlau731bo50jfjlF/+VP/+21Ze4KjwrwGM
	 tpCb4OOvs7U6/OQFdvgsAaAx0lBLYTSD9nrcZOtUn6o3ZbpOFdIHni2o9sB8lVm+k2
	 wf9hPIeq6ER5fehfve91cnXuYrD0UxRTJkVAmDp/18/2/YmwOQhbTMWF5bWLmHRNhO
	 YLQPHOEddRncc1XgRpl9pMANd2p02EWW355N5s8wmOxLEUOO4j/Vu7/0ncNkFPfyWl
	 RfoWU5gdEU/RQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/6] Add dt-bindings and dtsi changes for CAMSS on x1e80100 silicon
Date: Tue,  7 Jan 2025 22:43:41 -0600
Message-ID: <173631142076.110881.800526094135590633.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 02 Jan 2025 16:32:05 +0000, Bryan O'Donoghue wrote:
> v3:
> - Fixes ordering of headers in dtsi - Vlad
> - Changes camcc to always on - Vlad
> - Applies RB as indicated - Krzysztof, Konrad
> - Link to v2: https://lore.kernel.org/r/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org
> 
> v2:
> 
> [...]

Applied, thanks!

[2/6] dt-bindings: clock: move qcom,x1e80100-camcc to its own file
      commit: 7ec95ff9abf499b4775148db92528feb4e8ff1ee

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

