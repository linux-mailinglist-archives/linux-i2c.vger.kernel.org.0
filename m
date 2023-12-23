Return-Path: <linux-i2c+bounces-982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C66081D650
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 20:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1BDFB2110B
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 19:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A159168DC;
	Sat, 23 Dec 2023 19:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vOta033Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88AF168A8;
	Sat, 23 Dec 2023 19:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KfJrL2qPFqx7rEKFcYLrB7nBzJHMx07EE5HcWV0xdzI=; b=vOta033QCXD3kE/UH3inQIzlHl
	rqawXxg/3tKLy4P2WRqGNJd5FXRmtzewsQPXmrz40u1DQK0oSX3lKtuq1PTkEA5Ya9eEMeZblsCRf
	KeIouI6gaogeZYmKcsi5TFvldbH3tcsErCxU3C54YUFnIn9OcdZmRSSVKBSkgaP4BhLieS/0zqA4Q
	p3K993lWlhHGzq9cvep0qPSQhLcq9eUp0c3MyQXwxJJfNfQ+CMidkD0qLtrV0/Hc71r0PYuAIPxvH
	tmSqhz3ZPPBvTV59su6h6s9Bbl7AtrceChAXia6UeNVe7IYStfHWEovwK5BvbnvoWpTW/AjfHGfYq
	oE4MOsYg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rH7gS-008O6w-2i;
	Sat, 23 Dec 2023 19:29:16 +0000
Message-ID: <52b21735-b25e-4ab4-ae1f-31d459459015@infradead.org>
Date: Sat, 23 Dec 2023 11:29:16 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/i2c: fix spelling error in
 i2c-address-translators i2c-address-translators
Content-Language: en-US
To: attreyee-muk <tintinm2017@gmail.com>, wsa@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231223190852.27108-1-tintinm2017@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231223190852.27108-1-tintinm2017@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/23/23 11:08, attreyee-muk wrote:
> Correct to "stretched" from "streched" in "keeps clock streched on bus A
> waiting for reply"
> 
> Signed-off-by: Attreyee Mukherjee <tintinm2017@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/i2c/i2c-address-translators.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/i2c/i2c-address-translators.rst b/Documentation/i2c/i2c-address-translators.rst
> index b22ce9f41ecf..6845c114e472 100644
> --- a/Documentation/i2c/i2c-address-translators.rst
> +++ b/Documentation/i2c/i2c-address-translators.rst
> @@ -71,7 +71,7 @@ Transaction:
>   - Physical I2C transaction on bus A, slave address 0x20
>   - ATR chip detects transaction on address 0x20, finds it in table,
>     propagates transaction on bus B with address translated to 0x10,
> -   keeps clock streched on bus A waiting for reply
> +   keeps clock stretched on bus A waiting for reply
>   - Slave X chip (on bus B) detects transaction at its own physical
>     address 0x10 and replies normally
>   - ATR chip stops clock stretching and forwards reply on bus A,

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

