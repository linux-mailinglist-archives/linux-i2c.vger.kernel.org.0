Return-Path: <linux-i2c+bounces-5179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C4949C61
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 01:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 872AFB22FA7
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 23:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D1E176ADC;
	Tue,  6 Aug 2024 23:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drBiarFB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7917176ABF;
	Tue,  6 Aug 2024 23:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722987509; cv=none; b=PqVOeRXi3kk5RlIjRVbjzZMpI4rZLyjMY12YyOihKBHW0mfB+LMakg4Mbc/mzTxoNJBfZprhhF2sDcxpxRzFGRreKev/aj2BxgbVuPJNJGQdd0QW7VBOD7Glt4nBB9io1xMrL0npcbtb0D1QudH1MPIiBwvnAZA9XLdx3f8z24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722987509; c=relaxed/simple;
	bh=2udeCWwRySDMXUwFqaJkkz8hvQHfyXtdTtgxH9HlZls=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Ij/xI2V7XfXP7qeEVcSZ8RPbm0YwfGkOC2TgKoJNSRWKOa7Y8MkX2EtApv70HqtZswRytBVb6KumhZLwQmYRXeAT3EvDylOZgClt+f/o47wXQdlAvCJwiNlKR9fms1cFI8L7mYApPI1F4YFK21Kv5S5HsnZHAw2BPNNAqtTfrsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drBiarFB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F82EC32786;
	Tue,  6 Aug 2024 23:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722987508;
	bh=2udeCWwRySDMXUwFqaJkkz8hvQHfyXtdTtgxH9HlZls=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=drBiarFBKnbGIKlURb5O1WFGpRyLHqPx1XJe8+VyZafaJuOmUW3v3dHxaFElg6CV8
	 OXVBIUZfZrhEdxb4qBuHn/+z6bEhfrRJ0hZbbHFXNouGRPu5Bt0aEQM5rjTnmFMeWe
	 YUjXo5ku2reEcQAYEnLuXSIpxqNzTH3ROlpgGssZo8gT/bYAsuYoPqJbWWuAas2ZXq
	 B9Fg3zue+IsphJPyiRMDFqzNVTDT4LiHpfFCvhngEmBV3AtzPch1K3W0i3x6xLv94a
	 UOQDx/5wV6ZFs2/yEuc3UWeZjV+o3l0ZdEd717DOGfzQ2U+Og5VmyFrGJQ+BlYdGBf
	 +2+i2SJaQI7tA==
Date: Tue, 06 Aug 2024 17:38:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 linux-i2c@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Todor Tomov <todor.too@gmail.com>, 
 linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Loic Poulain <loic.poulain@linaro.org>, devicetree@vger.kernel.org
In-Reply-To: <20240806224219.71623-9-mailingradian@gmail.com>
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-9-mailingradian@gmail.com>
Message-Id: <172298750529.229501.1463215423957443688.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: media: camss: Add qcom,sdm670-camss


On Tue, 06 Aug 2024 18:42:23 -0400, Richard Acayan wrote:
> Add the camera subsystem for the Snapdragon 670.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/media/qcom,sdm670-camss.yaml     | 353 ++++++++++++++++++
>  1 file changed, 353 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dts:50.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240806224219.71623-9-mailingradian@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


