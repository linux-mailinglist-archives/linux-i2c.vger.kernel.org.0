Return-Path: <linux-i2c+bounces-8936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 939F0A03765
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 06:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 225A11882F93
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 05:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4AA15749C;
	Tue,  7 Jan 2025 05:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="PoNvvGRb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23F2647;
	Tue,  7 Jan 2025 05:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736228220; cv=none; b=cNtYJfSUt4dcN+CNJulbvJCxMd5VTExQjxkbb2a3y7q44SkcIgWrJgOOEYaF1HGWARA3k44/geG3hIDl0lZM33hdywlTmSDHNaBcR3jfSFZ/tB5YBxQ4VUthyuuj/lFlHWa4nfMv41JM30Z1VdGo+jW82LC1V3smkr9PDJStd2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736228220; c=relaxed/simple;
	bh=LS6g789aLB8ApLS1q1d05BR3y23KGQ689leRV5Vb9so=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MHB4j2DGsrTP9JeiculLP+EeLY5PG7dbmn6qWn8VhmMbLc1NdjsOUrRE66f1aC2Cvyz+IbdEVm6qL64WopmsLk9KTwmrhV2kaY1iCe1ZVXFeswrJrOzk2LaBB7q1UQL4bp6IIfTzqsPbJ09CwCtoyHQQudixP/E5DBDCclYiFjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=PoNvvGRb; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736228214;
	bh=LS6g789aLB8ApLS1q1d05BR3y23KGQ689leRV5Vb9so=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PoNvvGRbsBte9//EfiRckwJTLJc5iTLakSR0TjCowl4xcFJx+B2MlUYLh8DgWVtA9
	 +nWw/DQDe7EtDtE37FLAiPSeI4fa0SATvGfh1Ps5BsWQAyWsOJJU+S/mVz3V9hI60x
	 TMmHI1HPeR9WKrjsvxg/82JHRUuDjhPeZG+HK/MF2CN/8NwPL4wqXsb9mkVTYcdcHl
	 kjzRDP1rwSXXWy7NFuXmRh/drKGVuefB27i8I8UwFr6GByaa9NNbqWQYe+jk0wFVdG
	 3lcu7WHBcxbgtzX5jnClTJRf6HRivENtNqB13pbkst5RcvHKTldRrOddKmrRIXUhFQ
	 2JpeLCpYBQBFw==
Received: from [10.200.97.88] (203-173-1-122.dyn.iinet.net.au [203.173.1.122])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C87FE706BE;
	Tue,  7 Jan 2025 13:36:47 +0800 (AWST)
Message-ID: <0b592466305793dfa788daced6368dc4c9e3852c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 4/4] ARM: dts: aspeed: system1: Use crps PSU driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net, joel@jms.id.au, 
 Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
 peteryin.openbmc@gmail.com,  noahwang.wang@outlook.com,
 naresh.solanki@9elements.com, lukas@wunner.de,  jbrunet@baylibre.com,
 patrick.rudolph@9elements.com, gregkh@linuxfoundation.org, 
 peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Date: Tue, 07 Jan 2025 16:06:46 +1030
In-Reply-To: <d3de9f99-1cc2-491e-8dac-1a5d243e17f0@roeck-us.net>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
	 <20241217173537.192331-5-ninad@linux.ibm.com>
	 <d3de9f99-1cc2-491e-8dac-1a5d243e17f0@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-12-18 at 07:16 -0800, Guenter Roeck wrote:
> On Tue, Dec 17, 2024 at 11:35:35AM -0600, Ninad Palsule wrote:
> > The system1 uses Intel common redundant (crps185) power supplies so
> > move
> > to correct new crps driver.
> >=20
> > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>=20
> This patch will need to be applied through an arm tree.

I'll take it through the BMC tree.

Thanks,

Andrew

