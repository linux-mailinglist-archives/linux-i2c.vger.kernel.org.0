Return-Path: <linux-i2c+bounces-742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3280E37F
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 06:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC6C282DA0
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 05:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0239E57E;
	Tue, 12 Dec 2023 05:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="lgoJA7Pm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86980BF;
	Mon, 11 Dec 2023 21:02:17 -0800 (PST)
Received: from [192.168.68.112] (ppp118-210-187-191.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.191])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2CE0A20174;
	Tue, 12 Dec 2023 13:02:10 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1702357334;
	bh=0JEzWpk4MDY+4Qk2dR6y4bAMD86j0zFUEcjMhDT332Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lgoJA7PmVBvR5AKglnaYAriJaabfIuzhglD3ToN4ObIUrKizYa2IYtQIVYhl7kuwH
	 RdjqjlDjLTr4+glfyW/g1DbmQY8HjjE7tSq92XW0ieGsYz618SZHefj3jwd14qq7Tw
	 adtG4cvXeJKo6rdiBv1O1xq6JiM8VKkSJRFxtq7nkUk/bx7ej/dV1gFnyl9zqzTEKL
	 NMOihBAHpihBg/+7Umfre73a4+lkiHnP3uVw1A+bshV37EuhapBZpTQw17npLf3dS+
	 /7wsS02MyVjpQAZWH+i104dTJp3hDl4JzsuP/xhBlUM9QH5qAsZdXKq3QE655ymHBx
	 E4CIH3aX7Aw1g==
Message-ID: <c11d2365e67299dcc5ff7319a1856dbaa985d61e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 0/2] i2c: aspeed: Late ack Tx done irqs and handle
 coalesced start with stop conditions
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, Quan Nguyen <quan@os.amperecomputing.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram
 Sang <wsa@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Guenter
 Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org, Cosmo Chou
 <chou.cosmo@gmail.com>, Open Source Submission
 <patches@amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Date: Tue, 12 Dec 2023 15:32:09 +1030
In-Reply-To: <CACPK8Xc6-M9fsx3AUPobzvG6sjCrr8Sj5B3Q4Onp5wGvMm_BrA@mail.gmail.com>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
	 <CACPK8Xc6-M9fsx3AUPobzvG6sjCrr8Sj5B3Q4Onp5wGvMm_BrA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2023-12-12 at 13:09 +1030, Joel Stanley wrote:
> On Mon, 11 Dec 2023 at 20:52, Quan Nguyen <quan@os.amperecomputing.com> w=
rote:
> >=20
> > This series consists of two patches to handle the below issues observed
> > when testing with slave mode:
> >   + The coalesced stop condition with the start conditions
> >   + Early ack'ed of Tx done (ACK and NAK) causing "Unexpected Ack on
> >   read request".
>=20
> Looks good. I've reached out to a few people who use slave mode to ask
> for review and testing on hardware. As long as they don't come back
> with issues, we should get this merged and backported to stable.
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>

I've dropped a build with the patches onto an AST2600 EVB and lightly
exercised the affected paths using NVMe-MI over MCTP to a Micron 7450.

Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Andrew


