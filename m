Return-Path: <linux-i2c+bounces-6103-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF8A96AF83
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 05:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAD971F21AE7
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 03:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4E2548F7;
	Wed,  4 Sep 2024 03:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oxw4RyNm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5788E50A80;
	Wed,  4 Sep 2024 03:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725420938; cv=none; b=WDs47FHVDz8pBaD0a5NSDm7iDH7ax+GzG7x911PNdgWRTASZpNW5Q6t25oBUyuD2jM/EX8/01yfDZ2tWvGwVLwMG2SzCphNVvRKA+LXhfBpKwp0r2xG+igKf3h0MLQ/CpaHR0NLlsPbVwR8DKVqqWrNf0SgraI+SlhZ/NkGn9KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725420938; c=relaxed/simple;
	bh=qLcWIE7Fw1J7ruZJ/d/CJptuuKw68JLFc6/6jjyj7xQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ID1f+ktYUY2vnlaj3PvNIFOHSy94m7e+9YrSf9Wx4kVMOzet6AHZ9CPALo7D0WdpJZ5KPRWWLUUsbpZPfujmyrO2cG2ss0RYR1he4Fb6WuBwR/GcLQ9WEmPDeOp+gkg52i8wSv2pnRj3E9kITi7d6nuPd2firoktPYv1o+WmoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oxw4RyNm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770FAC4CEC3;
	Wed,  4 Sep 2024 03:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725420937;
	bh=qLcWIE7Fw1J7ruZJ/d/CJptuuKw68JLFc6/6jjyj7xQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Oxw4RyNmEhnFMTsEBmUk0IvVzvP1WaYglu45+1v+68smrL2bIhUwreMa1TBjVgh1H
	 z3rSKx1LKrFBnF31SQZc+5EnI5h8K/m4PXJxOpcear3L4ShDFgUQFMDw/EWJZolQv4
	 hZN/J5TqcewpO7nl523xHkmw2WZKy9/qQI7rim+vnls8f1YkS4VeKRj8Bnresr5fIE
	 8QvyDH2fKUi5ZHEWSUjc/uunTTIkf/cBS18LaJHIf+56FBO7eUhmZnx0uZJ/drTy6j
	 yYDSf0GxHrh80m0Rqs9ogCQXYRca9IceoxLKqi7GEWkn8UfK/+VHEY34WUqUx+jSCq
	 NqOpx9urZkIPg==
Date: Tue, 03 Sep 2024 22:35:36 -0500
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
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Todor Tomov <todor.too@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 linux-clk@vger.kernel.org
In-Reply-To: <20240904020448.52035-13-mailingradian@gmail.com>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <20240904020448.52035-13-mailingradian@gmail.com>
Message-Id: <172542093648.3614760.12247493613483168165.robh@kernel.org>
Subject: Re: [PATCH v4 4/7] dt-bindings: media: camss: Add
 qcom,sdm670-camss


On Tue, 03 Sep 2024 22:04:53 -0400, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
>  1 file changed, 318 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:0: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:1: 'gcc_camera_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:2: 'soc_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:3: 'camnoc_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:4: 'cpas_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:5: 'csi0' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:6: 'csi1' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:7: 'csi2' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:8: 'csiphy0' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:9: 'csiphy0_timer' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:10: 'csiphy1' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:11: 'csiphy1_timer' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:12: 'csiphy2' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss@ac65000: clock-names:13: 'csiphy2_timer' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240904020448.52035-13-mailingradian@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


