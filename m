Return-Path: <linux-i2c+bounces-3880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812E8FDA91
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 01:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6F6D28298F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F84A167268;
	Wed,  5 Jun 2024 23:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QE4UQNOo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0C3C28;
	Wed,  5 Jun 2024 23:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717630461; cv=none; b=cn8DGLozSRAOvAIAzrW4ivkS6UGTUURaJbS7MXx4DEHCp+ELZUYO+/eycgSSw6EamZApxRmIQn4IrwrgRqWjbpgfw8vg8Bu8TBTlGAUgjh9U7Hvxxr6poEvHaewlEs00Y5WncrrnzkWQ7HsCtyRUFITaO8r5EG8N5SKtGF/lX4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717630461; c=relaxed/simple;
	bh=xkVa3LfdqWfoH8sO5vI2Dnfc1fKimG8vZrcCCqJiAEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ag+0u6KMa5Rj91wXxxxJCMQxym/LhrRlZ/kKl5XrEwuyaWE1v0CMQt5Ie9F3ayVOZmjy31KYvwvuXvhmRI0HP0iq9/pUu2it+45YKguTDE9pH7zsadBX9fsBw36JfU2v1uSYkNqkKMYjiXJgDu7nBtKMZjCvecLGS3MaMIHOLk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QE4UQNOo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB15C2BD11;
	Wed,  5 Jun 2024 23:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717630461;
	bh=xkVa3LfdqWfoH8sO5vI2Dnfc1fKimG8vZrcCCqJiAEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QE4UQNOoO7ossBm440VS33yJGVcFoZEr+rGQNRc7Z98m3t4j+VYfg7nb9TsTG0Vdn
	 Ng4ZrsWjyuTkoZJ3xaMj3znirP3iBxj6P4WiK9XxyTagH1//GgvPV3knVqO50EE/tN
	 4HhIo7jSV+3J8a4S6PzNtggNYdN3GXcrDdInt3z7NZNSoraBqtwzpOoYrJ64ryy6Dl
	 CD/uD+5K52pVjFKjtOtIEN1eiAE31QUD/SnbFi7o36Yx5OP3fSt80QG+MVlhF6xYj7
	 vWBtqajHjON1QKuZiNag3UarIMpjOaaCi1PMkh1LUD5eGSEABw4uAvu4+MFqmSA3vV
	 H3+qgSJihlabg==
Date: Wed, 5 Jun 2024 17:34:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: conor+dt@kernel.org, peteryin.openbmc@gmail.com, linux@roeck-us.net,
	bhelgaas@google.com, jdelvare@suse.com,
	javier.carrasco.cruz@gmail.com, linux-kernel@vger.kernel.org,
	patrick.rudolph@9elements.com, linux-doc@vger.kernel.org,
	corbet@lwn.net, luca.ceresoli@bootlin.com, chou.cosmo@gmail.com,
	lukas@wunner.de, linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Delphine_CC_Chiu@wiwynn.com,
	devicetree@vger.kernel.org, krzk+dt@kernel.org
Subject: Re: [v4,1/2] dt-bindings: hwmon: Add MPS mp2891
Message-ID: <171763045572.3437734.6052550487414487020.robh@kernel.org>
References: <20240603105306.180874-1-noahwang.wang@outlook.com>
 <KL1PR0401MB64917D1D51254FB1D6C0371CFAFF2@KL1PR0401MB6491.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <KL1PR0401MB64917D1D51254FB1D6C0371CFAFF2@KL1PR0401MB6491.apcprd04.prod.outlook.com>


On Mon, 03 Jun 2024 18:53:05 +0800, Noah Wang wrote:
> Add support for MPS mp2891 controller
> 
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
> ---
> v3 -> v4:
>     add mp2891 in alpha order
> 
> v2 -> v3:
>     move mp2891 dt-bindings to trivial devices
> 
> v1 -> v2:
>     add mp2891 dt-bindings
> 
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


