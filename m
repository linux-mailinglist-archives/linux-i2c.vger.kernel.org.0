Return-Path: <linux-i2c+bounces-5361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 291A1951100
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 02:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA12A1F237A8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 00:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F45C1FA3;
	Wed, 14 Aug 2024 00:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQgLDIDK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47D41859;
	Wed, 14 Aug 2024 00:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723595178; cv=none; b=PEUZLo9TYpn+WJ7x8PnYMwIPDvmxCT1ru0lhA42wpWCDhmQFoVxRAeQCptMY/Srm8yk+UPZmeEBEkCS/qp5vIdw1zW6A8+fLuos9iD85qzpxyaGrNh3hWGbrDcOW27UrGbLKr3XlDRSExzUpMPjXB8X5RK5ROKcB/d+f0nPCrY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723595178; c=relaxed/simple;
	bh=Fc/yY7CDbNdH/cz6/im6kwrc99NmQho63eE53m7feXM=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=bsAbYwRQwOuP/H1BieQP9qIQwuVQep5sYIAbfQOPlRFNgOzRDqGlfszeU6WQDGLUxhlxiNwcjbYboYZhLz/3X1TUp0UUsoO/edfeA7Bb4BNZDVARj94F8YfQZyNPKR7oDf1fgacQswZ4DjA4B0ELTAl3U5BWCcFvTiGrKdgGR58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQgLDIDK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABA0C32782;
	Wed, 14 Aug 2024 00:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723595177;
	bh=Fc/yY7CDbNdH/cz6/im6kwrc99NmQho63eE53m7feXM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=WQgLDIDKTH8nM6R9k4Bhk13G/aSMxRHqq4ByEnTns+9q0H7BcbbJEBSBTjbKKKfxW
	 OslBR6u5Rmi85Woed4BAMBGyC0MwcytS/zd/RGj0FI1Im7LuwJnSKI0IkcEp2+AOy9
	 drT3tDGchslC30z+6Q7AjGgbqpjJVcxIvM6cxiblk1bDGdFr/aLtfq9qb8W9Tv6F8a
	 gOFqME09cvh0kkx/gu/odDOniR092J5eJd6HIkSWJZ8T9Vc30UGOEN6VMEHO2A9QJn
	 UEMRoZGyai14llSAqszJM0OxLIytwuwRIsVLCrr1JxGk7zSZrPPm25WFM3rbUt5Ubl
	 wb/olrsJwSjtQ==
Date: Tue, 13 Aug 2024 18:26:15 -0600
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
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 linux-media@vger.kernel.org, Robert Foss <rfoss@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <20240813230037.84004-10-mailingradian@gmail.com>
References: <20240813230037.84004-8-mailingradian@gmail.com>
 <20240813230037.84004-10-mailingradian@gmail.com>
Message-Id: <172359517555.312475.7249351586799912303.robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: media: camss: Add
 qcom,sdm670-camss


On Tue, 13 Aug 2024 19:00:41 -0400, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/media/qcom,sdm670-camss.yaml     | 324 ++++++++++++++++++
>  1 file changed, 324 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dts:32.19-150.15: Warning (unit_address_vs_reg): /example-0/soc/camss: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dts:142.46-147.27: Warning (unit_address_vs_reg): /example-0/soc/camss/ports/port@0/endpoint: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dts:142.46-147.27: Warning (graph_endpoint): /example-0/soc/camss/ports/port@0/endpoint: graph node unit address error, expected "0"
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss: reg-names:0: 'csid0' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss: reg-names:1: 'csid1' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss: reg-names:2: 'csid2' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss: reg-names:4: 'csiphy0' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss: reg-names:6: 'csiphy1' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss: reg-names:8: 'csiphy2' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss: 'interconnects' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sdm670-camss.example.dtb: camss: 'interconnect-names' is a required property
	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240813230037.84004-10-mailingradian@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


