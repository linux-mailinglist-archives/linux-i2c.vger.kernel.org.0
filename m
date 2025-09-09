Return-Path: <linux-i2c+bounces-12794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA319B4A351
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 09:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5848B16E28B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 07:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CDD256C76;
	Tue,  9 Sep 2025 07:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsnBOfzH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255621BDCF;
	Tue,  9 Sep 2025 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757402291; cv=none; b=iMtJNmMD0ACjgzAvDKPyQAn1tLGjtAGW2rCkVYMQQYuyv/aA1fwqcN+yc6goEiNME9HE3ingq72x1vM7zgn/mmln/P/pw/at8e0uu0CmUo7GhDBpZE9V3svJTqn0E1wvxQZWSDtSdUWBYgxlyP3fa6BnMC5oaWZiN9JiTLdU9F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757402291; c=relaxed/simple;
	bh=eoG0JvxQp/KV0F0KtC0hcRUu86Whu+2DoUruzb6EW50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMmLYBL1emdb5UHxAQDfykBQPljUtBTs4u6fd/BYGj1bZGj4g8V9OSWuRItm4U1IHvAYrSz8PprrznU04GSiO/95xeZ5JbqJ9M0/fCqXNq/UFIi+d5kY8hcGOy+MeDObppiNYwuurTsZhud2jDPr0iiqeSiBaRxkbPQg3NEW7a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qsnBOfzH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB84C4CEF4;
	Tue,  9 Sep 2025 07:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757402290;
	bh=eoG0JvxQp/KV0F0KtC0hcRUu86Whu+2DoUruzb6EW50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsnBOfzHqqyo/mfM/vPx5i2NCelOlLzFkiRfORokrOnVNXhbOdDchOM4jSkFmenph
	 1IRcb10DaTszVCHuDL/wI5znKTXQnCZzMYOjnwJdFt9ta3c5VnxrfSFV6fseExHYbE
	 Hh2JFaz/egM42Xbsw7h8/omrZuTaWQgvwJMwLQUuZ6HXBEe7filTIEDaVB2gYClzyA
	 KZHf1xz9X1TXmf9Sy8Jo+N9oI282nNUcWYdT+cv8cpVHkc+y9cKAcAtjcmmHSQxeiN
	 gNBPfvnH7IP1dcxZZOac6OqQa5d20dw5fD6ER9Ua48eJus8HyGm7rq9j1i9pq4T6Ik
	 O8N/0A0L/4XAQ==
Date: Tue, 9 Sep 2025 09:18:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: serial: samsung: Add Exynos990 UART
 compatible
Message-ID: <20250909-sophisticated-urban-goshawk-fc11fb@kuoka>
References: <20250907-perics-add-usinodes-v2-0-58f41796d2d3@gmail.com>
 <20250907-perics-add-usinodes-v2-5-58f41796d2d3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250907-perics-add-usinodes-v2-5-58f41796d2d3@gmail.com>

On Sun, Sep 07, 2025 at 10:13:36PM +0000, Denzeel Oliva wrote:
> Add samsung,exynos990-uart compatible string to the Samsung UART bindings.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


