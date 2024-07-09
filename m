Return-Path: <linux-i2c+bounces-4801-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CBB92C59A
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 23:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30AB61C22BCC
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 21:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC3A185625;
	Tue,  9 Jul 2024 21:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYTWrZ/i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809681B86D4;
	Tue,  9 Jul 2024 21:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720561354; cv=none; b=gvCgR69rub8or8F1r2323qcfR01yxJib6d1ywmp8vG0OlJVX+GboQjuPLYF6cdMhKxMEcYywer5X8KMKncZaeZeus8w0cRoGFFZimcXbBURxoPxLHQrEzDiAZZ6zvQwjo5uOvmg5vqUYYcvhouVRv2zjXRTr8GyoRxJqDpjJt3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720561354; c=relaxed/simple;
	bh=4y+u8QCjLbyxrdA7dU4qxf6989325Mqo3KAHngjVpX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDJkjFjoOT2f5H7XJQIP2eQwlNXDcwMJTmqtvOAyrUdtm/LuWL+ugBfFGuT4R7pWEK7KKyP3cCr732KBZJEM64eiT8zMzidfpRhJALYSwZWlFIIOpgncXAU1iOfZ7yaot7bHSaeXmsuZEeJixxnDr8Wcd5toWw5RLrk6mJ4ysB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYTWrZ/i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDE7C3277B;
	Tue,  9 Jul 2024 21:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720561354;
	bh=4y+u8QCjLbyxrdA7dU4qxf6989325Mqo3KAHngjVpX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYTWrZ/i/1yKjJzl7IyJOu9AVf5GPrN0eXjBBmCFVEOhGFXeKjb6OByML8fNzhUAe
	 a8fye4Z4AemXFXUzmUsfTPb8RAgq1q5SrB3W6Nn4qiCtiaeoD7L4kMUwvPfMrLowJQ
	 CmwNTR1KgTxXndy8wXj8uxtecE4ZftERGiDuZdJUAYq6YBEanC/FINzG7/fs0VGpI9
	 gLjQdOqxnZUCdnBmq3Bv9Saw4WvhU2YpEugJTWF3BZoBBSwqNkHkXJDcE7mfZm2w0W
	 Ut892CrT4LO9fhTBrM/OMZiXobxbdvlWsLp3mpCqIhKxaTnsx+hhhJv+NdJf+NQVXu
	 w3wI9ipVK1zcg==
Date: Tue, 9 Jul 2024 23:42:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: gpio: Add 'settle-time-us'
 property
Message-ID: <6knnhpymug6qshunynoqg3ljwaamt6bbnak5k6vvblfmzs6csl@2vo4q6t2kxjc>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
 <20240617120818.81237-2-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617120818.81237-2-bastien.curutchet@bootlin.com>

Hi,

On Mon, Jun 17, 2024 at 02:08:16PM GMT, Bastien Curutchet wrote:
> I2C MUXes described by the i2c-gpio-mux sometimes need a significant
> amount of time to switch from a bus to another. When a new bus is
> selected, the first I2C transfer can fail if it occurs too early. There
> is no way to describe this transition delay that has to be waited before
> starting the first I2C transfer.
> 
> Add a 'settle-time-us' property that indicates the delay to be
> respected before doing the first i2c transfer.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

