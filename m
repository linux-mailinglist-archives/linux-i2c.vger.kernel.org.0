Return-Path: <linux-i2c+bounces-6446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDB09724AB
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 23:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80A36284F78
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 21:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3061518C357;
	Mon,  9 Sep 2024 21:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyuTvvlo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0568F5A;
	Mon,  9 Sep 2024 21:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725918770; cv=none; b=Ayrt5/1Yx5Gzrh2fuUIrC0pbAtnXf4jT/x7qrKnPKcVje20W13uKZvLqckMuyZyJhGbwJpLngFnfTDFADNQgZ1/ARPLv6uZN6GPILzytyWTcPRE+aREJoKoch+0syyAF9We//bFFM5hfynsj7MnJBWWFFX27Shs50PjowVXsKVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725918770; c=relaxed/simple;
	bh=HltJcUTE/AqOiKRfrYd6gxhKZl+ye791l8n1Atn1KrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEw53rEyfgyTjKX76bR4NWZDxiGQBECEWBjkwvzVyY4KBp3y4KkuDMfJKNXkljsLKGdIT6nbg5p01juvTiLRE9hqSB0bfH0r36CEi8xTRs7i/N31JVHsclxpPtaNy9bKStb2ivnFXqVV6kanXKyxFaNg4n0kWrEzRgv0HUS9UDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyuTvvlo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9699BC4CEC5;
	Mon,  9 Sep 2024 21:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725918769;
	bh=HltJcUTE/AqOiKRfrYd6gxhKZl+ye791l8n1Atn1KrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NyuTvvloTD8fhTtbNxsAyLa7QSAj/CvmTT7arIam6EDLMC6+IIzrEM7VIWJeVimO0
	 6VZ6E+mn4gXNVTJ/CdRjASvSfyxhByHrAPhBJhjAt4eIqBr5GyAX/y7cmzLg8xcNQA
	 SkfRA1/qz5cKnFfQQWIX8bgr0V3JTxmZ0txFrKATiYKbTn5eDPSYPS7RZfIjXrEzi4
	 rgQCFBD7ugXezcufGP0wZu7outPRzAS3jV7HJLnJwT/1Q0PF618+XV2l6jxDOGmfZw
	 gwERt8NI5NdlU/7sfkspnX/kn/eMFC3YZR6Hn5K18zdE1/zVPuU7NbDJd8xvep0pbI
	 J+4MThKBzjuDg==
Date: Mon, 9 Sep 2024 23:52:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-sprd: convert to YAML
Message-ID: <rynxxxv2vkdvblcuepk6im5l7xi2cnz3wo7bq7cab7juzwmy5t@7cj3jvma2wse>
References: <Zr3qdNep9BCb7Knc@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr3qdNep9BCb7Knc@standask-GA-A55M-S2HP>

Hi Stanislav,

On Thu, Aug 15, 2024 at 01:45:56PM GMT, Stanislav Jakubek wrote:
> Convert the Spreadtrum SC9860 I2C controller bindings to DT schema.
> Adjust filename to match compatible.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

merged to i2c/i2c-host.

Thanks,
Andi

