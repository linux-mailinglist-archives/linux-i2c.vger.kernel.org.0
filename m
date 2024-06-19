Return-Path: <linux-i2c+bounces-4102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A090E39D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 08:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC72828177A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 06:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89496F2EF;
	Wed, 19 Jun 2024 06:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkpyGp97"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122984C98;
	Wed, 19 Jun 2024 06:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718779215; cv=none; b=Lpi3aEBHu9nXDA5tcmGjgLkzk0xOh3YEjMKdqLN2FPn+ypEc9nLa5MHlUozYvEEaeFib5TTIRH8Su9FsBn0UoU9NgI5Y8w5MYrF2rM+6I4PmLjVFVqUsCSg+GdQKqhCxxOJTq7GdH7CJfkGKxBkf85s2g660iDSfpydO6xtYK/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718779215; c=relaxed/simple;
	bh=BWCauMt68vFjBRrLNx3G2KlJT+7wCHlFSe+2GGiOfq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpdOmvg7d419dhO21WZb2C55qpMBjIthTMRuy7eY4GVNO2TTXj2dJp9sp6D5IQ7qDIwQJMoWHWwA0WiLJ40k6QIot8rW+eQ+3zOJBVAZjI3jKx2vtkOxZi+QX9nTUC36gMkcbNhCHXmea6jrc+zXi4w8XUzlW/m6IoPd36ITZoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkpyGp97; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718779214; x=1750315214;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BWCauMt68vFjBRrLNx3G2KlJT+7wCHlFSe+2GGiOfq8=;
  b=WkpyGp97rfKd3E61mx+S1I44VdWjv0+vu5edxhU7k/zh/DOSuNgIY1Fd
   uaukhot9qsZuhh8vh48iaTZwNf7FyY9EECf/LBKOBdBN3sL3UkNFTCc1g
   xZKtsujHcBPwb12jX0L6637PSRfO9CNFnaHQB8+1MzSlXLGkuQbSUlZdU
   +TK9SyrUimSarUn2aqg0/ve5QgL6Eijlepu2CsXGXx5IhcHIdQe458iTZ
   IZJjKcxVpsmb0N28fAJPYCzeEl2/N9994BmJBw79aLH4Ig6/7hhWgLB08
   KWYnsoPCpbUCjY32fqRwQGnWm1x//JWT8GGAlZBW0/DkXcmr+Zr2ERlDH
   w==;
X-CSE-ConnectionGUID: IA7CVRFwRQ6IIG/fzxG4sQ==
X-CSE-MsgGUID: JgY/uaYNQsOkfBczoaGVgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27102379"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="27102379"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 23:40:14 -0700
X-CSE-ConnectionGUID: j25NWx8hS6GtZnxJJ/Z/UQ==
X-CSE-MsgGUID: p6/cW7vCSMW49szzklmGNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="65045346"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jun 2024 23:40:09 -0700
Message-ID: <f427b28c-420b-4174-a670-70f626f8061e@linux.intel.com>
Date: Wed, 19 Jun 2024 09:40:07 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: dw: Document compatible
 thead,th1520-i2c
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Drew Fustini <dfustini@tenstorrent.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <20240618-i2c-th1520-v3-1-3042590a16b1@bootlin.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240618-i2c-th1520-v3-1-3042590a16b1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 6/18/24 10:42 AM, Thomas Bonnefille wrote:
> Add documentation for compatible string thead,th1520-i2c which can be
> used specifically for the TH1520 SoC.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> index d9293c57f573..60035a787e5c 100644
> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> @@ -33,6 +33,10 @@ properties:
>             - const: snps,designware-i2c
>         - description: Baikal-T1 SoC System I2C controller
>           const: baikal,bt1-sys-i2c
> +      - description: T-HEAD TH1520 SoCs I2C controller
> +        items:
> +          - const: thead,th1520-i2c
> +          - const: snps,designware-i2c
>   

Your comment below makes me thinking is this change needed? So is it 
enough to specify "snps,designware-i2c" for the compatible string in 
patch 2/3?

"It appears that the TH1520 I2C is already supported in the upstream 
kernel through the Synopsis Designware I2C adapter driver."

