Return-Path: <linux-i2c+bounces-14614-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8539ACC587F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 00:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C24F302ABB7
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 23:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B49D340A6B;
	Tue, 16 Dec 2025 23:53:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D785D2AEF5;
	Tue, 16 Dec 2025 23:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765929202; cv=none; b=Me4NqsWUo0L1g7h0RvCURhhlEKMWsk9EOrjEJGxcizBVeEi09Gk4Tf40ZpPAgjYBjKSe+Bgb86kohiVxQuQ7audjnAKV4fknwXAbeCbrY5B289SndUHn4I5KQk8eyFUWaiTPrVzksjSJptFan4uVxklTPpvHhQ6LftBnqgRNwEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765929202; c=relaxed/simple;
	bh=4R5pP+9fNQ621zzG/hIpJ2sC2WnkVrGLlokwDyF6LWM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=ocW8sMFCqVemjrIdun5o0uJN+sYp0BWUqT9DiDj6nBcgdBNFYnWTDpLsXIxDZktMd6ML4joQ1HoYSICRqCNBnsGjw11jBtdUYQdPT1EMHLJfCnHwKO3USyNWOQDhi/xjvMwxIJgrzZlkC/j9VeZ9IaLJt80dSC9xztD1Dluc+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 189D966;
	Wed, 17 Dec 2025 00:44:22 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 00:44:21 +0100
Message-Id: <DF01GRNQ41ZQ.JP9UG9WD02QL@kernel.org>
Subject: Re: [PATCH v2 03/19] dt-bindings: arm: AT91: relicense to dual
 GPL-2.0/BSD-2-Clause
Cc: <luka.perkov@sartura.hr>
From: "Michael Walle" <mwalle@kernel.org>
To: "Robert Marko" <robert.marko@sartura.hr>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <Steen.Hegelund@microchip.com>, <daniel.machon@microchip.com>,
 <UNGLinuxDriver@microchip.com>, <herbert@gondor.apana.org.au>,
 <davem@davemloft.net>, <vkoul@kernel.org>, <linux@roeck-us.net>,
 <andi.shyti@kernel.org>, <lee@kernel.org>, <andrew+netdev@lunn.ch>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <linusw@kernel.org>, <olivia@selenic.com>, <radu_nicolae.pirea@upb.ro>,
 <richard.genoud@bootlin.com>, <gregkh@linuxfoundation.org>,
 <jirislaby@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <richardcochran@gmail.com>, <wsa+renesas@sang-engineering.com>,
 <romain.sioen@microchip.com>, <Ryan.Wanner@microchip.com>,
 <lars.povlsen@microchip.com>, <tudor.ambarus@linaro.org>,
 <charan.pedumuru@microchip.com>, <kavyasree.kotagiri@microchip.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-3-robert.marko@sartura.hr>
In-Reply-To: <20251215163820.1584926-3-robert.marko@sartura.hr>

On Mon Dec 15, 2025 at 5:35 PM CET, Robert Marko wrote:
> As it is preferred to have bindings dual licensed, lets relicense the AT9=
1
> bindings from GPL-2.0 only to GPL-2.0/BSD-2 Clause.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Michael Walle <mwalle@kernel.org>

-michael

