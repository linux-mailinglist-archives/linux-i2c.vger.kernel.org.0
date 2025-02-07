Return-Path: <linux-i2c+bounces-9332-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF73A2B9A7
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 04:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C1C8188996E
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2025 03:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C2E17B418;
	Fri,  7 Feb 2025 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiX1GJv8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03474EB51;
	Fri,  7 Feb 2025 03:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738898626; cv=none; b=iMdMVu37gM6S8FxjUDR1w3qVtaEAQK1wsAIHKHfeo5PpJ/xUq2/zs85OPVN9nbEtDBhLXkgYA3txv1XZgIm/UTLZFSRIdV28Ts1ERY1goTc73dzGoP10DFOnVOurbvO/jfB/eROsln4FJNHDksqcuWy8RNAHxdhaimjZHK5VDbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738898626; c=relaxed/simple;
	bh=64YfaS3aPv4/Bh7/b4NdRIjGEVYxZXnw1wrwhLkjxpk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=P6URo5AoF2ua09EoS4S+1bCl5jrjmunfqaO2rofyBEH1W0+sMbjQOacazCvO/Z1qsYElSQUYcGQglnc43FTwDBUGD3ktc3vqoIq8q84GMwIU1yHEF5gvucysa1BDNewlQQTfb0HFJlXLm4cwgxJCO105JrXX6VzI+1nDyVy9GQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiX1GJv8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25258C4CED1;
	Fri,  7 Feb 2025 03:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738898625;
	bh=64YfaS3aPv4/Bh7/b4NdRIjGEVYxZXnw1wrwhLkjxpk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DiX1GJv8WQau7ukUaAo9+DHMkQE0/5g2wiYpDxKpdoFqgPZ+3gP5sOi0rMdNsLYaR
	 ZxhUZOv46Mu+vg54W4Qm3ZqFEjkOgO/2VmJeerzCKyhFLnw8wY23tTKbT+s/QsIbJG
	 a3gegkHzISNH2EqDBbP2XKFCK/b7vgXRFnU+nlK26V5wk/M7nPGk2stgDLOExYNPTv
	 vR3BGyZ2MgaKkUamb+ts9MPEVAf0MDhOR+w87e8rc2JmVhp6pht4Zd44chR62Oll03
	 XvrvBqclUmkwlD/4QFbNVOML0xgGPkwIfjBkiUXJc9c7GQJrBL3GpH43bG5KP5E+L1
	 QROc1XEJlWBWg==
Date: Thu, 06 Feb 2025 21:23:44 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andi.shyti@kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
 linux-i2c@vger.kernel.org, krzk+dt@kernel.org
To: Ben Zong-You Xie <ben717@andestech.com>
In-Reply-To: <20250207021923.2912373-2-ben717@andestech.com>
References: <20250207021923.2912373-1-ben717@andestech.com>
 <20250207021923.2912373-2-ben717@andestech.com>
Message-Id: <173889862402.2987410.13412749871607541822.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: add atciic100


On Fri, 07 Feb 2025 10:19:22 +0800, Ben Zong-You Xie wrote:
> Document devicetree bindings for Andes I2C controller.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/i2c/andestech,i2c-atciic100.yaml | 40 +++++++++++++++++++
>  MAINTAINERS                                   |  5 +++
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/pwm/andestech,atciic100.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/andestech,i2c-atciic100.yaml

doc reference errors (make refcheckdocs):
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
MAINTAINERS: Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250207021923.2912373-2-ben717@andestech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


