Return-Path: <linux-i2c+bounces-8905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A8A0104A
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 23:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48EF43A48B0
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 22:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7241C07C4;
	Fri,  3 Jan 2025 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VULL0aBQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2F2629C;
	Fri,  3 Jan 2025 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735943950; cv=none; b=WQDFN5CaxF1MwJlMuaFNiPvXuefpbPJZyoY9w4LfIB43Ilonap7ePUd2D5ZqE+C1uqGLp+Q/xcsInCAoh0wsWhIxXzReqQAgn0Tlx/+v/PAIivqQJ49W0qkIbHratUaTSuOs1u6g2pAwR/SG75VxnopNLaYM+1IpgNkqlDw15jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735943950; c=relaxed/simple;
	bh=KyuBE1YPsrgBWLwzGpJ3dDD8ktrGq1em5l/rIrxYNzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTI/VtOWQoofbVp8no3hddUEI57hzX8EvcueI4N7RRriNBNGDANBZESP5CffbdUGkHk5x2CTBLgSNrBsYSbhGc2QwfjWZkmXkbT0V5xjxM/YHH/ywsLGhM9uY9HKjtwIFs1038slPJjqtWkjsloJpk72XMwAIViA2jTLqQerFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VULL0aBQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AF5C4CEDD;
	Fri,  3 Jan 2025 22:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735943949;
	bh=KyuBE1YPsrgBWLwzGpJ3dDD8ktrGq1em5l/rIrxYNzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VULL0aBQOGbTbU5tMbX1LMa+Ta/p4DfQqNgx5xTyNFrFySB/rPR6OCMnZbl+Dm/gA
	 Fm66TAzMURVYvCzs5EYDHgdWUY7rlRTxv61uSTpmHb8fMpe4QUE4kSgWrKwdYLvFBI
	 vfNFZ9RoblVynE9Tk4Sqjy3J1uRcR+udnlul/w1KKobi4l/mx+oMV63XajoXsmcPgf
	 kiaQxYqgAOjcayl62lGbwE5alYrapueBkgDf06AE1iSA9xpiONxLarDQkFYfe+ZJBc
	 fk0Yrl04Eac0jnGLDm3K7XPRncYjWt0Xl2ovDZw7Jpe3Egv0cca9IDBIdnu/An9N69
	 teSJmfB6Vjsig==
Date: Fri, 3 Jan 2025 23:39:05 +0100
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
	linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: i2c: qcom-cci: Document x1e80100
 compatible
Message-ID: <tuyhcn3ivgi2otmu5zapbggrhhtna3wfgmkcsyeowoyx6bzmj3@664xn4yi6beu>
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
 <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-1-cb66d55d20cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-1-cb66d55d20cc@linaro.org>

Hi Bryan,

On Thu, Jan 02, 2025 at 04:32:06PM +0000, Bryan O'Donoghue wrote:
> Add the x1e80100 CCI device string compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

this patch 1/6 has already been merged in i2c/i2c-host. You
should not send it anymore.

The rest of the patches are handled elsewere.

Thanks,
Andi

