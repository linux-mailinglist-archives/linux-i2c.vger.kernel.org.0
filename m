Return-Path: <linux-i2c+bounces-2269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C5875AF1
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 00:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD29B1F220C6
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 23:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5BA3D965;
	Thu,  7 Mar 2024 23:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JN1p0PXz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB9C3D3BB;
	Thu,  7 Mar 2024 23:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709853103; cv=none; b=rcIPa++EaQjTIfcMYSn+ragSCXXjk+WY2T+bb9w0nNpq4giWZlVLVriL8KkQlpGBj0S4Tl7mZI7BrMRQMytRCg44gdF5pb/m8bbgePxUlRfdidVTerqUIONqJRVVdFWU+fOJMX0EtlhF5B9NfXDwc+y3/nfPC5BXwoU5NxQ2GzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709853103; c=relaxed/simple;
	bh=/3xg6c5tBbgLm/CV69iT4AGY39Oat0wl47XICYP0lKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cu8eOre/N52RQ4yFhfNS87YiZg5Ld+yDwPv5EQ7xfsVGmMhKq1y1G/fUU1sKVGqwaoQCiirUi8YPmLXlC37aeoh7hJRrAAKw4XJ2wCpgfvRTypRdfCP70CdjUtE+Yw2MxOt0XS3kjNZEQdQfoPoD5D3wcSWLaYNiWXT0RnjSX20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JN1p0PXz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58407C43399;
	Thu,  7 Mar 2024 23:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709853102;
	bh=/3xg6c5tBbgLm/CV69iT4AGY39Oat0wl47XICYP0lKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JN1p0PXz7HxXvyv4eTQqZhKkrYcUsfRUrsQdHr60bmGR/wyluCrSyKZPiAdtS/goQ
	 3hhYV0nmhgx8Z2QBdWuZQIOIAH6+M4NLi/e2JK1xwHD3WuLvA/eQFz1TkQZTbN/iLV
	 lLuEE+kwGiNNq9Co94Xqz5XgwrU7B+pLRDkpNlI3TcnILVOk1Y5vWGk3f7hxmvuoWB
	 9BASwX+XPZKPKFowmuG5449oimkx8PJD1rkIelJ/m24Bisvixvy8cCSC8NULOP8YR3
	 kP/rqnsSVSKcIq4QZGXJBXIazoLrwpyS/qcaWnnF1+fXrEX+OajmNdCeJOdfZ18kEA
	 dgaCJ2Hher/ng==
Date: Fri, 8 Mar 2024 00:11:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 09/11] i2c: nomadik: sort includes
Message-ID: <itm5ltmi3sosvidehfcudx2fzojl65xantdpzvtj3tnwjqfjpj@inojkzdzi4is>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-9-605f866aa4ec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240306-mbly-i2c-v3-9-605f866aa4ec@bootlin.com>

Hi Theo,

On Wed, Mar 06, 2024 at 06:59:29PM +0100, Théo Lebrun wrote:
> Sort #include statements in i2c-nomadik driver.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

