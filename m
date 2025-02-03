Return-Path: <linux-i2c+bounces-9279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A51A26741
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 23:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 208897A2E9C
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 22:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41593211474;
	Mon,  3 Feb 2025 22:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTeOxERb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AED211269;
	Mon,  3 Feb 2025 22:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623578; cv=none; b=f9ocA32nRc0bYGBsZH+0DQl6fH8XijgUG3ZQ4HQm5a2/RXzWAAegnK3uAh3V/SjawyIWGnYOjCUUikKWGodEnRANTUCZRVgB84F32fG9VFlxX646De+RwFwO9//zpG++nXEwqB/q/ezIyKDr1wdtj7AOqmDcy/X4PvvU8t+Ukk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623578; c=relaxed/simple;
	bh=g/ZpLB90eEOtSKmAoZjBPulwgV8zka0al3gfWNHs9n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGTc73Uu0QERVGrgJpvdmYEkYJAxfBZKkL9B2g2JfmLRm34t0C3ZWmlYRWGfu44fhLu9QClJbNlMD3zGJfNHt8w1/BkwTz09yDL9vxT7dlE1R0TpsSqTHFf1Bv1/k3l6yyORHqa1XZqxlZJHbISQ5eH1O6KnUS+f5WAXsQOLGik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTeOxERb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C83C4CEE0;
	Mon,  3 Feb 2025 22:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623577;
	bh=g/ZpLB90eEOtSKmAoZjBPulwgV8zka0al3gfWNHs9n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTeOxERbmFkaL7RFQMUtdWRsZR6lVYCGgTWdYXsuXmQ3DlUF70Bf33zf5vWoZ+uzh
	 nM7vQ4OwORmXeU7RCjSalG2kMcGP96FNOGfnqBK8OyrsCJM1pdru8ETJ9anM0k9uXL
	 PbXXMoh/m+BkBSITiRdJ6E+GLUNEk+UneVn45BFyEuKRO5XGe6X5ZQjFuFDlPK0MdX
	 Nk1GtETvQwtwZ1SPzK/0CRLBCjb/IElDP5Qb1G9Zeq5kpU/dW3PHfMt7Mq4rY54U1w
	 tvRhiuNwMT7qYl/8HgyUeCPY977YZGH5GBDVknkAdU+21RV5eXFdo+awxvQFHzw5Em
	 cLpA4rg6RqLsA==
Date: Mon, 3 Feb 2025 16:59:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: conor+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org,
	linux-kernel@vger.kernel.org, konradybcio@kernel.org,
	krzk+dt@kernel.org, brgl@bgdev.pl, linux@mainlining.org
Subject: Re: [PATCH 3/4] dt-bindings: eeprom: at24: Add compatible for
 Giantec GT24P128E
Message-ID: <173862357520.500395.299611236712032118.robh@kernel.org>
References: <20250203111429.22062-1-danila@jiaxyga.com>
 <20250203111429.22062-4-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203111429.22062-4-danila@jiaxyga.com>


On Mon, 03 Feb 2025 14:14:28 +0300, Danila Tikhonov wrote:
> Add the compatible for another 128Kb EEPROM from Giantec.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


