Return-Path: <linux-i2c+bounces-6845-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF997B675
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 02:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4118287334
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 00:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2B1D299;
	Wed, 18 Sep 2024 00:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tw5+/mqm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296FB641;
	Wed, 18 Sep 2024 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726619576; cv=none; b=R+NkbSETsRjhuvOLcoGrwvBybj75U5vpO9hc7W3wMIvTF+MtBn1t+MFJoPv3ZjBzFdIBG5vxSKogJ1D3d5FGKA1fvRHVj62CB6/gzMnXVQJL0x2GC4UVXG3RfwwJBX2BSdU+loypLJFrgoJjKDHAKQUEs7edJFaeJE9psI+4CCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726619576; c=relaxed/simple;
	bh=GKFSFRscBZROAt5wvUmtDG2ifhoCSZnrla+6G5AIl0Q=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=T4vGM3bJuu/KAwpunKK3eDiDoaIi1KOfKqmmHPZfBA5l5nIWQrCVFYeygcfKE7qblJB5xBSDO2sSG9JN7xACvXfoit3jbNIzGDVYdStIYg0QKNd9YTfAI4ys7QDRSjCJ5HH56egbBE5Px6R6D9+E8UZU3EErBb4epzCH2AY5Oh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tw5+/mqm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FADC4CEC7;
	Wed, 18 Sep 2024 00:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726619576;
	bh=GKFSFRscBZROAt5wvUmtDG2ifhoCSZnrla+6G5AIl0Q=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=tw5+/mqmtg0TqEOA38Ysx76IR2zmynADeaH2ZhJvMg5CWTLeNxZyXMIoXO/ixeDBW
	 a0gay/nNnVDYuvoJzPvTYQjYSFy1HaoYfbRTKxWZRzHLt+ohWToSwPlm2xU4hiXCL5
	 lgfvfsRQA0BQnO9pkQm34k4DXNY7YUjL6lwcFBTZwOFKMi81yRI7CVj6ROER//Z3+a
	 4jSnqlCXV7FuBDuKj1aOkldNU9lU6MVq3MKX8h6JSfJtz7lKP1gVg+rdll5D3v5p6y
	 KRWvcQohzTWLTKvNroBeFaW1/txhrU6uWcX/Q1AAujbGKazdP3SzijAC+QRzCglFRL
	 xfYxOh/4NtoQg==
Date: Tue, 17 Sep 2024 19:32:54 -0500
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
Cc: krzk+dt@kernel.org, linux-i2c@vger.kernel.org, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de, 
 andi.shyti@kernel.org, conor+dt@kernel.org
In-Reply-To: <20240917232932.3641992-5-chris.packham@alliedtelesis.co.nz>
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
 <20240917232932.3641992-5-chris.packham@alliedtelesis.co.nz>
Message-Id: <172661957327.22757.9240077475502765313.robh@kernel.org>
Subject: Re: [PATCH 4/5] dt-bindings: i2c: Add RTL9300 I2C multiplexer


On Wed, 18 Sep 2024 11:29:31 +1200, Chris Packham wrote:
> An extension of the RTL9300 SoC is to support multiplexing by selecting
> the SDA pins that are being used dynamically. Add a binding that allows
> us to describe hardware that makes use of this.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  .../bindings/i2c/realtek,rtl9300-i2c-mux.yaml | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mux.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mux.example.dts:22.25-28.13: Warning (unit_address_vs_reg): /example-0/switch@1b000000/i2c@36c: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c-mux.example.dtb: /example-0/switch@1b000000: failed to match any schema with compatible: ['realtek,rtl9302c-switch', 'syscon', 'simple-mfd']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240917232932.3641992-5-chris.packham@alliedtelesis.co.nz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


