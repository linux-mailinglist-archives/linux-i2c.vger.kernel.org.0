Return-Path: <linux-i2c+bounces-8904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B17DDA00FB4
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 22:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 057FE3A4A27
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 21:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564FE1C5F1D;
	Fri,  3 Jan 2025 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjXTeR3B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06C21FF7DD;
	Fri,  3 Jan 2025 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735938916; cv=none; b=ch9uiiHjz7EHwLNhKmDSUk4kCMaXuDeA5A9CJ9emax9k2rp9t7eC/GgCFaputEGnXVmtt3NBbZHKHBO5PIZCkz6lqtS+cBjg0yIM+FE6riweJeF87+PXzi6J44OchmEJxgBCaKJS7onIdF9UmqpvIfgj3kSNfugxarzvUgbWYdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735938916; c=relaxed/simple;
	bh=7vm9MHYHGYH82BQKmuGx2CxjkfUZ+ODXMDVuxbYlzYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAV39+QOvLnR3WE2yfoT2mSRGkvoXy8hZb8A+L2bM8CpNNbY8k4H+fd/KfT99azpQn6bDlZgHwyM68bLn3z3sHn3jN7dGnuIKYnHzaTYZldmCDUHhH6mukXTsSpK/IoQ9sgNnZ4bIVRdfx3NJgjom+HJlb8QQSOvvfq8UeERYS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjXTeR3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8F1C4CECE;
	Fri,  3 Jan 2025 21:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735938916;
	bh=7vm9MHYHGYH82BQKmuGx2CxjkfUZ+ODXMDVuxbYlzYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RjXTeR3BgMdvT5fbnE/MWgTb0znii8c79ZcLAjxcQax6x+xhoUYYVG0NDtNUkF923
	 s/Ummnxq868YpkJElpea8GFiEF3OKYG/7nD87bxqogC75ikEL0TQdwJuWvv8X+viI6
	 RiHC5yUaANWWZxwHOE+qMh37qoJlxdVytYukzCcXjONVIaWzMZwRQye3jevSDN9R/+
	 EsmWEGCnt1yZYj7wOzaPuk1xu2gUZ6FLYcvZPP3qrbATn+QxEn4lAANOKL/U/h/RTG
	 sGqXZo4AB4T9j92rDHcGtbdTBHMW6Asx09FsaYRh3+a/kyATKZupFus6EC1tqOTb9Q
	 4/wfbNfWFAVXA==
Date: Fri, 3 Jan 2025 15:15:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: eeprom: at24: Add compatible for Puya
 P24C256C
Message-ID: <173593891365.2842180.9280370418622410267.robh@kernel.org>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
 <20250103-fp5-cam-eeprom-v1-3-88dee1b36f8e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-fp5-cam-eeprom-v1-3-88dee1b36f8e@fairphone.com>


On Fri, 03 Jan 2025 12:11:59 +0100, Luca Weiss wrote:
> Add the compatible for an 256Kb EEPROM from Puya.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


