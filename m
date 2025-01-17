Return-Path: <linux-i2c+bounces-9128-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D390EA14EE2
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jan 2025 12:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474803A79BF
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jan 2025 11:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8099F1FECA6;
	Fri, 17 Jan 2025 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lSTkrBsz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C7B1F790F;
	Fri, 17 Jan 2025 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737115071; cv=none; b=oCR1mMvn8ZAdtIMIjln9oxW5FodnrGhK0vSn3o81ewTkwNmMvpQa8lba3eFsjmlUaEMRC5QDI4rXyCz9pZXKzWlKXR3mPif8SKWBjbDLY5BtHzpA9Uno8Nh6cz0IsvAr15pHXMivn7juV77gduyM1XYApHeg+5yCokRf2NLCH+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737115071; c=relaxed/simple;
	bh=3G+I0NpOc7Vq8/1XyMl4/GWd+eFIx8HPniSxRr+hYYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hp2b+ZQBLpt6BFLdGwZ0YTFIUlEbta8hLWdQgHxNh9aJBULxedztXYPccWSnH56BNYV7dDaP5R7NGFXZeJQkZCDWzP2TFb3HJfFPtRNDJq+FkxBOH+vaS5koNEK1kxnO4d/Mky59gpR52A8MJ+1EvBgwB/jhaKSuYvIX/PBYm6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lSTkrBsz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A6CC4CEDD;
	Fri, 17 Jan 2025 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737115070;
	bh=3G+I0NpOc7Vq8/1XyMl4/GWd+eFIx8HPniSxRr+hYYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSTkrBszTXecpZduCezA+UwN3IfQLYPM7G0MsMFKAaUg5cYeHvwQ8E3pQ8Z2m0fCd
	 OjopyfB47AQKgiswvZA+RZ/cFYWELhHOrJpiM0K4G1kcr09shciWDv9UJ5TzUdt7bW
	 rCacWUEod4/ojOV9WUmMKOc0S2pbfX4uG+6iL8I0=
Date: Fri, 17 Jan 2025 12:57:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 9/9] misc: add FPC202 dual port controller driver
Message-ID: <2025011717-putt-scarring-14f0@gregkh>
References: <20250115-fpc202-v6-0-d47a34820753@bootlin.com>
 <20250115-fpc202-v6-9-d47a34820753@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-fpc202-v6-9-d47a34820753@bootlin.com>

On Wed, Jan 15, 2025 at 10:25:46AM +0100, Romain Gantois wrote:
> +	dev_info(&client->dev, "%s FPC202 Dual Port controller found\n", client->name);

When drivers work properly, they are quiet.  Please remove this.  Also,
the dev ponter should already have the name in it, right?

thanks,

greg k-h

