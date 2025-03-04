Return-Path: <linux-i2c+bounces-9705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFE4A4D5C8
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 09:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0510216E771
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 08:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4121F9A89;
	Tue,  4 Mar 2025 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lob7vi19"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FBA335BA;
	Tue,  4 Mar 2025 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075692; cv=none; b=iWDuiaDUDbN8ggCcGBxu9BJz3hqYgilj2i/y+kTTSJTwRSf72AEm+A4kQclLI26OV8xcqpQiuzI9TJXxIpsQQaGFtNwhpSoNiFh3zVJN8hkGodx6TcTuBwxZbEfziU7fRPunzOtc+VorH8/RfThej45GM+6ceeptaNm+GFD0KNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075692; c=relaxed/simple;
	bh=NOzINh5aX2jOBOsPAaQKshxr35+wXfE9sFP11D1XYHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIHv/X6C8PdiFxdU1eO+PKGwDqfeNXOGT6GgpXNN0ULrfU0qk1eLPZKgK5qiUHHIzt9q+5CMzhCkkBWLB7PaiM5oF+DupIvISGm/YnWdPWUa7ylMq+FeLJKutQ+0yVC65PhuUDVGoq7/DHG1FvcN2HlDz+WUcxkXB0qmN406j6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lob7vi19; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD29C4CEE5;
	Tue,  4 Mar 2025 08:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741075692;
	bh=NOzINh5aX2jOBOsPAaQKshxr35+wXfE9sFP11D1XYHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lob7vi199B5vC1tpokI+OyTfSLRvJrvQBduJJDBaMgtIQrEqfiqv4yhN+gVBpVR1y
	 JDv0kIjlOtJTo8oXn+TKS3A0SOpAgBLwrw5fmLcOe3eiIx9HA3DbpxdZcLtSg70KKO
	 HZF9BLyxbUvjwFDFapw1O/ZI1a9svkQmLtyr1BdeL9deJgSJYoXWgZ8/urpEg73672
	 EjXm9GBhUl7MLAYkJ1R41Mm9zHPYL7BMoRAp6QthpVSbA21lKjwvG9/oDcof24+pa9
	 lljNFef3ntVO4lvSd3+TkXCkMd652jj5m6Y4280NEtv1aM0XcT30Q6d4YV8y3nyIEZ
	 UVRGjgkxlDN1g==
Date: Tue, 4 Mar 2025 09:08:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3 1/9] dt-bindings: qcom: geni-se: Add 'firmware-name'
 property for firmware loading
Message-ID: <20250304-masked-pristine-mole-c05dc1@krzk-bin>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-2-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303124349.3474185-2-quic_vdadhani@quicinc.com>

On Mon, Mar 03, 2025 at 06:13:41PM +0530, Viken Dadhaniya wrote:
> Document the 'firmware-name' property in the device tree bindings to
> support loading SE (Serial Engine) firmware from the protocol driver,
> allowing for more flexible firmware management.
> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> v2 -> v3:
> 
> - Remove ref and add maxItem element.
> 
> v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-2-quic_vdadhani@quicinc.com/
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


