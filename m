Return-Path: <linux-i2c+bounces-1907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5280985F113
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 06:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0893F1F22811
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 05:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EE910942;
	Thu, 22 Feb 2024 05:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCRbQQ4/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCB579FE;
	Thu, 22 Feb 2024 05:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708580761; cv=none; b=C5Nx3gPCB4JeNHfth1wvhjZRrJw0+PIx7km23/t7kkC4greAs5qbRLOeR7a9K45wzaHzgZsbmu1NXxNFZCtuGZjdZ9SA+cKsEuNbDl53AGppgQjgOr4NIqdnrV80nGzMM1sSyHX45eENI6sjAamg2NWpPq/14Vq2Ju96UqrBr+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708580761; c=relaxed/simple;
	bh=s9nvj9SyHoAAY73LfKUC1O7tFQKS5lnB4BZJjMG2fkk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=QUCvX+rD93KcNAyzUiof31LA8Js0HuLRo3BzozEUdFS8Qk2PoWmKe6RUdWPqrIdKga8bFVU/g6XFOpz6qRtKzPIue+270Jo35m79DWngU3alUvk+nAqH25LubNLRephTtd6uhXtvjozvSJMQHJ6XLOsMqxeOOiDXI988pR81eYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCRbQQ4/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8E4C433C7;
	Thu, 22 Feb 2024 05:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708580760;
	bh=s9nvj9SyHoAAY73LfKUC1O7tFQKS5lnB4BZJjMG2fkk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PCRbQQ4/29bwjeByMu/+Ru2yq0E1ed+OAQ9mesWlkjLmV6An/+ru2j6qUxzGh/I5K
	 SJ5HaRa28o7R6STEWU2LuymHOgniRPb/DuTEb28eSOqF8wKFlkvr2TMOfYCUeuQdDr
	 crxG5OAtmCjfCPwxee9KRZDYeJ2jzRnYVDFZnY6tsqRgzHlMl3qzP5UKkRZ7bmTwH6
	 iaNBHKzxSAu7pwS/AO5/kLnoDqf9l+NHr0pMDqAe5rsfJSaSbw/Yz6pN+KDCQ0JINi
	 tOAvpyW6ucNKykprmrjGexChOgf4LJwBK3SvUl6doE41dpVWuf4UpIvV7QWYlFbPbA
	 TLXHRRd2URdvQ==
Message-ID: <1427dc71e34e178374f1afee3085c4c6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240215220759.976998-2-eajames@linux.ibm.com>
References: <20240215220759.976998-1-eajames@linux.ibm.com> <20240215220759.976998-2-eajames@linux.ibm.com>
Subject: Re: [PATCH 01/33] dt-bindings: clock: ast2600: Add FSI clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au, jk@ozlabs.org, mturquette@baylibre.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Date: Wed, 21 Feb 2024 21:45:58 -0800
User-Agent: alot/0.10

Quoting Eddie James (2024-02-15 14:07:27)
> Add a definition for the FSI clock.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---

Applied to clk-next

