Return-Path: <linux-i2c+bounces-9771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35490A5B5A1
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 02:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71A4516D385
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 01:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAA21DE4DB;
	Tue, 11 Mar 2025 01:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5MrgNZV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740154207F;
	Tue, 11 Mar 2025 01:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741655528; cv=none; b=hJagCgYaJJm0cTbYH1NYARhIDsQgeL/9E1kNNXH1CWPLefSNNE05RzBkzkRSB6Etx/CL8eRBTw3M12FDpKF/OdGdqq394abCZiO1MfLnswS7BD43YV4+UovTdUz28JoK6hhT6b6gqtC/ZYVMq9F+bMKJcJ5/UP/DiHooz1APPH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741655528; c=relaxed/simple;
	bh=sA3uuPl/teMtJ6q0xGdImhvwtK/2w9QzGAf/f3PMDiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUya9NVhg5SIpkLHoHyp4diBLAwERVG1j6aoDdBp3LqaxNEckek3yzUIMD0gizrMG8nkbtlW3Kqq2HwWMpqTlxIjOnasif5tKEMAWqKUS4NaTxQWMhKgH5IGxLWT72PJy8MwShUuSdiZ1U/uTsuE1JkFgUzxaFRwS34G+7wkfbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5MrgNZV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC75C4CEEB;
	Tue, 11 Mar 2025 01:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741655527;
	bh=sA3uuPl/teMtJ6q0xGdImhvwtK/2w9QzGAf/f3PMDiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5MrgNZV2LPXCnE6+ZN5NRLph4KTVqWX85H0TzapP/p03/z4O/Pw3XwFa7E10pLOb
	 M42fJfco2LUzTMsaGvgiNUi3LLdXkoKFRVN+62iVlMJalY5Cw4M9ACDSbIKU317QnL
	 YBDi2v3EW4+/rSbWS9an41aonnqKC9mlog2wU+VWBwX5T+72KLCYJA+Vpnu8SgR15w
	 AGm4BrTPiCXS2L4NFsriCVIiEC7+Qtb6FnOzBKDCbI6oH4Qtl4UWdjgJq62jMnLrxx
	 yafYTngLtgH6SEudFho423mNzWuw/IQbA103CKnBA+tMZJH4p49FCmXlF3Ptu/v1FN
	 hzelfFRSgDRzw==
Date: Tue, 11 Mar 2025 02:12:03 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 00/10] i2c: busses: Introduce and use
 i2c_10bit_addr_*_from_msg()
Message-ID: <c6xszdhx5ztexlqlmhvdn4dyz5ilzxsm7c62cvkmnwy2y3gaqc@owk2ani2emys>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

> Andy Shevchenko (10):
>   i2c: Introduce i2c_10bit_addr_*_from_msg() helpers
>   i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers
>   i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers
>   i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers

merged to i2c/i2c-host.

Thanks,
Andi

