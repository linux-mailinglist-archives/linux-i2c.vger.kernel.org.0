Return-Path: <linux-i2c+bounces-8902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEBFA00F8D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 22:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C8103A073D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 21:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7951FF1D9;
	Fri,  3 Jan 2025 21:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDgaG0IT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE851FBEAF;
	Fri,  3 Jan 2025 21:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735938876; cv=none; b=Qy+JyE37cvpvHCyfgbuWxtBtsfr5aGnRkVa95vv4RnI1RtycwOknKqx4lqcxksKyeKtkSKM0xrd/M3yzO/D6RbtFwvbVBtl48WT0aGZ+fJSdFoX+6LiRIlNNkgtK12S/mLpPxjBWS8YLOfgn3YOnlwf22itgxsCmGIIIxMdhkHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735938876; c=relaxed/simple;
	bh=0gLhqx1d9fdfTgsC7aeWk5bdoVaIlnLzwRyP1W8D54g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlkR7/qljCDJuhC5ogVbVNr6mh4qYfUZ4XRXLl6lDxDUj8OYfPD3tnWlTPTOZB+C9RDack9Ga0Jnl3bp9lNw+3k205Mu7ymTHd0jTAR3rfzTjbgpFrkSURhgb/cMF8HA+xG+RY6zZns5hlbKL8M5DuNUlU3/uCWaWz2LDCIF8DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDgaG0IT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86594C4CED2;
	Fri,  3 Jan 2025 21:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735938875;
	bh=0gLhqx1d9fdfTgsC7aeWk5bdoVaIlnLzwRyP1W8D54g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDgaG0ITjrj2UN0tooNQOkPPRRkdQUeM8Agv8ov3zOlJCZwYtUcGZKOVJNviK6GXc
	 V6I5ec/+L5g5TjjiLhLB4qm4YDk10SwRlSbh33fpP61wfpGe4M36qYXis6XjT/13FQ
	 DUjR8e1q29b+JtV9CYD8efrGktM+xSRlVD5uxuA0F1EYNNtJPMe5IkAVQ5aZ51sMHx
	 uuWffxOD0h4w2RR/5v4NQahbK6G3oezblF1X2aUgmpk0UT7JVIv50kksE36Zo9x1GA
	 3eQbeB9/ZHJXTrXKjTJeWVxEr7DbNBefzohHaELXNpFVzfZ+PpbamMJAOQ8VoCVkqO
	 QWpuhnDqBnurA==
Date: Fri, 3 Jan 2025 15:14:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: eeprom: at24: Add compatible for
 Giantec GT24P128F
Message-ID: <173593887315.2841254.5882040583357799000.robh@kernel.org>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
 <20250103-fp5-cam-eeprom-v1-1-88dee1b36f8e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-fp5-cam-eeprom-v1-1-88dee1b36f8e@fairphone.com>


On Fri, 03 Jan 2025 12:11:57 +0100, Luca Weiss wrote:
> Add the compatible for another 128Kb EEPROM from Giantec.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


