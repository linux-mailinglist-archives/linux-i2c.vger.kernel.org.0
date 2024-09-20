Return-Path: <linux-i2c+bounces-6915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B4797DAB9
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Sep 2024 01:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 380431F224CA
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 23:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F5C18DF73;
	Fri, 20 Sep 2024 23:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLiGQUXK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628DE1C693;
	Fri, 20 Sep 2024 23:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726873841; cv=none; b=Lj+lLgprfhHTx8uiogrw6YnnYy5dn8Tfk34UJshU67RZ+sa6shI1zY1av3mqVRi0Ca3pHeh6/hGQosdrxPu/N4/3Lo9zk1+Qh2hmzwGAfXvfikVUX45JtT/LBUMDr1XBPKW7oVQ5Pb3/pCesxKUPbthv6+7WMPsuPpt8CGk8I9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726873841; c=relaxed/simple;
	bh=dxdCDfIcHeRolZri5GdD4pfAYCc4d6GtMLMxCPUuxEE=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=sNh0OdFJHGnot5V1N1diyupUH6kswWp1j4MCiCIUjgl1ZQl+hoS186icraQpag3rsHdOq/oLx1Zc0z7vmymnD0wz9Xzw2UIsqjpgCSZAlAKxpDW6DEze5aw/0Flsddky46sS2rmkomj/y4TGCh6znF7hOa04YV+c4G7fagLGMe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLiGQUXK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3418C4CEC3;
	Fri, 20 Sep 2024 23:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726873840;
	bh=dxdCDfIcHeRolZri5GdD4pfAYCc4d6GtMLMxCPUuxEE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=fLiGQUXKyaP9BlXGOCgM7taDdqE+NBVdXGEz81dgGFw/g0dHYW0+Ad24TOW2H9s+g
	 RVmzQ46U3+6VOqwQiZrlCPr+biLpfcAmXO36poRXdvGsPnfbMQ0r9TQBxub8Sqq4Y5
	 eoZMShYX2O8SZjp5pbBGszv0oPxSrooSxOjQ//ITD7D8q8GkXJwR22OhBWp8GISIy3
	 ZDcPkyeHqWju+WTDQZUkH6dXZGcEJBxupC6mm2+HIYUpfddlA4p/AQQ823OLRcju+t
	 ZIZpm7Ton4QzPZykPGOKRnIF9+mOGIxcwU13RmzBSwjUnKAdUeGtL++gvNW6Rc1FXS
	 XUtWkevjCMKyQ==
Date: Fri, 20 Sep 2024 18:10:39 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: krzk+dt@kernel.org, tsbogend@alpha.franken.de, 
 devicetree@vger.kernel.org, andi.shyti@kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-i2c@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20240920000930.1828086-2-chris.packham@alliedtelesis.co.nz>
References: <20240920000930.1828086-1-chris.packham@alliedtelesis.co.nz>
 <20240920000930.1828086-2-chris.packham@alliedtelesis.co.nz>
Message-Id: <172687383994.9882.1653066305378740682.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: Add RTL9300 I2C controller


On Fri, 20 Sep 2024 12:09:28 +1200, Chris Packham wrote:
> Add dtschema for the I2C controller on the RTL9300 SoC. The I2C
> controllers on this SoC are part of the "switch" block which is
> represented here as a syscon node. The SCL pins are dependent on the I2C
> controller (GPIO8 for the first controller, GPIO 17 for the second). The
> SDA pins can be assigned to either one of the I2C controllers (but not
> both).
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v2:
>     - Use reg property for controller registers
>     - Remove global-control-offset (will be hard coded in driver)
>     - Integrated the multiplexing function. Child nodes now represent the
>       available SDA lines
> 
>  .../bindings/i2c/realtek,rtl9300-i2c.yaml     | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.example.dtb: /example-0/switch@1b000000: failed to match any schema with compatible: ['realtek,rtl9302c-switch', 'syscon', 'simple-mfd']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.example.dtb: i2c@36c: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/realtek,rtl9300-i2c.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240920000930.1828086-2-chris.packham@alliedtelesis.co.nz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


