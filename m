Return-Path: <linux-i2c+bounces-3182-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CCE8B2DB2
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 01:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719F128447E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254D315DBA5;
	Thu, 25 Apr 2024 23:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teblGcka"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908215B978;
	Thu, 25 Apr 2024 23:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714088401; cv=none; b=EziVe0QIgD8++pRllBLAmcS/nfVLfOI9FrFPzw+diS8CHGp1JYgjkF9p+xEdg6IW++Ly53BLR+itfBjE7fk1wgIn2uDD14unfeEcF+vJQJyIlzYbynvn/7rzPD27+2uYXlogD50xIBEYb/fTDqgQ6VWQMwBYfNqwePOyW5Q7lG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714088401; c=relaxed/simple;
	bh=evdB63NMsMmGAiCN8AeT5XYZiSR91S9n0SCVkkG/xt0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=n/4hHD6ajXyqLIYAdqUI165CzEm8mKZdFC21cmkI2BvQKuDx1kzwPuun8TKt6iIjWeGqoU881ONltFgLcfq0H4NjfUMWKK+hMF6ChPM+/vrJ/WInQGGsJ6KEA+68wcZgdbaiwCpWqqGFFs6s4SbEGetGilxYQbJGJwN/Fn7vh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teblGcka; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F17C32781;
	Thu, 25 Apr 2024 23:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714088401;
	bh=evdB63NMsMmGAiCN8AeT5XYZiSR91S9n0SCVkkG/xt0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=teblGckagfhS08PQPJ3BrF/9Xn5U38ispWYhbhqJbagfZ99kM/adIoZIA2Kqj098I
	 UBCSPmJtnGsjyX3XpboAtkP8phh40nHnJHcqLoS08tLoB7xPgcEhcpw/RU2wpGch0O
	 JY9avPFhRXgc/0wGSIUyhWrBuwjUJECwPoVUniTFihTu2g645MYpC2G0fJhrb4cKBG
	 8DyRNrsyRuL8Us0RLT+PyT+JSGG4JnjgGNYGEepNDdOJC5bXlAs5mGWY97UsIoap8K
	 LxPC6jdTAWdvzs+Sn5ft24sXz8m7V4X6DYm2pxsG7osNpfW0pcecW5IcA/oAoUtJcS
	 +pCqKkLWMzTDg==
Date: Thu, 25 Apr 2024 18:40:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
 lakshmiy@us.ibm.com, linux-fsi@lists.ozlabs.org, 
 andrew@codeconstruct.com.au, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, joel@jms.id.au, krzk+dt@kernel.org, 
 linux-spi@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20240425213701.655540-7-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-7-eajames@linux.ibm.com>
Message-Id: <171408839666.3902693.1860621022882259895.robh@kernel.org>
Subject: Re: [PATCH v3 06/14] dt-bindings: fsi: Document the FSI controller
 common properties


On Thu, 25 Apr 2024 16:36:53 -0500, Eddie James wrote:
> Since there are multiple FSI controllers documented, the common
> properties should be documented separately and then referenced
> from the specific controller documentation.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../bindings/fsi/fsi-controller.yaml          | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/fsi-controller.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/fsi/fsi-controller.example.dtb: /example-0/fsi@3400: failed to match any schema with compatible: ['fsi-controller']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240425213701.655540-7-eajames@linux.ibm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


