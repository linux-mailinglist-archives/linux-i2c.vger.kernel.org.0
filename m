Return-Path: <linux-i2c+bounces-6105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2631A96B0D6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C579F1F2652B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 06:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCF486277;
	Wed,  4 Sep 2024 05:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qB4IvGAT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ACA1FC8;
	Wed,  4 Sep 2024 05:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725429470; cv=none; b=I/VEuMNyY0OPq3WnlItKYeIc930GyntQvQmaBj04rbLt0yP5ik6GVT5WuJWssaTQhZc530fRfmecONo/rvZx9k9aUUFz0K3WOglr4C9Jc5ku+2gcsdFjQq54DJQ+PS4iTstlxOG0OZQtkJLdbUGNhislr7rqpqsLuac6wQOWd9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725429470; c=relaxed/simple;
	bh=1Uq+s42VoGWl7UxVx2ytzpaQeaggcvLNs5AnTqz4oYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbsNPzRDcJea4PgjRluyyWyCoc2XRVuPdHDEJ7KcXVkoUWCye1iKqeKEpBEm/Tuj9eDSxK0PPgdd4zNetdDpLnM2oicGzncEdnceIDdkiy5OH6v3MS76mt9551NdPQV8XfIazAsGbiVRc1argnWMjp6G/LhPsePPlkd08OMSVLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qB4IvGAT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6D2C4CEC2;
	Wed,  4 Sep 2024 05:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725429469;
	bh=1Uq+s42VoGWl7UxVx2ytzpaQeaggcvLNs5AnTqz4oYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qB4IvGATZyM4MYlUC2TsiGOS/gY25DDr/DiwLysYex8m2mD67lCvNm+Sf3fKWur0c
	 knXljQnxyvukXdy6v86Qy1wCP5osdrCqglIfHbnCc+rzFFSomhyUDQA0O9dyY4pznt
	 Nb+CVOiXuzeDd4MV/mfo/Yqo1KP6aDH1osR6yQSHNBFf3pXvwU87kpQ8nF5PYSaDtI
	 YY8hXg9AaSiKgdA2t1CYs6ndXR7iZzmfy8KGQGQODTRBmrQ/uII1/KTx9iBh/UpfWd
	 ToyM8/JQQrFGGLvZ7rC/g5Pz+A6L6LyUugDwae928wN7s5oStFmOgSqarzXE11lcPI
	 ERJvhdV4DK+6A==
Date: Wed, 4 Sep 2024 07:57:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 4/7] dt-bindings: media: camss: Add qcom,sdm670-camss
Message-ID: <h2i6qigozgzjxnlq5gmo3m7obdy5hmvfdnpsrcs325dc6hgezo@mrhok2ljnxni>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <20240904020448.52035-13-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240904020448.52035-13-mailingradian@gmail.com>

On Tue, Sep 03, 2024 at 10:04:53PM -0400, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

This wasn't tested.

Best regards,
Krzysztof


