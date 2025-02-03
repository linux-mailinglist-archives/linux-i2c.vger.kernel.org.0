Return-Path: <linux-i2c+bounces-9269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B61A25996
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 13:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A1917A2EE3
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 12:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724462046B7;
	Mon,  3 Feb 2025 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="NiCsXrG7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1304F20468D;
	Mon,  3 Feb 2025 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586423; cv=none; b=hEiBGCzunqjS3tpalGUO8RnIeje4+A3PJH1ZHtQqDb7XIlx/DNLeqRIQ6BB2RiuKzg9qyOACvPSBo3hZ2JB7K9/hgy9qa9zKrE+bde0u6jz0AMrBtqgUiId+W5Fgcwq6Dt671RjIhosbE74Pu3ANu9lxA1Wmh5AjBsm+Ntfnw7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586423; c=relaxed/simple;
	bh=AkDFsgM8ht/4xOTKn+YGxCP4v6cjlpjp8uRWn5voH7o=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=p+Jl7/QB4J7x5+L3u6xAPXXe+wUQE7B0L3Dr7akbvtjo6Uk2M83BtoP9Q6TZBP+UXOW4OH0VCoGlp/pRTGdEnQ2JbgsCHNZOBXGsyhk+JRLzSvzvL36zHlP2gOBY2TKYiYdO6mE71dyCMnCptjF0oLoaS/N/3gAlMN48t0Ma55g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=NiCsXrG7; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E576025CAA;
	Mon,  3 Feb 2025 13:40:17 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOJee6X8J05I; Mon,  3 Feb 2025 13:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738586417; bh=AkDFsgM8ht/4xOTKn+YGxCP4v6cjlpjp8uRWn5voH7o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NiCsXrG7LpnG5w/NFwLl1Xf4k91ChodYcxZdyx5YPPOd49ovtD7MWdYY8MSqveHJL
	 AjJK0tAADkF89VLXYecmauRE5Gbv5iijR/wWAk4bwUHJvvvhXCYprAkat0d0TGYHIf
	 ykOg1aVULxEsuMRLAo+lnp61mnypYcYTcGh8agQvcbDbQ93GggzGqmU2WdUo/fnERe
	 cf0a6u52bgH+nL3XJ9zgtBTU2ZwrsvKehCSZyQANT07sLZRkG2mrLpJPC599dAG4RR
	 gPgmAg3QdVtp9K9GV7ZrzkCmvJgfX0tErHPHs9P/aQnPsTEdcVAPpr+zHZOgyA1afb
	 2mgxyQClmL60Q==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 12:40:16 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Tomasz
 Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung
 <jh80.chung@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Thinh
 Nguyen <Thinh.Nguyen@synopsys.com>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, Sergey
 Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 02/33] dt-bindings: clock: add clock definitions for
 exynos7870 CMU
In-Reply-To: <20250203-enigmatic-remarkable-beagle-709955@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250202190758.14986-1-kauschluss@disroot.org>
 <20250203-enigmatic-remarkable-beagle-709955@krzk-bin>
Message-ID: <c1249f2f6ac8a2f5a1dcb3bbbba647f9@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-03 07:54, Krzysztof Kozlowski wrote:
> On Mon, Feb 03, 2025 at 12:37:58AM +0530, Kaustabh Chakraborty wrote:
>> From: Sergey Lisov <sleirsgoevy@gmail.com>
>> 
>> Add unique identifiers for exynos7870 clocks for every bank. It adds all
>> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
>> CMU_PERI.
>> 
>> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  include/dt-bindings/clock/exynos7870.h | 324 +++++++++++++++++++++++++
>>  1 file changed, 324 insertions(+)
> 
> Look at git log - that's never a separate commit.

Hmm, I see past examples which are mixed.

2ae5c2c3f8d586b709cf67efe94488be397d7544
Exynos850 CMU (c. 2021). CMU definitions are in a separate commit.

591020a516720e9eba1c4b1748cb73b6748e445f
Exynos7885 CMU (c. 2021). CMU definitions are in a separate commit.

while

96bd6224f07b8bf73e0359f15a3d7678118494e6
Exynos5433 CMU (c. 2015). CMU definitions and driver are in a single commit.

Let me know if I should still continue with the approach you mentioned.

> 
> Best regards,
> Krzysztof

