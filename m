Return-Path: <linux-i2c+bounces-695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D494080AD82
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 21:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11CBD1C20B30
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 20:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47A856B6C;
	Fri,  8 Dec 2023 20:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjZYQtml"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F351DA52;
	Fri,  8 Dec 2023 20:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76438C433C7;
	Fri,  8 Dec 2023 20:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702065978;
	bh=AJRugcmqGU7FRRyaxRvctwC7Ym1TtKH9ucxVu6xYxSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TjZYQtmlieiMq0bzqSV7VeRFOrVA7N6YxttU/rDbwYla8jPLi37LdgIm9XpwLI87h
	 yOqYUZrCR0EVO6ymqIfofzxnIu+Kzd4TzSIe/DY7T3YqYDuM49JcogqT0dQtArtXBo
	 hQ8JJ4dYEGRx3kfwWOqYTykjFj6qk3+UjfHv5SRT567YvC0SQwMDOv5YAlcMcWuSdv
	 VeMQzoi0UWG+aGEq7s175kl/LixERP49B6zPPg5MfDFSUKm+E9mGebd0q/W6KHIiQy
	 Q58Mye3TU9mS00rJg1ygRDbvFYziatTUewDo6IAIdyAQx0y9qO6Sz7rAPdbDiljMpa
	 bVjjH/wQvC+4g==
Date: Fri, 8 Dec 2023 21:06:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] i2c: stm32f7: simplify status messages in case of
 errors
Message-ID: <20231208200610.hrpup7ghhjtehcsc@zenone.zhora.eu>
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
 <20231208164719.3584028-3-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208164719.3584028-3-alain.volmat@foss.st.com>

Hi Alain,

On Fri, Dec 08, 2023 at 05:47:11PM +0100, Alain Volmat wrote:
> Avoid usage of __func__ when reporting an error message
> since dev_err/dev_dbg are already providing enough details
> to identify the source of the message.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

