Return-Path: <linux-i2c+bounces-470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 849A67F97E7
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 04:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A89701C2042E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 03:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061CB20FA;
	Mon, 27 Nov 2023 03:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="QeUDGbRT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8B58F;
	Sun, 26 Nov 2023 19:23:10 -0800 (PST)
Received: from [192.168.68.112] (203-57-215-234.dyn.iinet.net.au [203.57.215.234])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3F42420034;
	Mon, 27 Nov 2023 11:23:03 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1701055389;
	bh=9Y12ePRBana+i/gp2nHJOJIJGp9W0wzK4lhnfvk1osk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QeUDGbRTji2Gnka1aFgPpDEsTHMgv+RMDklc/gnUyAB9B7iQSECEO8gXh86pHjY4J
	 AfiJiL2NOQkhNadiNRGUDddM8KE4ZMHbL5T/UhCHVkvAh8+YDD2FgxqwTIQ754eC6u
	 md8lNPOvD9ESdCnjghP2r1fbRSmqbVM+IiAkMIzdH1dsCXQ0mUO3orgANJn/J56mwY
	 EnPI9fxcJjtdnZ9Z+PfCln+Pn1UKoliuUfc3H3rr/B+OPdbm4FWoeIAF5T+L0XkQE/
	 pIuv2PdAR/RhHi2T9BwY8veXjgnk0XdCnUYT5yDw6sOztKfah6j3Epl43+XlYIuP8b
	 /inBS/5tzDIcQ==
Message-ID: <fdd884426497486c6b17795b4edc66243bdc7350.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in
 SLAVE_READ_PROCESSED
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, brendan.higgins@linux.dev, 
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
	linux@roeck-us.net, wsa@kernel.org, jae.hyun.yoo@linux.intel.com
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, cosmo.chou@quantatw.com
Date: Mon, 27 Nov 2023 13:53:02 +1030
In-Reply-To: <20231120091746.2866232-1-chou.cosmo@gmail.com>
References: <20231120091746.2866232-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-11-20 at 17:17 +0800, Cosmo Chou wrote:
> commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early
> in interrupt handler") moved most interrupt acknowledgments to the
> start of the interrupt handler to avoid race conditions. However,
> slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSED
> is handled.
>=20
> Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fix
> the problem that the next byte is not sent correctly.

What does this mean in practice? Can you provide more details? It
sounds like you've seen concrete problems and it would be nice to
capture what it was that occurred.

Andrew

